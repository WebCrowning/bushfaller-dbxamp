-- Bushfaller migration: order hardening and immutable order item snapshots
-- Date: 2026-03-28
-- Safe to run on existing databases.

START TRANSACTION;

SET @db_name = DATABASE();

-- 1) Add immutable snapshot columns to order_items.
-- These preserve product name/image as purchased, even if product data changes later.
SELECT COUNT(*) INTO @has_name_snapshot
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = @db_name
  AND TABLE_NAME = 'order_items'
  AND COLUMN_NAME = 'product_name_snapshot';

SET @sql_add_name_snapshot = IF(
  @has_name_snapshot = 0,
  'ALTER TABLE order_items ADD COLUMN product_name_snapshot VARCHAR(190) NULL AFTER price',
  'SELECT 1'
);
PREPARE stmt_add_name_snapshot FROM @sql_add_name_snapshot;
EXECUTE stmt_add_name_snapshot;
DEALLOCATE PREPARE stmt_add_name_snapshot;

SELECT COUNT(*) INTO @has_image_snapshot
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = @db_name
  AND TABLE_NAME = 'order_items'
  AND COLUMN_NAME = 'product_image_snapshot';

SET @sql_add_image_snapshot = IF(
  @has_image_snapshot = 0,
  'ALTER TABLE order_items ADD COLUMN product_image_snapshot TEXT NULL AFTER product_name_snapshot',
  'SELECT 1'
);
PREPARE stmt_add_image_snapshot FROM @sql_add_image_snapshot;
EXECUTE stmt_add_image_snapshot;
DEALLOCATE PREPARE stmt_add_image_snapshot;

-- Backfill snapshots for historical rows where values are missing.
UPDATE order_items oi
INNER JOIN products p ON p.id = oi.product_id
SET
  oi.product_name_snapshot = COALESCE(oi.product_name_snapshot, p.name),
  oi.product_image_snapshot = COALESCE(oi.product_image_snapshot, p.image)
WHERE oi.product_name_snapshot IS NULL
   OR oi.product_image_snapshot IS NULL;

-- Enforce NOT NULL once backfill is complete.
ALTER TABLE order_items
  MODIFY COLUMN product_name_snapshot VARCHAR(190) NOT NULL,
  MODIFY COLUMN product_image_snapshot TEXT NOT NULL;

-- 2) Ensure orders.payment_id can be uniquely used (prevents payment replay reuse).
-- If duplicate payment IDs exist, this update keeps the oldest row intact and nulls later duplicates.
UPDATE orders o
INNER JOIN (
  SELECT payment_id, MIN(id) AS keep_id
  FROM orders
  WHERE payment_id IS NOT NULL
  GROUP BY payment_id
  HAVING COUNT(*) > 1
) d ON d.payment_id = o.payment_id
SET o.payment_id = NULL
WHERE o.id <> d.keep_id;

SELECT COUNT(*) INTO @has_payment_unique
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = @db_name
  AND TABLE_NAME = 'orders'
  AND INDEX_NAME = 'ux_orders_payment_id';

SET @sql_add_payment_unique = IF(
  @has_payment_unique = 0,
  'ALTER TABLE orders ADD UNIQUE INDEX ux_orders_payment_id (payment_id)',
  'SELECT 1'
);
PREPARE stmt_add_payment_unique FROM @sql_add_payment_unique;
EXECUTE stmt_add_payment_unique;
DEALLOCATE PREPARE stmt_add_payment_unique;

COMMIT;
