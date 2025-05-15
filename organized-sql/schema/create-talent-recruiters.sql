-- Table: public.talent_recruiters

-- DROP TABLE IF EXISTS public.talent_recruiters;

CREATE TABLE IF NOT EXISTS public.talent_recruiters
(
    recruiter_id integer NOT NULL DEFAULT nextval('talent_recruiters_recruiter_id_seq'::regclass),
    user_id integer,
    company_name character varying(255) COLLATE pg_catalog."default",
    company_website text COLLATE pg_catalog."default",
    industry character varying(100) COLLATE pg_catalog."default",
    company_logo text COLLATE pg_catalog."default",
    CONSTRAINT talent_recruiters_pkey PRIMARY KEY (recruiter_id),
    CONSTRAINT talent_recruiters_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user_profiles (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.talent_recruiters
    OWNER to postgres;