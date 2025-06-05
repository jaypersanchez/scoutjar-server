-- Table: public.job_match_scores

-- DROP TABLE IF EXISTS public.job_match_scores;

CREATE TABLE IF NOT EXISTS public.job_match_scores
(
    match_id integer NOT NULL DEFAULT nextval('job_match_scores_match_id_seq'::regclass),
    talent_id integer,
    job_id integer,
    match_score numeric(5,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT job_match_scores_pkey PRIMARY KEY (match_id),
    CONSTRAINT job_match_scores_job_id_fkey FOREIGN KEY (job_id)
        REFERENCES public.jobs (job_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT job_match_scores_talent_id_fkey FOREIGN KEY (talent_id)
        REFERENCES public.talent_profiles (talent_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.job_match_scores
    OWNER to postgres;