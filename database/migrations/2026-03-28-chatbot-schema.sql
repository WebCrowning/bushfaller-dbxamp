-- Bushfaller migration: chatbot FAQ and chat history
-- Date: 2026-03-28
-- Adds tables for AI-powered chatbot system

START TRANSACTION;

-- FAQ entries managed by admin for chatbot knowledge base
CREATE TABLE IF NOT EXISTS faq (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question VARCHAR(500) NOT NULL,
  answer TEXT NOT NULL,
  category VARCHAR(100) DEFAULT 'General',
  created_by INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (created_by) REFERENCES users(id),
  FULLTEXT INDEX ft_qa (question, answer)
);

-- Chat conversations between user and chatbot/admin
CREATE TABLE IF NOT EXISTS chat_conversations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  needs_admin_help TINYINT(1) DEFAULT 0,
  assigned_admin_id INT NULL,
  status ENUM('Active','Closed','Assigned') DEFAULT 'Active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (assigned_admin_id) REFERENCES users(id)
);

-- Individual messages in chat conversations
CREATE TABLE IF NOT EXISTS chat_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  conversation_id INT NOT NULL,
  sender_id INT NULL,
  sender_type ENUM('user','ai','admin') DEFAULT 'user',
  message TEXT NOT NULL,
  is_ai_generated TINYINT(1) DEFAULT 0,
  faq_id_used INT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conversation_id) REFERENCES chat_conversations(id) ON DELETE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES users(id),
  FOREIGN KEY (faq_id_used) REFERENCES faq(id)
);

COMMIT;
