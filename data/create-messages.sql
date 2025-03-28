CREATE TABLE IF NOT EXISTS public.messages (
  message_id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  recipient_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  sent_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  conversation_id INTEGER,  -- optional: useful for grouping messages in a conversation
  FOREIGN KEY (sender_id) REFERENCES public.user_profiles (user_id) ON DELETE CASCADE,
  FOREIGN KEY (recipient_id) REFERENCES public.user_profiles (user_id) ON DELETE CASCADE
);
