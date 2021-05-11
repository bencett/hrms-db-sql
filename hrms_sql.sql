-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.activation_code_candidates
(
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.activation_code_employers
(
    id integer NOT NULL,
    employer_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.activation_codes
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    activation_code text NOT NULL,
    is_confirmed boolean NOT NULL,
    confirm_date date,
    PRIMARY KEY (id)
);

CREATE TABLE public.candidates
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(30) NOT NULL,
    national_identity character varying(11) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employees
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers_activation_by_employees
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    employee_id integer NOT NULL,
    is_confirmed boolean NOT NULL,
    confirmed_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_positions
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "position" character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(30) NOT NULL,
    password character varying(20) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.activation_code_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.activation_code_candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.activation_codes (id)
    NOT VALID;


ALTER TABLE public.activation_code_employers
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.activation_code_employers
    ADD FOREIGN KEY (id)
    REFERENCES public.activation_codes (id)
    NOT VALID;


ALTER TABLE public.candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers_activation_by_employees
    ADD FOREIGN KEY (employee_id)
    REFERENCES public.employees (id)
    NOT VALID;


ALTER TABLE public.employers_activation_by_employees
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.job_positions
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;

END;