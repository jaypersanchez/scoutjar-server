SELECT 
    tr.user_id,
	tr.recruiter_id,
	up.email,
    up.full_name,
    tr.company_name,
    tr.company_website,
    tr.industry,
    tr.company_logo,
    up.oauth_provider,
    up.oauth_provider_id,
    up.profile_picture,
    up.social_profile_url,
    up.user_type,
    up.created_at
FROM talent_recruiters tr
JOIN user_profiles up ON tr.user_id = up.user_id