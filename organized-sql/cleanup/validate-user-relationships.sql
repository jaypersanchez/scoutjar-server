-- ========================================
-- INTEGRITY CHECK: USER PROFILE RELATIONSHIPS
-- ========================================

-- 1. Orphan user_profiles (not talent, not recruiter)
-- These users have no corresponding talent or recruiter profile
SELECT 'Orphan UserProfiles' AS issue, u.*
FROM user_profiles u
WHERE NOT EXISTS (
    SELECT 1 FROM talent_profiles t WHERE t.user_id = u.user_id
)
AND NOT EXISTS (
    SELECT 1 FROM talent_recruiters r WHERE r.user_id = u.user_id
);

-- ========================================
-- 2. Talent profiles without credentials
-- These users may be incomplete or broken sign-ups
SELECT 'Talent Without Credentials' AS issue, tp.*
FROM talent_profiles tp
WHERE NOT EXISTS (
    SELECT 1 FROM user_credentials uc WHERE uc.user_id = tp.user_id
);

-- ========================================
-- 3. Users with both talent and recruiter roles
-- This violates the business rule: one user can only be one role
SELECT 'User in Both Talent and Recruiter' AS issue, u.*
FROM user_profiles u
WHERE EXISTS (
    SELECT 1 FROM talent_profiles t WHERE t.user_id = u.user_id
)
AND EXISTS (
    SELECT 1 FROM talent_recruiters r WHERE r.user_id = u.user_id
);