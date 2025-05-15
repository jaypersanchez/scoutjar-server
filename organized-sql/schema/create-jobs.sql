-- Table: public.jobs

-- DROP TABLE IF EXISTS public.jobs;

CREATE TABLE IF NOT EXISTS public.jobs
(
    job_id integer NOT NULL DEFAULT nextval('jobs_job_id_seq'::regclass),
    recruiter_id integer,
    job_title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    job_description text COLLATE pg_catalog."default" NOT NULL,
    required_skills text[] COLLATE pg_catalog."default",
    experience_level character varying(100) COLLATE pg_catalog."default",
    employment_type character varying(100) COLLATE pg_catalog."default",
    salary_range numeric(10,2)[],
    work_mode character varying(50) COLLATE pg_catalog."default",
    location text COLLATE pg_catalog."default",
    date_posted timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT jobs_pkey PRIMARY KEY (job_id),
    CONSTRAINT jobs_recruiter_id_fkey FOREIGN KEY (recruiter_id)
        REFERENCES public.talent_recruiters (recruiter_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT jobs_employment_type_check CHECK (employment_type::text = ANY (ARRAY['Full-time'::character varying, 'Part-time'::character varying, 'Contract'::character varying, 'Freelance'::character varying, 'Internship'::character varying]::text[])),
    CONSTRAINT jobs_work_mode_check CHECK (work_mode::text = ANY (ARRAY['Remote'::character varying, 'Hybrid'::character varying, 'Onsite'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.jobs
    OWNER to postgres;