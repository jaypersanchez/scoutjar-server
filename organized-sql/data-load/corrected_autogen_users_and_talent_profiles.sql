
WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_1', 'eu_autogen_user1@example.com', 'Test User 1', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Germany experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Germany.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       60750.66,
       'Berlin, Germany', TRUE, 'Two Weeks Notice', '2025-06-25', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', TRUE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_2', 'eu_autogen_user2@example.com', 'Test User 2', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from France experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across France.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       52003.53,
       'Paris, France', TRUE, '1 Month', '2025-04-24', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', FALSE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_3', 'eu_autogen_user3@example.com', 'Test User 3', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Spain experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Spain.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       40763.29,
       'Madrid, Spain', TRUE, '1 Month', '2025-06-23', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', FALSE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_4', 'eu_autogen_user4@example.com', 'Test User 4', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Italy experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Italy.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       73669.39,
       'Rome, Italy', TRUE, 'Two Weeks Notice', '2025-06-14', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', FALSE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_5', 'eu_autogen_user5@example.com', 'Test User 5', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Netherlands experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Netherlands.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       86202.29,
       'Amsterdam, Netherlands', TRUE, '1 Month', '2025-04-14', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', FALSE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_6', 'eu_autogen_user6@example.com', 'Test User 6', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Austria experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Austria.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       75096.77,
       'Vienna, Austria', TRUE, 'Immediate', '2025-04-29', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', FALSE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_7', 'eu_autogen_user7@example.com', 'Test User 7', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Sweden experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Sweden.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       45767.3,
       'Stockholm, Sweden', TRUE, 'Immediate', '2025-06-08', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', FALSE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_8', 'eu_autogen_user8@example.com', 'Test User 8', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Denmark experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Denmark.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       84973.0,
       'Copenhagen, Denmark', TRUE, '1 Month', '2025-06-17', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', TRUE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_9', 'eu_autogen_user9@example.com', 'Test User 9', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Finland experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Finland.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       57070.42,
       'Helsinki, Finland', TRUE, 'Two Weeks Notice', '2025-05-07', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', TRUE
FROM new_user;


WITH new_user AS (
    INSERT INTO user_profiles (oauth_provider, oauth_provider_id, email, full_name, profile_picture, social_profile_url, user_type)
    VALUES ('LinkedIn', 'linkedin_auto_10', 'eu_autogen_user10@example.com', 'Test User 10', NULL, NULL, 'talent')
    RETURNING user_id
)
INSERT INTO talent_profiles (user_id, resume, bio, skills, experience, education, work_preferences, desired_salary, location, job_alerts_enabled, availability, available_from, time_availability, requires_two_weeks_notice)
SELECT new_user.user_id, NULL, 'Professional from Portugal experienced in modern technologies.',
       ARRAY['Python','Communication','Teamwork'],
       'Worked in various companies across Portugal.',
       'Bachelor''s Degree in Computer Science',
       '{"remote": true, "full_time": true, "freelance": false}',
       52518.27,
       'Lisbon, Portugal', TRUE, '1 Month', '2025-06-15', '{"monday": "9am-5pm", "tuesday": "9am-5pm"}', TRUE
FROM new_user;
