--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: damage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.damage (
    id smallint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.damage OWNER TO postgres;

--
-- Name: equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment (
    id smallint NOT NULL,
    name character varying NOT NULL,
    brand character varying NOT NULL,
    model character varying NOT NULL,
    date date NOT NULL,
    cost numeric NOT NULL,
    loc character varying NOT NULL
);


ALTER TABLE public.equipment OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id smallint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id smallint NOT NULL,
    name character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id smallint NOT NULL,
    name character varying NOT NULL,
    date date NOT NULL,
    priority character varying NOT NULL,
    equi character varying
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id smallint NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    date date NOT NULL,
    hours numeric NOT NULL,
    damage character varying NOT NULL,
    equi character varying,
    emp character varying,
    notif smallint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id smallint NOT NULL,
    name character varying NOT NULL,
    date date NOT NULL,
    dept character varying NOT NULL,
    type character varying NOT NULL,
    login character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: damage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.damage (id, name) FROM stdin;
0	Overheating
1	Water Damage
2	Wear and Tear
3	Lacking or Poor Maintenance
4	Misalignment
5	Electrical Systems Issue
6	Leak or Clogging
7	Preventive Maintenance
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment (id, name, brand, model, date, cost, loc) FROM stdin;
0	HL Industrial Pizza Oven	HL	PO-2DG	2012-05-01	50000	Baking Section
1	SS Conveyor Belt	SS	CB-423	2010-05-09	150000	Stainless Steel Line 01
2	CB Packaging Machine	CB	LZ-118	2011-05-29	25000	Packaging Section
3	PG Multimeter	PG	PX-101	2021-01-12	1000	Packaging Section
4	YB Forklift	YB	YZ-342	2021-02-24	20000	Stainless Steel Line 02
5	HC Shaping Machine	HC	HZ-778	2021-03-12	24000	Stainless Steel Line 03
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (id, name) FROM stdin;
0	Baking Section
1	Stainless Steel Line 01
2	Stainless Steel Line 02
3	Stainless Steel Line 03
4	Packaging Section
5	Loading Station 01
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, name, password) FROM stdin;
0	admin	admin123
1	userid	password
3	newuser	sample123
4	hello	world
5	technician	davinci12
6	operator	leonardo22
7	sample	sample123
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, name, date, priority, equi) FROM stdin;
4	loose thread	2021-06-25	Low	SS Conveyor Belt
1	replacement of bearing	2015-05-12	High	SS Conveyor Belt
2	conveyor needs cleaning	2015-07-23	Low	CB Packaging Machine
3	packing machine almost clogged	2021-03-10	Medium	CB Packaging Machine
0	replacement of sprocket	2015-05-29	Very High	HL Industrial Pizza Oven
5	replacement of screw	2015-05-12	High	SS Conveyor Belt
6	applying of coolant	2021-09-30	Low	HC Shaping Machine
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, type, date, hours, damage, equi, emp, notif) FROM stdin;
1	replacement of bearing	Breakdown	2012-05-08	2	Water Damage	SS Conveyor Belt	Mark Meadow	1
2	unclogging of pipe	Corrective	2021-05-13	2	Water Damage	CB Packaging Machine	Mark Meadow	2
3	6M PM for Pizza Oven	Preventive	2021-07-16	1	Preventive Maintenance	HL Industrial Pizza Oven	John Jacobs	\N
4	6M PM for Conveyor	Preventive	2021-03-03	1	Preventive Maintenance	SS Conveyor Belt	Anne Medalia	\N
5	6M PM for Packaging Machine	Preventive	2021-05-21	1	Preventive Maintenance	CB Packaging Machine	Peter Pines	\N
6	tightening of rivets	Corrective	2021-08-12	2	Lacking or Poor Maintenance	SS Conveyor Belt	Mark Meadow	\N
7	applying coolant	Corrective	2021-05-07	1	Overheating	HL Industrial Pizza Oven	John Jacobs	4
8	labeling mechanism jammed	Breakdown	2021-04-21	5	Wear and Tear	CB Packaging Machine	Peter Pines	3
9	replacement of bearing 2	Corrective	2012-05-08	2	Water Damage	SS Conveyor Belt	Mark Meadow	1
10	replacement of bearing 3	Preventive	2012-05-08	2	Water Damage	SS Conveyor Belt	Mark Meadow	1
11	labeling mechanism jammed 2	Preventive	2021-04-21	5	Wear and Tear	CB Packaging Machine	Peter Pines	3
12	labeling mechanism jammed 3	Corrective	2021-04-21	5	Wear and Tear	CB Packaging Machine	Peter Pines	3
13	conveyor repair	Corrective	2021-03-03	1	Preventive Maintenance	SS Conveyor Belt	Anne Medalia	\N
14	conveyor repair 2	Breakdown	2021-03-03	1	Preventive Maintenance	SS Conveyor Belt	Anne Medalia	\N
15	packing machine repair	Corrective	2021-05-21	1	Preventive Maintenance	CB Packaging Machine	Peter Pines	\N
16	labeling repair 1	Corrective	2021-03-11	5	Wear and Tear	CB Packaging Machine	Peter Pines	3
18	labeling repair 4	Corrective	2021-11-16	5	Wear and Tear	CB Packaging Machine	Peter Pines	3
17	labeling repair 5	Breakdown	2021-10-26	2	Wear and Tear	CB Packaging Machine	Peter Pines	3
19	machine breakdown	Breakdown	2012-04-21	3	Wear and Tear	CB Packaging Machine	Peter Pines	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, date, dept, type, login) FROM stdin;
0	Peter Pines	2012-04-01	Stainless Steel	Admin	admin
1	Mark Meadow	2013-05-26	Baking	Technician	technician
2	John Jacobs	2014-06-19	Packaging	Operator	operator
3	Anne Medalia	2012-05-03	Stainless Steel	Admin	newuser
4	Tom Terner	2020-05-14	Stainless Steel	Technician	technician
\.


--
-- Name: damage damage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.damage
    ADD CONSTRAINT damage_pkey PRIMARY KEY (id);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: orders order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: login users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

