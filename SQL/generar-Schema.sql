-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Permiso"
(
    "idPermiso" integer NOT NULL DEFAULT nextval('"Permiso_idPermiso_seq"'::regclass),
    "nombrePermiso" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Permiso_pkey" PRIMARY KEY ("idPermiso")
);

CREATE TABLE IF NOT EXISTS public."Persona"
(
    "idPersona" integer NOT NULL DEFAULT nextval('"Persona_idPersona_seq"'::regclass),
    "Nombre" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "Apellido" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "Documento" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "Direccion" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Persona_pkey" PRIMARY KEY ("idPersona")
);

CREATE TABLE IF NOT EXISTS public."Rol"
(
    "idRol" integer NOT NULL DEFAULT nextval('"Rol_idRol_seq"'::regclass),
    "nombreRol" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Rol_pkey" PRIMARY KEY ("idRol")
);

CREATE TABLE IF NOT EXISTS public."Rol_Permiso"
(
    "Rol_idRol" integer NOT NULL DEFAULT nextval('"Rol_Permiso_Rol_idRol_seq"'::regclass),
    "Permiso_idPermiso" integer NOT NULL DEFAULT nextval('"Rol_Permiso_Permiso_idPermiso_seq"'::regclass)
);

CREATE TABLE IF NOT EXISTS public."Usuario"
(
    "Correo" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "Contraseña" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "idPersona" integer NOT NULL,
    "idRol" integer NOT NULL,
    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Correo")
);

ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Permiso_idPermiso_fkey" FOREIGN KEY ("Permiso_idPermiso")
    REFERENCES public."Permiso" ("idPermiso") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Permiso_idPermiso_fkey1" FOREIGN KEY ("Permiso_idPermiso")
    REFERENCES public."Permiso" ("idPermiso") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Permiso_idPermiso_fkey2" FOREIGN KEY ("Permiso_idPermiso")
    REFERENCES public."Permiso" ("idPermiso") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Permiso_idPermiso_fkey3" FOREIGN KEY ("Permiso_idPermiso")
    REFERENCES public."Permiso" ("idPermiso") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Rol_idRol_fkey" FOREIGN KEY ("Rol_idRol")
    REFERENCES public."Rol" ("idRol") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Rol_idRol_fkey1" FOREIGN KEY ("Rol_idRol")
    REFERENCES public."Rol" ("idRol") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Rol_idRol_fkey2" FOREIGN KEY ("Rol_idRol")
    REFERENCES public."Rol" ("idRol") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Rol_Permiso"
    ADD CONSTRAINT "Rol_Permiso_Rol_idRol_fkey3" FOREIGN KEY ("Rol_idRol")
    REFERENCES public."Rol" ("idRol") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "Rol_idRol_fkey" FOREIGN KEY ("idRol")
    REFERENCES public."Rol" ("idRol") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "Usuario_idPersona_fkey" FOREIGN KEY ("idPersona")
    REFERENCES public."Persona" ("idPersona") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "Usuario_idPersona_fkey1" FOREIGN KEY ("idPersona")
    REFERENCES public."Persona" ("idPersona") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "Usuario_idPersona_fkey2" FOREIGN KEY ("idPersona")
    REFERENCES public."Persona" ("idPersona") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Usuario"
    ADD CONSTRAINT "Usuario_idPersona_fkey3" FOREIGN KEY ("idPersona")
    REFERENCES public."Persona" ("idPersona") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;