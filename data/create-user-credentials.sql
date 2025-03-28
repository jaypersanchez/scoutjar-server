CREATE TABLE user_credentials (
  credential_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES user_profiles(user_id) ON DELETE CASCADE,
  password_hash TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
