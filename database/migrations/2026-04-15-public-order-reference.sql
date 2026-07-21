-- Add secure public-facing order reference IDs.
-- Keeps numeric primary keys internal while exposing non-sequential IDs.

START TRANSACTION;

SET @db_name = DATABASE();

SELECT COUNT(*) INTO @has_public_order_id
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = @db_name
  AND TABLE_NAME = 'orders'
  AND COLUMN_NAME = 'public_order_id';

SET @sql_add_public_order_id = IF(
  @has_public_order_id = 0,
  'ALTER TABLE orders ADD COLUMN public_order_id VARCHAR(32) NULL AFTER id',
  'SELECT 1'
);
PREPARE stmt_add_public_order_id FROM @sql_add_public_order_id;
EXECUTE stmt_add_public_order_id;
DEALLOCATE PREPARE stmt_add_public_order_id;

UPDATE orders
SET public_order_id = CONCAT(
  'BF-',
  DATE_FORMAT(COALESCE(created_at, NOW()), '%Y%m%d'),
  '-',
  UPPER(LEFT(REPLACE(UUID(), '-', ''), 10))
)
WHERE public_order_id IS NULL OR public_order_id = '';

ALTER TABLE orders
  MODIFY COLUMN public_order_id VARCHAR(32) NOT NULL;

SELECT COUNT(*) INTO @has_public_order_unique
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = @db_name
  AND TABLE_NAME = 'orders'
  AND INDEX_NAME = 'uq_orders_public_order_id';

SET @sql_add_public_order_unique = IF(
  @has_public_order_unique = 0,
  'ALTER TABLE orders ADD UNIQUE INDEX uq_orders_public_order_id (public_order_id)',
  'SELECT 1'
);
PREPARE stmt_add_public_order_unique FROM @sql_add_public_order_unique;
EXECUTE stmt_add_public_order_unique;
DEALLOCATE PREPARE stmt_add_public_order_unique;

COMMIT;
