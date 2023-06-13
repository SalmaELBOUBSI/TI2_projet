--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2023-05-06 18:33:42

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 223 (class 1255 OID 41345)
-- Name: isadmin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.isadmin(text, text) RETURNS boolean
    LANGUAGE plpgsql
    AS '
    declare login alias for $1;
    declare p_password alias for $2;
    declare id integer;
    declare retour boolean;

    begin
        select into id id_admin from admin where nom_admin = login and psw = p_password;
        if not found then
            retour = false;
        else
            retour = true;
        end if;
        return retour;
        end;
    
';


--
-- TOC entry 224 (class 1255 OID 41346)
-- Name: verifier_connexion(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_connexion(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_login alias for $1;
	declare f_password alias for $2;
	declare id integer;
	declare retour integer;
begin
	select into id id_admin from admin where nom_admin=f_login and psw=f_password;
	if not found
	then
	  retour=0;
	else
	  retour=1;
	end if;
	return retour;
end;
';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 41287)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom_admin text NOT NULL,
    psw text NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 41286)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 213
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 216 (class 1259 OID 41296)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom_client text NOT NULL,
    mdp text NOT NULL,
    mail_client text NOT NULL,
    id_ville integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 41295)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 215
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 210 (class 1259 OID 41264)
-- Name: pays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pays (
    id_pays integer NOT NULL,
    nom_pays text NOT NULL,
    image_pays text
);


--
-- TOC entry 209 (class 1259 OID 41263)
-- Name: pays_id_pays_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pays_id_pays_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 209
-- Name: pays_id_pays_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pays_id_pays_seq OWNED BY public.pays.id_pays;


--
-- TOC entry 220 (class 1259 OID 41324)
-- Name: reservation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservation (
    id_reservation integer NOT NULL,
    total double precision NOT NULL,
    prix double precision NOT NULL,
    id_voyage integer NOT NULL,
    id_client integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 41323)
-- Name: reservation_id_reservation_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservation_id_reservation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservation_id_reservation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservation_id_reservation_seq OWNED BY public.reservation.id_reservation;


--
-- TOC entry 212 (class 1259 OID 41273)
-- Name: villes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.villes (
    id_ville integer NOT NULL,
    nom_ville text NOT NULL,
    image_ville text,
    id_pays integer NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 41272)
-- Name: villes_id_ville_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.villes_id_ville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 211
-- Name: villes_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.villes_id_ville_seq OWNED BY public.villes.id_ville;


--
-- TOC entry 218 (class 1259 OID 41310)
-- Name: voyage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voyage (
    id_voyage integer NOT NULL,
    nom_voyage text NOT NULL,
    description text NOT NULL,
    prix double precision NOT NULL,
    image text,
    nbr_jours integer NOT NULL,
    id_ville integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 41309)
-- Name: voyage_id_voyage_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voyage_id_voyage_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 217
-- Name: voyage_id_voyage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voyage_id_voyage_seq OWNED BY public.voyage.id_voyage;


--
-- TOC entry 222 (class 1259 OID 41347)
-- Name: vue_villes; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_villes AS
 SELECT villes.id_ville,
    villes.nom_ville,
    pays.id_pays,
    pays.nom_pays
   FROM public.villes,
    public.pays
  WHERE (villes.id_pays = pays.id_pays);


--
-- TOC entry 221 (class 1259 OID 41341)
-- Name: vue_voyage; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_voyage AS
 SELECT voyage.id_voyage,
    voyage.nom_voyage,
    voyage.description,
    voyage.prix,
    voyage.nbr_jours,
    villes.id_ville,
    villes.nom_ville
   FROM public.voyage,
    public.villes
  WHERE (voyage.id_ville = villes.id_ville);


