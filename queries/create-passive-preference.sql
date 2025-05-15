CREATE TABLE IF NOT EXISTS passive_preferences (
    talent_id INTEGER PRIMARY KEY REFERENCES talent_profiles(talent_id) ON DELETE CASCADE,
    salary_min NUMERIC,
    salary_max NUMERIC,
    dream_companies TEXT[],
    match_threshold INTEGER DEFAULT 80,
    remote_preference BOOLEAN DEFAULT TRUE,
    preferred_industries TEXT[],
    preferred_roles TEXT[],
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);