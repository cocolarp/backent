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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO victor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO victor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO victor;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO victor;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO victor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO victor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO victor;

--
-- Name: backent_api_event; Type: TABLE; Schema: public; Owner: victor
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


ALTER TABLE public.backent_api_event OWNER TO victor;

--
-- Name: backent_api_event_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_api_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_event_id_seq OWNER TO victor;

--
-- Name: backent_api_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_api_event_id_seq OWNED BY public.backent_api_event.id;


--
-- Name: backent_api_eventlike; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.backent_api_eventlike (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.backent_api_eventlike OWNER TO victor;

--
-- Name: backent_api_eventlike_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_api_eventlike_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_eventlike_id_seq OWNER TO victor;

--
-- Name: backent_api_eventlike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_api_eventlike_id_seq OWNED BY public.backent_api_eventlike.id;


--
-- Name: backent_api_location; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.backent_api_location (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(512) NOT NULL,
    coords public.geography(Point,4326)
);


ALTER TABLE public.backent_api_location OWNER TO victor;

--
-- Name: backent_api_location_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_api_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_location_id_seq OWNER TO victor;

--
-- Name: backent_api_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_api_location_id_seq OWNED BY public.backent_api_location.id;


--
-- Name: backent_api_organization; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.backent_api_organization (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.backent_api_organization OWNER TO victor;

--
-- Name: backent_api_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_api_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_api_organization_id_seq OWNER TO victor;

--
-- Name: backent_api_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_api_organization_id_seq OWNED BY public.backent_api_organization.id;


--
-- Name: backent_user; Type: TABLE; Schema: public; Owner: victor
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


ALTER TABLE public.backent_user OWNER TO victor;

--
-- Name: backent_user_groups; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.backent_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.backent_user_groups OWNER TO victor;

--
-- Name: backent_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_user_groups_id_seq OWNER TO victor;

--
-- Name: backent_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_user_groups_id_seq OWNED BY public.backent_user_groups.id;


--
-- Name: backent_user_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_user_id_seq OWNER TO victor;

--
-- Name: backent_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_user_id_seq OWNED BY public.backent_user.id;


--
-- Name: backent_user_user_permissions; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.backent_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.backent_user_user_permissions OWNER TO victor;

--
-- Name: backent_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.backent_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backent_user_user_permissions_id_seq OWNER TO victor;

--
-- Name: backent_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.backent_user_user_permissions_id_seq OWNED BY public.backent_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: victor
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


ALTER TABLE public.django_admin_log OWNER TO victor;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO victor;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO victor;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO victor;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO victor;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: victor
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO victor;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: victor
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: victor
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO victor;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: backent_api_event id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_event ALTER COLUMN id SET DEFAULT nextval('public.backent_api_event_id_seq'::regclass);


--
-- Name: backent_api_eventlike id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_eventlike ALTER COLUMN id SET DEFAULT nextval('public.backent_api_eventlike_id_seq'::regclass);


--
-- Name: backent_api_location id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_location ALTER COLUMN id SET DEFAULT nextval('public.backent_api_location_id_seq'::regclass);


--
-- Name: backent_api_organization id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_organization ALTER COLUMN id SET DEFAULT nextval('public.backent_api_organization_id_seq'::regclass);


--
-- Name: backent_user id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user ALTER COLUMN id SET DEFAULT nextval('public.backent_user_id_seq'::regclass);


--
-- Name: backent_user_groups id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_groups ALTER COLUMN id SET DEFAULT nextval('public.backent_user_groups_id_seq'::regclass);


--
-- Name: backent_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.backent_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: victor
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
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
ce9ea3875c2081cb3e43db2d52e56f5a4ce70d45	2018-06-02 14:19:56.110022+02	1
\.


--
-- Data for Name: backent_api_event; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_api_event (id, slug, name, summary, description, external_url, price, start, created_by_id, location_id, organization_id, currency, event_format, facebook_event, facebook_group, facebook_page, npc_price, npc_signup_page, player_signup_page) FROM stdin;
3236	braquage	Braquage	Un groupe d'ami.e.s, ce qui les rassemble, ce qui les écarte, leurs chemins de vie	Un groupe d'ami.e.s, ce qui les rassemble, ce qui les écarte, leurs chemins de vie	https://www.facebook.com/events/1829733197096694/	600	2018-05-01 02:00:00+02	1	1040	1318	EUR	hours	\N	\N	\N	\N	\N	\N
3237	braquage	Braquage	Un groupe d'ami.e.s, ce qui les rassemble, ce qui les écarte, leurs chemins de vie	Un groupe d'ami.e.s, ce qui les rassemble, ce qui les écarte, leurs chemins de vie	https://www.facebook.com/events/1829733197096694/	600	2018-05-09 02:00:00+02	1	1040	1318	EUR	hours	\N	\N	\N	\N	\N	\N
3238	dreyfus-lodieuse-verite	Dreyfus - L'Odieuse Vérité	Procès d'Emile Zola dans l'Affaire Dreyfus en 1898 - contexte historique antisémite	Procès d'Emile Zola dans l'Affaire Dreyfus en 1898 - contexte historique antisémite	https://www.facebook.com/events/107531520114820	1000	2018-05-12 02:00:00+02	1	827	1502	EUR	hours	\N	\N	\N	\N	\N	\N
3239	braquage	Braquage	Un groupe d'ami.e.s, ce qui les rassemble, ce qui les écarte, leurs chemins de vie	Un groupe d'ami.e.s, ce qui les rassemble, ce qui les écarte, leurs chemins de vie	https://www.facebook.com/events/1829733197096694/	600	2018-05-13 02:00:00+02	1	1040	1318	EUR	hours	\N	\N	\N	\N	\N	\N
3240	lalgue-verte	L'Algue Verte	Murder Party	Murder Party	https://www.facebook.com/events/1597750900323901/permalink/1611347975630860/	1100	2018-05-26 02:00:00+02	1	1040	1318	EUR	hours	\N	\N	\N	100	\N	\N
3241	hydre-omel-vautours	Hydre Omel - Vautours	Univers des Terres Levantines, inspiré par de nombreuses BD (https://www.hydre-omel.com/inspirations)	Univers des Terres Levantines, inspiré par de nombreuses BD (https://www.hydre-omel.com/inspirations)	https://www.hydre-omel.com/	12500	2018-06-01 02:00:00+02	1	1041	1446	EUR	medium	\N	\N	\N	3500	\N	\N
3242	thedas-le-dernier-bastion	Thédas, le dernier Bastion	Grandeur Nature médiéval-fantastique en Alsace sur le théme de Dragon Age.	Grandeur Nature médiéval-fantastique en Alsace sur le théme de Dragon Age.	http://gn-thedas.fr	5000	2018-06-01 02:00:00+02	1	916	1310	EUR	medium	\N	\N	\N	2500	\N	\N
3243	la-pension-saint-sauveur	La pension Saint Sauveur	La vie est calme à la pension Saint Sauveur, petite pension de famille située à proximité des falaises d'Etretat, jusqu'à cette soirée du 7 avril 1933	La vie est calme à la pension Saint Sauveur, petite pension de famille située à proximité des falaises d'Etretat, jusqu'à cette soirée du 7 avril 1933	https://www.facebook.com/groups/154116611402147/permalink/955485921265208/	2500	2018-06-02 02:00:00+02	1	1042	1501	EUR	short	\N	\N	\N	\N	\N	\N
3245	just-a-little-lovin-finland	Just a Little Lovin' Finland	International Larp (in English)	International Larp (in English)	http://www.jall.fi/	0	2018-06-05 02:00:00+02	1	1044	1440	EUR	long	\N	\N	\N	\N	\N	\N
3246	lheure-du-gn	L'Heure du GN	Rendez-vous amical GNiste à Rennes	Rendez-vous amical GNiste à Rennes	https://www.facebook.com/events/1617153478342369/	0	2018-06-07 02:00:00+02	1	850	1268	EUR	hours	\N	\N	\N	\N	\N	\N
3247	vampire-beyond-heresy-law-opus-3	Vampire Beyond Heresy & Law Opus 3	3e Opus de la campagne Vampire	3e Opus de la campagne Vampire	https://www.facebook.com/vampirebhl/	7000	2018-06-08 02:00:00+02	1	964	1165	EUR	medium	\N	\N	\N	\N	\N	\N
3248	fight-like-a-girl	FIGHT LIKE A GIRL	Fight Like A Girl is about identity, group dynamics and relationships, about difficult situations and impossible decisions. These elements tell people’s history of all times, here in a setting of war against oppression.	Fight Like A Girl is about identity, group dynamics and relationships, about difficult situations and impossible decisions. These elements tell people’s history of all times, here in a setting of war against oppression.	https://flaglarp.wordpress.com	8200	2018-06-08 02:00:00+02	1	1045	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3249	murder-cabale-acte-i	Murder Cabale - Acte I	Murder Cabale des Forges de Krom, 1er Acte d'une série de 4 Murder dans un univers contemporain bien mystérieux. 	Murder Cabale des Forges de Krom, 1er Acte d'une série de 4 Murder dans un univers contemporain bien mystérieux. 	https://www.facebook.com/events/434059070369615/	0	2018-06-09 02:00:00+02	1	838	1226	EUR	hours	\N	\N	\N	\N	\N	\N
3250	windrose-school-of-the-secret-arts	Windrose: School of the Secret Arts	International Larp (in English): Your chance to be a wizard or a witch in a magical college	International Larp (in English): Your chance to be a wizard or a witch in a magical college	https://www.facebook.com/AspamiaLarp/videos/884305888399438/	0	2018-06-14 02:00:00+02	1	1047	1457	EUR	long	\N	\N	\N	\N	\N	\N
3251	doleances-1789-session-5	Doléances 1789 session 5	Doléances (du latin dolere) : Souffrir. \n1789 : un peuple au bord d'une révolution	Doléances (du latin dolere) : Souffrir. \n1789 : un peuple au bord d'une révolution	https://www.facebook.com/doleances1789/posts/671997206307405	8600	2018-06-15 02:00:00+02	1	959	1140	EUR	medium	\N	\N	\N	\N	\N	\N
3252	cabaret-cajun	Cabaret Cajun	Dans la moiteur du vieux sud, alors que le dix-neuvième siècle touche à sa fin. [...] Relents de bayou, effluves vaudou, fragrances épicées et parfums étranges...	Dans la moiteur du vieux sud, alors que le dix-neuvième siècle touche à sa fin. [...] Relents de bayou, effluves vaudou, fragrances épicées et parfums étranges...	https://grou1.typeform.com/to/x3n2Rz	0	2018-06-15 02:00:00+02	1	1048	1388	EUR	medium	\N	\N	\N	\N	\N	\N
3253	gn-un-autre-monde	GN "Un autre monde"	Le GN où vous interprèterez des joueurs de JDR qui vont faire le tout premier GN de France... en 1981 !	Le GN où vous interprèterez des joueurs de JDR qui vont faire le tout premier GN de France... en 1981 !	https://www.facebook.com/events/194490371107783/	0	2018-06-15 02:00:00+02	1	1049	1276	EUR	medium	\N	\N	\N	\N	\N	\N
3254	les-forges-du-destin	Les Forges du Destin	GN médiéval fantastique	GN médiéval fantastique	https://www.facebook.com/notes/passion-gn-mjccarcassonne-club-grabuge/jeu-de-rôle-grandeur-nature-les-forges-du-destin/1929159700728455/	7500	2018-06-15 02:00:00+02	1	1031	1380	EUR	medium	\N	\N	\N	1500	\N	\N
3255	dead-island-2-naufrage	Dead Island 2 : Naufrage	L’endroit semblait pourtant désert… mais en attendant les secours, les survivants devront lutter contre un ennemi inattendu.	L’endroit semblait pourtant désert… mais en attendant les secours, les survivants devront lutter contre un ennemi inattendu.	https://www.facebook.com/events/1735361980105090/	3100	2018-06-16 02:00:00+02	1	881	1316	EUR	medium	\N	\N	\N	1500	\N	\N
3256	barnum-a-liberia-opus-2	Barnum à Liberia (Opus 2)	La petite île de Libéria se prépare doucement au moment le plus important de l’année : l’élection de son nouveau Gouverneur.	La petite île de Libéria se prépare doucement au moment le plus important de l’année : l’élection de son nouveau Gouverneur.	https://www.facebook.com/events/145738649567347/	5000	2018-06-16 02:00:00+02	1	1050	1493	EUR	short	\N	\N	\N	\N	\N	\N
3257	salem-1906	Salem 1906	Les procès de sorcières ont eu lieu à Salem, dans le Massachussetts à la fin du XVIIème siècle. 	Les procès de sorcières ont eu lieu à Salem, dans le Massachussetts à la fin du XVIIème siècle. 	https://www.facebook.com/events/318062695389314/	1500	2018-06-16 02:00:00+02	1	1051	1318	EUR	short	\N	\N	\N	\N	\N	\N
3258	et-pour-quelques-cristaux-de-plus	Et pour quelques cristaux de plus	Un nouveau gisement de cristaux a été trouvé ! Voilà qui attire l'attention de la plèbe comme des citée-États. Alors que les hommes en quête de gloire et de richesses se précipitent pour revendiquer... 	Un nouveau gisement de cristaux a été trouvé ! Voilà qui attire l'attention de la plèbe comme des citée-États. Alors que les hommes en quête de gloire et de richesses se précipitent pour revendiquer... 	https://www.facebook.com/events/866203353550572/	1800	2018-06-16 02:00:00+02	1	832	1500	EUR	short	\N	\N	\N	0	\N	\N
3259	ars-magna-19	Ars Magna 19			https://docs.google.com/forms/d/e/1FAIpQLSfaHxpgL6wmjgUKWSEAeyksH43tQN_M0jLE6paPa6B22Z_YTg/viewform	5000	2018-06-16 02:00:00+02	1	1052	1257	EUR	medium	\N	\N	\N	3500	\N	\N
3260	obscurus-cult	Obscurus Cult	International Larp (in English): Love, Worship, Obey. This is your chance! Experience brainwashing! By a cult! 	International Larp (in English): Love, Worship, Obey. This is your chance! Experience brainwashing! By a cult! 	https://obscuruscult.wordpress.com	28000	2018-06-19 02:00:00+02	1	1053	1375	EUR	long	\N	\N	\N	\N	\N	\N
3261	new-world-magischola	New World Magischola	International Larp (in English): 4-day wizard school larp set in the Magimundi of North America. NWM is a progressive wizard school with less-traditional policies.	International Larp (in English): 4-day wizard school larp set in the Magimundi of North America. NWM is a progressive wizard school with less-traditional policies.	www.magischola.com	50900	2018-06-21 02:00:00+02	1	1054	1442	EUR	long	\N	\N	\N	0	\N	\N
3262	human-experience	human experience	International Larp (in English): “Human Experience” is a physical, immersive larp about the sensations we get from movements, touch and senses.	International Larp (in English): “Human Experience” is a physical, immersive larp about the sensations we get from movements, touch and senses.	https://www.humanexperience.events	2800	2018-06-21 02:00:00+02	1	1009	1353	EUR	hours	\N	\N	\N	2800	\N	\N
3263	cabaret-cajun	Cabaret Cajun	Dans la moiteur du vieux sud, alors que le dix-neuvième siècle touche à sa fin. [...] Relents de bayou, effluves vaudou, fragrances épicées et parfums étranges...	Dans la moiteur du vieux sud, alors que le dix-neuvième siècle touche à sa fin. [...] Relents de bayou, effluves vaudou, fragrances épicées et parfums étranges...	https://grou1.typeform.com/to/x3n2Rz	0	2018-06-22 02:00:00+02	1	1048	1388	EUR	medium	\N	\N	\N	\N	\N	\N
3264	chilipocras-et-dautres-machins	Chilipocras et d'autres machins	Rendez-vous amical GNiste près de Belfort	Rendez-vous amical GNiste près de Belfort	https://www.facebook.com/permalink.php?story_fbid=1975069185855259&id=147817381913791	0	2018-06-23 02:00:00+02	1	965	1142	EUR	medium	\N	\N	\N	\N	\N	\N
3265	obscurus-cult	Obscurus Cult	International Larp (in English): Love, Worship, Obey. This is your chance! Experience brainwashing! By a cult! 	International Larp (in English): Love, Worship, Obey. This is your chance! Experience brainwashing! By a cult! 	https://obscuruscult.wordpress.com	28000	2018-06-26 02:00:00+02	1	1053	1375	EUR	long	\N	\N	\N	\N	\N	\N
3266	memento-mori-version-2	Memento Mori Version 2	Mai 1938, la Comtesse Grâce du Val de Beaulieu et son frère le baron Adolphe Desmanet de Biesme ont le plaisir de vous inviter à leur Garden-Party en leur domaine champêtre de Brüly-de-Pesche...	Mai 1938, la Comtesse Grâce du Val de Beaulieu et son frère le baron Adolphe Desmanet de Biesme ont le plaisir de vous inviter à leur Garden-Party en leur domaine champêtre de Brüly-de-Pesche...	https://www.facebook.com/events/1441902855917871/	0	2018-06-26 02:00:00+02	1	1055	1499	EUR	medium	\N	\N	\N	\N	\N	\N
3267	mahoutokoro-sakura-no-yume	Mahoutokoro - Sakura no yume	GN école de sorcellerie, traditions et croyances magiques japonaises. Rythme lent, non-dits, sous-entendus. Des échanges feutrés plutôt qu’une course à la résolution.	GN école de sorcellerie, traditions et croyances magiques japonaises. Rythme lent, non-dits, sous-entendus. Des échanges feutrés plutôt qu’une course à la résolution.	http://www.rajr.fr/mahoutokoro/	8500	2018-06-29 02:00:00+02	1	924	1279	EUR	medium	\N	\N	\N	\N	\N	\N
3269	terres-sauvages-la-colere-de-yasun	Terres Sauvages "La colère de Yasun"	GN Terres Sauvages mediéval fantastique	GN Terres Sauvages mediéval fantastique	https://www.facebook.com/events/2539675319592015/	6200	2018-06-29 02:00:00+02	1	1056	1413	EUR	medium	\N	\N	\N	4000	\N	\N
3270	nakzar-le-fleau-du-nord	Nakzar: Le Fléau du Nord	Med-Fan	Med-Fan	https://sites.google.com/site/nakzargn/	2000	2018-06-30 02:00:00+02	1	916	1310	EUR	short	\N	\N	\N	1500	\N	\N
3271	human-experience	human experience	International Larp (in English): “Human Experience” is a physical, immersive larp about the sensations we get from movements, touch and senses.	International Larp (in English): “Human Experience” is a physical, immersive larp about the sensations we get from movements, touch and senses.	https://www.humanexperience.events	4000	2018-06-30 02:00:00+02	1	1009	1353	EUR	hours	\N	\N	\N	4000	\N	\N
3272	nuit-du-huis-clos-de-nantes	Nuit du Huis-Clos de Nantes	Convention, 3 murders	Convention, 3 murders	https://www.facebook.com/NdhcNantes/ 	0	2018-06-30 02:00:00+02	1	868	1257	EUR	hours	\N	\N	\N	\N	\N	\N
3273	lheure-du-gn	L'Heure du GN	Rendez-vous amical GNiste à Rennes	Rendez-vous amical GNiste à Rennes	https://www.facebook.com/events/1617153478342369/	0	2018-07-05 02:00:00+02	1	850	1268	EUR	hours	\N	\N	\N	\N	\N	\N
3274	eclypson-odyssee	Eclypson | Odyssée	 	 	http://sculpteursdereves.org/gn-eclypson-2018/	6000	2018-07-06 02:00:00+02	1	803	1468	EUR	medium	\N	\N	\N	2000	\N	\N
3275	les-oublies-des-fjords-session-decouverte	Les oubliés des fjords - Session découverte	Jeu viking ouvert aux débutant.e.s	Jeu viking ouvert aux débutant.e.s	https://www.facebook.com/events/1943544382576464/	6500	2018-07-07 02:00:00+02	1	1016	1173	EUR	medium	\N	\N	\N	2500	\N	\N
3276	camp-aventures	Camp Aventures	Camp de vacances comportant 3 GNs, pour débutant ou habitués. 	Camp de vacances comportant 3 GNs, pour débutant ou habitués. 	https://www.facebook.com/aventure.evenements	39300	2018-07-09 02:00:00+02	1	1008	1478	EUR	long	\N	\N	\N	\N	\N	\N
3277	sunfall-2018	Sunfall 2018	International Larp (in English) : Apocalyptic	International Larp (in English) : Apocalyptic	https://www.facebook.com/events/1864318543886183/	7000	2018-07-10 02:00:00+02	1	1057	1407	EUR	long	\N	\N	\N	\N	\N	\N
3278	kandorya-2018	Kandorya 2018	Mass Larp médiéval fantastique	Mass Larp médiéval fantastique	https://www.weezevent.com/kandorya-2018	5900	2018-07-11 02:00:00+02	1	876	1231	EUR	long	\N	\N	\N	1500	\N	\N
3279	club-oasis	Club Oasis	International Larp (in English): a blade runner Larp following Where Androids Dream	International Larp (in English): a blade runner Larp following Where Androids Dream	https://docs.google.com/forms/d/e/1FAIpQLSfzxED4y1pErRwNowSLeKVTEcOQHZynnO8aOsjPYZp68gVOjQ/viewform?edit_requested=true	2000	2018-07-11 02:00:00+02	1	1058	1257	EUR	hours	\N	\N	\N	\N	\N	\N
3280	where-androids-die	Where Androids Die	International Larp (in English): a futuristic dystopian Larp about humanity, its creation and the consequences they have to face (inspiration: blade runner)	International Larp (in English): a futuristic dystopian Larp about humanity, its creation and the consequences they have to face (inspiration: blade runner)	http://whereandroidsdie.net	16300	2018-07-13 02:00:00+02	1	1059	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3281	vfc-artemis-session-1	VFC ARTEMIS Session 1	thriller psychologique battlestar galactica nordique	thriller psychologique battlestar galactica nordique	https://experiencegn.jimdo.com/nos-créations/artemis/	10000	2018-07-14 02:00:00+02	1	1060	1220	EUR	medium	\N	\N	\N	\N	\N	\N
3282	club-oasis	Club Oasis	International Larp (in English): a blade runner Larp following Where Androids Dream	International Larp (in English): a blade runner Larp following Where Androids Dream	https://docs.google.com/forms/d/e/1FAIpQLSfzxED4y1pErRwNowSLeKVTEcOQHZynnO8aOsjPYZp68gVOjQ/viewform?edit_requested=true	2000	2018-07-18 02:00:00+02	1	1058	1257	EUR	hours	\N	\N	\N	\N	\N	\N
3283	myrddin-emrys-college	Myrddin Emrys College	International Larp (in English) : Larp school specialized in higher education for witches and wizards from all over the world	International Larp (in English) : Larp school specialized in higher education for witches and wizards from all over the world	https://www.meclarp.com/	27000	2018-07-20 02:00:00+02	1	980	1374	EUR	long	\N	\N	\N	\N	\N	\N
3284	mahoutokoro	Mahoutokoro	GN école de sorcellerie, traditions et croyances magiques japonaises. Rythme lent, non-dits, sous-entendus. Des échanges feutrés plutôt qu’une course à la résolution.	GN école de sorcellerie, traditions et croyances magiques japonaises. Rythme lent, non-dits, sous-entendus. Des échanges feutrés plutôt qu’une course à la résolution.	http://www.rajr.fr/mahoutokoro/	8500	2018-07-20 02:00:00+02	1	924	1279	EUR	medium	\N	\N	\N	\N	\N	\N
3285	where-androids-die	Where Androids Die	International Larp (in English): a futuristic dystopian Larp about humanity, its creation and the consequences they have to face (inspiration: blade runner)	International Larp (in English): a futuristic dystopian Larp about humanity, its creation and the consequences they have to face (inspiration: blade runner)	http://whereandroidsdie.net	16300	2018-07-20 02:00:00+02	1	1059	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3286	on-location-session-2	On Location Session 2	International Larp (in English) : It’s 1932. At Tarrington Manor, a peaceful British country house, a cast and crew are assembled for the making of the film ‘Stolen Moments’.	International Larp (in English) : It’s 1932. At Tarrington Manor, a peaceful British country house, a cast and crew are assembled for the making of the film ‘Stolen Moments’.	https://onlocationlarp.wordpress.com/practical/signup/	25100	2018-07-20 02:00:00+02	1	1061	1376	EUR	long	\N	\N	\N	\N	\N	\N
3287	murder-gn-battlestar-galactica-de-chair-et-de-sang-session-6	Murder GN "Battlestar Galactica : de Chair et de Sang" - Session 6	BSG, Murder	BSG, Murder	https://www.facebook.com/events/172289303579567	1000	2018-07-21 02:00:00+02	1	1062	1257	EUR	short	\N	\N	\N	\N	\N	\N
3288	les-legendes-dassia-crepuscule-sur-le-midland	Les Légendes d'Assia : Crépuscule sur le Midland	Un médieval fantastique pour 80 joueurs. L'univers se veut épique. 	Un médieval fantastique pour 80 joueurs. L'univers se veut épique. 	http://www.assia-gn.fr	8000	2018-07-27 02:00:00+02	1	876	1452	EUR	medium	\N	\N	\N	3500	\N	\N
3289	kelkalor-v-leveil	Kelkalor V : L'Eveil	Gn médiéval fantastique	Gn médiéval fantastique	https://www.facebook.com/events/373983139704256/	0	2018-07-27 02:00:00+02	1	875	1321	EUR	medium	\N	\N	\N	\N	\N	\N
3290	eldorado-la-mysterieuse-cite-dort	Eldorado : La Mystérieuse Cité Dort	Horreur lovecraftienne	Horreur lovecraftienne	https://www.facebook.com/photo.php?fbid=1720901854607685&set=gm.10154832248451780&type=3&theater&ifg=1	6500	2018-07-27 02:00:00+02	1	890	1151	EUR	medium	\N	\N	\N	\N	\N	\N
3291	dead-zone-reloaded	Dead Zone Reloaded	GN contemporain horreur/survie ; BG perso écrits par l'orga, l'accent est mis sur le RP et les conflits entre joueurs	GN contemporain horreur/survie ; BG perso écrits par l'orga, l'accent est mis sur le RP et les conflits entre joueurs	https://lescompagnonsdelouest.wordpress.com/info-pratiques/	7000	2018-07-27 02:00:00+02	1	945	1190	EUR	medium	\N	\N	\N	3000	\N	\N
3293	vfc-artemis-session-2	VFC ARTEMIS Session 2	thriller psychologique battlestar galactica nordique	thriller psychologique battlestar galactica nordique	https://experiencegn.jimdo.com/nos-créations/artemis/	10000	2018-07-28 02:00:00+02	1	1060	1220	EUR	medium	\N	\N	\N	\N	\N	\N
3294	la-plume-et-le-serpent-ou-la-revanche-de-tlahuizcalpantecuhtli	La plume et le serpent (ou la revanche de Tlahuizcalpantecuhtli)	Vente aux enchères, 1900, une statuette porteuse de malédictions... Enquête, histoires de famille, amour, drame et bon public.	Vente aux enchères, 1900, une statuette porteuse de malédictions... Enquête, histoires de famille, amour, drame et bon public.	https://docs.google.com/forms/d/e/1FAIpQLSff_B2RS69hE-sqLisKo3r-jApsvL9QvPfCqcc8nj2eCLC0MQ/viewform?chromeless=1&edit_requested=true	1200	2018-07-28 02:00:00+02	1	1063	1257	EUR	hours	\N	\N	\N	\N	\N	\N
3295	pax-europa	Pax Europa	International Larp (in English): steampunk LARP of International Politics, Personal Drama and Weird Science set in an Alternate Victorian Europe	International Larp (in English): steampunk LARP of International Politics, Personal Drama and Weird Science set in an Alternate Victorian Europe	http://steamlarp.com	5600	2018-07-28 02:00:00+02	1	1064	1510	EUR	short	\N	\N	\N	\N	\N	\N
3296	contes-de-la-brume-gn-la-foret-sacree-de-tha-skar	Contes de la Brume - GN La Forêt Sacrée de Tha Skar	Un grand nombre de forêts sacrées se trouvent sur le territoire Houzi. Selon les croyances de ces derniers, chaque arbre abrite l'esprit d'une personne défunte. 	Un grand nombre de forêts sacrées se trouvent sur le territoire Houzi. Selon les croyances de ces derniers, chaque arbre abrite l'esprit d'une personne défunte. 	https://www.facebook.com/events/2034577726864067/	8000	2018-07-29 02:00:00+02	1	819	1275	EUR	medium	\N	\N	\N	3000	\N	\N
3297	conquest-2018	ConQuest 2018	International Larp (in German and English): conquest 2018 5-tägiges selbstverpfleger-zelt-con august	International Larp (in German and English): conquest 2018 5-tägiges selbstverpfleger-zelt-con august	https://www.facebook.com/145411559393068	15000	2018-08-01 02:00:00+02	1	991	1489	EUR	long	\N	\N	\N	4000	\N	\N
3298	memoires-de-noname	Mémoires de Nonamé	GN médiéval fantastique	GN médiéval fantastique	https://www.facebook.com/LesJoueursdelaForge/posts/469179780133272	0	2018-08-03 02:00:00+02	1	875	1361	EUR	medium	\N	\N	\N	\N	\N	\N
3299	lepice-doit-couler-a-flot-ou-touche-pas-au-grisbi	L'épice doit couler à flot ou Touche pas au Grisbi!	Med-Fan tendance Dune	Med-Fan tendance Dune	https://leschevaliersduroi.wixsite.com/touchepasaugrisbi	8000	2018-08-03 02:00:00+02	1	882	1348	EUR	medium	\N	\N	\N	\N	\N	\N
3300	proto-gn-le-congres-de-tesien	Proto GN "Le Congrès de Tesien"	thème diplomatique d’un “camp du Drap d’Or”, d’une Société Des Nations ou du Congrès de Vienne de 1814-1815.	thème diplomatique d’un “camp du Drap d’Or”, d’une Société Des Nations ou du Congrès de Vienne de 1814-1815.	https://www.facebook.com/events/581895722013168/	1400	2018-08-04 02:00:00+02	1	794	1357	EUR	medium	\N	\N	\N	\N	\N	\N
3301	gn-frida-kahlo-lo-que-el-agua-me-dio-session-2	GN Frida Kahlo "Lo que el agua me dio" Session 2	Jeu collaboratif, avec une approche expérimentale et romanesque dans l’entourage artistique et politique de Frida Kalho et Diego Rivera 	Jeu collaboratif, avec une approche expérimentale et romanesque dans l’entourage artistique et politique de Frida Kalho et Diego Rivera 	https://docs.google.com/forms/d/e/1FAIpQLSemmZqyShjzsT0xw2wsoVPGDWoKN70xxDvMTsESFcC9Rez5Kg/viewform	3000	2018-08-04 02:00:00+02	1	1065	1391	EUR	medium	\N	\N	\N	\N	\N	\N
3302	les-echos-des-limbes	Les Échos des Limbes	Nous sommes en 2522, alors qu'Archaon, l'élu des dieux du Chaos, envahi le Vieux monde une seconde fois...	Nous sommes en 2522, alors qu'Archaon, l'élu des dieux du Chaos, envahi le Vieux monde une seconde fois...	https://www.facebook.com/groups/908792249273233/	5000	2018-08-04 02:00:00+02	1	1066	1494	EUR	medium	\N	\N	\N	3500	\N	\N
3303	les-echos-des-limbes	Les Echos des Limbes	Gn sur l'univers de Warhammer modifié à notre sauce.	Gn sur l'univers de Warhammer modifié à notre sauce.	https://www.facebook.com/groups/908792249273233/	5000	2018-08-04 02:00:00+02	1	1066	1494	EUR	medium	\N	\N	\N	3500	\N	\N
3304	gn-la-bataille-de-haguenau	GN La bataille de Haguenau	Nous sommes en 1920. La guerre mondiale est toujours en cours, malgré plusieurs tentatives d'armistice. Accalmies et reprises encore plus violentes se succèdent...	Nous sommes en 1920. La guerre mondiale est toujours en cours, malgré plusieurs tentatives d'armistice. Accalmies et reprises encore plus violentes se succèdent...	https://www.facebook.com/permalink.php?story_fbid=448638188926277&id=448626885594074	4500	2018-08-04 02:00:00+02	1	1067	1136	EUR	short	\N	\N	\N	2500	\N	\N
3305	legende-dhyboree-4	Légende d'Hyborée 4	Conan	Conan	http://larpmanager.eveoniris.com/	8000	2018-08-09 02:00:00+02	1	885	1218	EUR	long	\N	\N	\N	2500	\N	\N
3306	bothwell-school-of-witchcraft-3	Bothwell School of Witchcraft 3	International Larp (in English): live out your dream of becoming a real life student of magic	International Larp (in English): live out your dream of becoming a real life student of magic	https://www.bothwellschoolofwitchcraft.com	0	2018-08-10 02:00:00+02	1	1011	1456	EUR	long	\N	\N	\N	\N	\N	\N
3307	little-chicago-sexe-drogues-et-nuka-cola-session-2	Little Chicago : sexe, drogues et nuka cola - Session 2	Un GN librement inspiré du monde de Fallout. Il s'agit de la seconde édition de l'événement, version dopée au Buffout!	Un GN librement inspiré du monde de Fallout. Il s'agit de la seconde édition de l'événement, version dopée au Buffout!	https://www.facebook.com/events/136761500372404/	0	2018-08-10 02:00:00+02	1	1068	1261	EUR	medium	\N	\N	\N	\N	\N	\N
3308	on-location-session-3	On Location Session 3	International Larp (in English) : It’s 1932. At Tarrington Manor, a peaceful British country house, a cast and crew are assembled for the making of the film ‘Stolen Moments’.	International Larp (in English) : It’s 1932. At Tarrington Manor, a peaceful British country house, a cast and crew are assembled for the making of the film ‘Stolen Moments’.	https://onlocationlarp.wordpress.com/practical/signup/	25100	2018-08-10 02:00:00+02	1	1061	1376	EUR	long	\N	\N	\N	\N	\N	\N
3309	prisme-la-fete-de-dahma	Prisme : La Fête de Dahma	Dans le monde de Crystal, un univers médiéval féérique sombre (low fantasy darkage), avec de la diplomatie, de la magie, du combat et de l’aventure.	Dans le monde de Crystal, un univers médiéval féérique sombre (low fantasy darkage), avec de la diplomatie, de la magie, du combat et de l’aventure.	http://collectif-prisme.fr/pages/article.php?id=91	9000	2018-08-11 02:00:00+02	1	1069	1186	EUR	long	\N	\N	\N	\N	\N	\N
3310	les-legendes-de-zaelwair-2018-les-derniers-traldars	Les Légendes de Zaelwaïr 2018 "Les derniers Traldars"	 la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer	 la guerre approche et vos chefs de factions font appel à vous pour ce combat qu'ils vont livrer	https://www.facebook.com/events/109227123181863/	3000	2018-08-11 02:00:00+02	1	876	1479	EUR	medium	\N	\N	\N	1500	\N	\N
3311	labogn-2018	LaboGN 2018	Convention : Semaine d’expérimentations entre passionné-es de GN pour participer à des ateliers, avoir des discussions autour du GN, tester des jeux...	Convention : Semaine d’expérimentations entre passionné-es de GN pour participer à des ateliers, avoir des discussions autour du GN, tester des jeux...	https://www.facebook.com/events/164993574215851/	22000	2018-08-12 02:00:00+02	1	1070	1495	EUR	long	\N	\N	\N	\N	\N	\N
3312	terra-antiqua-tome-2	Terra Antiqua (Tome 2)	Conquérir, enquête, combattre, vivre...	Conquérir, enquête, combattre, vivre...	https://www.facebook.com/events/528341857557945	4900	2018-08-16 02:00:00+02	1	876	1332	EUR	medium	\N	\N	\N	2500	\N	\N
3313	dies-irae-sire-on-en-a-gros-le-gn	Dies Irae : Sire, on en a gros! le GN	Le royaume entier vient d'apprendre qu’Arthur vient de replanter - encore une fois - Excalibur dans son rocher.	Le royaume entier vient d'apprendre qu’Arthur vient de replanter - encore une fois - Excalibur dans son rocher.	https://www.facebook.com/events/442553256160665/	0	2018-08-17 02:00:00+02	1	875	1179	EUR	medium	\N	\N	\N	\N	\N	\N
3314	a-nice-evening-with-the-family-session-1	A nice evening with the family - Session 1	International Larp (in English): A Larp about the Contemporary Nordic Family	International Larp (in English): A Larp about the Contemporary Nordic Family	http://aniceevening.se/plays/	25000	2018-08-17 02:00:00+02	1	1071	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3315	bunker-101-the-fallout	Bunker 101 - The Fallout	International Larp (in English): Life, Love and Death in Bunker 101. High-budget live-action roleplaying game for 100 players in the Southern Way/New Italian Larp style, set inside a real fallout shelter.	International Larp (in English): Life, Love and Death in Bunker 101. High-budget live-action roleplaying game for 100 players in the Southern Way/New Italian Larp style, set inside a real fallout shelter.	http://bunker101.com/en/	24000	2018-08-17 02:00:00+02	1	1072	1184	EUR	medium	\N	\N	\N	\N	\N	\N
3316	mission-encelade	Mission Encelade	Le thème de ce gn est l'anticipation de la conquête planétaire, après une 3ème guerre mondiale qui a chamboulé l'organisation civile, sociale et humaine. 	Le thème de ce gn est l'anticipation de la conquête planétaire, après une 3ème guerre mondiale qui a chamboulé l'organisation civile, sociale et humaine. 	https://gun-and-dream.wixsite.com/missionencelade	8500	2018-08-18 02:00:00+02	1	859	1355	EUR	short	\N	\N	\N	\N	\N	\N
3317	suffragette	Suffragette!	International Larp (in English): Join us for a historical larp about divisions and sisterhood within the feminist movement of 1912. Expect arguments, angst, laughter, love and an elegant fistful of feminist power. 	International Larp (in English): Join us for a historical larp about divisions and sisterhood within the feminist movement of 1912. Expect arguments, angst, laughter, love and an elegant fistful of feminist power. 	https://suffragettelarp.wordpress.com	4400	2018-08-18 02:00:00+02	1	1073	1257	EUR	short	\N	\N	\N	\N	\N	\N
3318	a-nice-evening-with-the-family-session-2	A nice evening with the family - Session 2	International Larp (in English): A Larp about the Contemporary Nordic Family	International Larp (in English): A Larp about the Contemporary Nordic Family	http://aniceevening.se/plays/	25000	2018-08-19 02:00:00+02	1	1071	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3319	la-bataille-de-culfaquin	La bataille de Culfaquin	GN Medieval Fantastique dans l'univers d'Hélios, un monde emplis de magie et de mystére. Découvrez les secrets des Hélénides et de leur création, rencontrer les Gardiens des Elements, et le mal absolu...	GN Medieval Fantastique dans l'univers d'Hélios, un monde emplis de magie et de mystére. Découvrez les secrets des Hélénides et de leur création, rencontrer les Gardiens des Elements, et le mal absolu...	https://www.facebook.com/events/210999309420828/	3000	2018-08-21 02:00:00+02	1	1074	1433	EUR	long	\N	\N	\N	2500	\N	\N
3320	a-nice-evening-with-the-family-session-3	A nice evening with the family - Session 3	International Larp (in English): A Larp about the Contemporary Nordic Family	International Larp (in English): A Larp about the Contemporary Nordic Family	http://aniceevening.se/plays/	25000	2018-08-22 02:00:00+02	1	1071	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3321	invasion-in-ze-berry	Invasion in ze berry	Wargame GN de masse. Pour plusieurs 100aines de personnes, réparties au sein de 2, 3 ou 4 armées qui vont s’affronter pendant 2 jours sur plus de 1000 hectares d’un terrain varié.	Wargame GN de masse. Pour plusieurs 100aines de personnes, réparties au sein de 2, 3 ou 4 armées qui vont s’affronter pendant 2 jours sur plus de 1000 hectares d’un terrain varié.	https://www.facebook.com/events/1891962577783878/	4000	2018-08-23 02:00:00+02	1	818	1159	EUR	long	\N	\N	\N	\N	\N	\N
3322	orleans-1562	Orléans, 1562	GN renaissance qui sent bon duels, rapière et main-gauche. En pleine guerres de Religion (deuxième moitié du XVIe siècle).	GN renaissance qui sent bon duels, rapière et main-gauche. En pleine guerres de Religion (deuxième moitié du XVIe siècle).	https://estocadegn.wixsite.com/esctocade-gn	8500	2018-08-24 02:00:00+02	1	1075	1358	EUR	medium	\N	\N	\N	4500	\N	\N
3323	les-griffons-2018-une-nouvelle-ere	Les Griffons 2018 : Une nouvelle ère	Jeux de rôle grandeur médieval fantastique	Jeux de rôle grandeur médieval fantastique	https://www.facebook.com/groups/201519106554634/permalink/1704198039620059/	5500	2018-08-24 02:00:00+02	1	882	1235	EUR	medium	\N	\N	\N	2000	\N	\N
3324	a-nice-evening-with-the-family-session-4	A nice evening with the family - Session 4	International Larp (in English): A Larp about the Contemporary Nordic Family	International Larp (in English): A Larp about the Contemporary Nordic Family	http://aniceevening.se/plays/	25000	2018-08-24 02:00:00+02	1	1071	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3325	nu-orb	Nù Orb	Anticipation, conscience, communauté	Anticipation, conscience, communauté	http://www.grand-duc.fr/nuorb/index.html	12000	2018-08-24 02:00:00+02	1	1024	1487	EUR	medium	\N	\N	\N	0	\N	\N
3326	gn-le-repaire-des-griffons	GN Le Repaire des Griffons	GN médiéval fantastique	GN médiéval fantastique	https://lerepairedesgriffons.wixsite.com/mongn/	5500	2018-08-24 02:00:00+02	1	882	1235	EUR	medium	\N	\N	\N	2000	\N	\N
3327	les-oublies-des-fjords-session-decouverte	Les oubliés des fjords - Session découverte	Jeu viking pour les passionné.e.s	Jeu viking pour les passionné.e.s	https://www.facebook.com/events/174868069943378/	6500	2018-08-25 02:00:00+02	1	1016	1173	EUR	medium	\N	\N	\N	2500	\N	\N
3328	marked-a-school-for-heroes	Marked: a school for heroes	International Larp (in English): Mistry Academy might look like an upper class English school in a beautiful country manor, but it has a secret - its staff and students are all Marked, people with super powers	International Larp (in English): Mistry Academy might look like an upper class English school in a beautiful country manor, but it has a secret - its staff and students are all Marked, people with super powers	http://markedlarp.com	34100	2018-08-30 02:00:00+02	1	1076	1511	EUR	long	\N	\N	\N	\N	\N	\N
3329	desossons-pour-mieux-regner	Désossons pour mieux Régner	GN médiéval funtastique mettant l'accès sur l'intrigue, l'action et le rôle play, mais aussi et surtout sur la convivialité et l'écologie. Tous les repas seront fait en circuit court.	GN médiéval funtastique mettant l'accès sur l'intrigue, l'action et le rôle play, mais aussi et surtout sur la convivialité et l'écologie. Tous les repas seront fait en circuit court.	https://www.facebook.com/events/166869090812412/	5100	2018-08-31 02:00:00+02	1	1077	1276	EUR	medium	\N	\N	\N	\N	\N	\N
3330	the-forbidden-history	The Forbidden History	International Larp (in English): inspired by the novels The Secret history, an elite school with many mysteries and secret societies...	International Larp (in English): inspired by the novels The Secret history, an elite school with many mysteries and secret societies...	http://theforbiddenhistory.info	47500	2018-09-06 02:00:00+02	1	996	1459	EUR	long	\N	\N	\N	\N	\N	\N
3331	les-noces-de-dupes	Les Noces de Dupes	GN Game of Throne, légère uchronie se déroulant après la guerre connue sous le nom de « Danse des dragons »	GN Game of Throne, légère uchronie se déroulant après la guerre connue sous le nom de « Danse des dragons »	https://www.facebook.com/events/547297965670726/	5000	2018-09-07 02:00:00+02	1	1078	1506	EUR	medium	\N	\N	\N	\N	\N	\N
3332	a-few-years-later	A few years later	International Larp (in English): Honour. Love. Patriarchy. (a larp in the Brudpris world)	International Larp (in English): Honour. Love. Patriarchy. (a larp in the Brudpris world)	http://brudpris.eu/practical-and-signup/sign-up-procedure/	20000	2018-09-12 02:00:00+02	1	1079	1512	EUR	long	\N	\N	\N	\N	\N	\N
3333	sanctum-post-apoc-larp	Sanctum - post-apoc larp	International Larp (in English): Survival Supremacy Solidarity - A fiery mix of Larp, Post-Apoc culture, Music and Fun	International Larp (in English): Survival Supremacy Solidarity - A fiery mix of Larp, Post-Apoc culture, Music and Fun	https://www.facebook.com/events/315884632262140/	5000	2018-09-13 02:00:00+02	1	1080	1412	EUR	long	\N	\N	\N	\N	\N	\N
3334	flykten-till-kolsjon	Flykten Till Kolsjön	International Larp (in Swedish & English): about refugees, survival and fleeing 	International Larp (in Swedish & English): about refugees, survival and fleeing 	https://beratta.org/flykten/en/	7700	2018-09-14 02:00:00+02	1	1081	1513	EUR	medium	\N	\N	\N	\N	\N	\N
3335	wild-dust-episode-5-get-free-or-die-trying	WILD DUST - épisode 5: Get Free or Die Trying	L'Ouest américain en 1867 est tous sauf un havre de paix. Rué vers l'or, dollars, crimes, sauvages et maladies...	L'Ouest américain en 1867 est tous sauf un havre de paix. Rué vers l'or, dollars, crimes, sauvages et maladies...	https://www.facebook.com/143308933001327	10000	2018-09-14 02:00:00+02	1	1082	1428	EUR	medium	\N	\N	\N	7000	\N	\N
3336	lexode	L'Exode	GN clanique	GN clanique	https://www.facebook.com/larpgn/posts/1821050274624987	6000	2018-09-14 02:00:00+02	1	1083	1505	EUR	medium	\N	\N	\N	2500	\N	\N
3337	returning-home-session-3	Returning Home session 3	Etats-Unis 1945, retour des soldats	Etats-Unis 1945, retour des soldats	https://docs.google.com/forms/d/e/1FAIpQLSfZPRCNNc03duLXN6b5vh5m_qbfvfJXHMMTzThKEYotfJpROw/viewform	6500	2018-09-15 02:00:00+02	1	884	1370	EUR	medium	\N	\N	\N	2500	\N	\N
3338	comptes-de-fees-3-il-eut-ete-une-fois	Comptes de fées 3 - Il eut été une fois	Conte de fées post apo	Conte de fées post apo	https://www.facebook.com/groups/160522214711618/	5000	2018-09-15 02:00:00+02	1	1084	1279	EUR	short	\N	\N	\N	1500	\N	\N
3339	college-of-wizardry-avalon	College of Wizardry - Avalon	International Larp (in English): a magic school larp about the old way of magic and survival in a harsh environment	International Larp (in English): a magic school larp about the old way of magic and survival in a harsh environment	http://avalonlarp.studio/cowavalon/	22500	2018-09-20 02:00:00+02	1	1085	1205	EUR	long	\N	\N	\N	\N	\N	\N
3340	inter-drakerys-irosia-succession-imperiale	Inter-Drakerys Irosia : Succession Impériale	Inter-Drakerys Irosia Dark Fantasy	Inter-Drakerys Irosia Dark Fantasy	https://www.facebook.com/events/532822470420449/	8000	2018-09-21 02:00:00+02	1	866	1203	EUR	medium	\N	\N	\N	4000	\N	\N
3341	flykten-till-kolsjon	Flykten Till Kolsjön	International Larp (in Swedish & English): about refugees, survival and fleeing 	International Larp (in Swedish & English): about refugees, survival and fleeing 	https://beratta.org/flykten/en/	7700	2018-09-21 02:00:00+02	1	1081	1513	EUR	medium	\N	\N	\N	\N	\N	\N
3342	pirate-le-chant-du-cygne	Pirate : le Chant du Cygne	Pirate/Semi-historique/Fantastique/Old Shool assumé	Pirate/Semi-historique/Fantastique/Old Shool assumé	https://www.facebook.com/events/419404795163704	7500	2018-09-21 02:00:00+02	1	881	1330	EUR	medium	\N	\N	\N	3000	\N	\N
3343	gniales-toulouse	GNiales Toulouse	Convention	Convention	https://www.facebook.com/gnialestoulouse/posts/614714195538056	0	2018-09-22 02:00:00+02	1	1030	1237	EUR	medium	\N	\N	\N	\N	\N	\N
3344	jaorken-iii-le-berceau-dor	Jaörken III : Le Berceau d'Or	Troisième opus de Jaörken, dans le Calvados (France)	Troisième opus de Jaörken, dans le Calvados (France)	https://www.facebook.com/events/1695145383868638/	5000	2018-09-22 02:00:00+02	1	1025	1313	EUR	medium	\N	\N	\N	2500	\N	\N
3345	le-deserteur	Le Déserteur	Humour Noir, Boris Vian, Expérimental, Jeu à scène et à rebours 	Humour Noir, Boris Vian, Expérimental, Jeu à scène et à rebours 	https://goo.gl/forms/ag85OpC6Xip7xayb2	3500	2018-09-22 02:00:00+02	1	1086	1279	EUR	hours	\N	\N	\N	1500	\N	\N
3346	skullcrossbones	Skull&Crossbones	International LARP (in English): a sailing nordic larp about being an infamous pirates sailing the seven seas, stealing treasures, shooting powder, drinking rum and enjoying the freedom of the oceans	International LARP (in English): a sailing nordic larp about being an infamous pirates sailing the seven seas, stealing treasures, shooting powder, drinking rum and enjoying the freedom of the oceans	https://www.facebook.com/events/333735557117592/	64900	2018-09-24 02:00:00+02	1	1087	1490	EUR	long	\N	\N	\N	0	\N	\N
3347	gn-vampire-dark-ages	GN Vampire Dark Ages	GN Vampire Dark Ages	GN Vampire Dark Ages	https://www.facebook.com/events/1011089542272133/	8800	2018-09-28 02:00:00+02	1	793	1450	EUR	medium	\N	\N	\N	3500	\N	\N
3348	arn-10	ARN 1.0	Jeu de rôle grandeur nature, dans un univers normand post apocalyptique.	Jeu de rôle grandeur nature, dans un univers normand post apocalyptique.	https://www.facebook.com/events/268587670329618/	5500	2018-09-28 02:00:00+02	1	903	1356	EUR	medium	\N	\N	\N	3500	\N	\N
3349	de-cape-et-decailles	De Cape et d'Ecailles	Dans l'univers des Lames du Cardinal de Pierre Pevel	Dans l'univers des Lames du Cardinal de Pierre Pevel	https://www.facebook.com/events/276613579512124/	0	2018-09-28 02:00:00+02	1	840	1475	EUR	medium	\N	\N	\N	\N	\N	\N
3350	gn-usm-2-les-feux-de-beltane-session-1	GN USM 2 "Les feux de Beltane" - Session 1	GN inspiré de l’univers d’Harry Potter 	GN inspiré de l’univers d’Harry Potter 	https://www.facebook.com/events/151478488832636/	8500	2018-09-28 02:00:00+02	1	944	1473	EUR	medium	\N	\N	\N	\N	\N	\N
3351	eormengrund-imperium	Eormengrund : Impérium	Dans un XIXème siècle uchronique où les empires français & britanniques règnent sans partage sur un monde bipolarisé, un congrès et organisés en terrain neutre...	Dans un XIXème siècle uchronique où les empires français & britanniques règnent sans partage sur un monde bipolarisé, un congrès et organisés en terrain neutre...	https://www.facebook.com/events/173683846507359/	6000	2018-09-28 02:00:00+02	1	882	1496	EUR	medium	\N	\N	\N	2500	\N	\N
3352	gn-birmingham-1919	GN Birmingham 1919	GN inspiré de la série Peaky Blinders	GN inspiré de la série Peaky Blinders	https://www.facebook.com/birmingham1919/posts/349963635511109	9500	2018-09-28 02:00:00+02	1	1088	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3353	les-sagas-de-scandia	Les Sagas de Scandia	GN viking	GN viking	http://lessagasdescandia.fr	6000	2018-09-28 02:00:00+02	1	846	1507	EUR	medium	\N	\N	\N	2000	\N	\N
3354	marvel-sokovia-3-legacies	Marvel Sokovia 3 : Legacies	Incarnez un héros "street level" au cœur d'une Sokovie en crise, au bord de l'anarchie. 	Incarnez un héros "street level" au cœur d'une Sokovie en crise, au bord de l'anarchie. 	http://marvsokovia.fr/	9500	2018-09-29 02:00:00+02	1	908	1373	EUR	medium	\N	\N	\N	5500	\N	\N
3355	les-mysteres-du-mont-saint-michel-le-secret-de-lalchimiste	Les Mystères du Mont Saint Michel - Le secret de l'Alchimiste	mystères mont saint michel secret	mystères mont saint michel secret	https://www.facebook.com/events/1629561347132187/	1300	2018-09-29 02:00:00+02	1	1026	1239	EUR	hours	\N	\N	\N	\N	\N	\N
3356	fading-suns-les-cendres-de-la-republique	Fading Suns, "Les cendres de la République"	L'univers de Fading Suns est un space opéra médiévalisant (proche de Dune) issu de la licence de jeux de rôle du même nom.	L'univers de Fading Suns est un space opéra médiévalisant (proche de Dune) issu de la licence de jeux de rôle du même nom.	https://www.facebook.com/events/148580009329052/	4000	2018-09-30 02:00:00+02	1	1089	1508	EUR	short	\N	\N	\N	2500	\N	\N
3357	college-of-wizardry-13-halloween-midterms	College of Wizardry 13: Halloween Midterms	International Larp (in English)	International Larp (in English)	https://www.facebook.com/1689771397712147	54000	2018-10-04 02:00:00+02	1	996	1205	EUR	long	\N	\N	\N	\N	\N	\N
3359	la-memoire-des-ombres	La Mémoire des Ombres	La Mémoire des Ombres est un jeu mêlant exploration et énigmes dans une ambiance d'horreur et de survie...	La Mémoire des Ombres est un jeu mêlant exploration et énigmes dans une ambiance d'horreur et de survie...	https://www.facebook.com/events/142791849749384	9000	2018-10-05 02:00:00+02	1	1022	1293	EUR	medium	\N	\N	\N	2000	\N	\N
3360	abri-403-un-gn-post-nuklear	Abri 403, un GN post-nuklear	La radioactivité vous manque? La sûreté douteuse d’un abri contrôlé par une IA qui en veut à vos fesses vous fait rêver?	La radioactivité vous manque? La sûreté douteuse d’un abri contrôlé par une IA qui en veut à vos fesses vous fait rêver?	https://www.facebook.com/events/1937679329886923/	7500	2018-10-05 02:00:00+02	1	1090	1471	EUR	medium	\N	\N	\N	3500	\N	\N
3362	battle-yokai-games	Battle Yokai Games	Battle Yokai Game est un inspiré à la fois d’univers tel Battle Royale et Hunger Games où des gens sont voués à s’entretuer et à survivre seul ou en équipe	Battle Yokai Game est un inspiré à la fois d’univers tel Battle Royale et Hunger Games où des gens sont voués à s’entretuer et à survivre seul ou en équipe	https://www.facebook.com/events/252106928661885/	7000	2018-10-05 02:00:00+02	1	883	1216	EUR	medium	\N	\N	\N	6000	\N	\N
3363	the-clock-session-2	The Clock session 2	Tous les membres de la haute société de Londres sont conviés à notre 6ème concours scientifique ! (Murder-GN, ambiance 1900-Steampunk)	Tous les membres de la haute société de Londres sont conviés à notre 6ème concours scientifique ! (Murder-GN, ambiance 1900-Steampunk)	https://www.facebook.com/events/148024752480846/	4500	2018-10-06 02:00:00+02	1	1091	1349	EUR	short	\N	\N	\N	\N	\N	\N
3364	no-middle-ground	No Middle Ground	International Larp (in English): Inspired by tv series like ‘The West Wing’, ‘Designated Survivor’, ‘House of Cards’ or ‘Borgen’, 'No Middle Ground’ is a game about power. 	International Larp (in English): Inspired by tv series like ‘The West Wing’, ‘Designated Survivor’, ‘House of Cards’ or ‘Borgen’, 'No Middle Ground’ is a game about power. 	http://nomiddleground.notonlylarp.com	17500	2018-10-06 02:00:00+02	1	1092	1372	EUR	medium	\N	\N	\N	\N	\N	\N
3365	gn-bagneux-1946-jour-de-fete	GN Bagneux 1946 - Jour de Fête	Les joueurs sont amenés à vivre un instantané de vie, d’hommes et de femmes, qui ont traversé les années d'occupation.	Les joueurs sont amenés à vivre un instantané de vie, d’hommes et de femmes, qui ont traversé les années d'occupation.	https://www.facebook.com/events/2113664575527991/	5000	2018-10-06 02:00:00+02	1	1093	1388	EUR	hours	\N	\N	\N	\N	\N	\N
3366	memoires-doubliettes-session-2	Mémoires d'Oubliettes - Session 2	jeu romanesque d’inspiration historique se déroulant peu avant la révolution française (1787) de type narrativiste (=le but du jeu est de passer un bon jeu tous ensemble)	jeu romanesque d’inspiration historique se déroulant peu avant la révolution française (1787) de type narrativiste (=le but du jeu est de passer un bon jeu tous ensemble)	https://www.facebook.com/events/559910754366574/	13000	2018-10-06 02:00:00+02	1	1033	1388	EUR	medium	\N	\N	\N	\N	\N	\N
3367	derriere-le-portail-30	Derrière le portail 3.0	GN pour enfant	GN pour enfant	https://www.facebook.com/events/172544290236272/	0	2018-10-06 02:00:00+02	1	1034	1504	EUR	hours	\N	\N	\N	\N	\N	\N
3368	convention-of-thorns-session-3	Convention of Thorns Session 3	International LARP (in English) : Vampire White Wolf, deceitful and decadent vampires at the end of the 15th century	International LARP (in English) : Vampire White Wolf, deceitful and decadent vampires at the end of the 15th century	https://www.cotlarp.com	44000	2018-10-11 02:00:00+02	1	999	1205	EUR	long	\N	\N	\N	\N	\N	\N
3369	ultime-western-2018	Ultime Western 2018	L'édition 2018 de l'Ultime Western c'est l'occasion pour nous de feter les 10 ans de cette incroyable aventure dans un site unique: les studios de Fort Bravo en Espagne.	L'édition 2018 de l'Ultime Western c'est l'occasion pour nous de feter les 10 ans de cette incroyable aventure dans un site unique: les studios de Fort Bravo en Espagne.	https://www.facebook.com/events/139389113286289/	0	2018-10-15 02:00:00+02	1	1094	1202	EUR	long	\N	\N	\N	\N	\N	\N
3371	meatball-surgery-world	Meatball Surgery World	International Larp (in English): inspired by a certain TV series about the Korean war	International Larp (in English): inspired by a certain TV series about the Korean war	https://meatballsurgery.wordpress.com	10000	2018-10-19 02:00:00+02	1	1047	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3372	gn-resistances	GN Résistances	Soucoupe volante chez des franchouillards des années 90	Soucoupe volante chez des franchouillards des années 90	https://www.facebook.com/events/1788207837890842/	6700	2018-10-19 02:00:00+02	1	1095	1136	EUR	medium	\N	\N	\N	2500	\N	\N
3373	un-proces-tant-attendu	Un procès tant attendu	GN dans l'univers Harry Potter : Bellatrix Lestranges a été capturée et vient à son procès	GN dans l'univers Harry Potter : Bellatrix Lestranges a été capturée et vient à son procès	http://www.jotformeu.com/form/80853824557365	2900	2018-10-20 02:00:00+02	1	950	1152	EUR	hours	\N	\N	\N	\N	\N	\N
3374	comptes-de-fees-3-il-eut-ete-une-fois	Comptes de fées 3 : il eut été une fois	Contes de fées, post apo, dramatique	Contes de fées, post apo, dramatique	https://goo.gl/forms/0N3f8WnCGOzun1Yv1	5000	2018-10-20 02:00:00+02	1	1096	1279	EUR	short	\N	\N	\N	2500	\N	\N
3375	inside-hamlet	Inside Hamlet	International Larp (in English): Your folly is the curse of Hamlet - a numbing fear of decisive action. It will kill you in the end. All of you.	International Larp (in English): Your folly is the curse of Hamlet - a numbing fear of decisive action. It will kill you in the end. All of you.	https://www.insidehamlet.com	46500	2018-10-26 02:00:00+02	1	988	1379	EUR	medium	\N	\N	\N	\N	\N	\N
3376	gn-projet-theta-v4	GN PROJET Thêta V4	Jeu uchronique qui se déroule en 1951. Univers et une ambiance « pulp » mais qui peuvent néanmoins aborder certaines phases très sombres de l’histoire mondiale.	Jeu uchronique qui se déroule en 1951. Univers et une ambiance « pulp » mais qui peuvent néanmoins aborder certaines phases très sombres de l’histoire mondiale.	https://docs.google.com/forms/d/e/1FAIpQLScNcPd-URd7Z6AmoenKiE08Q9CE7-JskHcoijqm4VedS3Y1Sw/viewform	8000	2018-10-26 02:00:00+02	1	963	1388	EUR	medium	\N	\N	\N	2500	\N	\N
3377	le-crepuscule-des-envieux-tranche-de-toi-long-format	Le Crépuscule des Envieux (Tranche de Toi long format)	Le crépuscule des envieux est un GN sombre (les sujets abordés peuvent être durs) où le roleplay sera basé sur la transmission d’émotions.	Le crépuscule des envieux est un GN sombre (les sujets abordés peuvent être durs) où le roleplay sera basé sur la transmission d’émotions.	https://www.facebook.com/GNLeCrepusculeDesEnvieux	12000	2018-10-26 02:00:00+02	1	802	1488	EUR	medium	\N	\N	\N	5000	\N	\N
3378	fairweather-manor-session-5	Fairweather Manor Session 5	International LARP (in English) : step into the lives of servants, nobles, artists and local guests at a great house during the Edwardian period.	International LARP (in English) : step into the lives of servants, nobles, artists and local guests at a great house during the Edwardian period.	www.fmlarp.com	44000	2018-11-01 01:00:00+01	1	997	1205	EUR	medium	\N	\N	\N	\N	\N	\N
3379	inside-hamlet	Inside Hamlet	International Larp (in English): Your folly is the curse of Hamlet - a numbing fear of decisive action. It will kill you in the end. All of you.	International Larp (in English): Your folly is the curse of Hamlet - a numbing fear of decisive action. It will kill you in the end. All of you.	https://www.insidehamlet.com	46500	2018-11-02 01:00:00+01	1	988	1379	EUR	medium	\N	\N	\N	\N	\N	\N
3380	demeter-5	Demeter 5	International LARP (in English): a sailing nordic larp about Dracula's voyage to England	International LARP (in English): a sailing nordic larp about Dracula's voyage to England	https://www.facebook.com/events/769160146606251/	49900	2018-11-08 01:00:00+01	1	1097	1490	EUR	medium	\N	\N	\N	\N	\N	\N
3381	red-center	Red Center	International Larp (in English): ‘Red Center’‘ is a larp for women made by women. It is about oppression. Inspired by ‘The Handmaid’s Tale (full)	International Larp (in English): ‘Red Center’‘ is a larp for women made by women. It is about oppression. Inspired by ‘The Handmaid’s Tale (full)	http://redcenter.notonlylarp.com	18500	2018-11-09 01:00:00+01	1	1098	1372	EUR	medium	\N	\N	\N	\N	\N	\N
3382	larmee-des-ombres	L'armée des Ombres	GN historique sur la Résistance française en 1943 (inscriptions ouvertes)	GN historique sur la Résistance française en 1943 (inscriptions ouvertes)	https://www.facebook.com/groups/83512407859/permalink/10155976677512860/	7000	2018-11-10 01:00:00+01	1	924	1355	EUR	medium	\N	\N	\N	4000	\N	\N
3383	college-of-wizardry-18	College of Wizardry 18	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	https://www.cowlarp.com	62000	2018-11-15 01:00:00+01	1	996	1205	EUR	long	\N	\N	\N	\N	\N	\N
3384	mittelpunkt-2018-stranger-larp	MittelPunkt 2018 "Stranger LARP"	International convention (in German and English)	International convention (in German and English)	https://www.facebook.com/events/178034079628396/	9000	2018-11-16 01:00:00+01	1	1099	1345	EUR	medium	\N	\N	\N	\N	\N	\N
3385	red-center	Red Center	International Larp (in English): ‘Red Center’‘ is a larp for women made by women. It is about oppression. Inspired by ‘The Handmaid’s Tale (full)	International Larp (in English): ‘Red Center’‘ is a larp for women made by women. It is about oppression. Inspired by ‘The Handmaid’s Tale (full)	http://redcenter.notonlylarp.com	18500	2018-11-16 01:00:00+01	1	1098	1372	EUR	medium	\N	\N	\N	\N	\N	\N
3386	college-of-wizardry-19	College of Wizardry 19	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	International Larp (in English):  four-day roleplaying experience at a 14th Century castle where you can embrace your dreams of being a student at a school of magic	https://www.cowlarp.com	62000	2018-11-22 01:00:00+01	1	996	1205	EUR	long	\N	\N	\N	\N	\N	\N
3387	gn-le-plus-beau-jour-de-sa-vie-session-2	GN : "Le plus beau jour de sa vie" - Session 2	GN mariage (inscriptions ouvertes)	GN mariage (inscriptions ouvertes)	https://www.facebook.com/176040756516137	10200	2018-12-01 01:00:00+01	1	1107	1306	EUR	short	\N	\N	\N	\N	\N	\N
3388	italian-larp-festival	Italian Larp Festival	International convention (in Italian and English): Larp festival, chamber larp	International convention (in Italian and English): Larp festival, chamber larp	http://larpfestival.it/	5500	2018-12-07 01:00:00+01	1	1101	1184	EUR	medium	\N	\N	\N	\N	\N	\N
3389	egregors-3-la-faim-de-lame	Egregors 3 - La Faim de l'Âme	Rôles et scénario sur mesure dans un univers merveilleux contemporain où les joueurs incarnent des personnages de fiction de leurs univers favoris.	Rôles et scénario sur mesure dans un univers merveilleux contemporain où les joueurs incarnent des personnages de fiction de leurs univers favoris.	https://www.facebook.com/events/239043793335069/	13000	2018-12-08 01:00:00+01	1	1102	1292	EUR	medium	\N	\N	\N	\N	\N	\N
3390	les-rencontres-de-la-fedegn	Les Rencontres de la FédéGN	AG de l'association et événements autour	AG de l'association et événements autour	http://www.fedegn.org	0	2018-12-15 01:00:00+01	1	1103	1224	EUR	medium	\N	\N	\N	\N	\N	\N
3391	gn-le-plus-beau-jour-de-sa-vie-session-3	GN : "Le plus beau jour de sa vie" - Session 3	GN mariage (inscriptions ouvertes)	GN mariage (inscriptions ouvertes)	https://www.facebook.com/176040756516137	10200	2019-01-19 01:00:00+01	1	1107	1306	EUR	short	\N	\N	\N	\N	\N	\N
3392	voyage-imprevu	Voyage imprévu	GN Firefly	GN Firefly	https://www.facebook.com/events/688229804704888/	10500	2019-01-25 01:00:00+01	1	1104	1167	EUR	medium	\N	\N	\N	\N	\N	\N
3393	larpcon-2019	LarpCon 2019	International convention (in English): larpcon will returning next year	International convention (in English): larpcon will returning next year	https://www.facebook.com/412093559250855	0	2019-03-01 01:00:00+01	1	1105	1233	EUR	medium	\N	\N	\N	\N	\N	\N
3394	berechtigter-zweifel	Berechtigter Zweifel	International Larp (in English): based on a fictional WW2 prisoner camp called Stalag Luft XVIII 	International Larp (in English): based on a fictional WW2 prisoner camp called Stalag Luft XVIII 	http://berechtigter.equipoente.es	19500	2019-04-05 02:00:00+02	1	1106	1503	EUR	long	\N	\N	\N	\N	\N	\N
3395	gnidee	GN'Idée	Convention	Convention	http://www.orcidee.ch	0	2019-04-27 02:00:00+02	1	1047	1304	EUR	medium	\N	\N	\N	\N	\N	\N
3396	gn-a-lest-rien-de-nouveau-opus-3	GN - A l'Est rien de nouveau (OPUS 3)	grandeur nature ambiance médiéval fantastique	grandeur nature ambiance médiéval fantastique	https://www.facebook.com/167615563887746	0	2019-05-03 02:00:00+02	1	887	1257	EUR	medium	\N	\N	\N	\N	\N	\N
3397	gn-la-derniere-relique	GN La Dernière Relique	GN inspiré de l'univers Harry Potter	GN inspiré de l'univers Harry Potter	https://www.facebook.com/events/1642307182552466/	0	2019-05-17 02:00:00+02	1	881	1316	EUR	short	\N	\N	\N	\N	\N	\N
3398	gn-disque-monde-les-fondassyons-dune-cytee	GN Disque Monde "Les Fondassyons d'une Cytée"	La ville d’Ankh-Morpork, la plus importante de tout le Disque-Monde, est à un tournant de son histoire. 	La ville d’Ankh-Morpork, la plus importante de tout le Disque-Monde, est à un tournant de son histoire. 	https://www.facebook.com/events/1205546239580461/	7500	2019-06-07 02:00:00+02	1	881	1316	EUR	medium	\N	\N	\N	5500	\N	\N
3399	le-lierre-et-la-vigne	Le Lierre et la Vigne	GN queer sur la création artistique et les relations polyamoureuses	GN queer sur la création artistique et les relations polyamoureuses	https://docs.google.com/forms/d/e/1FAIpQLSfpIRh2o2l9N72I12l20VxbLYnnPsJFwnAZME7hYiXo_fLj3w/viewform	5500	2019-10-19 02:00:00+02	1	1107	1141	EUR	medium	\N	\N	\N	\N	\N	\N
3400	le-lierre-et-la-vigne	Le Lierre et la Vigne	GN queer sur la création artistique et les relations polyamoureuses	GN queer sur la création artistique et les relations polyamoureuses	https://docs.google.com/forms/d/e/1FAIpQLSfpIRh2o2l9N72I12l20VxbLYnnPsJFwnAZME7hYiXo_fLj3w/viewform	5500	2019-10-26 02:00:00+02	1	1107	1141	EUR	medium	\N	\N	\N	\N	\N	\N
3401	fairweather-manor-6	Fairweather Manor 6	International Larp (in English): fairweather manor larp stately english	International Larp (in English): fairweather manor larp stately english	https://www.facebook.com/163650214416652	29900	2019-11-22 01:00:00+01	1	1108	1205	EUR	medium	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: backent_api_eventlike; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_api_eventlike (id, event_id, user_id) FROM stdin;
\.


--
-- Data for Name: backent_api_location; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_api_location (id, slug, name, address, coords) FROM stdin;
1040	cocolarp_import-87-bis-rue-saint-andre-59800-lille-france	COCOLARP_IMPORT (87 bis Rue Saint-André, 59800 Lille, France)	87 bis Rue Saint-André, 59800 Lille, France	\N
1041	cocolarp_import-200km-au-nord-de-paris	COCOLARP_IMPORT (200km au nord de Paris)	200km au nord de Paris	\N
1042	cocolarp_import-14-rue-pablo-neruda-62143-angres-france	COCOLARP_IMPORT (14 rue Pablo Néruda, 62143 Angres, France)	14 rue Pablo Néruda, 62143 Angres, France	\N
1043	cocolarp_import-7-rue-de-guemappe-62156-boiry-notre-dame-france	COCOLARP_IMPORT (7 rue de Guémappe, 62156 Boiry Notre Dame, France)	7 rue de Guémappe, 62156 Boiry Notre Dame, France	\N
1044	cocolarp_import-lansi-suomen-opistoyhdistys-ry-aino-voipion-tie-30-32700-huittinen-finland	COCOLARP_IMPORT (Länsi-suomen Opistoyhdistys Ry, Aino Voipion tie 30, 32700 Huittinen, Finland)	Länsi-suomen Opistoyhdistys Ry, Aino Voipion tie 30, 32700 Huittinen, Finland	\N
1045	cocolarp_import-norberg-sweden	COCOLARP_IMPORT (Norberg, Sweden)	Norberg, Sweden	\N
1047	cocolarp_import	COCOLARP_IMPORT (?)	?	\N
1048	cocolarp_import-78720-dampierre-en-yvelines	COCOLARP_IMPORT (78720 Dampierre-en-Yvelines)	78720 Dampierre-en-Yvelines	\N
1049	cocolarp_import-33210-langon	COCOLARP_IMPORT (33210 Langon)	33210 Langon	\N
1050	cocolarp_import-albinusstrasse-b-4784-st-vith	COCOLARP_IMPORT (Albinusstrasse, B-4784 St Vith)	Albinusstrasse, B-4784 St Vith	\N
1051	cocolarp_import-meiskensbeekstraat-96-1851-grimbergen-belgium	COCOLARP_IMPORT (Meiskensbeekstraat 96, 1851 Grimbergen, Belgium)	Meiskensbeekstraat 96, 1851 Grimbergen, Belgium	\N
1052	cocolarp_import-marmite-vieux-chemin-de-willems-2-7501-tournai-belgium	COCOLARP_IMPORT (Marmite, Vieux Chemin de Willems 2, 7501 Tournai, Belgium)	Marmite, Vieux Chemin de Willems 2, 7501 Tournai, Belgium	\N
1053	cocolarp_import-vof-de-lindenhorst-schiphorsterweg-15-7966-ab-de-schiphorst-netherlands	COCOLARP_IMPORT (V.O.F. De Lindenhorst, Schiphorsterweg 15, 7966 AB De Schiphorst, Netherlands)	V.O.F. De Lindenhorst, Schiphorsterweg 15, 7966 AB De Schiphorst, Netherlands	\N
1054	cocolarp_import-mt-holyoke-college-50-college-st-south-hadley-ma-01075	COCOLARP_IMPORT (Mt. Holyoke College; 50 College St, South Hadley, MA 01075)	Mt. Holyoke College; 50 College St, South Hadley, MA 01075	\N
1055	cocolarp_import-bruly-de-pesche-namur-belgium	COCOLARP_IMPORT (Brûly-De-Pesche, Namur, Belgium)	Brûly-De-Pesche, Namur, Belgium	\N
1056	cocolarp_import-route-du-flaumont-59440-avesnelles-france	COCOLARP_IMPORT (Route du Flaumont, 59440 Avesnelles, France)	Route du Flaumont, 59440 Avesnelles, France	\N
1057	cocolarp_import-boesdalsvej-14-4673-rdvig-stevns-denmark	COCOLARP_IMPORT (Boesdalsvej 14, 4673 Rødvig Stevns, Denmark)	Boesdalsvej 14, 4673 Rødvig Stevns, Denmark	\N
1058	cocolarp_import-club-oasis	COCOLARP_IMPORT (Club Oasis)	Club Oasis	\N
1059	cocolarp_import-3e-vaningen-sockerbruket-9-414-51-goteborg-sweden	COCOLARP_IMPORT (3:e Våningen, Sockerbruket 9, 414 51 Göteborg, Sweden)	3:e Våningen, Sockerbruket 9, 414 51 Göteborg, Sweden	\N
1060	cocolarp_import-95572-saint-ouen-laumone-france	COCOLARP_IMPORT (95572 Saint-Ouen l'Aumône, France)	95572 Saint-Ouen l'Aumône, France	\N
1061	cocolarp_import-the-1908-lodge-711-elmhurst-road-gosport-po12-1pg-united-kingdom	COCOLARP_IMPORT (The 1908 Lodge, 7–11 Elmhurst Road, Gosport, PO12 1PG, United Kingdom)	The 1908 Lodge, 7–11 Elmhurst Road, Gosport, PO12 1PG, United Kingdom	\N
1062	cocolarp_import-ivry-sur-seine	COCOLARP_IMPORT (Ivry sur Seine)	Ivry sur Seine	\N
1063	cocolarp_import-proche-de-80600-doullens-en-picardie	COCOLARP_IMPORT (proche de 80600 Doullens en Picardie)	proche de 80600 Doullens en Picardie	\N
1064	cocolarp_import-the-junction-hotel-60-annerley-rd-annerley-qld-4103-australia	COCOLARP_IMPORT (The Junction Hotel, 60 Annerley Rd, Annerley QLD 4103, Australia)	The Junction Hotel, 60 Annerley Rd, Annerley QLD 4103, Australia	\N
1065	cocolarp_import-92600-asnieres-sur-seine-france	COCOLARP_IMPORT (92600 Asnières-sur-Seine, France)	92600 Asnières-sur-Seine, France	\N
1066	cocolarp_import-chateau-de-la-baronniere-la-chapelle-saint-florent-49410-mauges-sur-loire-france	COCOLARP_IMPORT (Château de la Baronnière, La Chapelle-Saint-Florent, 49410 Mauges-sur-Loire, France)	Château de la Baronnière, La Chapelle-Saint-Florent, 49410 Mauges-sur-Loire, France	\N
1067	cocolarp_import-31700-cornebarrieu-france	COCOLARP_IMPORT (31700 Cornebarrieu, France)	31700 Cornebarrieu, France	\N
1068	cocolarp_import-village-commando-bainville-sur-madon-les-vaines-terres-54390-bainville-sur-madon-france	COCOLARP_IMPORT (Village Commando Bainville sur Madon, Les Vaines Terres, 54390 Bainville-Sur-Madon, France)	Village Commando Bainville sur Madon, Les Vaines Terres, 54390 Bainville-Sur-Madon, France	\N
1069	cocolarp_import-domaine-de-la-roche-florens-24210-terrasson-lavilledieu-france	COCOLARP_IMPORT (Domaine de la Roche-Florens, 24210 Terrasson-Lavilledieu, France)	Domaine de la Roche-Florens, 24210 Terrasson-Lavilledieu, France	\N
1070	cocolarp_import-lycee-auguste-aymard-a-espaly-saint-marcel-pres-du-puy-en-velay	COCOLARP_IMPORT (Lycée Auguste Aymard à Espaly-Saint-Marcel près du Puy-en-Velay)	Lycée Auguste Aymard à Espaly-Saint-Marcel près du Puy-en-Velay	\N
1071	cocolarp_import-follokna-mansion-flen-sweden	COCOLARP_IMPORT (Follökna Mansion, Flen, Sweden)	Follökna Mansion, Flen, Sweden	\N
1072	cocolarp_import-bunker-soratte-00060-santoreste-rome-italy	COCOLARP_IMPORT (Bunker Soratte, 00060 Sant'Oreste Rome, Italy)	Bunker Soratte, 00060 Sant'Oreste Rome, Italy	\N
1073	cocolarp_import-grunewaldvillan-ringvagen-71-133-35-saltsjobaden-stockholm-sweden	COCOLARP_IMPORT (Grünewaldvillan, Ringvägen 71, 133 35, Saltsjöbaden, Stockholm, Sweden)	Grünewaldvillan, Ringvägen 71, 133 35, Saltsjöbaden, Stockholm, Sweden	\N
1074	cocolarp_import-le-heissenstein-67680-nothalten-france	COCOLARP_IMPORT (Le Heissenstein, 67680 Nothalten, France)	Le Heissenstein, 67680 Nothalten, France	\N
1075	cocolarp_import-fort-dans-laisne	COCOLARP_IMPORT (Fort dans l'Aisne)	Fort dans l'Aisne	\N
1076	cocolarp_import-ingestre-hall-staffordshire-england	COCOLARP_IMPORT (Ingestre Hall, Staffordshire, England)	Ingestre Hall, Staffordshire, England	\N
1077	cocolarp_import-sort-en-chalosse	COCOLARP_IMPORT (Sort en Chalosse)	Sort en Chalosse	\N
1078	cocolarp_import-pres-damiens	COCOLARP_IMPORT (Près d'Amiens)	Près d'Amiens	\N
1079	cocolarp_import-rye-kol-ry-denmark	COCOLARP_IMPORT (Rye Kol, Ry, Denmark)	Rye Kol, Ry, Denmark	\N
1080	cocolarp_import-ex-xerox-buildings-milano	COCOLARP_IMPORT (Ex-Xerox buildings, Milano)	Ex-Xerox buildings, Milano	\N
1081	cocolarp_import-dalkarlsbo-in-hedesunda-about-35-kilometers-west-of-tierp-sweden	COCOLARP_IMPORT (Dalkarlsbo, in Hedesunda, about 35 kilometers west of Tierp, Sweden)	Dalkarlsbo, in Hedesunda, about 35 kilometers west of Tierp, Sweden	\N
1082	cocolarp_import-vielsalm-belgium-vielsalm-belgium	COCOLARP_IMPORT (Vielsalm, Belgium, Vielsalm Belgium)	Vielsalm, Belgium, Vielsalm Belgium	\N
1083	cocolarp_import-59610-fourmies-france	COCOLARP_IMPORT (59610 Fourmies, France)	59610 Fourmies, France	\N
1084	cocolarp_import-bissieux	COCOLARP_IMPORT (Bissieux)	Bissieux	\N
1085	cocolarp_import-kopaniec-dolnoslaskie-poland	COCOLARP_IMPORT (Kopaniec, Dolnośląskie, Poland)	Kopaniec, Dolnośląskie, Poland	\N
1086	cocolarp_import-43130-saint-andre-de-chalencon	COCOLARP_IMPORT (43130 Saint André de Chalencon)	43130 Saint André de Chalencon	\N
1087	cocolarp_import-nestle-weg-24376-kappeln-germany	COCOLARP_IMPORT (Nestle-Weg, 24376 Kappeln, Germany)	Nestle-Weg, 24376 Kappeln, Germany	\N
1088	cocolarp_import-a-1h30-de-paris-en-picardie	COCOLARP_IMPORT (à 1h30 de Paris, en Picardie)	à 1h30 de Paris, en Picardie	\N
1089	cocolarp_import-78600-maisons-laffitte-france	COCOLARP_IMPORT (78600 Maisons-Laffitte, France)	78600 Maisons-Laffitte, France	\N
1090	cocolarp_import-rue-du-haut-fourneau-67130-grandfontaine-france	COCOLARP_IMPORT (Rue du Haut Fourneau, 67130 Grandfontaine, France)	Rue du Haut Fourneau, 67130 Grandfontaine, France	\N
1091	cocolarp_import-xaronval	COCOLARP_IMPORT (? Xaronval )	? Xaronval 	\N
1092	cocolarp_import-hotel-elegance-getafe-av-ada-lovelace-23-28906-getafe-madrid-madrid-spain	COCOLARP_IMPORT (Hotel Elegance Getafe, Av. Ada Lovelace, 23, 28906 Getafe, Madrid, Madrid, Spain)	Hotel Elegance Getafe, Av. Ada Lovelace, 23, 28906 Getafe, Madrid, Madrid, Spain	\N
1093	cocolarp_import-region-parisienne	COCOLARP_IMPORT (Région parisienne)	Région parisienne	\N
1094	cocolarp_import-national-highway-340a-kilometer-468-unihay-place-of-the-s-n-04200-tabernas	COCOLARP_IMPORT (National Highway 340ª, kilometer 468 Unihay place of the S / N 04200 Tabernas )	National Highway 340ª, kilometer 468 Unihay place of the S / N 04200 Tabernas 	\N
1095	cocolarp_import-32200-gimont-france	COCOLARP_IMPORT (32200 Gimont, France)	32200 Gimont, France	\N
1096	cocolarp_import-rive-de-gier	COCOLARP_IMPORT (Rive-de-Gier)	Rive-de-Gier	\N
1097	cocolarp_import-baltic-sea	COCOLARP_IMPORT (Baltic Sea...)	Baltic Sea...	\N
1098	cocolarp_import-in-avila-2-hours-from-madrid	COCOLARP_IMPORT (In Ávila 2 hours from Madrid)	In Ávila 2 hours from Madrid	\N
1099	cocolarp_import-youth-hostel-castle-heldrungen-near-erfurt	COCOLARP_IMPORT (Youth Hostel Castle Heldrungen, near Erfurt)	Youth Hostel Castle Heldrungen, near Erfurt	\N
1100	cocolarp_import-mayenne	COCOLARP_IMPORT (Mayenne)	Mayenne	\N
1101	cocolarp_import-villa-s-maria-str-magnana-1-43045-ricco-parma	COCOLARP_IMPORT (Villa S. Maria, Str. Magnana, 1, 43045 Riccò (Parma))	Villa S. Maria, Str. Magnana, 1, 43045 Riccò (Parma)	\N
1102	cocolarp_import-3-5-rue-alphonse-lemerre-canisy-basse-normandie-france	COCOLARP_IMPORT (3-5 rue Alphonse Lemerre Canisy, Basse-Normandie, France)	3-5 rue Alphonse Lemerre Canisy, Basse-Normandie, France	\N
1103	cocolarp_import-26300-chateauneuf-sur-isere-france	COCOLARP_IMPORT (26300 Châteauneuf sur Isère, France)	26300 Châteauneuf sur Isère, France	\N
1104	cocolarp_import-44190-gorges	COCOLARP_IMPORT (44190 Gorges)	44190 Gorges	\N
1105	cocolarp_import-hermitage-leisure-centre-whitwick-silver-street-whitwick-coalville-le67-5eu-united-kingdom	COCOLARP_IMPORT (Hermitage Leisure Centre - Whitwick, Silver street, Whitwick Coalville LE67 5EU United Kingdom)	Hermitage Leisure Centre - Whitwick, Silver street, Whitwick Coalville LE67 5EU United Kingdom	\N
1106	cocolarp_import-a-camp-near-madrid-albergue-sierra-norte-mangiron	COCOLARP_IMPORT (a camp near Madrid, Albergue Sierra Norte Mangirón)	a camp near Madrid, Albergue Sierra Norte Mangirón	\N
1107	cocolarp_import-53640-champeon-mayenne	COCOLARP_IMPORT (53640 Champéon (Mayenne))	53640 Champéon (Mayenne)	\N
1108	cocolarp_import-zamek-moszna-poland	COCOLARP_IMPORT (Zamek Moszna, Poland)	Zamek Moszna, Poland	\N
926	centre-social-de-cusset	Centre Social de Cusset	87-89 Rue Pierre Voyant, 69100 Villeurbanne	0101000020E6100000C3B645990D9A13400F46EC1340E24640
927	fort-de-chateau-lambert-la-tete-de-lours	Fort de Château-Lambert - la Tête de l'Ours	70440 Le Haut-du-Them	0101000020E6100000FB35FEE9ABE01A405318A5958CEB4740
928	la-citadelle-des-anges	La Citadelle des Anges	La Roche, 72220 Teloché	0101000020E61000009C584C1185BBD13F4CA4349BC7F04740
929	maison-familiale-rural-education-orientation	Maison Familiale Rural Education Orientation	Mange, 72360 Verneil-le-Chétif	0101000020E6100000270120DDBEFDD33F9A7B48F8DEDC4740
930	mjc-jacques-prevert	MJC Jacques Prévert	97 Grande Rue, 72000 Le Mans	0101000020E61000005BD1E638B709C93F78301812E6004840
931	grand-gite-de-la-poterie	Grand Gîte de la Poterie	Lieu dit La Poterie, 72350 Saint-Denis-d'Orques	0101000020E6100000C619C39CA04DD1BF5EA27A6B60034840
932	fort-de-montperche	Fort de Montperché	73220 Aiton	0101000020E6100000B7007ED7315F50C022D85D45EBDD4640
933	essert-la-pierre	Essert la Pierre	74430 Saint-Jean-d'Aulps	0101000020E610000062F71DC3639F1A40A9A10DC0061E4740
934	aux-petits-joueurs	Aux Petits Joueurs	59 Rue de Mouzaïa, 75019 Paris	0101000020E6100000928433AE6E2B0340EDC5504EB4704840
935	brasserie-le-prelude	Brasserie Le Prélude	3 Rue Meyerbeer, 75009 Paris	0101000020E6100000D6CF51FD39AB02402D16759C916F4840
936	dernier-bar-avant-la-fin-du-monde	Dernier Bar avant la Fin du Monde	19 avenue Victoria, 75001 Paris	0101000020E6100000EBA9D55757C5024036CD3B4ED16D4840
937	ipn-paris	IPN Paris	23 rue Mouffetard, 75005 Paris	0101000020E61000003C1F5498ADCB0240E778BB140D6C4840
938	le-macareux	Le Macareux	15 Rue du Croissant, 75002 Paris	0101000020E61000004B523EA99BC00240911557F0366F4840
939	centre-paris-anim-montparnasse	Centre Paris Anim' Montparnasse	26 allée du Chef d’escadron de Guillebon, Jardin Atlantique, 75014 Paris	0101000020E61000006AE3F49AC39A0240B147F2A66C6A4840
940	abbaye-de-jumieges	Abbaye de Jumièges	Parc naturel régional des Boucles de la Seine Normande, 24 Rue Guillaume le Conquérant, 76480 Jumièges	0101000020E610000079F18F08D72DEA3F2CE395DA41B74840
941	asgard-waaagh-taverne	Ásgard (Waaagh Taverne)	8 rue Saint Denis, 76000 Rouen	0101000020E6100000C5B01E526789F13F6004430C2AB84840
942	le-qg-des-avenjoueurs	Le QG des Avenjoueurs	18 rue des Fossés Louis VIII, 76000 Rouen	0101000020E6100000ECCEC941BF85F13F84210615B0B84840
943	maison-st-sever	Maison St Sever	10 Rue Saint-Julien, 76100 Rouen	0101000020E61000004AB72572C159F13FD06A37B00BB74840
944	domaine-des-hellandes	Domaine des Hellandes	Les Hellandes, 76280 Angerville-l'Orcher	0101000020E6100000ECDB4944F817D13F857B65DEAAC94840
945	chateau-de-la-grange-le-roi	Château de la Grange le Roi	77166 Grisy-Suisnes	0101000020E610000034A1496249590540419FC893A4574840
946	comite-de-quartier-du-vieux-conflans	Comite de Quartier Du Vieux Conflans	4 Place de l'Église, 78700 Conflans-Sainte-Honorine	0101000020E6100000E7F5717ED4C000408DA5FE30F87E4840
947	terrain-dama-france-airsoft	Terrain d'AMA France Airsoft	37 Route de Lainville, 78440 Montalet-le-Bois	0101000020E6100000FE2955A2EC2DFD3FA9B008B42A864840
948	chateau-de-vermette	Château de Vermette	79300 La Chapelle Gaudin	0101000020E6100000408F07115F5CD8BF21E527D53E774740
949	le-prieure-dauthie	Le Prieuré d’Authie	10, rue de l'abbaye, 80560 Authie	0101000020E6100000E7BFACF5EAE803408A9C7411950F4940
950	gite-de-labbaye-le-prieure-dauthie	Gite de l'Abbaye (Le Prieuré d'Authie)	10 Rue de l'Abbaye 80560 Authie	0101000020E6100000E7BFACF5EAE803408A9C7411950F4940
951	auberge-de-jeunesse-damiens-fuaj	Auberge de jeunesse d'Amiens - FUAJ	30 square friant les 4 chênes, 80000 Amiens	0101000020E610000023ED90AC0D3F0240D1D446D0F3F14840
790	ile-de-chambod	Île de Chambod	2947 Route du Port, 01250 Hautecourt-Romanèche	0101000020E6100000013ED3A645B815401FA4028294104740
791	base-de-loisirs-chambod-merpuis	Base de loisirs Chambod-Merpuis	Chambod, 01250 Hautecourt-Romanèche	0101000020E61000005BECF65965B61540D061BEBC00114740
792	domaine-du-petit-chambard	Domaine du petit Chambard	route de St Triviers, 01480 Villeneuve	0101000020E6100000454772F90F5913407768588CBA024740
793	fort-lecluse	Fort L'Ecluse	Parc naturel régional du Haut-Jura, Route de Genève - Longeray, 01200 Léaz	0101000020E6100000D213967840891740EF92382BA20C4740
794	abbaye-notre-dame-de-longpont	Abbaye Notre-Dame de Longpont	2 Place de l'Abbaye, 02600 Longpont	0101000020E610000095BB2AAB44C40940FFCAEFD9DFA24840
795	fort-de-bruyeres	Fort de Bruyères	02860 Bruyères-et-Montbérault	0101000020E6100000F7F36DC1525D0D40427C60C77FC34840
796	fort-de-laniscourt-fort-de-mons-en-laonnois	Fort de Laniscourt (Fort de Mons en Laonnois)	02000 Mons-en-Laonnois	0101000020E610000056E20165536E0C4042CF66D5E7C44840
797	centre-de-vacances-lpm-biabaux	Centre de vacances LPM Biabaux	Parc Naturel régional du Luberon, Chemin de Biabaux, 04870 Saint Miche l'Observatoire	0101000020E6100000832EE1D05BDC1640BCE7C07284F44540
798	monastere-de-segries	Monastère de Ségries	Parc naturel régional du Verdon, Route Riez, 04360 Moustiers-Sainte-Marie	0101000020E6100000D5BD4EEACBE21840DAA8F34D3FEC4540
799	gite-des-sauvas	Gîte des Sauvas	05400 Montmaur	0101000020E6100000F73C7FDAA87E174047AF06280D494640
800	association-villages-des-jeunes	Association Villages des Jeunes	Vaunières, 05140 Saint-Julien-en-Beauchêne	0101000020E6100000DF0731E1E19F1640ECA694D74A514640
801	fort-de-rimplas	Fort de Rimplas	Route de la Madeleine, 06420 Rimplas	0101000020E61000004D733CB02D851C400C27C4B70B084640
802	chateau-de-riveneuve-du-bosc	Château de Riveneuve du Bosc	09100 Pamiers	0101000020E6100000D714C8EC2CBAF93F160FEF39B08E4540
803	gite-de-bois-gerard-bois-gerard	Gîte de Bois Gérard Bois Gérard	10130 Chessy-les-Prés	0101000020E610000063A4DE53394D0F402D185C7347034840
804	college-prive-saint-martin	Collège privé Saint Martin	Avenue de la gare 12800 Naucelle	0101000020E610000098665F1ED7CB0240F897384DFA184640
805	le-bourg	Le Bourg	12230 La Couvertoirade	0101000020E610000046B1DCD26A880A405A0EF450DBF44540
806	lycee-saint-gabriel	Lycée Saint Gabriel	8 boulevard Emile Borel, 12400 Saint-Affrique	0101000020E6100000C2209F46101D07403360DA8184FA4540
807	centre-eedf-du-hameau-de-becours	Centre EEDF du Hameau de Bécours	12520 Verrieres, Hameau de Becours	0101000020E61000005D876A4AB24E08403C670B08AD1D4640
808	agcajup-centre-dauriol-eclaireurs-unionistes-de-france	AGCAJUP Centre D’Auriol Eclaireurs Unionistes De France	1123 Chemin Saint-Francet, 13390 Auriol	0101000020E6100000FBBF3456AC9B164086CB852579AE4540
809	centre-aere-de-couteron	Centre Aéré de Couteron	80 Rue Yvette Bonnard, 13100 Aix-en-Provence	0101000020E6100000416326512FC81540E61192BBBECC4540
810	le-cimetiere-de-la-bouilladisse	Le Cimetiere de la Bouilladisse	13720 La Bouilladisse	0101000020E6100000997631CD745F16404E27D9EA72B24540
811	ferme-descures	Ferme d'Escures	Lieu-dit Escures, 14770 Saint-Jean-le-Blanc	0101000020E610000096CEE2207C6F2240D5AA025A5F9D4840
812	chateau-de-saint-martin-du-chene-tour-de-saint-martin	Château de Saint-Martin-du-Chêne (Tour de Saint-Martin)	Le Pâquier, 1415 Molondin	0101000020E61000000A8C063AA40A1B4047F24BB32F634740
813	ferme-lemarchand	Ferme Lemarchand	Grande Rue, 14880 Hermanville-sur-Mer	0101000020E6100000ED4ACB48BD27D4BF795E85EF58A44840
814	refuge-du-bois-des-brigands	Refuge du Bois des Brigands	1410 Thierrens	0101000020E6100000AA674128EF031B4031A53F451F5A4740
815	coriobona	Coriobona	Village gaulois, Le pont Binot, 16500 Esse	0101000020E6100000AADC9FE63F7F52C0F4BE96FCF45B4440
816	local-du-cercle-des-compagnons-doniros-au-dessus-de-lecole	Local du Cercle des Compagnons d'Oniros (au dessus de l'école)	13 rue de la Liberté, 18510 Menetou Salon	0101000020E61000005A7F4B00FEE9034040683D7C999D4740
817	chateau-de-bannegon	Château de Bannegon	18210 Bannegon	0101000020E6100000F98557923CB705401D1EC2F869664740
818	route-de-menetou-salon	Route de Menetou-Salon	18110 Pigny	0101000020E61000006265D938079403403E941E3CC9954740
819	gite-de-boconnec	Gîte de Boconnec	22110 Plouguernével	0101000020E61000008E3C1059A4090AC0BDC458A65F1E4840
820	chateau-de-bienassis	Château de Bienassis	22430 Erquy	0101000020E61000000B5EF415A4B903C016BDF84784504840
821	etang-de-bosny	Étang de Bosny	Bosny, 22330 Saint-Gilles-du-Mène	0101000020E6100000AD342905DD7E04C0F593313ECC1E4840
822	domaine-aubepeyre	Domaine Aubepeyre	23460 Saint Yrieix la Montagne	0101000020E6100000A5A487A1D529004064027E8D24F14640
823	chateau-de-puyferrat	Château de Puyferrat	24110 Saint-Astier	0101000020E6100000C173EFE192E3E03F2AA8A8FA95924640
824	le-moulin-de-lavaure	Le Moulin de Lavaure	Mauzens-Miremont, 24260 Le Bugue	0101000020E6100000449737876BB5ED3F506859F78F754640
825	fort-de-mont-bart	Fort de Mont-Bart	32 rue du mont bart, Rue du Mont Bart, 25550 Bavans	0101000020E6100000A7751BD47EEB1A40240B98C0ADBD4740
826	le-grand-kursaal	Le Grand Kursaal	2 Place du théâtre, 25000 Besançon	0101000020E610000052D96619981B18400302F8020E9E4740
827	musee-du-temps-de-besancon	Musée du Temps de Besançon	96, grande Rue, 25000 Besançon	0101000020E6100000FF8E4D976A1B1840110D9C7D2F9E4740
828	chateau-de-valclerieux-ceneric	Chateau de Valclérieux Ceneric	330 Route du Château, 26350 Saint-Bonnet de Valclérieux	0101000020E610000032E197FA79931440D237691A14994640
829	chateau-de-saint-bonnet-de-valclerieux-ceneric	Château de Saint Bonnet de Valclérieux Ceneric	26350 Saint-Bonnet-de-Valclérieux	0101000020E610000032E197FA79931440D237691A14994640
830	chemin-des-scouts	Chemin des Scouts	26160 Pont-de-Barret	0101000020E6100000F0EA0BD7590B144041F2CEA10C4D4640
832	lieu-dit-les-marteilles	Lieu-dit Les Marteilles	81630 Montdurausse	0101000020E6100000A2D11DC4CE14F93F31B43A3943F94540
833	chateau-de-bosc-fere	Château de Bosc-Féré	27370 Le Thuit-Signol	0101000020E61000004E9CDCEF5014EE3F6C0723F609A24840
834	chateau-de-carsix	Château de Carsix	3 Rue Gustave Heon, 27300 Carsix	0101000020E6100000A04D0E9F7462E53F7C3F90172D924840
835	chateau-de-cernay	Château de Cernay	27330 Bois-Anzeray	0101000020E6100000DEEA39E97DE3E53FAA99B51490764840
836	domaine-de-conde	Domaine de Condé	5 Le Parc du Château, 27160 Condé-sur-Iton	0101000020E6100000F4FCC45CADEEEE3FE65B1FD61B6A4840
837	abbaye-notre-dame-de-fontaine-guerard	Abbaye Notre-Dame de Fontaine-Guérard	CD 714, 27380 Radepont	0101000020E61000006C770FD07D39F53F30630AD638AD4840
838	lieu-dit-en-pamios	Lieu-dit En Pamios	81470 Mouzens	0101000020E610000089EDEE01BA2FFE3F0FED6305BFC34540
839	manoir-de-portejoie	Manoir de Portejoie	10 Route de Port Pinche, 27430 Porte-Joie	0101000020E61000008D0B0742B220F43F36069D103AA14840
840	lieu-dit-keruscar	Lieu-dit Keruscar	29640 Lannéanou	0101000020E6100000E2CCAFE600610DC085BF5FCC963E4840
841	chateau-de-montalet	Château de Montalet	30410 Molières-sur-Cèze	0101000020E6100000C30DF8FC30A21040DC48D92269214640
842	chemin-des-poissonniers	Chemin des Poissonniers	30620 Uchaud	0101000020E6100000240A2DEBFE111140CADFBDA3C6E04540
843	centrale-7	Centrale 7	Rue du Carreau de Bois II, 49500 Nyoiseau	0101000020E6100000C5C37B0E2C47EDBF0B7BDAE1AFDB4740
844	salle-polyvalente-ancienne-chapelle	Salle polyvalente (ancienne chapelle)	18 grande rue Saint Michel, 31400 Toulouse	0101000020E6100000FEC2E1BB832EF73F02092F66F0CA4540
845	blastodice	Blastodice	52 avenue Honoré Serres, 31000 Toulouse	0101000020E6100000B3A72E2AF300F73F28D9452CBDCE4540
846	ferme-du-prat-mau-salles-jerome	Ferme du Prat Mau - Salles Jérôme	31460 Caraman	0101000020E610000066A8E562271C6340420A9E42AEAC3DC0
847	theatre-du-pave	Théatre du Pavé	34 rue Maran, 31400 Toulouse	0101000020E610000043A04495AB29F73F479A2E7A5DCA4540
848	espace-de-developpement-de-limaginaire-ludique	Espace de Développement de l'Imaginaire Ludique	5 Place Sainte-Eulalie, 33000 Bordeaux	0101000020E6100000D85EB0C0FC7AE2BF525D65129A6A4640
849	hameau-du-jounie	Hameau du Jounie	34330 Le Soulié	0101000020E610000033F9669B1B93F73F263ACB2C428B4640
850	lheure-du-jeu	L'Heure du Jeu	11 Boulevard Magenta, 35000 Rennes	0101000020E6100000653B3A0900C9FABF9EACBDF49B0D4840
851	le-logis-de-la-cornillere	Le Logis de la Cornillère	La Cornillère, 35750 Iffendic	0101000020E610000057FEC6E8CA0100C09AD4E132B80A4840
852	maison-de-quartier-francisco-ferrer	Maison de Quartier Francisco Ferrer	40 Rue Montaigne, 35200 Rennes	0101000020E610000014E97E4E417EFABF75E44867600C4840
853	les-champs-libres	Les Champs Libres	10 cours des Alliés, 35000 Rennes	0101000020E6100000EDE016E247CBFABF88612C78760D4840
854	fort-de-saint-pere-saint-pere	Fort De Saint Pere Saint-Père	35430 Saint Père Marc En Poulet	0101000020E6100000368FC360FECAFEBF3CFA5FAE454B4840
855	letoile-bleue-ancienne-maison-close	L'Étoile Bleue Ancienne Maison Close	15 Rue du Champ de Mars, 37000 Tours	0101000020E6100000D8A0E52FE39CE53FD6F37F5880B24740
856	ferme-equestre-de-by	Ferme Equestre de By	38510 Courtenay	0101000020E61000008B4A8F4B01D96540863364E190A544C0
857	fort-de-comboire	Fort de Comboire	38640 Claix	0101000020E6100000A8A44E4013B1164067ED5B525A8F4640
858	salle-de-la-roche-saint-bueil	Salle de la Roche Saint Bueil	38620 Saint Bueil	0101000020E61000001E300F99F2C11640D6E429ABE9BC4640
859	mfr-de-saint-barthelemy	MFR de Saint-Barthélémy	70 route de Marcollin 38270 Saint-Barthelemy	0101000020E610000084D1072692531440A3B7D33142AC4640
860	chateau-daon	Château d'Aon	40190 Hontanx	0101000020E61000000EA2B5A2CD71D1BFD4298F6E84E94540
861	chateau-de-chemery	Château de Chémery	41700 Chémery	0101000020E610000083FC6CE4BAA9F73FF1129CFA40AC4740
862	domaine-des-bois-argentes-la-ferme-de-saugirard	Domaine des Bois Argentés (La Ferme de Saugirard)	41200 Prunier En Sologne	0101000020E61000001F2C634337BBFA3FCFBEF2203DA94740
863	gite-de-beaulieu	Gîte de Beaulieu	Beaulieu, 41170 Le Plessis-Dorin	0101000020E61000000DD70F560810EC3FD1AF6312E40B4840
864	chalets-du-haut-forez	Chalets du Haut Forez	Le Plan D'eau, Route D'apinac, 42550 Usson-en-Forez	0101000020E6100000D7FA22A12D870F4076887FD8D2B14640
865	prefabrique-de-linnovation	Préfabrique de l'innovation	5 rue Javelin Pagnon,  42100 Saint-Etienne, Paris	0101000020E6100000D87A2BB759D10240DCA50D87A56D4840
866	chateau-de-marcou	Château de Marcou	Marcoux, 43290 Montregard	0101000020E6100000CA2544AFF573114060178F9C96924640
867	la-carriere	La Carrière	Le Bellion, 44460 Fégréac	0101000020E610000064FA6F6FC8B000C0527A4BDEA5CC4740
868	maison-des-jeux-de-nantes	Maison des Jeux de Nantes	14 rue Michel Rocher, 44200 Nantes	0101000020E6100000EBFF1CE6CBCBF8BF9A119491699A4740
869	salle-polyvalente-de-moisdon	Salle polyvalente de Moisdon	44520 Moisdon-La-Rivière	0101000020E61000008751103CBEFDF5BF769ACC785BCF4740
870	le-big-ben	Le Big Ben	1 rue Kervégan, 44000 Nantes	0101000020E6100000C6A354C213DAF8BFA0197A7A5B9B4740
871	chateau-de-vaulfin	Chateau de Vaulfin	Vaulfin, 45320 Courtenay	0101000020E6100000198AE024726608405AB45B261EFF4740
872	donry-beach	Don'ry Beach	45450 Donnery	0101000020E61000005F7F129F3BE100401F84807C09F54740
873	hameau-du-manoir-de-la-gabertie	Hameau du Manoir de La Gabertie	La Gabertie, 47370 Thézac	0101000020E6100000025130630AD6EF3FB34291EEE7364640
874	chateau-de-saint-loup-en-albret	Château de Saint Loup en Albret	47600 Montagnac-sur-Auvignon	0101000020E6100000E449D235936FDD3FCCD3B9A294144640
875	chevalerie-de-sace-site-archeologique-jardin-botanique	Chevalerie de Sacé - Site Archéologique & Jardin Botanique	1 rue du vieux logis, 49650 Brain-Sur-Allonnes	0101000020E6100000369FDF9CB6EBB03F2B8991CAB9A64740
876	chateau-de-serrant	Château de Serrant	49170 Saint-Georges-sur-Loire	0101000020E610000084D0E6DDFD56E8BFFD9600FC53B44740
877	chateau-des-loges	Château des Loges	49017 Baracé	0101000020E61000001E15A4BED14747C0912D2691D88137C0
878	club-des-conjures-du-temporel-derriere-la-spa	Club des Conjurés du Temporel (derrière la SPA)	Promenade de la Baumette, 49000 Angers	0101000020E6100000EFC38BCFAE4CE2BFFB5FBF7163BA4740
879	lieu-dit-ladeziere	Lieu dit L'Adezière	route de l'Adezière, 49240 Avrillé	0101000020E6100000F8945286608BE3BF4A3F863364C04740
880	chateau-de-reveillon	Château de Réveillon	1 rue du Château, 51310 Réveillon	0101000020E610000075ABE7A4F79D0B405FCBD01D69604840
881	fort-de-montbre	Fort de Montbré	51500 Taissy	0101000020E6100000778192020B601040A36B26DF6C9B4840
882	fort-du-cognelot-fort-vercingetorix	Fort du Cognelot (Fort Vercingetorix)	52600 Chalindrey	0101000020E610000097FBE42840B41540B4E4F1B4FCE64740
883	site-de-bel-air-village-vacances-et-nature	Site de Bel Air (Village Vacances et Nature)	Saint-Charles-la-Forêt 53170	0101000020E6100000B95164ADA1D4E1BF4BAC8C463EF54740
884	chateau-du-bourg	Château du Bourg	8 Rue du Maine, 53500 Saint-Denis-de-Gastines	0101000020E6100000FA8AC9761959EBBFE4F96761AA2B4840
885	echologia	Echologia	Bas Barbé, 53950 Louverné	0101000020E61000004089CF9D60FFE6BF449C4EB2D50D4840
886	le-bois-du-tay-gite-du-bois-du-tay	Le Bois du Tay (Gîte du Bois du Tay)	Le Bois du Tay La Croix du Hêtre, 53160 Hambers	0101000020E610000030CA7DBC211D55C0A42C431CEBBA4040
887	domaine-du-denais	Domaine du Denais	Lieu-dit Denais, 53290 Saint-Denis-d'Anjou	0101000020E6100000C419C39CA04DDCBFA47213B534E54740
889	fort-event-fort-aventure	Fort Event (Fort Aventure	Fort Pélissier, Les Vaines Terres), 54550 Bainville-sur-Madon	0101000020E61000000CFE7E315B62184013F3ACA4154B4840
890	fort-de-jouy-sous-les-cotes	Fort de Jouy-sous-les-côtes	Parc Naturel Régional de Lorraine, 55200 Geville	0101000020E6100000232A9EC43184164040F5B468A6614840
891	base-de-loisirs-letang-daleth	Base de loisirs L'Étang d'Aleth	56380 Saint-Malo-de-Beignon	0101000020E6100000BD8C62B9A53501C0E2B034F0A3FA4740
892	camp-du-dragon	Camp du Dragon	19 Rue de la Quintaine, 56430 Saint-Brieuc-de-Mauron	0101000020E61000003DBA22426DE502C0D9FFA5B1620B4840
893	chateau-de-lutzelbourg	Château de Lutzelbourg	31 Rue du Canal, 57820 Lutzelbourg	0101000020E61000006F35A1FFD4061D4078859911395E4840
894	chateau-saint-sixte	Château Saint Sixte	Rue du château, 57320 Freistroff Moselle	0101000020E6100000B073D3669CF61940213CDA3862A34840
895	bibliotheque-universitaire-lille-3	Bibliotheque Universitaire Lille 3	59650 Villeneuve-d'Ascq	0101000020E610000061794611083A094055FBCFF5D8504940
896	dernier-bar-avant-la-fin-du-monde-lille	Dernier Bar avant la Fin du Monde Lille	12 rue de Pas, 59800 Lille	0101000020E610000091C88855CD7D0840D1C43BC093514940
897	dame-c	Dame C	33 rue des Bouchers, 59800 Lille	0101000020E61000005B75C2F0B677084045489341A4514940
898	maison-des-etudiants	Maison des Etudiants	Université Lille 1, Avenue Carl Gauss, 59650 Villeneuve-d'Ascq	0101000020E610000061794611083A094055FBCFF5D8504940
899	le-biplan	Le Biplan	19 Rue Colbert, 59000 Lille	0101000020E6100000CE8A5EFC23620840DF5740FC57504940
900	chateau-de-chambly	Château de Chambly	rue d'Amblaincourt, 60230 Chambly	0101000020E61000000307B47405DB014065E1EB6B5D944840
901	mines-du-roi-nain	Mines du Roi Nain	9 Rue du Four À Chaux, 60740 Saint-Maximin	0101000020E6100000CCECF318E5790340BD5E5095A59B4840
902	gite-du-domaine-de-pont-ramond	Gîte du Domaine de Pont-Ramond	Pont Ramond, 61100 La Chapelle-au-Moine	0101000020E61000009A40118B18B6E2BFDF46CA1649594840
903	energie-paintball	Energie Paintball	lieu-dit Grande Vienne, 61210 Putanges	0101000020E6100000C4978922A46ECFBF1BD5E940D6614840
904	la-nuit-magique	La Nuit Magique	16 rue de Pernes, 62550 Bailleul-lès-Pernes	0101000020E6100000C933C3A1122203408ADD8838E7404940
905	chateau-de-ravel	Château de Ravel	63190 Ravel	0101000020E6100000B6943D5379D753C0B832F2C352E54540
906	chateau-de-saint-cirgues	Château de Saint Cirgues	63320 Saint-Cirgues-sur-Couze	0101000020E6100000899AE8F351260940E6F560527CC64640
907	gites-helio-ferme	Gites Hélio-Ferme	La Roche, 63490 Brousse	0101000020E6100000B537F8C264CA0B40139ED0EB4FCC4640
908	centre-eedf-du-domaine-de-la-planche	Centre EEDF du Domaine de la Planche	63250 Viscomtat	0101000020E61000009B5775560B6C0D4076DF313CF6E94640
909	chartreuse-de-port-sainte-marie	Chartreuse de Port-Sainte-Marie	63230 Chapdes-Beaufort	0101000020E6100000CC2A6C06B8E006401D93C5FD47F24640
910	centre-eedf-du-cambre-daze	Centre EEDF du Cambre d'Aze	29 Las Creus, 66210 Saint-Pierre-dels-Forçats	0101000020E610000015B82BAA34080140AF6E06C94C3F4540
911	prieure-de-marcevol	Prieuré de Marcevol	Hameau Marcevol, 66320 Arboussols	0101000020E6100000774EB340BBE303402BDB87BCE5544540
912	aahj	AAHJ	38 Route de Schirmeck, 67200 Strasbourg	0101000020E610000027F801A326E51E409F7829D082494840
913	phare-de-lill	Phare de l'Ill	29 Rue du Général Libermann, 67400 Illkirch-Graffenstaden	0101000020E61000008AB6195D94DF1E40FEC5223C90424840
952	centre-eedf-de-foucheval	Centre EEDF de Foucheval	81000 Pampelonne	0101000020E61000003510CB660ED91240F7B6990AF1604640
953	chateau-de-goudourville	Château de Goudourville	Lieu dit Le Pech, 761, Chemin du Château, 82400 Goudourville	0101000020E61000002E73BA2C26B6ED3FCC0D863AAC0E4640
954	chateau-de-lavalade	Château de Lavalade	4048 route de l'Aérodrome, 82100 Castelsarrasin	0101000020E610000066F3DD52731EF23FBD9580F33D0B4640
955	les-terres-de-saint-hilaire	Les Terres de Saint-Hilaire	RD3, 83470 Ollières	0101000020E6100000C0594A9693501740B743C362D4BD4540
956	chateau-de-lenvironnement-du-parc-du-luberon	Château de l'Environnement du Parc du Luberon	Parc Naturel régional du Luberon, Col du Pointu, 84480 Buoux	0101000020E61000004BCB48BDA782154037FFAF3A72EA4540
957	chateau-de-commequiers	Château de Commequiers	Impasse des Tours, 85220 Commequiers	0101000020E6100000C62066E54D54FDBFD99EB4CB12624740
958	hotel-lodges	Hôtel Lodges	Domaine de la Boulaie, La Boulaie, 85590 Treize-Vents, Pays De La Loire	0101000020E61000005C08CD09351ED5BF5DC9E946B3E14740
959	gite-lancienne-ferme	Gîte L'Ancienne Ferme	85450 Chaillé les Marais	0101000020E6100000EE7893DFA253F0BF508F6D1970324740
960	la-melusine	La Mélusine	86600 Cloué	0101000020E6100000B4D6AB23A28256C0A4576F7951FA3D40
961	domaine-le-stat	Domaine le Stat	88530 Le Tholy	0101000020E6100000658522DDCFF91A40F4FE3F4E980A4840
962	moulin-de-vanneau	Moulin de Vanneau	89520 Saints-en-Puisaye	0101000020E610000013342DB1321A0A4086E2337E86CF4740
963	maison-familiale-de-villevallier	Maison Familiale de Villevallier	25 Rue Verdeau, 89330 Villevallier	0101000020E61000000EB2762513810A400AACD2CC49034840
964	cafe-de-la-poeterie	Cafe De La Poèterie	4 Route des Janets, 89520 Saint-Sauveur-en-Puisaye	0101000020E61000000F7D772B4BB409406C4C88B9A4CE4740
965	fort-de-vezelois	Fort de Vézelois	Fort Ordener, Rue de Meroux, 90400 Vézelois	0101000020E610000009E6E8F17BAB1B4008C89750C1CD4740
966	locaux-depitech	Locaux d'Epitech	24 Rue Pasteur, 94270 Le Kremlin-Bicêtre	0101000020E610000054B59377C4E7024012FD35B45C684840
967	epita-campus-paris-villejuif	EPITA Campus Paris Villejuif	66 rue Guy Moquet, 94800 Villejuif	0101000020E6100000D177C8DE9CDB0240B031F9B028664840
968	sanatorium-daincourt	Sanatorium d'Aincourt	95510 Aincourt	0101000020E6100000D120054F2157FC3F4089CF9D60894840
969	cormeilles-ludiques	Cormeilles Ludiques	Salle Café-Jeux, Rond-Point du 8 mai, 95240 Cormeilles-en-Parisis	0101000020E61000004B92E7FA3E9C014021E7FD7F9C7C4840
970	schloss-kobersdorf	Schloss Kobersdorf	7332 Kobersdorf	0101000020E610000071F5AD20176430403267C7574CCC4740
971	le-terrain-de-jalhay	Le terrain de Jalhay	Arbespine 51, 4845 Jalhay	0101000020E6100000FFCE9B2F9B8D1740EEE478AAE8424940
972	chateau-la-tourelle-chateau-peltzer	Château La Tourelle (Château Peltzer)	Rue Grétry 1, 4800 Verviers	0101000020E61000000E3CAD91136C174003F85DC76E4A4940
973	college-saint-michel	Collège Saint-Michel	Boulevard Saint-Michel 24, 1040 Etterbeek	0101000020E61000002B7F6374E5A011408B620333F06A4940
974	de-winner-hopper-jeugdverblijf	De Winner-Hopper jeugdverblijf	Winnerstraat 40, 3900 Overpelt	0101000020E6100000D584590D2E8A15402634EE72B6964940
975	ecam-ecole-centrale-des-arts-et-metiers	ECAM (École centrale des arts et métiers)	Promenade de l'Alma 50, 1200 Woluwe-Saint-Lambert	0101000020E6100000877D96427BD01140066344A2D06C4940
976	fort-de-hollogne	Fort de Hollogne	4460 Grâce-Hollogne	0101000020E6100000BB0F406A13E71540A9DE1AD82A514940
977	les-fauvettes	Les Fauvettes	YWCA de Louette-St-Pierre, Route de la Malcampée 127, 5575 Louette-St-Pierre	0101000020E6100000BDC62E51BDB51340FB3F87F9F2FA4840
978	rue-du-sartis-3	Rue du Sartis 3	7350 Hensies	0101000020E6100000931337B8BE790D40FBAC32535A374940
980	castel-notre-dame	Castel Notre-Dame	Obsinnich 6, 3791 Fourons	0101000020E6100000AD7598E5A18517400FAA1E7A9C5D4940
981	chateau-de-halloy	Chateau de Halloy	37 Route du Château d'Halloy, 5590 Ciney	0101000020E61000007171546EA276144032DAAA24B2274940
982	chateau-de-hollogne	Château de Hollogne	Rue de Bierset 6, 4460 Grâce-Hollogne	0101000020E6100000523EA99B30DE154084D0E6DDFD514940
983	zricenina-hradu-rabstejn-nad-strelou	Zřícenina hradu Rabštejn nad Střelou	Rabštejn nad Střelou 2, 331 62 Manětín	0101000020E61000006694788A66772A40C55AD7C3F2FE4840
984	valec-castle	Valeč Castle	Karlovarská, 364 55 Valeč	0101000020E610000075159C0B6D0151C045B12660854D2440
985	castle-jezeri-zamek-jezeri	Castle Jezeří - Zámek Jezeří	435 43 Horní Jiřetín	0101000020E6100000A9B816D286082B40D287D3EEFC484940
986	zamek-usobi	Zámek Úsobí	Úsobí 1, 582 54 Úsobí, Vysočina	0101000020E6100000A2A135F570A82F40285E0AB4E0E14840
987	efterskolen-epos	Efterskolen Epos	Færgevej 5, 6440 Augustenborg	0101000020E6100000DE3422BD4DF423402B8AB2124E7E4B40
988	kronborg-castle-elsinor	Kronborg Castle (Elsinor)	Kronborg 2C, 3000 Helsingør	0101000020E6100000E96514CB2D3D29400AF8359204054C40
989	komediehuset	Komediehuset	Over gården, Skolegade 7, 8700 Horsens	0101000020E610000022F54311F7B12340DF5ADC35D7ED4B40
990	haus-einschlingen	Haus Einschlingen	Schlingenstraße 65, 33649 Bielefeld	0101000020E61000003271AB2006F62040255AA8EB3F014A40
991	rittergut-brokeloh	Rittergut Brokeloh	Rittergut Brokeloh 1, 31628 Landesbergen	0101000020E610000040F163CC5D6B22407407B13385464A40
992	ortenberg-castle	Ortenberg Castle	77799 Ortenberg	0101000020E610000097587446EFBF204092933FCEEA7E4840
993	ostello-modena-san-filippo-neri	Ostello Modena San Filippo Neri	Via Sant'Orsola, 48, 41100 Modena MO	0101000020E6100000CFBD874B8EDB254074A14D6958534640
994	kasteel-wijenburg	Kasteel Wijenburg	Voorstraat 2, 4054 MX Echteld	0101000020E610000059B1AEC0460016402A487DA367F44940
995	kiwanis-huia-lodge	Kiwanis Huia Lodge	Little, 1331 Huia Rd, Auckland 0604	0101000020E6100000C88C0123B9D26540414063CB977D42C0
996	czocha-castle	Czocha Castle	Sucha, 59-820 Leśna	0101000020E6100000D93972497A992E40A03AB1E2AF834940
997	moszna-castle	Moszna Castle	Zamkowa 1, 47-370 Moszna	0101000020E6100000200DA7CCCDC5314003A7881DD7374940
998	zamek-kliczkow	Zamek Kliczkow	59-724 Kliczków	0101000020E610000049168B3ACE8030406B781FECB96C4940
999	zamek-ksiazat-mazowieckich	Zamek Książąt Mazowieckich	Zamkowa, 96-200 Rawa Mazowiecka	0101000020E61000007578639C1A413440A294B5F237E24940
1000	wioska-fantasy	Wioska Fantasy	37-700 Kuńkowce	0101000020E6100000D37D4ADFB5B736402082058B1EE74840
1002	cuevas-al-jatib	Cuevas Al Jatib	Arroyo Curcal, S/N, 18800 Baza, Granada	0101000020E61000000E4F0A4ED8C90CC06372B4F4B2964240
1003	apartamentos-rurales-molino-galan	Apartamentos Rurales Molino Galán	Partida del Molino Galan, s/n, 46369 Alborache, Valencia	0101000020E610000040EFD7AE1A15D8BF9352D0ED25BC4340
1004	airsoft-events-valencia	Airsoft Events Valencia	46134 Foios, Valencia	0101000020E610000051F82290018FD6BF0AF65FE7A6C44340
1005	chateau-de-lisle	Château de L'Isle	Rue du Château 7, 1148 L'Isle	0101000020E61000005D35745886A51940985D41E43E4F4740
1006	fort-dartillerie-de-champsec-lac	Fort d'Artillerie de Champsec-Lac	Route de Champex, 1938 Orsières	0101000020E6100000CC913AA693711C4014C3D50110044740
914	bibliotheque-nationale-et-universitaire	Bibliothèque nationale et universitaire	6 place de la République, 67000 Strasbourg	0101000020E6100000649126DE01061F4056207A52264B4840
915	maison-des-jeux-de-strasbourg	Maison des Jeux de Strasbourg	38 Route de Schirmeck, 67200 Strasbourg	0101000020E610000027F801A326E51E409F7829D082494840
916	fort-rapp	Fort Rapp	Rue du Fort, 67116 Reichstett	0101000020E6100000872EA86F99031F40AA9ECC3FFA524840
917	chateau-de-rohan	Château de Rohan	39, rue du Château Mutzig 67190	0101000020E6100000926E95719DD01D40EBA86A82A8444840
918	la-taniere	La Tanière	261 Ribeaugoutte, 68650 Lapoutroie	0101000020E61000004807358D37AB1C407000474C9A154840
919	estaminet-le-chti-pot-ney	Estaminet Le Ch'ti Pot Ney	39 rue Ney, 69006 Lyon	0101000020E6100000732CEFAA076C1340FB253D6766E24640
920	gite-de-la-sarrasine	Gîte de la Sarrasine	Château des Tours, 69460 Saint-Etienne-La-Varenne	0101000020E6100000A4ADA5DB6D8A12409610BDD6EF094740
921	latenium-la-taverne	L'Atenium la Taverne	80 rue Montesquieu, 69007 Lyon	0101000020E61000009A918B7B3D611340B4DAC35E28E04640
922	parc-medieval-de-salva-terra	Parc Médiéval de Salva Terra	375 Rue du Pavé, 69610 Haute-Rivoire	0101000020E61000009CAEDD2C14971140870B40A374DB4640
924	gite-de-gros-bois-gite-douroux	Gîte de Gros-Bois (Gîte d'Ouroux)	69860 Ouroux	0101000020E61000002D08E57D1C3D11409813B4C9E12D4740
925	overcraft-cafe	Overcraft Café	4 rue de la Baleine, 69005 Lyon	0101000020E6100000123FB5B05D501340CD08CAC8B4E14640
1007	ecole-polytechnique-federale-de-lausanne	École polytechnique fédérale de Lausanne	Route Cantonale, 1015 Lausanne	0101000020E6100000FAE6A331FF551A400289DCC2A9424740
1008	ferme-de-combe-tabeillon	Ferme de Combe Tabeillon	2855 Glovelier	0101000020E610000091EC5BF7A0D11C40C52BFF10D1AA4740
1009	the-nursery-theatre	The Nursery Theatre	Arch 61 Ewer St, SE1 0NR London	0101000020E6100000F77E59901C9FB9BFED5D280582C04940
1010	the-welsh-drive	The Welsh Drive	Fleet Road (A327), RG27 0PY Fleet, Hampshire	0101000020E610000052C6095DD3EDF4BF1C930F8B62874940
1011	herstmonceux-castle	Herstmonceux Castle	Herstmonceux BN27 1RN	0101000020E6100000D0910145D1A8D53FCB4D2F8C4F6F4940
1012	hilton-orange-county-costa-mesa	Hilton Orange County / Costa Mesa	3050 Bristol St, Costa Mesa, CA 92626	0101000020E6100000B1EFD46D9A785DC01CBC653D6BD74040
1013	walnut-creek-marriott	Walnut Creek Marriott	2355 N Main Street, Walnut Creek, CA 94596	0101000020E6100000A8435D5A43845EC0EE597CAFC6F44240
1014	chateau-du-logis	Château du Logis	1 Rue de Vauvert, 41330 Saint-Bohaire	0101000020E610000000AEBF80B931F43FFABA67B85CD24740
1015	mfr-chateau-de-jolibert	MFR Chateau de Jolibert	Jolibert 47410 Bourgougnague	0101000020E6100000D46531B1F9B8DA3FD0A623809B4F4640
1016	escapegame-lizio-bretagne	Escapegame lizio Bretagne	Lieu-dit Le Val Jouin, 56460 Lizio	0101000020E61000002864E76D6C3604C0FAD2DB9F8BEE4740
1017	maison-de-quartier-la-touche	Maison de Quartier La Touche	6 rue du Cardinal Paul Gouyon, 35000 Rennes	0101000020E610000005FA449E243D0CC0723CFABA675E4940
1018	42-avenue-du-docteur-calmette	42 avenue du Docteur Calmette	59118 Wambrechies	0101000020E61000003080F0A1446B084046ACC5A700584940
1019	parc-des-expositions-de-rouen	Parc des Expositions de Rouen	46-48 avenue des Canadiens, 76120 Grand-Quevilly	0101000020E6100000FE67284932E6F03F84262E6C72B24840
1020	rampe-saint-gervais	Rampe Saint-Gervais	76000 Rouen	0101000020E61000009B61591FC58FF13F16BB229D26B94840
1021	team-break-rouen	Team Break Rouen	32 Place Saint Marc, 76000 Rouen	0101000020E610000048B02770A1A1F13FE1DBAADA24B84840
1022	les-mines-du-roi-nain	Les Mines du Roi Nain	rue du cimetière, 60290 Laigneville	0101000020E61000007642AF3F898F0340F71E2E39EEA44840
1023	fort-rapp-moltke	Fort Rapp-Moltke	Rue du Fort, 67116 Reichstett	0101000020E6100000872EA86F99031F40AA9ECC3FFA524840
1024	mfr-sud-charente	MFR Sud Charente	Ancienne Abbaye, 16190 Aignes-et-Puypéroux	0101000020E610000085F70B2C369CC13F2F19C748F6B84640
1025	abbaye-cistercienne	Abbaye Cistercienne	Lieu-dit Villers-Canivet, 14420 Villers-Canivet	0101000020E6100000FCFB8C0B0742D0BF4D68925852784840
1026	mont-saint-michel	Mont Saint-Michel	50116 Mont Saint-Michel	0101000020E610000050807225CC865EC0E822CF3F0B004340
1027	parc-des-expositions-de-toulouse	Parc des expositions de Toulouse	Rond-Point Michel Benech, 31400 Toulouse	0101000020E6100000B5F2DC8CE4FCF63FEC4D67823CCB4540
1029	chateau-de-la-noe-bel-air	Château de la Noë Bel-Air	44330 Vallet	0101000020E6100000E3B08FA916042D40B5577AC8EFF14140
1030	centre-de-loisirs-et-daccueil-du-petit-capitole-mjc	Centre de loisirs et d'accueil du Petit Capitole MJC	153 Avenue de Lardenne, 31100 Toulouse	0101000020E6100000836BEEE87F39F63FC524010FB1CB4540
1031	domaine-le-picou	Domaine Le Picou	11310 Saissac	0101000020E6100000E9BEF7922162FC3F96873BCDB86B4640
1032	prieure-dauthie	Prieuré d'Authie	10 rue de l'Abbaye, 80560 Authie	0101000020E6100000E7BFACF5EAE803408A9C7411950F4940
1033	chateau-dailly	Château d'Ailly	Allée d'Ailly, 42120 Parigny	0101000020E61000004A332779BF6310403B6AF1CE46FF4640
1034	domaine-provincial-de-chevetogne	Domaine provincial de Chevetogne	5590 Ciney	0101000020E61000007171546EA276144032DAAA24B2274940
1035	gite-des-deux-clos	Gîte des Deux Clos	64460 Pontiacq-Viellepinte	0101000020E6100000ABB184B53176AABFAAEAE5779AAE4540
1036	domaine-de-la-roche-florens	Domaine de la Roche-Florens	24120 Terrasson-Lavilledieu	0101000020E610000005508C2C99E3F43F8C23D6E253904640
1037	village-commando-bainville-sur-madon	Village Commando Bainville sur Madon	Les Vaines Terres, 54550 Bainville-Sur-Madon	0101000020E61000000CFE7E315B62184013F3ACA4154B4840
1038	chateau-de-la-baronniere	Château de la Baronnière	La Chapelle-Saint-Florent, 49620 La Pommeraye	0101000020E6100000DCA96F4F464BCC3F6ABC19DAA5874840
\.


--
-- Data for Name: backent_api_organization; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_api_organization (id, slug, name) FROM stdin;
1321	les-jeux-de-la-gehenne	Les jeux de la Gehènne
1322	les-legendes-despigoule	Les Légendes d'Espigoule
1323	les-mondes-dadvena	Les mondes d'Advena
1324	les-nomads	Les Nomads
1325	les-ombres-du-trone	Les Ombres du Trône
1326	oneiros	Oneiros
1327	casa-des-jeunz	Casa des JeunZ
1328	deprofundisgn	DeprofundisGN 
1329	les-pelerins-de-metamorphee	Les pèlerins de Métamorphée
1330	les-portes-du-nord	Les Portes du Nord
1331	poing-dacier	Poing d'Acier
1332	fantasticus	Fantasticus
1333	les-reves-de-licorne	Les Rêves De Licorne
1334	les-sang-dragons	Les Sang Dragons
1335	les-tisseurs-detoiles	Les Tisseurs d'Etoiles
1336	lidje	LÎDJE
1337	live-adventure	Live Adventure
1338	liveform	Liveform
1339	ludicrime	Ludicrime
1340	lutetia-lacrymae	Lutetia Lacrymae
1341	marcheurs-de-lavant	Marcheurs de l'Avant
1342	medieval-gn	Medieval GN
1343	mesnie-des-delices	Mesnie des Délices
1344	mgn-studio	MGN Studio
1345	mittelpunkt	Mittelpunkt
1346	citadelle-de-roq	Citadelle de Roq
1347	gn-les-terres-de-soscath	GN - Les Terres de Soscath
1348	les-chevaliers-du-roi-pecheur	Les Chevaliers du Roi Pêcheur
1349	les-ptits-croustillants	Les p'tits croustillants
1350	mur-blanc	Mur Blanc
1351	syneris	Syneris
1352	le-royaume-dhelios	Le Royaume d'Helios 
1353	human-experience	human experience
1354	les-chroniques-dilanga	Les chroniques d'Ilanga
1355	neverland	Neverland
1356	nor-gehenne	NOR-Gehenne
1357	createurs-dunivers	Créateurs d'Univers
1358	estocade-gn	Estocade GN
1359	nuit-du-huis-clos-rennes	Nuit Du Huis Clos Rennes
1360	les-forges-de-krom	Les Forges de Krom 
1361	les-joueurs-de-la-forge	Les Joueurs de la Forge
1362	les-marcheurs-de-lavant	Les Marcheurs de l'Avant
1363	les-sang-lies-de-kornouaille	Les Sang-Liés de Kornouaille
1364	lindangen	Lindängen
1365	medievanim	Mediev'Anim
1366	mines-du-roi-nain	Mines Du Roi Nain
1367	minsk-larp-festival	Minsk Larp Festival
1368	mirgovah-france	Mirgovah France
1369	mirrors-of-england	Mirrors of England
1370	mondes-paralleles	Mondes Parallèles
1371	nef-des-premiers-ohms	Nef des Premiers Ohms
1372	not-only-larp	Not Only Larp
1373	nouvelle-contree	Nouvelle Contrée
1374	npo-out-of-this-world	NPO Out of this World
1375	obscurus-nl	Obscurus NL
1376	on-location	On Location
1377	original-event-06	Original Event 06
1378	sterskov-efterskole	Østerskov Efterskole
1379	participation-design-agency	Participation Design Agency
1380	club-grabuge-de-la-maison-des-jeunes-et-de-la-culture-de-carcassonne	Club Grabuge de la Maison des Jeunes et de la Culture de Carcassonne 
1381	peaky	Peaky
1382	play-larp	Play Larp
1383	portal-larp-convention	Portal Larp Convention
1384	renainssance	ReNainSsance
1385	reverrance	Rev'errance
1386	reve-emotion-asbl	Rêve Emotion ASBL
1387	road-under-nihil	Road Under Nihil
1388	role	Rôle
1389	rolling-cz	Rolling CZ
1390	rpc-germany	RPC Germany
1391	rujha-gn	Rujha GN
1392	sabat-team	Sabat Team
1393	samarobriva-noctis	Samarobriva Noctis
1394	scenaristerie-du-petit-peuple	Scénaristerie du Petit Peuple
1395	sept-de-sang	Sept de Sang
1396	shadow-company-78	Shadow Company 78
1397	shadow-factories	Shadow Factories 
1398	sidh	SIDH
1399	smartfun	Smartfun
1400	so-event	So Event
1401	soiree-sans-fin	Soirée Sans Fin
1402	solumkohta	Solumkohta
1403	somnia	Somnia
1404	somnium-bellator	Somnium Bellator
1405	spacequest	SpaceQuest
1406	stockholm-scenario-festival	Stockholm Scenario Festival 
1407	sunfall	Sunfall
1408	tankaffaires	Tank'Affaires
1409	academic-larp-conference	Academic Larp Conference
1410	terra-ludis	Terra Ludis
1411	terra-zone	Terra Zone
1412	terre-spezzate	Terre Spezzate
1413	terres-sauvages	Terres Sauvages
1414	the-elder-scrolls-chronicles-tesc	The Elder Scrolls Chronicles (TESC)
1415	the-game-theatre	The Game Theatre
1416	the-smoke	The Smoke
1417	time-freeze	Time Freeze
1418	bait-byout	Bait Byout
1419	torgnole	Torgnôle
1420	touraine-roliste-de-limaginaire-a-potentiel-historique-triph	Touraine Rôliste de l'Imaginaire à Potentiel Historique (TRIPH)
1421	toxic-gn	TOXIC GN
1422	undead-organization	Undead Organization
1423	urbicande-liberee	Urbicande Libérée
1424	vinterland	Vinterland
1425	warmotte	Warmotte
1426	we-larp	We LARP
1427	white-wolf	White Wolf
1428	wild-dust	Wild Dust
1429	wild-trigger-gn	Wild Trigger GN
1430	wyrd-con	Wyrd con
1431	ys-mu	Ys Mu
1432	zeitgeist	Zeitgeist
1433	esprit-grandeur-nature	Esprit Grandeur Nature
1434	azer-team	Azer Team
1435	celtiana	Celtiana
1436	les-gns-dimaginarium	Les GNs d'Imaginarium
1437	la-lune-rouge	La Lune Rouge
1438	gn-just-for-geeks-at-devinci	GN Just For Geeks at devinci
1439	bifrost	Bifrost
1440	pohjoismaisen-roolipelaamisen-seura-ry	Pohjoismaisen roolipelaamisen seura ry
1441	berattelseframjandet	Berättelsefrämjandet
1442	learnlarp	LearnLarp
1443	1mpakt	1mpakt
1444	agence-legendaire	Agence Légendaire
1445	conservatoire-du-jeu	Conservatoire du Jeu
1446	hydre-omel	Hydre Omel
1447	les-voix-deidolon	Les Voix d'Eidôlon
1448	le-masque-et-la-tour	Le Masque et la Tour
1449	la-squid	La Squid
1450	pour-quelques-gn-de-plus	Pour quelques GN de plus
1451	geek-adventure	Geek Adventure
1452	les-porteurs-de-legendes	Les Porteurs de Légendes
1453	tempus-ludi	Tempus Ludi
1454	peculiar-crossroads-productions	Peculiar Crossroads Productions
1455	quest-for-the-blue-stone-productions	Quest for the Blue Stone Productions
1456	rogue-events	Rogue Events
1457	aspamia	Aspamia
1458	blackbox-cph	BlackBox CPH
1459	atropos	Atropos
1460	ariadnes-red-thread	Ariadne’s Red Thread
1461	les-rolistes-des-terres-paralleles	Les Rôlistes des Terres Parallèles
1462	playco	PlayCo
1463	auberge-des-voyajoueurs	Auberge des Voyajoueurs
1464	tilc-les-tremplins-des-imaginaires-ludiques-et-culturels	TILC - les Tremplins des Imaginaires Ludiques et Culturels 
1465	lajvverkstaden	LajvVerkstaden
1466	la-contree-des-peneujes	La Contrée Des Peneujes
1467	living-games	Living Games
1468	sculpteurs-de-reves	Sculpteurs de Rêves
1469	be-larper	Be Larper
1470	grenouille-noire	Grenouille Noire
1471	fumble-corp	Fumble Corp
1472	la-plume-dacier	La Plume d'Acier
1473	les-masques-de-pandore	Les Masques de Pandore
1474	jupons-et-plastrons	Jupons et Plastrons
1475	an-termaji	An Termaji
1476	lhydre	L'Hydre
1477	les-jeux-du-rohan	Les Jeux du Rohan
1478	a-venture	A-Venture
1479	les-legendes-de-zaelwair	Les Légendes de Zaelwaïr
1480	escampette	Escampette
1481	mimbulus-mimbletonia	Mimbulus Mimbletonia
1482	sinking-ship-creations	Sinking Ship Creations
1483	compagnie-georges-poutre	Compagnie Georges Poutre
1484	association-ludique-des-gnistes-rennais-algr	Association Ludique des Gnistes Rennais - ALGR
1485	soirees-enquetes	Soirées Enquêtes
1486	la-chevalerie-angevine	La Chevalerie Angevine
1487	le-grand-duc	Le Grand Duc
1488	une-tranche-de-toi	Une Tranche de toi
1489	conquest-of-mythodea	ConQuest of Mythodea
1490	sailing4adventure	Sailing4Adventure
1491	les-bretteurs-sur-gages-escrime-artistique-et-de-spectacle	Les Bretteurs sur Gages, Escrime Artistique et de Spectacle
1492	le-6e-monde	Le 6e Monde
1493	les-traverses-asbl	Les Traverses ASBL
1494	la-chatellerie-nantaise	La Châtellerie Nantaise
1495	labogn	LaboGN
1496	eomengrund	Eomengrund
1497	mrjc	MRJC
1498	zeitgeist-larp	Zeitgeist LARP
1499	memento-mori-asbl	Memento Mori ASBL
1500	larpp-de-pibrac	L'arpp de Pibrac
1501	de-profundis-gn	De Profundis GN
1502	les-ecuries-daugias	Les Ecuries d'Augias
1503	el-equipo-ente	El Equipo Ente
1504	team-gn	Team GN
1505	les-forges-de-sudamakir	Les Forges De Sudamakir 
1506	le-lys-noir	Le Lys Noir
1507	ailes-de-nemesis	Ailes de Némésis
1508	les-tiroirs-dapril	Les Tiroirs d'April
1320	les-irrecuperables-du-jdr	Les Irrécupérables du Jdr
1509	cocolarp_import	COCOLARP_IMPORT
1312	les-chroniques-dalgaroth	Les Chroniques d'Algaroth
1313	les-chroniques-de-jaorken	Les Chroniques de Jaörken
1314	les-compagnons-de-louest	Les Compagnons de l'Ouest
1315	les-compagnons-des-terres-paralleles	Les Compagnons des Terres Parallèles
1316	les-crocs-de-la-taniere	Les Crocs de la Tanière
1317	les-derniers-de-solace	Les Derniers de Solace
1318	les-enfants-de-pandore	Les Enfants de Pandore
1319	les-faconneurs-du-temps	Les Façonneurs du Temps
1510	cocolarp_import-steamlarp	COCOLARP_IMPORT (SteamLarp)
1132	organisation	Organisation
1133	avalon-terres-de-jeux-et-dutopies	Avalon Terres de Jeux et d'Utopies
1134	cercle-darmes-du-dauphine	Cercle d'armes du Dauphiné
1135	espace-de-developpement-de-limaginaire-ludique-edil	Espace de Développement de l’Imaginaire Ludique (EDIL)
1136	le-consulat-delleslande	Le Consulat d’Elleslande
1137	5zywiolow	5zywiolow
1138	a-la-croisee-des-chemins	A la Croisée des Chemins
1139	ama-france	A.M.A France
1140	a3dl	A3DL
1141	acta-es-fabula	Acta Es Fabula
1142	alliance-prod	Alliance-prod
1143	aquilon	Aquilon
1144	arcan-gn-dijon	Arcan GN Dijon
1145	broken-dreams-lrp-the-avalon-corporation	Broken Dreams LRP & The Avalon Corporation
1146	aube	Aube
1147	as-morgenstern	As Morgenstern
1148	ascalone-gn	Ascalone GN
1149	creadvance	Creadvance 
1150	insight	Insight
1151	alter-ego	Alter Ego
1152	troll	Troll
1153	maryl-and-clarck	Maryl and Clarck
1154	univers	Univers
1155	au-chaudron-penche	Au Chaudron Penché
1157	bardes-dragons	Bardes & Dragons
1158	be-larp	BE Larp
1159	berry-champ-de-bataille-bcb	Berry Champ de Bataille (BCB)
1160	big-bad-con	Big Bad Con
1161	black-box-horsens	Black Box Horsens
1162	archenfall	Archenfall
1163	black-hills	Black Hills
1164	blincom	BlinCom
1165	bounty-hunters-legion	Bounty Hunters Legion
1166	fortune-felicity	Fortune & Felicity
1167	brumes	Brumes
1168	brumes-derebos	Brumes d'Erebos
1169	freak-show	Freak Show
1170	ca-va-bien-se-passer-cvbsp	Ca va bien se passer (CVBSP)
1171	outreterre	Outreterre
1172	paragon	Paragon
1173	camp-du-dragon	Camp du Dragon
1174	castilla-garona	Castilla Garona
1175	ragnarok	Ragnarok
1176	azoria	Azoria
1177	ceegs	CEEGS
1178	cent-balles-et-un-mars	Cent balles et un mars
1179	chroniques-chimeres	Chroniques & Chimères
1180	chroniques-pirates	Chroniques Pirates
1181	clepsydre	Clepsydre
1182	gnafron	GNafron
1183	cabaret	Cabaret
1184	chaos-league	Chaos League
1185	laurent-dufont	Laurent Dufont
1186	collectif-prisme	Collectif Prisme
1187	compagnie-des-rolistes-morbihannais-crom	Compagnie des Rôlistes Morbihannais (CROM)
1188	a-bouts-de-film-la-nuit-magique	A Bouts de Film & La Nuit Magique
1189	au-nom-de-la-rose-andlr	Au Nom De La Rose (ANDLR)
1190	compagnons-de-louest	Compagnons de l'Ouest
1191	aux-42-jeux	Aux 42 Jeux
1192	1000-atmosphaeren	1000 Atmosphäeren
1193	croisee-des-epees	Croisée des Epées 
1194	contes-de-provence	Contes de Provence
1195	cormeilles-ludique	Cormeilles Ludique
1196	coryphee	Coryphée
1198	la-guilde	La Guilde
1199	la-guilde-des-reves	La Guilde Des Rêves
1200	de-cape-et-de-des	De Cape et de Dés
1201	des-a-la-carte	Dés à la Carte
1202	don-quichotte	Don Quichotte
1203	drakerys	Drakerys
1204	inside-hamlet	Inside Hamlet
1205	dziobak-larp-studios	Dziobak Larp Studios
1206	eikona	Eikona
1207	ekinoxe	Ekinoxe
1208	en-quete-de-reve	En Quête de Rêve
1209	energie-paintball	Energie Paintball
1210	entrerevs	EntreRevs
1211	epees-en-mousse-et-tetes-de-trolls-emtt	Epées en mousse et têtes de trolls (EMTT)
1212	portes-du-nord	Portes du Nord
1213	1942-whom-can-you-trust	1942, Whom can you trust?
1214	ecuries-daugias	Écuries d'Augias
1215	guilde-du-fantastique	Guilde du Fantastique
1216	epic-gn	Epic GN
1217	et-encore	Et Encore...
1218	eve-oniris	Eve Oniris
1219	celtika	Celtika
1220	experience	eXpérience
1221	eye-larp	Eye LARP
1222	faerie	Faërie
1223	fearest	Fearest
1224	fedegn	FédéGN
1225	feodus	Feodus
1226	forges-de-krom	Forges de Krom
1227	fort-paint	Fort Paint
1228	bizom	Bizom
1229	fred-meurin	Fred Meurin
1230	garou-asbl	Garou ASBL
1231	gn-aventure	GN Aventure
1232	la-forge-aux-legendes	La Forge aux Légendes
1233	larpcon-uk	LarpCon UK
1234	gn-lameduheros	GN Lameduheros
1235	le-repaire-des-griffons	Le Repaire des Griffons
1236	gn-zhu-lien	GN Zhu Lien
1237	gniales	GNiales
1238	gniarc	GNiarc
1239	gnome-prod	Gnome Prod
1240	knutpunkt	Knutpunkt
1241	life-is-larp	Life is Larp
1242	gnomes-associes	Gnomes & associés
1243	goblin-the-dark	Gobl'in the Dark
1244	grandis-nexus	Grandis Nexus
1245	grenselandet	Grenselandet
1246	groupe-dimagination-de-grandeur-nature-gign	Groupe d'Imagination de Grandeur Nature (GIGN)
1511	cocolarp_import-marked-larp	COCOLARP_IMPORT (Marked Larp)
1512	cocolarp_import-brudpris	COCOLARP_IMPORT (Brudpris)
1513	cocolarp_import-beratta	COCOLARP_IMPORT (Beratta)
1247	reves-duchronies	Rêves d'Uchronies 
1248	guilde-de-bretagne	Guilde de Bretagne
1249	drakerys-gn	Drakerys GN
1250	horde	Horde
1251	ifol	ifoL
1252	imaginary-consequence	Imaginary Consequence
1253	cercle-des-compagnons-doniros	Cercle des Compagnons d'Oniros
1254	chroniqueurs-vagabonds	Chroniqueurs Vagabonds
1255	goplay	GoPlay
1256	imperium-ludi	Imperium Ludi
1257	independant	Independant
1258	jeux-des-racines	Jeux Dés Racines
1259	kelkalor	Kelkalor
1260	khonsou	Khonsou
1261	arcan-les-demons-divoire	Arcan - Les Démons d'Ivoire
1263	larene-de-loubli	L'Arène de l'Oubli
1264	imagine-nation-collective	Imagine Nation Collective
1265	knutepunkt	Knutepunkt
1266	camarilla-ardente	Camarilla Ardente
1267	lantre-du-temps	L'Antre du Temps
1268	lheure-du-gn	L'Heure du GN
1269	stowarzyszenie-larpownia	Stowarzyszenie Larpownia
1270	wargs	WARGS
1271	deus-ex-machina	Deus ex Machina
1272	les-chroniques-de-syranon	Les Chroniques de Syranon
1273	prologue	Prologue
1274	la-boite-a-chimere	La Boîte à Chimère
1275	la-compagnie-dro-lig	La Compagnie Dro Lig
1276	la-compagnie-du-yucca	La Compagnie du Yucca
1277	la-croisee-des-epees	La Croisée des Epées
1278	oratjeuxnids	Oratjeuxnids
1279	rajr	RAJR
1280	la-forge-du-grand-nain	La Forge du Grand Nain
1281	la-mesnie-des-delices	La Mesnie des Délices
1282	la-meute	La Meute
1283	la-morsure-de-lhiver	La Morsure de l'Hiver
1284	blue-flame	Blue Flame
1285	heritage-hallapandur	Héritage Hallapandur
1286	la-porte-des-songes	La Porte des Songes
1287	la-taverne-oubliee	La Taverne Oubliée
1288	landhelven	Landhelven
1290	la-torgnole	La TorGNole
1291	les-compagnons-de-louest-lcdo	Les Compagnons de l'Ouest (LCDO)
1292	le-bureau-des-songes	Le Bureau des Songes
1293	qba	QBA
1294	le-clos-metayer-be-larper	Le Clos Métayer + Be Larper
1295	le-consortium-de-griffe	Le Consortium de Griffe
1296	le-dernier-bar-avant-la-fin-du-monde-lille	Le Dernier Bar Avant la Fin du Monde Lille
1297	producciones-gorgona	Producciones Gorgona
1298	le-kraken	Le Kraken
1299	le-monde-de-zarcan	Le Monde de Zarcan
1300	le-potageux	Le Potageux
1301	les-2-tours	Les 2 Tours
1302	les-7-gn	Les 7 Gn 
1303	les-amis-dostherrya	Les Amis d'Ostherrya
1304	orcidees	Orc'Idées
1305	der-pandora-effet	Der Pandora Effet
1306	les-amis-de-miss-rachel	Les Amis de Miss Rachel
1307	kaleidoscopic-consequences	Kaleidoscopic Consequences
1308	chimera	Chimera
1309	gn-fantasy	GN & Fantasy
1310	les-forgemondes	Les ForgeMondes
1311	les-arts-des-idees	Les Arts Des Idées
\.


--
-- Data for Name: backent_user; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, avatar, location_id) FROM stdin;
1	pbkdf2_sha256$100000$y0xspy2iPcar$XnpXxGkgVDsGrjhnWjlOv/OvropH1mcAoU6Z86EZGzY=	2018-06-02 14:20:03.843478+02	t	victor				t	t	2018-06-02 14:19:56.011363+02		\N
\.


--
-- Data for Name: backent_user_groups; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: backent_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.backent_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: victor
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
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-02 14:09:11.36156+02
2	contenttypes	0002_remove_content_type_name	2018-06-02 14:09:11.398288+02
3	auth	0001_initial	2018-06-02 14:09:11.541815+02
4	auth	0002_alter_permission_name_max_length	2018-06-02 14:09:11.559122+02
5	auth	0003_alter_user_email_max_length	2018-06-02 14:09:11.581583+02
6	auth	0004_alter_user_username_opts	2018-06-02 14:09:11.592057+02
7	auth	0005_alter_user_last_login_null	2018-06-02 14:09:11.602309+02
8	auth	0006_require_contenttypes_0002	2018-06-02 14:09:11.607687+02
9	auth	0007_alter_validators_add_error_messages	2018-06-02 14:09:11.623916+02
10	auth	0008_alter_user_username_max_length	2018-06-02 14:09:11.63739+02
11	backent	0001_initial	2018-06-02 14:09:11.793613+02
12	admin	0001_initial	2018-06-02 14:09:11.870357+02
13	admin	0002_logentry_remove_auto_add	2018-06-02 14:09:11.894468+02
14	auth	0009_alter_user_last_name_max_length	2018-06-02 14:09:11.908023+02
15	authtoken	0001_initial	2018-06-02 14:09:11.961589+02
16	authtoken	0002_auto_20160226_1747	2018-06-02 14:09:12.025281+02
17	backent_api	0001_initial	2018-06-02 14:09:12.303616+02
18	backent	0002_user_location	2018-06-02 14:09:12.348377+02
19	backent	0003_alter_user_lastname	2018-06-02 14:09:12.376411+02
20	backent_api	0002_auto_20180115_2205	2018-06-02 14:09:12.395781+02
21	backent_api	0003_add_npc_price_and_urls_and_move_currency	2018-06-02 14:09:12.776091+02
22	backent_api	0004_migrate_event_formats	2018-06-02 14:09:12.807217+02
23	backent_api	0005_remove_event_end	2018-06-02 14:09:12.832853+02
24	backent_api	0006_make_events_unique_on_name_and_start	2018-06-02 14:09:12.919653+02
25	backent_api	0007_auto_20180520_1224	2018-06-02 14:09:12.960432+02
26	sessions	0001_initial	2018-06-02 14:09:13.014739+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7sl5zofz8t9fad29z0tlk4x9z3s16fal	YzI3YmE5ZmVhMzI4YWI2YWYwMTI2MDFmZTgwNjczMGYyZTYxMjAwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMGNhMzEwZjJmNjJmZTU5MWI2NjM5MmUyMzNmMDYwNjFjZWNhMmEyIn0=	2018-06-16 14:20:03.861895+02
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: victor
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 33, true);


--
-- Name: backent_api_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_api_event_id_seq', 3401, true);


--
-- Name: backent_api_eventlike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_api_eventlike_id_seq', 1, false);


--
-- Name: backent_api_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_api_location_id_seq', 1108, true);


--
-- Name: backent_api_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_api_organization_id_seq', 1513, true);


--
-- Name: backent_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_user_groups_id_seq', 1, false);


--
-- Name: backent_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_user_id_seq', 1, true);


--
-- Name: backent_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.backent_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: victor
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: backent_api_event backent_api_event_name_start_5c57dde7_uniq; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_name_start_5c57dde7_uniq UNIQUE (name, start);


--
-- Name: backent_api_event backent_api_event_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_pkey PRIMARY KEY (id);


--
-- Name: backent_api_eventlike backent_api_eventlike_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_eventlike
    ADD CONSTRAINT backent_api_eventlike_pkey PRIMARY KEY (id);


--
-- Name: backent_api_location backent_api_location_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_location
    ADD CONSTRAINT backent_api_location_pkey PRIMARY KEY (id);


--
-- Name: backent_api_location backent_api_location_slug_key; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_location
    ADD CONSTRAINT backent_api_location_slug_key UNIQUE (slug);


--
-- Name: backent_api_organization backent_api_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_organization
    ADD CONSTRAINT backent_api_organization_pkey PRIMARY KEY (id);


--
-- Name: backent_api_organization backent_api_organization_slug_key; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_organization
    ADD CONSTRAINT backent_api_organization_slug_key UNIQUE (slug);


--
-- Name: backent_user_groups backent_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_pkey PRIMARY KEY (id);


--
-- Name: backent_user_groups backent_user_groups_user_id_group_id_137ba0e8_uniq; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_user_id_group_id_137ba0e8_uniq UNIQUE (user_id, group_id);


--
-- Name: backent_user backent_user_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user
    ADD CONSTRAINT backent_user_pkey PRIMARY KEY (id);


--
-- Name: backent_user_user_permissions backent_user_user_permis_user_id_permission_id_e9d2498f_uniq; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_permis_user_id_permission_id_e9d2498f_uniq UNIQUE (user_id, permission_id);


--
-- Name: backent_user_user_permissions backent_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: backent_user backent_user_username_key; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user
    ADD CONSTRAINT backent_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: backent_api_event_created_by_id_0f1f6e76; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_event_created_by_id_0f1f6e76 ON public.backent_api_event USING btree (created_by_id);


--
-- Name: backent_api_event_location_id_3fbf77b8; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_event_location_id_3fbf77b8 ON public.backent_api_event USING btree (location_id);


--
-- Name: backent_api_event_organization_id_20ec6097; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_event_organization_id_20ec6097 ON public.backent_api_event USING btree (organization_id);


--
-- Name: backent_api_event_slug_17b65a76; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_event_slug_17b65a76 ON public.backent_api_event USING btree (slug);


--
-- Name: backent_api_event_slug_17b65a76_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_event_slug_17b65a76_like ON public.backent_api_event USING btree (slug varchar_pattern_ops);


--
-- Name: backent_api_eventlike_event_id_a8036793; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_eventlike_event_id_a8036793 ON public.backent_api_eventlike USING btree (event_id);


--
-- Name: backent_api_eventlike_user_id_551eb457; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_eventlike_user_id_551eb457 ON public.backent_api_eventlike USING btree (user_id);


--
-- Name: backent_api_location_coords_id; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_location_coords_id ON public.backent_api_location USING gist (coords);


--
-- Name: backent_api_location_slug_755a95fd_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_location_slug_755a95fd_like ON public.backent_api_location USING btree (slug varchar_pattern_ops);


--
-- Name: backent_api_organization_slug_46967d16_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_api_organization_slug_46967d16_like ON public.backent_api_organization USING btree (slug varchar_pattern_ops);


--
-- Name: backent_user_groups_group_id_36c82f05; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_user_groups_group_id_36c82f05 ON public.backent_user_groups USING btree (group_id);


--
-- Name: backent_user_groups_user_id_f137f205; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_user_groups_user_id_f137f205 ON public.backent_user_groups USING btree (user_id);


--
-- Name: backent_user_location_id_53ea96f0; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_user_location_id_53ea96f0 ON public.backent_user USING btree (location_id);


--
-- Name: backent_user_user_permissions_permission_id_d3abe49d; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_user_user_permissions_permission_id_d3abe49d ON public.backent_user_user_permissions USING btree (permission_id);


--
-- Name: backent_user_user_permissions_user_id_8e14a728; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_user_user_permissions_user_id_8e14a728 ON public.backent_user_user_permissions USING btree (user_id);


--
-- Name: backent_user_username_b85097b2_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX backent_user_username_b85097b2_like ON public.backent_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: victor
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_event backent_api_event_created_by_id_0f1f6e76_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_created_by_id_0f1f6e76_fk_backent_user_id FOREIGN KEY (created_by_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_event backent_api_event_location_id_3fbf77b8_fk_backent_a; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_location_id_3fbf77b8_fk_backent_a FOREIGN KEY (location_id) REFERENCES public.backent_api_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_event backent_api_event_organization_id_20ec6097_fk_backent_a; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_event
    ADD CONSTRAINT backent_api_event_organization_id_20ec6097_fk_backent_a FOREIGN KEY (organization_id) REFERENCES public.backent_api_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_eventlike backent_api_eventlike_event_id_a8036793_fk_backent_api_event_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_eventlike
    ADD CONSTRAINT backent_api_eventlike_event_id_a8036793_fk_backent_api_event_id FOREIGN KEY (event_id) REFERENCES public.backent_api_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_api_eventlike backent_api_eventlike_user_id_551eb457_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_api_eventlike
    ADD CONSTRAINT backent_api_eventlike_user_id_551eb457_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_groups backent_user_groups_group_id_36c82f05_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_group_id_36c82f05_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_groups backent_user_groups_user_id_f137f205_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_groups
    ADD CONSTRAINT backent_user_groups_user_id_f137f205_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user backent_user_location_id_53ea96f0_fk_backent_api_location_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user
    ADD CONSTRAINT backent_user_location_id_53ea96f0_fk_backent_api_location_id FOREIGN KEY (location_id) REFERENCES public.backent_api_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_user_permissions backent_user_user_pe_permission_id_d3abe49d_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_pe_permission_id_d3abe49d_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backent_user_user_permissions backent_user_user_pe_user_id_8e14a728_fk_backent_u; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.backent_user_user_permissions
    ADD CONSTRAINT backent_user_user_pe_user_id_8e14a728_fk_backent_u FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_backent_user_id; Type: FK CONSTRAINT; Schema: public; Owner: victor
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_backent_user_id FOREIGN KEY (user_id) REFERENCES public.backent_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

