-- Table: public.locations

-- DROP TABLE IF EXISTS public.locations;

CREATE TABLE IF NOT EXISTS public.locations
(
    location_id integer NOT NULL DEFAULT nextval('locations_location_id_seq'::regclass),
    city character varying(100) COLLATE pg_catalog."default" NOT NULL,
    country character varying(100) COLLATE pg_catalog."default" NOT NULL,
    region character varying(100) COLLATE pg_catalog."default",
    country_code character varying(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT locations_pkey PRIMARY KEY (location_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.locations
    OWNER to postgres;