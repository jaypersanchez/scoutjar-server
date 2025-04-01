SELECT 
    u.user_id,
    t.talent_id,
    u.email,
    u.full_name,
    u.profile_picture,
    t.bio,
    t.skills,
    t.experience, 
    t.education,
    t.work_preferences,
    t.location,
    t.desired_salary,
    t.availability,
    t.available_from,
    t.requires_two_weeks_notice,
    t.resume
FROM 
    user_profiles u
JOIN 
    talent_profiles t ON u.user_id = t.user_id
--WHERE 
  --  u.full_name ILIKE '%User 10%'
ORDER BY 
    u.user_id;
