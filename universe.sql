--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    speed_in_km character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    has_reached_earth boolean DEFAULT false,
    date_discovered character varying(255)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    name character varying(255) NOT NULL,
    constantly_moving boolean DEFAULT true,
    date_discovered character varying(255)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    radius integer NOT NULL,
    home_planet character varying(255) NOT NULL,
    has_life boolean DEFAULT false,
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    date_discovered character varying(255)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius integer NOT NULL,
    has_life boolean DEFAULT false,
    amount_of_people numeric(10,2) NOT NULL,
    star_id integer NOT NULL,
    date_discovered character varying(255)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    radius integer NOT NULL,
    color character varying(255) NOT NULL,
    distance_from_earth_km numeric(10,2) NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    date_discovered character varying(255)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, '1421533', 'Lars', false, NULL);
INSERT INTO public.comet VALUES (2, '3174898', 'Enricoh', false, NULL);
INSERT INTO public.comet VALUES (3, '3375247', 'Maria', false, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, NULL, 'andromeda', true, NULL);
INSERT INTO public.galaxy VALUES (2, NULL, NULL, 'milky way', true, NULL);
INSERT INTO public.galaxy VALUES (3, NULL, NULL, 'virgo', true, NULL);
INSERT INTO public.galaxy VALUES (4, NULL, NULL, 'maffei', true, NULL);
INSERT INTO public.galaxy VALUES (5, NULL, NULL, 'canis major', true, NULL);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, 'cygnus', true, NULL);
INSERT INTO public.galaxy VALUES (7, NULL, NULL, 'cigar', true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 532125, 'Jupiter', false, 5, 'moon2', NULL);
INSERT INTO public.moon VALUES (3, 541264, 'Jupiter', false, 5, 'moon3', NULL);
INSERT INTO public.moon VALUES (4, 563247, 'Saturn', false, 10, 'moon4', NULL);
INSERT INTO public.moon VALUES (1, 141325, 'Earth', true, 3, 'moon1', NULL);
INSERT INTO public.moon VALUES (5, 141325, 'Jupiter', false, 5, 'moon5', NULL);
INSERT INTO public.moon VALUES (6, 532125, 'Jupiter', false, 5, 'moon6', NULL);
INSERT INTO public.moon VALUES (7, 541264, 'Jupiter', false, 5, 'moon7', NULL);
INSERT INTO public.moon VALUES (8, 563247, 'Jupiter', false, 5, 'moon8', NULL);
INSERT INTO public.moon VALUES (9, 141325, 'Neptune', false, 11, 'moon9', NULL);
INSERT INTO public.moon VALUES (10, 532125, 'Neptune', false, 11, 'moon10', NULL);
INSERT INTO public.moon VALUES (11, 541264, 'Neptune', false, 11, 'moon11', NULL);
INSERT INTO public.moon VALUES (12, 563247, 'Neptune', false, 11, 'moon12', NULL);
INSERT INTO public.moon VALUES (13, 141325, 'Kraz', false, 15, 'moon13', NULL);
INSERT INTO public.moon VALUES (14, 532125, 'Kraz', false, 15, 'moon14', NULL);
INSERT INTO public.moon VALUES (15, 541264, 'Kraz', false, 15, 'moon15', NULL);
INSERT INTO public.moon VALUES (16, 563247, 'Kraz', false, 15, 'moon16', NULL);
INSERT INTO public.moon VALUES (17, 141325, 'Marsaya', false, 8, 'moon17', NULL);
INSERT INTO public.moon VALUES (18, 532125, 'Marsaya', false, 8, 'moon18', NULL);
INSERT INTO public.moon VALUES (19, 541264, 'Pluto', false, 6, 'moon19', NULL);
INSERT INTO public.moon VALUES (20, 563247, 'Prometheus', false, 12, 'moon20', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 13231513, false, 0.00, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 13231513, false, 0.00, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 193928, false, 0.00, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 13218248, false, 0.00, 3, NULL);
INSERT INTO public.planet VALUES (6, 'Pluto', 13231, false, 0.00, 3, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 147317, true, 74000000.00, 2, NULL);
INSERT INTO public.planet VALUES (8, 'Marsaya', 13231513, false, 0.00, 4, NULL);
INSERT INTO public.planet VALUES (9, 'Uranus', 147317, false, 0.00, 2, NULL);
INSERT INTO public.planet VALUES (10, 'Saturn', 193928, false, 0.00, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Neptune', 13218248, false, 0.00, 3, NULL);
INSERT INTO public.planet VALUES (12, 'Prometheus', 13231513, false, 0.00, 3, NULL);
INSERT INTO public.planet VALUES (13, 'Enyo', 147317, false, 0.00, 5, NULL);
INSERT INTO public.planet VALUES (14, 'Quirinius', 193928, false, 0.00, 6, NULL);
INSERT INTO public.planet VALUES (15, 'Kraz', 13218248, false, 0.00, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 15000, 'blue', 17500000.22, 'Zeus', 1, NULL);
INSERT INTO public.star VALUES (2, 11000, 'red', 17500000.22, 'Spica', 2, NULL);
INSERT INTO public.star VALUES (3, 90000, 'orange', 16599020.22, 'Castor', 3, NULL);
INSERT INTO public.star VALUES (4, 60000, 'yellow', 12499020.22, 'Vega', 3, NULL);
INSERT INTO public.star VALUES (5, 60000, 'yellow', 12499020.22, 'Altair', 1, NULL);
INSERT INTO public.star VALUES (6, 50000, 'yellow', 12499020.22, 'Regulus', 2, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_date_discovered_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_date_discovered_key UNIQUE (date_discovered);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_date_discovered_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_date_discovered_key UNIQUE (date_discovered);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_date_discovered_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_date_discovered_key UNIQUE (date_discovered);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_date_discovered_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_date_discovered_key UNIQUE (date_discovered);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_date_discovered_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_date_discovered_key UNIQUE (date_discovered);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

