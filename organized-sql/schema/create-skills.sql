-- Table: public.skills

-- DROP TABLE IF EXISTS public.skills;

CREATE TABLE IF NOT EXISTS public.skills
(
    skill_id integer NOT NULL DEFAULT nextval('skills_skill_id_seq'::regclass),
    skill_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    category character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT skills_pkey PRIMARY KEY (skill_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.skills
    OWNER to postgres;