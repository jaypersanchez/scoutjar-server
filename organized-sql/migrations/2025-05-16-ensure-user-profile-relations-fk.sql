-- STEP 1: Find orphaned user_credentials
SELECT * FROM user_credentials
WHERE user_id NOT IN (SELECT user_id FROM user_profiles);

-- STEP 2: Optionally delete orphaned user_credentials (uncomment to execute)
-- DELETE FROM user_credentials
-- WHERE user_id NOT IN (SELECT user_id FROM user_profiles);

-- STEP 3: Find orphaned talent_profiles
SELECT * FROM talent_profiles
WHERE user_id NOT IN (SELECT user_id FROM user_profiles);

-- STEP 4: Optionally delete orphaned talent_profiles (uncomment to execute)
-- DELETE FROM talent_profiles
-- WHERE user_id NOT IN (SELECT user_id FROM user_profiles);

-- STEP 5: Find orphaned talent_recruiters
SELECT * FROM talent_recruiters
WHERE user_id NOT IN (SELECT user_id FROM user_profiles);

-- STEP 6: Optionally delete orphaned talent_recruiters (uncomment to execute)
-- DELETE FROM talent_recruiters
-- WHERE user_id NOT IN (SELECT user_id FROM user_profiles);

-- STEP 7: Add Foreign Key Constraint to user_credentials
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'user_credentials'
          AND constraint_type = 'FOREIGN KEY'
          AND constraint_name = 'fk_uc_user'
    ) THEN
        ALTER TABLE user_credentials
        ADD CONSTRAINT fk_uc_user
        FOREIGN KEY (user_id)
        REFERENCES user_profiles(user_id)
        ON DELETE CASCADE;
    END IF;
END$$;

-- STEP 8: Add Foreign Key Constraint to talent_profiles
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'talent_profiles'
          AND constraint_type = 'FOREIGN KEY'
          AND constraint_name = 'fk_tp_user'
    ) THEN
        ALTER TABLE talent_profiles
        ADD CONSTRAINT fk_tp_user
        FOREIGN KEY (user_id)
        REFERENCES user_profiles(user_id)
        ON DELETE CASCADE;
    END IF;
END$$;

-- STEP 9: Add Foreign Key Constraint to talent_recruiters
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'talent_recruiters'
          AND constraint_type = 'FOREIGN KEY'
          AND constraint_name = 'fk_tr_user'
    ) THEN
        ALTER TABLE talent_recruiters
        ADD CONSTRAINT fk_tr_user
        FOREIGN KEY (user_id)
        REFERENCES user_profiles(user_id)
        ON DELETE CASCADE;
    END IF;
END$$;

-- ✅ DONE: Your user-linked tables are now protected by ON DELETE CASCADE
