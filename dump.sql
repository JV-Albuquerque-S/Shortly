--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
1	dcef89d6-422e-4dde-bc41-3e17c2dab3d4	1	2022-08-08 04:37:29.813803
2	b5b0e18b-9b10-4093-a479-ef23dfd9cfae	1	2022-08-08 04:39:54.767302
3	eae45441-a860-42e2-8dd2-3ec8032963f0	1	2022-08-08 04:39:58.523537
4	e4f54882-1f86-4dd4-91f1-680e54859369	1	2022-08-08 04:40:40.43024
5	38c5f7ce-b594-405c-8ee7-9f62e960ae6a	1	2022-08-08 04:40:41.33387
6	3e72927b-5a9d-4d73-a9e1-1eb280564a27	1	2022-08-08 04:40:42.28636
7	f108190a-5e60-432f-bcfb-3cf4ba91d0c0	1	2022-08-08 04:40:54.015579
8	269b4cd6-9bae-4968-8865-d0d34b8d4cf9	1	2022-08-08 10:23:20.025749
9	0e36a6cc-d5c4-403e-b40c-18310e732a54	1	2022-08-08 10:23:21.929445
10	c8c57fcc-1492-4409-aac0-23c26a4237eb	16	2022-08-08 10:55:26.5585
11	e87ee4d4-6fc7-44fc-a93a-b340820cc159	16	2022-08-08 10:55:37.960845
12	b2dccd87-5f0b-4b9d-8ce5-5165324ea009	16	2022-08-08 11:00:19.485617
13	1d75f55f-b98b-4cf5-a52f-2fda52b5f352	5	2022-08-08 13:57:42.939221
14	538d3d79-fb4a-4e30-b4d8-e9baf2a48312	5	2022-08-08 13:58:25.94915
15	0a9da6eb-0a55-498c-bafe-371a6abbd9f8	5	2022-08-08 15:00:22.963009
16	d8547496-864e-4405-b1a1-33118dbc5a3d	10	2022-08-08 15:04:38.176958
17	4c3c5b8f-14b5-4302-83a8-e5f46919f5ef	5	2022-08-08 15:36:16.6863
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url, "shortUrl", views, "userId", "createdAt") FROM stdin;
3	fuleiow	KE0-MNN7	0	5	2022-08-08 13:58:59.951584
4	fuleiow	l3EGWSqu	0	5	2022-08-08 13:59:09.35127
5	fuleiow	CYzcdo7t	0	5	2022-08-08 14:00:07.392517
6	https://developers.refinitiv.com/en/article-catalog/article/how-to-test-http-rest-api-easily-with-visual-studio-code---thund	Mu7PkqZD	1	5	2022-08-08 14:12:01.329831
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	Zezé	zé.zezin@gmail.com	$2b$10$CTcpVAxRkAxgjEyS7c/1L.BDSQuqeUl0GpLGC4PBtpdhNHr9472lW	2022-08-08 03:58:23.331994
4	Fulano	fulano@gmail.com	$2b$10$Lam5HGGm8/dwuvcM1y8D7OzsN.Y//736zssuva2wECKfAarZnM4my	2022-08-08 10:42:04.516569
5	Ayrton Senna	ayrton.senna@hotmail.com	$2b$10$TD8EgkT/UpqVu5IvnR0P0em9lwbF4zzCn3noxUZD5GBM8p/.95sbe	2022-08-08 10:42:18.590956
10	Ayrton Senna	ayrton.sena@hotmail.com	$2b$10$N8ZB7UQU0yJ/iZ1xR6u1j.3duDpJTQ4ucFXO7TULQDVPsSGsapqkW	2022-08-08 10:49:04.100244
13	Ayrton Senna	ayrton.senin@hotmail.com	$2b$10$WDLdSlR9Fr31FOKUrsKMEO.RTdHAnvWZi0tbHcsSeQ/fZI6O/rnW.	2022-08-08 10:52:49.643727
16	Ayrton Senna	ayrton.senon@hotmail.com	$2b$10$jCF7qCcv6Br8tXFpaIT7fu4npZscvDeGKIVL1pe3BsG28OBbQJhfS	2022-08-08 10:54:53.06281
18	fuleinow	kkk.jjj@hotmail.com	$2b$10$8P.rZu/DyoQGOIAf4n6dOeNPXFdgVNb2ZkRdFo.Z93XkpGf4XSTYC	2022-08-08 11:05:18.383099
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 17, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

