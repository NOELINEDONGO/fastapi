--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: nono
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO nono;

--
-- Name: heroes; Type: TABLE; Schema: public; Owner: nono
--

CREATE TABLE public.heroes (
    id integer NOT NULL,
    nick_name character varying,
    full_name character varying,
    occupation character varying[],
    powers character varying[],
    hobby character varying[],
    type character varying,
    rank integer,
    owner_id integer
);


ALTER TABLE public.heroes OWNER TO nono;

--
-- Name: heroes_id_seq; Type: SEQUENCE; Schema: public; Owner: nono
--

CREATE SEQUENCE public.heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.heroes_id_seq OWNER TO nono;

--
-- Name: heroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nono
--

ALTER SEQUENCE public.heroes_id_seq OWNED BY public.heroes.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: nono
--

CREATE TABLE public.players (
    id integer NOT NULL,
    email character varying,
    username character varying,
    first_name character varying,
    last_name character varying,
    hashed_password character varying,
    is_active boolean,
    role character varying
);


ALTER TABLE public.players OWNER TO nono;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: nono
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_id_seq OWNER TO nono;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nono
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: heroes id; Type: DEFAULT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.heroes ALTER COLUMN id SET DEFAULT nextval('public.heroes_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: nono
--

COPY public.alembic_version (version_num) FROM stdin;
66e88c1859a7
\.


--
-- Data for Name: heroes; Type: TABLE DATA; Schema: public; Owner: nono
--

COPY public.heroes (id, nick_name, full_name, occupation, powers, hobby, type, rank, owner_id) FROM stdin;
8	Percy	JOSEE	{wizard,Adventurer,Deity}	{"Magical promess","High intelligence",Charisma}	{"Studying magic",Drinking,Cooking}	Studying magic	63	\N
11	Percy	patrick	{wizard,Adventurer,Deity}	{"Magical promess","High intelligence",Charisma}	{"Studying magic",Drinking,Cooking}	Studying magic	63	13
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: nono
--

COPY public.players (id, email, username, first_name, last_name, hashed_password, is_active, role) FROM stdin;
8	player2@exemple.com	thechampion2	Alex	Storm	$2b$12$EWp2OpdxSrgWmibuKgm/DOYOdhBPX8xZzIJ5IWeBEqmJ3LBB72aM2	t	controller
9	xplayer@exemple.com	champion1	NAlex	Storm	$2b$12$ynJfTw1nKD4FcgOlnsOikuf8mLx9P2GFY4d0fKTQStb3cpV2X7v4y	t	controller
11	nono@exemple.com	nono	Alex	Storm	$2b$12$FP07dYUlEbBIqiC48rxB4.jP2G.kIRAbH5n/91NVLfQ92tLFz2ItG	t	controller
12	nini@exemple.com	nini	Alex	Storm	$2b$12$t.Rff7NzXL9r5QS4TmxkjeZvJfgO8eXM7U3xuURaKE73.JoEn8YAC	t	controller
13	nono@gmail.com	nono	nono	nono	$2b$12$DwrPvWVd2Y72/7RVFf72Hu6hkW8dg0uZCo21h3JX2ns05YlLYx52W	t	nono
14	Patrick@exemple.com	Patrick1	Patrick	Storm	$2b$12$e0btuA4VuNI.M1TSGvfrlujkz2.Zfc.cVF6l3w62IzeT6/Smhti3m	t	controller
\.


--
-- Name: heroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nono
--

SELECT pg_catalog.setval('public.heroes_id_seq', 11, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nono
--

SELECT pg_catalog.setval('public.players_id_seq', 14, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: heroes heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_pkey PRIMARY KEY (id);


--
-- Name: players players_email_key; Type: CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_email_key UNIQUE (email);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: ix_heroes_id; Type: INDEX; Schema: public; Owner: nono
--

CREATE INDEX ix_heroes_id ON public.heroes USING btree (id);


--
-- Name: ix_players_id; Type: INDEX; Schema: public; Owner: nono
--

CREATE INDEX ix_players_id ON public.players USING btree (id);


--
-- Name: heroes fk_heroes_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT fk_heroes_owner_id FOREIGN KEY (owner_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--

