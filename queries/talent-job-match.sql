SELECT 
  t.*, 
  j.*
FROM talent_profiles t
JOIN jobs j ON (
    -- Match if the talent's skills (as a string) contain the job title or description
    array_to_string(t.skills, ' ') ILIKE '%' || j.job_title || '%'
    OR array_to_string(t.skills, ' ') ILIKE '%' || j.job_description || '%'
    -- Or if the talent's bio contains the job title or description
    OR t.bio ILIKE '%' || j.job_title || '%'
    OR t.bio ILIKE '%' || j.job_description || '%'
    -- Or if the talent's experience contains the job title or description
    OR t.experience ILIKE '%' || j.job_title || '%'
    OR t.experience ILIKE '%' || j.job_description || '%'
    -- Or if the talent's experience contains any of the job's required skills (as a string)
    OR t.experience ILIKE '%' || array_to_string(j.required_skills, ' ') || '%'
);
