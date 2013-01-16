--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO graph;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE admins_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO graph;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: alu_groups; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE alu_groups (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    course_id integer
);


ALTER TABLE public.alu_groups OWNER TO graph;

--
-- Name: alu_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE alu_groups_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.alu_groups_id_seq OWNER TO graph;

--
-- Name: alu_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE alu_groups_id_seq OWNED BY alu_groups.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    number integer,
    timeleft integer,
    responsetime timestamp without time zone,
    "pointsBefore" double precision,
    question_id integer,
    test_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    student_id integer
);


ALTER TABLE public.answers OWNER TO graph;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE answers_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO graph;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE chat_messages (
    id integer NOT NULL,
    "from" character varying(255),
    "to" character varying(255),
    body text,
    test_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    question_id integer,
    msgtype character varying(255)
);


ALTER TABLE public.chat_messages OWNER TO graph;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE chat_messages_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.chat_messages_id_seq OWNER TO graph;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE chat_messages_id_seq OWNED BY chat_messages.id;


--
-- Name: competence_groups; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE competence_groups (
    id integer NOT NULL,
    filename character varying(255),
    competence_id integer,
    alu_group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    points double precision
);


ALTER TABLE public.competence_groups OWNER TO graph;

--
-- Name: competence_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE competence_groups_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.competence_groups_id_seq OWNER TO graph;

--
-- Name: competence_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE competence_groups_id_seq OWNED BY competence_groups.id;


