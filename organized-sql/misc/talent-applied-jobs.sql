SELECT 
  u.user_id, 
  u.email, 
  u.full_name, 
  u.profile_picture,
  t.*,
  j.job_id,
  j.job_title,
  j.job_description
FROM user_profiles u
JOIN talent_profiles t ON u.user_id = t.user_id
LEFT JOIN job_applications ja ON t.talent_id = ja.talent_id
LEFT JOIN jobs j ON ja.job_id = j.job_id;
