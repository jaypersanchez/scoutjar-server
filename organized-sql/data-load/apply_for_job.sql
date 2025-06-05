CREATE OR REPLACE FUNCTION apply_for_job(
    p_talent_id INTEGER,
    p_job_id INTEGER
)
RETURNS VOID AS
$$
DECLARE
    v_recruiter_id INTEGER;
    v_existing_application INTEGER;
BEGIN
    -- Check if the job exists and retrieve its recruiter_id.
    SELECT recruiter_id
      INTO v_recruiter_id
      FROM jobs
     WHERE job_id = p_job_id;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Job with id % does not exist.', p_job_id;
    END IF;
    
    -- Verify that the talent exists.
    PERFORM 1
      FROM talent_profiles
     WHERE talent_id = p_talent_id;
     
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Talent with id % does not exist.', p_talent_id;
    END IF;
    
    -- Check if an application already exists for this talent and job.
    SELECT application_id
      INTO v_existing_application
      FROM job_applications
     WHERE talent_id = p_talent_id
       AND job_id = p_job_id;
    
    IF FOUND THEN
        RAISE EXCEPTION 'An application already exists for talent id % and job id %.', p_talent_id, p_job_id;
    END IF;
    
    -- Insert a new application with a default status of 'Pending' and the recruiter_id from the job.
    INSERT INTO job_applications (talent_id, job_id, application_status, recruiter_id)
    VALUES (p_talent_id, p_job_id, 'Pending', v_recruiter_id);
    
END;
$$
LANGUAGE plpgsql;