--
-- Name: competence_nodes; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE competence_nodes (
    id integer NOT NULL,
    node_id integer,
    competence_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.competence_nodes OWNER TO graph;

--
-- Name: competence_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE competence_nodes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.competence_nodes_id_seq OWNER TO graph;

--
-- Name: competence_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE competence_nodes_id_seq OWNED BY competence_nodes.id;


--
-- Name: competences; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE competences (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text
);


ALTER TABLE public.competences OWNER TO graph;

--
-- Name: competences_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE competences_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.competences_id_seq OWNER TO graph;

--
-- Name: competences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE competences_id_seq OWNED BY competences.id;


--
-- Name: competences_works; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE competences_works (
    competence_id integer,
    work_id integer
);


ALTER TABLE public.competences_works OWNER TO graph;

--
-- Name: concept_maps; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE concept_maps (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.concept_maps OWNER TO graph;

--
-- Name: concept_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE concept_maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.concept_maps_id_seq OWNER TO graph;

--
-- Name: concept_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE concept_maps_id_seq OWNED BY concept_maps.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE courses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.courses OWNER TO graph;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE courses_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO graph;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: edges; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE edges (
    id integer NOT NULL,
    src_id integer,
    dest_id integer,
    dep double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.edges OWNER TO graph;

--
-- Name: edges_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE edges_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.edges_id_seq OWNER TO graph;

--
-- Name: edges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE edges_id_seq OWNED BY edges.id;


--
-- Name: id_generator; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE id_generator (
    id integer NOT NULL,
    value integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.id_generator OWNER TO graph;

--
-- Name: id_generator_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE id_generator_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_generator_id_seq OWNER TO graph;

--
-- Name: id_generator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE id_generator_id_seq OWNED BY id_generator.id;


--
-- Name: node_question_relations; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE node_question_relations (
    id integer NOT NULL,
    node_id integer,
    question_id integer,
    dep double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.node_question_relations OWNER TO graph;

--
-- Name: node_question_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE node_question_relations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.node_question_relations_id_seq OWNER TO graph;

--
-- Name: node_question_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE node_question_relations_id_seq OWNED BY node_question_relations.id;


--
-- Name: nodes; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE nodes (
    id integer NOT NULL,
    content text,
    "minPassPoints" double precision,
    course_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nodes OWNER TO graph;

--
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE nodes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.nodes_id_seq OWNER TO graph;

--
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE nodes_id_seq OWNED BY nodes.id;


--
-- Name: question_responses; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE question_responses (
    id integer NOT NULL,
    response text,
    question_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.question_responses OWNER TO graph;

--
-- Name: question_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE question_responses_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.question_responses_id_seq OWNER TO graph;

--
-- Name: question_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE question_responses_id_seq OWNED BY question_responses.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    content text,
    "answerTime" integer,
    "correctAnswer" integer,
    difficulty double precision,
    luck double precision,
    img character varying(255),
    course_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    keywords character varying(255)
);


ALTER TABLE public.questions OWNER TO graph;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE questions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO graph;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: related_contents; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE related_contents (
    id integer NOT NULL,
    filename character varying(255),
    recover boolean,
    description text,
    node_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.related_contents OWNER TO graph;

--
-- Name: related_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE related_contents_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.related_contents_id_seq OWNER TO graph;

--
-- Name: related_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE related_contents_id_seq OWNED BY related_contents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO graph;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO graph;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE sessions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO graph;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: student_assigns; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE student_assigns (
    id integer NOT NULL,
    student_id integer,
    course_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.student_assigns OWNER TO graph;

--
-- Name: student_assigns_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE student_assigns_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.student_assigns_id_seq OWNER TO graph;

--
-- Name: student_assigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE student_assigns_id_seq OWNED BY student_assigns.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE students (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.students OWNER TO graph;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE students_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO graph;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: teacher_assigns; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE teacher_assigns (
    id integer NOT NULL,
    teacher_id integer,
    course_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.teacher_assigns OWNER TO graph;

--
-- Name: teacher_assigns_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE teacher_assigns_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.teacher_assigns_id_seq OWNER TO graph;

--
-- Name: teacher_assigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE teacher_assigns_id_seq OWNED BY teacher_assigns.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE teachers (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.teachers OWNER TO graph;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE teachers_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO graph;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE teachers_id_seq OWNED BY teachers.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE tests (
    id integer NOT NULL,
    finished boolean,
    points double precision,
    work_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tests OWNER TO graph;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE tests_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO graph;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE tests_id_seq OWNED BY tests.id;


--
-- Name: user_alu_groups; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE user_alu_groups (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    alu_group_id integer,
    user_id integer
);


ALTER TABLE public.user_alu_groups OWNER TO graph;

--
-- Name: user_alu_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE user_alu_groups_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_alu_groups_id_seq OWNER TO graph;

--
-- Name: user_alu_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE user_alu_groups_id_seq OWNED BY user_alu_groups.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    password_salt character varying(255),
    password_hash character varying(255),
    email character varying(255),
    name character varying(255),
    active boolean,
    useraccount_id integer,
    useraccount_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO graph;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO graph;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: works; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE works (
    id integer NOT NULL,
    node_id integer,
    initialpoints double precision,
    worktype integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    assignedto_type character varying(255),
    assignedto_id integer
);


ALTER TABLE public.works OWNER TO graph;

--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: graph
--

CREATE SEQUENCE works_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.works_id_seq OWNER TO graph;

--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph
--

ALTER SEQUENCE works_id_seq OWNED BY works.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE alu_groups ALTER COLUMN id SET DEFAULT nextval('alu_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE chat_messages ALTER COLUMN id SET DEFAULT nextval('chat_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE competence_groups ALTER COLUMN id SET DEFAULT nextval('competence_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE competence_nodes ALTER COLUMN id SET DEFAULT nextval('competence_nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE competences ALTER COLUMN id SET DEFAULT nextval('competences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE concept_maps ALTER COLUMN id SET DEFAULT nextval('concept_maps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE edges ALTER COLUMN id SET DEFAULT nextval('edges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE id_generator ALTER COLUMN id SET DEFAULT nextval('id_generator_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE node_question_relations ALTER COLUMN id SET DEFAULT nextval('node_question_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE nodes ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE question_responses ALTER COLUMN id SET DEFAULT nextval('question_responses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE related_contents ALTER COLUMN id SET DEFAULT nextval('related_contents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE student_assigns ALTER COLUMN id SET DEFAULT nextval('student_assigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE teacher_assigns ALTER COLUMN id SET DEFAULT nextval('teacher_assigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE teachers ALTER COLUMN id SET DEFAULT nextval('teachers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE tests ALTER COLUMN id SET DEFAULT nextval('tests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE user_alu_groups ALTER COLUMN id SET DEFAULT nextval('user_alu_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: graph
--

ALTER TABLE works ALTER COLUMN id SET DEFAULT nextval('works_id_seq'::regclass);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: alu_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY alu_groups
    ADD CONSTRAINT alu_groups_pkey PRIMARY KEY (id);


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: competence_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY competence_groups
    ADD CONSTRAINT competence_groups_pkey PRIMARY KEY (id);


--
-- Name: competence_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY competence_nodes
    ADD CONSTRAINT competence_nodes_pkey PRIMARY KEY (id);


--
-- Name: competences_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY competences
    ADD CONSTRAINT competences_pkey PRIMARY KEY (id);


--
-- Name: concept_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY concept_maps
    ADD CONSTRAINT concept_maps_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: id_generator_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY id_generator
    ADD CONSTRAINT id_generator_pkey PRIMARY KEY (id);


--
-- Name: node_question_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY node_question_relations
    ADD CONSTRAINT node_question_relations_pkey PRIMARY KEY (id);


--
-- Name: nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: question_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY question_responses
    ADD CONSTRAINT question_responses_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: related_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY related_contents
    ADD CONSTRAINT related_contents_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: student_assigns_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY student_assigns
    ADD CONSTRAINT student_assigns_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teacher_assigns_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY teacher_assigns
    ADD CONSTRAINT teacher_assigns_pkey PRIMARY KEY (id);


--
-- Name: teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: tests_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: user_alu_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY user_alu_groups
    ADD CONSTRAINT user_alu_groups_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: works_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: graph; Tablespace: 
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: graph; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: graph; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: graph
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM graph;
GRANT ALL ON SCHEMA public TO graph;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

