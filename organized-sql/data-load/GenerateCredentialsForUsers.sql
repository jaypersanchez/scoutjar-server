-- Ensure the pgcrypto extension is enabled for hashing
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Insert credentials for users without existing ones
INSERT INTO user_credentials (user_id, password_hash)
SELECT 
    up.user_id,
    crypt('password', gen_salt('bf'))  -- bcrypt-hashed 'password'
FROM user_profiles up
LEFT JOIN user_credentials uc ON up.user_id = uc.user_id
WHERE uc.user_id IS NULL;
