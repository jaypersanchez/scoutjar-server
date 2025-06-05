CREATE OR REPLACE FUNCTION get_filtered_talent_profiles(
  p_min_salary NUMERIC DEFAULT NULL,
  p_max_salary NUMERIC DEFAULT NULL,
  p_required_skill TEXT DEFAULT NULL,
  p_job_title TEXT DEFAULT NULL,
  p_job_description TEXT DEFAULT NULL,
  p_location TEXT DEFAULT NULL,
  p_match_percentage NUMERIC DEFAULT 0
)
RETURNS TABLE (
  talent_id INT,
  user_id INT,
  email TEXT,
  full_name TEXT,
  requires_two_weeks_notice BOOLEAN,
  resume TEXT,
  bio TEXT,
  skills TEXT[],
  experience TEXT,
  education TEXT,
  work_preferences JSONB,
  desired_salary NUMERIC,
  location TEXT,
  job_alerts_enabled BOOLEAN,
  available_from DATE,
  time_availability JSONB,
  availability VARCHAR,
  computed_match_percentage NUMERIC
)
AS $$
BEGIN
  RETURN QUERY
  WITH scores AS (
    SELECT 
      tp.talent_id,
      tp.user_id,
      up.email::text,
      up.full_name::text,
      tp.requires_two_weeks_notice,
      tp.resume,
      tp.bio,
      tp.skills,
      tp.experience,
      tp.education,
      tp.work_preferences,
      tp.desired_salary,
      tp.location,
      tp.job_alerts_enabled,
      tp.available_from,
      tp.time_availability,
      tp.availability,

      (
        (CASE WHEN p_min_salary IS NOT NULL AND tp.desired_salary >= p_min_salary THEN 10 ELSE 0 END) +
        (CASE WHEN p_max_salary IS NOT NULL AND tp.desired_salary <= p_max_salary THEN 10 ELSE 0 END) +
        (CASE WHEN p_required_skill IS NOT NULL THEN 
              (CASE WHEN EXISTS (
                         SELECT 1 
                         FROM unnest(tp.skills) AS candidate_skill
                         WHERE EXISTS (
                               SELECT 1
                               FROM unnest(string_to_array(p_required_skill, ',')) AS search_keyword
                               WHERE LOWER(candidate_skill) ILIKE '%' || LOWER(trim(search_keyword)) || '%'
                         )
                      ) THEN 20 ELSE 0 END)
         ELSE 0 END) +
        (CASE WHEN p_job_title IS NOT NULL THEN 
              (CASE WHEN EXISTS (
                         SELECT 1
                         FROM unnest(string_to_array(p_job_title, ' ')) AS token
                         WHERE LOWER(tp.resume) ILIKE '%' || LOWER(token) || '%'
                            OR LOWER(tp.bio) ILIKE '%' || LOWER(token) || '%'
                            OR LOWER(tp.experience) ILIKE '%' || LOWER(token) || '%'
                     ) THEN 10 ELSE 0 END)
         ELSE 0 END) +
        (CASE WHEN p_job_description IS NOT NULL THEN 
              (CASE WHEN EXISTS (
                         SELECT 1
                         FROM unnest(string_to_array(p_job_description, ' ')) AS token
                         WHERE LOWER(tp.resume) ILIKE '%' || LOWER(token) || '%'
                            OR LOWER(tp.bio) ILIKE '%' || LOWER(token) || '%'
                            OR LOWER(tp.experience) ILIKE '%' || LOWER(token) || '%'
                     ) THEN 10 ELSE 0 END)
         ELSE 0 END) +
        (CASE WHEN p_location IS NOT NULL THEN 
              (CASE WHEN EXISTS (
                         SELECT 1
                         FROM unnest(string_to_array(p_location, ',')) AS loc
                         WHERE LOWER(tp.location) ILIKE '%' || LOWER(trim(loc)) || '%'
                     ) THEN 10 ELSE 0 END)
         ELSE 0 END)
      )::numeric AS candidate_score,

      (
        (CASE WHEN p_min_salary IS NOT NULL THEN 10 ELSE 0 END) +
        (CASE WHEN p_max_salary IS NOT NULL THEN 10 ELSE 0 END) +
        (CASE WHEN p_required_skill IS NOT NULL THEN 20 ELSE 0 END) +
        (CASE WHEN p_job_title IS NOT NULL THEN 10 ELSE 0 END) +
        (CASE WHEN p_job_description IS NOT NULL THEN 10 ELSE 0 END) +
        (CASE WHEN p_location IS NOT NULL THEN 10 ELSE 0 END)
      )::numeric AS total_possible_points
    FROM public.talent_profiles tp
    INNER JOIN public.user_profiles up ON tp.user_id = up.user_id
    WHERE 
      (p_min_salary IS NULL OR tp.desired_salary >= p_min_salary) AND
      (p_max_salary IS NULL OR tp.desired_salary <= p_max_salary) AND
      (p_required_skill IS NULL OR EXISTS (
          SELECT 1 
          FROM unnest(tp.skills) AS candidate_skill
          WHERE EXISTS (
                SELECT 1
                FROM unnest(string_to_array(p_required_skill, ',')) AS search_keyword
                WHERE LOWER(candidate_skill) ILIKE '%' || LOWER(trim(search_keyword)) || '%'
          )
      )) AND
      (p_job_title IS NULL OR EXISTS (
          SELECT 1
          FROM unnest(string_to_array(p_job_title, ' ')) AS token
          WHERE LOWER(tp.resume) ILIKE '%' || LOWER(token) || '%'
             OR LOWER(tp.bio) ILIKE '%' || LOWER(token) || '%'
             OR LOWER(tp.experience) ILIKE '%' || LOWER(token) || '%'
      )) AND
      (p_job_description IS NULL OR EXISTS (
          SELECT 1
          FROM unnest(string_to_array(p_job_description, ' ')) AS token
          WHERE LOWER(tp.resume) ILIKE '%' || LOWER(token) || '%'
             OR LOWER(tp.bio) ILIKE '%' || LOWER(token) || '%'
             OR LOWER(tp.experience) ILIKE '%' || LOWER(token) || '%'
      )) AND
      (p_location IS NULL OR EXISTS (
          SELECT 1
          FROM unnest(string_to_array(p_location, ',')) AS loc
          WHERE LOWER(tp.location) ILIKE '%' || LOWER(trim(loc)) || '%'
      ))
  )
  SELECT 
    scores.talent_id,
    scores.user_id,
    scores.email,
    scores.full_name,
    scores.requires_two_weeks_notice,
    scores.resume,
    scores.bio,
    scores.skills,
    scores.experience,
    scores.education,
    scores.work_preferences,
    scores.desired_salary,
    scores.location,
    scores.job_alerts_enabled,
    scores.available_from,
    scores.time_availability,
    scores.availability,
    CASE 
      WHEN scores.total_possible_points > 0 THEN (scores.candidate_score * 100.0 / scores.total_possible_points)
      ELSE 0 
    END AS computed_match_percentage
  FROM scores
  WHERE 
    scores.total_possible_points = 0 OR
    (scores.candidate_score * 100.0 / scores.total_possible_points) >= p_match_percentage;
END;
$$ LANGUAGE plpgsql;
