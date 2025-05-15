select user_id, talent_id, profile_mode from talent_profiles
select * from passive_preferences

ALTER TABLE talent_profiles
ADD COLUMN profile_mode VARCHAR(10) DEFAULT 'active';


CREATE TABLE IF NOT EXISTS passive_matches (
  id SERIAL PRIMARY KEY,
  talent_id INTEGER REFERENCES talent_profiles(talent_id) ON DELETE CASCADE,
  job_id INTEGER REFERENCES jobs(job_id) ON DELETE CASCADE,
  recruiter_id INTEGER,
  match_score INTEGER,
  created_at TIMESTAMP DEFAULT now(),
  UNIQUE (talent_id, job_id)
);
