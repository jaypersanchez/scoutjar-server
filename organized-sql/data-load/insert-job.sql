
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
END;
