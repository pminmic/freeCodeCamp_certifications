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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_tries integer NOT NULL,
    secret_number integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 808, 807, 1);
INSERT INTO public.games VALUES (2, 668, 667, 1);
INSERT INTO public.games VALUES (3, 360, 359, 2);
INSERT INTO public.games VALUES (4, 535, 534, 2);
INSERT INTO public.games VALUES (5, 785, 782, 1);
INSERT INTO public.games VALUES (6, 476, 475, 1);
INSERT INTO public.games VALUES (7, 276, 275, 1);
INSERT INTO public.games VALUES (8, 454, 453, 4);
INSERT INTO public.games VALUES (9, 394, 393, 4);
INSERT INTO public.games VALUES (10, 745, 744, 5);
INSERT INTO public.games VALUES (11, 312, 311, 5);
INSERT INTO public.games VALUES (12, 699, 696, 4);
INSERT INTO public.games VALUES (13, 260, 259, 4);
INSERT INTO public.games VALUES (14, 410, 409, 4);
INSERT INTO public.games VALUES (15, 119, 118, 6);
INSERT INTO public.games VALUES (16, 563, 562, 6);
INSERT INTO public.games VALUES (17, 752, 751, 7);
INSERT INTO public.games VALUES (18, 835, 834, 7);
INSERT INTO public.games VALUES (19, 62, 59, 6);
INSERT INTO public.games VALUES (20, 100, 99, 6);
INSERT INTO public.games VALUES (21, 270, 269, 6);
INSERT INTO public.games VALUES (22, 163, 162, 8);
INSERT INTO public.games VALUES (23, 107, 106, 8);
INSERT INTO public.games VALUES (24, 723, 722, 9);
INSERT INTO public.games VALUES (25, 471, 470, 9);
INSERT INTO public.games VALUES (26, 355, 352, 8);
INSERT INTO public.games VALUES (27, 15, 14, 8);
INSERT INTO public.games VALUES (28, 91, 90, 8);
INSERT INTO public.games VALUES (29, 16, 936, 3);
INSERT INTO public.games VALUES (30, 30, 29, 10);
INSERT INTO public.games VALUES (31, 178, 177, 10);
INSERT INTO public.games VALUES (32, 983, 982, 11);
INSERT INTO public.games VALUES (33, 337, 336, 11);
INSERT INTO public.games VALUES (34, 506, 503, 10);
INSERT INTO public.games VALUES (35, 188, 187, 10);
INSERT INTO public.games VALUES (36, 914, 913, 10);
INSERT INTO public.games VALUES (37, 23, 52, 12);
INSERT INTO public.games VALUES (38, 622, 621, 13);
INSERT INTO public.games VALUES (39, 523, 522, 13);
INSERT INTO public.games VALUES (40, 685, 684, 14);
INSERT INTO public.games VALUES (41, 143, 142, 14);
INSERT INTO public.games VALUES (42, 991, 988, 13);
INSERT INTO public.games VALUES (43, 939, 938, 13);
INSERT INTO public.games VALUES (44, 844, 843, 13);
INSERT INTO public.games VALUES (45, 649, 648, 15);
INSERT INTO public.games VALUES (46, 639, 638, 15);
INSERT INTO public.games VALUES (47, 208, 207, 16);
INSERT INTO public.games VALUES (48, 956, 955, 16);
INSERT INTO public.games VALUES (49, 941, 938, 15);
INSERT INTO public.games VALUES (50, 632, 631, 15);
INSERT INTO public.games VALUES (51, 570, 569, 15);
INSERT INTO public.games VALUES (52, 922, 921, 17);
INSERT INTO public.games VALUES (53, 237, 236, 17);
INSERT INTO public.games VALUES (54, 524, 523, 18);
INSERT INTO public.games VALUES (55, 370, 369, 18);
INSERT INTO public.games VALUES (56, 428, 425, 17);
INSERT INTO public.games VALUES (57, 927, 926, 17);
INSERT INTO public.games VALUES (58, 205, 204, 17);
INSERT INTO public.games VALUES (59, 407, 406, 19);
INSERT INTO public.games VALUES (60, 183, 182, 19);
INSERT INTO public.games VALUES (61, 805, 804, 20);
INSERT INTO public.games VALUES (62, 167, 166, 20);
INSERT INTO public.games VALUES (63, 106, 103, 19);
INSERT INTO public.games VALUES (64, 853, 852, 19);
INSERT INTO public.games VALUES (65, 292, 291, 19);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1748266128665');
INSERT INTO public.users VALUES (2, 'user_1748266128664');
INSERT INTO public.users VALUES (3, 'pminmic');
INSERT INTO public.users VALUES (4, 'user_1748266275517');
INSERT INTO public.users VALUES (5, 'user_1748266275516');
INSERT INTO public.users VALUES (6, 'user_1748266315899');
INSERT INTO public.users VALUES (7, 'user_1748266315898');
INSERT INTO public.users VALUES (8, 'user_1748266447883');
INSERT INTO public.users VALUES (9, 'user_1748266447882');
INSERT INTO public.users VALUES (10, 'user_1748266524973');
INSERT INTO public.users VALUES (11, 'user_1748266524972');
INSERT INTO public.users VALUES (12, 'javi');
INSERT INTO public.users VALUES (13, 'user_1748269902303');
INSERT INTO public.users VALUES (14, 'user_1748269902302');
INSERT INTO public.users VALUES (15, 'user_1748269977926');
INSERT INTO public.users VALUES (16, 'user_1748269977925');
INSERT INTO public.users VALUES (17, 'user_1748270006262');
INSERT INTO public.users VALUES (18, 'user_1748270006261');
INSERT INTO public.users VALUES (19, 'user_1748270040540');
INSERT INTO public.users VALUES (20, 'user_1748270040539');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 65, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

