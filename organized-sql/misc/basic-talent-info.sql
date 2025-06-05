SELECT 
    u.user_id,
    u.email,
    u.full_name,
    u.profile_picture,
    t.*
FROM 
    user_profiles u
JOIN 
    talent_profiles t ON u.user_id = t.user_id;
