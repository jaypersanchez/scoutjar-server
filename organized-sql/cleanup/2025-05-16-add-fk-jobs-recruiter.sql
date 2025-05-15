-- STEP X: Delete orphaned jobs where recruiter_id doesn't exist in talent_recruiters
DO $$
BEGIN
    -- Only delete if there are orphans
    IF EXISTS (
        SELECT 1
        FROM jobs
        WHERE recruiter_id NOT IN (SELECT user_id FROM talent_recruiters)
    ) THEN
        DELETE FROM jobs
        WHERE recruiter_id NOT IN (SELECT user_id FROM talent_recruiters);
    END IF;
END$$;