--
-- TOC entry 3201 (class 2604 OID 41290)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 41299)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 41267)
-- Name: pays id_pays; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pays ALTER COLUMN id_pays SET DEFAULT nextval('public.pays_id_pays_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 41327)
-- Name: reservation id_reservation; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id_reservation SET DEFAULT nextval('public.reservation_id_reservation_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 41276)
-- Name: villes id_ville; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villes ALTER COLUMN id_ville SET DEFAULT nextval('public.villes_id_ville_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 41313)
-- Name: voyage id_voyage; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voyage ALTER COLUMN id_voyage SET DEFAULT nextval('public.voyage_id_voyage_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 41287)
-- Dependencies: 214
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, nom_admin, psw) VALUES (1, 'salma', '123456');


--
-- TOC entry 3370 (class 0 OID 41296)
-- Dependencies: 216
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom_client, mdp, mail_client, id_ville) VALUES (1, 'Lola', '987654', 'lola@client.com', 3);


--
-- TOC entry 3364 (class 0 OID 41264)
-- Dependencies: 210
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pays (id_pays, nom_pays, image_pays) VALUES (1, 'Belgique', NULL);
INSERT INTO public.pays (id_pays, nom_pays, image_pays) VALUES (2, 'France', NULL);
INSERT INTO public.pays (id_pays, nom_pays, image_pays) VALUES (3, 'Espagne', NULL);
INSERT INTO public.pays (id_pays, nom_pays, image_pays) VALUES (4, 'Italie', NULL);
INSERT INTO public.pays (id_pays, nom_pays, image_pays) VALUES (5, 'Pays-Bas', NULL);
INSERT INTO public.pays (id_pays, nom_pays, image_pays) VALUES (6, 'Allemagne', NULL);


--
-- TOC entry 3374 (class 0 OID 41324)
-- Dependencies: 220
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3366 (class 0 OID 41273)
-- Dependencies: 212
-- Data for Name: villes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.villes (id_ville, nom_ville, image_ville, id_pays) VALUES (1, 'Bruxelles', NULL, 1);
INSERT INTO public.villes (id_ville, nom_ville, image_ville, id_pays) VALUES (2, 'Paris', NULL, 2);
INSERT INTO public.villes (id_ville, nom_ville, image_ville, id_pays) VALUES (3, 'Madrid', NULL, 3);
INSERT INTO public.villes (id_ville, nom_ville, image_ville, id_pays) VALUES (4, 'Rome', NULL, 4);
INSERT INTO public.villes (id_ville, nom_ville, image_ville, id_pays) VALUES (5, 'Amsterdam', NULL, 5);
INSERT INTO public.villes (id_ville, nom_ville, image_ville, id_pays) VALUES (6, 'Berlin', NULL, 6);


--
-- TOC entry 3372 (class 0 OID 41310)
-- Dependencies: 218
-- Data for Name: voyage; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.voyage (id_voyage, nom_voyage, description, prix, image, nbr_jours, id_ville) VALUES (1, 'Bruxelles au chocolat', 'Capitale de la belgique et du chocolat', 120, NULL, 4, 1);
INSERT INTO public.voyage (id_voyage, nom_voyage, description, prix, image, nbr_jours, id_ville) VALUES (2, 'Paris et amour', 'Découvre Paris et son amour pour le tourisme ', 250, NULL, 6, 2);
INSERT INTO public.voyage (id_voyage, nom_voyage, description, prix, image, nbr_jours, id_ville) VALUES (3, 'Madrir en folie', 'Fais la fete dans la ville de la folie', 480.9, NULL, 10, 3);
INSERT INTO public.voyage (id_voyage, nom_voyage, description, prix, image, nbr_jours, id_ville) VALUES (4, 'Rome et le monde de la mode', 'Défile et montre ton style du tourisme', 780.7, NULL, 10, 4);
INSERT INTO public.voyage (id_voyage, nom_voyage, description, prix, image, nbr_jours, id_ville) VALUES (5, 'Amsterdam a vélo', 'Déplace toi comme tu veux dans la ville et fais le tour', 345, NULL, 4, 5);
INSERT INTO public.voyage (id_voyage, nom_voyage, description, prix, image, nbr_jours, id_ville) VALUES (6, 'Berlin et son histoire', 'Découvre Berlin et son histoire du monde', 720, NULL, 10, 6);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 213
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 215
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 209
-- Name: pays_id_pays_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pays_id_pays_seq', 6, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservation_id_reservation_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservation_id_reservation_seq', 1, false);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 211
-- Name: villes_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.villes_id_ville_seq', 6, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 217
-- Name: voyage_id_voyage_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.voyage_id_voyage_seq', 6, true);


--
-- TOC entry 3210 (class 2606 OID 41294)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 3212 (class 2606 OID 41303)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 3206 (class 2606 OID 41271)
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id_pays);


--
-- TOC entry 3216 (class 2606 OID 41329)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id_reservation);


--
-- TOC entry 3208 (class 2606 OID 41280)
-- Name: villes villes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villes
    ADD CONSTRAINT villes_pkey PRIMARY KEY (id_ville);


--
-- TOC entry 3214 (class 2606 OID 41317)
-- Name: voyage voyage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_pkey PRIMARY KEY (id_voyage);


--
-- TOC entry 3218 (class 2606 OID 41304)
-- Name: client client_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.villes(id_ville);


--
-- TOC entry 3221 (class 2606 OID 41335)
-- Name: reservation reservation_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 3220 (class 2606 OID 41330)
-- Name: reservation reservation_id_voyage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_id_voyage_fkey FOREIGN KEY (id_voyage) REFERENCES public.voyage(id_voyage);


--
-- TOC entry 3217 (class 2606 OID 41281)
-- Name: villes villes_id_pays_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villes
    ADD CONSTRAINT villes_id_pays_fkey FOREIGN KEY (id_pays) REFERENCES public.pays(id_pays);


--
-- TOC entry 3219 (class 2606 OID 41318)
-- Name: voyage voyage_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.villes(id_ville);


-- Completed on 2023-05-06 18:33:43

--
-- PostgreSQL database dump complete
--

