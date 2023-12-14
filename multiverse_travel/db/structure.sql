--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg120+1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migration_versions (
    id integer NOT NULL,
    version character varying(17) NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO root;

--
-- Name: migration_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migration_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migration_versions_id_seq OWNER TO root;

--
-- Name: migration_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migration_versions_id_seq OWNED BY public.migration_versions.id;


--
-- Name: travel_stops; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.travel_stops (
    id integer NOT NULL,
    travel_stops integer[] NOT NULL
);


ALTER TABLE public.travel_stops OWNER TO root;

--
-- Name: travel_stops_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.travel_stops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.travel_stops_id_seq OWNER TO root;

--
-- Name: travel_stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.travel_stops_id_seq OWNED BY public.travel_stops.id;


--
-- Name: migration_versions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migration_versions ALTER COLUMN id SET DEFAULT nextval('public.migration_versions_id_seq'::regclass);


--
-- Name: travel_stops id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.travel_stops ALTER COLUMN id SET DEFAULT nextval('public.travel_stops_id_seq'::regclass);


--
-- Name: migration_versions migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (id);


--
-- Name: travel_stops travel_stops_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.travel_stops
    ADD CONSTRAINT travel_stops_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

