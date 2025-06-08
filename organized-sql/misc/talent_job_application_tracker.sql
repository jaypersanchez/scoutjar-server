SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name IN ('jobs')

SELECT
  u.user_id,
  u.created_at,
  u.full_name,
  u.email,
  u.profile_picture,
  u.user_type,
  tp.talent_id,
  tp.location AS talent_location,
  tp.country,
  tp.profile_mode,
  tp.skills,
  tp.experience,
  ja.application_id,
  ja.application_date,
  ja.application_status,
  j.job_id,
  j.job_title,
  j.job_description,
  j.salary_range,
  j.required_skills,
  j.experience_level,
  j.employment_type,
  j.location AS job_location,
  j.work_mode,
  j.date_posted
FROM
  user_profiles u
JOIN
  talent_profiles tp ON u.user_id = tp.user_id
JOIN
  job_applications ja ON tp.talent_id = ja.talent_id
JOIN
  jobs j ON ja.job_id = j.job_id
WHERE
  u.created_at >= '2025-05-26'
ORDER BY
  tp.talent_id, ja.application_date DESC;

