CREATE OR REPLACE FUNCTION get_jobs(optional_recruiter_id INT DEFAULT NULL)
RETURNS TABLE (
  job_id INT,
  recruiter_id INT,
  job_title TEXT,
  job_description TEXT,
  required_skills TEXT[],
  experience_level TEXT,
  employment_type TEXT,
  salary_range NUMERIC[],
  work_mode TEXT,
  location TEXT,
  date_posted TIMESTAMP,
  applicant_count BIGINT
)
AS $$
BEGIN
  IF optional_recruiter_id IS NULL THEN
    RETURN QUERY
    SELECT 
      j.job_id,
      j.recruiter_id,
      j.job_title::TEXT,
      j.job_description::TEXT,
      j.required_skills,
      j.experience_level::TEXT,
      j.employment_type::TEXT,
      j.salary_range,
      j.work_mode::TEXT,
      j.location::TEXT,
      j.date_posted,
      (
        SELECT COUNT(*) FROM job_applications ja
        WHERE ja.job_id = j.job_id
      ) AS applicant_count
    FROM jobs j;

  ELSE
    RETURN QUERY
    SELECT 
      j.job_id,
      j.recruiter_id,
      j.job_title::TEXT,
      j.job_description::TEXT,
      j.required_skills,
      j.experience_level::TEXT,
      j.employment_type::TEXT,
      j.salary_range,
      j.work_mode::TEXT,
      j.location::TEXT,
      j.date_posted,
      (
        SELECT COUNT(*) FROM job_applications ja
        WHERE ja.job_id = j.job_id
      ) AS applicant_count
    FROM jobs j
    WHERE j.recruiter_id = optional_recruiter_id;
  END IF;
END;
$$ LANGUAGE plpgsql;
