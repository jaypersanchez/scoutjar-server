COPY ( 
	SELECT 
    up.user_id,
    up.email,
    up.full_name,
    up.profile_picture,
    up.social_profile_url,
    up.user_type,
    tp.talent_id,
    tp.work_preferences,
    tp.desired_salary,
    tp.job_alerts_enabled,
    tp.available_from,
    tp.time_availability,
    tp.requires_two_weeks_notice,
    tp.years_experience,
    tp.location,
    tp.resume,
    tp.bio,
    tp.skills,
    tp.experience,
    tp.education,
    tp.industry_experience,
    tp.availability
    
FROM user_profiles up
JOIN user_credentials uc ON up.user_id = uc.user_id
LEFT JOIN talent_profiles tp ON up.user_id = tp.user_id;
) TO '~/projects/scoutjar/scoutjar-server/user-talent-profiles.csv' WITH CSV HEADER

