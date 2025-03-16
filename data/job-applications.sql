-- Table: public.job_applications

-- DROP TABLE IF EXISTS public.job_applications;

CREATE TABLE IF NOT EXISTS public.job_applications
(
    application_id integer NOT NULL DEFAULT nextval('job_applications_application_id_seq'::regclass),
    talent_id integer,
    job_id integer,
    application_status character varying(50) COLLATE pg_catalog."default",
    application_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    recruiter_id integer,
    CONSTRAINT job_applications_pkey PRIMARY KEY (application_id),
    CONSTRAINT job_applications_job_id_fkey FOREIGN KEY (job_id)
        REFERENCES public.jobs (job_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT job_applications_recruiter_id_fkey FOREIGN KEY (recruiter_id)
        REFERENCES public.talent_recruiters (recruiter_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT job_applications_talent_id_fkey FOREIGN KEY (talent_id)
        REFERENCES public.talent_profiles (talent_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT job_applications_application_status_check CHECK (application_status::text = ANY (ARRAY['Pending'::character varying, 'Reviewed'::character varying, 'Shortlisted'::character varying, 'Rejected'::character varying, 'Hired'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.job_applications
    OWNER to postgres;