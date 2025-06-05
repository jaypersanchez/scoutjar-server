SELECT 
    tr.recruiter_id,
    tr.user_id,
    tr.company_name,
    tr.company_website,
    tr.industry,
    tr.company_logo,
    up.oauth_provider,
    up.oauth_provider_id,
    up.email,
    up.full_name,
    up.profile_picture,
    up.social_profile_url,
    up.user_type,
    up.created_at
FROM talent_recruiters tr
JOIN user_profiles up ON tr.user_id = up.user_id
WHERE up.user_type = 'talent_recruiter'
  AND tr.recruiter_id = 2;
  
UPDATE talent_recruiters
SET company_name = 'Virlanchainworks',
    company_website = 'https://www.virlanchainworks.ai'
WHERE recruiter_id = 2;

UPDATE user_profiles
SET email = 'virlan@virlanchainworks.ai',
    full_name = 'Joy Obispo'
WHERE user_id = (
  SELECT user_id
  FROM talent_recruiters
  WHERE recruiter_id = 2
);
