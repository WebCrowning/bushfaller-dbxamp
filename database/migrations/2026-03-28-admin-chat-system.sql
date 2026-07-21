-- Bushfaller migration: Admin Chat System
-- Date: 2026-03-28
-- Real-time WhatsApp-like chat between customers and admins

START TRANSACTION;

-- Store admin online status
CREATE TABLE IF NOT EXISTS admin_online_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL UNIQUE,
  status ENUM('online','away','offline') DEFAULT 'offline',
  last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_status (status)
);

-- Store chat conversations between customer and admin team
CREATE TABLE IF NOT EXISTS admin_chat_conversations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  assigned_admin_id INT NULL,
  status ENUM('open','taken','closed') DEFAULT 'open',
  started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  closed_at TIMESTAMP NULL,
  closed_by INT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (assigned_admin_id) REFERENCES users(id) ON DELETE SET NULL,
  FOREIGN KEY (closed_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_customer_id (customer_id),
  INDEX idx_assigned_admin_id (assigned_admin_id),
  INDEX idx_status (status),
  INDEX idx_updated_at (updated_at)
);

-- Store chat messages
CREATE TABLE IF NOT EXISTS admin_chat_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  conversation_id INT NOT NULL,
  sender_id INT NOT NULL,
  sender_type ENUM('customer','admin') NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conversation_id) REFERENCES admin_chat_conversations(id) ON DELETE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_conversation_id (conversation_id),
  INDEX idx_created_at (created_at)
);

COMMIT;
