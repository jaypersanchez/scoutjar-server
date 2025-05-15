-- ======================================================
-- Migration: Clean Orphaned Talent, Jobs, and Applications
-- Purpose: Ensure all talent_profiles and talent_recruiters
--          have valid user_profiles, jobs have valid recruiters,
--          and job_applications have valid references.
-- Author: Jayper Sanchez
-- Date: 2025-05-16
-- ======================================================

-- STEP 1: Delete orphaned talent_profiles (no matching user)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM talent_profiles tp
        LEFT JOIN user_profiles up ON tp.user_id = up.user_id
        WHERE up.user_id IS NULL
    ) THEN
        DELETE FROM talent_profiles
        WHERE user_id NOT IN (SELECT user_id FROM user_profiles);
    END IF;
END$$;

-- STEP 2: Delete orphaned talent_recruiters (no matching user)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM talent_recruiters tr
        LEFT JOIN user_profiles up ON tr.user_id = up.user_id
        WHERE up.user_id IS NULL
    ) THEN
        DELETE FROM talent_recruiters
        WHERE user_id NOT IN (SELECT user_id FROM user_profiles);
    END IF;
END$$;

-- STEP 3: Delete orphaned jobs (no matching recruiter)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM jobs j
        LEFT JOIN talent_recruiters tr ON j.recruiter_id = tr.user_id
        WHERE tr.user_id IS NULL
    ) THEN
        DELETE FROM jobs
        WHERE recruiter_id NOT IN (SELECT user_id FROM talent_recruiters);
    END IF;
END$$;

-- STEP 4: Delete orphaned job_applications with missing job
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM job_applications ja
        LEFT JOIN jobs j ON ja.job_id = j.job_id
        WHERE j.job_id IS NULL
    ) THEN
        DELETE FROM job_applications
        WHERE job_id NOT IN (SELECT job_id FROM jobs);
    END IF;
END$$;

-- STEP 5: Delete orphaned job_applications with missing talent
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM job_applications ja
        LEFT JOIN talent_profiles tp ON ja.talent_id = tp.talent_id
        WHERE tp.talent_id IS NULL
    ) THEN
        DELETE FROM job_applications
        WHERE talent_id NOT IN (SELECT talent_id FROM talent_profiles);
    END IF;
END$$;

-- STEP 6: Delete orphaned job_applications with missing recruiter
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM job_applications ja
        LEFT JOIN talent_recruiters tr ON ja.recruiter_id = tr.user_id
        WHERE tr.user_id IS NULL
    ) THEN
        DELETE FROM job_applications
        WHERE recruiter_id NOT IN (SELECT user_id FROM talent_recruiters);
    END IF;
END$$;

-- ✅ DONE: All orphaned records removed safely across talent, jobs, and applications
