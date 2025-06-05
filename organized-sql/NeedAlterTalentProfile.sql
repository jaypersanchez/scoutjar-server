-- Step 1: Drop views blocking the schema change
DROP VIEW IF EXISTS user_talent_view;
DROP VIEW IF EXISTS recruiter_user_view;

-- Step 2: Fix data type mismatch
ALTER TABLE talent_profiles
ALTER COLUMN work_preferences
SET DATA TYPE VARCHAR
USING work_preferences::text;

-- Step 3: Add the missing field
ALTER TABLE talent_profiles
ADD COLUMN employment_type VARCHAR;


