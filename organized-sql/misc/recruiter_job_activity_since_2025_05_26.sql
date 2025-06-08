SELECT
  u.user_id,
  u.created_at,
  u.oauth_provider_id,
  u.email,
  u.full_name,
  u.profile_picture,
  u.social_profile_url,
  u.user_type,
  u.oauth_provider,
  tr.recruiter_id,
  tr.company_name,
  tr.company_website,
  tr.industry,
  tr.company_logo
FROM
  user_profiles u
LEFT JOIN
  talent_recruiters tr ON u.user_id = tr.user_id
WHERE
  u.created_at >= '2025-05-26';
  
SELECT
  u.user_id,
  u.created_at,
  u.oauth_provider_id,
  u.email,
  u.full_name,
  u.profile_picture,
  u.social_profile_url,
  u.user_type,
  u.oauth_provider,
  tr.recruiter_id,
  tr.company_name,
  tr.company_website,
  tr.industry,
  tr.company_logo,
  j.job_id,
  j.date_posted,
  j.job_title,
  j.job_description,
  j.salary_range,
  j.required_skills,
  j.experience_level,
  j.employment_type,
  j.location,
  j.work_mode
FROM
  user_profiles u
JOIN
  talent_recruiters tr ON u.user_id = tr.user_id
LEFT JOIN
  jobs j ON tr.recruiter_id = j.recruiter_id
WHERE
  u.created_at >= '2025-05-26'
ORDER BY
  tr.recruiter_id, j.date_posted DESC;

