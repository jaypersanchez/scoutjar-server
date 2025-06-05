-- STEP 1: Check orphaned jobs with invalid recruiter IDs
SELECT * FROM jobs
WHERE recruiter_id NOT IN (SELECT user_id FROM talent_recruiters);

-- STEP 2: Optionally delete or fix orphaned job rows
-- DELETE FROM jobs
-- WHERE recruiter_id NOT IN (SELECT user_id FROM talent_recruiters);

-- STEP 3: Check orphaned job_applications with invalid job_id
SELECT * FROM job_applications
WHERE job_id NOT IN (SELECT job_id FROM jobs);

-- STEP 4: Check orphaned job_applications with invalid talent_id
SELECT * FROM job_applications
WHERE talent_id NOT IN (SELECT talent_id FROM talent_profiles);

-- STEP 5: Optionally delete orphaned job_applications (uncomment when verified)
-- DELETE FROM job_applications
-- WHERE job_id NOT IN (SELECT job_id FROM jobs)
--    OR talent_id NOT IN (SELECT talent_id FROM talent_profiles);

-- STEP 6: Ensure talent_recruiters.user_id is UNIQUE
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'talent_recruiters'
          AND constraint_type = 'UNIQUE'
          AND constraint_name = 'unique_talent_recruiter_user'
    ) THEN
        ALTER TABLE talent_recruiters
        ADD CONSTRAINT unique_talent_recruiter_user
        UNIQUE (user_id);
    END IF;
END$$;

-- STEP 7: Add FK constraint: jobs.recruiter_id → talent_recruiters.user_id
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'jobs'
          AND constraint_type = 'FOREIGN KEY'
          AND constraint_name = 'fk_jobs_recruiter'
    ) THEN
        ALTER TABLE jobs
        ADD CONSTRAINT fk_jobs_recruiter
        FOREIGN KEY (recruiter_id)
        REFERENCES talent_recruiters(user_id)
        ON DELETE CASCADE;
    END IF;
END$$;

-- STEP 8: Add FK constraint: job_applications.job_id → jobs.job_id
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'job_applications'
          AND constraint_type = 'FOREIGN KEY'
          AND constraint_name = 'fk_applications_job'
    ) THEN
        ALTER TABLE job_applications
        ADD CONSTRAINT fk_applications_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON DELETE CASCADE;
    END IF;
END$$;

-- STEP 9: Add FK constraint: job_applications.talent_id → talent_profiles.talent_id
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = 'job_applications'
          AND constraint_type = 'FOREIGN KEY'
          AND constraint_name = 'fk_applications_talent'
    ) THEN
        ALTER TABLE job_applications
        ADD CONSTRAINT fk_applications_talent
        FOREIGN KEY (talent_id)
        REFERENCES talent_profiles(talent_id)
        ON DELETE CASCADE;
    END IF;
END$$;

-- ✅ DONE: FK integrity and uniqueness are now enforced cleanly
