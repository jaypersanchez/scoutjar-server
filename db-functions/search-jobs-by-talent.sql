
BEGIN
  RETURN QUERY
    SELECT 
      t.talent_id,
      t.bio,
      t.skills,
      t.experience,
      j.job_id,
      j.job_title,
      j.job_description,
      j.required_skills
    FROM talent_profiles t
    JOIN jobs j ON EXISTS (
        SELECT 1
        FROM unnest(t.skills) AS talent_skill,
             unnest(j.required_skills) AS job_skill
        WHERE talent_skill ILIKE job_skill
    )
    WHERE t.bio IS NOT NULL
      AND t.skills IS NOT NULL
      AND t.experience IS NOT NULL
      AND (p_talent_id IS NULL OR t.talent_id = p_talent_id)
      AND (p_user_id IS NULL OR t.user_id = p_user_id);
END;
