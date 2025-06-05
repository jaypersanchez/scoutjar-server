-- Drop the old (incorrect) constraint
ALTER TABLE jobs DROP CONSTRAINT IF EXISTS fk_jobs_recruiter;

-- Add the correct foreign key constraint
ALTER TABLE jobs
ADD CONSTRAINT fk_jobs_recruiter
FOREIGN KEY (recruiter_id)
REFERENCES talent_recruiters(recruiter_id)
ON DELETE SET NULL;

SELECT conname, confrelid::regclass AS referenced_table
FROM pg_constraint
WHERE conrelid = 'jobs'::regclass
  AND contype = 'f';
