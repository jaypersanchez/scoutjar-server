-- Table: public.user_profiles

-- DROP TABLE IF EXISTS public.user_profiles;

CREATE TABLE IF NOT EXISTS public.user_profiles
(
    user_id integer NOT NULL DEFAULT nextval('user_profiles_user_id_seq'::regclass),
    oauth_provider character varying(50) COLLATE pg_catalog."default",
    oauth_provider_id character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    full_name character varying(255) COLLATE pg_catalog."default",
    profile_picture text COLLATE pg_catalog."default",
    social_profile_url text COLLATE pg_catalog."default",
    user_type character varying(50) COLLATE pg_catalog."default",
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id),
    CONSTRAINT user_profiles_email_key UNIQUE (email),
    CONSTRAINT user_profiles_oauth_provider_id_key UNIQUE (oauth_provider_id),
    CONSTRAINT user_profiles_oauth_provider_check CHECK (oauth_provider::text = ANY (ARRAY['LinkedIn'::character varying, 'Google'::character varying, 'X'::character varying, 'Instagram'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_profiles
    OWNER to postgres;