--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Ubuntu 10.3-1)
-- Dumped by pg_dump version 10.3 (Ubuntu 10.3-1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: backent_api_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_api_event (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    summary text NOT NULL,
    description text NOT NULL,
    external_url character varying(255) NOT NULL,
    price integer NOT NULL,
    start timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    location_id integer NOT NULL,
    organization_id integer NOT NULL,
    currency character varying(32) NOT NULL,
    event_format character varying(32) NOT NULL,
    facebook_event character varying(255),
    facebook_group character varying(255),
    facebook_page character varying(255),
    npc_price integer,
    npc_signup_page character varying(255),
    player_signup_page character varying(255)
);


ALTER TABLE public.backent_api_event OWNER TO postgres;

--
-- Name: backent_api_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_api_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_event_id_seq OWNER TO postgres;

--
-- Name: backent_api_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_api_event_id_seq OWNED BY public.backent_api_event.id;


--
-- Name: backent_api_eventlike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_api_eventlike (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.backent_api_eventlike OWNER TO postgres;

--
-- Name: backent_api_eventlike_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_api_eventlike_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_eventlike_id_seq OWNER TO postgres;

--
-- Name: backent_api_eventlike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_api_eventlike_id_seq OWNED BY public.backent_api_eventlike.id;


--
-- Name: backent_api_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_api_location (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(512) NOT NULL,
    coords public.geography(Point,4326)
);


ALTER TABLE public.backent_api_location OWNER TO postgres;

--
-- Name: backent_api_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_api_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_location_id_seq OWNER TO postgres;

--
-- Name: backent_api_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_api_location_id_seq OWNED BY public.backent_api_location.id;


--
-- Name: backent_api_organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_api_organization (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.backent_api_organization OWNER TO postgres;

--
-- Name: backent_api_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_api_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_organization_id_seq OWNER TO postgres;

--
-- Name: backent_api_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_api_organization_id_seq OWNED BY public.backent_api_organization.id;


--
-- Name: backent_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    avatar character varying(100),
    location_id integer
);


ALTER TABLE public.backent_user OWNER TO postgres;

--
-- Name: backent_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.backent_user_groups OWNER TO postgres;

--
-- Name: backent_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_user_groups_id_seq OWNER TO postgres;

--
-- Name: backent_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_user_groups_id_seq OWNED BY public.backent_user_groups.id;


--
-- Name: backent_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_user_id_seq OWNER TO postgres;

--
-- Name: backent_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_user_id_seq OWNED BY public.backent_user.id;


--
-- Name: backent_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backent_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.backent_user_user_permissions OWNER TO postgres;

--
-- Name: backent_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backent_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: backent_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backent_user_user_permissions_id_seq OWNED BY public.backent_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: backent_api_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_event ALTER COLUMN id SET DEFAULT nextval('public.backent_api_event_id_seq'::regclass);


--
-- Name: backent_api_eventlike id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_eventlike ALTER COLUMN id SET DEFAULT nextval('public.backent_api_eventlike_id_seq'::regclass);


--
-- Name: backent_api_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_location ALTER COLUMN id SET DEFAULT nextval('public.backent_api_location_id_seq'::regclass);


--
-- Name: backent_api_organization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_organization ALTER COLUMN id SET DEFAULT nextval('public.backent_api_organization_id_seq'::regclass);


--
-- Name: backent_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user ALTER COLUMN id SET DEFAULT nextval('public.backent_user_id_seq'::regclass);


--
-- Name: backent_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_groups ALTER COLUMN id SET DEFAULT nextval('public.backent_user_groups_id_seq'::regclass);


--
-- Name: backent_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.backent_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can add event	2	add_event
5	Can change event	2	change_event
6	Can delete event	2	delete_event
7	Can add event like	3	add_eventlike
8	Can change event like	3	change_eventlike
9	Can delete event like	3	delete_eventlike
10	Can add location	4	add_location
11	Can change location	4	change_location
12	Can delete location	4	delete_location
13	Can add organization	5	add_organization
14	Can change organization	5	change_organization
15	Can delete organization	5	delete_organization
16	Can add Token	6	add_token
17	Can change Token	6	change_token
18	Can delete Token	6	delete_token
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add permission	8	add_permission
23	Can change permission	8	change_permission
24	Can delete permission	8	delete_permission
25	Can add group	9	add_group
26	Can change group	9	change_group
27	Can delete group	9	delete_group
28	Can add content type	10	add_contenttype
29	Can change content type	10	change_contenttype
30	Can delete content type	10	delete_contenttype
31	Can add session	11	add_session
32	Can change session	11	change_session
33	Can delete session	11	delete_session
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
b9e4dd9175ae029403dd1a2b638ac65d63f0ce43	2018-01-15 23:43:43.457736+01	1
994ce67b69e79c8668a0191079791129afa2c5da	2018-01-15 23:50:03.342353+01	2
dbe9d8c8e04f29803b375eb1c8503ec70c1847a2	2018-02-11 23:35:00.350446+01	3
4d1eaa2fa382a5724df30b578a7e72cbcaf37cec	2018-02-12 08:34:48.392089+01	4
ad684dbedbca74b1d7d7f0fd09dac913dcf613f3	2018-02-26 12:14:55.633838+01	5
25319b5228494bd05c80a6e687c8af17e832e5f0	2018-02-26 12:15:15.167633+01	6
ad6ce62927cecd14914a5175f993d57061480af8	2018-02-26 13:56:32.861646+01	7
fb3acb51be7f96aaa7ce51b837f5dc7359c4cbf3	2018-02-28 17:07:08.709904+01	8
afd37db1dd869810be3e5feaca7f3098cd77b27d	2018-03-16 09:03:22.1813+01	10
fc4ed0363b07e54d9ffd8cc327b202264cbdef6d	2018-03-29 22:08:00.01869+02	11
181cf10ca89d931df1997d8bb5eff1d13d7cc8e3	2018-04-08 22:50:39.77151+02	12
bbf5f906f02ac99957ba2085f599048bdd4416a1	2018-04-16 12:53:37.744563+02	13
c45c427dcc68e46d07b2d040dcfe213e8c0e4434	2018-05-09 22:02:11.390991+02	14
12a44a025a64a9c43174996e627f9211ae75be20	2018-05-15 13:04:31.943976+02	15
\.


--
-- Data for Name: backent_api_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_api_event (id, slug, name, summary, description, external_url, price, start, created_by_id, location_id, organization_id, currency, event_format, facebook_event, facebook_group, facebook_page, npc_price, npc_signup_page, player_signup_page) FROM stdin;
21	ainsi-sonne-le-glas	Ainsi sonne le Glas	Le jeu se déroulera dans un camp de travail de Nordia reculé dans les terres gelées, et les personnages en seront des prisonniers fraîchement déplacés	L’Empire du Nord est en guerre contre Nordia depuis plus de 3 ans, de nombreuses pertes sont à déplorer et encore plus de disparitions. Nordia, dirigée officiellement par le conseil des haut-prêtres de Tanaros, mène des actions au nom d’un chaos et d’un être inconnu à la voix terrible. Plusieurs de ces actions ont consisté à prendre des prisonniers et des otages.\r\n\r\nCeci est l’histoire de certains d’entre eux. Ils viennent du Fydaron, de Varia ou du Darjalad et ont été otages de leur ennemi, puis oubliés de leurs alliés.\r\n\r\nLe jeu se déroulera dans un camp de travail de Nordia reculé dans les terres gelées, et les personnages en seront des prisonniers fraîchement déplacés. Celà fait près de 2 ans que les personnages vivent cette vie et ce dernier transfert semble être le dernier...\r\n\r\nOn raconte que l’on voit passer sa vie devant ses yeux au moment d’embrasser la mort, en réalité ce sont des souvenirs les plus forts qui ponctuent les derniers souffles. Ce sont les rêves brisés, les déceptions, les souvenirs heureux ou amers qui bercent avant le dernier sommeil...\r\n\r\nC'est donc avant tout un jeu d'ambiance, un costume est demandé mais il n'y aura pas de combat en grandeur nature.\r\nLe jeu se déroulera le 17/03/2018 et commencera vers midi (à préciser).\r\n\r\nUne PAF de 5€ est demandée (incluant de quoi grignoter) pour la base, mais pourra être augmentée si on doit louer un lieu spécifique pour le jeu.\r\n\r\nNous vous tiendrons au courant dès réception de votre inscription.	https://www.facebook.com/LesForgeMondes/	500	2018-03-17 09:16:14+01	3	20	7	EUR	hours	\N	\N	\N	500	https://docs.google.com/forms/d/e/1FAIpQLScr0xTVMyFu10LE-Qxd2bI6SwDw3Pt7MMTgfNS8-wRojRnH5g/viewform	https://docs.google.com/forms/d/e/1FAIpQLScr0xTVMyFu10LE-Qxd2bI6SwDw3Pt7MMTgfNS8-wRojRnH5g/viewform
4	apero-gnistes-lyonnais-de-la-nouvelle-annee	Apéro GNistes lyonnais de la Nouvelle Année	Rendez-vous amical GNiste à Lyon	Rendez-vous amical GNiste à Lyon	https://www.facebook.com/events/1966899713628475/	0	2018-01-23 20:28:20+01	2	3	2	EUR	hours	\N	\N	\N	\N	\N	\N
109	la-memoire-des-ombres	La Mémoire des Ombres	La Mémoire des Ombres est un jeu mêlant exploration et énigmes dans une ambiance d'horreur et de survie...	Le GN "La Mémoire des Ombres", inspiré de l'univers des Ombres d'Esteren, aura lieu du 6 au 7 octobre 2018, à Laigneville (60290), réunira environ 50 PJ et sera organisé par l'équipe QBA hébergée par l'association des Mines du Roi Nain.\r\n\r\n► Les pré-inscriptions sont ouvertes : http://qba.fr/ombres/\r\n\r\n---\r\n\r\n****NOTE D'INTENTION****\r\n\r\n1. L’horreur dans le noir\r\nLa Mémoire des Ombres est un jeu mêlant exploration et énigmes dans une ambiance d'horreur psychologique, de survie dans l'obscurité, dans des labyrinthes souterrains qui regorgent de secrets.\r\n\r\nLe jeu avancera dans le rythme soutenu de la lutte pour survivre, entre des scènes d’escarmouches contre des créatures innommables, de résolution d’énigmes et de moments de calme avant la tempête.\r\n\r\nL'univers d'inspiration est celui des "Ombres d'Esteren", bien qu’il ne soit pas nécessaire de le connaître pour jouer, et que ça n’apporte aucun d’avantages en jeu. C’est un monde à l’apparence celtique et médiévale, avec quelques éléments de fantastique, de science ou de magience, un mélange des deux.\r\n\r\nUne grande liberté d’interprétation sera laissée aux joueuses et aux joueurs, afin d’incarner au mieux l’anxiété du temps qui manque, les dilemmes moraux des survivants et la méfiance salutaire à avoir envers les autres.\r\n\r\n2. Rythme et type de jeu\r\n\r\nLes protagonistes commencent le jeu dans une amnésie générale sur leur identité et ce qui les a amené là. Au fil du temps, la résurgence de leurs souvenirs personnels leur donnera des réponses, de nouvelles questions ou les fera frôler la démence.\r\n\r\nDe samedi matin à tard dans la nuit de samedi à dimanche, le temps de jeu sera réparti entre de l’exploration donnant matière à du jeu de rôle entre personnages et groupes, de la réflexion sur les mystères de cet endroit, ainsi que des combats rares, qui seront de plus en plus présent en approchant de la fin de l’histoire, pour se clôturer de manière épique.\r\n\r\nLes joueuses et les joueurs devront s'habituer à l'incertitude de l'obscurité, entièrement intégrée au rythme de l'histoire. La lumière sera une ressource rare, vitale, compliquée à obtenir.\r\n\r\nEnfin, l'intégralité du jeu se déroulera dans des kilomètres de tunnels humides et frais (12°) nécessitant un costume chaud et de bonnes chaussures.\r\n\r\n3. Plaisir de jeu et sécurité\r\n\r\nBien que l’ambiance se veuille dure et angoissante, l’équipe d’organisation souhaite que toutes ses joueuses et joueurs expérimentent une immersion soutenue et un jeu agréable.\r\n\r\nLa pression ne portera pas sur la faim, la force ou l’agilité physique. Elle portera sur l’aspect claustrophobique du lieu et de l’obscurité, sur la distance de marche à pied, sur la difficulté à résoudre des énigmes dans ces conditions, ainsi que sur le jeu de rôle : la méfiance entre les personnages et envers soi-même en lien avec l’amnésie.\r\n\r\nL’équipe d’organisation est consciente des risques liés à cette atmosphère et intégrera plusieurs mécaniques pour faciliter la sécurité physique, psychologique et émotionnelle.\r\n\r\nEnfin, l’équipe a coeur à vous offrir une expérience de jeu agréable et restera à votre disposition avant, pendant et après le jeu. Avec sourire et bienveillance.\r\n\r\nToutes les infos pratiques ici : http://qba.fr/ombres/#infos	http://qba.fr/ombres/	9000	2018-10-05 18:16:00+02	3	94	92	EUR	medium	https://www.facebook.com/events/142791849749384	\N	https://www.facebook.com/qba.gn/	2000	\N	\N
22	canal-historique	Canal Historique	Wargame, baston dans les bois, combats soutenus	Exkalibur. Le Hurlement des Batailles.\r\n\r\nAprès avoir passé le Bois Sans-Retour qui marque par la présence de la Tour Blanche la fin des terres connues, les arbres forment une masse compacte et menaçante. L’intérieur de la forêt est nappé de brouillard. Le sol est noir et boueux. Les terres tourbeuses sont couvertes de fougères et de bruyères L’atmosphère y est humide. A la sortie de la futaie, les ondulations de l’air sont irrégulières, et des bourrasques de vent fouettent le visage. Des nuages sombres obscurcissent l’horizon et le tonnerre gronde dans le lointain. Des corbeaux surveillent les futaies pour dit-on le compte de sorciers, et autres enchanteurs qui patrouillent sur les chemins et veillent sur ce qui semble être un pays misérable et abandonné de toute civilisation. Souvent au détour d’un tumulus, le sentier se transforme en un torrent d’où dévale une source sans but. Depuis les sommets de certains monticules on embrasse du regard un sombre pays aux profonds sous-bois, le tout est écrasé sous un épais plafond de nuages de pluie. On y distingue l’antique forteresse de Camaaloth qui a été ravagée. Le Prince Medrawt et le Seigneur Melwas réclament leur dû. Le Trône laissé vacant par un Roi absent est à prendre par le plus audacieux. Chevalier, vous cherchez à intégrer une Armée digne de ce nom qui ramènera l’Ordre sur des terres livrées au chaos. Après avoir traversé une Lande aux herbes rabougries, vous vous apprêtez à pénétrer une forêt aux basses frondaisons. Sombre et boueuse, elle rugit de mille bruits d’armes qui s’entrechoquent brutalement. C’est le branle-bas de combat général. Une troupe d’hommes en armes tente de percer des lignes de défense dressées par des chevaliers qui hurlent des ordres à leurs écuyers. Tout va très vite. Les combattants attaquent sans relâche de tous les côtés. Il ne s’écoule pas une seconde entre les chocs successifs des premières lignes. L’affrontement des guerriers se poursuit sans hésitation, ni interruption. Les soldats engoncés dans leurs armures brandissent des armes pesantes qui s’abattent sur leurs adversaires. Les combats se poursuivent en continu.\r\n\r\nDans le camp retranché des Terres Désolées, des gens d’arme font tourner des fouets pour se frayer un passage dans la foule affolée des réfugiés. Le Bastion de la Roche Brûlée est maintenant en état de siège permanent. Ses travées résonnent des hurlements d’effroi des gueux tombés au sol. Des soldats crient des ordres tout en courant le long des remparts. Le chaos est partout et la confusion totale. Toutes les masures sont fermées. Il s’élève du lieu une odeur forte, désagréable et presque insupportable. C’est une volute odorante pestilentielle : Un mélange de chairs en décomposition et d’excréments. Outre çà et là, on peut voir des corps mis en tas, éviscérés traînant dans de sombres ornières. Tous sont nauséabonds et la vermine en fait son festin. A certains endroits les cadavres servent à former des remparts improbables. Une substance jaunâtre en coule jusqu’aux tranchées. L’air est tellement lourd dans le Bastion que les yeux en brûlent. Qui attaque ? Qui défend ? Seules certaines Dames des Brumes de l'Île des Enchanteurs observant de loin les combats arrivent encore à reconnaître les troupes qui leurs ont juré fidélité.\r\n\r\nOn contourne les combats en traversant des terres humides parsemées de bourbiers puants. Le vent glacial qui foute le visage n’arrange rien. Vous finissez par émerger au sommet d’une petite colline d’où l’on aperçoit une vieille route. Elle est connue sous le nom de “Chaussée de Boue“ et conduit jusqu’au Camp des Chevaliers. C’est là où se font l’engagement pour un camp ou un autre sans discernement de vassalité. Vous en prenez le chemin….\r\n\r\nDans quel Camp allez-vous vous engager ? Celui du Prince Medrawt : Seigneur du Dragon, ou celui du Seigneur Melwas d’Outre-Monde.\r\n\r\nMerci à XPH pour son écriture.\r\n\r\nLien pour l'inscription: https://www.weezevent.com/invasion-ch-2018\r\nFin des inscriptions millieu février	https://www.facebook.com/events/263918497424045/	4100	2018-03-23 01:06:41+01	3	21	19	EUR	short	\N	\N	\N	\N	\N	\N
106	de-cape-et-decailles	De Cape et d'Ecailles	Dans l'univers des Lames du Cardinal de Pierre Pevel	Un GN dans l'univers de Lames de Cardinal de Pierre Pèvel\r\n\r\nSi vous n'avez pas lu ces livres : précipitez vous dessus pour peu que vous aimiez le genre de l'univers qui croise des Mousquetaires d'Alexandre Dumas avec les Dragons, les intrigues complexes et un style efficace\r\n\r\n    Quoi ?\r\n\r\n    Nous vous proposons un jeu de role grandeur nature qui se déroule dans cet univers. Il s'agit d'un jeu avec les personnages pré-écrits par les organisateurs, un nombre fixe de joueurs (envrion 100 PJ, PNJ et orgas compris), focalisé essentiellement sur les négociations entre les personnages avec quelques morceaux de bravoure et panache lors d'affrontements occasionnels. Le jeu a été écrit et organisé en 2014 par l'association Torgnole. An Termaji a repris le jeu puis y a ajouté sa patte...\r\n    Quand ?\r\n\r\n    Le jeu commencera dans la soirée du vendredi 28 septembre 2018 et se terminera le dimanche à midi.\r\n    Où ?\r\n\r\n    Au lieu dit Keruscar, à environ 15km au sud-est de Morlaix dans le Finistère.	https://www.facebook.com/pg/DeCapeEtDEcailles2/about/?ref=page_internal	8000	2018-09-28 18:08:33+02	3	93	91	EUR	medium	\N	\N	\N	3200	\N	\N
36	dominion	Dominion	GN inspiré de la série Dominion et d'INS/MV	Notre grand ami Asso Aquilon organise en Avril à Montbré un nouveau GN inspiré de la série Dominion et d'INS/MV.\r\nJ'y serais en orga central aux côtés de Damien et je participerais à l'écriture des BG et des quêtes en compagnie d'une belle brochette d'orga cinglés.\r\nPour info:\r\n\r\nGN 2018 : DOMINION\r\n\r\nPitch\r\n\r\nLe GN Dominion met en place un monde post-apo où se mélangent humain ange et démons.\r\nIl prend en effet place après l'armaggedon divin, ultime affrontement du bien et du mal. En effet en 1999, les portes des enfers et du paradis s'ouvrirent. Les anges et démons s'incarnèrent dans des hommes et s élancèrent dans l'ultime combat.\r\nLes humains, pris entre deux feux dans cette guerre, lancèrent une attaque atomique conjointe sur les deux portails.\r\n\r\nLes portes du paradis et de l'enfer explosèrent, altérant les mondes. De cette nouvelle crevasse dimensionnelle sortit un nouveau maux pour la Terre : le grand dévoreur. Ce derniers se répandit partout, avide d engloutir des âmes, quelles soient humaines, angéliques ou démoniaques.\r\n\r\nLe monde que l'on connaît s'effondra : le cataclysme lié aux attaques nucléaires balaya les gouvernements et les grandes puissances s'éffondrèrent.\r\n\r\nLes survivants, humains, anges ou démon, tentent maintenant de de survivre face à un ennemi plus puissant qu'eux. Ainsi ils fondirent la ville de Dominion et apprirent à vivre ensemble.\r\n\r\nThématique\r\nDOMINION est un gn où mélange intrigue, diplomatie et combat, exploration au dans une ville où trois factions (hommes, anges et démons) tentent de prendre le pouvoir, tout en étant uni contre une même grande menace...\r\n\r\nRègles\r\nLe gn met en place des règles très simples (pas de compétence pas d'annonce), utilisant les armes de gn classiques et les armes nerfs.\r\n\r\nSpécificité\r\nCe gn propose une mécanique basé sur les points d âme.\r\nLes points d âme remplacent les point sur de vie. Ils sont représentés par des rubans portés à la ceinture des personnages. Ces points ont un impact important car cela montre aussi la qualité de l'âme d'un personnage : démon humain ou ange, chacun ayant une couleur différente. Les dévoreurs (créature pnj) peuvent arracher ces rubans en combat. Un personnage sans point d'âme se transformera en dévoreur à son tour. Avoir un maximum de point d'âme est donc vital. Mais un ange tolérera t il de cumuler des points d âme humain ou démoniaque ? Engagera t il sa pureté angélique ? Vous déciderez de l'avenir de votre personnage.\r\nCette mécanique entraîne ainsi bien des choses : les relations entre personnages peuvent évoluer durant le jeu, chaque faction dispose de groupe plus ou moins extrémistes...\r\nLes rôles seront ainsi nombreux : ange/humain/démon pur ou des hybrides seront possibles.\r\n\r\nDétails pratiques\r\nLieu : fort de montbré\r\nDate indicative : 6/7/8 avril 2018\r\nPaf indicative : 50 euros ( PJ) - 25 euros ( PNJ)\r\nPas de restauration comprise ( sauf si évolution du paf).\r\nNombre de place PJ limitée : premier arrivé, premier servi\r\n\r\nATTENTION : CE N'EST PAS UN GN "IN NOMINE SATANIS".	https://www.facebook.com/groups/lesportesdunord/permalink/1225109290934337/	5000	2018-04-06 02:24:27+02	3	22	34	EUR	medium	\N	\N	\N	\N	\N	\N
107	gn-usm-2-les-feux-de-beltane-session-2	GN USM 2 "Les feux de Beltane" - Session 2	GN inspiré de l’univers d’Harry Potter	« Les feux de Beltane» est un GN inspiré de l’univers d’Harry Potter décrit par JK Rowling.\r\nIl s'agit de l'épisode 2 de « Bienvenue à l'USM ».\r\nLes élèves ont entamé leur deuxième année à l'université et s'apprêtent à recevoir les résultats de leurs premiers partiels.\r\nMalgré cette tension, tous sont impatients de participer au bal des flammes qui célébrera cette année, en plus du renouveau du printemps, un événement rare. Le cumul du changement de cycle élémentaire et le renouvellement de la cour des fées.\r\nSerez-vous là pour assister à tous ces événements ?\r\n\r\nATTENTION :\r\n\r\nSESSION 1 : du 8 au 10 juin 2018\r\nSESSION 2 : du 28 au 30 septembre 2018	https://drive.google.com/file/d/1pTU3bqHTVMEazWHRYMKLJHsCstj3YVkC/view	8500	2018-09-28 18:10:22+02	3	64	59	EUR	medium	https://www.facebook.com/events/151478488832636/	\N	\N	\N	\N	\N
68	gn-usm-2-les-feux-de-beltane-session-1	GN USM 2 "Les feux de Beltane" - Session 1	GN inspiré de l’univers d’Harry Potter	« Les feux de Beltane» est un GN inspiré de l’univers d’Harry Potter décrit par JK Rowling.\r\nIl s'agit de l'épisode 2 de « Bienvenue à l'USM ».\r\nLes élèves ont entamé leur deuxième année à l'université et s'apprêtent à recevoir les résultats de leurs premiers partiels.\r\nMalgré cette tension, tous sont impatients de participer au bal des flammes qui célébrera cette année, en plus du renouveau du printemps, un événement rare. Le cumul du changement de cycle élémentaire et le renouvellement de la cour des fées.\r\nSerez-vous là pour assister à tous ces événements ?\r\n\r\nATTENTION :\r\n\r\nSESSION 1 : du 8 au 10 juin 2018\r\nSESSION 2 : du 28 au 30 septembre 2018	https://www.facebook.com/events/151478488832636/	8500	2018-06-08 04:50:35+02	3	64	59	EUR	medium	\N	\N	\N	\N	\N	https://drive.google.com/file/d/1pTU3bqHTVMEazWHRYMKLJHsCstj3YVkC/view
44	gn-bloodball-iii	GN Bloodball III	GN dans un tournoi de trollball médiéval-fantastique	Bloodball – Kesako ?\r\n\r\nLe Trollball est un tournoi sportif inspiré du football américain, sans contact physique, où les joueurs, armés d’une épée, doivent mettre une balle en mousse dans le tonneau de l’équipe adverse pour marquer un point. L’équipe qui a marqué le plus de points à la fin du match a gagné. Il est pratiqué depuis le début du millénaire dans une dizaine de pays.\r\n\r\nUne équipe est composée de 5 bloodballeurs sur le terrain et peut avoir jusqu’à 5 remplaçants sur le banc de touche.\r\n\r\nLe Bloodball est un GN Trollball qui prend place dans l’univers de Warhammer Battle, un monde médiéval fantastique imaginé par Games Workshop.\r\nQu’est ce qui le différencie d’un tournoi sportif ?\r\n\r\nDans le Bloodball, les joueurs incarnent différentes races (exclusivement chaotiques dans cet opus) et choisissent une classe qui apportent des avantages sur et en dehors du terrain. Des PNJs sont là pour les aider à améliorer leur performance, recruter de nouveaux membres, traquer des bêtes sauvages, pratiquer des opérations, …\r\n\r\nEn somme, le Bloodball va plus loin qu’un simple tournoi sportif et propose une véritable expérience GNistique basée sur un sport médiéval-fantastique.\r\n\r\nLes 3 choses à retenir concernant ce GN\r\n\r\n    Ce jeu est un GN à forte vocation initiatique (une vingtaine d’adolescents présents). Une partie des participants au jeu seront donc des néophytes.\r\n    Bien que tournoi sportif, ce jeu fait la part belle aux actions hors du terrain.\r\n    L’association GIGN a mis en place depuis quelques années un partenariat avec Pierre de Grim Fantasy. Nous te proposons donc à la location des prothèses latex de sa création, ce qui permet de bénéficier de superbes prothèses à moindre coût tout en pérennisant son activité.\r\n\r\nComment participer au GN ?\r\nInscription sur Helloasso à partir du 9 février 2018\r\n\r\n    Par équipe si tu as réuni 7 joueurs.\r\n    Individuelle sinon, tu pourras ensuite rejoindre une des équipes constituées.\r\n    Le nombre de places PJ est limitée, 5 équipes de 10 bloodballeurs (soit 50 PJ).\r\n\r\n Participation Aux Frais\r\n\r\n    Personnage Joueur individuel = 42 €\r\n        Si tu réunis au moins 7 joueurs, demande aux orgas AVANT l’inscription un code de réduction de 5 €/ joueur\r\n        Location d’un masque = 12 €  (orc, gobelin ou skaven en nombre limité)\r\n    Personnage Non Joueur = 25 €\r\n    Équipe Service = 10 € (intendants, orgas et photographe)\r\n\r\nSont compris dans la PAF\r\n\r\n    L’assurance pour les PJ (si tu as une licence FédéGN active en 2018, demande-nous AVANT l’inscription un code de réduction de 2€). Les PNJ et Equipe Service sont assurés gratuitement.\r\n    Tous les repas du vendredi soir au dimanche midi.\r\n    Le couchage en jeu dans une tente fournie par les orgas. Si couchage hors jeu, tu amènes ta tente.\r\n    Le maquillage et les petites prothèses latex (cloques, cicatrices, …) hors masque.\r\n\r\nCréer son personnage\r\n\r\nLors de l’inscription, tu choisis une RACE et une CLASSE.\r\nRaces accessibles\r\n\r\nTu peux incarner une des races proposées, uniquement chaotiques dans cet opus !\r\n\r\n    ADEPTE DU CHAOS (marque du Chaos en latex, pas de maquillage)\r\n    ELFE NOIR (oreilles en latex + maquillage)\r\n    ORC (demi-masque)\r\n    GOBELIN (demi-masque)\r\n    SATYRE (cornes en latex NON FOURNIES + maquillage)\r\n    SKAVEN (demi-masque)\r\n    MORT-VIVANT (plaies en latex + maquillage)\r\n\r\nConseil : Tu peux réserver lors de l’inscription un masque (orc, gobelin ou skaven en nombre limité).  Si tu choisis un personnage nécessitant du maquillage, prévois des lingettes démaquillantes.\r\n\r\nTu peux également choisir d’incarner une créature monstrueuse (limitée à 1 seule par équipe) :\r\n\r\n    HOMME-ARBRE\r\n    MINOTAURE\r\n    TROLL\r\n    DÉMON MAJEUR (Khorne, Tzeentch, Nurgle ou Slaanesh)\r\n\r\nConseil : Le costume d’une créature monstrueuse est compliqué à réaliser et souvent coûteux. Si tu débutes dans le GN, oriente-toi plutôt vers les créatures normales.\r\nClasses accessibles\r\n\r\n    ARQUEBUSIER\r\n        L’arquebusier est un personnage quasi mystique pour de nombreuses races primitives. Il est facilement repérable à son canon qui crache une bille d’acier propulsée par la poudre noire. Ça fait des ravages dans les lignes adverses.\r\n    CAPITAINE\r\n        Le capitaine, phare dans la tempête du match, dirige son équipe d’une poigne de fer, participe au recrutement des nouveaux joueurs pour remplacer les pertes et se pavane allègrement en ville.\r\n    COACH\r\n        Le coach, manager d’une équipe, s’occupe des blessés, de la stratégie et gère les gains de son équipe. Son but, constituer la meilleure équipe afin de gagner le tournoi et inscrire son nom en lettres de feu dans les annales du Bloodball.\r\n    GUÉRISSEUR\r\n        Ne participe pas aux matchs de Bloodball\r\n        Maître herboriste dont les baumes guérissent les blessures les plus graves, le guérisseur est particulièrement apprécié pour ses conseils avisés. Il parcourt la ville mais traîne surtout au bord des terrains, où ses talents font de lui un homme riche.\r\n    MERCENAIRE\r\n        Le mercenaire est une machine de guerre, formé dès le plus jeune âge au maniement des armes et ce malgré l’encombrement d’une lourde armure.\r\n    SORCIER\r\n        Inaccessible aux Gobelins\r\n        Le sorcier manie naturellement la magie vive. Ce maître magicien peut envoyer boules de feu, lancer divers sortilèges, invoquer des démons et, au prix de grands sacrifices, faire revenir un disparu d’entre les morts.\r\n    SPADASSIN\r\n        Le spadassin peut être employé pour organiser une réunion secrète, négocier des contrats sensibles, influencer ou éliminer des gêneurs. Rapide, silencieux et muet comme une tombe, ces qualités font du spadassin un personnage aux talents recherchés.	http://gi-gn.org/event/gn-bloodball-iii/?instance_id=61	4200	2018-04-20 03:14:51+02	3	44	41	EUR	short	\N	\N	\N	\N	\N	\N
118	larmee-des-ombres	L'armée des Ombres	GN historique sur la Résistance française en 1943	Bonjour à toutes et tous,\r\nAprès visite et validation du site, je suis heureux de vous annoncer que le weekend du 10-11 novembre 2018, j'organiserai le GN L'armée des Ombres, un GN 100% historique ayant pour cadre la France occupée durant la seconde guerre mondiale.\r\n------------------------------------------\r\nLe Pitch\r\nFin 1942, les dirigeants des différents groupes de résistance se réunissent afin de mettre en application les directives des chefs de l’Armée Secrète et de s'unir pour lutter plus efficacement contre l'occupant nazi. Ce sont désormais aux opérationnels, aux résistants de terrain, de s'entendre et de s'allier. Mais les dissensions et les désaccords sont nombreux. Politique, religion et patriotisme s'entrechoquent et ne rendent pas les choses simples, même avec un ennemi commun.\r\n------------------------------------------\r\nLe GN sera prévu pour 30 joueurs.\r\nLes personnages se feront en commun entre les joueur(se)s et moi.\r\nLe site de jeu se trouve à moins d'une heure au nord de Lyon, au milieu d’un vignoble.\r\nPour ceux que cela intéresse, il sera possible d'organiser la veille au soir une discussion ayant pour thème l'époque, l'ambiance et ce qu'il est bon de savoir pour apprivoiser le jeu au mieux.\r\nLe site du GN et toutes les informations viendront bientôt.\r\n\r\nPour tout renseignement, je suis à votre disposition.	http://patneverland.wixsite.com/gn-armee-des-ombres	7000	2018-11-10 18:11:54+01	3	71	82	EUR	short	\N	\N	\N	4000	https://www.helloasso.com/associations/neverland/evenements/gn-l-armee-des-ombres	https://www.helloasso.com/associations/neverland/evenements/gn-l-armee-des-ombres
51	requiem-reichskinder-session-1	Requiem: Reichskinder Session 1	International Larp (in English): inspired by an uneasy period for Czech–German relationships right after WWII, which here takes the form of an atmospheric thriller.	Requiem: Reichskinder is a LARP game for 31 players written and organized by the Rolling Association. It was inspired by an uneasy period for Czech–German relationships right after WWII, which here takes the form of an atmospheric thriller in the fictional Rehabilitation Institute for Problematic Youth. Requiem: Reichskinder is set around the second half of the year 1945, but the game is not—nor does it attempt to be—a historical one. Players have the opportunity to experience the game either in the skin of Czech–German adolescents held in the Czechoslovak re-education Institute or in the role of the Institute’s staff.\r\n\r\n\r\nThe game deals with the big topics of personal integrity, national values, war trauma, and the blurred transition between reality and psychotropic states of mind. Its aim is to tell stories of guilt, punishment, and redemption.\r\n\r\nThere will be two international runs of Requiem: Reichskinder held in 2018:\r\n\r\n    May 3-6\r\n    May 10-13.\r\n\r\nBoth runs will start on Thursday evening and end on Sunday morning (Saturday night is dedicated to evaluation/feedback and a final party).\r\nSignup is now open!\r\n\r\nThorough information about the project is provided in the new DESIGN DOCUMENT which we recommend you read.\r\n\r\n\r\nAbout the game\r\n\r\nRequiem: Reichskinder provides an opportunity to experience the depressing environment of the fictional Rehabilitation Institute for Problematic Youth through a personal story of being uprooted, searching for one’s identity, and coping with one’s past. Our goal is to bring to light the complicated stories of people living their lives in the grey zone between Czech and German nationalities, stories of young people whose lives were changed dramatically during the war and whose troubles not only failed to vanish with the end of the war, but often got worse or only then truly began.\r\n\r\nAlternatively, players can become members of the Institute’s staff: Czechoslovaks who had often experienced the war firsthand and had to take an attitude towards the pupils in the Institute.\r\n\r\nWe provide a dark, atmospheric content game offering an intense experience, as well as a strong story that is developed during the game primarily by the players themselves, who are provided with strong techniques to do so. Our goal is NOT to create an authentic reconstruction of period realities or educational practices.\r\n\r\nThe discomfitting enviornment and strict schedule of the Institute serve as atmospheric tools that form the common framework of all the characters’ individual destinies. Our aim is by no means to  physically harass the players or to test their abilities and boundaries. At the same time, it feels appropriate to emphasize that the game deliberately works with psychological deprivation, oppression, and restriction of freedom. The game also purposefully operates by blurring the common objective reality of the characters using a number of tools that allow players to develop their stories in a personalized way.  \r\n\r\nNeither psychological deprivation nor oppression, nor restriction of freedom, nor our narrative tools (see “Drama Therapy,” “Therapeutic Procedures,” etc.) should be considered a goal of this game. Our goal is to create a powerful story, and all these methods must serve that story.\r\n\r\nThe game is set in 1945, but it is only loosely inspired by some of the real events of that time, and it is not a historical reenactment. We use selective historical facts, and our intention is to tell the stories of people, not to present a portrayal of that period. At the same time, all the characters are fictional, their plots only loosely representing the destinies of the actual children of their time, and they are often presented in a concentrated, intense, pushed-to-the-extreme form. In addition, in order to focus on the main themes of the game, some other possible themes had to be superseded; for example, religion is of no importance in the game.	http://requiem.rolling.cz/eng/	15000	2018-05-03 03:51:25+02	3	50	46	EUR	long	\N	\N	\N	\N	\N	\N
52	the-last-ones	The last ones	GN post apocalyptique. Année 2150, 30 personnes vivent en huis-clos dans un bunker.	Mon nom est Archimède Griffin et je suis, comme l’a été mon père Jonathan, le passeur de mémoire du bunker, celui qui consigne méticuleusement ce qui est et ce qui a été.\r\n\r\n    Avec les autres historiens et journalistes présents ici, nous avons déjà rempli quantité de pages sur le Monde d’Avant. De celui-ci il ne reste pas grand-chose : quelques livres, quelques images, un peu de musique, les souvenirs de nos parents, de nos grands-parents…\r\n\r\n    Aujourd’hui ce travail est presque terminé. Boris est le dernier des nôtres à avoir vraiment respiré le grand air de l’extérieur et le fleuve de ses souvenirs se tarit. Nous sommes enfermés depuis déjà si longtemps. 50 ans demain. Parfois quelque chose lui revient en mémoire et je le note, même s’il s’agit d’un détail et tant pis s’il paraît insignifiant. Je l’enregistre pour mes enfants : Loki, Chad et le si minuscule Constant. Pour les enfants des autres aussi.\r\n\r\n    Je ne suis pas désœuvré pour autant, car notre Histoire ne s’est pas arrêtée le 1er mai 2070. Elle s’écrit tous les jours et c’est celle-ci que je m’applique à coucher sur papier. Qui nous sommes, nous les derniers survivants, comment en sommes-nous arrivés là et de quoi est fait notre quotidien ?\r\n\r\n    J’ai bon espoir que cette Histoire sera encore longue à écrire. Le bunker a été intelligemment conçu par la Freedom Corporation et sa brillante intelligence artificielle anticipe tous nos besoins afin que nous ne manquions jamais de rien.\r\n\r\n    Demain nous serons le 1er mai 2120 et je remettrai un exemplaire de notre travail à Joseph Roussel. Puisse-t-il en faire bon usage et surtout en écrire la suite.\r\n\r\nLa note d’intention de la Psyko-Team\r\nUnivers et ton du jeu\r\n\r\nLe jeu se passe en l’année 2150 dans un futur hypothétique et relativement crédible.\r\n\r\nIl démarre en huis-clos : 30 personnes vivent enfermées dans un bunker sans savoir ce qu’il en est du monde extérieur. Tous se connaissent par cœur ; amour, amitiés ou inimitiés, quand on n’a que 29 visages autour de soi ils sont TOUS précieux. Et on en voudrait d’autres…\r\n\r\nVivre les uns sur les autres dans un univers fermé induit des tensions, des privations et des compromis. Le ton se veut résolument adulte et le cadre de jeu nous amènera à aborder des sujets parfois difficiles.\r\n\r\nLa reproduction est aussi un enjeu majeur pour les habitants du bunker. Le sexe y est traité principalement de façon clinique avec des situations de sexe programmé.\r\n\r\nVos personnages évolueront dans un univers bien cadré. Leur quotidien est réglé à la minute près et cette routine – qui leur a permis de survivre pendant des dizaines d’années – a quelque chose de très rassurant. Attention au moindre grain de sable dans l’engrenage, il pourrait enrayer la machine et ça… ça fait plutôt peur.\r\n\r\nDans notre univers, nous avons fait de notre mieux pour que les personnages soient tous (masculins comme féminins) équilibrés et intéressants. Ils occupent toutes les fonctions : des petites mains aux dirigeantes.\r\n\r\nQuant à l’extérieur, personne ne sait vraiment ce qu’il s’y passe mais tout le monde se pose la question. À quoi cela ressemble-t-il ? Est-ce vivable ? Et surtout : sommes-nous les derniers survivants ?\r\nNotre vision du romanesque\r\n\r\nLes personnages sont à 100% rédigés par les organisateurs et vous seront communiqués au travers de fiches romancées et plutôt denses.\r\n\r\nCe jeu est non-transparent. Il repose beaucoup sur ses secrets, aussi les différentes informations que nous vous communiquerons n’ont pas vocation à être partagées entre vous avant le GN. Il sera important de jouer le jeu, pour ne pas gâcher votre plaisir.\r\n\r\nLe GN commencera par des ateliers de mise en ambiance et d’appropriation de l’univers. Une fois le jeu lancé, priorité à l’immersion, vous resterez dans votre rôle de vendredi après-midi à samedi dans la nuit. Une zone « hors-jeu » restera néanmoins accessible pour tous en cas de besoin.\r\nInformations pratiques\r\n\r\nQuand ? Du vendredi 4 mai 2018 à 14h (horaire d’arrivée impératif) au dimanche 6 mai dans la nuit.\r\n\r\nOù ? Un gîte dans les Vosges.\r\n\r\nCombien ? Aux alentours de 110€ pour les joueurs.\r\n\r\nLes inscriptions sont désormais terminées.	http://www.rajr.fr/the-last-ones/	11000	2018-05-04 03:55:03+02	3	51	47	EUR	short	\N	\N	\N	\N	\N	\N
116	gn-projet-theta-v4	GN PROJET Thêta V4	Jeu uchronique qui se déroule en 1951. Univers et une ambiance « pulp » mais qui peuvent néanmoins aborder certaines phases très sombres de l’histoire mondiale.	The form Pré-inscription GN PROJET Thêta V4 is no longer accepting responses.	https://docs.google.com/forms/d/e/1FAIpQLScNcPd-URd7Z6AmoenKiE08Q9CE7-JskHcoijqm4VedS3Y1Sw/closedform	8000	2018-10-26 19:07:11+02	3	100	42	EUR	medium	\N	\N	\N	\N	\N	\N
41	gn-vietnam-la-riziere-sans-retour	GN Vietnam " la rizière sans retour"	Ambiance guerre du Vietnam avec des répliques airsoft	GN ambiance Vietnam prévu pour une quinzaine de participants(es). Ce GN utilisera des répliques airsoft pour plus d'immersion.\r\nCe GN n'est pas une OP mais bien un GN ambiance basé sur le fair play et le roleplay (en gros c'est une murder itinérante ).\r\n\r\nNous proposons deux sessions, l'une l samedi de 12h à 22h (environ) et une seconde le dimanche de 10h à 20h.\r\nSi la seconde session n'est pas complète possibilité de se faire une OP le dimanche.\r\nSur la quinzaine de personnages par session, trois sont des personnages féminins.\r\n\r\nPour vous détailler un peu le jeu voici que nous souhaitons vous proposer le temps de ce GN:\r\n\r\nCe GN sera (du moins on le souhaite)\r\nUn jeu ou les PJ auront des backs fouillés\r\nUn jeu nécessitant du RP ( il y a des personnes avec des traits de caractère fort à incarner).\r\nUn jeu avec des intrigues à résoudre.\r\nUn jeu physique avec de la marche et des scènes d'actions ( c'est la guerre après tout). Un minimum d'endurance est à prévoir.\r\nUn GN ou l'ambiance prime sur les combats.\r\nUn GN ou votre perso peu crever en jeu.\r\nUn GN ou on est content quand il pleut ( c'est RP).\r\n\r\nCe GN ne sera pas:\r\nUn GN de parade en costume (il faudra mouiller le maillot).\r\nUn GN de baston pure on l'on canarde à tout va ( les billes seront limitées en jeu)\r\nUn GN diplomatie ( vous jouerez des militaires en opération).	https://dramond3.wixsite.com/gn-vietnam	0	2018-04-14 02:57:36+02	3	41	38	EUR	short	https://www.facebook.com/events/270312640160932/	\N	\N	\N	\N	\N
59	gn-bloodball-iii-chaos-ball	GN Bloodball III: Chaos ball !	Une grande aventure sur le thème « Maudits des Dieux »	Pour fêter dignement leur victoire, les Pirat’ Ki Klac ont mis la ville à feu et à sang, volé la caisse de l’unique gargotte et pris la poudre d’escampette au petit matin. Personne ne les a revu depuis.\r\n\r\nCe camouflet, associé à l’arrêt des tournois et au tarissement des veines de cristaux, a entraîné un exode massif. Il n’y a plus guère d’activités à Mordheim.\r\n\r\n10 années ont passées depuis la Hired Swords Cup !\r\n\r\nUn jeune gobelin nommé Foirfouille s’est aventuré dans les ruines du monastère pour y déterrer un artefact démoniaque. Et aller savoir pourquoi, il a convaincu Arek le vieux nain Arek d’organiser une ultime édition de son mythique Bloodball.\r\n\r\nLes locaux espèrent que la récompense, l’artefact en question, attirera des équipes renommées. La seule contrainte imposée par le gobelin, “pas de races lumineuses, ça risquerait de gâter le mélange”, s’est-il empressé d’ajouter …\r\n\r\nA partir de 14 ans !\r\n\r\nToutes les informations sur le site associatif : http://gi-gn.org/event/gn-bloodball-iii/	http://gi-gn.org/event/gn-bloodball-iii/	3700	2018-05-20 04:20:01+02	3	23	41	EUR	medium	https://www.facebook.com/events/1770951916532902/	\N	\N	2500	https://www.helloasso.com/associations/groupe-d-imagination-grandeur-nature/evenements/gn-bloodball-iii-chaos-cup	https://www.helloasso.com/associations/groupe-d-imagination-grandeur-nature/evenements/gn-bloodball-iii-chaos-cup
63	gn-run-human-run-instinct-de-survie	GN Run Human Run Instinct De Survie	GN post apocalyptique	Le GN "Run Human Run", GN post-apocalypse organisé par l'association "Les Joueurs de la Forge" aura lieu du vendredi 25 mai au dimanche 27 mai 2018 au domaine du Denais à Saint-Denis d'Anjou.\r\n\r\nPour être au courant de la sortie du livret joueurs n'hésitez pas à suivre la page facebook Les Joueurs de la Forge GN.\r\n\r\nTarifs Insciptions :\r\n- PJ (Personnage Joueur) : 60€\r\n- PNJ (Personnage Non Joueur) : 25€\r\n\r\nLa participation comprend : Les repas du vendredi soir au dimanche, l'assurance, la location du terrain, la participation d'intervenants (photographe professionnelle), l'achat de matériel, le temps de jeu etc ...\r\n\r\nSynopsis :\r\n\r\nCela fait déjà un an que le début de la contagion a eu lieu... Depuis rien n’est plus comme avant, les morts ne restent pas mort longtemps et les personnes encore en vie n’ont plus rien à voir avec ce qu’elles étaient avant... C’est comme si l’humanité disparaissait petit à petit. La confiance, l’empathie, l’entraide, tout ça n’existe plus désormais ... Cet évènement nous a tous changé, et pas de la meilleure façon qu’il soit... Même moi je ne suis plus la même. La survie et l’individualisme sont ce qui fait que je suis encore là pour vous écrire ces quelques lignes.\r\n\r\nDepuis que les morts errent dans nos rues, les humains se rallient en plusieurs sortes de communautés. Différents clans avec tous des buts opposés, certains cherchent un sens à ce fléau, d’autres cherchent à construire un empire et dominer le monde par la violence, d’autres encore passent leur temps à se battre contre des hordes d’infectés, pendant que certains essayent de les protéger et de les faire redevenir humains... Je ne sais pas grand chose d’autres de ces clans, mais je sais, qu’être sans faction est devenue dangereux. Il va falloir que je choisisse où aller...\r\n\r\nUn an a passé, et le monde à bien changé... J’ai bien changé...Mais à part rester en vie quel est mon but ?\r\n\r\nUne Survivante	https://www.facebook.com/events/182164555692595/	6000	2018-05-25 04:32:34+02	3	41	55	EUR	short	\N	\N	\N	\N	\N	\N
64	project-ascension	Project Ascension	International Larp (in English): An immersive cyberpunk experience in New York City	Tomorrow is here, and it’s not what it once was.\r\n\r\n    Step 15 minutes into the future, to a dystopian New York City\r\n\r\n    Become a hacker, cyborg, or street runner in new criminal underworld\r\n\r\n    Gain entry to cyberpunk hang-out with an open bar and a live band\r\n\r\n    Pull off hacks throughout the city\r\n\r\n    Stay for two nights in New York\r\n\r\n    Be the star of your own story\r\n\r\n    Premium admission includes a two-night stay in New York City!\r\n\r\nIt’s not too long from now. We’ve taken the next steps: we put that chip in your head to make you smarter, that plug in your stomach to make you thin, and the drugs in your system to keep you going. People are becoming more than human. And nothing’s getting any better.\r\n\r\nYou know there’s something going on. They thought you were a conspiracy nut, one of the tinfoil hat crew that thought the same people who faked the lunar landing pulled off the 9/11 job. And then you saw Them. Maybe it was on some ancient message board from the early days of the internet, or maybe it was hidden code in a virus you dismantled. Maybe it was just someone at the end of a bar at 4 AM. You don’t know who they are, or how you knew it, but you saw Them, and you knew: there was a truth beyond this world of concrete and neon. Something bigger. Something above all this.\r\n\r\nSo you ditched your life. You left your parents or spouse or job or dog. You gave up all your credit cards for cash. You had your identity wiped. You went off the grid and found others searching for the same thing, even if you don’t know what that is yet. You’re not even chasing the white rabbit; you haven’t found the rabbit hole yet.\r\n\r\nBut it’s out there… the other side. Messengers come to talk to you. They give you jobs, shady things like break-ins, hacks, or worse. They make sure you don’t forget that they’re out there. And so you keep going. This is your one goal, your only goal.\r\n\r\nThis is Project: Ascension	https://www.sinkingshipcreations.com/projectascension	20900	2018-05-25 04:37:14+02	3	60	56	EUR	medium	\N	\N	\N	\N	\N	\N
40	nuit-bleue	Nuit Bleue	Pas d'information disponibles pour le moment	Ce 14 Avril, les Tisseurs d'Etoiles vous proposent de résoudre, non pas une, mais quatre enquêtes simultanées, avec vos amis pour vous aider.\r\nPar équipes de 3 à 5 personnes, vous pourrez interroger les suspects, découvrir quelques méta-techniques pour simuler le crochetage ou un trajet en voiture, et vous amuser en allant d'un mystère à l'autre. Enfin, vous pourrez comparer vos déductions à celles des autres équipes, et partager vos impressions avec tous les joueurs et joueuses.	http://tisseursdetoiles.com/wp-content/uploads/2016/10/Planning2017-2018v.pdf	1000	2018-04-14 02:54:23+02	3	40	37	EUR	hours	\N	\N	\N	\N	\N	https://tisseursdetoiles.com/grand-jeu/inscription-grand-jeu-les-corps-de-least-end/
61	walpurgis	Walpurgis	International Larp (in English): a larp of phantasmagoria, psychedelia and the Occult.	A larp of crimson, velvet and raven.\r\nOf lost identity, perceived truth,\r\ninner horror and hidden lights.\r\nThe 70’s as psychedelic canvas,\r\nnightmare caves in white.\r\n\r\nEnter Walpurgis,\r\na larp of phantasmagoria, psychedelia and the Occult.\r\n\r\nMore information at: http://www.somnia.org/en/walpurgis/\r\n\r\nWalpurgis is an English language larp, and therefore all communication inside this group will be in English. Any person that post in a different language will be requested to translate or delete the message.	http://www.somnia.org/en/walpurgis/	18500	2018-05-24 04:26:54+02	3	59	54	EUR	long	https://www.facebook.com/events/193320794550623/	\N	\N	\N	\N	https://docs.google.com/forms/d/1KocnWTRK0M3xyxF7YaopyYgwHttD6d0wBlKfsdF4e4Q/viewform?edit_requested=true
96	a-nice-evening-with-the-family	A nice evening with the family	International Larp (in English): A Larp about the Contemporary Nordic Family	Plays\r\n\r\nThe story of A Nice Evening with the Family is based on several Nordic plays that all focus on the concept of family. We want to explore our social roles in the family, how it shapes us and gives us purpose. But also how it binds us together and how the past returns to limit our freedom. By using plays written in different times we can explore what in the perception of family has changed and what has not. How can we, like the characters in the plays, still hurt the ones we love – and still love those who hurt us?\r\n\r\nTo help us explore this we use plays about families written by some of our greatest Nordic writers during the last 150 years. We ask ourselves, what is still relevant, what is still problematic? Have we changed at all, or is it just a facade?\r\n\r\nWe deal with topics like patriarchy, financial power, racism, the female role in the family, gambling addiction, sex, infidelity and pedophilia. Above all, it’s about keeping all of this hidden, to only display the surface and not letting anyone see anything but success and happiness.\r\n\r\nFor this reason we have chosen the following plays. The plays will be presented here as they are released.\r\nThe Celebration (Festen)\r\n\r\nBy Thomas Vinterberg (dk)\r\nThe frame of our story. During Helge’s 60th birthday party his oldest son, Christian, accuses him of rape, incest and the death of his sister. To keep the facade up, all the guests act like nothing and Christian is silenced.\r\n\r\nThe evening goes on, more and more facts surface that point to the horrible things being true. In the end they can’t keep it down anymore and all the family demons are let out.\r\n\r\nThe Celebration is originally a Danish movie by Thomas Vinterberg from 1998, that won the price of the jury of the Cannes film festival that year. It has later been rewritten as a theatre script. Watch the trailer.\r\nTestimonial\r\n\r\nThe Celebration is one of my favourite movies. Playing a character in the Celebration at A Nice Evening with the Family is the closest I have felt to being in a movie at a larp. It was a great combination of many of the scenes played out almost exactly like scenes from the movie while at other times there were unexpected scenes with characters that expanded on and enriched the story.\r\n— Tor Kjetil Edland\r\n\r\nIt was tumultuous, an emotional roller coaster and a larp that affected me for a long time.\r\n— Johan Röklander\r\nA Doll’s House (Et Dukkehjem)\r\n\r\nBy Henrik Ibsen (no)\r\nNora is Helmer’s perfect doll’s house wife who always keeps him happy. But she has a secret, she has a loan and has forged a signature out of love for him. As the past catches up with her in the form of old friends, she gets more and more desperate to solve the situation, without Helmer knowing. When he does find out she expects him to stand up for her, but instead he blames her. She realises she cannot be with him anymore, and leaves.\r\n\r\nA Doll’s House is a classic play that premiered in Copenhagen in 1879. It created a lot of controversy for questioning gender roles and marriage, and has since been a classic. In 2006, the centennial of Ibsen’s death, A Doll’s House held the distinction of being the world’s most performed play for that year.\r\nFind the play on Project Gutenberg.\r\nTestimonial\r\n\r\nPlaying in A Doll’s House at A Nice Evening gave me a whole new perspective on the play and on Ibsen as a writer. I had seen A Doll’s House performed maybe three times before, but only when being “inside” the play did I really feel like I got it: who these people were, why they were worth caring about, how Nora was like the hero of a Greek tragedy, doing the Right Thing expected of a bourgeois housewife at every turn, a path leading to ruin. Though unlike the tragic Greeks she eventually discovered the inherent contradictions of those “Right Things”.\r\n— Eirik Fatland\r\n\r\nPlaying Nora was a magical experience. Her journey from living to please her husband to living for herself is an inspiring storyline, and it was both surprising and challenging to play in the best of ways. I found that even if A Doll’s House has been told a million times, the format of A Nice Evening with the Family made it possible for me to make my own version of Nora’s story unfold.\r\n— Ida Nilsson\r\nTrue Women (Sanna kvinnor)\r\n\r\nBy Ann Charlotte Leffler (se)\r\nAn intense family drama where the men keep being irresponsible and unable to deal with the temptations of life. The father of the family is heavily in debt from gambling, the son-in-law is having an affair and the suitor sides with the would be father-in-law instead of the woman he is courting. The women of the family are by their social roles and the need of the family forced to endure their charming but immature men and their actions.\r\n\r\nIt is a story that to this day keeps repeating itself over and over and not much has changed since it premiered at the Royal Dramatic Theatre in Stockholm in 1883. It was inspired by a Swedish law from 1874, that allowed married women to control their own fortune and income, and the problems that occurred when their husbands still felt entitled to it.\r\n\r\nFind the play in Swedish here. English will come.\r\nTestimonial\r\n\r\nSpiralling downward with my character and savoring every happy moment, brought on an avalanche of emotions and weeks of after-learning. An experience I would not want to miss.\r\n— Margrete Raaum\r\n\r\nA Nice Evening with the Family gave me a vibrant experience of the suffocating family dynamics of True Women. With the help of the on site directors and dramatic techniques, not only did we make the script our own, we made it come alive.\r\n— Gustav Nilsson	https://aniceevening.se/plays/	25000	2018-08-17 17:25:54+02	3	85	81	EUR	medium	\N	\N	\N	\N	\N	\N
78	camp-aventures	Camp Aventures	Camp de vacances comportant 3 GNs, pour débutant ou habitués.	PRÉFACE\r\n--------------\r\nVous avez envie de découvrir l'univers du jeu? Ce camp est fait pour vous! Il s'adresse autant aux novices qu'aux experts, aux jeunes qu'à leurs parents. Il a été construit pour pour pouvoir accueillir tous les publics, pour autant que ceux-ci soient motivés à découvrir le jeu.\r\n\r\nAlors n'hésitez pas à plonger dans l'Aventure et à solliciter les Organisateurs en cas de besoin!\r\n\r\nBienvenue!\r\n\r\n-----------------\r\nACTIVITÉS\r\n-----------------\r\nLe Camp Aventure prône le jeu sous ses différentes formes. Il s'intéresse principalement à sa dimension Grandeur Nature, où le costume et le jeu théâtral se mêlent à la narration et aux mécaniques de jeu.\r\n\r\nSur la semaine auront lieu trois jeux de rôles grandeur nature (GN):\r\n- Un GN Futuriste propulsé dans un ton bon enfant;\r\n- Un GN 1001 Nuits bercé dans une ambiance mystérieuse et des relations humaines;\r\n- Un GN inspiré de la bande-dessinée "Seuls", dessinant la survie d'adolescents perdus.\r\n\r\nDe plus, d'autres activités ludiques prendront place chaque jour:\r\n- Du TrollBall, le sport d'équipe des GNistes, où l'on se lance une tête de troll en combattant nos adversaires avec des armes en mousse;\r\n- Une activité inspirée des célèbres jeux vidéo "Myst", où la résolution d'énigmes débloquera les mystères de l'inconnu;\r\n- Une adaptation grandeur nature du jeu de plateau "Shadow&Hunters", où les braves Hunters partiront à la chasse nocturne des terribles Shadows;\r\n- Une "Sardine" (cache cache coopératif) thématique;\r\n- Une chasse aux fantômes digne des fameux "Ghostbusters";\r\n- Une soirée jeux placée sous l'égide de l'horreur.\r\n\r\nEnfin, de nombreux moments permettront de partager des jeux de cartes, de plateau, de rôles, des sports d'extérieur improvisés, de l'art, des chants de groupe, du lancer de poutres écossaises ou tout ce que vous jugerez bon d'emmener avec vous pour le faire découvrir aux autres Aventuriers!\r\n\r\n\r\n--------------------------------------------\r\nCONDITIONS D'INSCRIPTION\r\n--------------------------------------------\r\nPour participer au Camp Aventure, il est nécessaire d'avoir entre 18 et 95 ans et d'être couvert par une assurance Responsabilité Civile.\r\n\r\nL'inscription au Camp Aventure 2018 nécessite deux étapes:\r\n- Remplir dûment le présent formulaire;\r\n- Effectuer le paiement des frais d'inscription (460 CHF).\r\n\r\nCoordonnées bancaires:\r\nNom: A-Venture\r\nBanque: Banque Alternative Suisse\r\nIBAN: CH80 0839 0035 2013 1000 0\r\nRue: Avenue Devin-du-Village 1\r\nVille: 1203 Genève\r\n\r\nCCP: 46-110-7\r\nClearing bancaire/IID: 8390\r\nBIC (SWIFT-Code): ABSOCH22\r\n\r\nLes éventuels frais bancaires dus à un paiement international sont à la charge du donneur d'ordre, tout comme les éventuels frais de conversion de devise (nous devons de notre côté recevoir 460 CHF).\r\n\r\nLes inscriptions seront traitées dans leur ordre d'arrivée sans autre critère de choix. Si plusieurs inscriptions devaient entrer en conflit à cause d'un paiement reçu en même temps, la place reviendra à la personne ayant complété le formulaire en premier.\r\n\r\nUne fois le formulaire rempli et le paiement reçu, un e-mail de confirmation vous sera envoyé pour attester que votre inscription est complète.\r\n\r\nLes inscriptions sont ouvertes jusqu'au mercredi 9 mai 2018, ou dès que toutes les places auront été attribuées.\r\n\r\n\r\n--------------------------------------------------\r\nCONDITIONS DE PARTICIPATION\r\n--------------------------------------------------\r\nLes Organisateurs attendent de vous:\r\n\r\n- Une présence sur toute la durée du camp: du lundi 9 juillet 2018, 12h00, au dimanche 15 juillet 2018, 14h00. Dans le cas d’obligations ou d’imprévus, merci d’avertir les Organisateurs. Même s’il n’est pas dramatique que quelqu’un arrive en retard ou parte avec de l’avance, gardez à l’esprit que cette inscription est un engagement pour tout le camp, et pas uniquement pour une activité.\r\n\r\n- Une participation aux activités proposées: celles-ci seront annoncées à l’avance et les Organisateurs resteront bien entendu à votre écoute en cas de problème ou d’inconfort vis-à-vis de ces dernières, et vous aurez l’occasion de vaquer à vos occupations pendant les temps libres. \r\n\r\n- Du fairplay: le but des activités du Camp Aventure ne sera jamais de les “gagner”, mais d’avoir du plaisir à les jouer. Comme on dit, “il vaut mieux tomber avec panache que vaincre sans gloire”. \r\n\r\n- Un respect des consignes de sécurité et de jeu: même si votre personnage est sur le point de trépasser, prenez toujours garde à ne pas mettre en danger la personne qui se trouve derrière. Des consignes précises vous seront données avant les activités et pour le bien-être commun, les Organisateurs tiendront à ce qu’elles soient respectées. \r\n\r\n- Un respect des règles propres au lieu: le lieu du camp est loué et par conséquent, soumis à quelques “règles non négociables” à ce propos (espaces fumée, pièces condamnées, etc.) qui seront présentées en début de séjour. \r\n\r\n- Le gestion de vos propres costumes pour les activités qui en nécessitent (des informations à ce propos vous seront envoyées dans un second temps).\r\n\r\n- Le respect de la loi Suisse pour tout ce qui concerne l’alcool, la cigarette ou d'autres drogues.\r\n\r\n\r\nLes Organisateurs vous conseillent de:\r\n\r\n- Profiter de se couper du monde le temps d'une semaine: c’est l’occasion de vous débarrasser de l’heure, de votre connexion, de vos responsabilités habituelles, etc.\r\n\r\n- Profiter de l’esprit communautaire: préférez des enceintes aux écouteurs pour partager votre musique, préférez votre voix à vos livres pour partager vos histoires, etc.\r\n\r\n- Faire preuve de bienveillance et d'ouverture: accueillez ceux que vous ne connaissez pas encore, ils en valent assurément la peine.\r\n\r\n\r\nNous vous encourageons à:\r\n\r\n- Emporter avec vous vos jeux de plateaux, de cartes ou de rôles, vos instruments de musique ou toute autre passion que vous souhaiteriez partager.\r\n\r\n- Solliciter les Organisateurs pour toute question ou remarque qui vous viendrait à l’esprit. Après tout, ils sont là pour ça.\r\n\r\n\r\n------------------------------------------------\r\nCONDITIONS DE DÉSISTEMENT\r\n------------------------------------------------\r\nL'organisation d'une semaine de camp et le GN en particulier demandent beaucoup d'énergie et de prévisions. Il s'agit d'écrire un rôle pour chaque personne, dont les implications en jeu ont été travaillées assidûment. Aussi, l'absence imprévue d'une personne peut être très handicapante pour tout le groupe et pas uniquement pour les Organisateurs.\r\n\r\nDans le cas où vous ne pourriez pas participer au Camp Aventure 2018 après en avoir effectué le paiement, l'ensemble des frais d'inscription vous seront remboursés si votre désistement est annoncé avant le 9 mai 2018. Dans le cas contraire, la somme totale restera due et ne pourra être restituée.\r\n\r\nIl est toutefois possible de trouver une personne de remplacement, qui participera à votre place au Camp Aventure. Celle-ci devra alors remplir le présent formulaire et mentionner qui elle remplace. Libre ensuite aux deux personnes concernées de s'arranger financièrement si elles le souhaitent.\r\n\r\nATTENTION! Dans le cas d'un remplacement tardif, les Organisateurs ne pourront pas forcément accéder à toutes les demandes spécifiques de la personne remplaçante, tels que des sujets sensibles, des spécificités alimentaires, etc. avec autant de facilité que pour les autres Aventuriers inscrits depuis longtemps. Cependant, les Organisateurs s'engagent à faire tout leur possible pour intégrer au mieux la personne remplaçante.	https://www.facebook.com/aventure.evenements	39300	2018-07-09 15:18:19+02	3	72	67	EUR	long	\N	\N	\N	\N	\N	\N
97	mission-encelade	Mission Encelade	Le thème de ce gn est l'anticipation de la conquête planétaire, après une 3ème guerre mondiale qui a chamboulé l'organisation civile, sociale et humaine.	Mission Encelade est un jeu de rôle grandeur nature organisé par l'association Neverland, il se déroule du 18 au 19 août 2018. \r\n\r\nLe thème de ce gn est l'anticipation de la conquête planétaire, après une 3ème guerre mondiale qui a chamboulé l'organisation civile, sociale et humaine. \r\n\r\nL'action se déroule en 2049.\r\n\r\nLes grands cataclysmes qui ont frappé la civilisation humaine sont encore mal connus. La géographie de la Terre a connu une activité extrême, suite à la troisième guerre mondiale entamée par Donald Trump, précipitant le réchauffement climatique et la montée des eaux. Ainsi l'humanité doit aujourd'hui régler des problèmes dont elle est elle-même responsable. Tous les présidents ont été destitués pour laisser place à l'Organisation Mondiale Terrienne (OMT), qui veille, grâce à un programme de conquête planétaire, à préparer le futur de l'humanité, la Terre n'étant plus un lieu sûr pour les décennies à venir. Les concepts de Nations ont laissé place au concept d'Humanité, les grandes sociétés humaines aux micro organisations communautaires.\r\n\r\nChaque ville, communauté ou autre... est responsable de son fonctionnement et doit rendre des comptes à l'OMT qui statue alors pour un libre fonctionnement ou un placement sous tutelle.\r\n\r\nL'énergie est fournie à l’échelle mondiale par un réacteur MAKO, fruit de la fusion du savoir des anciennes grandes puissances mondiales, il permet de maintenir les réseaux de communication, les hôpitaux et une forme de nouvelle économie. Les mains d'oeuvre cadres et ouvriers vivent dans les bas fonds de la ville et servent à faire fonctionner toute l'infrastructure de MAKO au profit de l'OMT. En échange tous leurs besoins sont assurés par l'OMT,. La terre étant devenue plus difficile à vivre, l'OMT assure à chacun des Citadins, des médicaments et des protections ainsi qu'un logement minimum. Au dessus dans les hauteurs des villes, se trouvent les cadres dirigeant qui organisent l'avenir des humains. \r\n\r\nL'objectif de l'OMT est à terme de quitter la Terre devenue trop hostile, des missions sont déjà en cours depuis plusieurs années sur MARS. Une base est habitable et met une partie de l'humanité à l'abri pour assurer la continuité de la race humaine.\r\n\r\nEn parallèle des fondations privées comme celles de Léon Smuk organisent la conquête de lune comme Encelade. Encelade est sous le feu des projecteurs depuis que l'OMT a autorisé la fondation à organisé une expédition humaine à s'y établir. Un premier voyage a permis de recueillir des informations sur les conditions climatiques montrant qu'il existe une possibilité de vie dans les profondeurs gelées. \r\n\r\nUne deuxième phase de sélection est organisée le 18 août 2049 sous le nom de "Mission Encelade" afin de choisir l'échantillon humain apte à bâtir cette nouvelle humanité extra terrestre !\r\n\r\nNB: pour des raisons de praticité c'est le français qui a été choisi mondialement pour être le langage des humains.	https://gun-and-dream.wixsite.com/missionencelade	8500	2018-08-18 17:29:31+02	3	86	82	EUR	hours	\N	\N	\N	\N	\N	\N
98	orleans-1562	Orléans, 1562	GN renaissance qui sent bon duels, rapière et main-gauche. En pleine guerres de Religion (deuxième moitié du XVIe siècle).	Lors de ses divers événements, l'association Estocade GN vous propose d'incarner des personnages de la Renaissance. La toile de fond de nos jeux sera celle des guerres de Religion (deuxième moitié du XVIe siècle), période riche en événements, retournements inattendus et coups d’éclats.\r\n\r\nNous privilégierons les petits formats (une cinquantaine de joueurs) afin de mettre l'accent sur l’ambiance, les décors et les intrigues entre joueurs.\r\n\r\n***\r\n\r\nAvec "Orléans, 1562", nous allons évoquer les tout débuts des événements qui vont embraser l'Europe pendant près d'un demi-siècle. en vous faisant incarner ceux qui fuient la guerre.	https://estocadegn.wixsite.com/esctocade-gn	8500	2018-08-24 17:32:52+02	3	87	84	EUR	medium	\N	\N	\N	\N	\N	\N
99	les-griffons-2018-une-nouvelle-ere	Les Griffons 2018 : Une nouvelle ère	Jeux de rôle grandeur médieval fantastique	Bonjour,\r\nJe vous annonce l'ouverture des inscriptions pour le GN des griffons 2018.\r\nVous trouverez ci-dessous les informations principales:\r\n\r\nDate : 24 au 26Aout 2018.\r\nHoraire : Vendredi 21h00 à dimanche 14h00.\r\nLieu : Fort de Cognelot 52600 Chalindrey.\r\nNb joueur : 150 PNJ : 70.\r\nPAF : 55 euros. PNJ : 20 euros.\r\nRepas : non fourni.\r\n\r\nGriffon 2018 : Démarche\r\nLien inscription : https://www.helloasso.com/…/e…/griffon-2018-une-nouvelle-ere\r\nLien pour Fichier utile : https://www.dropbox.com/…/6v8t9z…/AAACqenHVTRiEZGIhVUTFjpSa…\r\n\r\nLe site Internet :\r\n\r\nhttps://lerepairedesgriffons.wixsite.com/mongn\r\n\r\nSynopsis des Griffon 2018 : Une nouvelle ère\r\n\r\nOnze ans auparavant, une cité nommée Teotihuacan apparut du Néant. Elle devint le creuset de la naissance d’un nouvel ordre. L’Église des Douze. Nouveaux et anciens Dieux confondus, revendiquant être les seuls êtres divins dignes de recevoir la vénération des créatures mortelles. Ils commencèrent tout d’abord par la persuasion, la parole, mais cela ne dura pas. La force des armes, du feu et des larmes de sang remplacèrent rapidement les discours. Les cadavres s’empilaient. Les flaques de sang se multipliaient. Les cris de peur et de rage fusaient de toutes parts. Dans tout Alliandre les bûchers furent érigés pour punir, purifier les hérétiques jurant contre les Douze. Du manant à la noblesse, tous doivent respect et admiration aux Douze. Tous doivent ployer le genou devant les Douze.\r\nLes rébellions écrasées. Sans aucune pitié.\r\nPendant ce temps, de profondes transformations secouèrent Teotihuacan. Abandonné des Dieux après avoir servi leurs dessins, des aventuriers vinrent de toutes les contrées, provinces et royaume d’Alliandre afin de trouver la richesse dans cette cité étrange/énigmatique. Les rumeurs les plus folles/démentes courant sur elle, des créatures uniques, des reliques revenues du passé, des lieux où la magie est plus puissante que nulle part ailleurs. Une bibliothèque remplie de possibilités infinies. Une officine de magie dont les secrets et la force n’attendent que d’être exploité.\r\nCes aventuriers ne vinrent pas seuls. Ils amenèrent avec eux leurs familles, issues des miséreux. Tous apportèrent tout ce qui constitue un homme. Le bon comme le mauvais. La cité était sans maître, sans autorité, sans loi…\r\nMais plus pour très longtemps. Ce à quoi tout le monde s’attendait, arriva. La violence se déchaîna sur la cité. Les rues et place publique n’étaient plus sûres. Des puissances surnaturelles prirent la main autour de la cité. Les gangs se déchiraient, s’entretuaient pour posséder jusqu’à la plus minuscule dalle de la cité. De ce chaos sans nom, la famille Morrel, menée par une puissante main de fer émergea.\r\nUne décennie s’écoula, les rivières de sang se tarirent. La violence se fit moins flagrante, plus étouffée, plus furtive. Lord Morrel devint le premier seigneur de la cité. Il mit en place une autorité centrale, transformant son gang en administration.\r\nAfin de glorifier le début d’une toute nouvelle ère, Lord Morrel décida d’inviter plusieurs délégations pour négocier l’intégration à une entité plus importante. Dans le seul but de protéger la cité de potentiels envieux ou futurs ennemis puissants. Il saisit l’occasion pour inviter différentes confréries dans l’intention d’installer des comptoirs qui aideront à renforcer son pouvoir ainsi que sa richesse. Il ne se cache en rien, ne se gêne pas de mettre en évidence toutes les richesses, reliques rares ou uniques ainsi que la magie puissante parfois même obscure qui leur reste encore à découvrir dans la cité…	https://www.facebook.com/groups/201519106554634/permalink/1704198039620059/	5500	2018-08-24 17:38:19+02	3	81	85	EUR	medium	\N	\N	\N	\N	\N	\N
110	battle-yokai-games	Battle Yokai Games	Battle Yokai Game est un inspiré à la fois d’univers tel Battle Royale et Hunger Games où des gens sont voués à s’entretuer et à survivre seul ou en équipe	Battle Yokai Game est un GN inspiré à la fois de Battle Royale et de Hunger Games. Les joueurs sont voués à s’entretuer et à survivre seul ou en équipe. À cela s’ajoute un Japon où les Yokais (créatures surnaturelles du folklore japonais) ont repris le dessus face à l’humanité après la catastrophe naturelle de 2020.\r\nLe GN est donc basé sur l’action. Seule une équipe restera à la fin.\r\nUne seconde phase de jeu plus ludique apparaît après la mort de vos personnages “humains”. Vous y jouez des Esprits aux objectifs variés (sauver ou tuer des Humains, affronter des Yokais…).\r\nCet opus n’a pas vocation à connaître de suite. Si cela arrivait, vos personnages seront soit morts, soit dans un havre de paix où revenir dans l’émission n’aurait pas d'intérêt.\r\n\r\nPersonnage Joueur (PJ) et Personnage Joueur Ambiance (PJA)\r\nLe GN est divisé en 2 camps : les pro-humains et les anti-humains. Chaque camp est défendu par 5 équipes de 6 personnes. Chaque équipe est composée de 5 humains (PJ) et 1 Yokai (PJA). L’objectif est simple : être la dernière équipe survivante.\r\nLes Yokais sont plus puissants que les humains mais sont uniquement là pour gérer les équipes. Ils ne sont pas censés tuer d'humains pour éviter de déséquilibrer l’affrontement.\r\n\r\nLes armes\r\nBYG est un grandeur nature. Les armes dites blanches doivent être des armes classiques en latex. Les armes à feu sont simulées par des NERF uniquement. Les répliques de type airsoft ne sont pas autorisées.\r\nL’association ne fournit pas les armes, ni pour les PJ, ni pour les PJA.\r\n\r\nSite, couchage et repas\r\nLe site du jeu comprend une forêt, un plan d’eau avec une presqu’île et une plaine. Tout ce qu’il faut pour s’entretuer dans la joie et la bonne humeur.\r\nLe couchage aura lieu dans des bungalows en fonction des équipes. Cela s’explique en RP par la volonté du public à ce que vous soyez en forme pour vous entretuer !\r\n7 bungalows sont sur le site de jeu. Les 3 autres se trouvent à proximité (5 minutes en voiture). Le système du “premier inscrit, premier servi” s’applique pour la répartition des bungalows.\r\nLes repas sont entièrement à votre charge : des kitchenettes sont présentes dans chaque bungalow pour vous permettre de cuisiner. À cela s’ajoute une cuisine au sein du bâtiment principal.\r\nMalgré le côté « survival » de notre GN, il y aura des heures d’interruption pour dormir. De même vous êtes considérés comme hors jeu durant votre pause repas. Nous tenons à ce que vous soyez en meilleure forme physique et mentale possible pour faire un jeu de qualité.\r\nLe GN se déroule début octobre. Pensez à vous équiper en conséquence pour survivre à la température et aux intempéries probables.\r\n\r\nL’inscription\r\nPour les PJ, vous pouvez choisir lors de votre inscription l’archétype de votre personnage :\r\ncombattant, survivaliste, repris de justice, soigneur ou intellectuel, en fonction des places restantes. Vous pouvez aussi exprimer votre préférence d’alignement (anti- ou pro-).\r\nPour les PJA vous pouvez choisir votre alignement (anti- ou pro-), en fonction des places restantes.\r\nUne fois votre place choisie, vous avez la possibilité de demander à être dans la même équipe que d’autres PJs ou PJA (un seul).\r\nNous faisons au mieux pour vous mettre dans une équipe, un camp et avec un BG où vous vous sentirez bien. Cependant, vous devez prendre en compte que nous ne pouvons pas forcément accéder à tous vos souhaits. Cela à cause des contraintes logistiques et d’équilibre des 2 camps.\r\nVos BG sont rédigés par l’organisation.\r\n\r\nLa PAF\r\nElle comprend le couchage en bungalow, la location du site et les frais mis en oeuvre pour établir ce GN. Elle couvre la période du vendredi soir au dimanche midi.\r\nElle est de 70 € pour les PJ et 60 € pour les PJA.\r\n\r\nTournage\r\nChaque chef d’équipe (PJA) doit filmer les exploits, combats, actions d’éclats (ou non) de son équipe. Des caméramans sont aussi présents pour filmer d’un point de vue plus extérieur.\r\nEnfin, la présentatrice est au niveau du plateau de télévision pour commenter ou interviewer différents participants, vivant ou mort…\r\nNous espérons pouvoir transmettre des vidéos des meilleurs moments du GN “en direct” ainsi que sur le Facebook de l’association (si la connexion le jour J le permet).\r\n\r\nLe roleplay\r\nNotre univers est peuplé de créatures surnaturelles possédant différents pouvoirs.\r\nNous ferons notre maximum pour vous plonger dans l’ambiance.\r\nLes règles de notre GN se veulent les plus simples possible. Ainsi, nous comptons sur votre RP pour participer à la mise en ambiance. Jouez (voir surjouez !) les coups et les blessures. Laissez votre imagination (gore) parler. Le jeu n’en sera que plus beau.\r\n\r\nNous espérons que ce jeu vous plaira. Nous ferons tout pour !\r\n\r\nAnthony et Amélie pour l’organisation.	https://www.facebook.com/events/252106928661885/	7000	2018-10-05 18:20:01+02	3	95	93	EUR	medium	\N	\N	\N	\N	\N	\N
100	a-few-years-later	A few years later	International Larp (in English): Honour. Love. Patriarchy. (a larp in the Brudpris world)	Need to be a member of the group to learn more	http://brudpris.eu/	20000	2018-09-12 17:40:54+02	3	88	86	EUR	medium	\N	\N	\N	\N	\N	\N
15	abri-403-un-gn-post-nuklear	Abri 403, un GN post-nuklear	La radioactivité vous manque? La sûreté douteuse d’un abri contrôlé par une IA qui en veut à vos fesses vous fait rêver?	La radioactivité vous manque? La sûreté douteuse d’un abri contrôlé par une IA qui en veut à vos fesses vous fait rêver? Vous croyez encore être SPECIAL? On remet une dose de Jet dans votre bouillie au radcafard ! Et oui, on est comme ça.\r\n\r\n-------------------------------------------------\r\n\r\nLes prestations et commodités :\r\nAccès à une chambre, aux douches, aux toilettes et à la restauration. Trois repas et deux petit-déjeuners sont inclus. Vous pourrez également vous restaurez tout au long du week-end, contre de l'argent du jeu.\r\n\r\n-------------------------------------------------\r\n\r\nConditions et date d'inscription :\r\nSeules les personnes majeures (18 ans et +) à la date de l'événement peuvent s'inscrire.\r\nLes inscriptions seront disponibles le DIMANCHE 14 JANVIER 2018 aux environs de 21H 07MIN 72S.\r\n\r\n-------------------------------------------------\r\n\r\nPlaces :\r\n55 Personnages Joueurs / 75€ par personne\r\n25 Personnages Non Joueurs / 35€ par personne\r\n\r\n-------------------------------------------------\r\n\r\nSite de l'association (lien direct vers l'article) : http://fumblecorp.com/abri-403-un-gn-post-nuklear/\r\nSite du GN : http://postnuklear.fumblecorp.com/\r\n\r\n-------------------------------------------------\r\n\r\nNote :\r\nCes informations évolueront au fil du temps. Restez connectés !	https://www.facebook.com/events/1937679329886923/	7500	2018-10-05 21:12:41+02	2	13	12	EUR	long	\N	\N	\N	\N	\N	\N
108	college-of-wizardry-13-halloween-midterms	College of Wizardry 13: Halloween Midterms	International Larp (in English)	College of Wizardry is a four-day Wizard School role play event, where you can act out your dreams of being a student witch or wizard at a beautiful fairytale castle in Poland.\r\n\r\nWebpage\r\nhttps://www.wizardry.college/halloween\r\n\r\nFanpage\r\nCollege of Wizardry\r\n\r\nLanguage\r\nEnglish. It does not matter if your English is poor - do not worry about sounding strange, but please speak English at all times. You never know who's watching.\r\n\r\nAge limit\r\nTo participate, you must be at least 18 years old.\r\n\r\nTransport\r\nYou can either travel to the castle on your own or take our Witchard Bus from Berlin. The bus stops at both Schönefeld and Tegel airports and drives directly to the castle on Thursday, and back on Sunday.\r\n\r\nOrganizers\r\nCollege of Wizardry is made by Dziobak Larp Studios, an international larp organizing collective, with the assistance of a huge group of people!\r\n\r\nQuestions\r\nObviously, there are things we haven't covered on this web site. If you are curious about something, don't hesitate to ask. We'll do our best to answer you. Write to friends@dziobak.studio!\r\n\r\n[disclaimer: This event page is not for sign up. It’s place where we, organizers, will publish information about this event]\r\n\r\n#cow13 #cowlarp #collegeofwizardry	https://www.facebook.com/events/1689771397712147/	54000	2018-10-04 18:13:27+02	3	34	32	EUR	long	\N	\N	\N	\N	\N	\N
105	arn-10	ARN 1.0	Jeu de rôle grandeur nature, dans un univers normand post apocalyptique.	Jeu de rôle grandeur nature, dans un univers normand post apocalyptique.	https://www.facebook.com/events/268587670329618/	5500	2018-09-28 18:05:17+02	3	92	90	EUR	medium	\N	\N	\N	\N	\N	\N
23	chroniques-transylvaniennes-les-rameaux	Chroniques Transylvaniennes : Les Rameaux	Vampire Dark Age	Alors que la Transylvanie se rassemble à Klausenburg pour la procession des Saules du Dimanche des Rameaux, les tensions autour de ce bastion ancestral se multiplient.\r\n\r\nLa guerre entre les deux prétendants au trône s'intensifie et il ne reste plus grand chose de ce qui fut Klausenburg. En ces jours de célébration de la Passion du christ, les habitants de Klausenburg retiennent leur souffle, craignant pour leur avenir.\r\n------------------------------------------------------------------------------------------\r\nCe GN, organisé par l'association Chroniques et Chimères s'inscrit dans la cadre d'une chronique, dans un monde largement inspiré de "Vampire : Dark Ages". Il se déroule en jeu en 1056, en Transylvanie\r\nIl se déroulera du vendredi 23 Mars 2018, 16h00, au dimanche 25 mars 2018, 12h00, au Fort de Montbré.\r\nIl est prévu 90 places de PJ et 25 place de PnJ.\r\n\r\nTous les repas du samedi matin au dimanche midi, ainsi que des grignotages le vendredi soir seront fournis par l'organisation.\r\nIl faut prévoir son couchage , son campement (en salle en dur) EN JEU ainsi que ses couverts + gobelets + assiettes. (RIEN NE SERA FOURNI PAR L'ORGANISATION)\r\nDes toilettes et des lavabos seront à votre disposition..\r\n\r\nSi vous ne l'avez pas déjà fait, créez votre compte sur le site internet de l'association : http://chroniquesetchimeres.com/index.php\r\nC'est à cet endroit que vous aurez votre BG et trouverez les documents de jeu en téléchargement. Rien de sera envoyé par mail.\r\n\r\nSi vous êtes un NOUVEAU joueur, contactez IMPERATIVEMENT les orgas avant d'envisager de prendre votre place.\r\nLes inscriptions seront closes le 15 février à 23h55. Nous n'effectueront aucun remboursement ni report, ni remplacement de place passée cette date.\r\n\r\nPour tout renseignement, envoyez un mail à chroniques.chimeres[@]gmail.com\r\n\r\nA très vite!	https://www.facebook.com/events/110573636233080/	6700	2018-03-23 01:10:05+01	3	22	20	EUR	short	\N	\N	\N	\N	\N	\N
72	new-world-magischola	New World Magischola	International Larp (in English): 4-day wizard school larp set in the Magimundi of North America. NWM is a progressive wizard school with less-traditional policies.	No extra info available for the moment	http://www.magischola.com	65000	2018-06-21 05:03:20+02	3	67	62	EUR	long	\N	\N	\N	\N	\N	\N
112	no-middle-ground	No Middle Ground	International Larp (in English): Inspired by tv series like ‘The West Wing’, ‘Designated Survivor’, ‘House of Cards’ or ‘Borgen’, 'No Middle Ground’ is a game about power.	Setting\r\n\r\nThe setting for this game is a beautiful Spanish hotel where an international summit is taking place, with several nations in attendance. The official purpose for this summit is to create international guidelines for medicine research and distribution.\r\n\r\nOf course nobody is expected to stay on topic for too long: time is money for these people and there are so many things to discuss, both publicly and in private.\r\nBesides, external events and discoveries will also have an effect on both the negotiations and the people in attendance. So do not worry if you do not know much about medicine. Any information that is absolutely essential to start the negotiations will be provided by us. The initial topic is a starting point, a reason to get these characters together in one place. It is not the theme of the larp. The direction of your journey from the moment you first take place in one of the conference rooms is entirely up to you and your co-players.\r\n\r\nThe delegations that the characters belong to will represent existing countries but the politicians will be fictional. In some cases the dominant parties or major occurrences in these countries may be changed a bit for dramatic purposes. This will become clear from your character sheet and group description.\r\nExperience\r\n\r\nIn this larp you will spend two days as a powerful individual on an international summit. The stakes for your country and your personal career have never been as high as today. You also know that everybody in the room thinks the same way and will not give you anything for free.\r\nThis is the time to make the big deals. But you will have to continuously balance integrity and success, your country’s interests and your personal goals. You will have to make decisions that influence others and shape who they are and who you need them to be.\r\n\r\nThe game is character-driven, which means that most of the things that will happen in the game originate from the characters. You character will have a lot of play- and plot hooks and several relationships. Finding and playing on the difference between this character as a role (‘the press secretary who will stop at nothing to praise his country’) and as a person (‘the man in a burn-out who is still hung up on his divorce and really just wants a moment of peace’) is one of the main challenges of this game. When will you show feelings and when will cold professionality win the day? Who can you trust with information, with ideas, maybe even with moments of weakness?\r\n\r\nThe characters all have goals and character traits that will hopefully create play and strong scenes for everybody. Besides your personal goals the world will not stop turning during the Summit. Your character will be able to react to external happenings and you can use them to stress certain aspects of your game or your character.\r\nThe game will however not have a big sweeping plot that will keep all the characters busy all the time. One of the main pulls of the game is the opportunity for side deals, for getting to know the other invitees and to see what you can use them for. Or whether you secretly love them. Or maybe both.\r\n\r\nThis larp is not intended to be one big meeting, and we will try to give all the characters several goals on both a professional and a personal level. There will be plenty going on. You can chose to get involved in as many things as possible or care about one thing very intently. If you think large meetings are fun you can attend those, if you like to make one-on-one appointments that is also possible. You can also choose to mainly play on the character’s’ personal life and personality instead of their summit goals. We will create a lot of options but very few mandatory talks.\r\n\r\nIt is also not intended as a current affairs simulation. If you are very knowledgeable about world politics, political science or various humanitarian crises, try to keep the discussion at a level where all can participate.\r\nOf course these themes are part of the game, and we strongly encourage you to speak about -and play with- what certain political situations will mean for your characters. But try to stay respectful and do not mock other players when they do not know the name of the president of Kenya.\r\nThe game should be playable for everyone with an interest in experiencing what it is like to be a powerful decision-maker who has to maneuver between similarly powerful people. In-depth knowledge of world politics should be a bonus, not a requirement.\r\nCharacters\r\n\r\nThe majority of the characters in No Middle Ground will be part of a delegation that represents one of the six countries that will attend the summit.\r\n\r\nThe makeup of these delegations will vary a bit, but each country has a president, and most delegations will have various ministers and diplomats, security personnel and aides or assistants. Those presidents who have partners will have them accompany them to the summit to help in diplomatic negotiations.\r\nThere will also be a few lobbyists for various corporate- and other interests.\r\n\r\nApproximately 5 characters will be journalists. Their gameplay will be a bit different from that of the politicians. They will not be able to directly influence the decisions, but because they control the narrative towards the outside world they are hugely influential in how those decisions are perceived.\r\n\r\nThis setup means that the characters will be more or less split between those who wield obvious power (politicians) and those who distribute that power and influence the form that it takes (journalists, lobbyists, aides).\r\n\r\nShortly after you sign up we will send you a questionnaire. We will assign you a character according to the experience you prefer. All characters will be pre-written and provided by the organization at least a month before the larp, including all the character’s plots and relationships. Keep in mind that in order to save some surprises for the larp, a certain degree of secrecy is needed regarding these.\r\n\r\nThe people who sign up as patrons will get a chance to Skype with the character writers to make adjustments and voice preferences.\r\n\r\nWe will provide you with the contact information for the players of the characters your role has a relationship to and we will organise preparatory workshops to give those connections a finishing touch before the game starts.	http://nomiddleground.notonlylarp.com/	17500	2018-10-06 18:25:51+02	3	96	95	EUR	short	\N	\N	\N	\N	\N	\N
48	bothwell-school-of-witchcraft-2	Bothwell School of Witchcraft 2	International Larp (in English): live out your dream of becoming a real life student of magic	The Bothwell School of Witchcraft is a place where you can finally live out your dream of becoming a real life student of magic. The story, characters, props and scenery will bring our school to life and leave you with an unforgettable experience!\r\n\r\nYou'll stay for 4 days, full board, and be sorted into your house, take part in lessons, attend a banquet, explore the grounds and meet weird and wonderful creatures. All of this takes place in our enchanting 15th century castle.\r\n\r\nThe event runs much like a murder mystery. You'll be given a role to play and a story will unfold around you where you have to interact with other characters. It's just just like being in a movie or video game! We'll provide the robes, so all you'll need is a wand and good humour. If you've never experienced anything like this before, don't worry. We cater for all backgrounds; you can get as much or as little involved as you like and we will have all you need to have a great time.\r\n\r\nBothwell School of Witchcraft is an all new addition to the College of Wizardry Universe based in the UK. This event is for over 18s only.	https://www.bothwellschoolofwitchcraft.com	64225	2018-04-26 03:36:57+02	3	47	44	EUR	long	\N	\N	\N	\N	\N	\N
73	chilipocras-et-dautres-machins	Chilipocras et d'autres machins	Rendez-vous amical GNiste près de Belfort	Voici quelques nouvelles d'Alliance Prod :\r\n\r\n- nous n'avons pas prévu d'organiser de GN cet été à notre traditionnelle date du "ouais c'est ça, vers le 15 août". Cette année à la même époque, nous goûterons un repos bien mérité en sirotant des daiquiri-pontarlier sur une plage ensoleillée de Vaivre-et-Montoille.\r\n\r\n- comme on est pas des branleurs pour autant, on a déjà commencé à bosser sur un projet pour l'été 2019, à notre traditionnelle date du "le 15 août ? vous êtes pas à glander à la plage de Vesoul à cette date ?". L'alignement des astres qui fait tomber le 15 août un jeudi combiné à une année sans prépa de GN en 2018 nous permettent d'envisager un projet un peu particulier sur 4 jours (du jeudi au dimanche). Vous trouverez plus d'informations dans l'image jointe à cette communication si vous êtes équipés d'un récepteur FB pour l'image et le son.\r\n\r\n- comme on aime pas rester trop longtemps sans vous voir, nous vous proposons un week-end festif, gastronomique et ludique les 23 et 24 juin 2018 au Fort du Vezeloy. Initialement porteur du nom de code "Chilipocras", ce projet en partie top secret a été redéfini et porte désormais le nom de code "Chilipocras et d'autres machins". Il est possible que le projet Master-Chatte fasse partie des autres machins... D'autres informations vous seront dévoilées en février. En tout cas, la date est posée.	https://www.facebook.com/permalink.php?story_fbid=1975069185855259&id=147817381913791	2993	2018-06-23 05:05:38+02	3	68	63	EUR	short	\N	\N	\N	\N	\N	http://tbrocard.fr/allianceprod/teuf2018/
26	projet-z-	Projet -Z-	Un GN survival, zombie dans une uchronie contemporaine : GN pour adultes averti.e.s	Lien fermé aux membres externes du groupe	https://www.facebook.com/groups/1508080815946579/	6500	2018-03-24 09:32:23+01	3	26	24	EUR	hours	\N	\N	\N	\N	\N	\N
34	college-of-wizardry-16	College of Wizardry 16	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	- Become a student witch or wizard and attend classes about the magical arts\r\n- Explore the castle and meet the magical creatures that roam the grounds\r\n- Spend three nights living at beautiful Czocha Castle in Poland\r\n- Join one of the five ancient Houses of Czocha College\r\n\r\n- Attend the College’s spectacular Welcome Ball\r\n\r\n- Meet new people and form lasting friendships \r\n\r\n- Have a once-in-a-lifetime adventure\r\n- Supported by Erasmus+\r\n\r\nCollege of Wizardry is a four-day roleplaying experience at a 13th Century castle where you can embrace your dreams of being a student at a school of magic.\r\n\r\nIt's a live action role play (larp) adventure, which means that for your days at the College, you'll be a witch or a wizard instead of your daily self.\r\n\r\nDon't worry if you've never tried anything like this before. College of Wizardry is designed to be newcomer-friendly, and we've had hundreds of first-time players walk through the gates of Czocha Castle.	https://www.cowlarp.com	62000	2018-04-05 23:40:16+02	3	34	32	EUR	long	\N	\N	\N	\N	\N	\N
38	college-of-wizardry-17	College of Wizardry 17	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	- Become a student witch or wizard and attend classes about the magical arts\r\n- Explore the castle and meet the magical creatures that roam the grounds\r\n- Spend three nights living at beautiful Czocha Castle in Poland\r\n- Join one of the five ancient Houses of Czocha College\r\n- Attend the College’s spectacular Welcome Ball\r\n- Meet new people and form lasting friendships \r\n- Have a once-in-a-lifetime adventure\r\n- Supported by Erasmus+\r\n\r\nCollege of Wizardry is a four-day roleplaying experience at a 13th Century castle where you can embrace your dreams of being a student at a school of magic.\r\n\r\nIt's a live action role play (larp) adventure, which means that for your days at the College, you'll be a witch or a wizard instead of your daily self.\r\n\r\nDon't worry if you've never tried anything like this before. College of Wizardry is designed to be newcomer-friendly, and we've had hundreds of first-time players walk through the gates of Czocha Castle. \r\n\r\nAnd if you have any questions, we're here to answer them!	https://www.cowlarp.com	62000	2018-04-12 02:40:29+02	3	34	32	EUR	long	\N	\N	\N	\N	\N	\N
119	college-of-wizardry-18	College of Wizardry 18	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	Welcome to magic school\r\n\r\n- Become a student witch or wizard and attend classes about the magical arts\r\n- Explore the castle and meet the magical creatures that roam the grounds\r\n- Spend three nights living at beautiful Czocha Castle in Poland\r\n- Join one of the five ancient Houses of Czocha College\r\n- Attend the College’s spectacular Welcome Ball\r\n- Meet new people and form lasting friendships \r\n- Have a once-in-a-lifetime adventure\r\n- Supported by Erasmus+\r\n\r\nThe Experience\r\n\r\nCollege of Wizardry is a four-day roleplaying experience at a 13th Century castle where you can embrace your dreams of being a student at a school of magic.\r\n\r\nIt's a live action role play (larp) adventure, which means that for your days at the College, you'll be a witch or a wizard instead of your daily self.\r\n\r\nDon't worry if you've never tried anything like this before. College of Wizardry is designed to be newcomer-friendly, and we've had hundreds of first-time players walk through the gates of Czocha Castle. \r\n\r\nAnd if you have any questions, we're here to answer them!	https://www.wizardry.college/	62000	2018-11-15 18:15:30+01	3	34	32	EUR	long	\N	\N	\N	\N	\N	\N
120	college-of-wizardry-19	College of Wizardry 19	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	Welcome to magic school\r\n\r\n- Become a student witch or wizard and attend classes about the magical arts\r\n- Explore the castle and meet the magical creatures that roam the grounds\r\n- Spend three nights living at beautiful Czocha Castle in Poland\r\n- Join one of the five ancient Houses of Czocha College\r\n- Attend the College’s spectacular Welcome Ball\r\n- Meet new people and form lasting friendships \r\n- Have a once-in-a-lifetime adventure\r\n- Supported by Erasmus+\r\n\r\nThe Experience\r\n\r\nCollege of Wizardry is a four-day roleplaying experience at a 13th Century castle where you can embrace your dreams of being a student at a school of magic.\r\n\r\nIt's a live action role play (larp) adventure, which means that for your days at the College, you'll be a witch or a wizard instead of your daily self.\r\n\r\nDon't worry if you've never tried anything like this before. College of Wizardry is designed to be newcomer-friendly, and we've had hundreds of first-time players walk through the gates of Czocha Castle. \r\n\r\nAnd if you have any questions, we're here to answer them!	https://www.wizardry.college/	62000	2018-11-22 18:15:34+01	3	34	32	EUR	long	\N	\N	\N	\N	\N	\N
101	college-of-wizardry-avalon	College of Wizardry - Avalon	International Larp (in English): a magic school larp about the old way of magic and survival in a harsh environment	What will you do during the game?\r\n\r\nExplore the island of Avalon.\r\n\r\nLearn its ancient secrets.\r\n\r\nCompete in trials of strength and cunning.\r\n\r\nBand together for protection and advantage...\r\n\r\n...or try to make it on your own.\r\n\r\nForge bonds that last a lifetime.\r\n\r\nAvalon is not an ordinary magic school larp. As a student you will certainly be taking classes and learning the old ways of magic, but you will also be fighting for survival in a harsh environment. At Avalon the teachers share their wisdom but they do not run the school. Most students join warbands for protection. These small groups plot and compete against each other; a member of one warband caught alone by members of another is likely to be hexed, or hurt, or both.\r\n\r\nAnd yet there is more to Avalon than just lessons and fighting. The island has secrets that beg to be solved, riddles to unravel, and places to discover and explore. The larp has a story. Events will unfurl based upon the actions (or inactions) of the players. These events are not pre-planned. We don’t know what will happen, but we will interact and react to what you — the players — do.\r\n\r\nThere will be plenty of time for your own plots and interactions. The stories you tell will be about your character and their time at Avalon.	http://www.avalonlarp.studio/cowavalon/	22500	2018-09-20 17:50:29+02	3	89	87	EUR	long	\N	\N	\N	\N	\N	\N
113	convention-of-thorns-session-3	Convention of Thorns Session 3	International LARP (in English) : Vampire White Wolf, deceitful and decadent vampires at the end of the 15th century	WELCOME\r\n\r\n \r\n\r\nConvention of Thorns is a larp (live action role play) event, held at the Polish castle of Zamek Ksiaz. During the event, participants take on the roles of deceitful and decadent vampires at the end of the 15th century. The larp takes place in White Wolf's World of Darkness setting and is an official White Wolf event, put together by the Rollespilsfabrikken/Liveform team in cooperation with White Wolf.\r\n\r\n \r\n\r\nIn our story, vampires are not only myths, but also very, very real - possessed of strange powers, unnatural desires and inhuman longing. Both less and more than human, they call themselves Kindred and feed off mortals.\r\n\r\n \r\n\r\nSo it has been for centuries, but now things are looking grim for the children of the night. At the end of the 15th century, the witch hunters of the Inquisition have purged most of Europe's vampires, and the fiercely-independant clans have been forced to band together, meeting for the very first Convention in 1486.\r\n\r\n \r\n\r\nNow, seven years later, vampire fights vampire, as this attempt at structuring vampire society has been met with rebellion and conflict, in what is known as the Anarch Revolt. \r\n\r\n \r\n\r\nNow the clan leaders have called for a last, desperate meeting to secure peace among the Kindred. A final attempt to rally and unite the Clans of the unliving before they are destroyed.\r\n\r\n \r\n\r\nWelcome to Convention of Thorns.\r\nTHE EXPERIENCE\r\n\r\n \r\n\r\nAs a player at Convention of Thorns, you and more than a hundred and fifty other participants will get to leave reality behind for a few days, so you can step into the world of vampires and experience the following:\r\n\r\n \r\n\r\n    Spend three evenings and nights at the spectacular Zamek Ksiaz castle.\r\n\r\n    Explore the decadence of vampire society, and immerse yourself in a world of langorous parties, shadowy power plays and monstrous cruelty.\r\n\r\n    Make new friends and meet larp enthusiasts from all over the world.\r\n\r\n    Be involved in scheming and political intrigue in a cutthroat world, where everything happens in the shadows.\r\n\r\n    Fight to retain your humanity, or give in to the Beast and unleash the horror within.\r\n\r\n    Either rent a high-quality costume from us, or bring your own Renaissance attire.\r\n\r\n    Represent your clan in high-stakes negotiations, but remember to further your own personal agenda.\r\n\r\n    Take our Vampire Bus from Berlin or travel to the castle on your own.\r\n\r\n    Use elegantly simulated supernatural powers to influence arguments, defeat opponents and explore the darker sides of (un)life.\r\n\r\n    Step into a world 500 years ago - not as a powerless spectator, but as an active participant with more-than-human powers.\r\n\r\n    Have a once-in-a-(non)lifetime adventure, with people who share your hobby.\r\n\r\n    Be a vampire in a 13th century castle!\r\n\r\nPRACTICAL\r\n\r\n \r\n\r\nDate\r\n\r\nOctober 11-14, 2018​\r\n\r\n \r\n\r\nAll-Included Price \r\n\r\n540€ Fast Falcon /640€ Regular Raven\r\n\r\nThis includes food and lodging from dinner Thursday to breakfast Sunday. Costume rental from 150€/person is also available.\r\n\r\n​\r\n\r\nLanguage\r\n\r\nEnglish. You do not need to have perfect English to play - but please do speak English at all times during the event. You never know who's watching in the shadows.\r\n\r\n​\r\n\r\nAge Limit\r\n\r\nTo participate, you must be 18+ years old.\r\n\r\n \r\n\r\nTransport\r\n\r\nYou can travel to the castle on your own, or you can take our Vampire Bus from Berlin. You can read more about the bus here on the page.\r\n\r\n \r\n\r\nOrganisers\r\n\r\nConvention of Thorns is produced by Dziobak Larp Studios, in cooperation with White Wolf. You can read more about us HERE.\r\n\r\n\r\nQuestions\r\n\r\nIf you are curious about something, don't hesitate to ask. We'll do our best to answer you. Write to us at friends@dziobak.studio or call Claus, our other Contact Organiser, at +45 22 34 24 80.	https://www.cotlarp.com/	44000	2018-10-11 18:29:29+02	3	97	32	EUR	long	\N	\N	\N	\N	\N	\N
45	nous-nirons-plus-danser	Nous n'irons plus danser	Un GN romanesque sur la vie d’un petit village de l’est de la France pendant l’occupation allemande en 1944.	Je suis né il y a bien longtemps. Je n’étais qu’un petit hameau, puis, de chaumières en chaumières, j’ai grandi pour devenir aujourd’hui le village de Montenois.  Mon corps ce sont mes maisons, mon église, ma mairie, mon école, ma boulangerie, mon manoir sur la colline. Mon cœur est inondé d’artères de terres battues, de champs et de pavés, il bat au rythme de mes habitants. Mon âme est constituée de tous ceux que j’ai vu naître et mourir, de mes 1600 villageois qui se lèvent à l’aube tous les matins et se couchent au crépuscule tous les soirs.\r\n\r\nMon histoire n’a pas été remarquable jusqu’à ce jour de 1940…\r\n\r\nLes bottes des soldats allemands ont foulé les trottoirs de ma grand rue. Je les sens en moi comme des corps étrangers. Ils ont martelés mes pavés à coups de talons. Ils ont jeté des regards méfiants à mes ruelles et mes fenêtres closes. A l’heure de l’apéritif, la ferveur habituelle et les bavardages ont laissés place à un calme inquiétant. Les boches ont pris possession de mon âme et ont fait couler le sang de mes habitants dans mon paisible cœur.\r\n\r\nAujourd’hui, en ce jour de juin 1944, je souffre toujours de cette situation. Je connais la faim, la rancœur, la douleur, le manque et le deuil. Mais quelque part au fond de moi, il y a des rires, des enfants qui grandissent malgré la peine, des amants qui s’aiment à la folie.\r\n\r\nQuelque part au fond de moi, il y a l'espoir que les pas qui fouleront à nouveau ma grand place seront ceux d'un bal populaire.\r\n\r\nViendrez-vous quelques heures ressentir le pouls de Montenois ?\r\n\r\nCe qu'est, et n'est pas notre jeu.\r\nCE QU'EST NOTRE JEU\r\n\r\nCe jeu est un GN romanesque organisé sous l’égide de l’association Rôle. Il repose sur le principe du secret. Les rôles sont longs et entièrement déterminés par les organisateurs.\r\n\r\nCe jeu est une chronique villageoise, un instant de vie, à un moment particulièrement difficile pour tous ces hommes et toutes ces femmes qui vivent en France l’occupation par l’armée Allemande depuis près de quatre ans. Vous serez amené à ressentir la simplicité d’une vie de village avec ce qu’elle comporte de familiarité, de commérages, de joies et de peines. Mais aussi à vivre cette fin d’occupation qui s’étale comme un poids infini sur les épaules de chacun de ces villageois. Une peur quotidienne et une impuissance face aux évènements, parfois repoussée à la limite de sa conscience mais toujours bien présente.\r\n\r\nCe jeu est une histoire d’injustice. Tandis que certains mangeront à leur faim et ne manqueront de rien, d'autres subiront l'oppression et le rationnement imposé par l'occupant. La bonne chair se fait rare et les privations empoisonnent les liens entre les gens.\r\n\r\nEnfin, ce jeu comporte des scènes particulièrement violentes (exécutions publiques, humiliations publiques etc…). \r\nDes safewords seront prévus pour gérer les situations problématiques et il existera une zone de basse intensité.\r\n\r\n\r\nCE QU'IL N'EST PAS\r\n\r\nCe jeu n’est pas un jeu héroïque. Vous ne serez pas amenés à sauver le monde, ni à accomplir d’action dont la portée dépassera celle du village. Vos personnages ne sont pas conscients de la libération imminente et privilégieront toujours leurs survies et celles de leurs proches. Vous ne réécrirez pas l'Histoire et vous sentirez donc parfois réellement impuissants face à certains évènements. \r\n\r\nCe jeu n’est pas un jeu fantastique. Si la religion et le mysticisme attenant à celle-ci sont évidemment présents en jeu, n’attendez aucune révélation fantastique, non les nazis ne sont pas des extra-terrestres.\r\n\r\nCe jeu n'est pas un jeu strictement historique. Les situations décrites recouvrent plusieurs périodes de l'occupation et de la guerre (40-44) et nous avons pris quelques libertés face à la réalité historique.\r\n\r\nInfos Pratiques\r\nLes sessions 3 et 4 de "Nous n'irons plus danser" auront lieu les 21/22 avril 2018 et 26/27 mai 2018. Ces SESSIONS sont CLOSES. \r\n\r\nLe questionnaire est cependant permanent et vous pouvez vous pré inscrire pour des sessions ultérieures.\r\n\r\nArrivée obligatoire dès le vendredi soir entre 20h et 21h (ateliers et briefing le soir) pour un début de jeu le lendemain dans la matinée. Le jeu se terminera tard le samedi soir. Brunch le dimanche matin.\r\n\r\nLe jeu se déroulera dans la Sarthe, à environ 1H45 de Paris en direction de Le Mans. Vous aurez tous un lit.\r\n\r\nLa PAF sera de 115 euros pour une inscription PJ (+5€ de cotisation à Rôle si vous n'êtes pas déjà adhérent pour 2018). Il est possible de payer en deux fois.\r\n\r\nLe jeu est prévu pour une petite trentaine de joueurs.\r\n\r\nQuestionnaire\r\nMaintenant c'est à vous ! Sachez que la sélection s'effectuera sur des critères parfaitement arbitraires, notre ressenti collectif en tant qu'organisateurs et notre envie de faire jouer. En résumé, nous choisirons qui nous voulons, sans critères ni règles prédéfinis, sans justifier nos choix. \r\n\r\nToutefois, le questionnaire peut être rempli en permanence, d'autres sessions seront organisées en 2018 ou plus tard.	https://www.facebook.com/nousnironsplusdanser/	11500	2018-04-20 03:25:54+02	3	45	42	EUR	short	\N	\N	\N	\N	\N	\N
62	nous-nirons-plus-danser-2	Nous n'irons plus danser - 2	Un GN romanesque sur la vie d’un petit village de l’est de la France pendant l’occupation allemande en 1944.	Je suis né il y a bien longtemps. Je n’étais qu’un petit hameau, puis, de chaumières en chaumières, j’ai grandi pour devenir aujourd’hui le village de Montenois.\r\n\r\nMon corps ce sont mes maisons, mon église, ma mairie, mon école, ma boulangerie, mon manoir sur la colline.\r\nMon cœur est inondé d’artères de terres battues, de champs et de pavés, il bat au rythme de mes habitants.\r\nMon âme est constituée de tous ceux que j’ai vu naître et mourir, de mes 1600 villageois qui se lèvent à l’aube tous les matins et se couchent au crépuscule tous les soirs.\r\nMon histoire n’a pas été remarquable jusqu’à ce jour de 1940…\r\n\r\nLes bottes des soldats allemands ont foulé les trottoirs de ma grand rue. Je les sens en moi comme des corps étrangers. Ils ont martelés mes pavés à coups de talons. Ils ont jeté des regards méfiants à mes ruelles et mes fenêtres closes. A l’heure de l’apéritif, la ferveur habituelle et les bavardages ont laissés place à un calme inquiétant. Les boches ont pris possession de mon âme et ont fait couler le sang de mes habitants dans mon paisible cœur.\r\n\r\nAujourd’hui, en ce jour de juin 1944, je souffre toujours de cette situation.\r\nJe connais la faim, la rancœur, la douleur, le manque et le deuil.\r\nMais quelque part au fond de moi, il y a des rires, des enfants qui grandissent malgré la peine, des amants qui s’aiment à la folie.\r\nQuelque part au fond de moi, il y a l'espoir que les pas qui fouleront à nouveau ma grand place seront ceux d'un bal populaire.\r\n\r\nViendrez-vous quelques heures ressentir le pouls de Montenois ?\r\n\r\nNous n'irons plus danser est un jeu de rôle grandeur nature, organisé par Amélie, Anno, Emeric, Rico et Skimy et hébergé par l'association Rôle.	https://www.facebook.com/nousnironsplusdanser/	11500	2018-05-25 04:29:14+02	3	45	42	EUR	short	\N	\N	\N	\N	\N	\N
71	dead-island-2-naufrage	Dead Island 2 : Naufrage	L’endroit semblait pourtant désert… mais en attendant les secours, les survivants devront lutter contre un ennemi inattendu.	2018.\r\nEn pleine mer, le bateau de croisière “Mermaid Dream” essuie une terrible tempête au large de l’Inde. Pourtant présenté comme étant un navire insubmersible, le “Mermaid Dream” finira pourtant par avoir sa coque éventrée et il coulera dans la Baie du Bengal, alors que les eaux sont déchaînées et que le vent hurle.\r\nPar chance, un petit groupe de survivants parvient a prendre la fuite a bord d’un canot de sauvetage. Seulement 30 survivants sur les 5600 passagers du navire. En pleine tempête, coincé sur un canot de sauvetage en surnombre, les survivants n’avaient aucuns espoirs d’atteindre la côte indienne. Pire encore, le Second du Capitaine, présent parmi les survivants, a affirmé que la tempête avait brouillé tout les signaux radio et qu’il avait été impossible de prévenir la côte. Le seul espoir qui pouvait leur rester c’était le signal de S.O.S que lançait automatiquement l’émetteur satellite du navire en cas de naufrage…. s’il n’a pas été endommagé…\r\nAprès plusieurs heures de lutte contre les éléments déchaînés, le canot s’est échoué sur une île mais la tempête ne s’est pas arrêtée pour autant. Les survivants ont réussi a trouvé un abri un peu plus loin, au coeur de l’île, alors que les éléments se déchaînaient toujours, entre la pluie, le vent, et l’orage! Un palais en ruine, visiblement d’une époque très ancienne et construit par une civilisation oubliée.\r\nL’endroit semblait pourtant désert… mais en attendant les secours, les survivants devront lutter contre un ennemi inattendu.	https://www.facebook.com/events/1735361980105090/	3100	2018-06-16 04:59:23+02	3	22	61	EUR	short	\N	\N	\N	\N	\N	\N
10	dead-zone-reloaded	Dead Zone Reloaded	Survie, horreur, zombies	Dead Zone est un jeu de rôle grandeur nature survie/horreur en territoire zombie fortement inspiré des films de Romero ou de la série The Walking Dead. Il ne s’agit pas d’un GN de shoot ni d’un GN Rambo, vous incarnerez de simples citoyens Français contraints d’évacuer lorsqu’une fulgurante épidémie de rage s’abat sur le pays… Quand le chaos s’installe, le monstre n’est pas forcément celui qu’on croit…\r\n\r\nNote d’intention : https://lescompagnonsdelouest.files.wordpress.com/2017/12/note-d-intention-dzr.pdf\r\nInscriptions :\r\n\r\nLien d’inscription : https://www.helloasso.com/associations/les-compagnons-de-l-ouest/evenements/dead-zone-reloaded\r\n\r\nDead Zone Reloaded est la réédition du GN Dead Zone joué en juillet 2016 et déjà organisé par les Compagnons de l’Ouest. L’équipe organisatrice compte un mélange d’orga de la première édition et de nouveaux cerveaux.\r\n\r\n    30 places PJ disponibles à 70€ (65€ pour les membres des Compagnons de l’Ouest)\r\n    20 places PNJ disponibles à 30€\r\n\r\nL’inscription comprend la location du terrain, les repas du samedi midi, samedi soir et dimanche midi ainsi que du grignotage, l’assurance, les costumes et le maquillage, l’entretien de notre matériel (tonnelles, toilettes sèches…), la location d’un camion.\r\nSite & horaires :\r\n\r\nAdresse du site : D96, 77166 Grisy-Suisnes, France\r\n\r\nHoraires de jeu :\r\n\r\n    Ouverture du site : 17h vendredi 27 juillet\r\n    Début du GN : 9h samedi 28 juillet\r\n    Fin du GN : environ 12h dimanche 29 juillet\r\n\r\nAucun retardataire ne sera toléré sur le site.	https://lescompagnonsdelouest.wordpress.com/info-pratiques/	7000	2018-07-27 20:08:41+02	2	9	8	EUR	long	\N	\N	\N	\N	\N	\N
29	dreamcatcher-le-gn-paradoxal-chapitre-1	Dreamcatcher - Le GN Paradoxal - Chapitre 1	Post-apo, survie, folie, privation de sommeil, cauchemar	Partie de GN en weekend complet, pour les participants inscrits et validés.\r\nVenez experimenter notre univers, partager la vie des derniers Survivants et écrire avec nous la suite de l'histoire.	https://www.facebook.com/events/125163931443161/	9000	2018-03-30 02:48:08+02	3	29	27	EUR	long	\N	\N	\N	\N	\N	\N
77	eclypson-odyssee	Eclypson | Odyssée	Un nouveau continent du monde fantastique d'Eclypson : incarnez un personnage issu des populations locales ou des peuples y posant pieds pour la 1ère fois.	Vous aviez toujours cru votre monde unique, vos peuples seuls, vos frontières infranchissables.\r\nC’est donc une ère nouvelle qui s’annonce.\r\n\r\nVous dont les navires perceront, pour la première fois, les vagues déchaînées de la Grande Mer.\r\nVous dont les rivages accueilleront, pour la première fois, des pas étrangers par centaines, dans le fracas de leurs bateaux qui s’échouent.\r\n\r\nVos deux mondes s’apprêtent à entrer en collision. Survivrez-vous au choc ?\r\n\r\nCHOISISSEZ VOTRE CAMP	http://sculpteursdereves.org/gn-eclypson-2018/	6000	2018-07-06 15:14:01+02	3	71	66	EUR	medium	\N	\N	\N	\N	\N	\N
16	edu-larp-conference	Edu-larp conference	International convention (in English) during the Knutpunkt Week in Sweden	Welcome to the Edularp conference 2018!\r\n\r\nThe edularp conference is a meeting place for all who work with or are interested in educational larps. It is an opportunity to learn from each other and keep updated on what happens around the world. This year it will be held in Malmö, a short train ride from where Knutpunkt will be held, and we at LajvVerkstaden are proud to be the organizers. The aim for the conference is to give you a goodie bag full of new techniques and ideas. Of course, because we are in Sweden, there will be lots of fika.\r\n\r\nTHE PROGRAM\r\n-Intro\r\n-Fika with a twist\r\n-Presentations of projects and discussion\r\n-Lunch with a twist\r\n-Group discussions on three themes “Children, Adults, Values”\r\n-Workshops in different methods and tools\r\n-Fika with a twist\r\n-Workshops round 2\r\n-Wrap up\r\n\r\nSIGN UP\r\nThe sign up is now open and will be open until mars 5th. Our principle for the participants is first come, first served.\r\nYou find the signup here (https://goo.gl/forms/QtaJZCXkKl4xIDjq2).\r\n\r\nLast date to sign up for the conference is 5/3-18.\r\n\r\nDO YOU WANT TO CONTRIBUTE?\r\nIf you want to hold a presentation or workshop you can sign up here (https://goo.gl/forms/xigYQUsc1H1xc5np2).\r\nWhat have you learned that others needs to discover? Pay it forward by holding a presentation or workshop at the conference. When selecting submissions to the program we will look if they are suitable to other planned activities and choose the ones that complements each other in each category. This means that your submission might not be part of the program but we hope that we will have room for as many of your contributions as possible.\r\n\r\nLast call for program is 22/1-18 and shortly after we will contact everyone who have submitted.\r\n\r\nPRESENTATIONS\r\nThe presentations will be kept short and about subjects you can use in your own projects and ideas. After every presentation there will be a short discussion with prepared questions.\r\n\r\nGROUP DISCUSSIONS\r\nFor the group discussions you will get to choose which subject intrigues you the most. Together with a discussion facilitator you as a group will decide what part of this subject you are most interested in.\r\n\r\nWORKSHOPS\r\nDuring the workshops you will get to try different methods or tools. Everyone will get to participate in every workshop. After each workshop there will be a short discussion focusing on your experience of the method.\r\n\r\nFOOD AND ACCOMODATIONS\r\nDuring the conference there will be fika (coffee/tea, cookies, fruit) but not any food. There is a lunch restaurant at the venue where you can get lunch. After the conference is over there is reserved tables at a restaurant close to the venue for those who want to have dinner together.\r\n\r\nIf you need somewhere to sleep in connection to the conference we can help you reserve a room in Malmö through A week in Sweden.	https://www.facebook.com/events/411829155905546/	0	2018-03-14 09:50:28+01	3	14	13	EUR	hours	\N	\N	\N	\N	\N	\N
86	eldorado-la-mysterieuse-cite-dort	Eldorado : La Mystérieuse Cité Dort	Horreur lovecraftienne	Salut,\r\n\r\nC'est dans la joie et l'allégresse que je vous transmets le flyer de notre prochain GN "La Mystérieuse Cité Dort", qui sera en fait la première coprod Alter Ego/ Marcheurs sur Rêves/Krack'n'Loot :)\r\n\r\nLes lecteurs à l'oeil affuté pourront remarquer qu'un graphiste a rejoint l'équipe 😆😆😆\r\n\r\nLe jeu pourra accueillir environ 35 joueurs et sera normalement réédité fin juillet 2019.\r\n\r\nLa fiche d'inscription sortira début 2018 et servira également de note d'intention.\r\n\r\nSi vous n'avez jamais participé à un de nos jeux et que vous souhaitez recevoir nos informations en primeur, vous pouvez m'envoyer votre adresse mail en MP afin que je vous rentre dans notre liste de contacts	https://www.facebook.com/photo.php?fbid=1720901854607685&set=gm.10154832248451780&type=3&theater&ifg=1	6700	2018-07-27 15:52:03+02	3	79	73	EUR	medium	\N	\N	\N	\N	\N	\N
117	fairweather-manor-session-5	Fairweather Manor Session 5	International LARP (in English) : step into the lives of servants, nobles, artists and local guests at a great house during the Edwardian period.	tepping into one of the worlds of a Dziobak LARP production is an unforgettable experience. Get to play a character in your favourite fiction and meet other people from all over the world, all engaged in adding their piece to the same story. Dive into roleplaying with drama, intrigue, and action or just lean back and watch the others do all the hard work. Either way it's fun, fun, fun...and you can wear a pretty dress while doing it!\r\n​\r\n- Josephine Rydberg, Trustpilot review 28.09.2017\r\n\r\n(SOLD OUT)\r\nFairweather Manor is a live action role play (larp) event set in England during 1917. During the event, the participants leave their normal lives behind for three days and step into the lives of servants, nobles, artists and local guests at a great house during the Edwardian period.	https://www.fmlarp.com/	44000	2018-11-01 18:09:59+01	3	101	32	EUR	medium	\N	\N	\N	\N	\N	\N
42	katana-huis-clos-daventure-science-fiction	KATANA - Huis-Clos d'aventure science-fiction	Huis-Clos d'aventure ambiance futuriste par Les Rêves De Licorne	Huis-Clos d'aventure ambiance futuriste par l'association "Les Rêves De Licorne"\r\nKATANA\r\n\r\nDans une partie éloignée de la galaxie, un groupe d’élite a été formé afin d’infiltrer et de reprendre le contrôle de Katana, une légendaire flotte de croiseurs militaires “fantômes”, disparue le jour de son inauguration.\r\nLe vaisseau de commandement semble abandonné depuis des dizaines d'années. Au fur et à mesure de la progression du groupe, tout ne se passe pas comme prévu…\r\nIl va falloir comprendre le fonctionnement du croiseur et lutter pour ne pas devenir à son tour un fantôme...\r\n\r\nDESCRIPTION\r\nUn huis-clos d'aventure spatiale. Ce jeu est facile d'accès pour les joueurs débutants et suffisamment complexe pour les joueurs expérimentés. Le huis-clos est basé, entre autre, sur la découverte, les relations entre les personnages, la communication, la coopération, l'action et la négociation.\r\nLes fiches de personnages seront volontairement simples, vous découvrirez votre personnage au cours du jeu.  Une partie du jeu sera basée sur les manipulations de machines et de l’interface informatique du vaisseau spatial (aucune compétence spécifique n'est requise). L'accent sera mis sur l'immersion dans l'environnement d'un vaisseau spatial.\r\n\r\nINFORMATIONS GÉNÉRALES\r\n- DATE DU JEU : la date que vous avez sélectionné sur cette page, l'heure de début de jeu sera communiquée lors de la confirmation d'inscription..\r\n- LIEU : accessible en métro parisien, l'adresse précise sera communiquée lors de la confirmation d'inscription.\r\n- DURÉE : prévoir d'être sur place de 13:30 à 20:00 environ.\r\n- PAF : La Participation Aux Frais couvre les frais d'inscription, le matériel et décors mis à disposition, la nourriture et boisson prévue sur le jeu.\r\n- TYPE DE JEU : jeu d’aventure, enquête et action dans un environnement de science-fiction.\r\n- NOURRITURE : incluse dans la PAF, elle sera volontairement simple afin respecter l'ambiance spatiale.  (Dans les notes d'inscription précisez vos intolérances alimentaires.)\r\n\r\nCE QU'IL FAUT PRÉVOIR D'APPORTER SUR LE JEU :\r\n- Votre COSTUME : chaussures noires, pantalon noir type treillis militaire, T-shirt gris (avec ou sans manche), débardeur noir (mis sur le T shirt gris),\r\n- Votre SMARTPHONE (si vous n'avez pas de Smartphone, un poste libre-service sera à disposition)\r\n\r\nVOS SOUHAITS :\r\nLors de votre inscription sur ce site, dans le champs "commentaires" , n'hésitez pas à nous transmettre vos souhaits de jeu, vos intolérances...\r\n-----------------------------------------------------------------------------------\r\nCONTACTS ET INFORMATIONS :  revesdelicorne@gmail.com\r\n-----------------------------------------------------------------------------------\r\n\r\nAVANT DE S'INSCRIRE :\r\n\r\nQuelques explication afin de choisir votre poste sur la passerelle :\r\n(Une explication détaillée des postes sera envoyée après l'inscription).\r\n\r\n- OFFICIER DE RENSEIGNEMENT ET COMMUNICATION dit "SCIENCE COM" :\r\n(Difficulté facile)\r\nUtiliser les réseaux d’espionnage, identifier les cibles sur le radar, trouver leur faiblesses.\r\nGérer les communications et superviser les déplacements et actions des autres engins spatiaux (bases, chasseurs, vaisseaux amis et ennemis).\r\n\r\n- CHEF MÉCANICIEN ET INGÉNIERIE DE VOL :\r\n(Difficulté facile)\r\nGérer et affecter l’énergie et les ressources du vaisseau selon la situation. Organiser les réparations de systèmes endommagés.\r\n\r\n- OFFICIER ARTILLEUR :\r\n(Difficulté moyenne)\r\nDurant les combats spatiaux, choisir les cibles ennemies, utiliser l'armement  afin de garantir la supériorité spatiale. Gérer l'activation du bouclier du vaisseau. Gérer les ressources et les munitions du vaisseau.\r\n\r\n- NAVIGATEUR :\r\n(Difficulté moyenne)\r\nPiloter les déplacements du vaisseau, préparer et exécuter les "bonds" spatiaux du vaisseau, gérer les accostages de station spatiales.\r\n\r\n- COMMANDANT :\r\n(Difficulté élevée)\r\nDécider de la tactique, organiser la passerelle et commander les différents officiers.\r\n\r\n- PILOTE DE CHASSEUR :\r\n(Difficulté élevée)\r\nPiloter un chasseur monoplace durant les missions spatiales (reconnaissance, combat, bombardement…). \r\n(Savoir utiliser un joystick est un plus).	https://www.helloasso.com/associations/les-reves-de-licorne/evenements/katana-2	3400	2018-04-15 03:04:35+02	3	42	39	EUR	hours	\N	\N	\N	\N	\N	\N
43	raven-crew-a-pirate-tale	Raven Crew - A pirate Tale	International LARP (in English): Tale of Seamanship, Adventure and Clash of Civilizations. Are you Ready to get on Board a Real Tall Ship? [2 prices available, see website]	"Raven Crew - a pirate tale" is an adventure larp which allows players to choose between two different Role-Playing experiences. Half of the participants will be playing aboard the ship La Grace, that will sail the waters off the Tuscan coast. The other half will be playing on the shore, in a small trading outpost deep in the Caribbean. The event entails interactions between the two groups, and a shared ending.\r\n\r\n“At the port, a multifaceted fellowship is waiting to get on board and face the waves' challenges. They will be proving themselves in a risky mission, the search for a legendary treasure”\r\n\r\n“Raven's Nest: the sailors know hazards don't come just from the sea… Grim threats impend on the Pirate society that rules this corner of paradise… ”\r\n\r\nIn Raven Crew you'll have to face hard choices and boundless horizons, choose your own destiny and the fate of the society you've built. Inspired to R.L. Stevenson's Treasure Island and Jonathan E. Steinberg's and Robert Levine's Black Sails, Raven Crew is a Pirate experience not to be missed.\r\n\r\n40 players on ship + 40 on shore. Ticket: €320 on ship, €65 ashore. Sign up are open, but the spots for the Boat Larp are sold out. You can sign for the ashore larp and/or enter in the waiting list for the boat larp!\r\n\r\nThe Teaser is here! https://www.youtube.com/watch?v=AZ1-6YRYZws\r\n\r\nHere you will find the complete website with all the answers: www.grv.it/raven\r\n\r\n===========\r\n\r\nRaven Crew è un larp di avventura che prevede la scelta tra due diverse esperienze di Gioco. Metà dei partecipanti giocherà sulla nave La Grace, che navigherà nelle acque della costa Toscana. L’altra metà giocherà sulla spiaggia, in un piccolo avamposto commerciale nel profondo dei Caraibi. L’evento prevede interazioni tra i due gruppi, e un finale condiviso.\r\n\r\n“La compagnia del Corvo attende al porto di imbarcarsi e affrontare le sfide dei flutti; due ciurme rivali ingaggiate per la stessa missione, la ricerca di un leggendario tesoro…”\r\n“I marinai sanno che le insidie non arrivano solo dal mare… oscure minacce incombono sulla società pirata che controlla questo angolo di paradiso…”\r\n\r\nIn Raven Crew dovrete affrontare scelte difficili e orizzonti sconfinati, decidere del vostro destino e di quello della società che avete costruito. Ispirato a L’isola del tesoro di R.L. Stevenson e a Black Sails di Jonathan E. Steinberg e Robert Levine, Raven Crew è l'esperienza Pirata da non perdere.\r\n\r\n40 personaggi in nave + 40 a terra. Quota: €280 in nave (4 giorni), €65 a terra (2 giorni). Le iscrizioni sono aperte, cosa stai aspettando!\r\n\r\nQui trovate il sito completo con tutte le risposte: www.grv.it/raven\r\n\r\nIl Teaser è online!! https://www.youtube.com/watch?v=AZ1-6YRYZws	https://www.facebook.com/events/166438257242529/	32000	2018-04-19 03:08:05+02	3	43	40	EUR	long	\N	\N	\N	\N	\N	\N
28	fastaval-2018-otto-i-eventyrland	Fastaval 2018 - Otto i Eventyrland	International convention: Fastaval is a roleplay and board game convention in Denmark. We have only freshly designed scenarios and board games.	Fastaval is a roleplay and board game convention in Denmark. We have only freshly designed scenarios and board games, made just for Fastaval!\r\n\r\nWhere: Mariagerfjord Gymnasium and Hobro Idrætscenter. The address is Amerikavej 5, 9500 Hobro.\r\nWhen: Easter 2018 – March 28th to April 2nd\r\nSign up: You can sign up here – the signup is open from February 1st to March 8th.\r\nProgram: You can see the scheduled activities here, or read more about what is going on under the headlines roleplays, boardgames and activities.\r\nOn our webpage can you find out more about what Fastaval is, read about this years scenarios and this years designer boardgames, and read about all the other things that happens at Fastaval.\r\n\r\nThe theme of the year is Otto in Wonderland. We look very much forward to share this wonderous universe with all of you.	https://www.fastaval.dk/?lang=en	2800	2018-03-28 02:44:40+02	3	28	26	EUR	medium	\N	\N	\N	\N	\N	\N
35	final-voyage-international-session-2	Final Voyage International Session 2	International Larp (in English) : A 2 day simulation game about the crew of a soviet nuclear submarine	Second International run of Final Voyage larp. A 2 day simulation game about the crew of a soviet nuclear submarine. Taking place in Obiekt Alfa a post soviet bunker / secret military facility / bomb shelter.\r\n\r\n“Final Voyage” is a simulation game in which players become a crew of a Soviet nuclear submarine in  a difficult period of time. During the larp, the players will be commandeering the ship using a specially designed computer application. Not only will they face enemy units and ship malfunctions, but their beliefs will also be put to a test. Our story is inspired by classic pieces of film, video games and literature like “The Hunt for the Red October”, “Crimson Tide”, “K-19” or the “Fallout” series.\r\n\r\nThe larp is set in the universe of “Fallout” and it’s a prequel for the series. The voyage starts in September 2077, when the world is on the brink of a nuclear war. The Cold War has never ended and the whole world has this “retro feel” (just like in “Fallout” trailers). The USSR still exists, but has lost much of its political power to China. Despite huge economic crisis and hunger in the Republic, it still aspires to the role of a Global Superpower and hasn’t said its last word yet.	https://www.facebook.com/events/560103914331927/	19000	2018-04-06 02:20:34+02	3	35	33	EUR	medium	\N	\N	\N	\N	\N	\N
5	gn-frida-kahlo-lo-que-el-agua-me-dio-session-2	GN Frida Kahlo "Lo que el agua me dio" Session 2	Il s’agit d’un jeu collaboratif, avec une approche expérimentale (ateliers et découpage en actes) et romanesque (relations et émotions importantes). Le jeu se passe dans l’entourage artistique et politique de Frida Kalho et Diego Rivera, il s’inspire de l’ambiance de différents biopics d’artistes et se déroule dans l’entre-deux-guerres si particulier de l’Amérique du Sud, plus précisément au Mexique. Les personnages (re)vivront trois réveillons du jour de l’an à plusieurs années d’intervalle, chez Diego et Frida. Les joueurs recevront entre chaque acte des documents permettant de préparer l’acte suivant, ce qui est inspiré du système de lettres d’entre-actes du Carmen Chabardès de Lucie.	Les thèmes et mécaniques de jeu seront gérés par ateliers et méta-techniques mais aussi en laissant leurs responsabilités aux joueurs.  L'ambiance est inspirée par des films comme  Midnight in Paris, Frida, The Lost City, des livres comme Bohèmes, My life with Picasso.\r\n\r\nSi vous vous pré inscrivez, vous vous engagez à :\r\n- participer aux ateliers de préparation avant le jeu (ceux du debriefing sont facultatifs).\r\n- une fois casté envoyer via hello asso, votre photo, paiement, décharge dans les temps indiqués ; faute de quoi vous serez remplacé sans état d'âme.\r\n\r\nCette session aura lieu à Asnières le soir et la nuit du 4 au 5 août 2017.\r\nLe jeu commencera vers 20h (l'après-midi sera consacrée à des ateliers) et finira vers 7h du matin.\r\nLa PAF sera d'environ 30 euros : elle couvre la déco, le brunch du lendemain matin, l'alcool, les impressions, l'éclairage\r\n\r\nIl sera possible de dormir sur place mais il n'y aura pas de couchage en lit pour tous, donc certains peuvent amener des lits de camp, se faire héberger par des Gnistes voisins ou rentrer au petit matin en RER.\r\n\r\nSi vous avez des questions : saetta@asso-role.fr	https://docs.google.com/forms/d/e/1FAIpQLSemmZqyShjzsT0xw2wsoVPGDWoKN70xxDvMTsESFcC9Rez5Kg/viewform	3000	2018-08-04 19:33:24+02	2	4	3	EUR	long	\N	\N	\N	\N	\N	\N
49	gn-le-fer-et-la-foi	GN : le Fer et la Foi	Jeu d'inspiration Médiéval-Fantastique / Dark-Fantasy, basé sur la confrontation entre plusieurs dogmes	Le Grandeur Nature Le Fer et la Foi est un jeu d'inspiration Médiéval-Fantastique / Dark-Fantasy,\r\nbasé sur la confrontation entre plusieurs dogmes.\r\nCeux-ci définissent à la fois les croyances des peuples, mais aussi les différents styles de vie des habitants du continent d'Enoriil. Chaque divinité à un aspect bien particulier, lumière, savoir, nature, nuit, rage, folie et mort.\r\nLa grande différence avec notre propre monde est la présence concrète d'êtres divins, les Incarnas. Ils sont la preuve vivante des dieux sur terre. Ainsi dans cet univers, croire et savoir sont la même chose.\r\nLe choc des cultures est souvent rude, voir violent, mais tous vivent pour cela: le Fer et la Foi .\r\n\r\nSynopsis\r\nLa situation à Balheim est critique.\r\nL'Alliance, désormais fragile, tente de se renforcer en accueillant en son sein le culte de la Peur et de la Folie. L'armée des masques continue quotidiennement ses exactions, malgré la disparition du Chapelain noir. Les fidèles de Voorl'ik et Syrvana, quant à eux, retournent aux sources de leur foi afin de l'éprouver. Chaque jour, un peu plus d'hérétiques marchent sur les terres d'Enoriil afin d'accomplir eux aussi leur destinée.\r\nUn an après la révélation d'Effrai, chaque culte a dû prendre des mesures pour s'adapter. A présent, chacun se doit d'affirmer ses croyances et de révéler son potentiel pour choisir sa voie à la croisée des chemins	http://ferfoy.jdracines.org	6500	2018-04-27 03:40:36+02	3	5	4	EUR	short	\N	\N	\N	\N	\N	\N
30	gn-silo-0	GN Silo 0	Monde nucléaire post-apo avec intrigues et combats (nerf)	Dans un futur lointain… Après un cataclysme nucléaire.\r\n\r\nEnfermés durant un long épisode glaciaire, des poches de survivants ont construit des semblants de communauté répartis en des lieux insolites, encerclés par la mort et la dévastation.\r\n\r\nSeul phare dans la nuit, la cité ruche Eden a été le point de ralliement des quelques survivants qui ont osé sortir de leurs abris de fortune.\r\n\r\nA partir de l’âge Zéro de cette nouvelle ère et la découverte d’autres refuges trop longtemps isolés, les pèlerins d’Eden parcourent les plaines hostiles afin d’unifier l’humanité déchirée.\r\n\r\nEn vain… La lutte pour la nourriture et les sources d’énergie, les combats contre les maladies et les prédateurs ont eu raison de la moralité et de la justice.\r\n\r\n\r\nDans ce monde nucléaire sauvage et impitoyable, tout peut se troquer ; denrées, esclaves et services plus ou moins crapuleux.\r\n\r\nPour sa troisième édition, la fête du renouveau s’est imposée comme l’un des points de rencontre entre les survivants de l’humanité chancelante.\r\n\r\nSortis pour la première fois de vos abris ou explorateurs vétérans marqués par les horribles stigmates générés par les vents radioactifs, c’est à ce rassemblement improbable que vous vous retrouvez ….\r\n\r\nLe GN est limité à 60 joueurs avec des frais d’inscription fixé à 75€. Il n'y a pas de date de clôture d'inscription mais sachez que les premiers arrivés seront les premiers servis. Le GN est réservé aux joueurs majeurs.\r\n\r\nLe GN débutera le 30 Mars à 19H et finira dans la nuit du 31 Mars au 1 Avril 2018. Nous serons très soucieux d’entretenir une atmosphère 100% survivaliste et 100% réaliste en cours du jeu.\r\n\r\nLe site du GN est à 1 heure 20 de Bordeaux sur la commune de Buzet sur Baïse.\r\n\r\nNous recherchons aussi une équipe de 15 PNJ pour jouer des personnages d’ambiance. Pour ces derniers, les frais de participation sont de 30 euros.\r\n\r\nLes rôles ne peuvent être retenus qu'après réception de la fiche d'inscription accompagnée du paiement. Aucune faveur ni exception ne seront faites. Merci de votre compréhension. Tous les chèques seront encaissés le 1er Mars et nous ne ferons plus aucun remboursement après cette date.\r\n\r\nOula que de gens motivés ! Ça fait vraiment plaisir ! Les fiches d’inscriptions arrivent très bientôt.\r\nSilo 0 est un monde créé de toute pièce (pas de lien avec un quelconque ouvrage). On réserve des surprises aux vieux briscards. Mais ce GN reste aussi ouvert aux nouveaux. Vous serez en factions donc épaulés par vos camarades pour survivre. Attention, la mort pourra être rapide et brutale. Il n’y aura pas de résurrection possible de votre personnage.\r\nDans votre fiche d’inscription, dites-nous si vous souhaitez jouer avec quelqu’un ou si vous voulez éviter un type de personnage (guerrier, diplomate, médecin, artisan…). Nous essayerons de faire au mieux.\r\nLes organisateurs sont : Olivier Cabanne, Amélie Cabanne, Olivier Jean, Marx Rickers, Judicaelle Picot, Zephyr et 1 orga logistique Marc Senegas.\r\n\r\nQuelques précisions très importantes :\r\n\r\n1. C’est un GN d’intrigues avec du combat. Ceux-ci seront rapides et mortels. Nous avons opté pour l’utilisation de nerfs. Les munitions (type classique) seront fournies par les organisateurs. Certains joueurs auront des armes de contact. Tous les joueurs ne seront pas armés.\r\n\r\n2. C’est un format court : vendredi 18h briefing et 20h début du jeu. Fin dans la nuit de samedi à dimanche. Immersion totale. Pas d’arrêt de jeu même pendant la nuit.\r\n\r\n3. Le site est magnifique (usine désaffectée de 10 00m²) mais dangereux (bris de verre, coursives métalliques étroites, parties métalliques saillantes…). Vous devez donc avoir de bonnes chaussures. Et interdiction totale d’aller hors des endroits balisés et sécurisés.\r\n\r\n4. Le couchage sera en abri partiel (attention il va faire froid et/ou humide).\r\n\r\n5. L’alcool est interdit durant toute la durée du jeu.\r\n\r\n6. La nourriture sera aussi Post Apocalyptique à base de conserves.\r\n\r\n7. Il y aura des toilettes sèches sur le site mais pas de douche. Prévoyez une douche solaire si besoin.\r\n\r\n8. A l'issu du GN, l'ensemble des participants pourra partager un moment nocturne et ouvertement épicurien.	https://www.facebook.com/events/346764419088986/	7500	2018-03-30 02:51:56+02	3	30	28	EUR	short	\N	\N	\N	\N	\N	\N
104	gn-vampire-dark-ages	GN Vampire Dark Ages	GN Vampire Dark Ages	Histoire\r\n\r\nPérouges en 1351.\r\n\r\nNous sommes sur les Terres de Hugues de Genève – Comte de Pérouges, Gex et Bailli de Faucigny.\r\n\r\n\r\nIl est le cousin du Prince de Savoie, Amédée VI; Mais ce n’est pas le grand amour entre eux, Hugues défiant sans cesse son royal cousin au profit du Dauphin de France.  Amédée VI, quant à lui, ne manque pas, à chaque occasion d’essayer de reprendre les terres de ce petit comte infernal.\r\n\r\nLes Vampires, Ventrues en l’occurence puisque nous sommes en France, aiment bien savoir quelles sont les forces en présence, histoire de savoir quel pion jouer sur le grand échiquier du pouvoir…En cette année 1351, Geoffrey, Infant d’Alexandre est sur le trône de France. Philippe est le Prince de Lyon. Et Mahault est l’Archonte de Pérouges. C’est une place qu’elle a obtenu suite à la disparition en 1230 de l’Archonte précédent, Saevyn. Celui-ci était aussi un Infant d’Alexandre. Est-il Mort, en Torpeur ou parti aux fins fonds du Monde, nulle ne le sait vraiment. Quelques bruits ont circulé à l’époque, mais les Vampires loyaux a Saevin les ont gardés pour eux et ont fait profil bas.\r\n\r\nMahault est une Ventrue aux dents longues. Elle sait saisir les opportunités quand elles se présentent, même avec les humains, mais elle est encore jeune et parfois les choses lui échappent. Et si on lui fait remarquer, il est très possible que ce soit la dernière chose que l’on fasse. Dans sa Cour, on trouve aussi une Ancienne Cappadocienne et deux de ses Infants. Discrète, elle est arrivée il y a quelques années. Sa crypte est son laboratoire et on la voit rarement en dehors de ses murs. Elle préfère envoyer ses goules au soleil, même si l’une d’entre elles est d’une maladresse crasse.\r\n\r\nDes événements particuliers vont attirer dans le village un certain nombre de clans, des hommes d’Amédée mais aussi des hommes d’Eglise. Car il y a dans l’environnement de Hugues, un Inquisiteur, Gaspard de Groot. On ne l’aime pas beaucoup chez les humains et encore moins chez les Vampires. Il est bizarre, il possède la Vraie Foi, bien sur, mais on le croise parfois dans les bas-fonds du village ou dans les Tavernes lugubres du coin. Les Nosferatus qui y trainent l’ont entendu baragouiné dans sa barde. Est il seul? En tout cas, il a faire venir à Pérouges pas mal d’érudits et de paladins ces dernières années.\r\n\r\nLes villageois, quant a eux, ont fort à faire avec les pertes engendrées par la Peste et la Guerre. Il y a beaucoup de maisons marquées à la croix blanche et les conversations ne sont pas toujours joyeuses. Surtout ces derniers temps ou Hugues a un tant soi peu délaissé ses affaires. Malgré tout son Chambellan a fait du bon travail et le village commence doucement à revivre. La Taverne du Bon Accueil se remplit à nouveau et quelques marchants ont rouverts leur échoppe. L’herboriste fait même quelques affaires avec les goules de la Cappadocienne…\r\n\r\n \r\n\r\nLes Forces en Présence \r\n\r\nLes Vampires :\r\nImmortels et puissants, les vampires (aussi nommés Caïnites) sont d’anciens humains ayant été réanimés par le sang d’un autre immortel dans un processus nommé l’Etreinte. Les vampires sont des prédateurs à la figure humaine (du moins pour la plupart) devant se nourrir du sang de leurs anciens semblables pour arracher au Temps leur vie éternelle. Tissant depuis les débuts de l’humanité des guerres de pouvoir secrètes et de sombres manipulations, les Caïnites vivent de façon dispersée et divisée partout dans le monde, poursuivant des objectifs personnels différents, mais tous unis par leur nécessité de sang qui, finalement, demeure et pour toujours leur seule richesse.	https://www.facebook.com/events/1011089542272133/	8800	2018-09-28 18:02:34+02	3	17	89	EUR	medium	\N	\N	\N	\N	\N	\N
18	gn-warhammer-2018	GN Warhammer 2018	Univers librement inspiré de Warhammer jdr	Prochain GN Warhammer et fin de la campagne en cours les 16-17-18 mars 2018 à Fort l'Ecluse.\r\n\r\nLe lien d'inscription sera envoyé par mail ce dimanche soir à ceux qui ont déjà fait un ou les deux précédents GN.\r\nLes inscriptions seront ouvertes aux nouveaux joueurs en milieu de semaine.\r\nSi des joueurs des précédents gn ont des amis qui souhaitent s'inscrire mais qui n'ont pas fait l'un ou l'autre des deux précédents gn, ne leur transférez pas le lien d'inscription, nous serons obligés de supprimer leurs inscriptions, c'est compliqué et pénible.\r\nNe vous inquiétez pas ils pourront s'inscrire dans la	https://www.facebook.com/groups/1529145174073219/permalink/1934530923534640/	0	2018-03-17 00:01:30+01	3	17	15	EUR	medium	\N	\N	\N	\N	\N	\N
56	harem-son-saat-the-last-hours-of-the-harem-run-5	Harem Son Saat (« The last hours of the Harem ») run 5	International Larp (in English and Czech) : A historically-inspired romanesque Larp set in the Ottoman Empire in 1913	Historical inspiration\r\n\r\nSome aspects of the History of the XXth Century are explicitly used as inspiration, although they will be altered to fit the narrative, since Harem Son Saat is not meant to be a fully realistic game.\r\nThe Harem culture\r\n\r\nHarem means « forbidden to men », and the term was coined to describe the group of women surrounding an important character. In this period, it was an extremely hierarchized place, following strict rules. Only women, children and eunuchs were allowed there, or close male relatives. The rules applied to all, the Sultan included.\r\n\r\nThe hierarchy was defined as such: the lowest rank was slave, then favored, then concubine (once they became a mother), then spouse when they got in favor and were mother to a Prince. The head of the Harem is the Valide Sultan, mother to the Sultan, who is all-powerful there.\r\n\r\nThe purpose of the Harem is not sexuality, but providing an heir. As such, it is a political tool. The smart woman can become a favorite, mother to an heir, and influence the ruler. Competition between women, especially mothers of Princes, was brutal. The eldest Prince was always the presumed heir, but exceptions were frequent and any male heir could become the next Sultan. Once a new Sultan rose to power, all of his brothers would be executed to prevent succession conflicts.\r\n\r\nThe Harem is a network of intrigue and competition. As such, women of the Harem were well educated; as possible mothers to the Sultan, they had knowledge and oration skills. Women were taught in the Harem, in rhetorics, writing, music and foreign languages.\r\n\r\nMuslim women could not become slaves; therefore, the women of the Harem were usually of a Eastern European or Caucasian origin, but would usually convert to Islam once they became concubines. Sultans in the Ottoman Empire all were both of a European and Eastern origin. Some of the most talented slaves could rise high in favor, the most famous being Hürrem, favorite concubine to Suleiman the Magnificent in the XVIth century, at the peak of the Empire’s power.\r\n\r\nHowever, at the beginning of the XXth century, the Empire is in decline. In Istanbul, the nationalists are in power, paying only lip service to the Sultan’s authority. The Harem in Istanbul was closed soon after they came to power, disappearing in 1912. Messages were sent to the families of the women that were there, offering to send their daughters back to them. However, most women refused to leave, or expressed their sorrow at having to, since they would leave the Palace and court life to return to what often amounted to miserable living conditions.\r\n\r\nOrientalist art\r\n\r\nOver the course of the XIXth century, orientalist art was developed following a mix of travelers’ tales and idealized images of the East.\r\n\r\nThe Harem, opposed to a monogamous Christian tradition, became the subject of many fantasies and representations, around the idea of something that was socially forbidden.\r\n\r\nWhether or not the Ottomans themselves were aware of these ideas could be argued. However, it is probable that these representations influenced the attitude of Western sensitivities towards the Empire. The Ottoman Empire, sometimes dubbed the “Sick Man of Europe”, still held a lot of influence and raised fascination before its downfall in 1918.\r\nThe Balkan powder keg\r\n\r\nThe instability in the Balkan area served as a backdrop to the drama of the Ottoman Empire and it remains one of the main causes of World War One. The desegregation of the Ottoman Empire in Eastern Europe started with the “awakening of nationalities”. In the beginning of the XIXth century, Greece, Serbia and Romania became independent countries. The creation of these new monarchist states was encouraged by the European powers that wished to tear down the “sick man of Europe”. Competition ran wild between Russia, Germany, France and the United Kingdom for control over the Balkan space, a centerpoint for routes of a great geostrategic importance. Russia supported Orthodox States, whereas Austria-Hungary controlled Slovenia, Croatia and Bosnia. The murder of prince Franz Ferdinand by a Serbian nationalist on the 28th of June 1914 marked the beginning of the First World War.	http://harem.rolling.cz	15000	2018-05-17 04:11:43+02	3	55	46	EUR	long	\N	\N	\N	\N	\N	\N
115	inside-hamlet	Inside Hamlet	International Larp (in English): Your folly is the curse of Hamlet - a numbing fear of decisive action. It will kill you in the end. All of you.	Inside Hamlet\r\nYou are the rot in the state of Denmark.\r\nYour country is aflame with the fires of revolution.\r\n\r\nThe court of King Claudius is isolated in a bunker beneath the castle-fortress of Elsinore and you refuse to let go of power.\r\nAnyone could see that the days of the Kingdom are numbered. But not you. You linger on the edge of action, escaping deeper into decadent madness and murderous paranoia.\r\n\r\nYour folly is the curse of Hamlet - a numbing fear of decisive action. It will kill you in the end.\r\n\r\nAll of you.	https://www.insidehamlet.com/	46500	2018-10-26 19:04:56+02	3	99	97	EUR	long	\N	\N	\N	\N	\N	\N
17	knutpunkt-2018-shuffle-the-deck	Knutpunkt 2018: Shuffle the deck	Knutpunkt is an annual international conference, where larp enthusiasts from from all over the world meet and discuss, develop and exchange experiences about larp theory and design.	Knutpunkt is an annual international conference, where larp enthusiasts from from all over the world meet and discuss, develop and exchange experiences about larp theory and design.\r\n\r\nKnutpunkt 2018 will be held the 15th to the 18th of March 2018 in\r\nLund in southern Sweden.\r\n\r\nWebpage: www.knutpunkt.se\r\nE-mail: info[at]knutpunkt.se.	https://www.facebook.com/events/797252083773967/	27700	2018-03-15 23:56:24+01	3	14	14	EUR	long	\N	\N	\N	\N	\N	\N
89	la-plume-et-le-serpent-ou-la-revanche-de-tlahuizcalpantecuhtli	La plume et le serpent (ou la revanche de Tlahuizcalpantecuhtli)	Vente aux enchères, 1900, une statuette porteuse de malédictions... Enquête, histoires de famille, amour, drame et bon public.	La plume et le serpent (ou la revanche de Tlahuizcalpantecuhtli)\r\nSynopsis :\r\n1900. \r\nThe Red House. \r\nLe monde de l’art londonien est en effervescence. Le célèbre antiquaire Philip Webb vient d’annoncer qu’une vente aux enchères exceptionnelle se déroulera dans sa maison de campagne, la maison rouge. Y sera présentée en huis-clos, pour la première fois en Europe, une statuette unique du dieu aztèque Quetzalcoatl. Nul ne connaît la liste des personnalités qui auront la chance d’y participer. Mais tous les journaux spéculent déjà autour de cette mystérieuse statuette que l’on dit porteuse de malédictions !\r\n\r\n« Le matelas de plume d’oie semble vouloir m’avaler et le tic tac de l’horloge Louis XV résonne dans mon crâne comme un tambour de guerre. Je ne saurai dire ce qui me tient éveillée. Ce que j’ai subis ou ce que j’ai infligé ? Les regrets ou les remords ? Il me reste tant de choses à comprendre. Tant de fils à démêler avant que la troisième Parques ne se penche sur mon cas. \r\nMais peut-être que demain… Demain je me réveillerai pour la dernière fois dans la maison rouge. Demain il me faudra faire face. »\r\n\r\nNote d'intention :\r\nL'histoire se place la veille de la vente aux enchères. Il sera par exemple possible de jouer un artiste "art and craft", un riche mécène, un chasseur de trésors, un membre de la famille de l'antiquaire ou encore une restauratrice d'oeuvres d'art. \r\nCe jeu est voulu pour les joueurs.ses qui aiment les enquêtes, les histoires de famille, d’amour et de drame, et bon public. \r\nCe jeu n’est pas fait pour les joueurs ou joueuses "winners", en attente de nouvelles mécaniques, ou ayant tendance à la passivité ou à la rétention d'information.\r\nLes personnages seront ce que vous en ferez. Personne n'aura interdiction de chercher du positif dans l'histoire qu'il/elle construira. Mais il est important de comprendre que les thèmes pourront être durs et conflictuels, avec des notions éventuelles de mépris, de sentiment d'injustice, de perte... Une fin heureuse n'est pas garantie aux personnages. \r\nS'il se place dans un contexte historique et artistique donné, ce jeu est une fiction. L'histoire et les personnages sont romancés. Il n'y a aucune recherche de ressemblance avec les personnages ou faits historiques.\r\nLes personnages sont âgés de 17 à 40 ans environ.\r\n\r\nInformations pratiques :\r\nHuis-clos pour une dizaine de participant.es, d’une durée d’environ 4h. \r\nSur invitation uniquement parmi les pré-inscrites.s.\r\nL'organisatrice reste seule maitresse incontestable de l'attribution des rôles, en fonction des envies des joueurs et des besoins du scénario, mais sans aucune exigence en terme d'âge, de genre, d'ethnicité ou de type physique. A vous de remplir consciencieusement le questionnaire.\r\nSite de jeu proche de Doullens en Picardie. \r\nParticipation Aux Frais de 12 euros pour le matériel et la collation servie en jeu.\r\nBêta test le samedi 28 juillet 2018. \r\nUne photo est à envoyer impérativement à bleunwenne at hotmail . fr	https://docs.google.com/forms/d/e/1FAIpQLSff_B2RS69hE-sqLisKo3r-jApsvL9QvPfCqcc8nj2eCLC0MQ/viewform?chromeless=1&edit_requested=true	1200	2018-07-28 15:59:30+02	3	80	69	EUR	hours	\N	\N	\N	\N	\N	\N
67	just-a-little-lovin-finland	Just a Little Lovin' Finland	International Larp (in English)	A larp about friendship, desire and the fear of death\r\n\r\nJust a Little Lovin’ is a Nordic larp about the first years of the AIDS epidemic as it hits the gay scene in New York in the early 80’s.\r\n\r\nThis will be the first run of the larp in Finland.	http://www.jall.fi/	27500	2018-06-05 04:47:28+02	3	63	58	EUR	long	\N	\N	https://www.facebook.com/jallfinland/	\N	\N	\N
37	grandeur-nature-survie-apocalyptique-fantastique	Grandeur Nature - Survie Apocalyptique Fantastique	univers sombre, apocalyptique, où la folie et la magie sont omniprésentes	Affrontez les épreuves d'un univers sombre, apocalyptique, où la folie et la magie sont omniprésente. Tâchez de survivre et devenez peut être les premières lueurs d'espoirs d'une humanité anéantie... ou les derniers râles de votre espèce sur la face du monde!	https://www.facebook.com/events/1993517060883954/	5850	2018-04-07 02:32:25+02	3	37	35	EUR	medium	\N	\N	https://www.facebook.com/Morgenstern.Orga/	1901	https://www.weezevent.com/morgenstern	https://www.weezevent.com/morgenstern
55	lecole-des-mimbus	L'École des Mimbus	Nous proposons une année express en école de magie. Des cours de potions, astronomie, défense contre les forces du mal, quidditch, etc vous attendent.	L'évènement se déroule du 10 au 13 Mai 2018 au Château Jolibert à Bourgougnague. Pour y accéder : avoir 16 ans lors de ce dernier. \r\n\r\nLors de l'achat de votre billet nous vous invitons à décocher la mention qui vous invite à laisser un pourboire à la plateforme de la billetterie pour ne pas augmenter votre facture. De plus nous souhaitons vous prévenir, qu'il se peut que, pendant que vous remplissez vos coordonnées, ou autre, le dernier billet sera prit, vous n'êtes donc assuré de rien avant de recevoir la moindre confirmation. Nous en sommes désolés malheureusement ce fonctionnement est inhérent à ce type de support et nous ne pouvons rien y faire. \r\n\r\nBon courage dans votre quête jeune sorcier(e)! En espérant vous voir en Mai,	https://www.mimbulus-mimbletonia.com	20000	2018-05-10 04:08:24+02	3	54	50	EUR	medium	\N	\N	\N	\N	\N	\N
6	le-fer-et-la-foi	Le Fer et la Foi	Jeu d'inspiration Médiéval-Fantastique / Dark-Fantasy, basé sur la confrontation entre plusieurs dogmes	Le Grandeur Nature Le Fer et la Foi est un jeu d'inspiration Médiéval-Fantastique / Dark-Fantasy,\r\nbasé sur la confrontation entre plusieurs dogmes.\r\nCeux-ci définissent à la fois les croyances des peuples, mais aussi les différents styles de vie des habitants du continent d'Enoriil. Chaque divinité à un aspect bien particulier, lumière, savoir, nature, nuit, rage, folie et mort.\r\nLa grande différence avec notre propre monde est la présence concrète d'êtres divins, les Incarnas. Ils sont la preuve vivante des dieux sur terre. Ainsi dans cet univers, croire et savoir sont la même chose.\r\nLe choc des cultures est souvent rude, voir violent, mais tous vivent pour cela: le Fer et la Foi .\r\n\r\nLes pré-inscriptions pour le GN "Fer et Foi Opus II" sont ouvertes !\r\nFormulaire pré-inscriptions\r\nAttention ! Syrvana et Nadiir complets !\r\n\r\nSYNOPSIS\r\nLa situation à Balheim est critique.\r\nL'Alliance, désormais fragile, tente de se renforcer en accueillant en son sein le culte de la Peur et de la Folie. L'armée des masques continue quotidiennement ses exactions, malgré la disparition du Chapelain noir. Les fidèles de Voorl'ik et Syrvana, quant à eux, retournent aux sources de leur foi afin de l'éprouver. Chaque jour, un peu plus d'hérétiques marchent sur les terres d'Enoriil afin d'accomplir eux aussi leur destinée.\r\nUn an après la révélation d'Effrai, chaque culte a dû prendre des mesures pour s'adapter. A présent, chacun se doit d'affirmer ses croyances et de révéler son potentiel pour choisir sa voie à la croisée des chemins	http://ferfoy.jdracines.org	6500	2018-04-27 19:46:24+02	2	5	4	EUR	long	\N	\N	\N	\N	\N	\N
57	le-fuseau-de-frigg	Le Fuseau de Frigg	GN viking autour de la célébration d'une noce	Ambiance : Vikings, plein air\r\n\r\nThème : Romance, Marchand, Politique\r\n\r\nNb de joueurs : 35\r\n\r\nDurée : entre 16 et 19h de jeu (1 WE)\r\nNote d’intention :\r\n\r\nLe Fuseau de Frigg est un GN tranche de vie qui tourne autour de la célébration d’une noce, nous nous sommes basés sur des éléments historiques sans toutefois faire de la reconstitution. De même, nous avons inclus une part importante de mysticisme sans verser dans de la fantasy.\r\n\r\nIl s’agit d’un préquel à la soirée GN : Les héritiers d’Heimdal ; le GN se passe dans le même univers 15 ans avant les évènements des Héritiers d’Heimdal, une partie des personnages sont donc communs : il est demandé aux joueurs et joueuses de faire abstraction de ce que vous savez et de ne pas communiquer les informations que vous avez aux autres joueurs et joueuses.\r\n\r\nLe GN sera campé et les campements seront présents en jeu : prévoir un couchage extérieur en adéquation avec un campement nomade viking. Chaque campement sera installé en amont par les orgas et sera constitué d’une table et d’une table à feu, le tout en bois, il vous est donc demandé de faire un effort pour camoufler vos tentes modernes afin qu’elles ne dénotent pas dans le décor de votre campement. Ceci afin de créer une immersion plus importante mais aussi car la taille du terrain est limité.\r\n\r\nCe ne sera pas un GN baston, il n’y aura pas de combat de masse de prévu, nous rappelons que les vikings sont avant tout des commerçants et que lors de ce GN vous êtes réunis pour un mariage.\r\n\r\nNous avons mis l’accent, pour ce jeu, sur les relations sociales fortes. Attendez vous donc à des axes de jeu centrés sur les relations inter-personnages (familiale, politique, couple, …).\r\n\r\nLe GN se déroulera totalement en extérieur et ce qu’importe le temps, le site n’offrant aucune possibilité de repli. Veuillez prévoir votre costume en conséquence.\r\n\r\nVous pourrez arriver sur site à partir de 16h30 le vendredi. La période du vendredi soir sera consacrée à des ateliers de mise en ambiance et de cohésion d’Herred* dès 21h. Le jeu commencera au réveil le samedi matin (8h) et finira dans la nuit du samedi au dimanche.\r\n\r\nLes inscriptions seront ouvertes du samedi 9 décembre au dimanche 24 décembre. Sachez par ailleurs que la sélection s’effectuera sur des critères parfaitement arbitraires, notre ressenti collectif en tant qu’organisateurs et notre envie de faire jouer. En résumé, nous choisirons qui nous voulons, sans critères ni règles prédéfinis, sans justifier nos choix. Si vous n’avez pas de nouvelle de notre part d’ici le 10 janvier, considérez que votre inscription n’a pas été retenue. Une 2ème édition est prévue.\r\n\r\nUn nombre de places est réservé à des personnes qui n’auraient jamais fait de GN, donc débutants vous êtes les bienvenus.\r\n\r\nIl n’y aura pas d’inscription PNJ, ces derniers ont été contactés ces deux dernières semaines par notre responsable PNJ, si vous n’avez pas été contacté, n’hésitez pas à vous inscrire en tant que PJ.\r\n\r\nLe tarif du GN est fixé à 60€ pour les PJs et 30€ pour les PNJs. Les modalités de paiement vous seront communiquées si votre inscription est retenue et sera à payer avant le 10 février, sans quoi, nous donnerons votre place à quelqu’un d’autre.	https://tisseursdetoiles.com/activite-gn/le-fuseau-de-frigg/	6000	2018-05-18 04:14:58+02	3	56	51	EUR	short	\N	\N	\N	\N	\N	\N
92	legende-dhyboree-4	Légende d'Hyborée 4	Conan	Informations supplémentaires obtenues en se connectant à la platforme	http://larpmanager.eveoniris.com/	8000	2018-08-09 16:14:03+02	3	82	77	EUR	long	\N	\N	\N	\N	\N	\N
90	lepice-doit-couler-a-flot-ou-touche-pas-au-grisbi	L'épice doit couler à flot ou Touche pas au Grisbi!	Med-Fan tendance Dune	L'Empereur Dieu est mort !\r\n\r\nA l'initiative de l'Impératrice, une réunion diplomatique va avoir lieu avec les représentants des grandes maisons nobles et des plus grandes guildes pour décider de l'avenir de l'Empire.  Après 1000 ans de tyrannie, tout semble possible!\r\n\r\nVous pouvez enfin prendre en main votre destinée...\r\n\r\nLiberté, Fortune ou Gloire...un nouvel âge commence!	https://leschevaliersduroi.wixsite.com/touchepasaugrisbi	8000	2018-08-03 16:03:06+02	3	81	75	EUR	medium	\N	\N	\N	\N	\N	\N
27	les-chroniques-de-mortras-rebellion	Les Chroniques de Mortras : Rébellion	Ce jeu de guerre en grandeur nature se déroule dans l'univers des Chroniques de Mortras, dont il est le sixième opus.	Rébellion est un jeu de rôle en grandeur nature organisé par l'association Time Freeze dans l'univers des Chroniques de Mortras. Sa particularité est que l'intérêt du jeu est porté autour du combat, adapté pour être plus réaliste.\r\n\r\nVous pourrez trouver toutes les informations nécessaires à la préparation pour RÉBELLION sur notre blog : http://association-timefreeze.blogspot.fr/p/les-chroniques-de-mortras-2017-la.html	https://www.facebook.com/events/1523151927770455/	2000	2018-03-24 01:39:04+01	3	7	25	EUR	short	\N	\N	\N	\N	\N	\N
85	les-legendes-dassia-crepuscule-sur-le-midland	Les Légendes d'Assia : Crépuscule sur le Midland	Un médieval fantastique pour 80 joueurs. L'univers se veut épique.	Le monde d'Assia\r\n\r\nCe que nous appelons par chez nous Assia, n'est que la partie Nord d'un plus grand continent. Bien que j’ai pu voyager dans le Sud du continent, je ne suis jamais allé très loin. Les sombres forêts Ilfiriennes, le Désert des Roches de Sang, ou encore la guerre meurtrière entre le Saint-Paladinat de Phallaris et de sombres créatures, ne m'ont jamais permis de descendre plus au Sud.\r\n\r\nEt par la mer me direz-vous ? La tâche n'est guère plus aisée. Que cela soit à l'Est ou à l'Ouest, hormis ceux des Norduns, aucun navire n'est jamais revenu. Et embarquer sur un navire Nordun pour la Grande Traversée est chose impossible. Quant à la descente dans le Sud, j'ai pu voir les Franches-Isles. Mais au-delà, la mer est tellement chaotique et meurtrière, qu'aucun navire n'a pu trouver de passage.\r\n\r\nCeci étant dit, j'ai parcouru le Nord du continent en long et en large. J'ai voyagé vers le Grand Nord, partagé des banquets avec les fiers marchands et mercenaires que sont les Norduns. J'ai même eu le privilège d'apercevoir la Reine de Nordunfëlt. Seule nation, à ma connaissance, dirigée par une lignée de Reines. Au Sud de Nordunfëlt, j'ai traversé les steppes Adlsanites, vu de mes yeux cette immense armée sanguinaire, ces femmes parées d'or et de jade, et les seigneurs de guerres Aldanites, empalés devant la Cité Impériale pour avoir déçu leur Empereur.\r\n\r\nJ'ai aussi passé de longs mois dans le royaume souterrain des Dwergs de Duerom, écoutant les histoires de leur passé perdu, de ce savoir disparu et de cette nation meurtrie par l'absence de leur Histoire passée. Bien entendu, j'ai aussi traversé en long et en large, la zone neutre du Guet, où toutes les nations d'Assia siègent, certaines par crainte de la réalisation d'une prophétie de fin du monde, d'autres pour le prestige, car les décisions du Guet peuvent faire plier une nation.\r\n\r\nEt ma chère Fédération natale, bijou de la civilisation humaine, ultime rempart contre la sorcellerie qui détruit chaque jour un peu plus le monde, provoquant mort et famine, maladie et malheur. Que dire de la Nouvelle Knêdée ? Une nation jeune, de vaillants guerriers et des philosophes pouvant rivaliser avec ceux du Midland. Certainement, le deuxième joyau d'Assia, après ma nation de naissance bien entendu. Ah ! J'allais oublier la petite nation Nuerin. Protégée par ces sentinelles de pierres titanesques, nation où se côtoient Dwergs et Humains, au cœur d'un oasis le long du Yil. Des architectes hors du communs, construisant des tombeaux gigantesques, chatouillant le ciel, à la gloire de leur dirigeant. Une nation obsédée par l'histoire et la valeur des objets, une nation rusée et intelligente.\r\n\r\nBien que cela ne m'enchante guère de vous en parlez, bien que ma main tremble, et que les larmes me montent aux yeux, je me dois de vous prévenir de la sombre nation des Sorciers. A l'Ouest du Midland, dans un désert de roche et de sang, d'innombrables tribus, où les sorciers exercent librement. Meurtres de masses, viols et sacrifices humains sont courants. Les hordes de sorciers passent régulièrement les frontières du Midland et de Duerom pour s'emparer de pauvres innocents. Tout cela, je ne le sais que trop bien, ayant servi dans les Brigades, j'ai longtemps protégé la Fédération et Assia, j'y ai laissé mon cœur et une partie de mon être, j'y ai laissé de valeureux camarades...	http://assia-gn.fr/	8000	2018-07-27 15:49:16+02	3	7	72	EUR	medium	\N	\N	\N	\N	\N	\N
8	les-legendes-de-zaelwair-2018-les-derniers-traldars	Les Légendes de Zaelwaïr 2018 "Les derniers Traldars"	la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer	Dans les hautes plaines d'Oril, la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer. Il est temps pour vous de marquer votre histoire sur une pierre qui s'ajoutera aux légendes de Zaelwaïr.	https://www.facebook.com/events/109227123181863/	3000	2018-08-11 20:00:28+02	3	7	6	EUR	long	\N	\N	\N	\N	\N	\N
79	les-oublies-des-fjords-session-decouverte	Les oubliés des fjords - Session découverte	Jeu viking ouvert aux débutant.e.s	Fjords d'Aagmard, Freyjaa, Fjord du Jarl Hanvrildson,\r\n\r\nNous n'avions pas compris que le mal était au fonds d'eux. Ils avaient dressé leurs drakkars contre le roi et son conseil. Ils avaient choisi de glisser doucement vers les idées de Stieg et ses partisans. Avaient-ils décidé de leur propre chef ou étaient ils possédés par un sombre sorcier comme des pantins ? Une délégation a été constituée pour essayer de raisonner ce clan.\r\n\r\nLe jarl avait reçu un pigeon voyageur pour préparer cette visite et avez accepté la venue d'une délégation hétéroclite provenant des différents royaumes de Galaté.\r\n\r\nLa table était dressée et l'hydromel versé dans les cornes...D'apres négociations allaient s'ouvrir …\r\n\r\nCependant, il semblait que quelquechose d'autre vivait en ces lieux et qu'elle serait le responsable de grands malheurs.\r\n\r\n\r\n\r\nRetrouvez nous pour cette aventure au camp du Dragon à Lizio, les week-ends :\r\n\r\nLe week-end du 7/8 juillet 2018 pour le niveau Aventurier (découverte/débutants)\r\nLe week-end du 25/26 Août 2017 pour le niveau Héros (passionnés)\r\n\r\nCette aventure comprend :\r\nUn livret de jeu\r\nUn accès privé à la gestion virtuelle sur le site internet\r\nLe prêt de matériel de jeu\r\nLe prêt de costumes éventuels\r\nL’accès à un week-end au gite du Camp du Dragon\r\nLe repas d’un traiteur spécialisé dans la cuisine médiévale du Samedi Soir\r\nLes boissons sur la soirée\r\nUn petit déjeuner copieux\r\nL’assurance\r\nTous les ingrédients d’un Jeu en Grandeur Nature seront là pour cette aventure qui peut se jouer indépendamment des autres jeux mais aussi qui se déroulera dans le cadre de la campagne du Camp du Dragon.	https://www.facebook.com/events/1943544382576464/	6500	2018-07-07 15:24:57+02	3	73	57	EUR	short	\N	\N	\N	\N	\N	\N
121	les-rencontres-de-la-fedegn	Les Rencontres de la FédéGN	AG de l'association et événements autour	AG de l'association et événements autour	http://www.fedegn.org/	0	2018-12-15 18:18:28+01	3	102	2	EUR	medium	\N	\N	\N	\N	\N	\N
58	les-terres-de-soscath-chapitre-2-le-divin-malsain	Les Terres de Soscath : Chapitre 2 - Le Divin Malsain	GN dans un univers mélangeant SteamPunk est Med/Fan. Là où la technologie defis la magie.	Bienvenue pour le Chapitre 2 des Terres de Soscath.\r\nAprès la prise de pouvoir d'une petite fille sur GravenFell, les habitants de la cité ont du fuir pour mettre en place un camp de fortune à l’extérieur de l'enceinte.\r\nLe Gouverneur a rejoint la capitale et seul son fils ainé a pu fuir le désastre.\r\nCar oui c'est un désastre, les rues de la cité sont infestées de Goules et les habitants qui n'ont pas fuit se comportent bizarrement.\r\nCourage tout est encore possible...	https://www.facebook.com/events/741948032655816/	4700	2018-05-19 04:18:15+02	3	57	52	EUR	medium	\N	\N	\N	\N	\N	\N
32	lheure-du-gn	L'Heure du GN	Rendez-vous amical GNiste à Rennes	La Guilde de Bretagne, l'Heure du Jeu et Nicolas Tex de l'Association Ludique des Gnistes Rennais sont heureux de vous accueillir pour ce rendez vous des Gnistes Rennais.\r\nQue vous soyez habitué ou néophyte, Bretons d'origine ou d'importation, retrouvez nous pour parler de nos de votre loisir.	https://www.facebook.com/events/1617153478342369/	0	2018-04-05 20:22:27+02	3	32	30	EUR	hours	\N	\N	\N	\N	\N	\N
9	lhorreur-vient-du-nord	L'horreur vient du Nord	Il s'agit d'un GN état-major où les personnages sont des chefs de guerres sur le front de Nordia.	Il s'agit d'un GN état-major où les personnages sont des chefs de guerres sur le front de Nordia. Le scénario est l'application du plan prévu durant la soirée diplomatique qui a eu lieu en septembre.\r\n\r\nPendant la soirée vous aurez des jetons représentants vos troupes et une carte de la région de votre champ de bataille. Vous devrez donner vos ordres à vos troupes et vous recevrez des nouvelles de celles-ci via des messagers. Ainsi, c'est à vous d'anticiper les mouvements de l'ennemi, de commander vos troupes au mieux, et d’interpréter les informations qui vous parviendront du front. \r\n\r\nC'est donc avant tout un jeu de plateau, un costume est demandé mais il n'y aura pas de combat en grandeur nature.\r\nLe jeu se déroulera le 28/01/2018 et commencera vers midi (à préciser).\r\n\r\nUne PAF de 5€ est demandée (incluant de quoi grignoter) pour la base, mais pourra être augmentée si on doit louer un lieu spécifique pour le jeu.\r\n\r\nNous vous tiendrons au courant dès réception de votre inscription.\r\n\r\nSYNOPSIS\r\nl s'agit d'un GN état-major, à l'instar du GN de la bataille d'Armenghard (pas celle de FroidesMurailles, mais l'autre).\r\n\r\nNordia s'est bel est bien réveillée et à déferlé sur l'Empire une fois de plus. Ses armées ont déjà envahi complètement les provinces d'Asjalas et de Cystar ainsi que plusieurs autres villes et territoires, dont la capitale impériale Tolois-sur-l'Auh.\r\n\r\nMais une coalition s'est formée, et trois batailles vont bientôt avoir lieu, au même moment fatidique.\r\n\r\nA l'Ouest, les généraux Arkirst, Riddar et le récemment nommé général Wigsod vont devoir combattre pour la survie d'Huldoran.\r\n\r\nA l'Est, Milundyr est sous le siège de hordes voraces, et la reine Alice le Brandon, le général varian Krash Pivo, le général rosylan Charles de Falior, et le chef de clan darjalien Sylisard vont devoir la défendre.\r\n\r\nEnfin, au centre, les varians Louis de Tasconie et Edouard de Bourg-Neuf, les généraux impériaux Farrok et Iva de Vosque, ainsi que la reine Darjub et Scaepio vont devoir reconquérir la cité, la capitale de l'Empire, Tolois-sur-l'Auh.\r\n\r\nVers quelle fin le monde se dirige ? Une funeste, ou un espoir ?\r\n\r\nLes civils fuient, tandis que les troupes pressent le pas pour ne pas se faire prendre de vitesse. La grande guerre va avoir lieu et elle s'annonce terrible. Le prêtre Scaepio doit partager des informations sensibles issues de son infiltration récente de Nordia.\r\n\r\nUn message a été porté dans tout l'Empire, de Melvyn lui-même:\r\n"Cela fait trop longtemps que cette guerre dure, mais tout devient de plus en plus clair et la fin ne pourra plus être pacifique...\r\n\r\nL'horreur vient du Nord"\r\n- Empereur Melvyn	https://www.facebook.com/groups/gndelest/permalink/10154916719756780/	500	2018-01-28 19:03:37+01	2	8	7	EUR	short	\N	\N	\N	\N	\N	\N
83	mahoutokoro	Mahoutokoro	GN école de sorcellerie, traditions et croyances magiques japonaises. Rythme lent, non-dits, sous-entendus. Des échanges feutrés plutôt qu’une course à la résolution.	Mai 2013 : Les examens de dernière année viennent de s’achever, les élèves ayant réussi les tests du C.A.G.E. se dirigent tous avec joie vers un avenir brillant, qu’il soit déjà planifié ou qu’il soit encore à écrire…\r\n\r\n    Mais pour une poignée d’étudiants, rien n’est encore fini!\r\n\r\n    L’école impériale de magie Mahoutokoro propose un stage intensif de préparation aux épreuves optionnelles, qui permettront peut être à ceux qui n’ont pas validé leur diplôme d’obtenir les quelques points manquants. Quand à ceux qui se battent pour la tête du classement, le stage permettra de grappiller quelques points bonus, et de s’assurer ainsi l’admission dans les meilleures universités magiques.\r\n\r\n    Les épreuves des options sont dans quelques jours, il reste peu de temps…\r\n\r\nIntentions de jeu\r\n\r\nType de jeu\r\n\r\nLe jeu se veut immersif et sérieux, sombre par moments, tout en prenant soin de laisser la part belle aux traditions et  à la poésie typique du Japon. Il tentera de vous offrir un véritable dépaysement dans les habitudes et les systèmes moraux de réflexion et de prise de décision.\r\n\r\nCe que ce jeu est\r\n\r\nCe jeu est un épisode central de la vie des protagonistes, un moment charnière de leur existence. Leurs choix en jeu influençeront le reste de leur vie. Il y aura beaucoup de choses à ressentir, mais aussi de longs moment d’ambiance et de contemplation. Prévoir un rythme lent, des non-dits et des sous-entendus, des échanges feutrés plutôt qu’une course à la résolution. J’ai essayé de mettre beaucoup de poésie dans ce jeu, et une bonne dose de romance s’y est glissée malgré moi. Les inspirations sont diverses, Harry Potter pour le cadre, mais aussi Miyazaki, et plus généralement les croyances populaires japonaises.\r\n\r\nCe qu’il n’est pas\r\n\r\nCe jeu n’est pas un GN scolaire Harry Potter classique, dans le sens où le monde d’Harry Potter s’efface beaucoup au profil des traditions et croyances magiques japonaises, et que le nombre réduit de joueurs change totalement l’ambiance par rapport aux jeux scolaires de masse. Le temps est réparti entre les cours, les repas, les démonstrations des clubs et du temps libre pour réviser. Pas de bal ni d’évènement exceptionnel en vue.\r\n\r\nEcriture\r\n\r\nLes fiches sont détaillées et rédigées sur une dizaine de pages ; il n’y a pas de co-construction de personnages en amont ou en atelier. Pour autant, une fois le jeu débuté, le joueur peut emmener son personnage où il le souhaite pour construire son histoire suivant l’arc narratif de son choix et les suggestions de caractère de la fiche.\r\n\r\nAvant-jeu\r\n\r\nLe jeu sera précédé de quelques ateliers et de plusieurs briefings qui vous permettront d’intégrer les codes sociaux et les règles de sécurité pour une plus grande fluidité en jeu.	http://www.rajr.fr/mahoutokoro/	8500	2018-07-20 15:43:34+02	3	77	47	EUR	medium	\N	\N	\N	\N	\N	\N
93	little-chicago-sexe-drogues-et-nuka-cola-session-2	Little Chicago : sexe, drogues et nuka cola - Session 2	Un GN librement inspiré du monde de Fallout. Il s'agit de la seconde édition de l'événement, version dopée au Buffout!	Un GN librement inspiré du monde de Fallout.\r\nIl s'agit de la seconde édition de l'événement, version dopée au Buffout!	https://www.facebook.com/events/136761500372404/	9000	2018-08-10 16:17:11+02	3	83	78	EUR	medium	\N	\N	\N	4000	https://www.helloasso.com/associations/arcan-les-demons-d-ivoire/evenements/little-chicago-sexe-drogues-et-nuka-cola-v2	https://www.helloasso.com/associations/arcan-les-demons-d-ivoire/evenements/little-chicago-sexe-drogues-et-nuka-cola-v2
33	lotka-volterra-an-international-scifi-larp	Lotka-Volterra: An international scifi larp	International Larp : Sci-fi larp set in a bleak near future where mankind is all but extinct, preyed upon by a technologically superior alien threat	Lotka-Volterra is an international scifi larp set in a bleak near future where mankind is all but extinct, preyed upon by a technologically superior alien threat, but nevertheless surviving against all odds. You will be playing one of the survivors of Haven Colony, doing a duty rotation at the newly opened outpost of Thermopylae.\r\n\r\nThrough hard work, teamwork and fighting spirit you will make sure that you, your loved ones and your friends survive, and even thrive.	https://lotka-volterra.se/	25225	2018-04-05 23:29:56+02	3	33	31	EUR	medium	https://www.facebook.com/events/1927650087491409/	\N	\N	\N	\N	\N
54	mrmrs-unscripted	Mr&Mrs – Unscripted	International Larp (in English): Twelve contestants compete to become the ultimate Mr&Mrs. Fictional reality TV show.	Twelve contestants compete to become the ultimate Mr&Mrs.\r\n\r\nSix couples will live together for five weeks in the idyllic Swedish countryside and let their love be put to the test. Which relationships will survive the challenges thrown their way and who will be the last couple left standing? The winning pair will receive a family home in the countryside, an all-expenses-paid dream wedding and a reality show that follows their lives as newlyweds. \r\n\r\nAfter becoming successful in the USA, Mr&Mrs – Unscripted has now reached Scandinavia and Channel 3. Are you the couple we’re looking for? \r\n\r\nThis LARP\r\n\r\nMr&Mrs – Unscripted is a Live Action Roleplaying (LARP) event about the making of a fictional reality tv show. Participants will portray the production team and contestants from the day of their arrival on location to the first day of eliminations.\r\nNew to LARP\r\n\r\nMaybe you’ve never heard the term LARP before. In that case more information can be found here. In short it can be described as a mix between performance art, improv theatre with no audience and roleplaying in a real setting.\r\n\r\nMore information on safety, vision, design and characters for this particular LARP can be found by clicking your way through the website.	https://unscripted.se	15400	2018-05-08 04:05:02+02	3	53	49	EUR	long	\N	\N	\N	\N	\N	\N
39	murder-lz127-le-graf-zeppelin	Murder LZ127 Le Graf Zeppelin	Murder	Informations réservées aux inscrits	http://antredutemps.org/blog/index.php/2017/06/11/murder-lz127-le-graf-zeppelin/	4000	2018-04-14 02:50:05+02	3	39	36	EUR	medium	\N	\N	\N	\N	\N	\N
94	prisme-la-fete-de-dahma	Prisme : La Fête de Dahma	Dans le monde de Crystal, un univers médiéval féérique sombre (low fantasy darkage), avec de la diplomatie, de la magie, du combat et de l’aventure.	LETTRE D’INTENTION\r\nGN « La Fête de Dahma » 2018\r\n\r\nA l’instar des GN PRISME précédents, notre intention demeure la réalisation d’un GN de taille conséquente (bien que plus modeste cette année), et ce tout en conservant un univers homogène et cohérent, ainsi qu’un maillage complexe de scénarii construits, dans lequel nous intégrerons et travaillerons l’ensemble des personnages. Nous voulons certes profiter du nombre pour créer des effets de groupes et de masse, pour que les batailles et les alliances comptent, mais nous tenons à préciser que malgré cela, chaque joueur recevra un rôle personnel (bien que relativement court) avec une histoire unique intégrée dans la trame du jeu et ses scénarii. Note : les personnages de 2016 ne seront pas rejouables.\r\n\r\nFormat, date et lieu\r\nLe GN « La fête de Dahma » est un jeu de rôle grandeur nature organisé pour 220 joueurs environ par le Collectif Prisme du 11 au 14 Août 2018 sur le domaine de la Roche-Florens, à 15 minutes de Terrasson (24120). La participation aux frais d’organisation est de 90€.\r\nL’accueil des joueurs se fera à partir du vendredi après-midi. Le jeu commencera le samedi 11 août à 14h et se déroulera jusqu’au mardi 14 août après-midi (environ 15h) suivi dans la foulée par la légendaire Crystal Party. Le démontage aura lieu le mercredi 15 août : ce jour étant férié, vous aurez tout le loisir de ranger et prendre la route reposés.\r\n\r\nLe jeu\r\nLe GN « La Fête de Dahma » se déroulera dans le monde de Crystal, un univers médiéval féérique sombre (low fantasy darkage) de notre création. Les scénarii proposés mêleront de la diplomatie, de la magie, du combat et de l’aventure. Nous veillerons à ce que chacun de ces aspects ne prenne pas le pas sur l’autre. \r\nDavantage d’importance est accordée à l’interprétation roleplay des personnages qu’à la résolution de nos intrigues. Plutôt qu’une approche compétitive vis-à-vis des objectifs, nous encourageons les interactions et les belles scènes de roleplay, quitte à délibérément échouer avec panache. Ainsi, que ce soit pour la continuité des scénarii que pour l’appropriation de votre personnage, la mort définitive de celui-ci est difficile mais reste néanmoins possible.\r\nEnfin, nous attendons des joueurs un investissement dans la réalisation de leurs costumes et de leurs campements qui devront être cohérents avec notre univers. \r\n\r\nL’organisation\r\nPour simplifier nos démarches, nous avons investi en 2016 dans une plateforme Web que nous améliorons en continu. Elle permet de gérer entre autres les inscriptions, les paiements et les envois de documents. De plus, elle offre un outil de création de personnage où chaque joueur reçoit le même nombre de points lui permettant de choisir librement leurs compétences de manière équitable et ludique.\r\nEn balance avec le lourd investissement personnel de chaque membre de notre équipe (tous bénévoles sans exceptions), nous souhaitons avoir les moyens de nos rêves et ambitions. \r\nBien que très vaste, notre terrain ne dispose pas de lieux en dur. Nous avons donc prévu l’installation de chapiteaux qui serviront non seulement à l’ambiance et à l’immersion, mais aussi de plan B en cas de météo pourrie. \r\nAu niveau sanitaire, des douches (eau non-chauffée) et des toilettes sèches (régulièrement entretenues par du personnel dédié) seront installées et disponibles pour tous les participants.\r\nLes repas ne sont pas compris dans le PAF mais des boissons chaudes et non-alcoolisées seront disponibles gratuitement et en continu dans notre taverne. Il y aura sur site des prestataires indépendants qui proposeront aux joueurs une offre variée tant au niveau du prix qu’au niveau du choix. Évidemment, les joueurs seront aussi libres de manger à leur camp, avec ce qu'ils ont prévu.\r\n\r\nLes inscriptions\r\nCompte tenu du nombre de places de joueurs disponibles considérablement plus restreint qu’en 2016, nous nous attendons à un « déferlement frénétique » d’inscriptions. Ainsi, un système de pré-inscriptions sera mis en place afin que nous puissions nous accorder un certain contrôle et une cohérence dans les groupes. \r\n\r\nTout cela pour arriver à un objectif bien précis : vous faire vivre une expérience inoubliable et vous accueillir dans les meilleures conditions possibles. Nous souhaitons nous donner les moyens d’organiser un bel événement et vous donner l’opportunité de participer à une chouette aventure. Pour que nos et vos investissements comptent.\r\n\r\nA bientôt, nous l’espérons, sur le terrain de la Roche-Florens l’été prochain !	http://collectif-prisme.fr/pages/article.php?id=91	9000	2018-08-11 16:19:50+02	3	84	79	EUR	long	\N	\N	\N	\N	\N	\N
19	murder-party-xixeme	Murder party - XIXème	Murder party & nuit dans un magnifique château du Val de Loire : faites une plongée en apnée au coeur du XIXème siècle, époque riche et bouillonnante...	*Kesako ? : Les joueurs, transportés dans une autre époque et un autre univers, mènent l’enquête tout en incarnant un personnage. C’est principe du jeu de rôle, mais accessible, et plus seulement destiné à une minorité de geeks du "GN" !\r\n*Pour qui ? : des groupes de 10 à 60 personnes, particuliers, entreprises, collectivités ...\r\n*Pour quoi ? : pour s’éclater, se challenger, se dépasser, mais aussi pour souder une équipe, booster sa créativité et tester ses capacités à résoudre un problème\r\n*Comment cela se passe ? : en journée ou en soirée, le jeu peut durer entre 2h et 4h, avec ou sans restauration.\r\n\r\nIntrigués ? Intéressés ? N'hésitez pas à nous contacter ...	https://www.facebook.com/guillemettenquetes/	18000	2018-03-18 00:09:25+01	3	18	16	EUR	medium	\N	\N	\N	\N	\N	\N
82	myrddin-emrys-college	Myrddin Emrys College	International Larp (in English) : Larp school specialized in higher education for witches and wizards from all over the world	Imagine our world, just as it is today. Except that magic is real. The world of magic exists in the shadows of our own mundane world - undiscovered by billions, but known to the initiated.\r\n\r\nHexblood it is called - the blood of sorcerers. All humans possess a little of it, and some possess a lot. Yet, even the strongest of bloodlines sometimes turn up a child with no magical ability, and some of the most powerful witches have been born to Mundane parents. Magicians have been arguing about the importance of hexblood for centuries, but however the truth may be, magical talent (or the lack of it) is something that becomes apparent during the teenage years, when children become young adults.\r\n\r\nWhenever a child of a Gifted family is found to have magical ability, the child is sent off to one of the magical institutions to learn how to use these powers. Home-schooling happens, but is strongly frowned upon, and can lead to disastrous results. If a child of non-magical parents suddenly discovers powers within themselves, someone with the right training is bound to notice eventually and will bring the youth in for teaching. Whatever the past, at some point the young person in question will be sent to one of the centres of magical learning - for example, our Myrddin Emrys College.	https://www.meclarp.com/about	27000	2018-07-20 15:39:27+02	3	76	70	EUR	long	\N	\N	\N	\N	\N	\N
76	nakzar-le-fleau-du-nord	Nakzar: Le Fléau du Nord	Med-Fan	L’Empire du Nord est en guerre contre Nordia depuis plus de 3 ans, de nombreuses pertes sont à déplorer et encore plus de disparitions. Nordia, dirigée officiellement par le conseil des haut-prêtres de Tanaros, mène des actions au nom d’un chaos et d’un être inconnu à la voix terrible. Plusieurs de ces actions ont consisté à prendre des prisonniers et des otages.\r\n\r\nCeci est l’histoire de certains d’entre eux. Ils viennent du Fydaron, de Varia ou du Darjalad et ont été otages de leur ennemi, puis oubliés de leurs alliés.\r\n\r\nLe jeu se déroulera dans un camp de travail de Nordia reculé dans les terres gelées, et les personnages en seront des prisonniers fraîchement déplacés. Celà fait près de 2 ans que les personnages vivent cette vie et ce dernier transfert semble être le dernier...\r\n\r\nOn raconte que l’on voit passer sa vie devant ses yeux au moment d’embrasser la mort, en réalité ce sont des souvenirs les plus forts qui ponctuent les derniers souffles. Ce sont les rêves brisés, les déceptions, les souvenirs heureux ou amers qui bercent avant le dernier sommeil...\r\n\r\nC'est donc avant tout un jeu d'ambiance, un costume est demandé mais il n'y aura pas de combat en grandeur nature.\r\nLe jeu se déroulera le 17/03/2018 et commencera vers midi (à préciser).\r\n\r\nUne PAF de 5€ est demandée (incluant de quoi grignoter) pour la base, mais pourra être augmentée si on doit louer un lieu spécifique pour le jeu.\r\n\r\nNous vous tiendrons au courant dès réception de votre inscription.	https://sites.google.com/site/nakzargn/	2000	2018-06-30 05:13:34+02	3	70	7	EUR	hours	\N	\N	\N	\N	\N	\N
53	new-oz-session-8	New Oz Session 8	huis-clos mystico-steampunk	NEW OZ 2858, Nouvelle Australie. La race humaine a failli s'éteindre il y a deux siècles. Vous faites partie de la nouvelle génération de survivants, celle menacée par l'oubli des événements passés, celle de qui va dépendre le futur car c'est à vous de ne pas commettre à nouveau les erreurs de vos ancêtres. Avides, ayant perdu toute connexion au monde, en quête d'une technologie toujours plus avancée et redoutable, les ancêtres sont allés trop loin. Que s'est-il passé exactement? Vous ne sauriez vraiment le dire, hormis que les hommes ont été les acteurs de leur propre perte. Le monde a implosé. Quelques survivants ont réussi à fuir les régions dévastées et à créer un semblant d'ordre social pour assurer la perpétuation de l'espèce. Seules quelques terres sont restées émergées et ont moins souffert que les continents. Cependant la Surface est devenue des plus hostiles et le seul refuge sûr est sous terre.Mais la race humaine est pleine de surprises, capable du pire comme du meilleur. Une nouvelle société est née des cendres de l'ancien monde: vous la connaissez actuellement sous le nom de Fédération du Steamland, dont fait bien sûr partie la Nouvelle Australie ainsi que l'ensemble des Terres Émergées de ce monde. C'est Victoria XVII qui en est à la tête. Mais tout nouvel ordre imposé ne va pas sans contestation, et depuis les temps antédiluviens les hommes ont du mal à apprendre de leurs erreurs... Mots-clés : uchronique, steampunk, spirituel Lieu: New OZ (Nouvelle Australie) Politique: Etats Fédérés sous l'égide de Victoria XVII Format: huis-clos, une dizaine de joueurs, 5 à 6h de jeu. PAF : 10€	https://www.facebook.com/events/1995327417390421/	1000	2018-05-05 04:00:28+02	3	52	48	EUR	hours	\N	\N	\N	\N	\N	\N
31	nuit-du-huis-clos-rennes	Nuit du Huis Clos Rennes	Convention : de nombreux jeux courts	Bonjour à tous !\r\nNous devrions sans doute organisé une NDHC le samedi 31 mars 2018\r\nSeriez vous prêt:\r\n1 à organiser un Huis Clos ?\r\n2 à venir jouer ?	https://www.facebook.com/NDHCRennes/posts/1423704157665948	1000	2018-03-31 10:53:03+02	3	31	29	EUR	hours	\N	\N	\N	\N	\N	\N
84	on-location-session-2	On Location Session 2	International Larp (in English) : It’s 1932. At Tarrington Manor, a peaceful British country house, a cast and crew are assembled for the making of the film ‘Stolen Moments’.	We are pleased to announce that we will be rerunning On Location twice in 2018 — over the weekends of 20–23 July, and 10–13 August. The venue will be the same and the price will be the same: £220 standard ticket, £110 subsidised ticket and £275 for people who want to generously subsidise a space for someone who wouldn’t otherwise be able to afford to go.\r\n\r\nSignups will open in about 5 weeks so if you’d like to leave your name and email here, then we’ll get in touch with you as soon as we have further details.\r\n\r\nThanks for your support and interest!	https://onlocationlarp.wordpress.com/practical/signup/	21498	2018-07-20 15:46:51+02	3	78	71	EUR	long	\N	\N	\N	\N	\N	\N
24	princesse-et-couronnes-russie-1810	Princesse et Couronnes- Russie 1810	Un GN avec un peu de Tagada, des hommes en uniformes, du Tirlipinpon et des bonbons, une princesse, un ogre, des jeunes filles en fleurs, un anniversaire et du Prout-prout en fourrure.	Un Jeu de Rôle Grandeur Nature imaginé, conçu, écrit et subi par Candice & Hervé.\r\nNous souhaitons que nos joueurs expérimentent le froid (prévoyez vos fourrures!), le rire et les larmes - voire les deux en même temps (prévoyez vos mouchoirs), se torturent les méninges (prévoyez de l'aspirine) et profitent du bal (prévoyez de jolies chaussures).\r\nCeci est un formulaire de pré-inscription pour le GN "Princesse et Couronnes- Russie 1810" organisé par l’association "Les Amis de Miss Rachel". Remplir ce formulaire ne vaut pas inscription. Il indique simplement que nous pourrons prendre en compte votre intérêt pour ce GN lors du casting d'une prochaine session.\r\n\r\nLa prochaine session aura lieu un week-end du 4ème trimestre 2018 (site et date vont être arrêtés prochainement). Nous vous attendrons alors le vendredi soir (obligatoirement), le jeu se terminant dans la nuit du samedi au dimanche (couchage sur place). Avant votre départ du site, nous apprécierons un peu d'aide pour nous aider au rangement du site.\r\nLe moment venu, vous devrez vous acquitter d'une PAF de 120€ pour pouvoir participer.\r\n\r\nCandice et Hervé constitueront prochainement la liste des joueur(se)s de cette prochaine session et vous contacteront pour vous inscrire, cette fois définitivement.\r\nNous espérons que vous pourrez en faire partie.\r\n\r\n\r\nCONTEXTE\r\n\r\n6 janvier 1810.\r\nTandis que l'Europe cède à la progression de l'Empereur Français Napoléon, à Saint-Pétersbourg le palais du Tzar s’apprête à célébrer un grand événement : la Princesse Anna de Russie, sœur cadette du Tzar Alexandre Ier, atteint sa majorité : ses proches se préparent à célébrer l’événement.\r\nMais pour la Cour, ce sont les invitations vers les ambassades de Suède, du Royaume-Uni et surtout de France qui suscitent le plus de murmures dans les corridors des palais : Napoléon Ier vient en effet de divorcer de Joséphine, et on lui cherche déjà une nouvelle épouse. Or voilà que la Princesse Anna atteint l'âge de se marier...	https://docs.google.com/forms/d/e/1FAIpQLSfkp3gApwzfobmpqjsFmRyonICrfeMObn48mrqxYoiJtg83eg/viewform?c=0&w=1	12000	2018-03-23 01:13:20+01	3	23	21	EUR	short	\N	\N	\N	\N	\N	\N
65	retour-aux-sources-gn	Retour aux Sources - GN	GN dans le monde de Galaté, univers médiéval fantastique (low fantasy)	LETTRE D’INTENTION du futur GN du Camp du Dragon\r\n« Retour aux sources » fin mai/début Juin 2018 – Fort Saint Père - Saint Père Marc en Poulet 35\r\n\r\nBonjour,\r\nNous vous informons que cette année le Camp du Dragon organisera un GN le week-end du fin mai/début Juin mai 2018 dans le Grand Ouest. Il ne sera pas organisé à « l’Ascension » (début Mai) comme traditionnellement.\r\nDe plus, cette année nous ne souhaitons pas faire un format de type « Campagne historique » (300 à 500 participants) mais plutôt un GN dit « classique » de 110 Joueurs et 40 PNJ environ.\r\n\r\nUn GN dit classique ?\r\nL’équipe organisatrice a choisi de revenir à un format de jeu beaucoup plus modeste, plus traditionnel (ou classique) et dissocié du format défini comme « Mass LARP ». Cette année, nous privilégions l’idée de développer l’historique personnel de chaque personnage et de l'inclure dans un jeu intense. Fin mai 2018, le jeu va donc s’axer autour de 110 Rôles qui seront écrits, tramés et correspondant à des personnages déjà existants dans la liste de nos anciens participants (via la gestion virtuelle) ou quelques nouveaux personnages. Nous allons privilégier le jeu de rôles et non le jeu de factions (sans pour autant l’effacer car un ou plusieurs scénaristes sont dédiés aux factions).\r\n\r\nBien sûr, ce « retour aux sources » à un format dit aussi :\r\n· Un temps de jeu plus court (Installation le vendredi, jeu du Samedi matin au Dimanche).\r\n· Le jeu sera réservé aux adultes et il n’y aura pas de jeu enfants encadré cette année.\r\n· La participation aux frais d’organisation sera de 80€ (repas compris).\r\n· Pas de marché d’artisans et de concert ou animations.\r\n\r\nNotre but est de proposer un GN toujours en cohérence avec le monde de Galaté et ce qui a été déjà joué sur les précédents opus. Le monde de Galaté est un monde médiéval fantastique (de low fantasy) créé par l’association.\r\n\r\nL’implication dans la campagne ?\r\nCe jeu est la suite de notre campagne et des aventures en grandeur nature depuis Avril 2012.\r\n\r\nLe mode d’inscriptions à ce GN ?\r\nCompte tenu du peu de places de joueurs disponibles et beaucoup plus limité qu’en 2017, nous allons privilégier un système de pré-inscription. Ainsi, un système de pré-inscriptions sera mis en place afin que nous puissions contrôler celles-ci et en cohérence dans la représentation des groupes. Surveillez bien votre boite mail pour recevoir le lien de pré-inscriptions.Nous sommes conscients du peu de places disponibles et nous prenons le choix de recentrer notre écriture, avant tout, pour des joueurs impliqués dans l’histoire du Camp du Dragon pour le jeu de 2018. Sans toutefois fermer l'opportunité à de nouveaux joueurs de nous rejoindre, nous allons privilégier ceux qui ont fait grandir le Camp depuis 2012.\r\nL’association Le Camp du Dragon	https://www.facebook.com/events/160952694521917/	8000	2018-05-26 04:39:46+02	3	61	57	EUR	medium	\N	\N	\N	\N	\N	\N
102	returning-home-session-3	Returning Home session 3	Etats-Unis 1945, retour des soldats	Attention, il s'agit bien d'une pré inscription avec sélection des participants par l'organisation si le nombre d'inscrits est supérieur au nombre de places.\r\n\r\nUne première session a déjà eu lieu le  23/24 septembre 2017\r\n\r\nSession 2  : 14/15 avril 2018 \r\nSession 3 :  15/16 septembre 2018 \r\nPour ces  2 sessions, les castings sont complet.\r\n\r\n Je laisse ce formulaire ouvert sans date pour ceux qui veulent faire du lobbying pour 2019;) \r\n\r\n.\r\n\r\nPour être la plus transparente possible, les joueurs sélectionnés seront forcément des connaissances mais aussi des personnes que je ne connais pas mais motivées par la projet. Quelques places sont réservées à des joueurs débutants.\r\nUn mail sera envoyé aux participants.\r\n\r\nSi vous n'êtes sélectionné(e), pas d'inquiétude, il est plus que probable qu'il y ait des rééditions ou des désistements \r\n\r\nDe plus, l'organisation va tâcher de faire au mieux pour que le jeu soit cédé à des personnes de confiance afin de faire vivre ce scénario. \r\n\r\n\r\n            Je vous remercie donc de bien prendre le temps de lire ce qui suit avant de compléter ce formulaire. \r\n\r\n\r\n                                 *************************INFOS PRATIQUES**********************\r\n\r\nCe Gn est organisé par l'association Mondes Parallèles (44) et est écrit par Graziella Gilet et une équipe réduite de relectrices. \r\n\r\nDate : A définir en 2019\r\nLieu : au château du Bourg à St Denis de Gastines dans le 53. \r\nDurée : environ une dizaine d'heures avec des ateliers préparatoires\r\nIl est accessible aux personnes majeures.\r\n\r\nAfin de proposer une PAF raisonnable aux participants,  l'organisatrice et les PNJ devront également s'acquitter d'une PAF. \r\n\r\nPAF PJ : 65€ comprenant collation, dîner, petits déjeuners, lit et adhésion à l'association \r\nPAF Organisatrice +PNJ : 25€ comprenant collation, dîner, petits déjeuners, lit et adhésion à l'association \r\n. \r\n\r\nIl y a 12 rôles féminins et 9 rôles masculins.\r\n\r\n                                                  INTENTIONS ET AUTRES PRECISIONS\r\n\r\nLe GN Returning Home est un GN dramatique et sentimental dans l'Amérique des années 1940. \r\nCe jeu, conçu dans la lignée des GN à secrets, est prévu pour 21 joueurs \r\n\r\nLes intrigues s'appuient sur les relations entre les personnages en particulier sur les tensions d'après-guerre entre hommes et femmes.  En ces temps troublés, le retour des GI's provoque un certain malaise et interroge chacun.\r\nComment les Boys vont-ils pouvoir reprendre leur place à l'usine et plus largement dans la société? \r\nLe programme G.I. Bill arrivera-t-il à réhabiliter ces vétérans ? \r\nLes Rosies rentreront-elles à la maison sans broncher comme le gouvernement l'a annoncé à la Radio? \r\nEt surtout qu'en sera-t-il de l'intimité des couples et des familles face à ces bouleversements historiques ?\r\n\r\nLes thèmes de ce jeu sont les conséquences de la guerre, les amours contrariés, la nostalgie du temps passé, le retour difficile dans les familles ainsi que la patrie et les prémisses de l'émancipation des femmes.\r\n\r\nIl y a aussi des thèmes plus durs qui sont abordés chez certains personnages comme le deuil, l'infertilité, l'IVG, l'alcoolisme, \r\nle handicap, l'homosexualité dans les années 40 , la ségrégation dans les années 40, l'immigration. \r\nSi un de ces thèmes vous gêne, n'hésitez pas à le dire dans le champs prévu à cet effet. \r\n\r\nCe qu'il n'est pas: \r\nCe GN reste un jeu malgré les thèmes traités. Ce n'est pas un GN militant et le but est de passer un bon moment ensemble. \r\n\r\nLe contexte du jeu est situé de manière fictive dans la ville d'Asbury Park, New Jersey où se trouve la fabrique de munitions d'Andrew March. C'est dans cette usine que les Rosies ont participé au Victory Programm en y  remplaçant les hommes sur des postes à risques.\r\nIl se déroule  le 4 juillet  1945, jour de la fête nationale des États-Unis commémorant la Déclaration d'indépendance du 4 juillet 1776 vis-à-vis du Royaume de Grande-Bretagne. \r\n\r\n      Les personnages sont genrés, les femmes jouent des femmes et des hommes jouent des hommes. \r\n\r\n                 ***********************PROPOSITIONS AUTOUR DU JEU************************\r\n\r\nAvant tout précisons qu'il n'y a pas de règles de simulation, fair play et roleplay sont les maîtres-mots de ce jeu.\r\nLes outils qui vont suivre vous seront là pour vous servir et non pour vous brider.\r\n\r\nAteliers pré-GN (obligatoires)\r\nPour rappel, ce sont des ateliers ou exercices en amont du jeu, permettant aux joueurs de se voir, de se reconnaître et  d'échanger avec les autres sur les relations qu'entretiennent leurs personnages.\r\n\r\nLa black box  (facultatif)\r\nAttention!\r\nSuite à la première session, la Black box sera remaniée. Il s'agira du cabinet de Mary la diseuse de bonne aventure où des séances de voyance ou de méduimnité.\r\n\r\nLe destin (définition Dico-GN)\r\nIndication dirigiste donnée au participant.e sur l’évolution prévue de son personnage durant le jeu, qu’il/elle sera encouragé.e à suivre.\r\n\r\n\r\nA part ces spécificités, le Gn se déroulera de manière assez classique (évènements, PNJ, secrets dévoilés ou non etc..)\r\n\r\n\r\nListe non exhaustive des inspirations\r\n>Filmographie \r\nLes plus belles années de notre vie \r\nMémoire de nos pères \r\nIl faut sauver le soldat Ryan\r\n\r\n>Séries télé\r\nBomb Girls\r\nBand of Brothers\r\n\r\n\r\nAu plaisir de vous lire et merci de votre intérêt pour ce GN.	https://docs.google.com/forms/d/e/1FAIpQLSfZPRCNNc03duLXN6b5vh5m_qbfvfJXHMMTzThKEYotfJpROw/viewform	6500	2018-09-15 17:53:41+02	3	90	88	EUR	medium	\N	\N	\N	\N	\N	\N
7	sanguinem-terrae-noblesse-oblige	Sanguinem Terrae : Noblesse Oblige	Dans l'univers panache, cape & épée de la 7ème mer	Le premier GN de l'année est sur les rails! Les inscriptions sont ouvertes et chaque inscrit.e.s peut faire son choix parmi un panel de concepts de personnages, principalement présentés au travers de leurs costumes.\r\n\r\nLa date : 23 au 25 mars 2018\r\nLa PAF : 15€24 + 5€ d'adhésion pour l'année (couvrant uniquement les frais d'assurance) - gratuit pour les PNJ\r\nLe lieu : Moulin de Lavaure (Dordogne)\r\n\r\nLa fiche d’inscription : http://img110.xooimage.com/…/fiche-d-inscripti...e-oblige-5…\r\nLa liste des concepts : http://www.centballesetunmars.net/t1043-costumes-et-concepts	https://www.facebook.com/permalink.php?story_fbid=1415105251931391&id=275488315893096	2000	2018-03-23 18:52:20+01	2	6	5	EUR	long	\N	\N	\N	\N	\N	\N
80	sunfall-2018	Sunfall 2018	International Larp (in English) : Apocalyptic	Once more Denmarks premier apocalyptic LARP experience is heading for Roskilde, the city of Solaris standing proud in the Wasteland, a beacon of hope? Or a den of depravity. Texaco Rangers, The Spill, the Trade Guild, The church and much more all come together to bring you a city sprawling with life.\r\n\r\nEnhancing all the new initiatives that 2017 brought with it and adding new ones, all with the purpose of creating the ultimate Wasteland experience.\r\n\r\nIf you are planning on having an in game camp, you will need to pay the Camp Deposit fee. But it is not necessary straight away. As log as it is done before you arrive at the location.\r\n\r\nAlso note that we will transfer the 500dkk deposit back, when your in game location has been cleaned and cleared by a member of the Sunfall crew. :)\r\n\r\nTuesday the 10th of July the location will be accessible for building your camp and getting ready for Wednesday.\r\n\r\nWednesday the 11th of July will also include time to build your camp and get ready, as for in game start we will announce this as soon as possible.\r\nThursday the 12th July till Saturday the 14th July will be 100% in game 24/7, as something new Saturday will not be cut short for cleanup. Therefore we are getting even more playtime this year.\r\n\r\nSaturday the 14th of July from 23:00 we will have the endgame party.\r\n\r\nSunday the 15th of July is the time for cleaning, packing and getting Boesdal ready for real life.	https://www.facebook.com/events/1864318543886183/	7000	2018-07-10 15:27:29+02	3	74	68	EUR	long	\N	\N	\N	\N	\N	\N
95	terra-antiqua-tome-2	Terra Antiqua (Tome 2)	Conquérir, enquête, combattre, vivre...	Terra Antiqua est un événement de type MASS LARP, organisé par l'Association Fantasticus sur le célèbre site de jeu de Kandorya. Venez conquérir de nouveaux territoires sur la Terra Antiqua, enquêter sur la disparition de toute une civilisation, combattre des forces obscures et vivre de nombreuses aventures en solo ou en groupe.\r\n\r\nClôture des incriptions le 12 Août 2018\r\n\r\nPJ adulte : 49€ (tarif en Septembre 2017) + 1 repas offert (+5€ tous les mois)\r\nJuniors (7 - 14 ans) : 35€ + 1 repas offert\r\nEnfants (- 7 ans) : GRATUIT\r\nPNJ : 25€ + 1 repas offert\r\nOrga : GRATUIT + 1 repas + défraiement 110€ OU GRATUIT + repas\r\nChien : 10€	https://www.facebook.com/events/528341857557945	4900	2018-08-16 17:18:52+02	3	7	80	EUR	medium	\N	\N	\N	\N	\N	\N
46	the-clock-session-1	The Clock session 1	Tous les membres de la haute société de Londres sont conviés à notre 6ème concours scientifique ! (Murder-GN, ambiance 1900-Steampunk)	6ème Edition du concours d’inventions du club « THE CLOCK »\r\nEdition organisée par le Docteur Georges Clifford, membre fondateur.\r\n\r\nTous les membres de la haute société de Londres sont conviés à notre 6ème concours scientifique ! Venez découvrir les dernières innovations révolutionnaires de nos chercheurs mondialement reconnus, ainsi que celles de ceux qui souhaitent se confronter à eux.\r\n\r\nPour s'inscrire, suivez le guide :\r\nhttps://drive.google.com/drive/folders/0B3ZAwUgbM2i5c0Z0b0pibFhQbnM	https://www.facebook.com/events/1838073726504466/?acontext=%7B%22action_history%22%3A%22[%7B%5C%22surface%5C%22%3A%5C%22page%5C%22%2C%5C%22mechanism%5C%22%3A%5C%22page_upcoming_events_card%5C%22%2C%5C%22extra_data%5C%22%3A[]%7D]%22%2C%22has_source%22%3Atr	4500	2018-04-21 03:29:20+02	3	46	43	EUR	hours	\N	\N	\N	\N	\N	\N
111	the-clock-session-2	The Clock session 2	Tous les membres de la haute société de Londres sont conviés à notre 6ème concours scientifique ! (Murder-GN, ambiance 1900-Steampunk)	6ème Edition du concours d’inventions du club « THE CLOCK »\r\nEdition organisée par le Docteur Georges Clifford, membre fondateur.\r\n\r\nTous les membres de la haute société de Londres sont conviés à notre 6ème concours scientifique ! Venez découvrir les dernières innovations révolutionnaires de nos chercheurs mondialement reconnus, ainsi que celles de ceux qui souhaitent se confronter à eux.\r\n\r\nPour s'inscrire, suivez le guide :\r\nhttps://drive.google.com/drive/folders/0B3ZAwUgbM2i5c0Z0b0pibFhQbnM	https://www.facebook.com/events/148024752480846/	4516	2018-10-06 18:22:00+02	3	46	43	EUR	hours	\N	\N	\N	\N	\N	\N
66	thedas-le-dernier-bastion	Thédas, le dernier Bastion	Grandeur Nature médiéval-fantastique en Alsace sur le théme de Dragon Age.	Dragon Age est une série de jeux vidéos se déroulant dans un univers médiéval fantastique, où magie et démons côtoient des chevaliers, des nobles belliqueux, et des dragons. Fourmillante d’intrigues et de conflits en tout genre, il est difficile même pour un connaisseur d’en connaître tous les ressors.\r\n\r\nCe résumé vise à vous donner une connaissance de base en tant qu’habitant de Thédas.\r\n\r\n\r\nBref historique\r\n\r\nLes Temps Anciens : l’Empire de Tevinter\r\n\r\nDans le millénaire qui a précédé la première ère selon le calendrier actuel, une époque mouvementée connue sur le nom de Temps Anciens s’est déroulée. De nombreuses connaissances de ces temps lointains ont disparues, mais tout le monde s’accorde à dire que l’Empire de Tevinter se forma et régna en hégémonie sur Thédas, avant que des luttes internes de succession et l’apparition de la Chantrie ne scindent l’Empire en de nombreux royaumes.\r\n\r\nC’est ainsi à cette époque que les tribus humaines se sont unies en de puissants états, alors que les elfes, auparavant majoritaires, ont décliné, jusqu’à tomber pour la majorité sous le joug des Hommes. Les légendes racontent que Tevinter usa de magie du sang pour faire s’effondrer les villes elfes dans le sol, et que les esclaves qui furent capturés livrèrent de précieux secrets aux mages dirigeant l’Imperium.\r\nLes Temps Anciens : l’Enclin\r\n\r\nLes récits de la Chantrie racontent comment les mages de Tevinter, imbus de leur pouvoir, pensèrent pouvoir pénétrer dans l’Immatériel et trouver la Cité d’Or où siègent les Anciens Dieux. Cet affront au Créateur, selon la Chantrie, causa la corruption de la Cité d’Or qui devint la Cité Noire, et déclencha le premier Enclin. Thédas vit défiler pendant des siècles des créatures inhumaines, les engeances, dirigées par l’Archidémon Dumat. C’est à cette époque que la Garde des Ombres est formée, une unité d’élite seule capable de tuer l’Archidémon et stopper ainsi l’Enclin.\r\n\r\nProfitant de la faiblesse de l’Empire de Tevinter, affaibli par l’invasion des engeances et de l’Archidémon, une prophétesse nommée Andrasté parvint à étendre un culte monothéiste qui deviendra majoritaire : la Chantrie, dirigée par la Divine.\r\n\r\nLes elfes continuèrent pour leur part de décliner, et les nains subirent de plein fouet les Enclins, la majorité de leurs villes souterraines disparaissant des cartes.\r\nDe l’ère Divin à l’ère du Dragon\r\n\r\nDepuis la fondation du calendrier de la Chantrie, à chaque siècle est attribué une ère, dont le nom est choisi selon les signes qu’interprète la Divine. Après l’apparition d’un dragon particulièrement imposant en début d’ère, celle-ci porta le nom d’ère du Dragon, la 9e ère de Thédas.\r\n\r\nPendant les siècles qui ont suivi les Temps Anciens, quatre autres Enclins ont menacé de détruire Thédas, stoppés à chaque fois par la Garde des Ombres. Les royaumes ont néanmoins continué de se livrer leurs guerres, ignorant parfois la menace pour se concentrer sur leurs enjeux politiques. L’Empire d’Orlais a largement prospéré sur les ruines de Tevinter et lui fait à présent face comme un rival important. Le jeune royaume de Ferelden s’est lui battu pour maintenir son indépendance, et reste en froid avec son ancien occupant Orlais.\r\nL’Ere du Dragon : les dernières années\r\n\r\nThédas a été secoué par l’ouverture de nombreuses brèches vers le monde de l’Immatériel. Alors que des démons affluaient de celles-ci pour s’emparer des humains, une nouvelle force, l’Inquisition, s’est formée pour refermer les failles, sous l’égide d’un homme charismatique adulé comme le Messager d’Andrasté. Alors que la Chantrie, affaiblie par la mort récente de la Divine, est en conflit avec ses Templiers qui entrent dans une lutte emplie de dérives contre les mages apostats, l’Inquisition s’impose comme une force fédératrice malgré sa jeunesse.\r\n\r\nMais alors que le Messager disparaît dans des conditions étranges, c’est à présent la menace Qunari qui secoue les royaumes de Thédas. Venus des îles du Nord, et se détournant visiblement de leur guerre ancestrale avec Tevinter, ces hommes cornus ont débarqué à Ferelden avec une puissante armada, et ont commencé un siège de la capitale. Aucune nouvelle du Roi n’est apparue depuis, et l’on dit que c’est pour cette raison qu’un Iarl de Ferelden a demandé l’aide de ses rivaux d’Orlais, en dépit de leurs anciennes querelles.\r\n\r\nIl y a quelques mois, la nouvelle Divine Beatrix IV a ainsi lancé une Marche Exaltée contre les Qunaris, appelant de ce fait Orlais, Ferelden et les forces de la Chantrie à lutter communément contre l’envahisseur. Les dernières rumeurs font savoir qu’un ost important se serait mis en route, et qu’un mariage entre Fereldiens et Orlésiens serait organisé. Mais cela, seuls les présents au Bastion de Tourmaline sauront réellement de quoi il en retourne.\r\n\r\nCOMPRENDRE LE SURNATUREL\r\nMagie et occultisme\r\n\r\nLa magie et les mages\r\n\r\nLa magie provient du monde de l’Immatériel, séparé du nôtre par le Voile, une barrière tangible qui garde les esprits et les humains distants. Ceux capables de manipuler la magie savent comment percer ponctuellement à travers le Voile, et s’exposent par la même occasion aux esprits, qui peuvent tenter de les posséder.\r\n\r\nUn mage possédé est l’une des choses les plus craintes dans tout Thédas, car ces derniers se transforment généralement en Abominations, des êtres démoniaques virulents qui profitent du talent du mage. Par conséquent, les mages suscitent peur et défiance parmi leurs pairs, et la Chantrie opère sur eux un contrôle inflexible via l’institution du Cercle.\r\n\r\nIl existe de plus des mages capables de pratiquer la magie du sang, utilisant d’autres humains pour opérer des sorts améliorés ou de contrôle mental. La réputation des mages en a été d’autant plus ternie. Ceux qui ne sont pas enfermés ou sous l’égide du Cercle sont qualifiés “d’apostats”, et sont vigoureusement traqués par les Templiers.\r\n\r\nLa légende dit que toutes les créatures de Thédas, à l’exception des nains, peuvent percevoir l’Immatériel à travers leurs rêves. Mais seuls les mages seraient capables d’y évoluer de manière pleinement consciente. Les voyageurs oniriques trouvent dans leurs songes un monde obscur que les esprits modèlent pour le faire ressembler au nôtre lorsque des visiteurs y pénètrent.\r\nLe lyrium\r\n\r\nApparaissant à la fois dans le monde matériel et l’Immatériel, le lyrium est un minéral étrange doué de propriétés uniques. Les Templiers en consomment pour résister à la magie, et les mages pour augmenter leur puissance. Addictive et dangereuse à la consommation, de nombreux scandales ont déjà éventé la surconsommation de lyrium au sein des Templiers. Ce produit, toutefois, continue de circuler généreusement dans Thédas, bien que son extraction expose souvent les mineurs à la présence d’engeances qui habitent les tréfonds.\r\nLes esprits et les démons\r\n\r\nOn sait peu de chose en réalité sur les habitants de l’Immatériel. La Chantrie apprend à ses fidèles que ce sont les premières créatures du Créateur, et qu’il s’en est détourné pour façonner notre monde. Jaloux de notre attention et de nos sentiments, les esprits tenteraient de les copier, et de posséder les Hommes pour ressentir eux-aussi.\r\n\r\nDes esprits bénéfiques et maléfiques existeraient dans ce monde, mais leur nature inadaptée au monde matériel les rendrait souvent confus et dangereux.	http://gn-thedas.fr	5000	2018-06-01 04:44:38+02	3	62	7	EUR	medium	\N	\N	\N	\N	\N	\N
60	the-quota	The Quota	International LARP (in English): explore some of the pressures and crisis points experienced by refugees and migrants trapped in the limbo of an immigration detention centre	The Quota Experience \r\n\r\nEvery character’s experience will be different. You affect this through the character you create and their choices in the larp.\r\n\r\n    You will eat, sleep and shower at prescribed times.\r\n\r\n    You may share your memories of home or your dreams for the future.\r\n\r\n    You may try to break the rules\r\n\r\n    You may face intimidation from the guards or from other detainees.\r\n\r\n    You may try your hardest to make the quota. It still may not be enough to get you out.\r\n\r\nThe Quota is a live role-play experience designed to explore some of the pressures and crisis points experienced by refugees and migrants trapped in the limbo of an immigration detention centre. As well as the physicality of the detention centre, this experience will give the participants space to explore the psychological effects of detention centres - will your character find comfort in the institutional routine, or will they find it frustrating? Will your character find their resolve eroded or strengthened by the detention centre? How will your character retain their sense of purpose, their sense of hope… and how might they lose these things if they were forced to remain in the Quota process for a long time? Can you hold on to a sense of yourself, can you build a community within the detention centre?	https://www.quota.cymru/	17000	2018-05-24 04:24:19+02	3	58	53	EUR	medium	\N	\N	\N	\N	\N	\N
50	the-wall-2061-citygame-larp	The Wall 2061 Citygame LARP	wall 2061 cyberpunk city live-action-roleplaying-game	The Wall 2061 is a Cyberpunk City Live-Action-Roleplaying-Game (LARP). As a player, you will be part of one of four resistance groups, all trying to tear down the wall. You will visit interesting locations, talk to NPCs and try to get as much information as possible. All the while you have to figure out how to navigate the dangerous dystopian future of 2061.\r\n\r\nThe Wall 2061 is a game for everyone – we try to give people that are completely new to larp a chance to explore the playstyle, but also have roles fore veteran roleplayers.\r\n\r\nFor the latest updates sign up for the newsletter at http://wall2061game.com/\r\n\r\nKickstarter for sign-ups coming in January 2018.	https://www.facebook.com/events/1971807369759886/	3500	2018-04-28 03:44:18+02	3	49	45	EUR	hours	\N	\N	\N	\N	\N	\N
25	un-jeu-parmi-les-ombres-13-le-sel-de-la-terre	Un Jeu Parmi les Ombres 13 - Le Sel de la Terre	13 épisode d'une Chronique Trône de Fer	Après un bref automne, l’hiver est là. Aux longues nuits succèdent des jours froids et nuageux, la pluie semblant emporter avec elle les joies de la Jouvencelle et ses festivités. L’ambiance dans les royaumes est au diapason du temps : chacun se replie sur soi pour gérer au mieux ses terres et faire face aux difficultés qui s’accumulent. Cela fait maintenant plusieurs années que le règne de Baelor Ier est entamé et le bilan est mitigé. Si l’approbation du peuple est complète, les grandes mesures altruistes du souverain ont ruiné de nombreuses familles nobles.\r\n\r\nBien que l’exonération générale des taxes sur le grain ait moins affecté cette région montagneuse, les Terres de l’Ouest ont tout de même rencontré leur part de déboires. Tout un chacun a entendu parler de l'infamie de la maison Corkwell, traîtresse envers la Couronne, faussaire et coupable d’empoisonnements. Cela commence à faire bien des années que ces terres sont sans seigneur et le bon roi Baelor s’inquiète pour le devenir du peuple, déjà éprouvé par la dure gestion passée.\r\n\r\nC’est ainsi que Sa Majesté décide de venir en personne constater la détresse du peuple et soulager sa peine. Ne pouvant laisser le roi venir sur ses terres sans pouvoir l’y accueillir, le Maître des Lois, lord Tytos Lannister, organise ce déplacement avec d’autres dignitaires. Une telle opportunité de côtoyer les puissants du royaume étant rare, de nombreux nobles saisissent cette occasion de venir présenter leurs doléances et de régler certaines affaires. Ces terres étant proches de la triple frontière entre Lannister, Tully et Tyrell, la noblesse de ces trois régions est attendue … mais pas que ! On raconte que des dignitaires étrangers venus d’aussi loin qu’Essos se sont joints à ce curieux rassemblement. Cela laisse présager une journée intense en négociations de toutes sortes.\r\n\r\n---\r\n\r\nCe jeu se déroulera dans notre univers persistant du Trône de Fer. Ce sera un rassemblement mondain empli de gravité qui sera l’occasion pour vous d’explorer les thèmes suivants :\r\n\r\nLa détresse et ses déclinaisons selon les échelles de la société\r\nLa charité et sa difficile mise en oeuvre par la noblesse en ces temps troublés\r\nLa Foi, la vertu et leur rapport au pouvoir\r\nCe jeu s’adresse à vous si vous aimez le Trône de Fer ou le jeu de cour médiéval, que vous aimiez accomplir des objectifs ou que vous soyiez au contraire à la recherche de belles scènes de RP.\r\n\r\nCe jeu ne s’adresse pas à vous si vous cherchez plutôt des simulations de combat (les duels ou tournois ne sont pas impossibles mais pas au centre du jeu) ou si vous cherchez un jeu de quêtes (fouilles, survie, marche dans la nature …).\r\n\r\n---\r\n\r\nInscriptions ouvertes jusqu'au 17 novembre : https://lesombresdutrone.fr/un-jeu-parmi-les-ombres/parties/13/	https://www.facebook.com/events/167550913827830/	500	2018-03-24 01:23:38+01	3	24	22	EUR	medium	\N	\N	\N	\N	\N	\N
12	vampire-beyond-heresy-law-opus-3	Vampire Beyond Heresy & Law Opus 3	3e Opus de la campagne Vampire	Un GN dur, immersif, et intense dans l'univers du Monde des Ténèbres (White Wolf ®)\r\n\r\nLa soirée du 11 Novembre, c'est du jamais-vu : 40 vampires présents. Une dizaine ont trouvé la Mort Ultime ce soir-là. Entre les espions débusqués et ceux qui viennent simplement chercher un asile, le nouveau Prince Taurus a su faire le tri. Certains sont envoyés dans les Camps de la Soif, des installations désaffectées, souterraines pour la plupart, où vampires indésirables et Garous revanchards attendent, en torpeur ou plongés dans un coma forcé, leur tour d'être jugés, sans aucune concession.\r\n\r\nLe réveil du Mathusalem Nergal a gravement endommagé les protections entourant le Territoire. Là où auparavant la Peste Ailée ne pouvait toucher la Bourgogne entière, à présent seul le territoire de l'Yonne reste intouchable. La zone se restreint. La Peste engloutit la vie partout autour. Les barricades Ravnos se resserrent. Des nouvelles affluent partout dans les cours vampiriques : Auxerre ne se dédclare ni Camariste, ni Sabbatique, ni anarch. Ils ne sont du côté de personne, raconte-t-on. Le message officiel de Taurus est le suivant : "Camarilla, Sabbat, on s'en fout : on vit l'Apocalypse EN CE MOMENT bande de cons, il serait peut-être temps de voir le monde autrement qu'au travers de votre nombril.". Le prince Brujah décrète rapidement que ces idioties de Traditions Camaristes n'ont plus lieu d'être. Grâce aux pages du Livre de Nod trouvées lors de la soirée du 11, il fait en sorte de remettre en place les antiques lois de Caïn, un travail de longue haleine, dont les vampires ne se sont que trop détournés à travers les âges. Cela se décidera prochainement…\r\n\r\nToujours plus de fermeture s'effectue autour des "frontières" du territoire. Les gitans et Ravnos, accompagnés par des hommes lourdement armés, contrôlent le moindre passage. Les vampires qui accourent pour se réfugier dans l'Yonne servent dans les camps de la soif ou sont détruits. Les mailles du filet se resserrent. Mais qu'attendent les puissants, dira-t-on... La Camarilla et le Sabbat voudront également une partie de ce nouvel Eden, c'est sûr. Mais quand viendront-ils le prendre ?\r\n\r\nAu niveau des zones contrôllées du domaine, l'Ouest de l'Yonne est sous occupation Kuei-Jin. Des avions clandestins remplis de troupeaux, hommes et femmes d'influence de Chine ont débarqué dans la nuit du 17 Novembre, sans parler de la mafia... Les Vampires d'Orient sont installés, et contrôlent le Crime, la Bureaucratie, l'Education, la Haute Société, la Police, les Médias, l’Occulte, la Politique, la Rue et les Transports à 50% environ. Certains vampires y voient un moyen de gagner une place dans l'Eden qu'est devenu le territoire de l'yonne. Ils organisent de façon chaotique et de leur propre initiative des raids sur les territoires et influences Kuei-Jin, aidés la plupart du temps de goules combattantes. Aucun n'en revient.	https://www.facebook.com/vampirebhl/	7000	2018-06-08 21:06:40+02	2	12	10	EUR	long	\N	\N	\N	\N	\N	\N
14	vfc-artemis-session-1	VFC ARTEMIS Session 1	thriller psychologique battlestar galactica nordique	FC ARTEMIS est un GN “nordique” (inspiré notamment de “Monitor Celestra”, “Lindangen”, “Mad about the boy” ou “Just a little lovin’”) où les participants collaborent pour créer une histoire dramatiquement intense. La cohérence est secondaire et il n’y a pas de compétition entre participants.\r\n\r\nCe GN comporte des séquences d’action, mais c’est avant tout un thriller psychologique. Il est centré sur les tensions entre personnages et sur le thème du répliquant (paranoïa vis-à-vis des Cylons infiltrés et questionnement sur l’humain). L’ambiguïté morale et les imperfections des relations humaines sont au cœur du jeu.\r\n\r\nLes 22 joueurs incarnent pendant 24h l’équipage nouvellement formé d’un vaisseau spatial militaire (le VFC ARTEMIS), dont la conduite est simulée par le jeu vidéo coopératif Artemis SBS. L’équipage sera organisé en trois équipes de quart, alternant conduite du vaisseau, détente et sommeil.\r\n\r\nAu-delà de l’immersion narrative, une véritable immersion sensorielle est recherchée, au travers de  contacts physiques, de nourriture “réglementaire” et d’un vaisseau spatial qui ressemble à un vaisseau spatial.\r\n\r\nLa création de personnage est transparente et collaborative, et nécessite une participation active. Elle sera facilitée par Karma, un réseau social utilisé en jeu.\r\n\r\nVFC ARTEMIS se déroule les 14-15 juillet 2018 (session N°1) et 28-29 juillet 2018 (session N°2) dans une usine désaffectée en région parisienne. Le confort y sera spartiate : toilettes sèches, pas d’eau courante, lits de camp, etc.\r\n\r\nLes débutants en GN, en jeux vidéos et en airsoft sont les bienvenus ! Seul prérequis : visionner la pilote de la série BSG (2004). Hommes et femmes pourront occuper tous les rôles (comme dans la série).\r\n\r\nLa PAF est de 100 €.	https://experiencegn.jimdo.com/nos-créations/artemis/	10000	2018-07-14 21:10:37+02	2	11	11	EUR	medium	\N	\N	\N	\N	\N	\N
13	vfc-artemis-session-2	VFC ARTEMIS Session 2	thriller psychologique battlestar galactica nordique	FC ARTEMIS est un GN “nordique” (inspiré notamment de “Monitor Celestra”, “Lindangen”, “Mad about the boy” ou “Just a little lovin’”) où les participants collaborent pour créer une histoire dramatiquement intense. La cohérence est secondaire et il n’y a pas de compétition entre participants.\r\n\r\nCe GN comporte des séquences d’action, mais c’est avant tout un thriller psychologique. Il est centré sur les tensions entre personnages et sur le thème du répliquant (paranoïa vis-à-vis des Cylons infiltrés et questionnement sur l’humain). L’ambiguïté morale et les imperfections des relations humaines sont au cœur du jeu.\r\n\r\nLes 22 joueurs incarnent pendant 24h l’équipage nouvellement formé d’un vaisseau spatial militaire (le VFC ARTEMIS), dont la conduite est simulée par le jeu vidéo coopératif Artemis SBS. L’équipage sera organisé en trois équipes de quart, alternant conduite du vaisseau, détente et sommeil.\r\n\r\nAu-delà de l’immersion narrative, une véritable immersion sensorielle est recherchée, au travers de  contacts physiques, de nourriture “réglementaire” et d’un vaisseau spatial qui ressemble à un vaisseau spatial.\r\n\r\nLa création de personnage est transparente et collaborative, et nécessite une participation active. Elle sera facilitée par Karma, un réseau social utilisé en jeu.\r\n\r\nVFC ARTEMIS se déroule les 14-15 juillet 2018 (session N°1) et 28-29 juillet 2018 (session N°2) dans une usine désaffectée en région parisienne. Le confort y sera spartiate : toilettes sèches, pas d’eau courante, lits de camp, etc.\r\n\r\nLes débutants en GN, en jeux vidéos et en airsoft sont les bienvenus ! Seul prérequis : visionner la pilote de la série BSG (2004). Hommes et femmes pourront occuper tous les rôles (comme dans la série).\r\n\r\nLa PAF est de 100 €.	https://experiencegn.jimdo.com/nos-créations/artemis/	10000	2018-07-28 21:08:25+02	2	11	11	EUR	medium	\N	\N	\N	\N	\N	\N
20	week-end-soirees-enquetes	Week end Soirées Enquêtes	Deux murder-parties, une dans l'univers de Kaamelott	30 places disponibles pour cette édition !\r\nVous jouerez deux murder-parties, une dans l'univers de Kaamelot , l'autre sur le thème de l'Inquisition Espagnole. Elles se dérouleront dans le cadre privilégié du Prieuré de Marcevol (66).\r\nL'hébergement en petites chambrées, les repas, les boissons non alcoolisées sont incluses. Des costumes sont disponibles au prêt en nombre limité.\r\nHoraires de début des parties Samedi 14h et samedi 21h\r\nRéservé aux personnes majeures\r\nLe règlement sera à effectuer impérativement avant le 1er Mars par chèque une fois votre inscription validée.\r\n\r\nPour vous inscrire, utilisez le formulaire :\r\nhttps://goo.gl/forms/H180J0B4cRfRUV742\r\n\r\nPrenez connaissance des jeux proposés AVANT de vous inscrire.\r\n\r\nla PAF est de 35€ pour le membres du Consulat d'Elleslande à jour de leur cotisation et de 40€ pour les non-membres.\r\nVous pouvez vous organiser pour le covoiturage sur ce fil.\r\n\r\nUn descriptif des parties vous est proposé ici\r\nhttps://docs.google.com/document/d/1yRr9clfUWUQmv6o7ftJYWvXfN5hvNmKHeGKKqy5_YwI/edit?usp=sharing\r\net ici\r\nhttps://docs.google.com/document/d/1tUv-VLyQeAws8BnCQET0VfSa-frqCs7mJFh0a9NEmMo/edit?usp=sharing\r\n\r\nQuestions Fréquemment Posées\r\n\r\nQ:Je peux venir jouer et vous laisser mes enfants en garderie sur place?\r\nR:Non, vous ne pouvez pas.\r\n\r\nQ: Comment je fais pour m'inscrire avec mes copains Truc et Muche?\r\nR: vous indiquez dans votre demande d'inscription que vous voulez jouer avec Truc et Muche. On fera notre possible pour regrouper les inscrits qui le désirent.\r\n\r\nQ: Je peux venir costumé?\r\nR: Oui, c'est même recommandé. Nous vous communiquerons vos rôles assez en avance pour vous permettre de vous organiser.\r\n\r\nQ: Je n'ai que des costumes d'écolières Japonaises, vous m'en prêtez un plus adéquat?\r\nR: Nous en avons quelques uns,espérons juste qu'ils soient à la bonne taille !	https://www.facebook.com/events/2443578445867662/	4000	2018-03-18 00:12:51+01	3	19	17	EUR	short	\N	\N	\N	\N	\N	\N
114	ultime-western-2018	Ultime Western 2018	L'édition 2018 de l'Ultime Western c'est l'occasion pour nous de feter les 10 ans de cette incroyable aventure dans un site unique: les studios de Fort Bravo en Espagne.	Le 10th Anniversary ULTIME WESTERN ! L'édition se déroulera en 1878 - les inscriptions seront ouvertes en septembre 2017, les dates définitives seront alors précisées ! Préparez-vous, ça va envoyer du grand !	https://www.ultimewestern.com/	19000	2018-10-15 19:02:42+02	3	98	96	EUR	long	https://www.facebook.com/events/139389113286289/	\N	\N	\N	\N	\N
81	where-androids-die	Where Androids Die	International Larp (in English): a futuristic dystopian Larp about humanity, its creation and the consequences they have to face (inspiration: blade runner)	Freedom\r\nHow does it feel?\r\nOnce they were slaves, but they tasted freedom\r\nAnd freedom, once tasted, cannot be forgotten. It has to be extinguished\r\n\r\nStep into a world where humanity created Androids to be their tools, do their bidding, do their work and be satisfied with it. To be their willing slaves. The Androids were made more and more human - until the difference wasn't possible to distinguish.\r\n\r\nNo one quite knows what sparked that first rebellion, but as the latest Androids became aware of their own condition, they resisted, they rebelled: they fled.\r\n\r\nThen, humanity reacted. Their brave new world was built on the backs of Androids and could not be retained without them. This is the story about that reaction. It is a story about privilege, about repression and the systematic killing of their scapegoats, their rebellious children; their Androids.\r\n\r\n\r\nWhere Androids Die is the final and independent installment of the Androids larp trilogy, created by the Atropos team. It is inspired in theme by Blade Runner and a future envisioned in the 80s, surrounded by an atmosphere of rainy streets and obscure noodle bars.	http://whereandroidsdie.net/	16300	2018-07-13 15:31:01+02	3	75	69	EUR	medium	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: backent_api_eventlike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_api_eventlike (id, event_id, user_id) FROM stdin;
1	18	1
3	4	1
5	7	3
6	29	3
7	44	3
8	17	5
9	16	5
11	78	8
12	17	8
13	25	8
14	18	5
18	60	5
20	80	5
23	93	14
\.


--
-- Data for Name: backent_api_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_api_location (id, slug, name, address, coords) FROM stdin;
1	chateau-rouge	Chateau Rouge	23 rue Cambon	0101000020E6100000F004C1E53C6C0540CBA9D3CBAA334840
17	fort-lecluse-parc-naturel-regional-du-haut-jura	Fort L'Ecluse, Parc naturel régional du Haut-Jura	Route de Genève, Longeray, Léaz	0101000020E6100000044AA6F903E31240E278B67086714740
14	lund-sweden	Lund, Sweden	Glimmervägen 5, 224 78 Lund	0101000020E61000002F94D750DE192D40E1A03AEC4AD04E40
18	chateau-du-logis	Château du Logis	1 Rue de Vauvert, Saint-Bohaire	0101000020E61000008FFEFFFFFF1FECBF014F36A375944740
19	prieure-de-marcevol	Prieuré de Marcevol	Hameau Marcevol	0101000020E610000008000000DEF11140904A71811F964540
21	ivoy-le-pre	Ivoy-le-Pré	18 Route d'Achères, 18510 Menetou-Salon	0101000020E61000000800000000E80740FD7CB843CE8C4740
22	fort-de-montbre	Fort de Montbré	Taissy	0101000020E610000001000000005613405DD9484D47674840
23	non-precisee	Non précisée	Non précisée	0101000020E61000000800000000200C407D3ADAB10B384740
24	manoir-de-portejoie	Manoir de Portejoie	10 Route de Port Pinche	0101000020E61000000300000000AAF9BFECE942B024854740
26	centre-eedf-du-domaine-de-la-planche	Centre EEDF du Domaine de la Planche	Viscomtat	0101000020E6100000FEFFFFFFFFAF13407211A5C6BDA34740
7	chateau-de-serrant	Château de Serrant	Saint-Georges-sur-Loire	0101000020E6100000C8FFFFFFFFDFE0BF094F36A375944740
28	hobro-denmark	Hobro, Denmark	Amerikavej 5	0101000020E6100000FBFFFF9FFF443B40ECADF16437364F40
29	pas-de-calais	Pas-de-Calais	Pas-de-Calais	0101000020E6100000F8FFFFFFFF4FF93F79AF45BE2BCE4840
30	buzet-sur-baise	Buzet-sur-Baïse	Buzet-sur-Baïse	0101000020E6100000FEFFFFFFFFAF0340D5DD5F3F4ACA4540
31	maison-de-quartier-francisco-ferrer	Maison de Quartier Francisco Ferrer	40 Rue Montaigne	0101000020E6100000B04FB69A06AC03C02C00C8A32FF94740
32	lheure-du-jeu	L'Heure du Jeu	11 Boulevard Magenta	0101000020E6100000FAFFFFFFFF8203C0D892A5476AE24740
33	lurbovagen-sweden	Lurbovägen, Sweden	SE-755 91 Uppsala	0101000020E61000000000000000B03340C0EF16F259495040
34	czocha-castle-poland	Czocha Castle, Poland	Sucha, 59-820 Leśna	0101000020E6100000FEFFFFFFFFE7374029E8045E74E54840
35	warsaw-poland	Warsaw, Poland	Obiekt Alfa, Kozielska 4,	0101000020E6100000FEFFFFFFFFE43A40410263C689144A40
9	d96	D96	En définition	0101000020E6100000FCFFFFFFFF030A40A492D1C0B5FE4740
8	dans-le-bas-rhin	Dans le Bas-Rhin	En définition	0101000020E61000001DC04328CA9413406F5E53C3FE0F4740
20	dans-le-67	Dans le 67	En définition	0101000020E6100000F4FFFFFFFF9B1840252780C1819C4740
37	chevalerie-de-sace-site-archeologique-jardin-botanique	Chevalerie de Sacé - Site Archéologique & Jardin Botanique	1 rue du vieux logis	0101000020E6100000FDFFFFFFFF871D40E398029F5F094740
39	chalet-des-sources	Chalet des Sources	Dans la vallée de Munster	0101000020E6100000F9FFFFFFFFE71740B5AD5F1720424840
40	phare-de-lill	Phare de l'Ill,	29 Rue du Général Libermann	0101000020E6100000EEFFFFFFE92E144080F61A10F5724840
41	domaine-du-denais	Domaine du Denais	Lieu-dit Denais	0101000020E6100000FDFFFFFFFF6314408D5C4546AB3A4840
42	paris	Paris	Paris	0101000020E6100000FEFFFFFFFFAF0340B5AD5F1720424840
43	elba-island-italy	Elba Island, Italy	Tuscany	0101000020E610000000000000002C3040607E2899504A4440
44	chartreuse-de-port-sainte-marie	Chartreuse de Port-Sainte-Marie	Chapdes-Beaufort	0101000020E61000000B000000006404402F153AE45D8F4640
45	lamnay	Lamnay	Lamnay	0101000020E6100000E8FFFFFFFF7FE63FEEE942B024854740
46	xaronval	Xaronval	Xaronval	0101000020E61000000000000000CC1540BD811D9A6B0F4840
47	herstmonceux-castle	Herstmonceux Castle	Herstmonceux BN27 1RN	0101000020E6100000F8FFFFFFFF4FF9BF4D18EBABDDF84940
49	berlin-germany	Berlin, Germany	Berlin	0101000020E610000000000000002C20401218C912C21C4840
50	czech-republic	Czech Republic	Czech Republic	0101000020E61000000000000000233940FA8B204EC00D4840
51	domaine-le-stat	Domaine le Stat	Le Tholy	0101000020E61000000900000000A212409AEDDC6371584840
52	lisle-adam	L'Isle-Adam	Val-d'Oise	0101000020E61000000600000000180540EE1EEA0793BF4840
53	lillkyrka-sweden	Lillkyrka, Sweden	Naturliv B&B Hotel	0101000020E6100000FEFFFFFFFFBD244050F825938E124F40
54	mfr-chateau-de-jolibert	MFR Chateau de Jolibert	Jolibert	0101000020E6100000C8FFFFFFFFDFE03F4DF777FC350B4640
55	vysocina-czech-republic	Vysočina, Czech Republic	Zámek Úsobí, Úsobí 1	0101000020E6100000FDFFFFFFFF4128400C8B6B97F1B04840
56	la-taniere	La Tanière	261 Ribeaugoutte	0101000020E61000000300000000E8174023E3DF69A2EF4740
57	chateau-saint-sixte	Château Saint Sixte	Rue du château	0101000020E610000055DE161E5FCA1240BC9A04AB82EC4740
58	former-category-c-prison	Former Category C Prison	H.M.P Ashwell, Unit 9, Oakham Enterprise Park, Oakham Rutland	0101000020E6100000080000000020EC3FA17D08BECB3D4A40
59	granada-spain	Granada, Spain	Cuevas Al Jatib, Arroyo Curcal, S/N	0101000020E6100000DAFFFFFFE7A20AC0DC2D904FB7664440
60	new-york-city	New York City	Manhattan, NYC	0101000020E6100000FEFFFFFFFF5553C099CBDA1151B84240
61	fort-de-saint-pere-saint-pere	Fort De Saint Pere Saint-Père	Saint Père Marc En Poulet	0101000020E6100000FEFFFFFFFFAFF3BF465A584886E04740
62	fort-rapp	Fort Rapp	Rue du Fort	0101000020E6100000FFFFFFFF3FFE1B403C561655EB444840
63	aino-voipion-tie-30-finland	Aino Voipion tie 30, Finland	Länsi-suomen Opistoyhdistys Ry	0101000020E6100000F8FFFFFFFF1F2C407CDBF5FC54365040
64	domaine-des-hellandes	Domaine des Hellandes	Les Hellandes	0101000020E6100000F0FFFFFFFF9B08407C36B47414764840
65	israel	Israel	Israel	0101000020E6100000FEFFFFFFFF7442408C107A89983A3D40
66	dampierre-en-yvelines	Dampierre-en-Yvelines	78720	0101000020E6100000E8FFFFFFFF7FD63F7B36B47414764840
67	mt-holyoke-college-usa	Mt. Holyoke College, USA	50 College St, South Hadley	0101000020E6100000FFFFFFFFBF6358C05CF4602639114340
68	fort-de-vezelois	Fort de Vézelois	Fort Ordener, Rue de Meroux	0101000020E6100000A04B96EC54141D402BA25BCACD304840
69	337-le-chateau	337 Le Château	Poliénas	0101000020E6100000F6FFFFFFFFB71A4050F777FC350B4640
70	chateau-de-lutzelbourg	Château de Lutzelbourg	31 Rue du Canal	0101000020E6100000FBFFFFFFFFEF0E401D447B8294934840
71	gite-de-bois-gerard-bois-gerard	Gîte de Bois Gérard Bois Gérard	Chessy-les-Prés	0101000020E610000067222A9440A71540C056FE509A4D4840
5	les-terres-de-saint-hilaire	Les Terres de Saint-Hilaire	RD3	0101000020E61000000080D32880115AC000004811176554C0
6	le-moulin-de-lavaure	Le Moulin de Lavaure	rue Mauzens-Miremont	0101000020E61000000000C6D041A347C00000721E5B655540
3	estaminet-le-chti-pot-ney	Estaminet Le Ch'ti Pot Ney	39 rue Ney	0101000020E610000000004F0D435847400000E7AE6C575440
4	asnieres-sur-seine	Asnières-sur-Seine	En définition	0101000020E61000000056D28A6F480240C93CF20703754840
72	ferme-de-combe-tabeillon	Ferme de Combe Tabeillon	2855 Glovelier	0101000020E61000000100000000041A408F97A4DD49304740
73	escapegame-lizio-bretagne	Escapegame lizio Bretagne	Lieu-dit Le Val Jouin	0101000020E61000000300000000E8F7BF2D78EF551EED4740
74	rdvig-stevns-denmark	Rødvig Stevns, Denmark	Boesdalsvej 14	0101000020E6100000FCFFFFFFFF3B1E403EBC53EBD71D4940
75	goteborg-sweden	Göteborg, Sweden	3:e Våningen, Sockerbruket 9	0101000020E6100000FF3B84A2D20D3040CF1590D581B84D40
76	fourons-belgium	Fourons, Belgium	Castel Notre-Dame, Obsinnich 6	0101000020E6100000F9FFFFFFFFE11D40A8950BC0777D4840
77	gite-de-gros-bois-gite-douroux	Gîte de Gros-Bois (Gîte d'Ouroux)	Ouroux	0101000020E6100000F3FFFFFFFF17154027E8550C19AB4640
78	gosport-united-kingdom	Gosport, United Kingdom	The 1908 Lodge, 7–11 Elmhurst Road	0101000020E6100000E8FFFFFFFF7FF6BF9F7D08BECB3D4A40
79	fort-de-jouy-sous-les-cotes	Fort de Jouy-sous-les-côtes	Parc Naturel Régional de Lorraine	0101000020E61000000100000000E01040F01EEA0793BF4840
80	doullens	Doullens	en Picardie	0101000020E61000000E0000000080F63F5BD9484D47674840
81	fort-du-cognelot-fort-vercingetorix	Fort du Cognelot (Fort Vercingetorix)	Chalindrey	0101000020E6100000FFFFFFFFFFB71A407211A5C6BDA34740
82	echologia	Echologia	Bas Barbé, Louverné	0101000020E61000000800000000200C40C5F9081816EA4640
83	village-commando-bainville-sur-madon	Village Commando Bainville sur Madon	Les Vaines Terres,	0101000020E6100000FCFFFFFFFF1715407C36B47414764840
84	domaine-de-la-roche-florens	Domaine de la Roche-Florens	Terrasson-Lavilledieu	0101000020E6100000080000000020EC3F50F777FC350B4640
85	flen-sweden	Flen, Sweden	Follökna Mansion	0101000020E61000000100000000A232409C79F32889145040
86	mfr-de-saint-barthelemy	MFR de Saint-Barthélémy	70 route de Marcollin	0101000020E610000001000000006414404C6283118A3B4640
87	fort-dans-laisne	Fort dans l'Aisne	Fort dans l'Aisne	0101000020E6100000F8FFFFFFFFD906405DCC08C99A044940
88	ry-denmark	Ry, Denmark	Rye Kol	0101000020E61000000000000000CC254076AF45BE2BCE4840
89	dolnoslaskie-poland	Dolnośląskie, Poland	Kopaniec	0101000020E6100000F4FFFFFFFF472240B5AD5F1720424840
90	chateau-du-bourg	Château du Bourg	8 Rue du Maine, Saint-Denis-de-Gastines	0101000020E6100000E8FFFFFFFF7FE63F7B36B47414764840
91	chateau-de-marcou	Château de Marcou	Montregard	0101000020E61000000300000000E81740EEAB0AC6D1EA4540
92	energie-paintball	Energie Paintball	lieu-dit Grande Vienne	0101000020E61000007E0000000080C6BF9AEDDC6371584840
93	lieu-dit-keruscar	Lieu-dit Keruscar	Lannéanou	0101000020E6100000F9FFFF3F5AFA0FC0329BBE8390254840
94	les-mines-du-roi-nain	Les Mines du Roi Nain	rue du cimetière, Laigneville	0101000020E6100000FEFFFFFFFFAF0340834F4F0243EB4840
95	site-de-bel-air-village-vacances-et-nature	Site de Bel Air (Village Vacances et Nature)	Saint-Charles-la-Forêt	0101000020E61000001300000000E0F0BF1418C912C21C4840
96	madrid-spain	Madrid, Spain	Hotel Elegance Getafe, Av. Ada Lovelace, 23, 28906 Getafe	0101000020E6100000F2FFFFFFFBE60CC020211B9DD9104440
97	zamkowa-mazowiecka-poland	Zamkowa Mazowiecka, Poland	Zamek Książąt Mazowieckich	0101000020E6100000FEFFFFFFFF253640F21EEA0793BF4840
11	saint-ouen-laumone	Saint-Ouen l'Aumône	en cours	0101000020E6100000000CD41F9C0C60400000B8C8AD3A4240
13	rue-du-haut-fourneau	Rue du Haut Fourneau	Rue du Haut Fourneau	0101000020E61000000060AD799B2866C00000F69B5D3B4F40
12	cafe-de-la-poeterie	Cafe De La Poèterie	4 Route des Janets	0101000020E610000000C0B2F5EAAC5C4000008ED9F9894340
98	tabernas-spain	Tabernas, Spain	National Highway 340ª, kilometer 468 Unihay place of the S / N 04200	0101000020E61000000000392FBE5C654000000052DA343DC0
99	helsingr-denmark	Helsingør, Denmark	Kronborg Castle (Elsinor), Kronborg 2C	0101000020E6100000008047F1DCF349C00000A8DCCD873D40
100	maison-familiale-de-villevallier	Maison Familiale de Villevallier	25 Rue Verdeau	0101000020E61000000000392FBE5C65C0000070379F7A3140
101	moszna-castle-poland	Moszna Castle, Poland	Zamkowa 1	0101000020E61000000000C23753B060C0000086CBCEE65040
102	chateauneuf-sur-isere	Châteauneuf sur Isère	Châteauneuf sur Isère	0101000020E61000000000CCDC15C449400000CFD1BA7B50C0
103	la-chartreuse-de-port-sainte-marie	La Chartreuse de Port Sainte-Marie	Chapdes-Beaufort	\N
\.


--
-- Data for Name: backent_api_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_api_organization (id, slug, name) FROM stdin;
2	fedegn	FédéGN
3	rujha-gn	Rujha GN
4	jeux-des-racines	Jeux Dés Racines
5	cent-balles-et-un-mars	Cent balles et un mars
6	les-legendes-de-zaelwair	Les Légendes de Zaelwaïr
7	les-forgemondes	Les ForgeMondes
8	les-compagnons-de-louest	Les Compagnons de l'Ouest
9	drakerys-gn	Drakerys GN
10	bounty-hunters-legion	Bounty Hunters Legion
11	experience	eXpérience
12	fumble-corp	Fumble Corp
13	lajvverkstaden	LajvVerkstaden
14	knutpunkt	Knutpunkt
15	ascalone-gn	Ascalone GN
16	escampette	Escampette
17	le-consulat-delleslande	Le Consulat d’Elleslande
19	berry-champ-de-bataille-bcb	Berry Champ de Bataille (BCB)
20	chroniques-chimeres	Chroniques & Chimères
21	les-amis-de-miss-rachel	Les Amis de Miss Rachel
22	les-ombres-du-trone	Les Ombres du Trône
24	nouvelle-contree	Nouvelle Contrée
25	time-freeze	Time Freeze
26	fastaval	Fastaval
27	lutetia-lacrymae	Lutetia Lacrymae
28	silo-o	SILO O
29	fedegn-guilde-de-bretagne	FédéGN & Guilde de Bretagne
30	lheure-du-gn	L'Heure du GN
31	berattelseframjandet	Berättelsefrämjandet
32	dziobak-larp-studios	Dziobak Larp Studios
33	spacequest	SpaceQuest
34	aquilon	Aquilon
35	as-morgenstern	As Morgenstern
36	lantre-du-temps	L'Antre du Temps
37	les-tisseurs-detoiles-les-promesses-de-laube	Les Tisseurs d'Etoiles & Les Promesses de l'Aube
38	toxic-gn	TOXIC GN
39	les-reves-de-licorne	Les Rêves De Licorne
40	terre-spezzate	Terre Spezzate
41	groupe-dimagination-de-grandeur-nature-gign	Groupe d'Imagination de Grandeur Nature (GIGN)
42	role	Rôle
43	les-ptits-croustillants	Les p'tits croustillants
44	rogue-events	Rogue Events
45	booster-space	Booster Space
46	rolling-cz	Rolling CZ
47	rajr	RAJR
48	bretteurs-sur-gages	Bretteurs sur Gages
49	atropos	Atropos
50	association-mimbulus-mimbletonia	Association Mimbulus Mimbletonia
51	les-tisseurs-detoiles	Les Tisseurs d'Etoiles
52	la-plume-dacier	La Plume d'Acier
53	gweriniaeth-pobl-cymru	Gweriniaeth Pobl Cymru
54	somnia	Somnia
55	les-joueurs-de-la-forge	Les Joueurs de la Forge
56	sinking-ship-creations	Sinking Ship Creations
57	gnome-prod-camp-du-dragon	Gnome Prod & Camp du Dragon
58	pohjoismaisen-roolipelaamisen-seura-ry	Pohjoismaisen roolipelaamisen seura ry
59	les-masques-de-pandore	Les Masques de Pandore
60	aspamia	Aspamia
61	les-crocs-de-la-taniere	Les Crocs de la Tanière
62	learnlarp	LearnLarp
63	alliance-prod	Alliance-prod
64	la-compagnie-dro-lig	La Compagnie Dro Lig
65	grenouille-noire	Grenouille Noire
66	sculpteurs-de-reves	Sculpteurs de Rêves
67	a-venture	A-Venture
68	sunfall	Sunfall
69	independant	Indépendant
70	npo-out-of-this-world	NPO Out of this World
71	on-location	On Location
72	les-porteurs-de-legendes	Les Porteurs de Légendes
73	alter-ego-marcheurs-sur-reves-kracknloot	Alter Ego & Marcheurs sur Rêves & Krack'n'Loot
75	les-chevaliers-du-roi-pecheur	Les Chevaliers du Roi Pêcheur
77	eve-oniris	Eve Oniris
78	arcan-les-demons-divoire	Arcan - Les Démons d'Ivoire
79	collectif-prisme	Collectif Prisme
80	fantasticus	Fantasticus
81	sec	Sec
82	neverland	Neverland
84	estocade-gn	Estocade GN
85	le-repaire-des-griffons	Le Repaire des Griffons
86	brudpris	Brudpris
87	avalon-larp-studio-dziobak-larp-studios	Avalon Larp Studio & Dziobak Larp Studios
88	mondes-paralleles	Mondes Parallèles
89	pour-quelques-gn-de-plus	Pour quelques GN de plus
90	nor-gehenne	NOR-Gehenne
91	an-termaji	An Termaji
92	qba	QBA
93	epic-gn	EPIC GN
95	not-only-larp	Not Only Larp
96	don-quichotte	Don Quichotte
97	participation-design-agency	Participation Design Agency
1	cocolarp	CoCoLarp
\.


--
-- Data for Name: backent_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, avatar, location_id) FROM stdin;
4	pbkdf2_sha256$36000$b3dcmZ793fFS$47C2V4nUPI3TOFEZ5eDoP57wy04rEBnq88qVlnGdyQc=	\N	f	Gyr			larp.michael@gmail.com	f	t	2018-02-12 08:34:48.308421+01		\N
3	pbkdf2_sha256$100000$iqDNUNPugpdr$wCLyvXswTIPEzphmNFHLEG73HPyRz7Cnv39p3RAn14o=	\N	f	choucroute			jeanne.vaguelsy@gmail.com	f	t	2018-02-11 23:35:00.287258+01		\N
5	pbkdf2_sha256$100000$CzH23mrVZVqD$ItM+ebI2thoujT5E8zyEDroHtyZ+QPlHm/0A0Z1TjAY=	\N	f	Michael			michael@cocolarp.com	f	t	2018-02-26 12:14:55.156995+01		\N
6	pbkdf2_sha256$100000$yH4mAPANTqVi$QbHeK7bclBoIPlMY+fJAlKr69QlAbQNhpr236sd3ckU=	\N	f	CoCoLarp			michael@cocolarp.com	f	t	2018-02-26 12:15:14.709132+01		\N
7	pbkdf2_sha256$100000$UMhyPYlIOQq6$SwcuDrjDxpbHFZUoFJNeuev1qB8TlAadsZPiPc3lAjY=	\N	f	Spiritu			gaelchanet@hotmail.com	f	t	2018-02-26 13:56:32.427937+01		\N
8	pbkdf2_sha256$100000$cLNa7gaoqR4P$HGrBa8Qq8L3/a0HepA+oOnAz0ki3gzn1x4w0d+jIxro=	\N	f	Racater			Raphael.Dunant+Cocolarp@protonmail.ch	f	t	2018-02-28 17:07:08.202282+01		\N
10	pbkdf2_sha256$100000$xd5GekKOHK2d$HqC7DUDscliCgTyVSJZqv/1z0420siKKWrWo49zo50E=	\N	f	davidthorhauge			cocolarp@thorhauge.de	f	t	2018-03-16 09:03:21.726497+01		\N
11	pbkdf2_sha256$100000$S28pLzoninpR$8PqjMH1Xm69eDExYF51YndIW0Jw4QjM3H9O2zcmMBVo=	\N	f	Guakamole2			guakamole2@gmail.com	f	t	2018-03-29 22:07:59.518044+02		\N
2	pbkdf2_sha256$100000$HspqEk8wiRR1$17JSEgi1sOG/5bL82lU1tu2LsB5eLATb7bw3m/PXeG0=	2018-04-07 11:51:11.740907+02	f	test-backend				t	t	2018-01-15 23:50:03+01		\N
12	pbkdf2_sha256$100000$c1MFQ1gNlcLm$51STP+p9qq3Rcgnf4I7FuVhuoSVTopjPK/OlByrnJkQ=	\N	f	Vanessa			vanessa.chawan@gmail.com	f	t	2018-04-08 22:50:39.262363+02		\N
13	pbkdf2_sha256$100000$pDf02otpFKMF$IuTUihKJNa9vA7pDZY++2QQMCrfPANUmELXbNT0/+gc=	\N	f	CorbinVood			robin.caldairou@gmail.com	f	t	2018-04-16 12:53:37.255282+02		\N
14	pbkdf2_sha256$100000$AN5Y7oMX21In$0Ls2T68R+CaEXW0gIlvZAFfEpbrA2w1Jrsx5OQyHZB8=	\N	f	tiphaine			t.duchene@outlook.fr	f	t	2018-05-09 22:02:10.882781+02		\N
15	pbkdf2_sha256$100000$DlaFzjnWVQdz$+0hqM3dKZsL5pyCdUpNee4ImCIuVt81rsMB3nk52bL4=	\N	f	farvyn			florentmorin@hotmail.fr	f	t	2018-05-15 13:04:31.478321+02		\N
1	pbkdf2_sha256$100000$3oOZk751nIJ8$etrtNmLDUveDDwbWEFco8Jj1SJReglTaG7EXsS5pO9s=	2018-05-26 18:59:01.930151+02	t	victor				t	t	2017-08-30 22:33:00+02	0rhL6ZE.png	\N
\.


--
-- Data for Name: backent_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: backent_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backent_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	4
2	2	5
3	2	6
4	2	7
5	2	8
6	2	9
7	2	10
8	2	11
9	2	12
10	2	13
11	2	14
12	2	15
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-01-15 23:50:03.344957+01	2	test-backend	1	[{"added": {}}]	1	1
2	2018-01-15 23:50:28.703782+01	2	test-backend	2	[{"changed": {"fields": ["is_staff"]}}]	1	1
3	2018-01-16 18:26:11.744971+01	2	FédéGN	1	[{"added": {}}]	5	2
4	2018-01-16 18:27:20.557373+01	3	39 rue Ney, 69006, FR	1	[{"added": {}}]	4	2
5	2018-01-16 18:29:39.61334+01	4	Apéro GNistes lyonnais de la Nouvelle Année	1	[{"added": {}}]	2	2
6	2018-01-16 18:31:14.529322+01	3	Rujha GN	1	[{"added": {}}]	5	2
7	2018-01-16 18:32:22.473296+01	4	1 rue du cul, 92600, FR	1	[{"added": {}}]	4	2
8	2018-01-16 18:35:04.201242+01	5	GN Frida Kahlo "Lo que el agua me dio" Session 2	1	[{"added": {}}]	2	2
9	2018-01-16 18:38:57.168615+01	4	Jeux Dés Racines	1	[{"added": {}}]	5	2
10	2018-01-16 18:41:50.214471+01	5	RD3, 83470, FR	1	[{"added": {}}]	4	2
11	2018-01-16 18:47:55.310437+01	6	Le Fer et la Foi	1	[{"added": {}}]	2	2
12	2018-01-16 18:49:32.785039+01	5	Cent balles et un mars	1	[{"added": {}}]	5	2
13	2018-01-16 18:54:42.214025+01	6	rue Mauzens-Miremont, 24260, FR	1	[{"added": {}}]	4	2
14	2018-01-16 18:54:50.003633+01	7	Sanguinem Terrae : Noblesse Oblige	1	[{"added": {}}]	2	2
15	2018-01-16 18:57:31.859458+01	6	Les Légendes de Zaelwaïr	1	[{"added": {}}]	5	2
16	2018-01-16 19:00:00.241767+01	7	1 rue du cul, 49170, FR	1	[{"added": {}}]	4	2
17	2018-01-16 19:01:23.483125+01	8	Dans les hautes plaines d'Oril, la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer. Il est temps pour vous de marquer votre histoire sur une pierre qui s'a	1	[{"added": {}}]	2	2
18	2018-01-16 19:01:56.952323+01	7	Les ForgeMondes	1	[{"added": {}}]	5	2
19	2018-01-16 19:04:37.313217+01	8	1 rue du cul, 67000, FR	1	[{"added": {}}]	4	2
20	2018-01-16 19:05:57.816051+01	9	L'horreur vient du Nord	1	[{"added": {}}]	2	2
21	2018-01-16 19:07:34.040944+01	8	Les Compagnons de l'Ouest	1	[{"added": {}}]	5	2
22	2018-01-16 19:10:10.310849+01	9	1 rue du Cul, 77166, FR	1	[{"added": {}}]	4	2
23	2018-01-16 19:10:16.868759+01	10	Dead Zone Reloaded	1	[{"added": {}}]	2	2
24	2018-01-16 19:11:15.594096+01	9	Drakerys GN	1	[{"added": {}}]	5	2
25	2018-01-16 19:12:57.994439+01	10	Château de Marcoux, 43290, FR	1	[{"added": {}}]	4	2
26	2018-01-16 19:13:20.257155+01	11	Inter-Drakerys Irosia : Succession Impériale	1	[{"added": {}}]	2	2
27	2018-01-16 19:54:23.579689+01	11	Inter-Drakerys Irosia : Succession Impériale	2	[{"changed": {"fields": ["price"]}}]	2	2
28	2018-01-16 19:55:41.061685+01	10	Dead Zone Reloaded	2	[{"changed": {"fields": ["price"]}}]	2	2
29	2018-01-16 19:55:48.834294+01	9	L'horreur vient du Nord	2	[{"changed": {"fields": ["price"]}}]	2	2
30	2018-01-16 19:55:59.116731+01	7	Sanguinem Terrae : Noblesse Oblige	2	[{"changed": {"fields": ["price"]}}]	2	2
31	2018-01-16 19:56:03.401951+01	8	Dans les hautes plaines d'Oril, la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer. Il est temps pour vous de marquer votre histoire sur une pierre qui s'a	2	[{"changed": {"fields": ["price"]}}]	2	2
32	2018-01-16 19:56:14.089118+01	6	Le Fer et la Foi	2	[{"changed": {"fields": ["price"]}}]	2	2
33	2018-01-16 19:56:19.629707+01	5	GN Frida Kahlo "Lo que el agua me dio" Session 2	2	[{"changed": {"fields": ["price"]}}]	2	2
34	2018-01-16 19:56:30.374057+01	3	Blablablablablablablabalabalalalalalaaa1234567891234	2	[{"changed": {"fields": ["price"]}}]	2	2
35	2018-01-16 19:56:35.466057+01	2	Another Larp With a Very Long Name	2	[{"changed": {"fields": ["price"]}}]	2	2
36	2018-01-16 19:59:18.965208+01	11	Inter-Drakerys Irosia : Succession Impériale	2	[{"changed": {"fields": ["price"]}}]	2	2
37	2018-01-16 20:00:39.567046+01	10	Dead Zone Reloaded	2	[{"changed": {"fields": ["price"]}}]	2	2
38	2018-01-16 20:00:45.144206+01	9	L'horreur vient du Nord	2	[{"changed": {"fields": ["price"]}}]	2	2
39	2018-01-16 20:00:50.09188+01	8	Dans les hautes plaines d'Oril, la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer. Il est temps pour vous de marquer votre histoire sur une pierre qui s'a	2	[{"changed": {"fields": ["price"]}}]	2	2
40	2018-01-16 20:00:55.286299+01	7	Sanguinem Terrae : Noblesse Oblige	2	[{"changed": {"fields": ["price"]}}]	2	2
41	2018-01-16 20:01:02.330769+01	6	Le Fer et la Foi	2	[{"changed": {"fields": ["price"]}}]	2	2
42	2018-01-16 20:01:07.925794+01	5	GN Frida Kahlo "Lo que el agua me dio" Session 2	2	[{"changed": {"fields": ["price"]}}]	2	2
43	2018-01-16 20:01:16.020581+01	3	Blablablablablablablabalabalalalalalaaa1234567891234	2	[{"changed": {"fields": ["price"]}}]	2	2
44	2018-01-16 20:01:20.810048+01	2	Another Larp With a Very Long Name	2	[{"changed": {"fields": ["price"]}}]	2	2
45	2018-01-16 20:03:01.367352+01	10	Bounty Hunters Legion	1	[{"added": {}}]	5	2
46	2018-01-16 20:04:23.089548+01	11	en cours, 95572, FR	1	[{"added": {}}]	4	2
47	2018-01-16 20:05:32.931746+01	12	4 Route des Janets, 89520, FR	1	[{"added": {}}]	4	2
48	2018-01-16 20:07:03.82917+01	12	Vampire Beyond Heresy & Law Opus 3	1	[{"added": {}}]	2	2
49	2018-01-16 20:07:39.164+01	11	eXpérience	1	[{"added": {}}]	5	2
50	2018-01-16 20:09:21.489027+01	13	VFC ARTEMIS Session 2	1	[{"added": {}}]	2	2
51	2018-01-16 20:11:06.677115+01	14	VFC ARTEMIS Session 1	1	[{"added": {}}]	2	2
52	2018-01-16 20:11:54.026333+01	12	Fumble Corp	1	[{"added": {}}]	5	2
53	2018-01-16 20:13:57.754391+01	13	Rue du Haut Fourneau, 67130, FR	1	[{"added": {}}]	4	2
54	2018-01-16 20:14:34.789235+01	15	Abri 403, un GN post-nuklear	1	[{"added": {}}]	2	2
55	2018-02-11 23:44:52.64043+01	13	LajvVerkstaden	1	[{"added": {}}]	5	2
56	2018-02-11 23:47:53.62132+01	14	Nordenskilöldsgatan 24, Malmö, 0000, SE	1	[{"added": {}}]	4	2
57	2018-02-11 23:50:35.952685+01	16	Edu-larp conference	1	[{"added": {}}]	2	2
58	2018-02-11 23:51:10.445536+01	14	Knutpunkt	1	[{"added": {}}]	5	2
59	2018-02-11 23:56:24.211082+01	17	Knutpunkt 2018: Shuffle the deck	1	[{"added": {}}]	2	2
60	2018-02-11 23:57:01.492216+01	15	Ascalone GN	1	[{"added": {}}]	5	2
61	2018-02-12 00:01:22.986273+01	17	Route de Genève, Longeray, Léaz, 01200, FR	1	[{"added": {}}]	4	2
62	2018-02-12 00:01:30.639509+01	18	GN Warhammer 2018	1	[{"added": {}}]	2	2
63	2018-02-12 00:01:58.023854+01	14	Nordenskilöldsgatan 24, Malmö, 0000, SE	2	[{"changed": {"fields": ["name"]}}]	4	2
64	2018-02-12 00:02:37.934485+01	3	Blablablablablablablabalabalalalalalaaa1234567891234	3		2	2
65	2018-02-12 00:02:56.571872+01	1	Some Metalarp	3		2	2
66	2018-02-12 00:04:58.020427+01	14	Glimmervägen 5, 224 78 Lund, 0000, SE	2	[{"changed": {"fields": ["name", "address"]}}]	4	2
67	2018-02-12 00:05:03.359187+01	17	Knutpunkt 2018: Shuffle the deck	2	[]	2	2
68	2018-02-12 00:06:17.004952+01	16	Escampette	1	[{"added": {}}]	5	2
69	2018-02-12 00:09:19.889886+01	18	1 Rue de Vauvert, Saint-Bohaire, 41330, FR	1	[{"added": {}}]	4	2
70	2018-02-12 00:09:25.242982+01	19	Murder party - XIXème	1	[{"added": {}}]	2	2
71	2018-02-12 00:10:03.452304+01	17	Le Consulat d’Elleslande	1	[{"added": {}}]	5	2
72	2018-02-12 00:12:45.260151+01	19	Hameau Marcevol, 66320 Arboussols, FR	1	[{"added": {}}]	4	2
73	2018-02-12 00:12:51.072746+01	20	Week end Soirées Enquêtes	1	[{"added": {}}]	2	2
74	2018-02-12 00:16:03.22474+01	20	pas d'info, 67000, FR	1	[{"added": {}}]	4	2
75	2018-02-12 00:16:14.348404+01	21	Ainsi sonne le Glas	1	[{"added": {}}]	2	2
76	2018-02-12 00:19:08.340603+01	21	Ainsi sonne le Glas	2	[]	2	2
77	2018-02-12 00:59:49.666003+01	21	Ainsi sonne le Glas	2	[{"changed": {"fields": ["start"]}}]	2	2
78	2018-02-12 01:00:15.431688+01	16	Edu-larp conference	2	[{"changed": {"fields": ["start"]}}]	2	2
79	2018-02-12 01:00:35.936398+01	19	Murder party - XIXème	2	[{"changed": {"fields": ["end"]}}]	2	2
80	2018-02-12 01:01:18.059826+01	21	Ainsi sonne le Glas	2	[]	2	2
81	2018-02-12 01:03:30.939468+01	19	Berry Champ de Bataille (BCB)	1	[{"added": {}}]	5	2
82	2018-02-12 01:05:48.299657+01	21	Ivoy-le-Pré, 18380, FR	1	[{"added": {}}]	4	2
83	2018-02-12 01:06:35.962248+01	21	18 Route d'Achères, 18510 Menetou-Salon, 18380, FR	2	[{"changed": {"fields": ["address"]}}]	4	2
84	2018-02-12 01:06:41.100609+01	22	Canal Historique	1	[{"added": {}}]	2	2
85	2018-02-12 01:07:06.602211+01	20	Chroniques & Chimères	1	[{"added": {}}]	5	2
86	2018-02-12 01:09:35.063871+01	22	Taissy, 51500, FR	1	[{"added": {}}]	4	2
87	2018-02-12 01:10:05.073312+01	23	Chroniques Transylvaniennes : Les Rameaux	1	[{"added": {}}]	2	2
88	2018-02-12 01:10:36.618165+01	21	Les Amis de Miss Rachel	1	[{"added": {}}]	5	2
89	2018-02-12 01:13:14.85811+01	23	Non précisée, 0000, FR	1	[{"added": {}}]	4	2
90	2018-02-12 01:13:20.426732+01	24	Princesse et Couronnes- Russie 1810	1	[{"added": {}}]	2	2
91	2018-02-12 01:14:42.501104+01	22	Les Ombres du Trône	1	[{"added": {}}]	5	2
92	2018-02-12 01:16:38.288338+01	24	10 Route de Port Pinche, 27430 Porte-Joie, FR	1	[{"added": {}}]	4	2
93	2018-02-12 01:17:37.711524+01	2	Another Larp With a Very Long Name	3		2	2
94	2018-02-12 01:19:26.135416+01	8	Les Légendes de Zaelwaïr 2018 "Les derniers Traldars"	2	[{"changed": {"fields": ["name", "created_by"]}}]	2	2
95	2018-02-12 01:24:04.72281+01	25	Un Jeu Parmi les Ombres 13 - Le Sel de la Terre	1	[{"added": {}}]	2	2
96	2018-02-12 01:25:04.178706+01	24	10 Route de Port Pinche, 27430 Porte-Joie, FR	2	[{"changed": {"fields": ["coords"]}}]	4	2
97	2018-02-12 01:31:43.180368+01	24	Nouvelle Contrée	1	[{"added": {}}]	5	2
98	2018-02-12 01:34:07.127051+01	26	Viscomtat, 63250, FR	1	[{"added": {}}]	4	2
99	2018-02-12 01:34:11.730767+01	26	Projet -Z-	1	[{"added": {}}]	2	2
100	2018-02-12 01:34:46.73718+01	25	Time Freeze	1	[{"added": {}}]	5	2
101	2018-02-12 01:39:04.313346+01	27	Les Chroniques de Mortras : Rébellion	1	[{"added": {}}]	2	2
102	2018-02-12 01:39:51.938005+01	7	1 rue du cul, 49170, FR	2	[{"changed": {"fields": ["coords"]}}]	4	2
103	2018-02-12 01:40:23.05185+01	7	Saint-Georges-sur-Loire, 49170, FR	2	[{"changed": {"fields": ["address"]}}]	4	2
104	2018-02-12 01:40:46.561039+01	2	8 shakalllakah Boom Selectah AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA, 31320, AL	3		4	2
105	2018-02-12 01:41:46.998801+01	26	Fastaval	1	[{"added": {}}]	5	2
106	2018-02-12 01:43:58.838092+01	28	Amerikavej 5, 9500, DK	1	[{"added": {}}]	4	2
107	2018-02-12 01:44:40.823305+01	28	Fastaval 2018 - Otto i Eventyrland	1	[{"added": {}}]	2	2
108	2018-02-12 01:45:07.521968+01	27	Lutetia Lacrymae	1	[{"added": {}}]	5	2
109	2018-02-12 01:47:34.236056+01	29	Pas-de-Calais, 6200, FR	1	[{"added": {}}]	4	2
110	2018-02-12 01:48:08.914703+01	29	Dreamcatcher - Le GN Paradoxal - Chapitre 1	1	[{"added": {}}]	2	2
111	2018-02-12 01:50:02.122619+01	29	Dreamcatcher - Le GN Paradoxal - Chapitre 1	2	[{"changed": {"fields": ["description"]}}]	2	2
112	2018-02-12 01:50:33.32779+01	28	SILO O	1	[{"added": {}}]	5	2
113	2018-02-12 01:51:24.250551+01	30	Buzet-sur-Baïse, 47160, FR	1	[{"added": {}}]	4	2
114	2018-02-12 01:51:56.385431+01	30	GN Silo 0	1	[{"added": {}}]	2	2
115	2018-02-12 01:52:27.403126+01	29	FédéGN & Guilde de Bretagne	1	[{"added": {}}]	5	2
116	2018-02-12 01:54:38.68795+01	31	40 Rue Montaigne, 35200, FR	1	[{"added": {}}]	4	2
117	2018-02-12 01:54:43.026717+01	31	Nuit du Huis Clos Rennes	1	[{"added": {}}]	2	2
118	2018-02-12 01:55:45.412963+01	31	Nuit du Huis Clos Rennes	2	[{"changed": {"fields": ["end"]}}]	2	2
119	2018-02-12 02:02:25.910531+01	27	Les Chroniques de Mortras : Rébellion	2	[]	2	2
120	2018-02-13 22:21:42.569322+01	30	L'Heure du GN	1	[{"added": {}}]	5	2
121	2018-02-13 22:24:46.785216+01	32	11 Boulevard Magenta, 35000 Rennes, FR	1	[{"added": {}}]	4	2
122	2018-02-13 22:25:17.127368+01	32	L'Heure du GN	1	[{"added": {}}]	2	2
123	2018-02-13 22:25:52.01448+01	31	Berättelsefrämjandet	1	[{"added": {}}]	5	2
124	2018-02-13 22:29:10.12586+01	33	SE-755 91 Uppsala, 0000, SE	1	[{"added": {}}]	4	2
125	2018-02-13 22:29:56.8451+01	33	Lotka-Volterra: An international scifi larp	1	[{"added": {}}]	2	2
126	2018-02-13 22:34:27.863699+01	32	Dziobak Larp Studios	1	[{"added": {}}]	5	2
127	2018-02-13 22:40:10.365695+01	34	Sucha, 59-820 Leśna, Sucha, PL	1	[{"added": {}}]	4	2
128	2018-02-13 22:40:16.472195+01	34	College of Wizardry 16	1	[{"added": {}}]	2	2
129	2018-02-14 01:16:21.324738+01	33	SpaceQuest	1	[{"added": {}}]	5	2
130	2018-02-14 01:19:07.047577+01	35	Obiekt Alfa, Kozielska 4,, 01-163, PL	1	[{"added": {}}]	4	2
131	2018-02-14 01:20:34.839965+01	35	Final Voyage International Session 2	1	[{"added": {}}]	2	2
132	2018-02-14 01:21:08.568716+01	34	Aquilon	1	[{"added": {}}]	5	2
133	2018-02-14 01:24:27.627904+01	36	Dominion	1	[{"added": {}}]	2	2
134	2018-02-14 01:26:02.416317+01	9	En définition, 77166, FR	2	[{"changed": {"fields": ["address", "coords"]}}]	4	2
135	2018-02-14 01:26:51.65522+01	8	En définition, 67000, FR	2	[{"changed": {"fields": ["address", "coords"]}}]	4	2
136	2018-02-14 01:27:36.792463+01	4	En définition, 92600, FR	2	[{"changed": {"fields": ["name", "address", "coords"]}}]	4	2
137	2018-02-14 01:28:25.794166+01	20	En définition, 67000, FR	2	[{"changed": {"fields": ["address"]}}]	4	2
138	2018-02-14 01:28:27.353639+01	20	En définition, 67000, FR	2	[]	4	2
139	2018-02-14 01:29:17.709988+01	35	As Morgenstern	1	[{"added": {}}]	5	2
140	2018-02-14 01:31:36.46078+01	37	1 rue du vieux logis, 49650, FR	1	[{"added": {}}]	4	2
141	2018-02-14 01:32:25.068866+01	37	Grandeur Nature - Survie Apocalyptique Fantastique	1	[{"added": {}}]	2	2
142	2018-02-14 01:40:29.948014+01	38	College of Wizardry 17	1	[{"added": {}}]	2	2
143	2018-02-14 01:41:12.63704+01	36	L'Antre du Temps	1	[{"added": {}}]	5	2
144	2018-02-14 01:44:45.951322+01	39	Chalet des Sources (Dans la vallée de Munster, 6800, FR)	1	[{"added": {}}]	4	2
145	2018-02-14 01:50:05.31653+01	39	Murder LZ127 Le Graf Zeppelin	1	[{"added": {}}]	2	2
146	2018-02-14 01:50:37.157651+01	37	Les Tisseurs d'Etoiles & Les Promesses de l'Aube	1	[{"added": {}}]	5	2
147	2018-02-14 01:53:07.827194+01	40	Phare de l'Ill, (29 Rue du Général Libermann, 67400 Illkirch-Graffenstaden, FR)	1	[{"added": {}}]	4	2
148	2018-02-14 01:54:23.483532+01	40	Nuit Bleue	1	[{"added": {}}]	2	2
149	2018-02-14 01:55:13.304243+01	38	TOXIC GN	1	[{"added": {}}]	5	2
150	2018-02-14 01:57:31.515457+01	41	Domaine du Denais (Lieu-dit Denais, 53290 Saint-Denis-d'Anjou, FR)	1	[{"added": {}}]	4	2
151	2018-02-14 01:57:36.02979+01	41	GN Vietnam " la rizière sans retour"	1	[{"added": {}}]	2	2
152	2018-02-14 01:58:38.839365+01	39	Les Rêves De Licorne	1	[{"added": {}}]	5	2
153	2018-02-14 02:04:29.832205+01	42	Paris (Paris, 75000, FR)	1	[{"added": {}}]	4	2
154	2018-02-14 02:04:35.055477+01	42	KATANA - Huis-Clos d'aventure science-fiction	1	[{"added": {}}]	2	2
155	2018-02-14 02:05:05.599314+01	40	Terre Spezzate	1	[{"added": {}}]	5	2
156	2018-02-14 02:08:00.979569+01	43	Elba Island, Italy (Tuscany, 000, IT)	1	[{"added": {}}]	4	2
157	2018-02-14 02:08:05.572034+01	43	Raven Crew - A pirate Tale	1	[{"added": {}}]	2	2
158	2018-02-14 02:11:06.69137+01	41	Groupe d'Imagination de Grandeur Nature (GIGN)	1	[{"added": {}}]	5	2
159	2018-02-14 02:14:03.198139+01	44	Chartreuse de Port-Sainte-Marie (Chapdes-Beaufort, 63230, FR)	1	[{"added": {}}]	4	2
160	2018-02-14 02:14:51.759346+01	44	GN Bloodball III	1	[{"added": {}}]	2	2
161	2018-02-14 02:20:49.773433+01	42	Rôle	1	[{"added": {}}]	5	2
162	2018-02-14 02:25:09.993209+01	45	Lamnay (Lamnay, 72320, FR)	1	[{"added": {}}]	4	2
163	2018-02-14 02:25:54.320415+01	45	Nous n'irons plus danser	1	[{"added": {}}]	2	2
164	2018-02-14 02:26:12.862694+01	43	Les p'tits croustillants	1	[{"added": {}}]	5	2
165	2018-02-14 02:29:16.607994+01	46	Xaronval (Xaronval, 88000, FR)	1	[{"added": {}}]	4	2
166	2018-02-14 02:29:20.745834+01	46	The Clock session 1	1	[{"added": {}}]	2	2
167	2018-02-14 02:34:22.032011+01	44	Rogue Events	1	[{"added": {}}]	5	2
168	2018-02-14 02:36:53.6851+01	47	Herstmonceux Castle (Herstmonceux BN27 1RN, 0000, GB)	1	[{"added": {}}]	4	2
169	2018-02-14 02:36:57.569969+01	48	Bothwell School of Witchcraft 2	1	[{"added": {}}]	2	2
170	2018-02-14 02:40:36.336403+01	49	GN : le Fer et la Foi	1	[{"added": {}}]	2	2
171	2018-02-14 02:41:25.898136+01	45	ar Booster Space	1	[{"added": {}}]	5	2
172	2018-02-14 02:43:24.819981+01	49	Berlin, Germany (Berlin, 0000, DE)	1	[{"added": {}}]	4	2
173	2018-02-14 02:44:18.934448+01	50	The Wall 2061 Citygame LARP	1	[{"added": {}}]	2	2
174	2018-02-14 02:45:00.067871+01	45	Booster Space	2	[{"changed": {"fields": ["name"]}}]	5	2
175	2018-02-14 02:47:14.558354+01	46	Rolling CZ	1	[{"added": {}}]	5	2
176	2018-02-14 02:51:18.292195+01	50	Czech Republic (Czech Republic, 0000, CZ)	1	[{"added": {}}]	4	2
177	2018-02-14 02:51:25.839474+01	51	Requiem: Reichskinder Session 1	1	[{"added": {}}]	2	2
178	2018-02-14 02:51:56.16335+01	47	RAJR	1	[{"added": {}}]	5	2
179	2018-02-14 02:53:45.57691+01	51	Domaine le Stat (Le Tholy, 88530, FR)	1	[{"added": {}}]	4	2
180	2018-02-14 02:55:03.698837+01	52	The last ones	1	[{"added": {}}]	2	2
181	2018-02-14 02:59:39.10914+01	52	L'Isle-Adam (Val-d'Oise, 95290, FR)	1	[{"added": {}}]	4	2
182	2018-02-14 03:00:24.291743+01	48	Bretteurs sur Gages	1	[{"added": {}}]	5	2
183	2018-02-14 03:00:50.716155+01	53	New Oz Session 8	1	[{"added": {}}]	2	2
184	2018-02-14 03:01:26.462365+01	49	Atropos	1	[{"added": {}}]	5	2
185	2018-02-14 03:03:37.51186+01	53	Lillkyrka, Sweden (Naturliv B&B Hotel, 705 98, SE)	1	[{"added": {}}]	4	2
186	2018-02-14 03:05:02.167674+01	54	Mr&Mrs – Unscripted	1	[{"added": {}}]	2	2
187	2018-02-14 03:05:28.154393+01	50	Association Mimbulus Mimbletonia	1	[{"added": {}}]	5	2
188	2018-02-14 03:08:20.022093+01	54	MFR Chateau de Jolibert (Jolibert, 47410 Bourgougnague, FR)	1	[{"added": {}}]	4	2
189	2018-02-14 03:08:24.772181+01	55	L'École des Mimbus	1	[{"added": {}}]	2	2
190	2018-02-14 03:10:59.547108+01	55	Vysočina, Czech Republic (Zámek Úsobí, Úsobí 1, 582 54 Úsobí, FR)	1	[{"added": {}}]	4	2
191	2018-02-14 03:11:43.434635+01	56	Harem Son Saat (« The last hours of the Harem ») run 5	1	[{"added": {}}]	2	2
192	2018-02-14 03:12:33.858249+01	51	Les Tisseurs d'Etoiles	1	[{"added": {}}]	5	2
193	2018-02-14 03:14:54.479747+01	56	La Tanière (261 Ribeaugoutte, 68650 Lapoutroie, FR)	1	[{"added": {}}]	4	2
194	2018-02-14 03:14:58.288202+01	57	Le Fuseau de Frigg	1	[{"added": {}}]	2	2
195	2018-02-14 03:15:26.338346+01	52	La Plume d'Acier	1	[{"added": {}}]	5	2
196	2018-02-14 03:18:11.339781+01	57	Château Saint Sixte (Rue du château, 57320 Freistroff Moselle, FR)	1	[{"added": {}}]	4	2
197	2018-02-14 03:18:15.131196+01	58	Les Terres de Soscath : Chapitre 2 - Le Divin Malsain	1	[{"added": {}}]	2	2
198	2018-02-14 03:20:29.605652+01	59	GN Enfants	1	[{"added": {}}]	2	2
199	2018-02-14 03:20:55.638452+01	53	Gweriniaeth Pobl Cymru	1	[{"added": {}}]	5	2
200	2018-02-14 03:22:55.881664+01	58	Former Category C Prison (H.M.P Ashwell, Unit 9, Oakham Enterprise Park, Oakham Rutland, LE15 7TU, GB)	1	[{"added": {}}]	4	2
201	2018-02-14 03:24:19.663701+01	60	The Quota	1	[{"added": {}}]	2	2
202	2018-02-14 03:24:55.320301+01	54	Somnia	1	[{"added": {}}]	5	2
203	2018-02-14 03:26:50.080627+01	59	Granada, Spain (Cuevas Al Jatib, Arroyo Curcal, S/N, 18800 Baza, ES)	1	[{"added": {}}]	4	2
204	2018-02-14 03:26:54.584532+01	61	Walpurgis	1	[{"added": {}}]	2	2
205	2018-02-14 03:29:14.386366+01	62	Nous n'irons plus danser - 2	1	[{"added": {}}]	2	2
206	2018-02-14 03:29:52.753175+01	55	Les Joueurs de la Forge	1	[{"added": {}}]	5	2
207	2018-02-14 03:32:34.356974+01	63	GN Run Human Run Instinct De Survie	1	[{"added": {}}]	2	2
208	2018-02-14 03:33:22.066239+01	56	Sinking Ship Creations	1	[{"added": {}}]	5	2
209	2018-02-14 03:35:26.062715+01	60	New York City (Manhattan, NYC, 0000, US)	1	[{"added": {}}]	4	2
210	2018-02-14 03:37:14.028176+01	64	Project Ascension	1	[{"added": {}}]	2	2
211	2018-02-14 03:37:40.281415+01	57	Gnome Prod & Camp du Dragon	1	[{"added": {}}]	5	2
212	2018-02-14 03:39:36.457335+01	61	Fort De Saint Pere Saint-Père (Saint Père Marc En Poulet, 35430, FR)	1	[{"added": {}}]	4	2
213	2018-02-14 03:39:46.631132+01	65	Retour aux Sources - GN	1	[{"added": {}}]	2	2
214	2018-02-14 03:42:35.337409+01	62	Fort Rapp (Rue du Fort, 67116 Reichstett, FR)	1	[{"added": {}}]	4	2
215	2018-02-14 03:43:33.842887+01	62	Fort Rapp (Rue du Fort, 67116 Reichstett, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	2
216	2018-02-14 03:44:38.158719+01	66	Thédas, le dernier Bastion	1	[{"added": {}}]	2	2
217	2018-02-14 03:45:09.484722+01	58	Pohjoismaisen roolipelaamisen seura ry	1	[{"added": {}}]	5	2
218	2018-02-14 03:47:07.996258+01	63	Aino Voipion tie 30, Finland (Länsi-suomen Opistoyhdistys Ry, 32700 Huittinen, FI)	1	[{"added": {}}]	4	2
219	2018-02-14 03:47:28.560292+01	67	Just a Little Lovin' Finland	1	[{"added": {}}]	2	2
220	2018-02-14 03:48:08.391395+01	59	Les Masques de Pandore	1	[{"added": {}}]	5	2
221	2018-02-14 03:50:32.353588+01	64	Domaine des Hellandes (Les Hellandes, 76280 Angerville-l'Orcher, FR)	1	[{"added": {}}]	4	2
222	2018-02-14 03:50:35.753115+01	68	GN USM 2 "Les feux de Beltane" - Session 1	1	[{"added": {}}]	2	2
223	2018-02-14 03:51:01.487143+01	60	Aspamia	1	[{"added": {}}]	5	2
224	2018-02-14 03:52:47.967372+01	65	Israel (Israel, 0000, IL)	1	[{"added": {}}]	4	2
225	2018-02-14 03:53:17.386192+01	69	Windrose: School of the Secret Arts	1	[{"added": {}}]	2	2
226	2018-02-14 03:54:58.041759+01	66	Dampierre-en-Yvelines (78720, 78720, FR)	1	[{"added": {}}]	4	2
227	2018-02-14 03:56:06.731393+01	70	Cabaret Cajun	1	[{"added": {}}]	2	2
228	2018-02-14 03:56:51.621544+01	61	Les Crocs de la Tanière	1	[{"added": {}}]	5	2
229	2018-02-14 03:59:23.675789+01	71	Dead Island 2 : Naufrage	1	[{"added": {}}]	2	2
230	2018-02-14 04:00:02.470353+01	62	LearnLarp	1	[{"added": {}}]	5	2
231	2018-02-14 04:03:15.862064+01	67	Mt. Holyoke College, USA (50 College St, South Hadley, MA 01075, US)	1	[{"added": {}}]	4	2
232	2018-02-14 04:03:20.374165+01	72	New World Magischola	1	[{"added": {}}]	2	2
233	2018-02-14 04:03:45.186476+01	63	Alliance-prod	1	[{"added": {}}]	5	2
234	2018-02-14 04:05:26.421281+01	68	Fort de Vézelois (Fort Ordener, Rue de Meroux, 90400 Vézelois, FR)	1	[{"added": {}}]	4	2
235	2018-02-14 04:05:38.741583+01	73	Chilipocras et d'autres machins	1	[{"added": {}}]	2	2
236	2018-02-14 04:06:06.766795+01	64	La Compagnie Dro Lig	1	[{"added": {}}]	5	2
237	2018-02-14 04:07:57.456344+01	74	Contes de la Brume 2018	1	[{"added": {}}]	2	2
238	2018-02-14 04:08:17.325322+01	65	Grenouille Noire	1	[{"added": {}}]	5	2
239	2018-02-14 04:10:14.462499+01	69	337 Le Château (Poliénas, 38210, FR)	1	[{"added": {}}]	4	2
240	2018-02-14 04:10:18.573471+01	75	MONDWEST	1	[{"added": {}}]	2	2
241	2018-02-14 04:13:06.801485+01	70	Château de Lutzelbourg (31 Rue du Canal, 57820 Lutzelbourg, FR)	1	[{"added": {}}]	4	2
242	2018-02-14 04:13:34.399672+01	76	Nakzar: Le Fléau du Nord	1	[{"added": {}}]	2	2
243	2018-02-14 14:11:47.6151+01	66	Sculpteurs de Rêves	1	[{"added": {}}]	5	2
244	2018-02-14 14:13:57.72968+01	71	Gîte de Bois Gérard Bois Gérard (Chessy-les-Prés, 10130, FR)	1	[{"added": {}}]	4	2
245	2018-02-14 14:14:01.555098+01	77	Eclypson | Odyssée	1	[{"added": {}}]	2	2
246	2018-02-14 14:14:52.131149+01	67	A-Venture	1	[{"added": {}}]	5	2
247	2018-02-14 14:18:11.7808+01	72	Ferme de Combe Tabeillon (2855 Glovelier, 0000, CH)	1	[{"added": {}}]	4	2
248	2018-02-14 14:18:19.965228+01	78	Camp Aventures	1	[{"added": {}}]	2	2
249	2018-02-14 14:24:36.103762+01	73	Escapegame lizio Bretagne (Lieu-dit Le Val Jouin, 56460, FR)	1	[{"added": {}}]	4	2
250	2018-02-14 14:24:57.975298+01	79	Les oubliés des fjords - Session découverte	1	[{"added": {}}]	2	2
251	2018-02-14 14:25:17.708821+01	68	Sunfall	1	[{"added": {}}]	5	2
252	2018-02-14 14:27:09.491251+01	74	Rødvig Stevns, Denmark (Boesdalsvej 14, 4673, DK)	1	[{"added": {}}]	4	2
253	2018-02-14 14:28:12.889832+01	80	Sunfall 2018	1	[{"added": {}}]	2	2
254	2018-02-14 14:29:40.949347+01	69	Indépendant	1	[{"added": {}}]	5	2
255	2018-02-14 14:30:57.734144+01	75	Göteborg, Sweden (3:e Våningen, Sockerbruket 9, 414 51, SE)	1	[{"added": {}}]	4	2
256	2018-02-14 14:31:01.795895+01	81	Where Androids Die	1	[{"added": {}}]	2	2
257	2018-02-14 14:31:21.960218+01	70	NPO Out of this World	1	[{"added": {}}]	5	2
258	2018-02-14 14:39:11.391172+01	76	Fourons, Belgium (Castel Notre-Dame, Obsinnich 6, 3791, BE)	1	[{"added": {}}]	4	2
259	2018-02-14 14:39:27.368374+01	82	Myrddin Emrys College	1	[{"added": {}}]	2	2
260	2018-02-14 14:43:05.832336+01	77	Gîte de Gros-Bois (Gîte d'Ouroux) (Ouroux, 69860, FR)	1	[{"added": {}}]	4	2
261	2018-02-14 14:43:34.985477+01	83	Mahoutokoro	1	[{"added": {}}]	2	2
262	2018-02-14 14:44:07.986921+01	71	On Location	1	[{"added": {}}]	5	2
263	2018-02-14 14:46:29.168013+01	78	Gosport, United Kingdom (The 1908 Lodge, 7–11 Elmhurst Road, PO12 1PG, GB)	1	[{"added": {}}]	4	2
264	2018-02-14 14:46:51.112598+01	84	On Location Session 2	1	[{"added": {}}]	2	2
265	2018-02-14 14:47:15.76141+01	72	Les Porteurs de Légendes	1	[{"added": {}}]	5	2
266	2018-02-14 14:49:16.095569+01	85	Les Légendes d'Assia : Crépuscule sur le Midland	1	[{"added": {}}]	2	2
267	2018-02-14 14:49:42.04128+01	73	Alter Ego & Marcheurs sur Rêves & Krack'n'Loot	1	[{"added": {}}]	5	2
268	2018-02-14 14:51:58.143044+01	79	Fort de Jouy-sous-les-côtes (Parc Naturel Régional de Lorraine, 55200 Geville, FR)	1	[{"added": {}}]	4	2
269	2018-02-14 14:52:03.984638+01	86	Eldorado : La Mystérieuse Cité Dort	1	[{"added": {}}]	2	2
270	2018-02-14 14:59:26.422446+01	80	Doullens (en Picardie, 80600, FR)	1	[{"added": {}}]	4	2
271	2018-02-14 14:59:30.131536+01	89	La plume et le serpent (ou la revanche de Tlahuizcalpantecuhtli)	1	[{"added": {}}]	2	2
272	2018-02-14 15:00:44.096507+01	75	Les Chevaliers du Roi Pêcheur	1	[{"added": {}}]	5	2
273	2018-02-14 15:03:03.250159+01	81	Fort du Cognelot (Fort Vercingetorix) (Chalindrey, 52600, FR)	1	[{"added": {}}]	4	2
274	2018-02-14 15:03:06.194196+01	90	L'épice doit couler à flot ou Touche pas au Grisbi!	1	[{"added": {}}]	2	2
275	2018-02-14 15:10:47.40429+01	77	Eve Oniris	1	[{"added": {}}]	5	2
276	2018-02-14 15:14:00.242115+01	82	Echologia (Bas Barbé, Louverné, 53950, FR)	1	[{"added": {}}]	4	2
277	2018-02-14 15:14:03.270126+01	92	Légende d'Hyborée 4	1	[{"added": {}}]	2	2
278	2018-02-14 15:14:26.42406+01	78	Arcan - Les Démons d'Ivoire	1	[{"added": {}}]	5	2
279	2018-02-14 15:17:08.311636+01	83	Village Commando Bainville sur Madon (Les Vaines Terres,, 54390 Bainville-Sur-Madon, FR)	1	[{"added": {}}]	4	2
280	2018-02-14 15:17:11.80178+01	93	Little Chicago : sexe, drogues et nuka cola - Session 2	1	[{"added": {}}]	2	2
281	2018-02-14 15:17:43.986576+01	79	Collectif Prisme	1	[{"added": {}}]	5	2
282	2018-02-14 15:19:46.521787+01	84	Domaine de la Roche-Florens (Terrasson-Lavilledieu, 24210, FR)	1	[{"added": {}}]	4	2
283	2018-02-14 15:19:50.945014+01	94	Prisme : La Fête de Dahma	1	[{"added": {}}]	2	2
284	2018-02-14 15:20:21.595845+01	80	Fantasticus	1	[{"added": {}}]	5	2
285	2018-02-14 16:18:52.292201+01	95	Terra Antiqua (Tome 2)	1	[{"added": {}}]	2	2
286	2018-02-14 16:23:16.516266+01	81	Sec	1	[{"added": {}}]	5	2
287	2018-02-14 16:25:04.766726+01	85	Flen, Sweden (Follökna Mansion, 0000, SE)	1	[{"added": {}}]	4	2
288	2018-02-14 16:25:54.455706+01	96	A nice evening with the family	1	[{"added": {}}]	2	2
289	2018-02-14 16:26:24.200801+01	82	Neverland	1	[{"added": {}}]	5	2
290	2018-02-14 16:29:24.876888+01	86	MFR de Saint-Barthélémy (70 route de Marcollin, 38270 Saint-Barthelemy, FR)	1	[{"added": {}}]	4	2
291	2018-02-14 16:29:31.588101+01	97	Mission Encelade	1	[{"added": {}}]	2	2
292	2018-02-14 16:30:36.040854+01	84	Estocade GN	1	[{"added": {}}]	5	2
293	2018-02-14 16:32:46.208219+01	87	Fort dans l'Aisne (Fort dans l'Aisne, Fort dans l'Aisne, FR)	1	[{"added": {}}]	4	2
294	2018-02-14 16:32:52.456543+01	98	Orléans, 1562	1	[{"added": {}}]	2	2
295	2018-02-14 16:36:25.377179+01	85	Le Repaire des Griffons	1	[{"added": {}}]	5	2
296	2018-02-14 16:38:19.654063+01	99	Les Griffons 2018 : Une nouvelle ère	1	[{"added": {}}]	2	2
297	2018-02-14 16:38:51.17708+01	86	Brudpris	1	[{"added": {}}]	5	2
298	2018-02-14 16:40:51.546982+01	88	Ry, Denmark (Rye Kol, 0000, DK)	1	[{"added": {}}]	4	2
299	2018-02-14 16:40:54.396306+01	100	A few years later	1	[{"added": {}}]	2	2
300	2018-02-14 16:48:03.391017+01	87	Avalon Larp Studio & Dziobak Larp Studios	1	[{"added": {}}]	5	2
301	2018-02-14 16:50:15.060552+01	89	Dolnośląskie, Poland (Kopaniec, 0000, PL)	1	[{"added": {}}]	4	2
302	2018-02-14 16:50:29.487346+01	101	College of Wizardry - Avalon	1	[{"added": {}}]	2	2
303	2018-02-14 16:51:12.061429+01	88	Mondes Parallèles	1	[{"added": {}}]	5	2
304	2018-02-14 16:53:33.098358+01	90	Château du Bourg (8 Rue du Maine, Saint-Denis-de-Gastines, 53500, FR)	1	[{"added": {}}]	4	2
305	2018-02-14 16:53:41.631025+01	102	Returning Home session 3	1	[{"added": {}}]	2	2
306	2018-02-14 16:58:01.115108+01	91	Château de Marcou (Montregard, 43290, FR)	1	[{"added": {}}]	4	2
307	2018-02-14 16:59:09.55456+01	10	Château de Marcoux (Château de Marcoux, 43290, FR)	3		4	2
308	2018-02-14 17:00:35.611517+01	89	Pour quelques GN de plus	1	[{"added": {}}]	5	2
309	2018-02-14 17:02:34.167244+01	104	GN Vampire Dark Ages	1	[{"added": {}}]	2	2
310	2018-02-14 17:03:07.040703+01	90	NOR-Gehenne	1	[{"added": {}}]	5	2
311	2018-02-14 17:05:14.767815+01	92	Energie Paintball (lieu-dit Grande Vienne, 61210 Putanges, FR)	1	[{"added": {}}]	4	2
312	2018-02-14 17:05:17.825785+01	105	ARN 1.0	1	[{"added": {}}]	2	2
313	2018-02-14 17:05:49.921352+01	91	An Termaji	1	[{"added": {}}]	5	2
314	2018-02-14 17:08:29.621046+01	93	Lieu-dit Keruscar (Lannéanou, 29640, FR)	1	[{"added": {}}]	4	2
315	2018-02-14 17:08:33.24752+01	106	De Cape et d'Ecailles	1	[{"added": {}}]	2	2
316	2018-02-14 17:10:22.253407+01	107	GN USM 2 "Les feux de Beltane" - Session 2	1	[{"added": {}}]	2	2
317	2018-02-14 17:13:27.542162+01	108	College of Wizardry 13: Halloween Midterms	1	[{"added": {}}]	2	2
318	2018-02-14 17:13:56.876384+01	92	QBA	1	[{"added": {}}]	5	2
319	2018-02-14 17:15:46.591437+01	94	Les Mines du Roi Nain (rue du cimetière, Laigneville, 60290, FR)	1	[{"added": {}}]	4	2
320	2018-02-14 17:16:00.369295+01	109	La Mémoire des Ombres	1	[{"added": {}}]	2	2
321	2018-02-14 17:17:15.407569+01	93	EPIC GN	1	[{"added": {}}]	5	2
322	2018-02-14 17:19:56.875087+01	95	Site de Bel Air (Village Vacances et Nature) (Saint-Charles-la-Forêt, 53170, FR)	1	[{"added": {}}]	4	2
323	2018-02-14 17:20:01.641384+01	110	Battle Yokai Games	1	[{"added": {}}]	2	2
324	2018-02-14 17:22:00.896417+01	111	The Clock session 2	1	[{"added": {}}]	2	2
325	2018-02-14 17:22:27.275275+01	94	No Middle Ground	1	[{"added": {}}]	5	2
326	2018-02-14 17:22:39.510905+01	95	Not Only Larp	1	[{"added": {}}]	5	2
327	2018-02-14 17:23:04.524141+01	94	No Middle Ground	3		5	2
328	2018-02-14 17:25:47.888842+01	96	Madrid, Spain (Hotel Elegance Getafe, Av. Ada Lovelace, 23, 28906 Getafe, 0000, ES)	1	[{"added": {}}]	4	2
329	2018-02-14 17:25:51.587713+01	112	No Middle Ground	1	[{"added": {}}]	2	2
330	2018-02-14 17:29:23.095543+01	97	Zamkowa Mazowiecka, Poland (Zamek Książąt Mazowieckich, 96-200 Rawa, PL)	1	[{"added": {}}]	4	2
331	2018-02-14 17:29:29.326209+01	113	Convention of Thorns Session 3	1	[{"added": {}}]	2	2
332	2018-02-14 17:45:58.866448+01	11	Saint-Ouen l'Aumône (en cours, 95572, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	1
333	2018-02-14 17:46:05.134859+01	13	Rue du Haut Fourneau (Rue du Haut Fourneau, 67130, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	2
334	2018-02-14 17:46:28.221134+01	13	Rue du Haut Fourneau (Rue du Haut Fourneau, 67130, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	1
335	2018-02-14 17:47:08.904158+01	5	Les Terres de Saint-Hilaire (RD3, 83470, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	1
336	2018-02-14 17:48:00.684311+01	6	Le Moulin de Lavaure (rue Mauzens-Miremont, 24260, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	1
337	2018-02-14 17:48:03.083652+01	12	Cafe De La Poèterie (4 Route des Janets, 89520, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	2
338	2018-02-14 17:48:43.488042+01	3	Estaminet Le Ch'ti Pot Ney (39 rue Ney, 69006, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	1
339	2018-02-14 18:00:30.372877+01	96	Don Quichotte	1	[{"added": {}}]	5	2
340	2018-02-14 18:02:37.535539+01	98	Tabernas, Spain (National Highway 340ª, kilometer 468 Unihay place of the S / N 04200, 0000, ES)	1	[{"added": {}}]	4	2
341	2018-02-14 18:02:42.562631+01	114	Ultime Western 2018	1	[{"added": {}}]	2	2
342	2018-02-14 18:03:01.30836+01	97	Participation Design Agency	1	[{"added": {}}]	5	2
343	2018-02-14 18:04:50.767334+01	99	Helsingør, Denmark (Kronborg Castle (Elsinor), Kronborg 2C, 3000, DK)	1	[{"added": {}}]	4	2
344	2018-02-14 18:04:56.322486+01	115	Inside Hamlet	1	[{"added": {}}]	2	2
345	2018-02-14 18:05:55.272922+01	100	Maison Familiale de Villevallier (25 Rue Verdeau, 89330, FR)	1	[{"added": {}}]	4	2
346	2018-02-14 18:07:11.628116+01	116	GN PROJET Thêta V4	1	[{"added": {}}]	2	2
347	2018-02-14 18:09:54.805259+01	101	Moszna Castle, Poland (Zamkowa 1, 47-370 Moszna, PL)	1	[{"added": {}}]	4	2
348	2018-02-14 18:09:59.547208+01	117	Fairweather Manor Session 5	1	[{"added": {}}]	2	2
349	2018-02-14 18:11:54.529964+01	118	L'armée des Ombres	1	[{"added": {}}]	2	2
350	2018-02-14 18:15:30.877307+01	119	College of Wizardry 18	1	[{"added": {}}]	2	2
351	2018-02-14 18:15:34.383684+01	120	College of Wizardry 19	1	[{"added": {}}]	2	2
352	2018-02-14 18:18:22.34505+01	102	Châteauneuf sur Isère (Châteauneuf sur Isère, 26300, FR)	1	[{"added": {}}]	4	2
353	2018-02-14 18:18:58.90617+01	121	Les Rencontres de la FédéGN	1	[{"added": {}}]	2	2
354	2018-02-25 01:03:34.884555+01	21	Ainsi sonne le Glas	2	[{"changed": {"fields": ["npc_price", "player_signup_page", "npc_signup_page"]}}]	2	2
355	2018-02-25 01:10:01.234765+01	21	Ainsi sonne le Glas	2	[{"changed": {"fields": ["external_url"]}}]	2	2
356	2018-03-12 23:39:05.280623+01	9	trucmuche	3		1	1
357	2018-04-01 16:31:47.037444+02	1	CoCoLarp	2	[{"changed": {"fields": ["name"]}}]	5	2
358	2018-04-01 16:34:02.645786+02	109	La Mémoire des Ombres	2	[]	2	2
359	2018-04-01 16:36:42.166743+02	109	La Mémoire des Ombres	2	[{"changed": {"fields": ["description", "facebook_event", "facebook_page"]}}]	2	2
360	2018-04-01 16:37:38.636599+02	109	La Mémoire des Ombres	2	[{"changed": {"fields": ["external_url", "facebook_event"]}}]	2	2
361	2018-04-01 16:38:27.967631+02	109	La Mémoire des Ombres	2	[{"changed": {"fields": ["description", "npc_price"]}}]	2	2
362	2018-04-01 16:46:14.650981+02	106	De Cape et d'Ecailles	2	[{"changed": {"fields": ["price", "npc_price"]}}]	2	2
363	2018-04-01 16:51:37.078333+02	48	Bothwell School of Witchcraft 2	2	[{"changed": {"fields": ["price"]}}]	2	2
364	2018-04-01 16:55:40.752173+02	74	Contes de la Brume 2018	3		2	2
365	2018-04-01 16:58:40.660857+02	100	A few years later	2	[{"changed": {"fields": ["external_url", "price"]}}]	2	2
366	2018-04-01 17:20:01.886347+02	107	GN USM 2 "Les feux de Beltane" - Session 2	2	[{"changed": {"fields": ["external_url", "price", "facebook_event"]}}]	2	2
367	2018-04-01 17:20:28.200108+02	68	GN USM 2 "Les feux de Beltane" - Session 1	2	[{"changed": {"fields": ["price", "player_signup_page"]}}]	2	2
368	2018-04-01 17:22:41.810586+02	67	Just a Little Lovin' Finland	2	[{"changed": {"fields": ["price", "facebook_page"]}}]	2	2
369	2018-04-01 17:25:13.128622+02	118	L'armée des Ombres	2	[{"changed": {"fields": ["external_url", "price", "npc_price", "player_signup_page", "npc_signup_page"]}}]	2	2
370	2018-04-01 17:30:13.249415+02	70	Cabaret Cajun	2	[{"changed": {"fields": ["external_url", "facebook_page", "player_signup_page"]}}]	2	2
371	2018-04-01 17:34:26.302485+02	73	Chilipocras et d'autres machins	2	[{"changed": {"fields": ["price", "player_signup_page"]}}]	2	2
372	2018-04-01 17:38:30.064121+02	75	MONDWEST	3		2	2
373	2018-04-01 17:38:54.126784+02	41	GN Vietnam " la rizière sans retour"	2	[{"changed": {"fields": ["external_url", "facebook_event"]}}]	2	2
374	2018-04-01 17:42:44.98887+02	37	Grandeur Nature - Survie Apocalyptique Fantastique	2	[{"changed": {"fields": ["price", "npc_price", "facebook_page", "player_signup_page", "npc_signup_page"]}}]	2	2
375	2018-04-01 17:45:07.863057+02	70	Cabaret Cajun	3		2	2
376	2018-04-01 17:52:43.200832+02	93	Little Chicago : sexe, drogues et nuka cola - Session 2	2	[{"changed": {"fields": ["price", "npc_price", "player_signup_page", "npc_signup_page"]}}]	2	2
377	2018-04-01 17:55:39.190715+02	33	Lotka-Volterra: An international scifi larp	2	[{"changed": {"fields": ["external_url", "price", "facebook_event"]}}]	2	2
378	2018-04-01 17:58:31.240805+02	40	Nuit Bleue	2	[{"changed": {"fields": ["description", "price", "player_signup_page"]}}]	2	2
379	2018-04-01 18:00:18.69854+02	114	Ultime Western 2018	2	[{"changed": {"fields": ["external_url", "price", "facebook_event"]}}]	2	2
380	2018-04-01 18:01:44.924925+02	61	Walpurgis	2	[{"changed": {"fields": ["external_url", "price", "facebook_event", "player_signup_page"]}}]	2	2
381	2018-04-01 18:07:11.029113+02	69	Windrose: School of the Secret Arts	2	[{"changed": {"fields": ["description", "external_url", "price", "facebook_event", "facebook_page", "facebook_group", "player_signup_page"]}}]	2	2
382	2018-04-01 18:08:40.366028+02	69	Windrose: School of the Secret Arts	3		2	2
383	2018-04-01 18:14:19.256965+02	103	La Chartreuse de Port Sainte-Marie (Chapdes-Beaufort, 63770 Les Ancizes-Comps, FR)	1	[{"added": {}}]	4	2
384	2018-04-01 18:16:25.112994+02	59	GN Bloodball III: Chaos ball !	2	[{"changed": {"fields": ["name", "location", "description", "external_url", "price", "npc_price", "event_format", "facebook_event", "player_signup_page", "npc_signup_page"]}}]	2	2
385	2018-04-01 18:18:35.404236+02	59	GN Bloodball III: Chaos ball !	2	[{"changed": {"fields": ["location"]}}]	2	2
386	2018-05-11 00:19:24.902349+02	4	Asnières-sur-Seine (En définition, 92600, FR)	2	[{"changed": {"fields": ["coords"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	backent	user
2	backent_api	event
3	backent_api	eventlike
4	backent_api	location
5	backent_api	organization
6	authtoken	token
7	admin	logentry
8	auth	permission
9	auth	group
10	contenttypes	contenttype
11	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-01-15 23:28:39.131407+01
2	contenttypes	0002_remove_content_type_name	2018-01-15 23:28:39.168495+01
3	auth	0001_initial	2018-01-15 23:28:39.37546+01
4	auth	0002_alter_permission_name_max_length	2018-01-15 23:28:39.463931+01
5	auth	0003_alter_user_email_max_length	2018-01-15 23:28:39.511917+01
6	auth	0004_alter_user_username_opts	2018-01-15 23:28:39.554548+01
7	auth	0005_alter_user_last_login_null	2018-01-15 23:28:39.611747+01
8	auth	0006_require_contenttypes_0002	2018-01-15 23:28:39.626139+01
9	auth	0007_alter_validators_add_error_messages	2018-01-15 23:28:39.717689+01
10	auth	0008_alter_user_username_max_length	2018-01-15 23:28:39.747838+01
11	backent	0001_initial	2018-01-15 23:28:39.847978+01
12	admin	0001_initial	2018-01-15 23:28:39.945687+01
13	admin	0002_logentry_remove_auto_add	2018-01-15 23:28:40.012345+01
14	authtoken	0001_initial	2018-01-15 23:28:40.22359+01
15	authtoken	0002_auto_20160226_1747	2018-01-15 23:28:40.584062+01
16	backent_api	0001_initial	2018-01-15 23:28:41.056254+01
17	backent	0002_user_location	2018-01-15 23:28:41.172374+01
18	backent_api	0002_auto_20180115_2205	2018-01-15 23:28:41.323477+01
19	sessions	0001_initial	2018-01-15 23:28:41.393333+01
20	auth	0009_alter_user_last_name_max_length	2018-02-14 18:01:03.786472+01
21	backent	0003_alter_user_lastname	2018-02-20 03:21:28.738342+01
22	backent_api	0003_add_npc_price_and_urls_and_move_currency	2018-02-20 03:21:30.239746+01
23	backent_api	0004_migrate_event_formats	2018-02-20 03:21:31.101093+01
24	backent_api	0005_remove_event_end	2018-02-20 03:21:31.192487+01
25	backent_api	0006_make_events_unique_on_name_and_start	2018-02-20 03:21:31.508929+01
26	backent_api	0007_auto_20180520_1224	2018-05-26 18:58:47.022536+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
izi3h27y0uhhpm4g0l6pxehlv2vhdso6	OTI2NGU1Njk3ZGUwYzdmNzQ4MWQyNzEzNTA5NzdmODMyMGNlNDdmMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZjUwNzczZTU2NmY0YWQxMDBjOTFmM2Y3MTJhMzIxZWFiNzEzOTIxIn0=	2018-01-29 23:50:43.17931+01
sr48fiywi2cf3vwoy9hofwxr9jsetc77	OTI2NGU1Njk3ZGUwYzdmNzQ4MWQyNzEzNTA5NzdmODMyMGNlNDdmMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZjUwNzczZTU2NmY0YWQxMDBjOTFmM2Y3MTJhMzIxZWFiNzEzOTIxIn0=	2018-01-30 18:23:03.387605+01
v3jpi18cisdok0jfthmftbp35zrzw1tq	OTI2NGU1Njk3ZGUwYzdmNzQ4MWQyNzEzNTA5NzdmODMyMGNlNDdmMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZjUwNzczZTU2NmY0YWQxMDBjOTFmM2Y3MTJhMzIxZWFiNzEzOTIxIn0=	2018-02-25 23:34:02.198594+01
x5l2f67j8do5ioydmc298tbpsuz39alm	OTI2NGU1Njk3ZGUwYzdmNzQ4MWQyNzEzNTA5NzdmODMyMGNlNDdmMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZjUwNzczZTU2NmY0YWQxMDBjOTFmM2Y3MTJhMzIxZWFiNzEzOTIxIn0=	2018-02-27 19:52:56.047445+01
pxcvb87ycm3cnk053ik5zynenxpcnxm6	NzljNTQ0ZmY2ZDZiNjFmNGNiZTA1OWYzMzQyMDM3ZTgwZTA5N2EwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTFjOGNiYjc0NjExZTliNGFlYjg3ZWM5Y2UwOGEwMmZkNmIwMzcyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-02-28 17:37:29.048582+01
6adrm032sliwvzqrg9qxegm9hzi8dlz6	MGNlYTQxMzc4YTg3OWMwNGRmMjgzNDMxZWJkZjIzN2QzYjFmY2U2YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmYwZWIxMjdlN2Y4ZTY1MzIzZTExNzFiNGI2MzU3ODI0MGZlMmFmZiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-02-28 17:44:31.274915+01
4vjy35lb9vtj5dgoe0lwdht1kiu2wrd9	N2QxY2U2YzVhNjIxZWY1Mzg3NjNjMDMyZWM5ZTg4NmIyMjFlZjcyNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiIyZjBlYjEyN2U3ZjhlNjUzMjNlMTE3MWI0YjYzNTc4MjQwZmUyYWZmIn0=	2018-03-11 21:29:11.790262+01
zbe9gyqin38miiims0ehpa0shspulhjn	NTA4YjAyMDA5MWM5YmI4ZGQ1MWU4Yjc0YjdkYmExNGEyMzM4ZTRiOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImExYzhjYmI3NDYxMWU5YjRhZWI4N2VjOWNlMDhhMDJmZDZiMDM3MjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-27 00:38:41.872717+02
2uci96tjijfxu37bvhpr5pbfe6gk85ma	ZmFjMjZlNGQ5ZjBhZmNjOTQ2MDBiNjY1NDgzMWZjMDkyZjVlMDg1MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJmMGViMTI3ZTdmOGU2NTMyM2UxMTcxYjRiNjM1NzgyNDBmZTJhZmYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-15 16:47:39.44794+02
3weffip444wihze9gkymvubgqocls1iw	NTA4YjAyMDA5MWM5YmI4ZGQ1MWU4Yjc0YjdkYmExNGEyMzM4ZTRiOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImExYzhjYmI3NDYxMWU5YjRhZWI4N2VjOWNlMDhhMDJmZDZiMDM3MjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-24 21:52:29.604845+02
v88ar2o6nt44qbffu0rteyt9lpo1omxi	MWJkNWEyNzQ3ZTYyM2Q3ODM1YTZiY2QyZWFkMTMyZWNkMzJjY2MzYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOWJiZTlhYjM0Njg4ZTFiZDFhYmIyMDE4MTI3MzJmNWRmNTEyMmFjIn0=	2018-06-09 18:59:01.943502+02
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 33, true);


--
-- Name: backent_api_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_api_event_id_seq', 121, true);


--
-- Name: backent_api_eventlike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_api_eventlike_id_seq', 23, true);


--
-- Name: backent_api_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_api_location_id_seq', 103, true);


--
-- Name: backent_api_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_api_organization_id_seq', 99, true);


--
-- Name: backent_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_user_groups_id_seq', 1, false);


--
-- Name: backent_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_user_id_seq', 15, true);


--
-- Name: backent_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backent_user_user_permissions_id_seq', 12, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 386, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: backent_api_event backent_api_event_name_start_5c57dde7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_name_start_5c57dde7_uniq UNIQUE (name, start);


--
-- Name: backent_api_event backent_api_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_pkey PRIMARY KEY (id);


--
-- Name: backent_api_eventlike backent_api_eventlike_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_eventlike
    ADD CONSTRAINT backent_api_eventlike_pkey PRIMARY KEY (id);


--
-- Name: backent_api_location backent_api_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_location
    ADD CONSTRAINT backent_api_location_pkey PRIMARY KEY (id);


--
-- Name: backent_api_location backent_api_location_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_location
    ADD CONSTRAINT backent_api_location_slug_key UNIQUE (slug);


--
-- Name: backent_api_organization backent_api_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_organization
    ADD CONSTRAINT backent_api_organization_pkey PRIMARY KEY (id);


--
-- Name: backent_api_organization backent_api_organization_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_organization
    ADD CONSTRAINT backent_api_organization_slug_key UNIQUE (slug);


--
-- Name: backent_user_groups backent_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_pkey PRIMARY KEY (id);


--
-- Name: backent_user_groups backent_user_groups_user_id_group_id_137ba0e8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_user_id_group_id_137ba0e8_uniq UNIQUE (user_id, group_id);


--
-- Name: backent_user backent_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user
    ADD CONSTRAINT backent_user_pkey PRIMARY KEY (id);


--
-- Name: backent_user_user_permissions backent_user_user_permis_user_id_permission_id_e9d2498f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_permis_user_id_permission_id_e9d2498f_uniq UNIQUE (user_id, permission_id);


--
-- Name: backent_user_user_permissions backent_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: backent_user backent_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user
    ADD CONSTRAINT backent_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: backent_api_event_created_by_id_0f1f6e76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_event_created_by_id_0f1f6e76 ON public.backent_api_event USING btree (created_by_id);


--
-- Name: backent_api_event_location_id_3fbf77b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_event_location_id_3fbf77b8 ON public.backent_api_event USING btree (location_id);


--
-- Name: backent_api_event_organization_id_20ec6097; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_event_organization_id_20ec6097 ON public.backent_api_event USING btree (organization_id);


--
-- Name: backent_api_event_slug_17b65a76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_event_slug_17b65a76 ON public.backent_api_event USING btree (slug);


--
-- Name: backent_api_event_slug_17b65a76_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_event_slug_17b65a76_like ON public.backent_api_event USING btree (slug varchar_pattern_ops);


--
-- Name: backent_api_eventlike_event_id_a8036793; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_eventlike_event_id_a8036793 ON public.backent_api_eventlike USING btree (event_id);


--
-- Name: backent_api_eventlike_user_id_551eb457; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_eventlike_user_id_551eb457 ON public.backent_api_eventlike USING btree (user_id);


--
-- Name: backent_api_location_coords_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_location_coords_id ON public.backent_api_location USING gist (coords);


--
-- Name: backent_api_location_slug_755a95fd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_location_slug_755a95fd_like ON public.backent_api_location USING btree (slug varchar_pattern_ops);


--
-- Name: backent_api_organization_slug_46967d16_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_api_organization_slug_46967d16_like ON public.backent_api_organization USING btree (slug varchar_pattern_ops);


--
-- Name: backent_user_groups_group_id_36c82f05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_user_groups_group_id_36c82f05 ON public.backent_user_groups USING btree (group_id);


--
-- Name: backent_user_groups_user_id_f137f205; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_user_groups_user_id_f137f205 ON public.backent_user_groups USING btree (user_id);


--
-- Name: backent_user_location_id_53ea96f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_user_location_id_53ea96f0 ON public.backent_user USING btree (location_id);


--
-- Name: backent_user_user_permissions_permission_id_d3abe49d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_user_user_permissions_permission_id_d3abe49d ON public.backent_user_user_permissions USING btree (permission_id);


--
-- Name: backent_user_user_permissions_user_id_8e14a728; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_user_user_permissions_user_id_8e14a728 ON public.backent_user_user_permissions USING btree (user_id);


--
-- Name: backent_user_username_b85097b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX backent_user_username_b85097b2_like ON public.backent_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_event backent_api_event_created_by_id_0f1f6e76_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_created_by_id_0f1f6e76_fk_backent_user_id FOREIGN KEY (created_by_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_event backent_api_event_location_id_3fbf77b8_fk_backent_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_location_id_3fbf77b8_fk_backent_a FOREIGN KEY (location_id) REFERENCES public.backent_api_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_event backent_api_event_organization_id_20ec6097_fk_backent_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_organization_id_20ec6097_fk_backent_a FOREIGN KEY (organization_id) REFERENCES public.backent_api_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_eventlike backent_api_eventlike_event_id_a8036793_fk_backent_api_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_eventlike
    ADD CONSTRAINT backent_api_eventlike_event_id_a8036793_fk_backent_api_event_id FOREIGN KEY (event_id) REFERENCES public.backent_api_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_eventlike backent_api_eventlike_user_id_551eb457_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_api_eventlike
    ADD CONSTRAINT backent_api_eventlike_user_id_551eb457_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_groups backent_user_groups_group_id_36c82f05_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_group_id_36c82f05_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_groups backent_user_groups_user_id_f137f205_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_user_id_f137f205_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user backent_user_location_id_53ea96f0_fk_backent_api_location_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user
    ADD CONSTRAINT backent_user_location_id_53ea96f0_fk_backent_api_location_id FOREIGN KEY (location_id) REFERENCES public.backent_api_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_user_permissions backent_user_user_pe_permission_id_d3abe49d_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_pe_permission_id_d3abe49d_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_user_permissions backent_user_user_pe_user_id_8e14a728_fk_backent_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_pe_user_id_8e14a728_fk_backent_u FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

