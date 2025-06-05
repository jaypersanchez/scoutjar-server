CREATE OR REPLACE FUNCTION insert_job(
  p_recruiter_id INT,
  p_job_title VARCHAR,
  p_job_description TEXT,
  p_required_skills TEXT[],
  p_experience_level VARCHAR,
  p_employment_type VARCHAR,
  p_salary_range NUMERIC[],
  p_work_mode VARCHAR,
  p_location TEXT
)
RETURNS INT AS $$
DECLARE
  new_job_id INT;
BEGIN
  INSERT INTO jobs (
    recruiter_id, 
    job_title, 
    job_description, 
    required_skills, 
    experience_level, 
    employment_type, 
    salary_range, 
    work_mode, 
    location
  )
  VALUES (
    p_recruiter_id, 
    p_job_title, 
    p_job_description, 
    p_required_skills, 
    p_experience_level, 
    p_employment_type, 
    p_salary_range, 
    p_work_mode, 
    p_location
  )
  RETURNING job_id INTO new_job_id;

  RETURN new_job_id;

EXCEPTION
  WHEN OTHERS THEN
    RAISE EXCEPTION 'insert_job failed: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;
