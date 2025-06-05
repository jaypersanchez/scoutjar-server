CREATE OR REPLACE FUNCTION add_shortlisted_candidate(
    p_recruiter_id INTEGER,
    p_talent_id INTEGER,
    p_job_id INTEGER
)
RETURNS INTEGER AS $$
DECLARE
    v_shortlist_id INTEGER;
BEGIN
    INSERT INTO public.shortlisted_candidates (recruiter_id, talent_id, job_id)
    VALUES (p_recruiter_id, p_talent_id, p_job_id)
    RETURNING shortlist_id INTO v_shortlist_id;
    
    RETURN v_shortlist_id;
EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error adding shortlisted candidate: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;
