
CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);



CREATE TABLE heroes (
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


CREATE SEQUENCE heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE players (
    id integer NOT NULL,
    email character varying,
    username character varying,
    first_name character varying,
    last_name character varying,
    hashed_password character varying,
    is_active boolean,
    role character varying
);


CREATE SEQUENCE players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





COPY heroes (id, nick_name, full_name, occupation, powers, hobby, type, rank, owner_id) FROM stdin;
8	Percy	JOSEE	{wizard,Adventurer,Deity}	{"Magical promess","High intelligence",Charisma}	{"Studying magic",Drinking,Cooking}	Studying magic	63	\N
11	Percy	patrick	{wizard,Adventurer,Deity}	{"Magical promess","High intelligence",Charisma}	{"Studying magic",Drinking,Cooking}	Studying magic	63	13
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: nono
--

COPY players (id, email, username, first_name, last_name, hashed_password, is_active, role) FROM stdin;
8	player2@exemple.com	thechampion2	Alex	Storm	$2b$12$EWp2OpdxSrgWmibuKgm/DOYOdhBPX8xZzIJ5IWeBEqmJ3LBB72aM2	t	controller
9	xplayer@exemple.com	champion1	NAlex	Storm	$2b$12$ynJfTw1nKD4FcgOlnsOikuf8mLx9P2GFY4d0fKTQStb3cpV2X7v4y	t	controller
11	nono@exemple.com	nono	Alex	Storm	$2b$12$FP07dYUlEbBIqiC48rxB4.jP2G.kIRAbH5n/91NVLfQ92tLFz2ItG	t	controller
12	nini@exemple.com	nini	Alex	Storm	$2b$12$t.Rff7NzXL9r5QS4TmxkjeZvJfgO8eXM7U3xuURaKE73.JoEn8YAC	t	controller
13	nono@gmail.com	nono	nono	nono	$2b$12$DwrPvWVd2Y72/7RVFf72Hu6hkW8dg0uZCo21h3JX2ns05YlLYx52W	t	nono
14	Patrick@exemple.com	Patrick1	Patrick	Storm	$2b$12$e0btuA4VuNI.M1TSGvfrlujkz2.Zfc.cVF6l3w62IzeT6/Smhti3m	t	controller
\.



CREATE INDEX ix_heroes_id ON heroes USING btree (id);


--
-- Name: ix_players_id; Type: INDEX; Schema: public; Owner: nono
--

CREATE INDEX ix_players_id ON players USING btree (id);


--
-- Name: heroes fk_heroes_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: nono
--

ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT fk_heroes_owner_id FOREIGN KEY (owner_id) REFERENCES players(id);


--
-- PostgreSQL database dump complete
--

