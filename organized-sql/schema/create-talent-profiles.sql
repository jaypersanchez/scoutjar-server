-- Table: public.talent_profiles

-- DROP TABLE IF EXISTS public.talent_profiles;

CREATE TABLE IF NOT EXISTS public.talent_profiles
(
    talent_id integer NOT NULL DEFAULT nextval('talent_profiles_talent_id_seq'::regclass),
    user_id integer,
    resume text COLLATE pg_catalog."default",
    bio text COLLATE pg_catalog."default",
    skills text[] COLLATE pg_catalog."default",
    experience text COLLATE pg_catalog."default",
    education text COLLATE pg_catalog."default",
    work_preferences jsonb,
    desired_salary numeric(10,2),
    location text COLLATE pg_catalog."default",
    job_alerts_enabled boolean DEFAULT true,
    availability character varying(50) COLLATE pg_catalog."default",
    available_from date,
    time_availability jsonb DEFAULT '{}'::jsonb,
    requires_two_weeks_notice boolean DEFAULT false,
    CONSTRAINT talent_profiles_pkey PRIMARY KEY (talent_id),
    CONSTRAINT talent_profiles_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user_profiles (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT talent_profiles_availability_check CHECK (availability::text = ANY (ARRAY['Immediate'::character varying, 'Two Weeks Notice'::character varying, '1 Month'::character varying, '3 Months'::character varying, 'Not Available'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.talent_profiles
    OWNER to postgres;