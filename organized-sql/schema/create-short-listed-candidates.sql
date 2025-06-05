-- Table: public.shortlisted_candidates

-- DROP TABLE IF EXISTS public.shortlisted_candidates;

CREATE TABLE IF NOT EXISTS public.shortlisted_candidates
(
    shortlist_id integer NOT NULL DEFAULT nextval('shortlisted_candidates_shortlist_id_seq'::regclass),
    recruiter_id integer,
    talent_id integer,
    job_id integer,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT shortlisted_candidates_pkey PRIMARY KEY (shortlist_id),
    CONSTRAINT shortlisted_candidates_job_id_fkey FOREIGN KEY (job_id)
        REFERENCES public.jobs (job_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT shortlisted_candidates_recruiter_id_fkey FOREIGN KEY (recruiter_id)
        REFERENCES public.talent_recruiters (recruiter_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT shortlisted_candidates_talent_id_fkey FOREIGN KEY (talent_id)
        REFERENCES public.talent_profiles (talent_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.shortlisted_candidates
    OWNER to postgres;