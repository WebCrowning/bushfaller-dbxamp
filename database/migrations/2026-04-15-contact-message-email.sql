-- Require capturing sender email on contact messages.

START TRANSACTION;

SET @db_name = DATABASE();

SELECT COUNT(*) INTO @has_customer_email
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = @db_name
  AND TABLE_NAME = 'messages'
  AND COLUMN_NAME = 'customer_email';

SET @sql_add_customer_email = IF(
  @has_customer_email = 0,
  'ALTER TABLE messages ADD COLUMN customer_email VARCHAR(190) NULL AFTER user_id',
  'SELECT 1'
);
PREPARE stmt_add_customer_email FROM @sql_add_customer_email;
EXECUTE stmt_add_customer_email;
DEALLOCATE PREPARE stmt_add_customer_email;

COMMIT;
