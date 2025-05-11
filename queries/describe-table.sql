SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'messages';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'user_profiles';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'user_credentials';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'locations';

INSERT INTO talent_profiles (user_id)
VALUES (14); -- replace with actual user_id

