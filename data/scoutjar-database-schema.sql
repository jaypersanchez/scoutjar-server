-- User Profiles Table (Common for Talents and Talent Recruiters)
CREATE TABLE user_profiles (
    user_id SERIAL PRIMARY KEY,
    oauth_provider VARCHAR(50) CHECK (oauth_provider IN ('LinkedIn', 'Google', 'X', 'Instagram')),
    oauth_provider_id VARCHAR(255) UNIQUE NOT NULL,  -- Unique ID from OAuth provider
    email VARCHAR(255) UNIQUE,  -- Email may not always be available
    full_name VARCHAR(255),
    profile_picture TEXT,  -- URL to profile picture
    social_profile_url TEXT,  -- URL to LinkedIn/X/Instagram profile
    user_type VARCHAR(50) CHECK (user_type IN ('Talent', 'Scout'))
);

CREATE TABLE talent_profiles (
    talent_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user_profiles(user_id) ON DELETE CASCADE,
    resume TEXT,
    bio TEXT,
    skills TEXT[],
    experience TEXT,
    education TEXT,
    work_preferences JSONB,  -- Remote, Hybrid, Onsite preferences
    desired_salary NUMERIC(10,2),
    location TEXT,
    job_alerts_enabled BOOLEAN DEFAULT TRUE
);

-- Talent Recruiter Profile
CREATE TABLE talent_recruiters (
    recruiter_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user_profiles(user_id) ON DELETE CASCADE,
    company_name VARCHAR(255),
    company_website TEXT,
    industry VARCHAR(100),
    company_logo TEXT
)type IN ('talent', 'talent_recruiter')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP




-- Jobs Table
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    recruiter_id INT REFERENCES talent_recruiters(recruiter_id) ON DELETE CASCADE,
    job_title VARCHAR(255) NOT NULL,
    job_description TEXT NOT NULL,
    required_skills TEXT[],
    experience_level VARCHAR(100),
    employment_type VARCHAR(100) CHECK (employment_type IN ('Full-time', 'Part-time', 'Contract', 'Freelance', 'Internship')),
    salary_range NUMERIC(10,2)[],
    work_mode VARCHAR(50) CHECK (work_mode IN ('Remote', 'Hybrid', 'Onsite')),
    location TEXT,
    date_posted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Job Applications Table
CREATE TABLE job_applications (
    application_id SERIAL PRIMARY KEY,
    talent_id INT REFERENCES talent_profiles(talent_id) ON DELETE CASCADE,
    job_id INT REFERENCES jobs(job_id) ON DELETE CASCADE,
    application_status VARCHAR(50) CHECK (application_status IN ('Pending', 'Reviewed', 'Shortlisted', 'Rejected', 'Hired')),
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Recruiter Shortlist Table
CREATE TABLE shortlisted_candidates (
    shortlist_id SERIAL PRIMARY KEY,
    recruiter_id INT REFERENCES talent_recruiters(recruiter_id) ON DELETE CASCADE,
    talent_id INT REFERENCES talent_profiles(talent_id) ON DELETE CASCADE,
    job_id INT REFERENCES jobs(job_id) ON DELETE CASCADE,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    region VARCHAR(100) NULL,  -- State/Province (for Canada & US)
    country_code VARCHAR(3) NOT NULL  -- Standard ISO Alpha-3 codes (e.g., USA, CAN, FRA)
);

-- Notifications Table (for Job Alerts & Application Updates)
CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user_profiles(user_id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AI Job Match Scores Table
CREATE TABLE job_match_scores (
    match_id SERIAL PRIMARY KEY,
    talent_id INT REFERENCES talent_profiles(talent_id) ON DELETE CASCADE,
    job_id INT REFERENCES jobs(job_id) ON DELETE CASCADE,
    match_score NUMERIC(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Search Filters Table (for storing user preferences)
CREATE TABLE search_filters (
    filter_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user_profiles(user_id) ON DELETE CASCADE,
    filters JSONB  -- Stores criteria like location, salary, work mode, industry, etc.
);

CREATE TABLE skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL
);