CREATE OR REPLACE FUNCTION get_filtered_talent_profiles(
    p_min_salary NUMERIC DEFAULT 0,
    p_max_salary NUMERIC DEFAULT NULL,
    p_filter_location TEXT DEFAULT NULL,
    p_required_skill TEXT DEFAULT NULL,
    p_job_title TEXT DEFAULT NULL,
    p_preferred_work_mode TEXT DEFAULT NULL,
    p_job_description TEXT DEFAULT NULL,
    p_match_percentage NUMERIC DEFAULT 0  -- Threshold (0-100)
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
    desired_salary NUMERIC(10,2),
    location TEXT,
    job_alerts_enabled BOOLEAN,
    available_from DATE,
    time_availability JSONB,
    availability VARCHAR(50),
    computed_match_percentage NUMERIC
)
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    tp.talent_id,
    tp.user_id,
    up.email::text,           -- explicit cast to TEXT
    up.full_name::text,       -- explicit cast to TEXT
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
      (CASE WHEN p_filter_location IS NOT NULL 
             AND replace(lower(tp.location), ' ', '') ILIKE '%' || replace(lower(p_filter_location), ' ', '') || '%'
            THEN 20 ELSE 0 END) +
      (CASE WHEN p_required_skill IS NOT NULL 
             AND EXISTS(
                  SELECT 1 
                  FROM unnest(tp.skills) AS skill 
                  WHERE lower(skill) = lower(p_required_skill)
                 )
            THEN 20 ELSE 0 END) +
      (CASE WHEN p_preferred_work_mode IS NOT NULL 
             AND lower(tp.work_preferences->>'work_mode') ILIKE '%' || lower(p_preferred_work_mode) || '%'
            THEN 20 ELSE 0 END) +
      (CASE WHEN p_job_title IS NOT NULL 
             AND (tp.resume ILIKE '%' || p_job_title || '%' OR tp.bio ILIKE '%' || p_job_title || '%')
            THEN 10 ELSE 0 END) +
      (CASE WHEN p_job_description IS NOT NULL 
             AND (tp.resume ILIKE '%' || p_job_description || '%' OR tp.bio ILIKE '%' || p_job_description || '%')
            THEN 10 ELSE 0 END)
    )::numeric AS computed_match_percentage
  FROM talent_profiles tp
  INNER JOIN user_profiles up ON tp.user_id = up.user_id
  WHERE 
    (p_min_salary IS NULL OR tp.desired_salary >= p_min_salary) AND
    (p_max_salary IS NULL OR tp.desired_salary <= p_max_salary) AND
    (p_filter_location IS NULL OR replace(lower(tp.location), ' ', '') ILIKE '%' || replace(lower(p_filter_location), ' ', '') || '%') AND
    (p_required_skill IS NULL OR EXISTS(
          SELECT 1 FROM unnest(tp.skills) AS skill 
          WHERE lower(skill) = lower(p_required_skill)
       )) AND
    (p_preferred_work_mode IS NULL OR lower(tp.work_preferences->>'work_mode') ILIKE '%' || lower(p_preferred_work_mode) || '%') AND
    (p_job_title IS NULL OR (tp.resume ILIKE '%' || p_job_title || '%' OR tp.bio ILIKE '%' || p_job_title || '%')) AND
    (p_job_description IS NULL OR (tp.resume ILIKE '%' || p_job_description || '%' OR tp.bio ILIKE '%' || p_job_description || '%'))
    AND
    (
      (CASE WHEN p_min_salary IS NOT NULL AND tp.desired_salary >= p_min_salary THEN 10 ELSE 0 END) +
      (CASE WHEN p_max_salary IS NOT NULL AND tp.desired_salary <= p_max_salary THEN 10 ELSE 0 END) +
      (CASE WHEN p_filter_location IS NOT NULL 
             AND replace(lower(tp.location), ' ', '') ILIKE '%' || replace(lower(p_filter_location), ' ', '') || '%'
            THEN 20 ELSE 0 END) +
      (CASE WHEN p_required_skill IS NOT NULL 
             AND EXISTS(
                  SELECT 1 
                  FROM unnest(tp.skills) AS skill 
                  WHERE lower(skill) = lower(p_required_skill)
                 )
            THEN 20 ELSE 0 END) +
      (CASE WHEN p_preferred_work_mode IS NOT NULL 
             AND lower(tp.work_preferences->>'work_mode') ILIKE '%' || lower(p_preferred_work_mode) || '%'
            THEN 20 ELSE 0 END) +
      (CASE WHEN p_job_title IS NOT NULL 
             AND (tp.resume ILIKE '%' || p_job_title || '%' OR tp.bio ILIKE '%' || p_job_title || '%')
            THEN 10 ELSE 0 END) +
      (CASE WHEN p_job_description IS NOT NULL 
             AND (tp.resume ILIKE '%' || p_job_description || '%' OR tp.bio ILIKE '%' || p_job_description || '%')
            THEN 10 ELSE 0 END)
    )::numeric >= p_match_percentage;
END;
$$ LANGUAGE plpgsql;

