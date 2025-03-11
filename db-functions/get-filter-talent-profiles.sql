CREATE OR REPLACE FUNCTION get_filtered_talent_profiles(
    p_min_salary NUMERIC DEFAULT 0,
    p_max_salary NUMERIC DEFAULT NULL,
    p_filter_location TEXT DEFAULT NULL,
    p_required_skill TEXT DEFAULT NULL,
    p_job_title TEXT DEFAULT NULL,
    p_preferred_work_mode TEXT DEFAULT NULL,
    p_job_description TEXT DEFAULT NULL,
    p_match_percentage NUMERIC DEFAULT 0  -- Threshold in percentage (0-100)
)
RETURNS TABLE (
    talent_id INT,
    user_id INT,
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
  SELECT *
  FROM (
    SELECT 
      tp.*,
      (
        -- Compute points for each criterion
        (CASE WHEN p_min_salary IS NOT NULL AND tp.desired_salary >= p_min_salary THEN 10 ELSE 0 END) +
        (CASE WHEN p_max_salary IS NOT NULL AND tp.desired_salary <= p_max_salary THEN 10 ELSE 0 END) +
        (CASE WHEN p_filter_location IS NOT NULL AND lower(tp.location) = lower(p_filter_location) THEN 20 ELSE 0 END) +
        (CASE WHEN p_required_skill IS NOT NULL AND p_required_skill = ANY(tp.skills) THEN 20 ELSE 0 END) +
        (CASE WHEN p_preferred_work_mode IS NOT NULL AND tp.work_preferences ? p_preferred_work_mode THEN 20 ELSE 0 END) +
        (CASE WHEN p_job_title IS NOT NULL 
              AND (tp.resume ILIKE '%' || p_job_title || '%' OR tp.bio ILIKE '%' || p_job_title || '%') 
              THEN 10 ELSE 0 END) +
        (CASE WHEN p_job_description IS NOT NULL 
              AND (tp.resume ILIKE '%' || p_job_description || '%' OR tp.bio ILIKE '%' || p_job_description || '%') 
              THEN 10 ELSE 0 END)
      )::numeric AS computed_match_percentage
    FROM talent_profiles tp
    WHERE 
      -- Only apply filters when a parameter is provided
      (p_min_salary IS NULL OR tp.desired_salary >= p_min_salary) AND
      (p_max_salary IS NULL OR tp.desired_salary <= p_max_salary) AND
      (p_filter_location IS NULL OR lower(tp.location) = lower(p_filter_location)) AND
      (p_required_skill IS NULL OR p_required_skill = ANY(tp.skills)) AND
      (p_preferred_work_mode IS NULL OR tp.work_preferences ? p_preferred_work_mode) AND
      (p_job_title IS NULL OR (tp.resume ILIKE '%' || p_job_title || '%' OR tp.bio ILIKE '%' || p_job_title || '%')) AND
      (p_job_description IS NULL OR (tp.resume ILIKE '%' || p_job_description || '%' OR tp.bio ILIKE '%' || p_job_description || '%'))
  ) AS sub
  WHERE sub.computed_match_percentage >= p_match_percentage;
END;
$$ LANGUAGE plpgsql;
