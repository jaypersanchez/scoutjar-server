SELECT 
talent_id, 
user_id, 
resume, 
bio, 
skills, 
experience, 
education, 
work_preferences, 
desired_salary, 
location, 
availability, 
available_from, 
requires_two_weeks_notice 
FROM 
	public.talent_profiles 
WHERE 
	desired_salary >= 85000 AND (desired_salary <= 90000 OR 90000 IS NULL) 
	AND skills && ARRAY['Javascript', 'MongoDB'] 
ORDER BY 
	talent_id;
