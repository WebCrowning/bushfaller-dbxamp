-- Bushfaller migration: Add role-based access control
-- Date: 2026-03-28
-- Adds role system for admins, sub-admins, and users
-- Adds user blocking/status functionality

START TRANSACTION;

-- Add role and status columns to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS role ENUM('user','sub_admin','admin') DEFAULT 'user' AFTER provider;
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_blocked TINYINT(1) DEFAULT 0 AFTER role;
ALTER TABLE users ADD COLUMN IF NOT EXISTS blocked_reason VARCHAR(255) NULL AFTER is_blocked;
ALTER TABLE users ADD COLUMN IF NOT EXISTS blocked_at TIMESTAMP NULL AFTER blocked_reason;
ALTER TABLE users ADD COLUMN IF NOT EXISTS blocked_by INT NULL AFTER blocked_at;

-- Add indexes for faster lookups
ALTER TABLE users ADD INDEX idx_role (role);
ALTER TABLE users ADD INDEX idx_is_blocked (is_blocked);
ALTER TABLE users ADD INDEX idx_blocked_by (blocked_by);

-- Add foreign key for blocked_by
ALTER TABLE users ADD CONSTRAINT fk_blocked_by 
  FOREIGN KEY (blocked_by) REFERENCES users(id) ON DELETE SET NULL;

COMMIT;
