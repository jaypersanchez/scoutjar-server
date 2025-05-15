
BEGIN
    RETURN QUERY
    SELECT 
        ja.application_id,
        ja.talent_id,
        tp.user_id,
        ja.job_id,
        j.job_title,
        j.recruiter_id,
        ja.application_status,
        ja.application_date
    FROM job_applications ja
    JOIN jobs j ON ja.job_id = j.job_id
    JOIN talent_profiles tp ON ja.talent_id = tp.talent_id
    WHERE p_recruiter_id IS NULL OR j.recruiter_id = p_recruiter_id;
END;
