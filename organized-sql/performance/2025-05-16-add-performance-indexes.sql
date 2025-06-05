CREATE INDEX idx_user_credentials_email ON user_credentials(email);
CREATE INDEX idx_talent_profiles_location ON talent_profiles(location);
CREATE INDEX idx_user_profiles_full_name ON user_profiles(full_name);
CREATE INDEX idx_jobs_recruiter_id ON jobs(recruiter_id);
CREATE UNIQUE INDEX idx_jobs_job_id ON jobs(job_id);
CREATE INDEX idx_talent_profiles_skills ON talent_profiles(skills);
CREATE INDEX idx_talent_profiles_skills_jsonb ON talent_profiles USING gin(skills);
CREATE INDEX idx_applications_job_id ON job_applications(job_id);
CREATE INDEX idx_applications_talent_id ON job_applications(talent_id);
CREATE INDEX idx_applications_recruiter_id ON job_applications(recruiter_id);
CREATE INDEX idx_jobs_created_at ON jobs(created_at);
CREATE INDEX idx_job_applications_created_at ON job_applications(created_at);

