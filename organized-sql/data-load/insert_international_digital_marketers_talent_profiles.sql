INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1011, 
        'LinkedIn', 
        'linkedin_intl_id_11', 
        'intltalent11@globaldigital.com', 
        'Intl Talent 11 Marketer', 
        'https://picsum.photos/id/51/200/200', 
        'https://linkedin.com/in/intltalent11', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1012, 
        'LinkedIn', 
        'linkedin_intl_id_12', 
        'intltalent12@globaldigital.com', 
        'Intl Talent 12 Marketer', 
        'https://picsum.photos/id/52/200/200', 
        'https://linkedin.com/in/intltalent12', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1013, 
        'LinkedIn', 
        'linkedin_intl_id_13', 
        'intltalent13@globaldigital.com', 
        'Intl Talent 13 Marketer', 
        'https://picsum.photos/id/53/200/200', 
        'https://linkedin.com/in/intltalent13', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1014, 
        'Google', 
        'google_intl_id_14', 
        'intltalent14@globaldigital.com', 
        'Intl Talent 14 Marketer', 
        'https://picsum.photos/id/54/200/200', 
        'https://linkedin.com/in/intltalent14', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1015, 
        'LinkedIn', 
        'linkedin_intl_id_15', 
        'intltalent15@globaldigital.com', 
        'Intl Talent 15 Marketer', 
        'https://picsum.photos/id/55/200/200', 
        'https://linkedin.com/in/intltalent15', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1016, 
        'Google', 
        'google_intl_id_16', 
        'intltalent16@globaldigital.com', 
        'Intl Talent 16 Marketer', 
        'https://picsum.photos/id/56/200/200', 
        'https://linkedin.com/in/intltalent16', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1017, 
        'Google', 
        'google_intl_id_17', 
        'intltalent17@globaldigital.com', 
        'Intl Talent 17 Marketer', 
        'https://picsum.photos/id/57/200/200', 
        'https://linkedin.com/in/intltalent17', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1018, 
        'Google', 
        'google_intl_id_18', 
        'intltalent18@globaldigital.com', 
        'Intl Talent 18 Marketer', 
        'https://picsum.photos/id/58/200/200', 
        'https://linkedin.com/in/intltalent18', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1019, 
        'LinkedIn', 
        'linkedin_intl_id_19', 
        'intltalent19@globaldigital.com', 
        'Intl Talent 19 Marketer', 
        'https://picsum.photos/id/59/200/200', 
        'https://linkedin.com/in/intltalent19', 
        'Talent'
    );

INSERT INTO public.user_profiles (
        user_id, oauth_provider, oauth_provider_id, email, full_name, 
        profile_picture, social_profile_url, user_type
    ) VALUES (
        1020, 
        'LinkedIn', 
        'linkedin_intl_id_20', 
        'intltalent20@globaldigital.com', 
        'Intl Talent 20 Marketer', 
        'https://picsum.photos/id/60/200/200', 
        'https://linkedin.com/in/intltalent20', 
        'Talent'
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1011, 
        'https://resumes.globaldigital.com/1011.pdf', 
        'Intl Talent 11 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Adobe Photoshop', 'SEO', 'YouTube Channel Management', 'Content Strategy', 'Google Analytics'], 
        'More than 12 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Remote", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        83395.34, 
        'Berlin, Germany', 
        'Not Available', 
        '2025-05-13', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1012, 
        'https://resumes.globaldigital.com/1012.pdf', 
        'Intl Talent 12 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Instagram Ads', 'Email Marketing', 'YouTube Channel Management', 'Content Strategy', 'Copywriting'], 
        'More than 6 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        56032.35, 
        'Paris, France', 
        'Not Available', 
        '2025-05-28', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1013, 
        'https://resumes.globaldigital.com/1013.pdf', 
        'Intl Talent 13 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Video Editing', 'YouTube Channel Management', 'Content Strategy', 'Adobe Photoshop', 'SEO'], 
        'More than 12 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        55319.13, 
        'Barcelona, Spain', 
        '3 Months', 
        '2025-05-07', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1014, 
        'https://resumes.globaldigital.com/1014.pdf', 
        'Intl Talent 14 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Video Editing', 'Email Marketing', 'Google Analytics', 'Social Media Marketing', 'SEO'], 
        'More than 9 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        72778.97, 
        'Amsterdam, Netherlands', 
        'Not Available', 
        '2025-04-23', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        FALSE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1015, 
        'https://resumes.globaldigital.com/1015.pdf', 
        'Intl Talent 15 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Email Marketing', 'Facebook Ads', 'Content Strategy', 'SEO', 'Video Editing'], 
        'More than 7 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        51305.95, 
        'Stockholm, Sweden', 
        'Two Weeks Notice', 
        '2025-05-04', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1016, 
        'https://resumes.globaldigital.com/1016.pdf', 
        'Intl Talent 16 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Instagram Ads', 'Google Analytics', 'Facebook Ads', 'YouTube Channel Management', 'Social Media Marketing'], 
        'More than 11 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        83850.6, 
        'Copenhagen, Denmark', 
        'Two Weeks Notice', 
        '2025-04-30', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1017, 
        'https://resumes.globaldigital.com/1017.pdf', 
        'Intl Talent 17 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Instagram Ads', 'YouTube Channel Management', 'Content Strategy', 'Email Marketing', 'Social Media Marketing'], 
        'More than 4 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        56252.93, 
        'Dubai, United Arab Emirates', 
        '3 Months', 
        '2025-04-23', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1018, 
        'https://resumes.globaldigital.com/1018.pdf', 
        'Intl Talent 18 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Video Editing', 'Instagram Ads', 'SEO', 'Google Analytics', 'Social Media Marketing'], 
        'More than 5 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        65006.01, 
        'Riyadh, Saudi Arabia', 
        'Two Weeks Notice', 
        '2025-05-08', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1019, 
        'https://resumes.globaldigital.com/1019.pdf', 
        'Intl Talent 19 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Email Marketing', 'Video Editing', 'Instagram Ads', 'Copywriting', 'YouTube Channel Management'], 
        'More than 11 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        74553.65, 
        'Amman, Jordan', 
        'Two Weeks Notice', 
        '2025-05-27', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        TRUE
    );

INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education, 
        work_preferences, desired_salary, location, 
        availability, available_from, time_availability, requires_two_weeks_notice
    ) VALUES (
        1020, 
        'https://resumes.globaldigital.com/1020.pdf', 
        'Intl Talent 20 Marketer is an experienced digital content creator and marketing strategist, working with clients across Europe and the Middle East.', 
        ARRAY['Video Editing', 'Copywriting', 'YouTube Channel Management', 'Instagram Ads', 'SEO'], 
        'More than 11 years in planning, executing, and analyzing content-driven marketing initiatives in international markets.', 
        'Master''s degree in Digital Marketing or Media Studies', 
        '{"work_mode": "Hybrid", "preferred_projects": "Influencer Strategy, SEO Localization, Global Brand Storytelling"}'::jsonb, 
        86554.96, 
        'Istanbul, Turkey', 
        '1 Month', 
        '2025-05-04', 
        '{"daily_hours": "6-8", "timezone": "GMT+3"}'::jsonb, 
        FALSE
    );