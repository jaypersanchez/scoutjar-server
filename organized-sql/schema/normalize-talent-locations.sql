-- Step 0: Add columns to talent_profiles if not present
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='talent_profiles' AND column_name='country'
    ) THEN
        ALTER TABLE talent_profiles ADD COLUMN country VARCHAR;
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='talent_profiles' AND column_name='country_code'
    ) THEN
        ALTER TABLE talent_profiles ADD COLUMN country_code VARCHAR;
    END IF;
END $$;

-- Step 1: Create temporary mapping table
DROP TABLE IF EXISTS location_mapping;
CREATE TEMP TABLE location_mapping (
    raw_location VARCHAR PRIMARY KEY,
    country VARCHAR,
    country_code VARCHAR
);

-- Step 2: Populate mapping table using fuzzy match against 'locations'
INSERT INTO location_mapping (raw_location, country, country_code)
SELECT DISTINCT
    tp.location AS raw_location,
    loc.country,
    loc.country_code
FROM talent_profiles tp
JOIN locations loc
    ON tp.location ILIKE '%' || loc.city || '%'
    OR tp.location ILIKE '%' || loc.region || '%'
    OR tp.location ILIKE '%' || loc.country || '%'
WHERE tp.location IS NOT NULL;

-- Step 3: Generate unmatched locations as an exception report
DROP TABLE IF EXISTS unmatched_talent_locations;
CREATE TABLE unmatched_talent_locations AS
SELECT DISTINCT location AS unmatched_location
FROM talent_profiles
WHERE location IS NOT NULL
  AND location NOT IN (
    SELECT raw_location FROM location_mapping
  );

-- Step 4: Update talent_profiles with matched country and country_code
UPDATE talent_profiles tp
SET
    country = lm.country,
    country_code = lm.country_code
FROM location_mapping lm
WHERE tp.location = lm.raw_location;

-- Step 5: (Optional) Drop the mapping table
-- DROP TABLE location_mapping;

-- 🎉 Done — check 'unmatched_talent_locations' for any locations needing manual mapping.
