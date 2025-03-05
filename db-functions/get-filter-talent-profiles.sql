
BEGIN
    RETURN QUERY
    SELECT tp.talent_id, 
           tp.user_id, 
           tp.resume, 
           tp.bio, 
           tp.skills, 
           tp.experience, 
           tp.education,
           tp.work_preferences, 
           tp.desired_salary, 
           tp.location, 
           tp.job_alerts_enabled, 
           up.email::text   
    FROM talent_profiles tp
    JOIN user_profiles up ON tp.user_id = up.user_id
    WHERE tp.desired_salary >= min_salary
      AND (max_salary IS NULL OR tp.desired_salary <= max_salary)
      AND (filter_location IS NULL OR tp.location ILIKE '%' || filter_location || '%')
      AND (required_skill IS NULL OR EXISTS (
            SELECT 1 FROM unnest(tp.skills) s WHERE s ILIKE '%' || required_skill || '%'
          ));
END;
