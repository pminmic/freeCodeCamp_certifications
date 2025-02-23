--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    has_life boolean,
    description text,
    name character varying(25) NOT NULL,
    galaxy_types_id integer NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    description text NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    dist_near_planet_in_mill_km numeric,
    aprox_diameter integer,
    planet_id integer NOT NULL
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
    name character varying(25) NOT NULL,
    dist_near_star_in_mill_km numeric,
    has_life boolean,
    star_id integer NOT NULL
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
    description text,
    name character varying(25) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, true, 'A spiral galaxy with well-defined arms. Its our galaxy.', 'Milky Way', 1);
INSERT INTO public.galaxy VALUES (2, false, 'The closest galaxy to the Milky Way, in the process of colliding with it.', 'Andromeda', 1);
INSERT INTO public.galaxy VALUES (3, false, 'A dwarf, irregular galaxy orbiting the Milky Way.', 'Large Magellanic Cloud', 4);
INSERT INTO public.galaxy VALUES (4, false, 'One of the most massive galaxies known, with an elliptical shape.', 'M87', 2);
INSERT INTO public.galaxy VALUES (5, false, 'A wheel-shaped galaxy from an ancient collision.', 'Carousel Galaxy', 3);
INSERT INTO public.galaxy VALUES (6, false, 'A compact group of galaxies in gravitational interaction.', 'Stephan''s Quintet', 4);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'According to studies carried out, it is known that 77% of the galaxies seen belong to this category. They are shaped like a flat disk and in them you can observe a rotating movement around a clearly visible center. The arms that are generated on the outer parts of the disk rotate at very high speeds. Large amounts of gases accumulate at its edges, which help form more stars. The Milky Way and Andromeda belong to this classification.', 'spiral');
INSERT INTO public.galaxy_types VALUES (2, 'This type of galaxy is characterized by having a spherical and elongated shape, with the particularity that it does not have an easily visible center. However, their central area is extremely bright, because many more stars accumulate in this area. Between 10% and 15% of known galaxies are of this type.
The stars found inside do not maintain a specific orbit. They can measure more than 1 million light years. It is known that many of them are quite old, since millions of stars known as "red giants" can be found in their structure.', 'eliptical');
INSERT INTO public.galaxy_types VALUES (3, 'These are galaxies that are part of a transition group between elliptical and spiral galaxies. They have a flat disk structure with rotating movement, but they lack outer arms, since new stars do not form in these areas.', 'lenticular');
INSERT INTO public.galaxy_types VALUES (4, 'They are galaxies that do not have a fully defined shape or structure, which is why they have a deformed appearance. This is due to the gravitational effect exerted by other cosmic bodies, such as other galaxies. They were once spiral or elliptical galaxies', 'irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.384, 3474, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.009, 22, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.023, 12, 4);
INSERT INTO public.moon VALUES (4, 'Io', 0.422, 3643, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0.671, 3122, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1.070, 5268, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1.882, 4820, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1.222, 5150, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.527, 1528, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3.561, 1469, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 0.377, 1123, 6);
INSERT INTO public.moon VALUES (12, 'Triton', 0.354, 2706, 7);
INSERT INTO public.moon VALUES (13, 'Nereid', 5.513, 340, 7);
INSERT INTO public.moon VALUES (14, 'Charon', 0.019, 1212, 8);
INSERT INTO public.moon VALUES (15, 'Styx', 0.042, 16, 8);
INSERT INTO public.moon VALUES (16, 'Nix', 0.049, 50, 8);
INSERT INTO public.moon VALUES (17, 'Kerberos', 0.058, 19, 8);
INSERT INTO public.moon VALUES (18, 'Hydra', 0.065, 51, 8);
INSERT INTO public.moon VALUES (19, 'Oberon', 0.583, 1523, 9);
INSERT INTO public.moon VALUES (20, 'Titania', 0.436, 1578, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 58, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 150, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 228, false, 1);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', 300, false, 2);
INSERT INTO public.planet VALUES (6, 'Betelgeuse II', 450, false, 2);
INSERT INTO public.planet VALUES (7, 'Rigel I', 500, false, 3);
INSERT INTO public.planet VALUES (8, 'Rigel II', 750, false, 3);
INSERT INTO public.planet VALUES (9, 'R136a1 I', 100, false, 4);
INSERT INTO public.planet VALUES (10, 'RS Andromedae I', 200, false, 5);
INSERT INTO public.planet VALUES (11, 'M87 Star 1 I', 600, false, 6);
INSERT INTO public.planet VALUES (12, 'M87 Star 1 II', 900, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'A yellow dwarf, the star of our Solar System.', 'Sun', 1, 4600);
INSERT INTO public.star VALUES (2, 'A red supergiant, one of the largest stars visible to the naked eye.', 'Betelgeuse', 1, 8);
INSERT INTO public.star VALUES (3, 'A blue supergiant, the brightest star in the constellation Orion.', 'Rigel', 1, 8);
INSERT INTO public.star VALUES (4, 'The most massive known star, located in the Large Magellanic Cloud.', 'R136a1', 3, 1);
INSERT INTO public.star VALUES (5, 'A bright red giant in the Andromeda Galaxy.', 'RS Andromedae', 2, 2000);
INSERT INTO public.star VALUES (6, 'A bright blue supergiant star in the elliptical galaxy M87.', 'M87 Star 1', 4, 5000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star from_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT from_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

