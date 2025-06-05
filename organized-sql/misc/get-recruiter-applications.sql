CREATE OR REPLACE FUNCTION get_recruiter_applications(p_recruiter_id integer)
RETURNS TABLE(
    application_id integer,
    talent_id integer,
    job_id integer,
    application_status character varying(50),
    application_date timestamp without time zone,
    recruiter_id integer,
    job_title character varying(255),
    job_description text,
    user_id integer,
    bio text,
    skills text[],
    email character varying(255),
    full_name character varying(255),
    social_profile_url text
)
AS $$
    SELECT 
        ja.application_id,
        ja.talent_id,
        ja.job_id,
        ja.application_status,
        ja.application_date,
        ja.recruiter_id,
        j.job_title,
        j.job_description,
        tp.user_id,
        tp.bio,
        tp.skills,
        up.email,
        up.full_name,
        up.social_profile_url
    FROM job_applications AS ja
    JOIN jobs AS j ON ja.job_id = j.job_id
    JOIN talent_profiles AS tp ON ja.talent_id = tp.talent_id
    JOIN user_profiles AS up ON tp.user_id = up.user_id
    WHERE ja.recruiter_id = p_recruiter_id;
$$ LANGUAGE sql;
