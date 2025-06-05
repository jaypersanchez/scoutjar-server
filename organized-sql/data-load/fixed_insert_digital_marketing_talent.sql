INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1001, 
        'LinkedIn', 
        'linkedin_id_1', 
        'talent1@digitalpro.com', 
        'Talent 1 Marketer', 
        'https://picsum.photos/id/31/200/200', 
        'https://linkedin.com/in/talent1', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1002, 
        'Google', 
        'google_id_2', 
        'talent2@digitalpro.com', 
        'Talent 2 Marketer', 
        'https://picsum.photos/id/32/200/200', 
        'https://linkedin.com/in/talent2', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1003, 
        'Google', 
        'google_id_3', 
        'talent3@digitalpro.com', 
        'Talent 3 Marketer', 
        'https://picsum.photos/id/33/200/200', 
        'https://linkedin.com/in/talent3', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1004, 
        'LinkedIn', 
        'linkedin_id_4', 
        'talent4@digitalpro.com', 
        'Talent 4 Marketer', 
        'https://picsum.photos/id/34/200/200', 
        'https://linkedin.com/in/talent4', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1005, 
        'Google', 
        'google_id_5', 
        'talent5@digitalpro.com', 
        'Talent 5 Marketer', 
        'https://picsum.photos/id/35/200/200', 
        'https://linkedin.com/in/talent5', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1006, 
        'LinkedIn', 
        'linkedin_id_6', 
        'talent6@digitalpro.com', 
        'Talent 6 Marketer', 
        'https://picsum.photos/id/36/200/200', 
        'https://linkedin.com/in/talent6', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1007, 
        'LinkedIn', 
        'linkedin_id_7', 
        'talent7@digitalpro.com', 
        'Talent 7 Marketer', 
        'https://picsum.photos/id/37/200/200', 
        'https://linkedin.com/in/talent7', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1008, 
        'LinkedIn', 
        'linkedin_id_8', 
        'talent8@digitalpro.com', 
        'Talent 8 Marketer', 
        'https://picsum.photos/id/38/200/200', 
        'https://linkedin.com/in/talent8', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1009, 
        'Google', 
        'google_id_9', 
        'talent9@digitalpro.com', 
        'Talent 9 Marketer', 
        'https://picsum.photos/id/39/200/200', 
        'https://linkedin.com/in/talent9', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1010, 
        'Google', 
        'google_id_10', 
        'talent10@digitalpro.com', 
        'Talent 10 Marketer', 
        'https://picsum.photos/id/40/200/200', 
        'https://linkedin.com/in/talent10', 
        'Talent'
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1001, 
        'https://resumes.digitalpro.com/1001.pdf', 
        'Talent 1 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Adobe Photoshop', 'Copywriting', 'Email Marketing', 'SEO', 'Instagram Ads'], 
        'Over 6 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Hybrid", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        69196.58, 
        'New York, New York, United States', 
        'Two Weeks Notice', 
        '2025-05-04', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1002, 
        'https://resumes.digitalpro.com/1002.pdf', 
        'Talent 2 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Email Marketing', 'Video Editing', 'SEO', 'Google Analytics', 'Adobe Photoshop'], 
        'Over 3 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Hybrid", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        56325.66, 
        'Los Angeles, California, United States', 
        '3 Months', 
        '2025-05-29', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1003, 
        'https://resumes.digitalpro.com/1003.pdf', 
        'Talent 3 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Instagram Ads', 'Google Analytics', 'Video Editing', 'YouTube Channel Management', 'SEO'], 
        'Over 7 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Hybrid", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        80538.96, 
        'Los Angeles, California, United States', 
        '1 Month', 
        '2025-05-17', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1004, 
        'https://resumes.digitalpro.com/1004.pdf', 
        'Talent 4 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Adobe Photoshop', 'Google Analytics', 'SEO', 'Facebook Ads', 'Video Editing'], 
        'Over 10 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Hybrid", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        48774.7, 
        'Los Angeles, California, United States', 
        'Two Weeks Notice', 
        '2025-04-19', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1005, 
        'https://resumes.digitalpro.com/1005.pdf', 
        'Talent 5 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Google Analytics', 'Copywriting', 'Instagram Ads', 'Adobe Photoshop', 'SEO'], 
        'Over 10 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Remote", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        84049.31, 
        'Toronto, Ontario, Canada', 
        'Two Weeks Notice', 
        '2025-05-16', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1006, 
        'https://resumes.digitalpro.com/1006.pdf', 
        'Talent 6 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['SEO', 'Copywriting', 'Google Analytics', 'Video Editing', 'Social Media Marketing'], 
        'Over 7 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Hybrid", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        81076.13, 
        'New York, New York, United States', 
        'Not Available', 
        '2025-05-22', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1007, 
        'https://resumes.digitalpro.com/1007.pdf', 
        'Talent 7 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Instagram Ads', 'Google Analytics', 'Email Marketing', 'Content Strategy', 'YouTube Channel Management'], 
        'Over 9 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Remote", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        68100.29, 
        'New York, New York, United States', 
        '3 Months', 
        '2025-04-25', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1008, 
        'https://resumes.digitalpro.com/1008.pdf', 
        'Talent 8 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Content Strategy', 'Social Media Marketing', 'Video Editing', 'Adobe Photoshop', 'Facebook Ads'], 
        'Over 5 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Remote", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        54814.78, 
        'Toronto, Ontario, Canada', 
        '3 Months', 
        '2025-04-25', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1009, 
        'https://resumes.digitalpro.com/1009.pdf', 
        'Talent 9 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Adobe Photoshop', 'Social Media Marketing', 'Content Strategy', 'Copywriting', 'Facebook Ads'], 
        'Over 3 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Remote", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        72293.23, 
        'Sydney, New South Wales, Australia', 
        'Not Available', 
        '2025-04-19', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1010, 
        'https://resumes.digitalpro.com/1010.pdf', 
        'Talent 10 Marketer is a passionate digital marketing professional specializing in content creation, SEO, and social media engagement.', 
        ARRAY['Video Editing', 'Email Marketing', 'Instagram Ads', 'Facebook Ads', 'Content Strategy'], 
        'Over 10 years of experience in managing digital campaigns, content strategy, and influencer collaborations.', 
        'Bachelor''s degree in Marketing or Communications', 
        '{"work_mode": "Hybrid", "preferred_projects": "Content Marketing, Digital Strategy, Social Engagement"}'::jsonb, 
        46035.48, 
        'Sydney, New South Wales, Australia', 
        'Immediate', 
        '2025-04-10', 
        '{"daily_hours": "4-8", "timezone": "PST"}'::jsonb, 
        TRUE
    );