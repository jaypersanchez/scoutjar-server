WITH filtered_talent AS (
  SELECT 
    talent_id, 
    user_id, 
    resume, 
    bio, 
    skills, 
    experience, 
    education, 
    work_preferences, 
    desired_salary, 
    location, 
    availability, 
    available_from, 
    requires_two_weeks_notice
  FROM public.talent_profiles
  WHERE desired_salary >= 85000
    AND (desired_salary <= 90000 OR 90000 IS NULL)
    AND availability = 'Immediate'
),
job AS (
  SELECT job_id, required_skills
  FROM public.jobs
  WHERE job_id = 1
),
talent_matches AS (
  SELECT
    ft.*,
    j.required_skills,
    cardinality(j.required_skills) AS total_required,
    (
      SELECT COUNT(*)
      FROM unnest(j.required_skills) AS req_skill
      WHERE LOWER(req_skill) IN (
        SELECT LOWER(t_skill) FROM unnest(ft.skills) AS t_skill
      )
    ) AS matching_count
  FROM filtered_talent ft
  CROSS JOIN job j
)
SELECT 
  talent_id,
  user_id,
  resume,
  bio,
  skills,
  required_skills,
  matching_count,
  total_required,
  (matching_count * 1.0 / total_required) AS match_percentage
FROM talent_matches
WHERE (matching_count * 1.0 / total_required) >= 0.8
ORDER BY match_percentage DESC;
