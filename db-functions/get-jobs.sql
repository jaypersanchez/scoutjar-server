
BEGIN
  IF optional_recruiter_id IS NULL THEN
    RETURN QUERY
      SELECT * FROM jobs;
  ELSE
    RETURN QUERY
      SELECT * FROM jobs
      WHERE recruiter_id = optional_recruiter_id;
  END IF;
END;
