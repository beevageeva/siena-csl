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
-- Name: additionalapplet; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE additionalapplet (
    id integer NOT NULL,
    archive character varying(255),
    codebase character varying(255),
    appletclass character varying(255) NOT NULL,
    appletparameters character varying(255)
);


ALTER TABLE public.additionalapplet OWNER TO root;

--
-- Name: conceptmap; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE conceptmap (
    id integer NOT NULL,
    name character varying(255),
    creatorid integer
);


ALTER TABLE public.conceptmap OWNER TO root;

--
-- Name: conceptmapgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE conceptmapgroups (
    conceptmapid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.conceptmapgroups OWNER TO root;

--
-- Name: contentgroupproperties; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE contentgroupproperties (
    id integer NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.contentgroupproperties OWNER TO root;

--
-- Name: courseinfo; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE courseinfo (
    courseid integer NOT NULL,
    active boolean NOT NULL,
    coursetitle character varying(255),
    importdatetime timestamp without time zone,
    creatorid integer
);


ALTER TABLE public.courseinfo OWNER TO root;

--
-- Name: courseinfogroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE courseinfogroups (
    courseinfoid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.courseinfogroups OWNER TO root;

--
-- Name: coursestatus; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE coursestatus (
    completed character varying(255),
    measure character varying(255),
    satisfied character varying(255),
    courseid integer NOT NULL,
    learnerid integer NOT NULL,
    creatorid integer
);


ALTER TABLE public.coursestatus OWNER TO root;

--
-- Name: coursestatusgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE coursestatusgroups (
    coursestatususerid integer NOT NULL,
    coursestatuscourseinfoid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.coursestatusgroups OWNER TO root;

--
-- Name: edge; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE edge (
    srcnodeid integer NOT NULL,
    labelid integer NOT NULL,
    destnodeid integer NOT NULL
);


ALTER TABLE public.edge OWNER TO root;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.groups OWNER TO root;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO root;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('hibernate_sequence', 29307, true);


--
-- Name: iteminfo; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE iteminfo (
    activityid integer NOT NULL,
    type character varying(255),
    title character varying(255),
    abandon boolean,
    attemptabsolutedurationlimit character varying(255),
    completionthreshold character varying(255),
    datafromlms text,
    isexit boolean,
    itemidentifier character varying(255),
    launch text,
    minnormalizedmeasure character varying(255),
    next boolean,
    organizationidentifier character varying(255),
    parameterstring character varying(255),
    persiststate character varying(255),
    previous boolean,
    resourceidentifier character varying(255),
    timelimitaction character varying(255),
    courseid integer NOT NULL,
    creatorid integer
);


ALTER TABLE public.iteminfo OWNER TO root;

--
-- Name: iteminfogroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE iteminfogroups (
    iteminfoid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.iteminfogroups OWNER TO root;

--
-- Name: label; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE label (
    id integer NOT NULL,
    value integer NOT NULL
);


ALTER TABLE public.label OWNER TO root;

--
-- Name: manager; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE manager (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    username character varying(255) NOT NULL
);


ALTER TABLE public.manager OWNER TO root;

--
-- Name: managersgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE managersgroups (
    groupid integer NOT NULL,
    managerid integer NOT NULL
);


ALTER TABLE public.managersgroups OWNER TO root;

--
-- Name: manualfilegroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE manualfilegroups (
    manualfileid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.manualfilegroups OWNER TO root;

--
-- Name: manualfiles; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE manualfiles (
    id integer NOT NULL,
    content text,
    externalfilename character varying(255),
    title character varying(255),
    creatorid integer
);


ALTER TABLE public.manualfiles OWNER TO root;

--
-- Name: node; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE node (
    id integer NOT NULL,
    content character varying(255),
    conceptmapid integer NOT NULL,
    minpasspoints real NOT NULL
);


ALTER TABLE public.node OWNER TO root;

--
-- Name: nodequestionrelation; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE nodequestionrelation (
    id integer NOT NULL,
    qua real NOT NULL,
    groupownerid integer,
    questionid integer NOT NULL,
    nodeid integer NOT NULL
);


ALTER TABLE public.nodequestionrelation OWNER TO root;

--
-- Name: question; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE question (
    id integer NOT NULL,
    content text NOT NULL,
    imagefilename character varying(255),
    correctanswer smallint NOT NULL,
    difficulty real NOT NULL,
    answertime integer NOT NULL,
    luck real NOT NULL,
    additionalappletid integer,
    creatorid integer
);


ALTER TABLE public.question OWNER TO root;

--
-- Name: questiongroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE questiongroups (
    questionid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.questiongroups OWNER TO root;

--
-- Name: questionresponse; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE questionresponse (
    id integer NOT NULL,
    response smallint NOT NULL,
    responsetime timestamp without time zone,
    questionid integer,
    timeleft integer NOT NULL
);


ALTER TABLE public.questionresponse OWNER TO root;

--
-- Name: relatedcontent; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE relatedcontent (
    id integer NOT NULL,
    filename character varying(255),
    creatorid integer,
    nodeid integer,
    relatedcontentinfoid integer,
    recover boolean
);


ALTER TABLE public.relatedcontent OWNER TO root;

--
-- Name: relatedcontentgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE relatedcontentgroups (
    relatedcontentid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.relatedcontentgroups OWNER TO root;

--
-- Name: relatedcontentinfo; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE relatedcontentinfo (
    id integer NOT NULL,
    description text,
    nodeid integer
);


ALTER TABLE public.relatedcontentinfo OWNER TO graph;

--
-- Name: responserelatedcontent; Type: TABLE; Schema: public; Owner: graph; Tablespace: 
--

CREATE TABLE responserelatedcontent (
    id integer NOT NULL,
    filename character varying(255),
    relatedcontentid integer,
    testuserid integer
);


ALTER TABLE public.responserelatedcontent OWNER TO graph;

--
-- Name: respvar; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE respvar (
    id integer NOT NULL,
    response text,
    questionid integer
);


ALTER TABLE public.respvar OWNER TO root;

--
-- Name: scocommentgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE scocommentgroups (
    scocommentid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.scocommentgroups OWNER TO root;

--
-- Name: scocomments; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE scocomments (
    commentid integer NOT NULL,
    comment text,
    commentdatetime timestamp without time zone,
    commentlocation text,
    activityid integer NOT NULL,
    creatorid integer
);


ALTER TABLE public.scocomments OWNER TO root;

--
-- Name: test; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE test (
    id integer NOT NULL,
    finished boolean NOT NULL,
    points real NOT NULL,
    pointsstringarray character varying(255),
    groupownerid integer,
    testgroupid integer
);


ALTER TABLE public.test OWNER TO root;

--
-- Name: testgroup; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE testgroup (
    id integer NOT NULL,
    finished boolean NOT NULL,
    qua real NOT NULL,
    nodeid integer,
    workid integer,
    testuserid integer
);


ALTER TABLE public.testgroup OWNER TO root;

--
-- Name: testquestionresponse; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE testquestionresponse (
    testid integer NOT NULL,
    questionresponseid integer NOT NULL,
    testindexcol integer NOT NULL
);


ALTER TABLE public.testquestionresponse OWNER TO root;

--
-- Name: testusersgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE testusersgroups (
    testuserid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.testusersgroups OWNER TO root;

--
-- Name: usercourseinfo; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE usercourseinfo (
    userid integer NOT NULL,
    courseid integer NOT NULL
);


ALTER TABLE public.usercourseinfo OWNER TO root;

--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE userinfo (
    userid integer NOT NULL,
    language character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    username character varying(255) NOT NULL,
    active boolean,
    audiocaptioning integer,
    audiolevel real,
    deliveryspeed real,
    creatorid integer
);


ALTER TABLE public.userinfo OWNER TO root;

--
-- Name: work; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE work (
    id integer NOT NULL,
    name character varying(255),
    creatorid integer,
    type smallint
);


ALTER TABLE public.work OWNER TO root;

--
-- Name: workgroups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE workgroups (
    workid integer NOT NULL,
    contentgrouppropertyid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public.workgroups OWNER TO root;

--
-- Name: worknodesinitial; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE worknodesinitial (
    workid integer NOT NULL,
    nodeid integer NOT NULL,
    workindexcol integer NOT NULL
);


ALTER TABLE public.worknodesinitial OWNER TO root;

--
-- Name: worknodesobjective; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE worknodesobjective (
    workid integer NOT NULL,
    nodeid integer NOT NULL,
    workindexcol integer NOT NULL
);


ALTER TABLE public.worknodesobjective OWNER TO root;

--
-- Data for Name: additionalapplet; Type: TABLE DATA; Schema: public; Owner: root
--

COPY additionalapplet (id, archive, codebase, appletclass, appletparameters) FROM stdin;
\.


--
-- Data for Name: conceptmap; Type: TABLE DATA; Schema: public; Owner: root
--

COPY conceptmap (id, name, creatorid) FROM stdin;
24	potencia e raiz	23
77	prueba	72
96	dddc	72
3582	ttt	72
3609	ref2	72
3636	xxc	72
3663	ref32	72
3927	test2	72
4047	comp	72
4153	mapa2	72
4281	scomax	4210
5936	Gráficos Dinámicos - Excel	5890
6283	prueba	6272
6404	Estrategias en Computer Go	6353
6405	Estrategias en Computer Go	6353
6421	Teide2	6420
7815	Números Naturais	4212
13198	Detectores	6272
13556	habil_5serie	40
14599	biologia_bacterias	6272
15393	habil_6serie	40
16515	habili_7serie	40
16902	habil_8serie	40
21504	mapa_asignatura_Arquitectura	17259
25254	p5	20
25272	pp	20
25308	ppp	20
25393	pppp	20
25490	pe	20
25522	pee	20
25859	Pensamentos	6370
28749		17259
28788	Geometria Analítica	4350
\.


--
-- Data for Name: conceptmapgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY conceptmapgroups (conceptmapid, contentgrouppropertyid, groupid) FROM stdin;
3582	2	17
3609	2	17
3663	2	17
3927	2	17
4047	2	17
4153	2	17
5936	1	5891
\.


--
-- Data for Name: contentgroupproperties; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentgroupproperties (id, type) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: courseinfo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY courseinfo (courseid, active, coursetitle, importdatetime, creatorid) FROM stdin;
\.


--
-- Data for Name: courseinfogroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY courseinfogroups (courseinfoid, contentgrouppropertyid, groupid) FROM stdin;
\.


--
-- Data for Name: coursestatus; Type: TABLE DATA; Schema: public; Owner: root
--

COPY coursestatus (completed, measure, satisfied, courseid, learnerid, creatorid) FROM stdin;
\.


--
-- Data for Name: coursestatusgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY coursestatusgroups (coursestatususerid, coursestatuscourseinfoid, contentgrouppropertyid, groupid) FROM stdin;
\.


--
-- Data for Name: edge; Type: TABLE DATA; Schema: public; Owner: root
--

COPY edge (srcnodeid, labelid, destnodeid) FROM stdin;
28	39	33
27	39	34
27	39	35
27	39	37
27	39	25
27	39	28
34	39	33
33	39	26
32	39	27
29	39	27
37	39	33
35	39	33
31	39	27
36	39	27
25	39	33
30	39	32
30	39	38
30	39	36
30	39	29
30	39	31
38	39	27
13219	39	13229
13219	39	13227
13219	39	13222
13219	39	13238
13214	39	13231
13214	39	13211
13230	39	13219
13230	39	13203
13199	39	13214
13199	39	13225
13199	39	13223
13235	39	13206
13235	39	13201
13235	39	13202
13217	39	13212
13217	39	13215
13217	39	13209
3607	39	3591
3589	39	3587
3592	39	3587
3588	39	3589
3590	39	3592
3590	39	3589
3591	39	3592
3596	39	3600
3601	39	3600
3598	39	3600
3604	39	3600
3599	39	3600
3595	39	3600
3594	39	3600
3606	39	3600
3597	39	3600
3602	39	3600
3603	39	3600
3605	39	3600
3634	39	3618
3616	39	3614
3619	39	3614
3615	39	3616
3617	39	3619
3617	39	3616
3618	39	3619
3623	39	3627
3628	39	3627
3625	39	3627
3631	39	3627
3626	39	3627
3622	39	3627
3621	39	3627
3633	39	3627
3624	39	3627
3629	39	3627
3630	39	3627
3632	39	3627
3661	39	3645
3643	39	3641
3646	39	3641
3642	39	3643
3644	39	3646
3644	39	3643
3645	39	3646
3650	39	3654
3655	39	3654
3652	39	3654
3658	39	3654
3653	39	3654
3649	39	3654
3648	39	3654
3651	39	3654
3656	39	3654
3657	39	3654
3659	39	3654
3688	39	3672
3670	39	3668
3673	39	3668
3669	39	3670
3671	39	3673
3671	39	3670
3672	39	3673
3677	39	3681
3682	39	3681
3679	39	3681
3685	39	3681
3680	39	3681
3676	39	3681
3675	39	3681
3687	39	3681
3678	39	3681
3683	39	3681
3684	39	3681
3686	39	3681
3990	39	3992
3950	39	3975
3950	39	3974
3950	39	3973
3950	39	3981
3950	39	3980
3950	39	3979
3950	39	3978
3950	39	3977
3950	39	3976
4021	39	3975
4021	39	3974
4021	39	3973
4021	39	3981
4021	39	3980
4021	39	3979
4021	39	3978
4021	39	3977
4021	39	3976
3929	39	3985
3996	39	3930
3947	39	3991
3992	39	3998
3992	39	3999
3992	39	3997
4110	39	4112
4070	39	4097
4070	39	4096
4070	39	4099
4070	39	4098
4070	39	4101
4070	39	4100
4070	39	4093
4070	39	4094
4070	39	4095
4141	39	4097
4141	39	4096
4141	39	4099
4141	39	4098
4141	39	4101
4141	39	4100
4141	39	4093
4141	39	4094
4141	39	4095
4049	39	4105
4116	39	4050
4067	39	4111
4112	39	4117
4112	39	4118
4112	39	4119
4155	39	4164
4155	39	4166
4155	39	4154
4167	39	4165
4163	39	4167
4163	39	4159
4165	39	4168
4154	39	4160
4162	39	4156
4162	39	4157
4156	39	4161
4164	39	4160
4166	39	4160
4159	39	4165
4161	39	4155
4158	39	4162
4168	39	4158
4157	39	4155
4287	39	4284
4287	39	4293
4285	39	4292
4285	39	4288
4283	39	4287
4286	39	4293
4292	39	4284
4291	39	4282
4288	39	4282
4289	39	4286
4290	39	4291
13217	39	13207
13217	39	13237
13217	39	13234
13217	39	13233
13213	39	13230
13213	39	13199
13213	39	13235
13213	39	13217
13203	39	13236
13203	39	13200
13223	39	13218
13223	39	13232
13202	39	13226
13202	39	13224
13202	39	13210
13202	39	13221
13218	39	13208
13218	39	13216
13229	39	13228
13229	39	13220
13225	39	13205
13225	39	13204
13561	39	13560
78	39	79
5958	39	5948
5958	39	5950
5958	39	5946
5958	39	5947
5958	39	5955
5958	39	5952
5949	39	5945
5949	39	5953
5949	39	5943
5949	39	5957
5954	39	5951
5954	39	5944
5954	39	5940
5954	39	5941
5954	39	5942
5954	39	5937
5954	39	5938
5954	39	5939
5956	39	5949
5956	39	5954
5956	39	5958
6284	39	6285
6286	39	6284
6286	39	6287
6287	39	6285
13562	39	13558
13562	39	13561
13557	39	13562
13560	39	13563
13558	39	13560
13559	39	13557
15395	39	15397
15399	39	15394
15398	39	15399
15400	39	15398
15394	39	15396
15396	39	15395
16905	39	16909
16907	39	16904
16909	39	16907
16904	39	16910
16906	39	16903
16908	39	16906
16903	39	16905
25257	39	25262
25255	39	25256
25255	39	25260
6407	39	6416
6414	39	6417
6414	39	6408
6410	39	6416
6410	39	6411
6409	39	6417
6409	39	6414
6406	39	6418
6406	39	6417
6406	39	6410
6406	39	6414
6419	39	6411
6412	39	6418
6412	39	6417
6418	39	6411
6415	39	6411
6417	39	6416
6413	39	6416
6424	39	6426
6424	39	6425
6431	39	6430
6426	39	6423
6423	39	6422
6423	39	6429
6422	39	6427
6422	39	6430
6422	39	6431
6422	39	6428
6428	39	6431
6430	39	6427
6429	39	6428
7823	39	7816
7816	39	7820
7816	39	7819
7820	39	7821
7818	39	7824
7817	39	7816
7824	39	7822
7822	39	7823
7822	39	7817
7819	39	7821
25260	39	25259
25258	39	25261
25262	39	25261
25259	39	25258
25256	39	25257
25274	39	25279
25275	39	25278
25273	39	25277
25277	39	25274
25277	39	25276
25279	39	25278
25276	39	25275
25310	39	25311
25310	39	25315
25312	39	25311
25312	39	25315
25311	39	25314
25309	39	25313
25313	39	25310
25313	39	25312
25315	39	25314
25492	39	25497
25492	39	25493
25495	39	25491
25495	39	25492
25495	39	25494
25494	39	25497
25494	39	25493
25491	39	25492
25491	39	25494
25493	39	25496
25497	39	25496
25395	39	25396
25395	39	25400
25397	39	25396
25397	39	25400
25394	39	25395
25394	39	25397
25396	39	25399
25398	39	25395
25398	39	25397
25400	39	25399
25523	39	25527
25524	39	25529
25524	39	25525
25526	39	25529
25526	39	25525
25527	39	25526
14606	39	14601
14606	39	14604
14608	39	14605
14608	39	14606
25527	39	25524
25525	39	25528
25529	39	25528
25860	39	25864
25861	39	25866
25861	39	25862
25863	39	25866
25863	39	25862
25864	39	25861
25864	39	25863
25862	39	25865
25866	39	25865
28783	39	28776
28783	39	28779
28783	39	28781
28785	39	28782
28775	39	28784
28775	39	28777
28750	39	28782
28781	39	28786
28781	39	28778
28780	39	28775
28780	39	28783
28779	39	28786
28779	39	28776
28779	39	28778
28777	39	28776
28786	39	28785
28786	39	28776
28786	39	28778
28786	39	28782
28778	39	28776
28778	39	28750
14605	39	14609
14605	39	14600
14605	39	14603
14601	39	14602
14601	39	14605
14604	39	14605
28778	39	28782
28784	39	28776
28770	39	28754
28772	39	28754
28769	39	28772
28773	39	28770
14610	39	14602
16521	39	16517
16518	39	16520
16519	39	16521
16517	39	16518
16516	39	16519
21507	39	21516
21507	39	21515
21517	39	21516
21517	39	21511
21517	39	21505
21517	39	21506
21508	39	21516
21508	39	21515
21511	39	21513
21511	39	21514
21510	39	21517
21510	39	21513
21510	39	21515
21510	39	21514
21510	39	21508
21510	39	21507
21505	39	21508
21505	39	21507
21505	39	21506
21512	39	21511
21509	39	21517
21515	39	21512
21516	39	21509
21516	39	21510
28773	39	28772
28771	39	28770
28774	39	28769
28759	39	28761
28768	39	28761
28756	39	28761
28766	39	28761
28762	39	28761
28757	39	28761
28765	39	28761
28763	39	28761
28760	39	28761
28758	39	28761
28767	39	28761
28764	39	28761
28789	39	28790
28789	39	28792
28789	39	28793
28789	39	28795
28794	39	28797
28791	39	28796
28792	39	28794
28795	39	28794
28793	39	28791
28790	39	28791
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY groups (id, name, description) FROM stdin;
17	algebra	bbbbbbbbb
19	analisis combinatorio	e o melhor do mundo
434	Eq_grau_1	Grupo destinado ao estudo da equação de 1º grau.
4211	Asignatura Testeo Evelio	Para comprobar la usabilidad de SCOMAX
4213	Operações Naturais	Esse grupo foi criado para a dissertação de Viviane Ruppenthal, que trabalhara com operações de numeros naturais.
4224	Duria	Alumnos del DURIA
4226	DURIANico	Clase de Nicolás Manuel Hernández Rodríguez
5891	DuriaIsidoro	Asignatura de Isidoro y Elena
6351	GECEM	Grupo de Estudos Curriculares de Educação Matemática
6354	IA y Educacion	Asignatura del programa de doctorado Física e Informática
17260	Arquitectura	ASrquitectura e Ingeniería de Computadores. Grupo de alumnos trabajando sobre el mapa conceptual de la asignatura de 5º de Ingeniería informática
\.


--
-- Data for Name: iteminfo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY iteminfo (activityid, type, title, abandon, attemptabsolutedurationlimit, completionthreshold, datafromlms, isexit, itemidentifier, launch, minnormalizedmeasure, next, organizationidentifier, parameterstring, persiststate, previous, resourceidentifier, timelimitaction, courseid, creatorid) FROM stdin;
\.


--
-- Data for Name: iteminfogroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY iteminfogroups (iteminfoid, contentgrouppropertyid, groupid) FROM stdin;
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: root
--

COPY label (id, value) FROM stdin;
39	1
\.


--
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: root
--

COPY manager (id, email, password, lastname, firstname, username) FROM stdin;
20	lis_zoch@hotmail.com	3723f3084fb6561d5e2415dc57935883	lisiane	zoch	lis
23	vitinhosales@pop.com.br	997d13b90da22b35ce43bebdd332ad11	vitor	sales	vitor
40	fisicademais@yahoo.com.br	e478c978d245934642fd9ed1de56dc05	ednei	becher	ed
72	prof@ull.es	d450c5dbcc10db0749277efc32f15f9f	prof	prof	prof
4210	ej@ull.es	3334703c735bd09f54c377b4dfaac1c3	Evelio	Gonzalez	evelio
4212	vivianeruppenthal@hotmail.com	c3bb6f719742fd1e5768d6d1361cfb49	viviane	viviane	viviane
4223	prof1@ull.es	4be8fcd3fa65ec010eac59a5649fc498	prof1	prof1	prof1Duria
4225	nico@ull.es	df5c775ac61dcbf5297dd7a05964d753	nico	nico	nico
4350	jjdallemole@yahoo.com.br	2b45c629e577731c4df84fc34f936a89	Joseide	Dallemole	Joseide
5890	inieves@huc.canarias.org	f86bf9cd029fe08ca483403c55d6b101	isidoron	isidoros	isidoro
6272	lorenzo@isaatc.ull.es	3334703c735bd09f54c377b4dfaac1c3	lorenzo	lorenzo	lorenzo
6353	jacques@dybot.com	b402b481bc0dbd51687430c586c7909a	Santiago	Basaldua	Santiago
6420	salomeher25@hotmail.com	d71a104f87c82c79b6001afbf74c3e88	Salomé	Hernández	salome
6370	lis_zoch@brturbo.com	61570ea29673414094f0858308948a53	gecem	gecem	gecem
17259	grupo@hotmail.com	9fbe2661c5e16cb142faed9abda2a806	grupo	grupo	grupo
27634	cjgonza@ull.es	39669fe59d20071e5c69394fda411a43	carina	gonzalez	carina
\.


--
-- Data for Name: managersgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY managersgroups (groupid, managerid) FROM stdin;
19	20
17	20
17	72
434	40
4224	4223
4226	4225
5891	5890
6351	20
6354	6420
\.


--
-- Data for Name: manualfilegroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY manualfilegroups (manualfileid, contentgrouppropertyid, groupid) FROM stdin;
4207	2	17
4208	1	17
\.


--
-- Data for Name: manualfiles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY manualfiles (id, content, externalfilename, title, creatorid) FROM stdin;
4207		\N	texto	72
4208		\N	texto1	72
6398	Artículo publicado en IEEE Intelligent Systems\r\nTítulo : The Challenge of Go\r\nAutor  : Jan Krikke\r\nFecha  : Enero/febrero 2007\r\n\r\nArtículo publicado tras los primeros éxitos de los programas UCT\r\nEl algoritmo fue publicado en 2006 y, desde entonces, el primer\r\nprograma competitivo UCT (mogo) empezaba a ganar campeonatos:\r\n\r\nRecogen además la noticia, medios mundiales:\r\n\r\nScientific American\r\nThe Times\r\nThe Economist\r\nABC news\r\nLa agencia Reuters\r\netc.\r\n\r\nRecogen además la noticia, medios españoles:\r\n<void>\r\n\r\n	\N	IEEE The Challenge of Go	6353
6449	esto es una prueba	\N	Teide2	6420
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: root
--

COPY node (id, content, conceptmapid, minpasspoints) FROM stdin;
5937	Elemento del campo de página	5936	0
5938	Campo de fila	5936	0
5939	Área de datos	5936	0
5940	Flecha de la lista desplegable de campo	5936	0
5941	Campo de datos TD	5936	0
5942	Campo de página TD	5936	0
5943	Ejes	5936	0
5944	Elemento TD	5936	0
5945	Series	5936	0
5946	Campo de datos GD	5936	0
5947	Campo de categoría	5936	0
5948	Campo de página GD	5936	0
5949	Gráficos	5936	0
5950	Elemento GD	5936	0
5951	Campo de columna	5936	0
5952	Representación de un GD	5936	0
5953	Marcadores de datos	5936	0
5954	Tablas Dinámicas	5936	0
5955	Campo de serie	5936	0
5956	Gráfico Dinámico	5936	0
5957	Categorías	5936	0
5958	Informe de Gráfico Dinámico	5936	0
6406	Conocimiento de fundamentos de programación de ordenadores	6405	0
6407	Sigue necesitando apoyo de conocimiento offline para ser competitivo en tableros grandes. El análisis de las posiciones no resulta útil como herramienta de aprendizaje	6405	0
6408	Los métodos Monte-Carlo sin aprendizaje no producen programas competitivos	6405	0
6409	Conocimiento de teoría de la probabilidad y procesos estocásticos	6405	0
6410	Métodos estado->acción basados en aprendizaje de patrones	6405	0
6411	Computer Go "clásico" (1980-2005)	6405	0
6412	Conocimiento de técnicas combinatorias de búsqueda	6405	0
6413	Hoy en día todos los programas superiores realizan simulaciones y se obtienen muchos beneficios del paralelismo	6405	0
6414	Métodos Monte-Carlo simples (mejor esperanza en la simulación)	6405	0
6415	El conocimiento del juego ha sido implantado, no aprendido por el programa. Además no aprovecha las capacidades del hardware actual (mal o ningún paralelismo)	6405	0
6416	Computer Go actual	6405	0
6417	Métodos Monte-Carlo basados en aprendizaje online utilizando árboles en memoria (UCT)	6405	0
6418	Búsqueda minimax con alfa-beta pruning	6405	0
6419	Es normalmente muy rápido y permite un nivel de juego similar al de un aficionado humano medio	6405	0
6422	Proceder completo	6421	0
6423	Carga de datos	6421	0
6424	Principal	6421	0
6425	Nuevo metafile	6421	0
6426	Abrir metafile	6421	0
6427	Estadisticas	6421	0
6428	Eval rangos	6421	0
6429	Proceder paso a paso	6421	0
6430	Imputacion	6421	0
6431	Eval edits	6421	0
97	err	96	0.5
25255	Pensamentos	25254	0.5
25256	H14	25254	0.5
25257	Pensamento Estatístico-probabilístico	25254	0.5
25258	Pensamento Algébrico	25254	0.5
25259	Pensamento Combinatório	25254	0.5
25260	H12	25254	0.5
25261	Pensamento Aritmético	25254	0.5
25262	Pensamento Geométrico	25254	0.5
25273	H14	25272	0.5
25274	Pensamento Estatístico-probabilístico	25272	0.5
25275	Pensamento Algébrico	25272	0.5
25276	Pensamento Combinatório	25272	0.5
25277	H12	25272	0.5
25278	Pensamento Aritmético	25272	0.5
25279	Pensamento Geométrico	25272	0.5
25309	H14	25308	0.5
25310	Pensamento Estatístico-probabilístico	25308	0.5
25311	Pensamento Algébrico	25308	0.5
25312	Pensamento Combinatório	25308	0.5
25313	H12	25308	0.5
25314	Pensamento Aritmético	25308	0.5
25315	Pensamento Geométrico	25308	0.5
25394	H14	25393	0.5
25395	Pensamento Estatístico-probabilístico	25393	0.5
25396	Pensamento Algébrico	25393	0.5
25397	Pensamento Combinatório	25393	0.5
25398	H12	25393	0.5
25399	Pensamento Aritmético	25393	0.5
25400	Pensamento Geométrico	25393	0.5
4021	local	3927	0.5
78	nodo1	77	0.69999999
6284	nodo 2	6283	0
6285	nodo 4	6283	0
6287	nodo 3	6283	0.5
6286	nodo 1	6283	0.5
25491	H14	25490	0.5
25492	Pensamento Estatístico-probabilístico	25490	0.5
25493	Pensamento Algébrico	25490	0.5
25494	Pensamento Combinatório	25490	0.5
25495	H12	25490	0.5
25496	Pensamento Aritmético	25490	0.5
25497	Pensamento Geométrico	25490	0.5
25	expressao e algoritimo Potencia	24	0.5
26	5 serie	24	0.5
27	raiz	24	0.5
28	generalizacao Potencia	24	0.5
29	propriedade Raiz	24	0.5
30	6 serie	24	0.5
31	conceito Raiz	24	0.5
32	geometria Raiz	24	0.5
33	Potencia	24	0.5
34	conceito Potencia	24	0.5
35	propriedade Potencia	24	0.5
36	generalizacao Raiz	24	0.5
37	geometria Potencia	24	0.5
38	expressao e algoritimo Raiz	24	0.5
79	nodo2	77	0.5
80	nodo3	77	0.5
98	ref	96	0.5
3583	ref	3582	0.5
3584	QuickStart video (website)	3582	0.5
3585	QuickStart video (local)	3582	0.5
3586	Compendium Institute Website	3582	0.5
3587	This is an ISSUE. It could be driven by a methodology, or captured as it arises in a discussion.	3582	0.5
3588	Use a CON to express a challenging argument	3582	0.5
3589	This is an OPTION which responds to an Issue. The asterisk shows there is detail text inside the node	3582	0.5
3590	Use an ARGUMENT to express an argument more formally as criterion to be satisfied, and which might have supporting, challenging or neutral relations to other nodes (e.g. \\"Cost\\")	3582	0.5
3591	Use a PRO to express a supporting argument 	3582	0.5
3592	Make an OPTION into a DECISION node to show commitment	3582	0.5
3593	This is a NOTE for misc. comments	3582	0.5
3594	REFERENCE: with an Access file link	3582	0.5
3595	REFERENCE to an unrecognised file type (hence the generic Reference icon)	3582	0.5
3596	REFERENCE: with an XML file link	3582	0.5
3597	REFERENCE to a PowerPoint file	3582	0.5
3598	REFERENCE to an Acrobat PDF file	3582	0.5
3599	REFERENCES link to external documents; double-click to launch, e.g....	3582	0.5
3600	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	3582	0.5
3601	REFERENCE: with a Word file link	3582	0.5
3602	REFERENCE: with a text file link	3582	0.5
3603	REFERENCE: weblink to www.CompendiumInstitute.org	3582	0.5
3604	REFERENCE: with a Java file link	3582	0.5
3605	REFERENCE to a movie file	3582	0.5
3606	REFERENCE: with a Excel file link	3582	0.5
3607	All of these nodes are \\"transcluded\\" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	3582	0.5
3608	ooo	3582	0.5
3610	ref	3609	0.5
3611	QuickStart video (website)	3609	0.5
3612	QuickStart video (local)	3609	0.5
3613	Compendium Institute Website	3609	0.5
3614	This is an ISSUE. It could be driven by a methodology, or captured as it arises in a discussion.	3609	0.5
3615	Use a CON to express a challenging argument	3609	0.5
4145	Traduccion de direcciones	4047	0.5
4146	write allocate	4047	0.5
4147	writeback	4047	0.5
4148	nowrite allocate	4047	0.5
4149	writethrough	4047	0.5
4150	Tabla de paginas	4047	0.5
4151	Localidad Temporal	4047	0.5
4152	Localidad Espacial	4047	0.5
4154	Linguagem Numerica	4153	0.5
4155	Rpresentaçao de Quantidade	4153	0.5
4156	Igual, diferente, maior que e menor que	4153	0.5
4157	Reta numérica	4153	0.5
3616	This is an OPTION which responds to an Issue. The asterisk shows there is detail text inside the node	3609	0.5
3617	Use an ARGUMENT to express an argument more formally as criterion to be satisfied, and which might have supporting, challenging or neutral relations to other nodes (e.g. \\"Cost\\")	3609	0.5
3618	Use a PRO to express a supporting argument 	3609	0.5
3619	Make an OPTION into a DECISION node to show commitment	3609	0.5
3620	This is a NOTE for misc. comments	3609	0.5
3621	REFERENCE: with an Access file link	3609	0.5
3622	REFERENCE to an unrecognised file type (hence the generic Reference icon)	3609	0.5
3623	REFERENCE: with an XML file link	3609	0.5
3624	REFERENCE to a PowerPoint file	3609	0.5
3625	REFERENCE to an Acrobat PDF file	3609	0.5
3626	REFERENCES link to external documents; double-click to launch, e.g....	3609	0.5
3627	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	3609	0.5
3628	REFERENCE: with a Word file link	3609	0.5
3629	REFERENCE: with a text file link	3609	0.5
3630	REFERENCE: weblink to www.CompendiumInstitute.org	3609	0.5
3631	REFERENCE: with a Java file link	3609	0.5
3632	REFERENCE to a movie file	3609	0.5
3633	REFERENCE: with a Excel file link	3609	0.5
3634	All of these nodes are \\"transcluded\\" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	3609	0.5
3635	ooo	3609	0.5
3637	ref	3636	0.5
3638	QuickStart video (website)	3636	0.5
3639	QuickStart video (local)	3636	0.5
3640	Compendium Institute Website	3636	0.5
3641	This is an ISSUE. It could be driven by a methodology, or captured as it arises in a discussion.	3636	0.5
3642	Use a CON to express a challenging argument	3636	0.5
3643	This is an OPTION which responds to an Issue. The asterisk shows there is detail text inside the node	3636	0.5
3644	Use an ARGUMENT to express an argument more formally as criterion to be satisfied, and which might have supporting, challenging or neutral relations to other nodes (e.g. \\"Cost\\")	3636	0.5
3645	Use a PRO to express a supporting argument 	3636	0.5
3646	Make an OPTION into a DECISION node to show commitment	3636	0.5
3647	This is a NOTE for misc. comments	3636	0.5
3648	REFERENCE: with an Access file link	3636	0.5
3649	REFERENCE to an unrecognised file type (hence the generic Reference icon)	3636	0.5
3650	REFERENCE: with an XML file link	3636	0.5
3651	REFERENCE to a PowerPoint file	3636	0.5
3652	REFERENCE to an Acrobat PDF file	3636	0.5
3653	REFERENCES link to external documents; double-click to launch, e.g....	3636	0.5
3654	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	3636	0.5
3655	REFERENCE: with a Word file link	3636	0.5
3656	REFERENCE: with a text file link	3636	0.5
3657	REFERENCE: weblink to www.CompendiumInstitute.org	3636	0.5
3658	REFERENCE: with a Java file link	3636	0.5
3659	REFERENCE to a movie file	3636	0.5
3661	All of these nodes are \\"transcluded\\" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	3636	0.5
3662	ooo	3636	0.5
3664	ref	3663	0.5
3665	QuickStart video (website)	3663	0.5
3666	QuickStart video (local)	3663	0.5
3667	Compendium Institute Website	3663	0.5
3668	This is an ISSUE. It could be driven by a methodology, or captured as it arises in a discussion.	3663	0.5
3669	Use a CON to express a challenging argument	3663	0.5
3670	This is an OPTION which responds to an Issue. The asterisk shows there is detail text inside the node	3663	0.5
3671	Use an ARGUMENT to express an argument more formally as criterion to be satisfied, and which might have supporting, challenging or neutral relations to other nodes (e.g. \\"Cost\\")	3663	0.5
3672	Use a PRO to express a supporting argument 	3663	0.5
3673	Make an OPTION into a DECISION node to show commitment	3663	0.5
3674	This is a NOTE for misc. comments	3663	0.5
3675	REFERENCE: with an Access file link	3663	0.5
3676	REFERENCE to an unrecognised file type (hence the generic Reference icon)	3663	0.5
3677	REFERENCE: with an XML file link	3663	0.5
3678	REFERENCE to a PowerPoint file	3663	0.5
3679	REFERENCE to an Acrobat PDF file	3663	0.5
3680	REFERENCES link to external documents; double-click to launch, e.g....	3663	0.5
3681	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	3663	0.5
3682	REFERENCE: with a Word file link	3663	0.5
3683	REFERENCE: with a text file link	3663	0.5
3684	REFERENCE: weblink to www.CompendiumInstitute.org	3663	0.5
3685	REFERENCE: with a Java file link	3663	0.5
3686	REFERENCE to a movie file	3663	0.5
3687	REFERENCE: with a Excel file link	3663	0.5
3688	All of these nodes are \\"transcluded\\" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	3663	0.5
3689	ooo	3663	0.5
3928	procesos	3927	0.5
3929	multiprocesador	3927	0.5
3930	local	3927	0.5
3931		3927	0.5
3932	jerarquia de memoria	3927	0.5
3933	Memoria compartida	3927	0.5
3934		3927	0.5
3935	cola de espera	3927	0.5
3936	Working Set	3927	0.5
3937	memoria principal	3927	0.5
3938	cola de ejecucion	3927	0.5
3939	Disco de Estado Sólido	3927	0.5
3940	Cinta	3927	0.5
3941	Disco Optico	3927	0.5
3942	Disco Magnético	3927	0.5
3943	TLB	3927	0.5
3944	Memoria fisica	3927	0.5
3945	cache	3927	0.5
3946	Coherencia	3927	0.5
3947	Traduccion de direcciones	3927	0.5
3948	memoria virtual	3927	0.5
3949	TLB	3927	0.5
3950	global	3927	0.5
3951	memoria virtual	3927	0.5
3952	Asociativa por conjuntos	3927	0.5
3953	Completamente Asociativa	3927	0.5
3954	Mapeado directo	3927	0.5
3955	Memoria compartida	3927	0.5
3956	multiprocesador	3927	0.5
3957	Segmentada	3927	0.5
3958	Paginadad-Segmentada	3927	0.5
3959	Paginada	3927	0.5
3960	SAM	3927	0.5
3961	CAM	3927	0.5
3962	RAM	3927	0.5
3963	registros	3927	0.5
3964	global	3927	0.5
3965	sistema	3927	0.5
3966	EEPROM	3927	0.5
3967	EPROM	3927	0.5
3968	Flash	3927	0.5
3969	PROM	3927	0.5
3970	ROM	3927	0.5
3971	asignacion de memoria	3927	0.5
3972	monoprocesador	3927	0.5
3973	NFU	3927	0.5
3974	LFU	3927	0.5
3975	MRU	3927	0.5
3976	NRU	3927	0.5
3977	LRU	3927	0.5
3978	FIFO	3927	0.5
3979	OPT	3927	0.5
3980	PFF	3927	0.5
3981	Random	3927	0.5
3982	Memoria fisica	3927	0.5
3983	Working Set	3927	0.5
3984	memoria principal	3927	0.5
3985	Memoria distribuida	3927	0.5
3986	Politica de reemplazamiento memoria principal	3927	0.5
3987	Memoria distribuida	3927	0.5
3988	monoprocesador	3927	0.5
3989	Politica de reemplazamiento memoria principal	3927	0.5
3990	sistema	3927	0.5
3991	Tabla de paginas	3927	0.5
3992	jerarquia de memoria	3927	0.5
3993	Coherencia	3927	0.5
3994	cola de ejecucion	3927	0.5
3995	cola de espera	3927	0.5
3996	asignacion de memoria	3927	0.5
3997	QuickStart video (website)	3927	0.5
3998	QuickStart video (local)	3927	0.5
3999	Compendium Institute Website	3927	0.5
4000	This is an ISSUE. It could be driven by a methodology, or captured as it arises in a discussion.	3927	0.5
4001	Use a CON to express a challenging argument	3927	0.5
4002	This is an OPTION which responds to an Issue. The asterisk shows there is detail text inside the node	3927	0.5
4003	Use an ARGUMENT to express an argument more formally as criterion to be satisfied, and which might have supporting, challenging or neutral relations to other nodes (e.g. \\"Cost\\")	3927	0.5
4004	Use a PRO to express a supporting argument 	3927	0.5
4005	Make an OPTION into a DECISION node to show commitment	3927	0.5
4006	This is a NOTE for misc. comments	3927	0.5
4007	REFERENCE: with an Access file link	3927	0.5
4008	REFERENCE to an unrecognised file type (hence the generic Reference icon)	3927	0.5
4009	REFERENCE: with an XML file link	3927	0.5
4010	REFERENCE to a PowerPoint file	3927	0.5
4011	REFERENCE to an Acrobat PDF file	3927	0.5
4012	REFERENCES link to external documents; double-click to launch, e.g....	3927	0.5
4013	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	3927	0.5
4014	REFERENCE: with a Word file link	3927	0.5
4015	REFERENCE: with a text file link	3927	0.5
4016	REFERENCE: weblink to www.CompendiumInstitute.org	3927	0.5
4017	REFERENCE: with a Java file link	3927	0.5
4018	REFERENCE to a movie file	3927	0.5
4019	REFERENCE: with a Excel file link	3927	0.5
4020	All of these nodes are \\"transcluded\\" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	3927	0.5
4022	Harvard	3927	0.5
4023	Unificada	3927	0.5
4024	procesos	3927	0.5
4025	Traduccion de direcciones	3927	0.5
4026	write allocate	3927	0.5
4027	writeback	3927	0.5
4028	nowrite allocate	3927	0.5
4029	writethrough	3927	0.5
4030	Tabla de paginas	3927	0.5
4031	Localidad Temporal	3927	0.5
4032	Localidad Espacial	3927	0.5
4048	procesos	4047	0.5
4049	multiprocesador	4047	0.5
4050	local	4047	0.5
4051		4047	0.5
4052	jerarquia de memoria	4047	0.5
4053	Memoria compartida	4047	0.5
4054		4047	0.5
4055	cola de espera	4047	0.5
4056	Working Set	4047	0.5
4057	memoria principal	4047	0.5
4058	cola de ejecucion	4047	0.5
4059	Disco de Estado Sólido	4047	0.5
4060	Cinta	4047	0.5
4061	Disco Optico	4047	0.5
4062	Disco Magnético	4047	0.5
4063	TLB	4047	0.5
4064	Memoria fisica	4047	0.5
4065	cache	4047	0.5
4066	Coherencia	4047	0.5
4067	Traduccion de direcciones	4047	0.5
4068	memoria virtual	4047	0.5
4069	TLB	4047	0.5
4070	global	4047	0.5
4071	memoria virtual	4047	0.5
4072	Asociativa por conjuntos	4047	0.5
4073	Completamente Asociativa	4047	0.5
4074	Mapeado directo	4047	0.5
4075	Memoria compartida	4047	0.5
4076	multiprocesador	4047	0.5
4077	Segmentada	4047	0.5
4078	Paginadad-Segmentada	4047	0.5
4079	Paginada	4047	0.5
4080	SAM	4047	0.5
4081	CAM	4047	0.5
4082	RAM	4047	0.5
4083	registros	4047	0.5
4084	global	4047	0.5
4085	sistema	4047	0.5
4086	EEPROM	4047	0.5
4087	EPROM	4047	0.5
4088	Flash	4047	0.5
4089	PROM	4047	0.5
4090	ROM	4047	0.5
4091	asignacion de memoria	4047	0.5
4092	monoprocesador	4047	0.5
4093	NFU	4047	0.5
4094	LFU	4047	0.5
4095	MRU	4047	0.5
4096	NRU	4047	0.5
4097	LRU	4047	0.5
4098	FIFO	4047	0.5
4099	OPT	4047	0.5
4100	PFF	4047	0.5
4101	Random	4047	0.5
4102	Memoria fisica	4047	0.5
4103	Working Set	4047	0.5
4104	memoria principal	4047	0.5
4105	Memoria distribuida	4047	0.5
4106	Politica de reemplazamiento memoria principal	4047	0.5
4107	Memoria distribuida	4047	0.5
4108	monoprocesador	4047	0.5
4109	Politica de reemplazamiento memoria principal	4047	0.5
4110	sistema	4047	0.5
4111	Tabla de paginas	4047	0.5
4112	jerarquia de memoria	4047	0.5
4113	Coherencia	4047	0.5
4114	cola de ejecucion	4047	0.5
4115	cola de espera	4047	0.5
4116	asignacion de memoria	4047	0.5
4117	QuickStart video (website)	4047	0.5
4118	QuickStart video (local)	4047	0.5
4119	Compendium Institute Website	4047	0.5
4120	This is an ISSUE. It could be driven by a methodology, or captured as it arises in a discussion.	4047	0.5
4121	Use a CON to express a challenging argument	4047	0.5
4122	This is an OPTION which responds to an Issue. The asterisk shows there is detail text inside the node	4047	0.5
4123	Use an ARGUMENT to express an argument more formally as criterion to be satisfied, and which might have supporting, challenging or neutral relations to other nodes (e.g. \\"Cost\\")	4047	0.5
4124	Use a PRO to express a supporting argument 	4047	0.5
4125	Make an OPTION into a DECISION node to show commitment	4047	0.5
4126	This is a NOTE for misc. comments	4047	0.5
4127	REFERENCE: with an Access file link	4047	0.5
4128	REFERENCE to an unrecognised file type (hence the generic Reference icon)	4047	0.5
4129	REFERENCE: with an XML file link	4047	0.5
4130	REFERENCE to a PowerPoint file	4047	0.5
4131	REFERENCE to an Acrobat PDF file	4047	0.5
4132	REFERENCES link to external documents; double-click to launch, e.g....	4047	0.5
4133	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	4047	0.5
4134	REFERENCE: with a Word file link	4047	0.5
4135	REFERENCE: with a text file link	4047	0.5
4136	REFERENCE: weblink to www.CompendiumInstitute.org	4047	0.5
4137	REFERENCE: with a Java file link	4047	0.5
4138	REFERENCE to a movie file	4047	0.5
4139	REFERENCE: with a Excel file link	4047	0.5
4140	All of these nodes are \\"transcluded\\" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	4047	0.5
4141	local	4047	0.5
4142	Harvard	4047	0.5
4143	Unificada	4047	0.5
4144	procesos	4047	0.5
4158	Algoritmos com Numeros Naturais	4153	0.5
4159	Problemas envolvendo situaçoes reais	4153	0.5
4160	Conceitos dos numeros Naturais	4153	0.5
4161	Interpretaçao Grafica	4153	0.5
4162	Conjuntos	4153	0.5
4163	Conjuntos dos números naturais	4153	0.5
4164	Linguagem do Conjunto	4153	0.5
4165	Expressoes Numericas	4153	0.5
4166	Simbolos	4153	0.5
4167	Problemas Gerais	4153	0.5
4168	Primos, Multiplos e Divisores	4153	0.5
4282	C1	4281	0.5
4283	C11	4281	0.5
4284	C2	4281	0.5
4285	C10	4281	0.5
4286	C8	4281	0.5
4287	C7	4281	0.5
4288	C5	4281	0.5
4289	C12	4281	0.5
4290	C9	4281	0.5
4291	C4	4281	0.5
4292	C6	4281	0.5
4293	C3	4281	0.5
25523	H14	25522	0.5
25524	Pensamento Estatístico-probabilístico	25522	0.5
25525	Pensamento Algébrico	25522	0.5
25526	Pensamento Combinatório	25522	0.5
25527	H12	25522	0.5
25528	Pensamento Aritmético	25522	0.5
25529	Pensamento Geométrico	25522	0.5
7816	Problemas com + e -	7815	0
7817	Multiplicação	7815	0
7818	Conjunto dos Números Naturais	7815	0
7819	Soma	7815	0
7820	Subtração	7815	0
7821	Sistema Decimal	7815	0
7822	Problemas com x e :	7815	0
7823	Divisão	7815	0
7824	Problemas com as 4 operações	7815	0
13199	Tipos	13198	0
13200	Tamaño físico de pixel	13198	0
13201	Medicina	13198	0
13202	Astronomía	13198	0
13203	Procesado del Silicio	13198	0
13204	Ortogonal	13198	0
13205	Vertical	13198	0
13206	Cámaras comerciales	13198	0
13207	Ganancia	13198	0
13208	Frame transfer	13198	0
13209	Corriente de oscuridad	13198	0
13210	Astrometría	13198	0
13211	Iluminación Trasera	13198	0
13212	Ruido de lectura	13198	0
13213	Detectores CCD	13198	0
13214	Iluminación de zona activa	13198	0
13215	Tamaño en píxeles	13198	0
13216	Interline transfer	13198	0
13217	Parámetros fundamentales	13198	0
13218	Activa y almacenamiento	13198	0
13219	Electrónica de control	13198	0
13220	Con ganancia EM	13198	0
13221	Fotometría	13198	0
13222	Generador de reloj y voltajes	13198	0
13223	Nº áreas del chip	13198	0
13224	Espectroscopía	13198	0
13225	Transferencia de carga	13198	0
13226	Imagen	13198	0
13227	Conversor A/D	13198	0
13228	Sin ganancia EM	13198	0
13229	Registro de Salida  serie	13198	0
13230	Diseño y fabricación	13198	0
13231	Iluminación frontal	13198	0
13232	Activa solo	13198	0
13233	Rango dinámico	13198	0
13234	Pozo de potencial	13198	0
13235	Aplicaciones	13198	0
13236	Área activa	13198	0
13237	Eficiencia cuántica	13198	0
13238	Amplificador de salida	13198	0
13557	Reconhecer_padroes	13556	0
13558	Valor_Numer	13556	0
13559	5_serie	13556	0
13560	Representar_relacoes	13556	0
13561	Usar_formulas	13556	0
13562	Propri_opera_naturais	13556	0
13563	Ler_repres_alg	13556	0
14600	Tamaño	14599	0
14602	¿Qué son las bacterias?	14599	0
14603	Forma	14599	0
14604	Células eucariotas	14599	0
14609	Función	14599	0
14608	Células	14599	6
14606	¿Qué tipos de células existen?	14599	7
14605	¿Cuáles son sus características?	14599	7
14601	Células procariotas	14599	8
14610	Bacterias	14599	8.5
14607	¿Qué son las células?	14599	5
15394	Reconhecer_padroes_6	15393	0
15395	Usar_formulas_6	15393	0
15396	Calc_compren_rz_Propor_6	15393	0
15397	Compr_repres_e_repres_6	15393	0
15398	Resolver_compren_sol_eq_1g_6	15393	0
15399	Opera_algebra_6	15393	0
15400	6º Série	15393	0
16516	7 serie	16515	0
16517	Compreender_expressar_ideias_algeb7	16515	0
16518	Resolver_sist_e_ineq_eq1g7	16515	0
16519	Problemas_alg7	16515	0
16520	Propriedades_opera_alg7	16515	0
16521	fazer_generali_e deduzir_formulas7	16515	0
16903	provas_dedu_form8	16902	0
16904	usar_prop_opera_alg8	16902	0
16905	usar_compreend_grafic8	16902	0
16906	Problemas_Alg8	16902	0
16907	criar_represent8	16902	0
16908	8 serie	16902	0
16909	resolver_eq_2grau8	16902	0
16910	compre_usar_prop_numeros_reais8	16902	0
21505	Procesadores Segmentados	21504	0
21506	Repertorios de intrucciones	21504	0
21507	Procesadores VLIW-EPIC	21504	0
21508	procesadores superescalares	21504	0
21509	Memoria Virtual	21504	0
21510	Memorias Cache	21504	0
21511	Redes de Interconexion	21504	0
21512	Sistemas Multinúcleo	21504	0
21513	Redes Indirectas 	21504	0
21514	Redes Directas	21504	0
21515	Multithreading/ Simultaneous Multithread 	21504	0
21516	Jerarquía de Memoria	21504	0
21517	Fundamentos de Diseño	21504	0
25860	H14	25859	0.5
25861	Pensamento Estatístico-probabilístico	25859	0.5
25862	Pensamento Algébrico	25859	0.5
25863	Pensamento Combinatório	25859	0.5
25864	H12	25859	0.5
25865	Pensamento Aritmético	25859	0.5
25866	Pensamento Geométrico	25859	0.5
28750	Memoria Virtual	28749	0.5
28751	QuickStart video (website)	28749	0.5
28752	QuickStart video (local)	28749	0.5
28753	Compendium Institute Website	28749	0.5
28754	This is an ISSUE or QUESTION that you are thinking about	28749	0.5
28755	This is a NOTE for misc. comments	28749	0.5
28756	REFERENCE: with a text file link	28749	0.5
28757	REFERENCE to a PowerPoint file	28749	0.5
28758	REFERENCE: with a Word file link	28749	0.5
28759	REFERENCES link to external documents; double-click to launch, e.g....	28749	0.5
28760	REFERENCE: with a Java file link	28749	0.5
28761	What kinds of Reference nodes might one link to? (Double-clicking a Reference node launches the target document	28749	0.5
28762	REFERENCE to a movie file	28749	0.5
28763	REFERENCE: with an XML file link	28749	0.5
28764	REFERENCE: weblink to www.CompendiumInstitute.org	28749	0.5
28765	REFERENCE to an unrecognised file type (hence the generic Reference icon)	28749	0.5
28766	REFERENCE: with a Excel file link	28749	0.5
28767	REFERENCE: with an Access file link	28749	0.5
28768	REFERENCE to an Acrobat PDF file	28749	0.5
28769	Use a PRO to express a supporting argument 	28749	0.5
28770	This is an IDEA which responds to an Issue. The asterisk shows there is detail text inside the node. Click on it to view.	28749	0.5
28771	Use a CON to express a challenging argument	28749	0.5
28772	Make an IDEA into a DECISION node to show commitment (right-click)	28749	0.5
28773	Use an ARGUMENT to show support for one idea but challenging another (drag off the plus or minus)	28749	0.5
28774	All of these nodes are "transcluded" into 2 other views. Roll over the digit in the lower right to view the navigation menu which will take you to these other views	28749	0.5
28775	redes interconexion	28749	0.5
28776	Memorias cachés	28749	0.5
28777	Redes directas 	28749	0.5
28778	jerarquía de memoria 	28749	0.5
28779	procesadores superescalares	28749	0.5
28780	sistema multinucleo	28749	0.5
28781	Procesadores VLIW / EPIC	28749	0.5
28782	Fundamentos de Diseño	28749	0.5
28783	Multithreading/ Simultaneous multithreading	28749	0.5
28784	Redes Indirectas	28749	0.5
28785	Repertorio de Instrucciones	28749	0.5
28786	procesadores segmentados	28749	0.5
28789	Simulação com Retas e Circunferências	28788	0.5
28791	Conversão da Representação Linguagem Natural para Representação Geométrica e da Representação Geométrica para Linguagem Natural da Reta	28788	0.5
28792	Conversão da Representação Geométrica para Representação Algébrica da Circunferência	28788	0.5
28793	Conversão da Representação Geométrica para Representação Algébrica da Reta	28788	0.5
28794	Conversão da Representação Linguagem Natural para Representação Geométrica e da Representação Geométrica para Linguagem Natural da Circunferência	28788	0.5
28795	Conversão da Representação Algébrica para Representação Geométrica da Circunferência	28788	0.5
28796	Conversão da Representação Linguagem Natural para Representação Algébrica e da Representação Algébrica para  Linguagem Natural da Reta	28788	0.5
28797	Conversão da Representação Linguagem Natural para Representação Algébrica e da Representação Algébrica para Linguagem Natural da Circunferência	28788	0.60000002
28790	Conversão da Representação Algébrica para Representação Geométrica da Reta	28788	0.60000002
\.


--
-- Data for Name: nodequestionrelation; Type: TABLE DATA; Schema: public; Owner: root
--

COPY nodequestionrelation (id, qua, groupownerid, questionid, nodeid) FROM stdin;
193	0.99000001	\N	187	80
23037	0.89999998	\N	23026	6284
23038	0.89999998	\N	23023	6284
26509	0.89999998	\N	9577	25860
26514	0.89999998	\N	9587	25860
26519	0.89999998	\N	9596	25861
26524	0.89999998	\N	9606	25861
26529	0.89999998	\N	9616	25861
26534	0.89999998	\N	9630	25861
26539	0.89999998	\N	9640	25861
26544	0.89999998	\N	9650	25861
26549	0.89999998	\N	9949	25861
26554	0.89999998	\N	9965	25861
26558	0.89999998	\N	9975	25862
26563	0.89999998	\N	9995	25862
26572	0.89999998	\N	10516	25866
26581	0.89999998	\N	10525	25865
26586	0.89999998	\N	10533	25866
26591	0.89999998	\N	10541	25866
26596	0.89999998	\N	10549	25862
26601	0.89999998	\N	10556	25865
26606	0.89999998	\N	10563	25862
26611	0.89999998	\N	10570	25862
26612	0.89999998	\N	10578	25862
26613	0.89999998	\N	10587	25862
26614	0.89999998	\N	10595	25866
26619	0.89999998	\N	10613	25862
26620	0.89999998	\N	10622	25866
26621	0.89999998	\N	10630	25866
26622	0.89999998	\N	10803	25866
26627	0.89999998	\N	10819	25866
26632	0.89999998	\N	10831	25865
26637	0.89999998	\N	10845	25865
26642	0.89999998	\N	10859	25865
26647	0.89999998	\N	10880	25865
26652	0.89999998	\N	10893	25865
26657	0.89999998	\N	10909	25865
26662	0.89999998	\N	10925	25865
26667	0.89999998	\N	10938	25865
26668	0.89999998	\N	10977	25866
26673	0.89999998	\N	10990	25866
26674	0.89999998	\N	10999	25862
26679	0.89999998	\N	11023	25862
26684	0.89999998	\N	11044	25866
26685	0.89999998	\N	11052	25866
26686	0.89999998	\N	11061	25866
26687	0.89999998	\N	11071	25866
26692	0.89999998	\N	11088	25866
26697	0.89999998	\N	11104	25865
26705	0.89999998	\N	11117	25865
26710	0.89999998	\N	11130	25862
26715	0.89999998	\N	11143	25866
26720	0.89999998	\N	11173	25864
26725	0.89999998	\N	11184	25864
26730	0.89999998	\N	11195	25864
26735	0.89999998	\N	11206	25864
26740	0.89999998	\N	11217	25864
26745	0.89999998	\N	11228	25864
26750	0.89999998	\N	11239	25864
26755	0.89999998	\N	11250	25864
26760	0.89999998	\N	11262	25864
26765	0.89999998	\N	11273	25864
26770	0.89999998	\N	11284	25864
26775	0.89999998	\N	11305	25864
26781	0.89999998	\N	11319	25863
26786	0.89999998	\N	11336	25863
26791	0.89999998	\N	11367	25862
26796	0.89999998	\N	11388	25862
26801	0.89999998	\N	11401	25862
26806	0.89999998	\N	11415	25862
26811	0.89999998	\N	11434	25862
26816	0.89999998	\N	11458	25862
1896	0.89999998	\N	1893	80
26821	0.89999998	\N	11474	25862
26826	0.89999998	\N	11497	25862
26831	0.89999998	\N	11513	25862
4187	0.89999998	\N	296	4160
4188	0.89999998	\N	298	4160
4189	0.89999998	\N	300	4160
4195	0.89999998	\N	302	4160
26836	0.89999998	\N	11536	25862
4295	0.60000002	\N	4240	4288
4296	0.5	\N	4240	4282
4297	0.69999999	\N	4243	4291
4307	0.89999998	\N	4302	4290
4328	0.89999998	\N	4325	4282
4332	0.89999998	\N	4329	4282
8287	0.89999998	\N	4974	7820
8292	0.89999998	\N	4980	7820
7935	0.89999998	\N	4515	7819
7911	0.89999998	\N	4498	7819
8301	0.89999998	\N	4986	7820
8306	0.89999998	\N	4992	7820
7921	0.89999998	\N	7912	7819
8311	0.89999998	\N	4998	7820
8316	0.89999998	\N	5004	7820
8321	0.89999998	\N	5010	7820
7925	0.89999998	\N	4504	7819
7930	0.89999998	\N	4509	7819
7940	0.89999998	\N	4521	7819
7945	0.89999998	\N	4527	7819
8326	0.89999998	\N	5016	7820
8331	0.89999998	\N	5022	7820
8336	0.89999998	\N	5028	7816
7950	0.89999998	\N	4533	7819
8341	0.89999998	\N	5034	7816
7955	0.89999998	\N	4539	7819
8346	0.89999998	\N	5040	7816
8351	0.89999998	\N	5046	7816
8356	0.89999998	\N	5052	7816
8361	0.89999998	\N	5058	7816
8366	0.89999998	\N	5064	7816
7960	0.89999998	\N	4549	7819
8371	0.89999998	\N	5070	7816
8376	0.89999998	\N	5076	7816
8381	0.89999998	\N	5082	7816
8386	0.89999998	\N	5088	7816
7965	0.89999998	\N	4555	7819
7970	0.89999998	\N	4561	7819
7975	0.89999998	\N	4567	7819
8391	0.89999998	\N	5094	7816
7980	0.89999998	\N	4573	7819
8396	0.89999998	\N	5100	7816
8401	0.89999998	\N	5106	7816
7985	0.89999998	\N	4579	7819
8406	0.89999998	\N	5112	7816
7994	0.89999998	\N	4585	7819
8411	0.89999998	\N	5118	7816
8416	0.89999998	\N	5124	7816
26841	0.89999998	\N	11556	25862
26846	0.89999998	\N	11569	25862
26851	0.89999998	\N	11582	25862
7999	0.89999998	\N	4591	7819
26856	0.89999998	\N	11595	25862
26861	0.89999998	\N	11608	25862
26867	0.89999998	\N	11621	25865
26872	0.89999998	\N	11632	25862
26877	0.89999998	\N	11645	25862
26882	0.89999998	\N	11658	25862
8004	0.89999998	\N	4597	7819
8009	0.89999998	\N	4687	7821
8014	0.89999998	\N	4697	7821
8019	0.89999998	\N	4703	7821
26887	0.89999998	\N	11671	25862
8025	0.89999998	\N	4709	7821
8030	0.89999998	\N	4715	7821
26892	0.89999998	\N	11684	25862
8035	0.89999998	\N	4721	7821
8040	0.89999998	\N	4727	7821
8054	0.89999998	\N	4733	7821
8063	0.89999998	\N	4739	7821
8068	0.89999998	\N	4745	7821
8073	0.89999998	\N	4751	7821
8078	0.89999998	\N	4757	7821
8083	0.89999998	\N	4763	7821
8088	0.89999998	\N	4769	7821
8093	0.89999998	\N	4775	7821
8098	0.89999998	\N	4781	7821
8103	0.89999998	\N	4787	7821
8109	0.89999998	\N	4793	7821
8114	0.89999998	\N	4799	7821
8119	0.89999998	\N	4805	7821
8124	0.89999998	\N	4811	7821
8129	0.89999998	\N	4817	7821
8134	0.89999998	\N	4823	7821
8148	0.89999998	\N	8143	7821
8154	0.89999998	\N	8149	7821
8160	0.89999998	\N	8155	7821
8166	0.89999998	\N	8161	7821
8172	0.89999998	\N	8167	7821
8178	0.89999998	\N	8173	7821
8183	0.89999998	\N	4835	7820
8188	0.89999998	\N	4841	7820
8193	0.89999998	\N	4847	7820
8198	0.89999998	\N	4853	7820
8202	0.89999998	\N	4859	7820
8207	0.89999998	\N	4865	7820
8212	0.89999998	\N	4871	7820
8217	0.89999998	\N	4883	7820
8222	0.89999998	\N	4889	7820
8227	0.89999998	\N	4895	7820
8232	0.89999998	\N	4900	7820
8237	0.89999998	\N	4906	7820
8242	0.89999998	\N	4912	7820
8247	0.89999998	\N	4918	7820
8252	0.89999998	\N	4924	7820
8257	0.89999998	\N	4930	7820
8262	0.89999998	\N	4940	7820
8267	0.89999998	\N	4946	7820
8272	0.89999998	\N	4952	7820
8277	0.89999998	\N	4958	7820
8282	0.89999998	\N	4964	7820
8421	0.89999998	\N	5130	7816
8426	0.89999998	\N	5136	7816
8431	0.89999998	\N	5142	7816
8436	0.89999998	\N	5148	7816
8441	0.89999998	\N	5158	7816
8446	0.89999998	\N	5164	7816
8451	0.89999998	\N	5170	7816
8456	0.89999998	\N	5180	7816
8461	0.89999998	\N	5186	7816
8466	0.89999998	\N	5192	7816
8471	0.89999998	\N	5198	7816
8476	0.89999998	\N	5204	7816
8481	0.89999998	\N	5210	7816
8487	0.89999998	\N	8482	7817
7844	0.88	\N	6297	6286
8493	0.89999998	\N	8488	7817
25875	0.89999998	\N	6451	25866
8505	0.89999998	\N	8500	7817
8506	0.89999998	\N	8494	7817
8512	0.89999998	\N	8507	7817
8518	0.89999998	\N	8513	7817
8524	0.89999998	\N	8519	7817
8530	0.89999998	\N	8525	7817
8536	0.89999998	\N	8531	7817
8542	0.89999998	\N	8537	7817
8548	0.89999998	\N	8543	7817
8554	0.89999998	\N	8549	7817
8560	0.89999998	\N	8555	7817
8566	0.89999998	\N	8561	7817
8572	0.89999998	\N	8567	7817
8578	0.89999998	\N	8573	7817
8584	0.89999998	\N	8579	7817
8590	0.89999998	\N	8585	7817
8596	0.89999998	\N	8591	7817
8602	0.89999998	\N	8597	7817
8608	0.89999998	\N	8603	7817
8614	0.89999998	\N	8609	7817
8620	0.89999998	\N	8615	7817
8626	0.89999998	\N	8621	7817
8632	0.89999998	\N	8627	7817
8638	0.89999998	\N	8633	7817
8644	0.89999998	\N	8639	7817
8650	0.89999998	\N	8645	7817
8656	0.89999998	\N	8651	7817
8662	0.89999998	\N	8657	7817
8668	0.89999998	\N	8663	7823
8678	0.89999998	\N	8673	7823
8684	0.89999998	\N	8679	7823
7846	0.89999998	\N	4366	7819
25884	0.89999998	\N	6516	25866
7852	0.69999999	\N	4416	7819
7853	0.89999998	\N	4426	7819
7862	0.89999998	\N	4436	7819
7867	0.89999998	\N	4442	7819
6347	0.5	\N	6342	6285
7872	0.89999998	\N	4448	7819
6349	0.69999999	\N	6342	6287
7876	0.89999998	\N	4454	7819
7881	0.89999998	\N	4458	7819
6329	0.30000001	\N	6300	6285
6498	0.60000002	\N	6300	6284
7886	0.89999998	\N	4464	7819
25889	0.89999998	\N	6526	25861
25894	0.89999998	\N	6536	25861
25903	0.89999998	\N	6546	25861
26897	0.89999998	\N	11733	25862
26902	0.89999998	\N	11746	25862
26907	0.89999998	\N	11759	25865
26912	0.89999998	\N	11772	25865
26917	0.89999998	\N	11785	25865
26922	0.89999998	\N	11799	25865
26927	0.89999998	\N	11813	25865
26932	0.89999998	\N	11827	25862
26937	0.89999998	\N	11840	25862
26942	0.89999998	\N	11854	25863
26947	0.89999998	\N	11871	25863
26952	0.89999998	\N	11889	25866
26957	0.89999998	\N	11901	25866
26962	0.89999998	\N	11913	25866
26972	0.89999998	\N	11950	25862
26977	0.89999998	\N	11962	25862
26982	0.89999998	\N	11975	25862
26987	0.89999998	\N	11987	25862
26992	0.89999998	\N	12000	25862
27033	0.89999998	\N	12011	25862
27038	0.89999998	\N	12022	25862
27043	0.89999998	\N	12034	25862
27048	0.89999998	\N	12046	25865
27053	0.89999998	\N	12057	25866
27058	0.89999998	\N	12068	25865
27063	0.89999998	\N	12083	25865
7891	0.89999998	\N	4470	7819
7896	0.89999998	\N	4476	7819
7173	0.89999998	\N	6924	6285
8690	0.89999998	\N	8685	7823
7257	0.89999998	\N	7254	6285
7901	0.89999998	\N	4486	7819
7273	0.69999999	\N	7270	6285
8696	0.89999998	\N	8691	7823
7362	0.5	\N	7266	6284
7363	0.80000001	\N	7266	6285
7392	0.69999999	\N	7276	6287
8702	0.89999998	\N	8697	7823
8708	0.89999998	\N	8703	7823
8714	0.89999998	\N	8709	7823
8720	0.89999998	\N	8715	7823
8726	0.89999998	\N	8721	7823
8732	0.89999998	\N	8727	7823
8738	0.89999998	\N	8733	7823
8744	0.89999998	\N	8739	7823
8750	0.89999998	\N	8745	7823
8756	0.89999998	\N	8751	7823
8762	0.89999998	\N	8757	7823
8768	0.89999998	\N	8763	7823
8774	0.89999998	\N	8769	7823
8780	0.89999998	\N	8775	7823
8786	0.89999998	\N	8781	7823
8792	0.89999998	\N	8787	7823
8798	0.89999998	\N	8793	7823
8804	0.89999998	\N	8799	7823
8810	0.89999998	\N	8805	7823
8816	0.89999998	\N	8811	7823
8822	0.89999998	\N	8817	7823
8829	0.89999998	\N	8823	7823
8835	0.89999998	\N	8830	7823
8841	0.89999998	\N	8836	7823
8847	0.89999998	\N	8842	7823
8853	0.89999998	\N	8848	7822
8859	0.89999998	\N	8854	7822
8865	0.89999998	\N	8860	7822
8871	0.89999998	\N	8866	7822
8877	0.89999998	\N	8872	7822
8883	0.89999998	\N	8878	7822
8889	0.89999998	\N	8884	7822
8895	0.89999998	\N	8890	7822
8901	0.89999998	\N	8896	7822
8907	0.89999998	\N	8902	7822
8913	0.89999998	\N	8908	7822
8919	0.89999998	\N	8914	7822
8925	0.89999998	\N	8920	7822
8931	0.89999998	\N	8926	7822
8937	0.89999998	\N	8932	7822
8943	0.89999998	\N	8938	7822
8949	0.89999998	\N	8944	7822
8955	0.89999998	\N	8950	7822
8961	0.89999998	\N	8956	7822
8967	0.89999998	\N	8962	7822
8973	0.89999998	\N	8968	7822
8979	0.89999998	\N	8974	7822
8985	0.89999998	\N	8980	7822
8991	0.89999998	\N	8986	7822
8997	0.89999998	\N	8992	7822
9003	0.89999998	\N	8998	7822
9009	0.89999998	\N	9004	7822
9020	0.89999998	\N	9015	7822
9026	0.89999998	\N	9021	7822
9032	0.89999998	\N	9027	7822
9038	0.89999998	\N	9033	7824
9044	0.89999998	\N	9039	7824
9050	0.89999998	\N	9045	7824
9056	0.89999998	\N	9051	7824
9062	0.89999998	\N	9057	7824
9068	0.89999998	\N	9063	7824
9074	0.89999998	\N	9069	7824
9080	0.89999998	\N	9075	7824
9086	0.89999998	\N	9081	7824
9092	0.89999998	\N	9087	7824
9098	0.89999998	\N	9093	7824
9104	0.89999998	\N	9099	7824
9110	0.89999998	\N	9105	7824
9116	0.89999998	\N	9111	7824
9122	0.30000001	\N	9117	7824
9128	0.89999998	\N	9123	7824
9134	0.89999998	\N	9129	7824
9140	0.89999998	\N	9135	7823
9146	0.89999998	\N	9141	7824
9152	0.89999998	\N	9147	7824
9158	0.89999998	\N	9153	7824
9164	0.89999998	\N	9159	7824
25908	0.89999998	\N	6556	25861
9171	0.89999998	\N	9165	7824
9177	0.89999998	\N	9172	7824
9183	0.89999998	\N	9178	7824
9189	0.89999998	\N	9184	7824
9195	0.89999998	\N	9190	7824
9201	0.89999998	\N	9196	7824
9207	0.89999998	\N	9202	7824
9213	0.89999998	\N	9208	7824
27068	0.89999998	\N	12094	25865
27073	0.89999998	\N	12106	25862
27078	0.89999998	\N	12121	25862
27083	0.89999998	\N	12132	25862
27088	0.89999998	\N	12144	25862
27093	0.89999998	\N	12156	25862
27098	0.89999998	\N	12167	25866
27103	0.89999998	\N	12319	25865
27104	0.89999998	\N	12327	25865
27109	0.89999998	\N	12342	25862
27114	0.89999998	\N	12354	25865
27115	0.89999998	\N	12361	25866
27120	0.89999998	\N	12379	25863
27125	0.89999998	\N	12390	25862
27126	0.89999998	\N	12397	25863
27127	0.89999998	\N	12404	25861
27132	0.89999998	\N	12416	25861
27137	0.89999998	\N	12428	25863
27138	0.89999998	\N	12437	25863
27143	0.89999998	\N	12453	25863
27148	0.89999998	\N	12466	25863
27153	0.89999998	\N	12478	25863
27158	0.89999998	\N	12490	25863
27163	0.89999998	\N	12502	25863
27164	0.89999998	\N	12510	25863
27169	0.89999998	\N	12902	25863
27174	0.89999998	\N	13621	25866
27179	0.89999998	\N	13630	25862
27180	0.89999998	\N	13635	25862
27184	0.89999998	\N	13643	25862
25922	0.89999998	\N	6566	25866
25931	0.89999998	\N	6576	25866
25936	0.89999998	\N	6585	25865
25941	0.89999998	\N	6600	25865
25946	0.89999998	\N	6610	25865
25951	0.89999998	\N	6619	25865
25956	0.89999998	\N	6634	25865
25961	0.89999998	\N	6644	25865
25966	0.89999998	\N	6654	25865
25971	0.89999998	\N	6669	25865
25976	0.89999998	\N	6679	25866
25981	0.89999998	\N	6689	25861
25986	0.89999998	\N	6703	25865
25991	0.89999998	\N	6713	25861
25996	0.89999998	\N	6723	25861
26001	0.89999998	\N	6738	25861
26006	0.89999998	\N	6748	25861
26011	0.89999998	\N	6758	25861
26016	0.89999998	\N	6768	25861
26021	0.89999998	\N	6778	25861
26026	0.89999998	\N	6788	25861
26031	0.89999998	\N	6798	25861
26036	0.89999998	\N	6808	25861
26040	0.89999998	\N	6817	25863
26045	0.89999998	\N	6827	25863
26050	0.89999998	\N	6837	25863
26055	0.89999998	\N	6847	25863
26060	0.89999998	\N	6857	25863
26065	0.89999998	\N	6867	25863
26070	0.89999998	\N	6877	25863
26075	0.89999998	\N	6887	25863
26080	0.89999998	\N	6897	25863
26085	0.89999998	\N	6912	25863
27189	0.89999998	\N	13713	25861
27190	0.89999998	\N	13718	25861
27195	0.89999998	\N	13727	25861
27200	0.89999998	\N	13732	25861
27205	0.89999998	\N	13741	25861
27210	0.89999998	\N	13750	25861
27215	0.89999998	\N	13759	25861
27216	0.89999998	\N	13768	25861
27217	0.89999998	\N	13777	25861
27222	0.89999998	\N	13786	25861
27227	0.89999998	\N	13791	25861
27232	0.89999998	\N	13800	25861
27237	0.89999998	\N	13809	25861
27241	0.89999998	\N	13818	25861
27246	0.89999998	\N	13832	25861
27247	0.89999998	\N	13841	25861
27252	0.89999998	\N	13854	25861
27257	0.89999998	\N	13863	25861
27262	0.89999998	\N	13881	25861
27267	0.89999998	\N	13895	25861
27268	0.89999998	\N	13918	25861
27272	0.89999998	\N	13930	25861
27273	0.89999998	\N	13943	25861
27278	0.89999998	\N	13965	25861
27283	0.89999998	\N	13970	25861
26090	0.89999998	\N	7099	25866
26095	0.89999998	\N	7108	25866
26100	0.89999998	\N	7128	25865
26105	0.89999998	\N	7138	25865
26110	0.89999998	\N	7207	25862
26115	0.89999998	\N	7217	25862
26120	0.89999998	\N	7227	25861
26125	0.89999998	\N	7237	25861
26134	0.89999998	\N	7280	25862
26139	0.89999998	\N	7290	25866
26144	0.89999998	\N	7298	25866
26150	0.89999998	\N	7305	25866
26155	0.89999998	\N	7312	25866
26160	0.89999998	\N	7321	25861
26165	0.89999998	\N	7326	25861
26170	0.89999998	\N	7336	25862
26175	0.89999998	\N	7345	25866
26180	0.89999998	\N	7353	25866
26185	0.89999998	\N	7400	25866
26190	0.89999998	\N	7410	25866
26195	0.89999998	\N	7420	25866
26200	0.89999998	\N	7430	25866
26205	0.89999998	\N	7440	25866
26210	0.89999998	\N	7450	25866
26215	0.89999998	\N	7460	25866
26220	0.89999998	\N	7470	25866
26225	0.89999998	\N	7480	25866
26230	0.89999998	\N	7490	25866
26235	0.89999998	\N	7500	25866
26240	0.89999998	\N	7510	25866
26245	0.89999998	\N	7592	25862
26250	0.89999998	\N	7702	25862
26255	0.89999998	\N	7711	25866
26260	0.89999998	\N	7774	25866
27492	0.89999998	\N	13985	25861
26265	0.89999998	\N	7761	25862
27496	0.89999998	\N	13990	25861
13398	0.89999998	\N	13243	13208
13417	0.69999999	\N	13282	13234
13451	0.80000001	\N	13265	13210
13453	0.69999999	\N	13256	13204
13454	0.89999998	\N	13261	13200
13455	0.80000001	\N	13271	13207
13468	0.60000002	\N	13277	13222
13475	0.60000002	\N	13285	13229
13484	0.80000001	\N	13480	13205
13603	0.89999998	\N	13598	13560
13589	0.60000002	\N	13583	13560
13588	0.89999998	\N	13583	13563
26270	0.89999998	\N	7756	25861
27497	0.89999998	\N	13995	25861
27502	0.89999998	\N	14000	25861
27510	0.89999998	\N	14015	25861
22630	0.89999998	\N	22625	16910
22640	0.89999998	\N	22635	16904
14749	0.60000002	\N	14745	13562
14490	0.89999998	\N	14147	13560
14918	0.60000002	\N	14896	14607
14920	0.5	\N	14896	14608
14935	0.60000002	\N	14900	14601
14954	0.2	\N	14943	14609
13578	0.89999998	\N	13573	13563
13612	0.89999998	\N	13607	13557
14468	0.89999998	\N	14141	13562
14491	0.60000002	\N	14147	13563
14496	0.89999998	\N	14156	13557
14501	0.89999998	\N	14169	13558
14526	0.89999998	\N	14364	13558
14527	0.60000002	\N	14364	13563
14538	0.89999998	\N	14409	13558
14539	0.60000002	\N	14409	13561
14550	0.89999998	\N	14432	13558
14557	0.60000002	\N	14432	13563
14759	0.89999998	\N	14753	13562
14770	0.89999998	\N	14765	13561
14780	0.89999998	\N	14775	13561
14791	0.89999998	\N	14785	13557
14803	0.89999998	\N	14797	13563
14814	0.89999998	\N	14809	13561
14824	0.89999998	\N	14819	13557
14834	0.89999998	\N	14829	13557
15027	0.89999998	\N	15023	13563
15053	0.89999998	\N	15031	13563
15063	0.89999998	\N	15058	13560
15089	0.89999998	\N	15078	13562
15106	0.89999998	\N	15100	13562
15117	0.89999998	\N	15112	13558
15127	0.89999998	\N	15122	13558
15137	0.89999998	\N	15132	13561
15183	0.89999998	\N	15178	13563
15184	0.60000002	\N	15178	13560
15195	0.60000002	\N	15189	13561
15206	0.89999998	\N	15200	13557
15229	0.89999998	\N	15224	13557
15239	0.89999998	\N	15234	13557
26275	0.89999998	\N	7747	25863
27511	0.89999998	\N	14020	25861
27512	0.89999998	\N	14025	25861
27513	0.89999998	\N	14030	25861
27518	0.89999998	\N	14035	25861
15845	0.69999999	\N	15840	15397
15974	0.5	\N	15970	15397
16195	0.89999998	\N	15212	15394
15421	0.89999998	\N	15415	15395
15432	0.89999998	\N	15427	15395
15433	0.60000002	\N	15427	15397
15444	0.89999998	\N	15438	15397
15443	0.60000002	\N	15438	15399
15454	0.89999998	\N	15449	15394
15464	0.89999998	\N	15459	15396
15475	0.89999998	\N	15469	15397
15476	0.60000002	\N	15469	15396
15749	0.89999998	\N	15744	13558
15769	0.89999998	\N	15764	13561
15770	0.60000002	\N	15764	13558
15781	0.89999998	\N	15775	13562
15792	0.89999998	\N	15787	13563
15793	0.60000002	\N	15787	13560
15803	0.89999998	\N	15798	13557
15804	0.60000002	\N	15798	13560
15814	0.89999998	\N	15809	13560
15824	0.89999998	\N	15819	13560
15825	0.60000002	\N	15819	13563
15855	0.89999998	\N	15850	15397
15869	0.89999998	\N	15864	15397
15870	0.60000002	\N	15864	15399
15880	0.89999998	\N	15875	15397
15891	0.89999998	\N	15885	15397
15903	0.89999998	\N	15897	15397
15915	0.89999998	\N	15909	15397
15927	0.89999998	\N	15921	15399
15939	0.89999998	\N	15933	15399
15955	0.89999998	\N	15950	15399
15983	0.89999998	\N	15978	15398
15992	0.89999998	\N	15988	15398
16001	0.89999998	\N	15996	15398
16011	0.89999998	\N	16006	15397
16026	0.89999998	\N	16020	15397
16037	0.89999998	\N	16032	15396
16047	0.89999998	\N	16042	15395
16057	0.89999998	\N	16052	15395
16067	0.89999998	\N	16062	15398
16077	0.89999998	\N	16072	15396
16088	0.89999998	\N	16083	15396
16089	0.60000002	\N	16083	15395
16099	0.89999998	\N	16094	15396
16109	0.89999998	\N	16104	15396
16110	0.60000002	\N	16104	15397
16120	0.89999998	\N	16115	15394
16134	0.89999998	\N	16125	15396
16144	0.89999998	\N	16139	15399
16153	0.89999998	\N	16149	15396
16162	0.89999998	\N	16157	15399
16334	0.89999998	\N	16329	15398
16340	0.89999998	\N	16335	15398
16350	0.89999998	\N	16345	15398
16360	0.89999998	\N	16355	15398
16370	0.89999998	\N	16365	15398
16380	0.89999998	\N	16375	15398
16390	0.89999998	\N	16385	15396
16399	0.89999998	\N	16395	15394
16527	0.89999998	\N	16522	16521
16537	0.89999998	\N	16532	16517
16557	0.89999998	\N	16552	16520
16567	0.89999998	\N	16562	16517
16577	0.89999998	\N	16572	16521
16589	0.89999998	\N	16584	16520
16594	0.60000002	\N	16584	16518
22650	0.89999998	\N	22645	16907
22660	0.89999998	\N	22655	16903
22670	0.89999998	\N	22665	16905
22680	0.89999998	\N	22675	16905
26287	0.89999998	\N	7738	25861
27542	0.89999998	\N	14040	25861
27550	0.89999998	\N	14045	25861
27559	0.89999998	\N	14053	25861
27560	0.89999998	\N	14058	25866
27565	0.89999998	\N	14063	25866
27570	0.89999998	\N	14072	25866
27578	0.89999998	\N	14084	25866
27587	0.89999998	\N	14095	25866
27592	0.89999998	\N	14103	25866
27601	0.89999998	\N	14108	25866
27606	0.89999998	\N	14118	25866
22991	0.69999999	\N	22989	6286
22992	0.80000001	\N	22989	6284
26292	0.89999998	\N	7729	25861
27615	0.89999998	\N	14123	25866
27620	0.89999998	\N	14128	25866
27632	0.89999998	\N	15002	25863
22993	0.80000001	\N	22989	6285
27633	0.89999998	\N	15015	25863
16712	0.60000002	\N	16706	15395
23007	0.60000002	\N	6924	6284
16966	0.5	\N	16959	15396
16612	0.89999998	\N	16607	15398
16622	0.60000002	\N	16617	15398
16623	0.89999998	\N	16617	16518
16633	0.89999998	\N	16628	15395
16642	0.89999998	\N	16638	15398
16651	0.89999998	\N	16646	15398
16688	0.89999998	\N	16682	16517
16700	0.89999998	\N	16694	16521
16711	0.89999998	\N	16706	16520
16759	0.89999998	\N	16754	15395
16760	0.60000002	\N	16754	16517
16770	0.89999998	\N	16765	16517
16785	0.89999998	\N	16775	16521
16790	0.89999998	\N	16780	16520
16805	0.89999998	\N	16799	16520
16845	0.89999998	\N	16840	16520
16856	0.60000002	\N	16850	16517
16866	0.89999998	\N	16861	16520
16876	0.89999998	\N	16871	16520
16886	0.89999998	\N	16881	16518
16896	0.89999998	\N	16891	16518
16897	0.60000002	\N	16891	15398
16916	0.89999998	\N	16911	16517
16926	0.89999998	\N	16921	16519
16931	0.60000002	\N	16921	16517
16944	0.89999998	\N	16940	16518
16954	0.60000002	\N	16948	16517
16964	0.89999998	\N	16959	16519
16965	0.60000002	\N	16959	16517
16977	0.89999998	\N	16971	16521
16989	0.89999998	\N	16983	16520
16990	0.60000002	\N	16983	16517
17008	0.89999998	\N	17003	16519
17018	0.89999998	\N	17013	15396
17028	0.60000002	\N	17023	16517
17029	0.60000002	\N	17023	15394
17049	0.89999998	\N	17044	16521
17059	0.89999998	\N	17054	16517
17070	0.89999998	\N	17064	16520
17081	0.60000002	\N	17076	16518
17082	0.89999998	\N	17076	16517
17092	0.89999998	\N	17087	16521
17102	0.89999998	\N	17097	16520
17112	0.89999998	\N	17107	16520
17122	0.89999998	\N	17117	16520
17132	0.89999998	\N	17127	16517
17152	0.89999998	\N	17147	16520
17160	0.89999998	\N	17157	16520
17168	0.89999998	\N	17163	16520
17178	0.89999998	\N	17173	16907
17189	0.89999998	\N	17183	16910
17201	0.89999998	\N	17195	16909
17212	0.89999998	\N	17207	16903
17222	0.89999998	\N	17217	16903
17223	0.60000002	\N	17217	16904
17233	0.60000002	\N	17228	16903
17244	0.89999998	\N	17239	16907
17254	0.89999998	\N	17249	16909
17266	0.89999998	\N	17261	16518
17286	0.89999998	\N	17281	16517
17276	0.89999998	\N	17271	16519
17285	0.60000002	\N	17281	16518
17295	0.89999998	\N	17290	16518
17309	0.89999998	\N	17304	16518
17319	0.89999998	\N	17314	16521
17329	0.89999998	\N	17324	16521
17349	0.89999998	\N	17344	16519
17359	0.60000002	\N	17354	16519
17369	0.89999998	\N	17364	16519
17370	0.60000002	\N	17364	16517
17379	0.89999998	\N	17375	16521
17388	0.89999998	\N	17383	16519
17398	0.89999998	\N	17393	16519
17408	0.89999998	\N	17403	16519
17418	0.89999998	\N	17413	16519
17427	0.89999998	\N	17423	16521
26297	0.89999998	\N	7724	25861
27640	0.89999998	\N	27635	25866
27654	0.89999998	\N	27645	25866
27664	0.89999998	\N	27659	25866
27674	0.89999998	\N	27669	25861
23035	0.80000001	\N	23032	6284
23036	0.80000001	\N	23029	6284
17741	0.89999998	\N	17736	16910
17751	0.89999998	\N	17746	16906
17761	0.89999998	\N	17756	16910
26434	0.89999998	\N	9291	25863
26439	0.89999998	\N	9301	25861
26444	0.89999998	\N	9331	25861
26449	0.89999998	\N	9341	25861
26454	0.89999998	\N	9351	25861
26459	0.89999998	\N	9356	25861
26464	0.89999998	\N	9371	25861
26469	0.89999998	\N	9381	25861
26474	0.89999998	\N	9386	25861
26479	0.89999998	\N	9396	25861
26484	0.89999998	\N	9406	25861
26489	0.89999998	\N	9416	25861
26494	0.89999998	\N	9426	25861
26499	0.89999998	\N	9559	25860
26504	0.89999998	\N	9568	25860
28803	0.89999998	\N	28798	28796
28824	0.89999998	\N	28818	28796
28897	0.89999998	\N	28892	28796
28907	0.89999998	\N	28902	28796
28917	0.89999998	\N	28912	28796
28926	0.89999998	\N	28921	28796
28940	0.89999998	\N	28931	28796
28954	0.89999998	\N	28949	28796
28972	0.89999998	\N	28967	28796
28994	0.89999998	\N	28989	28796
29004	0.89999998	\N	28999	28796
29014	0.89999998	\N	29009	28796
29024	0.89999998	\N	29019	28796
29034	0.89999998	\N	29029	28796
29047	0.89999998	\N	29042	28796
29079	0.89999998	\N	29074	28796
29089	0.89999998	\N	29084	28796
29102	0.89999998	\N	29097	28796
29116	0.89999998	\N	29111	28796
29129	0.89999998	\N	29124	28796
29143	0.89999998	\N	29134	28796
29158	0.89999998	\N	29148	28796
29172	0.89999998	\N	29167	28796
29182	0.89999998	\N	29177	28796
29202	0.89999998	\N	29197	28796
29212	0.89999998	\N	29207	28796
29226	0.89999998	\N	29221	28796
29236	0.89999998	\N	29231	28796
29255	0.89999998	\N	29241	28791
29265	0.89999998	\N	29260	28791
29275	0.89999998	\N	29270	28791
29289	0.89999998	\N	29284	28791
29299	0.89999998	\N	29294	28791
29309	0.89999998	\N	29304	28791
29327	0.89999998	\N	29322	28791
29337	0.89999998	\N	29332	28791
29347	0.89999998	\N	29342	28791
29357	0.89999998	\N	29352	28791
29367	0.89999998	\N	29362	28791
29377	0.89999998	\N	29372	28791
29387	0.89999998	\N	29382	28791
14520	0.60000002	\N	14306	13558
15194	0.89999998	\N	15189	13558
15409	0.89999998	\N	15403	15395
15759	0.89999998	\N	15754	13561
15835	0.89999998	\N	15830	13562
15965	0.89999998	\N	15960	15399
16078	0.60000002	\N	16072	15394
16324	0.89999998	\N	16319	15399
16547	0.89999998	\N	16542	16517
16603	0.89999998	\N	16599	15394
16652	0.60000002	\N	16646	15399
16855	0.89999998	\N	16850	16520
16953	0.89999998	\N	16948	16519
17039	0.89999998	\N	17034	16518
17142	0.89999998	\N	17137	16517
17234	0.89999998	\N	17228	16904
17339	0.89999998	\N	17334	16518
17731	0.89999998	\N	17726	16909
18143	0.89999998	\N	18138	16906
18153	0.89999998	\N	18148	16903
18163	0.89999998	\N	18158	16907
18173	0.89999998	\N	18168	16909
18432	0.89999998	\N	18427	16909
18442	0.89999998	\N	18437	16904
18452	0.89999998	\N	18447	16904
18462	0.89999998	\N	18457	16904
18472	0.89999998	\N	18467	16904
18483	0.89999998	\N	18477	16910
18494	0.89999998	\N	18489	16906
18504	0.89999998	\N	18499	16906
29398	0.89999998	\N	29392	28791
29434	0.89999998	\N	29429	28791
29449	0.89999998	\N	29444	28791
29459	0.89999998	\N	29454	28791
29469	0.89999998	\N	29464	28791
29479	0.89999998	\N	29474	28791
29489	0.89999998	\N	29484	28791
29499	0.89999998	\N	29494	28791
29506	0.89999998	\N	29504	28791
29516	0.89999998	\N	29511	28791
29526	0.89999998	\N	29521	28791
29533	0.89999998	\N	29531	28791
29540	0.89999998	\N	29538	28791
29547	0.89999998	\N	29545	28791
29554	0.89999998	\N	29552	28791
29564	0.89999998	\N	29559	28793
29574	0.89999998	\N	29569	28793
29581	0.89999998	\N	29579	28793
29588	0.89999998	\N	29586	28793
29595	0.89999998	\N	29593	28793
29602	0.89999998	\N	29600	28793
29613	0.89999998	\N	29611	28793
29624	0.89999998	\N	29622	28793
29635	0.89999998	\N	29633	28793
29646	0.89999998	\N	29644	28793
29656	0.89999998	\N	29651	28793
29666	0.89999998	\N	29661	28793
29676	0.89999998	\N	29671	28793
29686	0.89999998	\N	29681	28793
29696	0.89999998	\N	29691	28793
29714	0.89999998	\N	29709	28793
20150	0.89999998	\N	20145	16910
20160	0.89999998	\N	20155	16907
20170	0.89999998	\N	20165	16905
20181	0.89999998	\N	20175	16904
20193	0.89999998	\N	20187	16905
20205	0.89999998	\N	20199	16905
29724	0.89999998	\N	29719	28793
29744	0.89999998	\N	29739	28793
29754	0.89999998	\N	29749	28793
29768	0.89999998	\N	29763	28793
29778	0.89999998	\N	29773	28793
29788	0.89999998	\N	29783	28793
29798	0.89999998	\N	29793	28793
29808	0.89999998	\N	29803	28793
29818	0.89999998	\N	29813	28793
29828	0.89999998	\N	29823	28793
29838	0.89999998	\N	29833	28793
29848	0.89999998	\N	29843	28793
29858	0.89999998	\N	29853	28793
29873	0.89999998	\N	29863	28791
29883	0.89999998	\N	29878	28791
20397	0.89999998	\N	20388	16909
20407	0.89999998	\N	20402	16904
20417	0.89999998	\N	20412	16907
20432	0.60000002	\N	20422	16903
21013	0.89999998	\N	20447	16907
21014	0.60000002	\N	20447	16904
21024	0.89999998	\N	21019	16907
21034	0.89999998	\N	21029	16906
21043	0.60000002	\N	21039	16906
21051	0.89999998	\N	21047	16909
21165	0.89999998	\N	21156	16909
21484	0.89999998	\N	21478	16905
21495	0.89999998	\N	21490	16910
21529	0.89999998	\N	21524	16910
28755	0.89999998	\N	28750	28796
29055	0.89999998	\N	28858	21510
29154	1	\N	29139	21505
29160	1	\N	29155	21505
29201	0.89999998	\N	29196	28790
29239	0.89999998	\N	29224	28790
29244	0.89999998	\N	29229	28797
29254	0.89999998	\N	29249	28790
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: root
--

COPY question (id, content, imagefilename, correctanswer, difficulty, answertime, luck, additionalappletid, creatorid) FROM stdin;
67	Calcule /begin/sqrt(4):	\N	2	0.1	30	0.1	\N	23
73	calcule	\N	2	0.1	30	0.1	\N	23
187	dadadas	\N	0	0.99000001	111	0.99000001	\N	72
296	1	\N	0	0.80000001	111	0.60000002	\N	72
298	2	\N	0	0.80000001	222	0.60000002	\N	72
300	3	\N	0	0.80000001	111	0.60000002	\N	72
304	5	\N	0	0.80000001	111	0.69999999	\N	72
306	6	\N	0	0.89999998	11	0.80000001	\N	72
308	7	\N	0	0.80000001	111	0.60000002	\N	72
310	8	\N	0	0.80000001	112	0.5	\N	72
312	9	\N	0	0.80000001	11	0.5	\N	72
314	10	\N	0	0.89999998	111	0.40000001	\N	72
316	juyuy	\N	0	0.80000001	112	0.69999999	\N	72
8603	Qual o resultado de 328 x 79 ?	\N	2	0.40000001	240	0.15000001	\N	4212
10831	 Na classe do Frederico, o professor propõe as atividades em grupo toda a semana. Quando são formados grupos de 4 alunos, sobra 1 aluno; quando são formados grupos de 5 alunos, também sobra 1. Quantos alunos tem essa classe, sabendo que esse número é maior do que 25 e menor do que 45? 	\N	1	0.30000001	1200	0.15000001	\N	6370
8615	A multiplicação entre o antecessor de 37 e o sucessor de 13 é:	\N	1	0.40000001	240	0.15000001	\N	4212
10845	 Contando-se os alunos de uma classe de 4 em 4 sobram 2, e contando-se de 5 em 5 sobra 1. Sabendo-se que 15 alunos são meninas e que nesta classe o número de meninas é  maior que o número de meninos, então o número de meninos nesta classe é: 	\N	2	0.30000001	1200	0.15000001	\N	6370
8727	O segredo da seqüência  é que devemos dividir por 2 para determinar o próximo número. Quais são os próximos três números dessa seqüência?\r\n88, ___, ___, ___\r\n	\N	3	0.30000001	240	0.15000001	\N	4212
10819	 Na figura temos dois semicírculos de diâmetros PS, de medida 4, e QR, paralelo a PS. Além disso, o semicírculo menor é tangente a PS em O. Qual é a área destacada? 	imagem ulbra 2.GIF	0	0.30000001	1200	0.15000001	\N	6370
10859	 Se Rosana colocar suas fitas de  música em pilhas de 6, vai sobrar uma fita. Mas se ela as colocar em pilhas de 7, aí não vai sobrar nenhuma. Ela tem entre 20 e 70 fitas. Descubra quantas fitas ela tem.	\N	3	0.30000001	1200	0.15000001	\N	6370
11319	Se 47% das pessoas de Porto Alegre votaram, numa determinada urna, para\r\nprefeito e 75% votaram para senador, nessa mesma urna, qual é o percentual mínimo dos que votaram para prefeito e senador? 	\N	1	0.40000001	1800	0.15000001	\N	6370
11632	O Bando de Macacos\r\nMacaquinhos se divertem,\r\nDivididos em dois grupos.\r\nQuadrado de seu oitavo\r\nNa floresta espairece.\r\nCom roncos alegres, doze\r\nAtroam pela campina.\r\nSaberás quantos, ao todo,\r\nSão os monos desse bando?\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
11645	Um grupo de abelhas, cujo número era igual à raiz quadrada da metade do enxame todo, pousou num jasmineiro, deixando para trás 8/9 do enxame; somente uma abelha do mesmo enxame revoluteava em redor de um lótus, atraída pelo zumbido de uma de suas amigas que caíra imprudentemente na armadilha da florzinha de doce fragrância. Quantas abelhas formavam o enxame? 	\N	3	0.40000001	1800	0.15000001	\N	6370
11658	Resolva o desafio, que conta um pouco da vida do matemático Diofante:\r\n\r\n“Deus lhe concedeu a graça de ser um menino pela sexta parte de sua vida. Depois, por um doze avos, ele cobriu seu rosto com a barba.  A luz do casamento iluminou-o após a sétima parte e cinco anos depois do casamento Ele concede-lhe um filho. Ah! Criança tardia e má, depois de viver metade da vida de seu pai o destino frio a levou. Após consolar sua mágoa em sua ciência dos números, por quatro anos, Diofante terminou sua vida.” (Singh, 1999 p. 71) \r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
11671	Decomponha o número 100 em duas parcelas positivas tais que uma é múltiplo de 7 e a outra de 11. ( Problema do matemático L. Euler [1707-1783].)	\N	0	0.40000001	1800	0.15000001	\N	6370
11684	Quantas quadras de basquete e quantas de vôlei são necessárias para que 77 alunos joguem simultaneamente? 	\N	3	0.40000001	1800	0.15000001	\N	6370
12354	O preço de uma corrida de táxi é igual a R$2,50 ("bandeirada"), mais R$0,10 por cada 100 metros rodados.  Tenho apenas R$10,00 no bolso.  Logo tenho dinheiro para uma corrida de até:\r\n	\N	2	0.30000001	1200	0.15000001	\N	6370
12502	Três pessoas, A, B, C, chegam no mesmo dia a uma cidade onde há cinco hotéis H1, H2, H3, H4 e H5. Sabendo que cada hotel tem pelo menos três vagas, qual/quais das seguintes afirmações, referentes à distribuição das três pessoas nos cinco hotéis, é/são corretas?\r\n\r\n(I) Existe um total de 120 combinações.\r\n(II) Existe um total de 60 combinações se cada pessoa pernoitar num hotel diferente.\r\n(III) Existe um total de 60 combinações se duas e apenas duas pessoas pernoitarem no mesmo hotel.\r\n\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
12510	Na figura, o número de triângulos que se obtém com vértices nos pontos D, E, F, G, H, I, J é	a5.JPG	3	0.40000001	1800	0.15000001	\N	6370
15427	603	img3_6.GIF	1	0.30000001	100	0.15000001	\N	40
13607	Quais são os possíveis restos na divisão de um número N por 5? Dica: Escreva as divisões na seguinte forma: N=qd+r , onde N é número que estamos dividindo, q é o quociente, d é o divisor e r é o resto. 	\N	2	0.40000001	180	0.15000001	\N	40
15988	615	img8_6.GIF	0	0.30000001	60	0.15000001	\N	40
15438	604	img4_6.GIF	1	0.40000001	160	0.15000001	\N	40
15449	605	img5_6.GIF	3	0.55000001	220	0.2	\N	40
15459	Para completar seu álbum de fotografias Paula ganhou 5 figurinhas de sua irmã, enquanto Renata ganhou o dobro e Jéssica o dobro mais uma. Quantas figurinhas elas ganharam no total?	\N	2	0.30000001	100	0.15000001	\N	40
15960	Mariana tem 17 anos menos que o triplo da idade de Dora. A soma das idades das duas é 39. A expressão que nos permite calcular a idade de Dora é:	\N	2	0.40000001	160	0.15000001	\N	40
15469	606	imag6_6.GIF	4	0.55000001	220	0.2	\N	40
15978	614	img7_6.GIF	1	0.30000001	60	0.15000001	\N	40
15996	A sentença matemática Z+3<20 , é:	\N	1	0.30000001	60	0.15000001	\N	40
16020	Se chamarmos a idade de Clarice hoje de x, como podemos representar algebricamente a idade de Clarice daqui a 8 anos sabendo nessa época ela terá o triplo da idade que tinha há 6 anos.	\N	4	0.40000001	140	0.15000001	\N	40
15970	É correto dizer que a sentença matemática 3x+15=81  é uma equação?	\N	0	0.30000001	60	0.15000001	\N	40
16006	616	img9_6.GIF	2	0.40000001	120	0.15000001	\N	40
16682	705	qt1_7serie.gif	3	0.40000001	150	0.15000001	\N	40
8980	Em uma floricultura, foram vendidas, em um dia, 3 dúzias de cravo, o triplo dessa quantidade de rosas e mais 4 dúzias de palmas. Quantas flores foram vendidas?	\N	0	0.40000001	240	0.15000001	\N	4212
10880	 Um pai e um filho são pescadores. Cada um tem um barco e vão ao mar no mesmo dia. O pai volta para casa a cada 20 dias e o filho a cada 15 dias. Em quantos dias se encontrarão em casa pela primeira vez? 	\N	2	0.30000001	1200	0.15000001	\N	6370
10909	 Um ônibus sai da rodoviária de Porto Alegre com destino a Fortaleza  de 8 em 8 dias e outro ônibus sai, também da rodoviária de Porto Alegre,  rumo a Cuiabá de 5 em 5 dias. No dia 31 de março de 2008 os dois ônibus saíram juntos. Em que dia isso irá acontecer novamente? 	\N	2	0.30000001	1200	0.15000001	\N	6370
10925	 Três corredores largaram juntos em uma prova em que o percurso é circular. Eles correm com velocidade constante. Bruno leva 3 minutos para completar uma volta, Henrique 4 minutos e Davi 6 minutos. Depois de quanto tempo os três passarão juntos pela primeira vez a linha de largada? 	\N	0	0.30000001	1200	0.15000001	\N	6370
10977	Caminhando em linha reta ao longo de uma praia, um banhista vai de um ponto A a um ponto B, cobrindo a distancia AB = 1.200 metros. Quando em A ele avista um navio parado em N de tal maneira que o ângulo NAB é de 60°; e quando em B, verifica que o ângulo NBA é de 45°. Calcule a distância a que se encontra o navio da praia. 	\N	0	0.30000001	1200	0.15000001	\N	6370
10990	A rampa de acesso à garagem de um edifício sobre um terreno plano tem forma retangular e determina um ângulo de 60° com o solo. Sabendo-se que ao meio-dia a sombra da rampa tem área igual a 36m², calcule a área da rampa.	\N	3	0.30000001	1200	0.15000001	\N	6370
10999	Cláudio anotou suas médias bimestrais de matemática, português, ciências e estudos sociais em uma tabela com quatro linhas e quatro colunas, formando uma matriz, como mostra a figura.\r\nSabe-se que as notas de todos os bimestres têm o mesmo peso, isto é, para calcular a média anual do aluno em cada matéria basta fazer a média aritmética de suas médias bimestrais. Para gerar uma nova matriz cujos elementos representem as médias anuais de Cláudio, na mesma ordem da matriz apresentada, bastará multiplicar essa matriz por: 	6.JPG	0	0.30000001	1200	0.15000001	\N	6370
11023	Em um laboratório, as substâncias A, B e C são a matéria-prima utilizada na fabricação de dois medicamentos. O Mariax é fabricado com 5g de A, 8g de B e 10g de C e o Luciax é fabricado com 9g de A, 6g de B e 4g de C. Os preços dessas substâncias estão em constante alteração e, por isso, um funcionário criou um programa de computador para enfrentar essa dificuldade. Fornecendo-se ao programa os preços X, Y e Z de um grama das substâncias A, B e C, respectivamente, o programa apresenta uma matriz C, cujos elementos correspondem aos preços de custo da matéria-prima do Mariax e do Luciax. Essa matriz pode ser obtida de:\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
11336	Quantos são os anagramas da palavra SIMULADO que têm o S em 1º lugar, ou I em 2º lugar, ou M em 3º lugar ou U em 4º lugar? De quantos modos podemos escolher 6 pessoas, incluindo pelo menos duas mulheres,em um grupo de 7 homens e 4 mulheres? 	\N	0	0.40000001	1800	0.15000001	\N	6370
11733	Quantas quadras de basquete e quantas de vôlei são necessárias para que 80 alunos joguem simultaneamente? 	\N	2	0.40000001	1800	0.15000001	\N	6370
11746	Um circo cobra R$ 6,00 a entrada de crianças e R$ 11,00 a de adultos. Qual é o menor número de pessoas que pode assistir a um espetáculo de maneira que a bilheteria seja R$ 350,00? (Em tempo: a capacidade desse circo é suficiente para esse número de pessoas.) 	\N	1	0.40000001	1800	0.15000001	\N	6370
11759	Eu e meu irmão caçula temos idades entre 10 e 20 anos, e hoje, nossas idades são expressas ambas por números primos, fato que se repetirá pela próxima vê daqui a 18 anos. Determine minha idade, sabendo que a idade de nosso mais velho, que hoje, também é um número primo, é uma unidade maior do que a soma das nossas idades. 	\N	3	0.40000001	1800	0.15000001	\N	6370
11772	Um carpinteiro recebeu a incumbência de cortar 40 toras de madeira de 8m cada uma e 60 toras da mesma madeira de 6m cada uma, em pedaços de mesmo tamanho, sendo que o comprimento desses pedaços deveria ser o maior possível. Nessas condições, ao todo, quantos pedaços de madeira foram cortados pelo carpinteiro: 	\N	3	0.40000001	1800	0.15000001	\N	6370
11785	Um colecionador possui um número de moedas compreendido entre 150 e 200. Agrupando essas moedas de 12 em 12, de 15 em 15 ou de 36 em 36, sempre sobram 10 moedas. Quantas moedas têm esse colecionador? 	\N	1	0.40000001	1800	0.15000001	\N	6370
11799	Vítor tem mais de 80 discos. Quando ele forma pilhas com 2 discos, sobra um disco. Quando ele forma pilhas com 3 discos ou 4 discos, também sobra um disco. Quando ele forma pilhas com 7 discos, não sobram discos. Qual o menor número de discos que ele poderia ter? 	\N	2	0.40000001	1800	0.15000001	\N	6370
13990	 Lançando-se simultaneamente dois dados não viciados, a probabilidade de que suas faces superiores exibam soma igual a 7 ou 9 é:\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
3706	Q1	\N	0	0.80000001	111	0.1	\N	72
3736	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="|" close="|"><mrow><mn>5</mn></mrow></mfenced></math>##$	\N	0	0.89999998	111	0.1	\N	72
1893	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi> log </mi><mfenced> <mrow><mn>6</mn></mrow> </mfenced></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="|" close="|"><mrow><mn>56</mn></mrow></mfenced></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow> <munder> <mrow> <mi>lim</mi> </mrow> <mrow><mi>n</mi> <mo>→</mo> <mi> ∞ </mi></mrow> </munder> <mrow><mrow> <munderover> <mo>∑</mo> <mrow><mi>i</mi> <mo> &equals; </mo><mn>9</mn></mrow> <mrow><mn>9</mn></mrow> </munderover> <mrow><mi>k</mi></mrow> </mrow></mrow> </mrow></math>##$	\N	0	0.80000001	111	0.30000001	\N	72
3740	 $##<math xmlns="http://www.w3.org/1998/Math/MathML"> <msub> <mrow><mn>3</mn> </mrow> <mrow> <mn>2</mn> </mrow> </msub></math>##$	\N	0	0.89999998	111	0.80000001	\N	72
3738	 $##<math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow> <munder> <mrow> <mi>lim</mi> </mrow> <mrow><mi>n</mi> <mo>&rarr;</mo> <mn>1</mn></mrow> </munder> <mrow><mrow> <munderover> <mo>&prod;</mo> <mrow><mi>i</mi><mo> &equals; </mo><mn>1</mn></mrow> <mrow> <mi> &omega; </mi> </mrow> </munderover> <mrow><mi>w</mi></mrow> </mrow></mrow> </mrow></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi>a</mi><mo> &Intersection; </mo><mi>b</mi></math>##$	\N	0	0.89999998	111	0.1	\N	72
3900	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mtext>mc</mtext></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$	\N	0	0.69999999	111	0.60000002	\N	72
3902	seablablan\r\nbla$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>7</mn><mo> ⋅ </mo><mi>x</mi></mrow> <mrow><msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></mrow> </mfrac></math>##$	\N	0	0.69999999	34	0.5	\N	72
3904	sea a < b\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow><mn>3</mn></mrow> <mfenced> <mrow><mfenced open="[" close="]"><mtable><mtr><mtd><mn>2</mn></mtd><mtd><mn>2</mn></mtd></mtr><mtr><mtd><mn>2</mn></mtd><mtd><mn>3</mn></mtd></mtr></mtable></mfenced></mrow> </mfenced></math>##$	\N	0	0.5	111	0.1	\N	72
3907	trtrtrt$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi> ln </mi><mfenced> <mrow><mn>2</mn></mrow> </mfenced></math>##$gfggfgf	\N	0	0.60000002	112	0.2	\N	72
3916	ghhgfhgf	\N	0	0.69999999	11	0.40000001	\N	72
3919	eeerw$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi> ln </mi><mfenced> <mrow><mn>4</mn></mrow> </mfenced></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML">  <msup> <mrow><mtext>e</mtext></mrow> <mrow><mn>6</mn></mrow> </msup></math>##$	\N	0	0.80000001	111	0.30000001	\N	72
3921	Sea la formula$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>E</mi><mo> &equals; </mo><mtext>mc</mtext></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$\r\n¿A que investigador se debe? 	\N	0	0.5	50	0.30000001	\N	72
3925	Sea la función\r\n\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mi> sin </mi><mfenced> <mrow><mi>x</mi></mrow> </mfenced></mrow> <mrow><mi>y</mi><mo> &minus; </mo><mn>3</mn></mrow> </mfrac></math>##$	\N	0	0.5	10	0.1	\N	72
4033	asfsdfsdfsafsd	\N	0	0.80000001	111	0.1	\N	72
302	4	\N	0	0.89999998	111	0.1	\N	72
4442	Com os seguintes números, podemos fazer algumas adições:\r\n86     37    143    49    94\r\nEm qual opção TODAS estão corretas?\r\n	\N	3	0.2	180	0.15000001	\N	4212
4240	pregunta 2	\N	1	0.40000001	30	0.40000001	\N	4210
4243	pregunta1	\N	0	0.30000001	30	0.1	\N	4210
4302	C9	\N	2	0.40000001	30	0.2	\N	4210
4325	REspecto a C1	\N	0	0.89999998	15	0.1	\N	4210
4329	C1b	\N	0	0.89999998	20	0.1	\N	4210
4448	Todos os números abaixo podem ser agrupados em pares que, se somados, apresentam o mesmo total. Quais são esses pares?\r\n\r\n19    12    13    18    11    17\r\n	\N	1	0.2	180	0.15000001	\N	4212
4458	Calcule o total da soma: 545 + 2298 + 99	\N	0	0.2	180	0.15000001	\N	4212
8992	O coração de um elefante bate, em média, 30 vezes por minuto. Quantas vezes ele bate em uma hora?	\N	3	0.40000001	240	0.15000001	\N	4212
4454	Podemos afirmar que a soma de dois números naturais quaisquer é sempre um número natural?	\N	1	0.2	60	0.15000001	\N	4212
4436	O que acontece com a soma quando mudamos a ordem de duas parcelas? \r\n       Ex: 54 + 36\r\n\t   36 + 54\r\n	\N	2	0.2	60	0.15000001	\N	4212
4721	No número 8345, o algarismo que representa a ordem das dezenas é:\r\n	\N	3	0.2	180	0.15000001	\N	4212
16694	706	qt2_7serie.gif	2	0.40000001	180	0.15000001	\N	40
4859	No Conjunto dos Números Naturais é possível efetuar a subtração 45 – 50?\r\n\r\n	\N	2	0.2	60	0.15000001	\N	4212
16706	707	qt3_7serie.gif	1	0.30000001	100	0.15000001	\N	40
16754	708	qt4_7serie.gif	1	0.40000001	170	0.15000001	\N	40
16765	709	qt5_7serie.gif	2	0.55000001	270	0.2	\N	40
16522	701	img1_7.GIF	0	0.40000001	150	0.15000001	\N	40
9004	Em um restaurante há 6 garçons. Em um determinado dia, veja quanto cada um recebeu: R$ 80,00 ; R$ 50,00 ; R$ 40,00 ; R$ 90,00 ; R$ 100,00 ; R$ 60,00. No final do dia, as gorjetas recebidas são repartidas igualmente entre eles. Quanto cada um recebeu?	\N	2	0.40000001	240	0.15000001	\N	4212
11044	Cinco cidades, A, B, C, D e E, são interligadas por rodovias, conforme mostra a figura. \r\nA rodovia AC tem 40 km, a rodovia AB tem 50km, os ângulos x, entre AC e AB, e y, entre AB e BC, são tais que sen x = 3/4 e sen y = 3/7. Deseja-se construir uma nova rodovia ligando as cidades D e E que, dada a disposição destas cidades, será paralela a BC. Sabendo que AD tem 30 km, determine quantos quilômetros terá a rodovia DE.\r\n	imagem7.JPG	1	0.30000001	1200	0.15000001	\N	6370
14072	 A figura acima mostra a superfície lateral de um cone circular reto, desenvolvida num plano.\r\n\r\nO raio do cone mede:\r\n	r24.GIF	2	0.40000001	1800	0.15000001	\N	6370
4366	Se as parcelas são 486 e 300, então a soma é:	\N	2	0.2	120	0.15000001	\N	4212
5960	¿Cómo se pueden diferenciar entre sí las series de datos?	\N	2	0.2	120	0.2	\N	5890
5972	¿Un gráfico puede tener más de una serie de datos?	\N	2	0.2	120	0.2	\N	5890
4416	Qual o número que possui a decomposição: 1000 + 500 + 30 + 7	\N	2	0.2	120	0.15000001	\N	4212
5980	Las categorías toman sus nombres de:	\N	0	0.2	120	0.2	\N	5890
5988	Las categorías que aparecen en el eje de categorías interesará que tomen formato de escala de tiempo cuando éstas representen valores de:	\N	1	0.2	120	0.2	\N	5890
4715	A leitura correta do número 8204 é:\r\n\r\n\t	\N	2	0.2	120	0.15000001	\N	4212
5996	Los marcadores de datos son:	\N	2	0.2	120	0.2	\N	5890
6000	La unión de varios marcadores de datos constituyen una:	\N	0	0.2	120	0.2	\N	5890
6007	Habitualmente, el eje vertical de un gráfico suele ser el:	\N	0	0.2	120	0.2	\N	5890
6011	Habitualmente, el eje horizontal de un gráfico suele ser el:	\N	1	0.2	120	0.2	\N	5890
6015	El eje Y suele contener:	\N	0	0.2	120	0.2	\N	5890
6027	El eje X suele contener:	\N	2	0.2	120	0.2	\N	5890
6031	El campo de fila interior es:	\N	1	0.2	120	0.2	\N	5890
6035	Según sus atributos, un campo de fila puede ser:	\N	1	0.2	120	0.2	\N	5890
6043	Los campos de columna se ubican:	\N	2	0.2	120	0.2	\N	5890
6047	Un campo de columna se encontrará asignado en un informe de tabla dinámica a una orientación de:	\N	2	0.2	120	0.2	\N	5890
6055	Los elementos de campo:	\N	2	0.2	120	0.2	\N	5890
6059	Cada elemento de campo representa:	\N	0	0.2	120	0.2	\N	5890
6063	A un campo de página también se le conoce como:	\N	1	0.2	120	0.2	\N	5890
6067	Los campos de página se ubican en:	\N	2	0.2	120	0.2	\N	5890
6071	Al seleccionar un elemento de campo de página:	\N	0	0.2	120	0.2	\N	5890
6075	Al desplegar los elementos de campo de página aparece a su lado izquierdo:	\N	1	0.2	120	0.2	\N	5890
6083	La función que Excel aplica predeterminadamente para datos numéricos es:	\N	0	0.2	120	0.2	\N	5890
6087	La función que Excel aplica predeterminadamente para dato de texto es:	\N	1	0.2	120	0.2	\N	5890
6095	Los valores del área de datos:	\N	0	0.2	120	0.2	\N	5890
6103	El área de datos de un informe de tabla dinámica puede contener:	\N	1	0.2	120	0.2	\N	5890
6107	Utilizando la flecha de la lista desplegable del campo:	\N	2	0.2	120	0.2	\N	5890
6115	Las flechas de lista desplegable de campo aparecen en los campos:	\N	1	0.2	120	0.2	\N	5890
6119	Para visualizar todos los datos de un gráfico dinámico:	\N	1	0.2	120	0.2	\N	5890
6123	Para quedarnos con determinados subconjuntos de valores podemos:	\N	1	0.2	120	0.2	\N	5890
6131	Los campos de datos:	\N	0	0.2	120	0.2	\N	5890
6135	En los campos de datos:	\N	1	0.2	120	0.2	\N	5890
6143	Los campos de serie:	\N	1	0.2	120	0.2	\N	5890
6151	La orientación de serie de un gráfico dinámico contiene:	\N	1	0.2	120	0.2	\N	5890
6155	Los campos de categoría:	\N	1	0.2	120	0.2	\N	5890
6163	Si se intercambia un campo de categoría con otro de serie:	\N	2	0.2	120	0.2	\N	5890
6167	Los elementos de campo pertenecen a:	\N	2	0.2	120	0.2	\N	5890
6171	Los elementos de los campos:	\N	1	0.2	120	0.2	\N	5890
6183	Al representar un gráfico dinámico a partir de una lista de datos en Excel:	\N	2	0.2	120	0.2	\N	5890
6187	Las áreas de colocación que se muestran al representar un gráfico dinámico cuyo diseño se podrá realizar en la propia hoja de cálculo:	\N	0	0.2	120	0.2	\N	5890
6191	En un gráfico, los datos se agrupan en:	graficos.gif	1	0.40000001	180	0.2	\N	5890
6197	Un informe de tabla dinámica es:	tablas dinamicas.GIF	3	0.40000001	180	0.2	\N	5890
6215	Un informe de gráfico dinámico:	igrafico dinamico.GIF	4	0.40000001	180	0.2	\N	5890
11367	Na porta de um supermercado foi realizada uma enquête, com 100 pessoas, sobre três produtos. As respostas foram: 10 pessoas compram somente o produto A, 30 pessoas compram somente o produto B, 15 pessoas compram somente o produto C, 8 pessoas compram A e B, 5 pessoas compram A e C, 6 pessoas compram B e C e 4 pessoas compram os três produtos. Quantas pessoas compram os produtos A ou B? 	\N	1	0.40000001	1800	0.15000001	\N	6370
6221	Un gráfico dinámico:	grafico dinamico.GIF	3	0.80000001	240	0.1	\N	5890
12379	108 crianças da 5ª e 6ª séries vão fazer um passeio numa caverna. São formados grupos iguais com mais de 5, porém menos de 20 alunos. Com relação ao número de estudantes por grupo,  de quantas formas diferentes eles podem ser feitos? 	\N	3	0.30000001	1200	0.15000001	\N	6370
11061	Uma ponte deve ser construída sobre um rio, unindo os pontos A e B, como  ilustrado na figura. \r\nPara calcular o comprimento AB, escolhe-se um ponto C, na mesma margem  em que B está, e medem-se os ângulos CBA = 57° e ACB = 59°. Sabendo que BC mede 30m, determine, em metros, à distância AB.\r\n	imagem9.JPG	3	0.30000001	1200	0.15000001	\N	6370
11813	Uma camponesa levava uma cesta de ovos. Ao perguntar-lhe quantos ovos levava, respondeu: “São menos de 100. Se os divido de 2 em 2, sobra 1; se os divido de 3 em 3 me sobram 2; dividindo de 4 em 4 me sobram 3; de 5 em 5 sobram 4”. Quantos ovos a camponesa levava? 	\N	0	0.40000001	1800	0.15000001	\N	6370
11827	Uma alga cresce de modo que a cada dia ela cobre a superfície de área igual ao dobro da coberta no dia anterior. Se esta alga cobre a superfície de um lago em 100 dias, qual o número de dias necessários,  para que duas algas da mesma espécie da anterior cubram a superfície do mesmo lago? 	\N	1	0.40000001	1800	0.15000001	\N	6370
11854	De quantos modos podemos escolher 6 pessoas, incluindo pelo menos duas mulheres,em um grupo de 7 homens e 4 mulheres? 	\N	0	0.40000001	1800	0.15000001	\N	6370
11871	Qual é o número de funções injetoras definidas em A= {1,2,3} com valores em B={0,1,2,3,4}? 	\N	1	0.40000001	1800	0.15000001	\N	6370
12361	Um arquiteto apresenta ao seu cliente cinco plantas diferentes para o projeto de ajardinamento de um terreno retangular (A, B, C, D – conforme a figura), onde as linhas cheias representam a cerca que deve ser construída para proteger as flores. As regiões claras são todas retangulares e o tipo de cerca é o mesmo em todos os casos. Em qual dos projetos o custo da construção da cerca será maior? \r\n	a2.JPG	2	0.30000001	1200	0.15000001	\N	6370
12390	Um artesão começa a trabalhar às 8h e produz 6 braceletes a cada vinte minutos; seu auxiliar começa a trabalhar uma hora depois e produz 8 braceletes do mesmo tipo a cada meia hora. O artesão pára de trabalhar às 12h mas avisa ao seu auxiliar que este deverá continuar trabalhando até produzir o mesmo que ele. A que horas o auxiliar irá parar?\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
12397	Um feirante vende batatas e, para pesar, utiliza uma balança de dois pratos, um peso de 1 kg, um peso de 3 kg e um peso de 10 kg. Considere a seguinte afirmação: “Este feirante consegue pesar (com uma pesagem) n quilogramas de batatas”. Quantos valores positivos de n tornam essa afirmação verdadeira, supondo que ele pode colocar pesos nos dois pratos?	\N	3	0.30000001	1200	0.15000001	\N	6370
11388	Na porta de um supermercado foi realizada uma enquête, com 100 pessoas, sobre três produtos. As respostas foram: 10 pessoas compram somente o produto A, 30 pessoas compram somente o produto B, 15 pessoas compram somente o produto C, 8 pessoas compram A e B, 5 pessoas compram A e C, 6 pessoas compram B e C e 4 pessoas compram os três produtos. Quantas pessoas compram os produtos A e B e não compram C? 	\N	3	0.40000001	1800	0.15000001	\N	6370
11401	Na porta de um supermercado foi realizada uma enquête, com 100 pessoas, sobre três produtos. As respostas foram: 10 pessoas compram somente o produto A, 30 pessoas compram somente o produto B, 15 pessoas compram somente o produto C, 8 pessoas compram A e B, 5 pessoas compram A e C, 6 pessoas compram B e C e 4 pessoas compram os três produtos. Quantas pessoas não compram nenhum desses produtos? 	\N	2	0.40000001	1800	0.15000001	\N	6370
11889	Tenho um cubo de madeira, com três faces vermelhas e três faces azuis, de modo que faces opostas tenham cores diferentes. O cubo é cortado em 3 x 3 x 3 = 27 cubos menores. Quantos destes cubos menores têm, pelo menos, uma face vermelha e outra azul? 	\N	1	0.40000001	1800	0.15000001	\N	6370
11962	Um negociante trabalha com as mercadorias A, B, e C de cada uma das quais tem um pequeno estoque não nulo. Se vender cada unidade de A por R$ 2,00, cada uma de B por R$ 3,00 e cada uma de C por R$ 4,00, obtém uma receita de R$ 50,00. Mas se vender cada unidade respectivamente por R$ 2,00, R$ 6,00 e R$ 3,00, a receita será de R$ 60,00. Calcular o número total de unidades que possui. 	\N	2	0.40000001	1800	0.15000001	\N	6370
11975	João diz a Pedro: se você me der 1/5 do dinheiro que possui eu ficarei com uma quantia igual ao dobro do que lhe restará. Por outro lado, se eu lhe der R$6.000,00 do meu dinheiro nós ficaremos com quantias iguais. Quanto dinheiro possui cada um? 	\N	0	0.2	600	0.15000001	\N	6370
12046	Em cerca de dez anos, estimava-se que 11,2% da população brasileira poderiam ser considerados dependentes de álcool. Esse índice, dividido por gênero, apontava que 17,1% da população masculina e 5,7% da população feminina eram consumidores da bebida. Quando analisada a distribuição etária desse consumo, outro choque: a pesquisa evidenciou que 41,2% de estudantes da educação básica da rede pública brasileira já haviam feito uso de álcool. Dados atuais apontam que a porcentagem de dependentes de álcool subiu para 15%. Estima-se que o país gaste 7,3% do PIB por ano para tratar de problemas relacionados ao alcoolismo, desde o tratamento de pacientes até a perda da produtividade no trabalho. A indústria do álcool no Brasil, que produz do açúcar ao álcool combustível, movimenta 3,5% do PIB. \r\n\r\nRevista Brasileira de Psiquiatria, v. 28, n.º 4, dez./2006\r\ne Internet: <www.alcoolismo.com.br> (com adaptações).\r\n\r\nA partir desses dados, conclui-se que: 	\N	2	0.2	600	0.15000001	\N	6370
14896	¿Qué son las células?	\N	2	0.5	30	0.40000001	\N	6272
14900	¿Qué tipos de células existen?	\N	0	0.60000002	60	0.44999999	\N	6272
11913	No triângulo PQR, a altura PF divide o lado QR em dois segmentos de medidas\r\nQF = 9 e RF = 5. Se PR = 13. Qual é a medida de PQ? 	\N	2	0.2	600	0.15000001	\N	6370
16617	627	qt26_6serie.gif	3	0.40000001	160	0.15000001	\N	40
11987	Em um restaurante, todas as pessoas de um grupo pediram um mesmo prato principal e uma mesma sobremesa. Com o prato principal o grupo gastou R$ 56,00 e com a sobremesa R$35,00; cada sobremesa custou R$ 3,00 a menos do que o prato principal. Encontre o número de pessoas neste grupo. 	\N	3	0.2	600	0.15000001	\N	6370
16607	626	qt25_6serie.gif	1	0.40000001	120	0.15000001	\N	40
11950	Alessandra, Joana e Sônia vendem saladas prontas, contendo porções de tomate, pimentão e repolho. A matriz M fornece o número de porções de tomate, pimentão e repolho usadas na composição das saladas. A matriz N fornece, em real, o custo das saladas.\r\nSabendo-se que o determinante de M é não-nulo, obtém-se a matriz que fornece, em real, o custo de cada porção de tomate, pimentão e repolho, efetuando-se a operação:	dificil33.JPG	3	0.40000001	1800	0.15000001	\N	6370
12000	Suponha que o preço de um automóvel tenha uma desvalorização média de 19% ao ano sobre o preço do ano anterior. Se F representa o preço inicial (preço de fábrica) e p (t), o preço após t anos. A expressão para p (t) será:	\N	3	0.2	600	0.15000001	\N	6370
12011	As indicações R1 e R2, na escala Richter, de dois teremos estão relacionadas pela fórmula $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msub> <mrow><mi>R</mi> </mrow> <mrow> <mn>1</mn> </mrow> </msub><mo> &minus; </mo><msub> <mrow><mi>R</mi> </mrow> <mrow> <mn>2</mn> </mrow> </msub><mo> &equals; </mo><msub> <mrow><mi> log </mi><mfenced> <mrow><mfrac> <mrow><msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>1</mn> </mrow> </msub></mrow> <mrow><msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>2</mn> </mrow> </msub></mrow> </mfrac></mrow> </mfenced> </mrow> <mrow> <mtext></mtext> </mrow> </msub></math>##$  em que M1 e M2 medem a energia liberada pelos terremotos sob a forma de ondas que se propagam pela crosta terrestre. Houve dois terremotos: um correspondente a R1 = 8 e outro correspondente a R2 = 6. Determine a razão $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>1</mn> </mrow> </msub></mrow> <mrow><msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>2</mn> </mrow> </msub></mrow> </mfrac></math>##$	\N	0	0.2	600	0.15000001	\N	6370
12022	Na seleção para as vagas deste anúncio, feita por telefone ou correio eletrônico, propunha-se aos candidatos uma questão a ser resolvida na hora. Deveriam calcular seu salário no primeiro mês, se vendessem 500 m de tecido com largura de 1,40 m, e no segundo mês, se vendessem o dobro. Foram bem sucedidos os jovens que responderam, respectivamente: 	facil26.JPG	2	0.2	600	0.15000001	\N	6370
12034	A tabela relaciona duas grandezas variáveis: a medida do comprimento do lado de um quadrado (l) e o seu perímetro (P). \r\nO perímetro de um quadrado varia de forma diretamente proporcional à medida do seu lado?\r\n	facil25.JPG	2	0.2	600	0.15000001	\N	6370
11415	Na porta de um supermercado foi realizada uma enquête, com 100 pessoas, sobre três produtos. As respostas foram: 10 pessoas compram somente o produto A, 30 pessoas compram somente o produto B, 15 pessoas compram somente o produto C, 8 pessoas compram A e B, 5 pessoas compram A e C, 6 pessoas compram B e C e 4 pessoas compram os três produtos. Quantas pessoas compram pelo menos um dos três produtos?	\N	0	0.40000001	1800	0.15000001	\N	6370
12068	Mariana foi ao mesmo tempo trigésima quarta melhor classificada e a trigésima quarta pior classificada de um concurso. Quantos eram os concorrentes?	\N	2	0.2	600	0.15000001	\N	6370
12437	A escrita Braille para cegos é um sistema de símbolos onde cada caractere é formado por uma matriz de 6 pontos dos quais pelo menos um se destaca em relação aos outros. Observe, como exemplo, a figura dada.\r\nQual o número máximo de caracteres distintos que podem ser representados neste sistema de escrita?\r\n\r\n	A3.JPG	0	0.40000001	1800	0.15000001	\N	6370
12902	Durante a Copa do Mundo, que foi disputada por 24 países, as tampinhas de Coca-Cola traziam palpites sobre os países que se classificariam nos três primeiros lugares (por exemplo: 1º. lugar, Brasil; 2º. lugar, Nigéria; 3º. lugar, Holanda).\r\nSe, em cada tampinha, os três países são distintos, quantas tampinhas diferentes poderiam existir?\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
6400	Un método Monte-Carlo es:	\N	2	1	15	0.333	\N	6353
6433	Siglas de Técnicas de edición e imputación de datos estadísticos	\N	0	1	15	0.5	\N	6420
6438	Opciones del menú principal	\N	1	0.5	30	0.25	\N	6420
6443	que hace abrir metafile	\N	0	0.60000002	30	0.25	\N	6420
4426	O segredo da seqüência é que devemos somar 7 para determinar o próximo número. Quais são os próximos 3 números dessa seqüência?\r\n\r\n8, ___, ___, ___\r\n	\N	0	0.2	120	0.15000001	\N	4212
4464	Determine a soma: 5129 + 1276 	\N	3	0.2	180	0.15000001	\N	4212
14943	¿Cuáles son las caracteríticas de las células?	\N	1	0.60000002	60	0.44999999	\N	6272
16646	629	qt28_6serie.gif	1	0.40000001	180	0.15000001	\N	40
4470	Determine a soma: 4957 + 6103 	\N	2	0.2	180	0.15000001	\N	4212
12057	Se a distância entre uma pessoa e uma torre é 100 m e o ângulo formado pelo topo da torre e o chão é $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>30</mn></mrow> <mrow><mi>o</mi></mrow> </msup></math>##$, qual a altura da torre em metros?	\N	0	0.2	600	0.15000001	\N	6370
4476	A soma do sucessor de 20 com o sucessor de 19 é:	\N	0	0.30000001	120	0.15000001	\N	4212
16628	628	qt27_6serie.gif	1	0.40000001	170	0.15000001	\N	40
6300	pregunta 1$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow> <munder> <mrow> <mi>lim</mi> </mrow> <mrow><mi>n</mi> <mo>&rarr;</mo> <mi> log </mi><mfenced> <mrow><mn>5</mn></mrow> </mfenced></mrow> </munder> <mrow><mi>n</mi></mrow> </mrow></math>##$	\N	0	0.69999999	30	0.25	\N	6272
4486	Determine os próximos números da seqüência:\r\n\r\n135, 138, 141, 144, 147, ___, ___, ___\r\n	\N	3	0.30000001	180	0.15000001	\N	4212
4498	As parcelas corretas da seguinte soma são:\r\n___6 9 + 2 __ __ =  8 8 1\r\n	\N	1	0.30000001	240	0.15000001	\N	4212
4504	Qual das alternativas possui a soma igual em ambos os lados:\r\n	\N	1	0.30000001	240	0.15000001	\N	4212
4509	835 + 738 + 933. Qual o resultado dessa soma?	\N	2	0.30000001	240	0.15000001	\N	4212
4515	Qual o resultado da soma: 2583 + 6739 =	\N	1	0.30000001	180	0.15000001	\N	4212
4521	Com os algarismos 5, 4, 3 e 2, obtenha uma soma com o resultado 95:\r\n_ _ + _ _ = 95\r\n	\N	3	0.30000001	180	0.15000001	\N	4212
6526	Numa gaiola estão 9 camundongos rotulados 1,2,3,...,9. Selecionando-se conjuntamente 2 camundongos ao acaso (todos têm igual possibilidade de ser escolhidos), a probabilidade de que na seleção ambos os camundongos tenham rótulo impar é:	\N	3	0.2	600	0.15000001	\N	6370
6536	Das 10 alunas de uma classe, 3 tem olhos azuis. Se duas delas são escolhidas ao acaso, qual é a probabilidade de ambas terem os olhos azuis?	\N	1	0.2	600	0.15000001	\N	6370
6546	Para sortear uma vaga em uma reunião de condomínio, da qual participaram 12 pessoas, foram colocados 12 pedaços de papel idênticos, todos em branco, exceto um, no qual foi escrita a palavra “vaga”. Cada pessoa retira, na sua vez, um papel da urna. O que é melhor: ser o primeiro ou o último a sortear seu papel? \r\n	\N	2	0.2	600	0.15000001	\N	6370
6556	Os alunos de um certo curso fazem 4 matérias, entre as quais Cálculo e Estatística. As provas finais serão realizadas em uma única semana (de segunda a sexta). Admitindo que cada professor escolha o dia da sua prova ao acaso, qual é a probabilidade de que as provas de Álgebra e Estatística sejam marcadas para o mesmo dia? \r\n\r\n\r\n	\N	0	0.2	600	0.15000001	\N	6370
6566	O piso de um quarto tem forma de um quadrado de lado 4 m. De quantas maneiras podemos cobrir totalmente o quarto com oito tapetes iguais de dimensões 1 m e 2m?  \t\t\t\t\t\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
6576	Uma lata de leite em pó, em forma de um cilindro reto, possui 8 cm de altura com 3 cm de raio na base. Uma outra lata de leite, de mesma altura e cujo raio é o dobro da primeira lata, possui um volume: 	\N	2	0.2	600	0.15000001	\N	6370
11088	No quadrilátero apresentado, AB = BC = 3cm, AD = 2cm, D B=60° e DÂB=90°. Determine a medida, em cm, do perímetro do quadrilátero da figura a seguir: 	imagem11.JPG	1	0.30000001	1200	0.15000001	\N	6370
12404	Uma urna contém apenas cartões marcados com números de três algarismos distintos, escolhidos de 1 a 9. Se, nessa urna, não há cartões com números repetidos, a probabilidade de ser sorteado um cartão com um número menor que 500 é:	\N	3	0.30000001	1200	0.15000001	\N	6370
12416	Um casal decidiu que vai ter 4 filhos. Qual é a probabilidade de que:tenham pelo menos um menino?	\N	2	0.30000001	1200	0.15000001	\N	6370
12428	Na área de Ciências Humanas, existem treze opções no Vestibular da UNITAU. Um candidato tem certeza quanto à 1ª. opção mas, quanto à segunda, está em dúvida, por isso resolve escolher aleatoriamente qualquer uma nesta área. De quantas maneiras ele poderá preencher sua ficha de inscrição, sendo a 2ª. necessariamente diferente da 1ª.?\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
6342	pregunta 2	\N	1	0.69999999	60	0.25	\N	6272
6788	Numa eleição há dois candidatos a presidente (A e B) e cinco a vice-presidente (C, D, E, F, G). Qual a probabilidade de A ser eleito presidente e F vice-presidente?\r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
4527	A, B e C são algarismos entre 0 e 9. Complete corretamente a adição: 8B3 + C87 + 57A = 2296\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
12121	Uma fábrica de máquinas fotográficas infantis tem cindo modelos, que vão dos mais simples (M1) ao mais sofisticado (M5). O preço do modelo M2 é o dobro do preço do modelo M1, que custa R$ 42,00. Qual é o preço do modelo mais sofisticado sabendo que a relação de aumento de preço é mantida? 	\N	2	0.2	600	0.15000001	\N	6370
6703	Ao somar cinco números consecutivos em sua calculadora, Esmeralda encontrou um número de 4 algarismos: 2 0 0 *. O último algarismo não está nítido, pois o visor da calculadora está arranhado, mas ela sabe que ele não é zero. Este algarismo só pode ser: \r\n	\N	0	0.2	600	0.15000001	\N	6370
6713	Vamos colocar 3 bolinhas brancas e 7 pretas dentro de um saco de pano. Uma pessoa vai enfiar a mão no saco e retirar, sem olhar, uma bolinha. Qual é a probabilidade de se retirar uma bolinha branca? \r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
6723	Qual a probabilidade de sair o número 5 quando atiramos um dado?\r\n	\N	1	0.2	600	0.15000001	\N	6370
6738	Para a prova de História o professor solucionou oito assuntos e disse que vai sortear um deles e cobrar nas questões. A Marilda não teve tempo e estudou somente seis assuntos. Qual a chance de ela não se sair bem na prova? \r\n\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
6748	Três sílabas foram escritas em três cartelas: MA, CO e CA. Colocando lado a lado as cartelas, é possível formar alguns anagramas. Qual a probabilidade de alguém, de olhos fechados, formar a palavra MACACO?\r\n	\N	1	0.2	600	0.15000001	\N	6370
6758	Maria Lúcia e Fernando vão se casar e estão planejando ter 3 filhos. Tanto ele quanto ela gostariam que fosse duas meninas e um menino. Qual a chance de isso acontecer? \r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
6768	A rifa da cesta de páscoa da sua escola tem 200 números e você comprou 5 delas. Qual sua chance de ganhar a cesta?\r\n\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
6778	Seis garotos, Arnaldo, Benedito, Carlos, Danilo, Eduardo e Fernando, disputam uma corrida em volta da pista de atletismo, e os dois primeiros que chegarem ganharão medalhas. Qual a probabilidade de o Eduardo chegar em primeiro lugar e o Fernando em segundo?\r\n	\N	0	0.2	600	0.15000001	\N	6370
6827	José, Corina, Augusto, Cleide e Roberto vão formar duplas para pingue-pongue. Qual é o total de possibilidades?\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
11130	 Numa classe do ensino médio, 28 alunos fizeram exames de Matemática, Física e Química. 12 alunos não passaram em Física. 2 alunos não passaram em Química e Matemática. 4 passaram nas três disciplinas. 5 não passaram em Física e Matemática. 1 passou apenas em Matemática. 10 não passaram em Matemática. Ninguém foi reprovado em todas as três disciplinas. Quantos alunos passaram apenas em Física e Matemática?	\N	3	0.40000001	1800	0.15000001	\N	6370
11143	 Um dos feitos do grego Eudoxo foi criar uma fórmula para calcular o volume dos cones, mostrando que ele está relacionado ao volume do cilindro. Se você se lembra disso poderá ajudar o Joãozinho, que colocou 300ml d’água em um copo e depois despejou parte dela em um recipiente cônico, como mostram as figuras. Ele quer saber quanta água sobrou no copo.	\N	1	0.40000001	1800	0.15000001	\N	6370
13800	Um dado foi lançado 50 vezes. A tabela acima mostra os seis resultados possíveis e as suas respectivas freqüências de ocorrências: \r\n \r\nA freqüência de aparecimento de um resultado ímpar foi de:\r\n	r11.GIF	2	0.40000001	1800	0.15000001	\N	6370
13243	¿Cuántas áreas tiene un chip CCD del tipo Frame Transfer?	\N	2	0.40000001	30	0.2	\N	6272
11434	Um professor de Português sugeriu em uma classe a leitura dos livros Helena, de Machado de Assis e Iracema, de José de Alencar. Vinte alunos leram Helena, 15 leram só Iracema, 10 leram os dois livros e 15 não leram nenhum deles. Qual o número de alunos nessa classe?	\N	3	0.40000001	1800	0.15000001	\N	6370
12083	Um nadador, nadando contra a correnteza de um rio, a cada 10 m nadados dá uma parada para descansar (boiando), e acaba retomando 2 m levado pela correnteza. Se gasta 1/2 segundo para cada metro nadado e 1 segundo para cada descanso, mantendo este ritmo até o final, em quanto tempo atingirá a marca dos 90 metros nadados? 	\N	0	0.2	600	0.15000001	\N	6370
4533	A soma do antecessor de 49 com o sucessor de 86 é:	\N	1	0.30000001	180	0.15000001	\N	4212
4539	No cálculo a seguir cada espaço representa um número. Encontre os números, sabendo que eles são consecutivos. Ex: 21, 22 e 23 são números consecutivos. \r\n\r\n____ + ____ + _____ = 27\r\n	\N	3	0.40000001	240	0.15000001	\N	4212
4549	A soma dos elementos do conjunto A = {6, 9, 23} é 38 e dos elementos do conjunto B = {11, 15, 30} é 56. Troque dois elementos de lugar,ou seja, do conjunto A para o B e do conjunto B para o A, para que a soma seja 47 em cada conjunto. Os elementos trocados foram:	\N	0	0.40000001	240	0.15000001	\N	4212
4555	Complete a adição abaixo, sabendo que as parcelas são números consecutivos entre 420 e 430.\r\n___ + ___ + ___ = 1272\r\n	\N	3	0.40000001	240	0.15000001	\N	4212
12094	Qual é a soma de 4 números se o primeiro número é 476 e cada um dos seguintes é igual ao anterior mais 17? 	\N	0	0.2	600	0.15000001	\N	6370
12106	Uma árvore cresce seguindo o esquema do desenho ao lado (a baixo). Ela lança um primeiro galho, depois mais um, depois mais dois e assim por diante. Se ela continuar a obedecer a essa seqüência numérica (criada pelo matemático italiano Fibonacci), quantos galhos ela terá na etapa seguinte de crescimento? E na próxima? 	facil19.JPG	0	0.2	600	0.15000001	\N	6370
12132	Tânia se conscientizou de que fumar é prejudicial à saúde. Ela fuma 20 cigarros por dia e, para deixar esse vício, se propôs a fumar dois cigarros a menos a cada dia. Supondo que ela seguiu o que propôs, determine em que dia ela fumou 4 cigarros. 	\N	2	0.2	600	0.15000001	\N	6370
12144	Paula fez depósitos mensais em seu banco (não sacou nenhuma vez, e o banco não lhe pagava dividendos). No primeiro mês, depositou R$ 50,00; no segundo mês, R$ 60,00; no terceiro mês, R$ 70,00, e assim por diante. O último depósito foi de R$ 640,00. Quantos meses se passaram, a partir do 1º depósito? 	\N	0	0.2	600	0.15000001	\N	6370
12453	Quatro cidades, A, B, C, D são interligadas por vias férreas, conforme a figura a seguir.\r\nOs trens movimentam-se apenas em linha reta, ligando duas cidades. Para atender a todos os passageiros, quantos tipos de passagens devem ser impressos? (As passagens de "ida" e "volta" são bilhetes distintos).\r\n	a4.JPG	1	0.40000001	1800	0.15000001	\N	6370
6610	 Uma escada tem 30 degraus. Rubinho está subindo essa escada de 3 em 3 degraus e Felício de 2 em 2 degraus. Algum deles vai pisar no 15° degrau? \r\n\r\n	\N	0	0.2	600	0.15000001	\N	6370
6619	Uma escada tem 30 degraus. Rubinho está subindo essa escada de 3 em 3 degraus e Felício de 2 em 2 degraus. Algum deles vai pisar no 23º degrau? \r\n	\N	3	0.2	600	0.15000001	\N	6370
6634	Uma escada tem 30 degraus. Rubinho está subindo essa escada de 3 em 3 degraus e Felício de 2 em 2 degraus. Algum deles vai pisar no 18º degrau? \r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
7128	No dia 5 de junho de 2008 a cotação de moedas estrangeiras era a seguinte: 1 Dólar valia 1,6 Reais e 1 Euro valia 1,6 Dólares. De quantos Reais necessito se quero comprar 10  Euros?  \r\n\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
6924	jhjhjhjhj	citius_logo.jpg	0	0.80000001	5000	0.30000001	\N	6272
6644	Uma escada tem 30 degraus. Rubinho está subindo essa escada de 3 em 3 degraus e Felício de 2 em 2 degraus. Quais são os degraus pisados pelos dois?\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
7237	Ao lançar um dado, qual a probabilidade de que ocorra o evento x ou y, sendo que x deve ser um número par e y deve ser um número maior que 3.	\N	2	0.30000001	1200	0.15000001	\N	6370
7254	pregunta 3	\N	0	0.69999999	60	0.30000001	\N	6272
7266	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi>a</mi><mo> &plus; </mo><mi>b</mi></math>##$	\N	0	0.69999999	60	0.1	\N	6272
7276	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow> <msubsup> <mo>&int;</mo> <mrow><mi>a</mi></mrow> <mrow><mi>b</mi></mrow>  </msubsup> <mrow><msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></mrow> <mo>&DifferentialD;</mo> <mrow><mi>x</mi></mrow> </mrow></math>##$	\N	0	0.60000002	60	0.1	\N	6272
6654	Uma escada tem 30 degraus. Rubinho está subindo essa escada de 3 em 3 degraus e Felício de 2 em 2 degraus. Qual é o primeiro degrau que os dois irão pisar juntos? \r\n	\N	1	0.2	600	0.15000001	\N	6370
6669	O O algarismo das unidades do número 1 x 3 x 5 x … x 97 x 99 é \r\n	\N	2	0.2	600	0.15000001	\N	6370
6798	Uma fábrica produz bicicletas e triciclos nas cores preta, azul, verde e amarela. Qual a probabilidade de Luiz ganhar de presente uma bicicleta preta e um triciclo azul?\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
6808	As placas das motos têm três letras e quatro números.  As placas são fabricadas utilizando as letras P, Q, Z e os algarismos 1, 2, 3 e 4. Qual a probabilidade de ser fabricada a placa PQZ1234?\r\n\r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
6817	Marta foi ao cinema com seu pai. Havia 2 portas para chegar à sala de espera. Dali para dentro, encontraram outras 3 portas. De quantas maneiras diferentes eles podem chegar até as poltronas?\r\n	\N	2	0.2	600	0.15000001	\N	6370
6837	Frederico tem duas calças: uma azul e uma cinza. Ele tem três camisas: uma vermelha, uma branca e uma amarela. De quantas maneiras diferentes ele poderá escolher uma calça e uma camisa?\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
6847	Uma escola oferece aos alunos as seguintes atividades esportivas: futebol, ciclismo, natação e voleibol, dos quais cada aluno deve escolher duas. De todas as escolhas, quantas não incluem o voleibol?\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
6857	Na classe de Renato os alunos estão inventando e resolvendo situações-problema que envolvem adição, subtração, multiplicação e divisão. Mas há um detalhe: em cada problema serão usadas sempre duas operações, iguais ou diferentes. Quantas são as possibilidades?\r\n	\N	0	0.2	600	0.15000001	\N	6370
6867	Quantas diagonais têm um hexágono?\r\n	\N	2	0.2	600	0.15000001	\N	6370
6877	Numa banca há 3 tipos de revistas: passatempos, de historinhas e de animais. Você vai comprar 3 revistas, que podem ou não ser do mesmo tipo. Quantas são as possibilidades de compra?\r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
6887	Quando 4 pessoas se encontram, quantos apertos de mãos são possíveis sem que os cumprimentos de repitam?\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
6897	Usando os algarismos 3, 5, 6 e 7, quantos números naturais de quatro algarismos distintos podemos formar com eles?\r\n\r\n\r\n	\N	0	0.2	600	0.15000001	\N	6370
6912	Você quer interligar 8 telefones dois a dois. Quantas ligações serão feitas?\r\n\r\n\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
7099	O perímetro de um retângulo é 100 e a diagonal mede x. Qual é a área do retângulo? 	\N	2	0.2	600	0.15000001	\N	6370
7108	 Seja AB um segmento de comprimento 26, e sejam C e D pontos sobre o segmento AB tais que AC = 1 e AD = 8. Sejam E e F pontos sobre uma semicircunferência de diâmetro AB, sendo EC e FD perpendiculares a AB. Quanto mede o segmento EF?	\N	3	0.2	600	0.15000001	\N	6370
7138	A quantidade de bichinhos de pelúcia que Bruna tem é menor que 50. Separando-os em grupos de 5, sobram 3 e separando-os em grupos de 9 sobram 2. Quantos bichinhos de pelúcia Bruna tem? 	\N	3	0.30000001	1200	0.15000001	\N	6370
7217	 Uma pessoa que pesa 140 “quilos” submete-se a uma dieta alimentar obtendo o seguinte resultado: nas quatro primeiras semanas, perde 3 “quilos” por semana; daí em diante apenas 1/2  “quilo” por semana. Calcule em quantas semanas a pessoa estará pesando 72 “quilos”. \r\n\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
7207	As medidas dos lados de um triângulo retângulo formam uma PA. Sabendo que a área desse triângulo é 24 cm², obtenha a medida do lado maior desse triângulo. 	\N	3	0.30000001	1200	0.15000001	\N	6370
7227	Uma urna contém 25 bolas numeradas de 1 a 25. Uma bola é extraída ao acaso dessa urna. Qual a probabilidade de o número da bola sorteada ser múltiplo de 2 ou 3.\r\n\r\n	\N	2	0.30000001	1200	0.15000001	\N	6370
11173	Determine o termo x da seqüência: 2, -4, 8, -16, x	\N	2	0.40000001	600	0.15000001	\N	6370
11184	Determine o termo x da seqüência: 3, -12, 48, -192, x	\N	0	0.2	600	0.15000001	\N	6370
11195	Determine o termo x da seqüência: 2, 7, 12, 17, x	\N	1	0.2	600	0.15000001	\N	6370
11206	Determine o termo x da seqüência: 50, 45, 41, 38, x	\N	1	0.2	600	0.15000001	\N	6370
11217	Determine o termo x da seqüência: 50, 47, 44, 41, x	\N	1	0.2	600	0.15000001	\N	6370
11228	Determine o termo x da seqüência: 28, 14, 7, 7/2, x	\N	1	0.2	600	0.15000001	\N	6370
7312	Para embalar presentes estão sendo confeccionadas caixas com cartolinas quadradas, das quais se recortam as quinas, como se pode ver na figura. Essas caixas devem ter um volume de 4 500 cm³. Determine o valor de x. 	caixa.JPG	2	0.30000001	1200	0.15000001	\N	6370
7326	Se forem sorteados três ingressos para um parque de diversão entre 4 alunos e 2 alunas, qual a probabilidade de que sejam sorteados 2 alunos e 1 aluna?	\N	0	0.30000001	1200	0.15000001	\N	6370
7336	Qual é a área do retângulo ?	retangulo.JPG	1	0.30000001	1200	0.15000001	\N	6370
7345	Um dos feitos do grego Eudoxo foi criar uma fórmula para calcular o volume dos cones, mostrando que o volume do cone é um terço do volume do cilindro de mesma base e altura. Joãozinho quer saber: se tinha 300ml d’água em um copo e depois despejou parte dela no recipiente cônico, como mostram as figuras, quanta água sobrou no copo?	cone.JPG	1	0.30000001	1200	0.15000001	\N	6370
7353	Um dos feitos do grego Eudoxo foi criar uma fórmula para calcular o volume dos cones, mostrando que o volume do cone é um terço do volume do cilindro de mesma base e altura. Joãozinho quer saber: se tinha 300ml d’água em um copo e depois despejou parte dela no recipiente cônico, como mostram as figuras, quanta água coube no cone?	cone.JPG	0	0.30000001	1200	0.15000001	\N	6370
7400	Seja AC  uma diagonal do quadrado ABCD. Se A = (-2, 3) e C = (0, 5), a área de ABCD, em unidades de área, é:\r\n\r\n	\N	0	0.2	600	0.15000001	\N	6370
11239	Determine o termo x da seqüência: 1, 3, 9, 27, x	\N	0	0.2	600	0.15000001	\N	6370
4561	Qual o resultado da soma: 1735 + 2434 + 1578 + 2436 + 1817 = 	\N	1	0.40000001	240	0.15000001	\N	4212
4567	Complete:\r\n3245 + 1786 = ____ + 7366 = ____ + 4968 = _____\r\n	\N	0	0.40000001	240	0.15000001	\N	4212
7298	Para embalar presentes estão sendo confeccionadas caixas com cartolinas quadradas, das quais se recortam as quinas, como se pode ver na figura. Essas caixas devem ter um volume de 2 000 cm³. Qual deve ser a dimensão da cartolina?	caixa.JPG	3	0.30000001	1200	0.15000001	\N	6370
7321	Se forem sorteadas duas entradas para um parque de diversão, entre 3 alunos e 2 alunas, qual a probabilidade de que sejam sorteados um aluno e uma aluna? \r\n \r\n \r\n 	\N	3	0.30000001	1200	0.15000001	\N	6370
7410	A distância entre os pontos M(4,-5) e N(-1,7) do plano xOy vale:\r\n	\N	1	0.2	600	0.15000001	\N	6370
7420	A reta s passa pelo ponto (0,3) e é perpendicular à reta AB onde A=(0,0) e B é o centro da circunferência x²+y²-2x-4y=20. Então a equação de s é:\r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
7480	Os lados de um triângulo medem, respectivamente, 4 cm, 7 cm e 8 cm. Qual o perímetro do triângulo cujas medidas dos lados de um triângulo semelhante a esse, sabendo-se que o lado homólogo ao de medida 4 cm tem medida 24 cm.\r\n\r\n	\N	0	0.2	600	0.15000001	\N	6370
4573	Que números naturais as letras representam?\r\n a + 15 = 15 + 17 ; \r\n(6 + 8) + 10 = 6 + (x + 10) ; \r\n(y + 3) + 17 = 5 + (3 + 17)\r\n	\N	0	0.60000002	180	0.15000001	\N	4212
13256	Ejes de arrastre en un CCD ortogonal	\N	0	0.80000001	60	0.30000001	\N	6272
13261	¿Qué regla suele seguir el tamaño físico de pixel?	\N	0	0.30000001	20	0.2	\N	6272
13265	¿Qué mide la astrometría?	\N	0	0.60000002	40	0.30000001	\N	6272
4579	A soma dos dez primeiros números naturais ímpares é:\r\n\r\n1 + 3 + 5 + 7 + 9 + 11 + ___ + ___ + ___ + ___ = ___\r\n	\N	2	0.40000001	240	0.15000001	\N	4212
7290	Uma pessoa de 1,25m cabe de pé dentro da tenda da figura a seguir?\r\n	barraca.JPG	1	0.30000001	1200	0.15000001	\N	6370
7430	Seja A a intersecção das retas r, de equação y= 2x, e s, de equação y = 4x-2. Se B e C são as intersecções respectivas dessas retas com o eixo das abscissas, a área do triângulo ABC é:\r\n	\N	0	0.2	600	0.15000001	\N	6370
7440	Um pedreiro recebeu as seguintes informações sobre medidas de material para obra e deve fazer a sua compra em m². Efetue as adições a seguir dando a resposta em m². ( 4,12 cm² + 0,0752 dm²+ 17,95 dm²).\r\n	\N	0	0.2	600	0.15000001	\N	6370
7450	Sr. Hepaminondas tem um bar no qual vende um suco muito bom. O suco é vendido em doses de 50 ml cada uma. Se o tonel de suco que ele comprou recentemente tem um volume de 28 m³ (calculando com dimensões internas), responda quantas dessas doses o Sr. Hepaminondas conseguirá vender, no máximo?	\N	3	0.2	600	0.15000001	\N	6370
7460	Um feixe de quatro paralelas determina sobre uma transversal três segmentos de 6 m, 8m e 10m. O mesmo feixe determina sobre outra transversal três segmentos de medidas x, y e z, respectivamente, tais que x + y + z = 96 m. O valor de x – y – z é:\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
7470	Os segmentos AB, CD, MN e PQ , nessa ordem, formam uma proporção. Se AB = 10 cm, CD=15 cm e PQ = 9 cm, então MN é igual a:\r\n	\N	1	0.2	600	0.15000001	\N	6370
7490	O dobro da medida de um ângulo, aumentado da medida do complemento do mesmo ângulo, é igual a 120°. Calcular a medida do ângulo.\r\n\r\n	\N	3	0.2	600	0.15000001	\N	6370
7500	Um ângulo mede 68°32´. Quanto mede cada ângulo quando traçamos a sua bissetriz?\r\n\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
7510	Na figura , r1 = 2 cm, r2 = 6 cm e A01 = 5 cm. Nessas condições, determine a distância d entre os centros 01 e 02.	Novo(a) Imagem de bitmap.JPG	1	0.2	600	0.15000001	\N	6370
11458	Um professor de Português sugeriu em uma classe a leitura dos livros Helena, de Machado de Assis e Iracema, de José de Alencar. Vinte alunos leram Helena, 15 leram só Iracema, 10 leram os dois livros e 15 não leram nenhum deles. Quantos alunos leram só Helena? 	\N	0	0.40000001	1800	0.15000001	\N	6370
12167	Um poste de 5 m de altura dista 24 m de um prédio, conforme mostra a figura. Desejando-se calcular a altura do prédio, observou-se que o poste projetava no solo uma sombra de 8 m de comprimento. Calcule a altura do prédio. 	facil13.JPG	1	0.2	600	0.15000001	\N	6370
4585	O resultado da soma: 727 + 1300 + 2450 + 523 = ____\r\n\r\n	\N	2	0.40000001	240	0.15000001	\N	4212
11250	Determine o termo x da seqüência: 1, 4, 9, 16, x	\N	0	0.2	600	0.15000001	\N	6370
4591	Complete:\r\n525 + 138 = _____ + 636 = _____ + 138 = _____\r\n\r\n	\N	3	0.60000002	240	0.15000001	\N	4212
4597	Complete:\r\n136 + 826 = ____ + 935 = ____ + 129 = _____\r\n	\N	0	0.60000002	240	0.15000001	\N	4212
4687	Qual o número que possui: 3 centenas mais 8 dezenas mais 5 unidades.\r\n	\N	2	0.2	180	0.15000001	\N	4212
4697	Qual o número que possui: 6 dezenas e 7 unidades\r\n	\N	0	0.2	120	0.15000001	\N	4212
4703	6000 + 400 + 70 + 3, é a decomposição de qual número?\r\n	\N	3	0.2	120	0.15000001	\N	4212
4709	Escreva no sistema de numeração decimal:Cinco mil e oito\r\n	\N	0	0.2	120	0.15000001	\N	4212
7711	 Na figura tem-se o losango ABCD, com A(1;1) e C(4;4), e cuja diagonal   forma ângulo de medida 60° com o lado AB. O perímetro desse losango é:	imagem  7.GIF	2	0.40000001	1800	0.15000001	\N	6370
4727	A decomposição do número 2309 é:\r\n	\N	1	0.2	120	0.15000001	\N	4212
4733	Qual o número que possui: 7 unidades de milhar + 3 unidades\r\n	\N	0	0.2	180	0.15000001	\N	4212
4739	Qual o maior número formado por dois algarismos?\r\n\r\n	\N	2	0.2	180	0.15000001	\N	4212
4745	No número 14768, o algarismo que representa a ordem das unidades de milhar é:\r\n	\N	1	0.2	180	0.15000001	\N	4212
4751	Com os algarismos 6, 1, 8 e 2, escreva o menor número, sem repetir nenhum algarismo:\r\n	\N	3	0.30000001	180	0.15000001	\N	4212
4757	Com os algarismos 6, 1, 8 e 2, escreva o maior número, sem repetir nenhum algarismo:\r\n	\N	0	0.30000001	180	0.15000001	\N	4212
4763	Qual é o menor número formado por dois algarismos iguais.	\N	2	0.30000001	180	0.15000001	\N	4212
11474	Um professor de Português sugeriu em uma classe a leitura dos livros Helena, de Machado de Assis e Iracema, de José de Alencar. Vinte alunos leram Helena, 15 leram só Iracema, 10 leram os dois livros e 15 não leram nenhum deles. Quantos alunos leram Iracema? 	\N	1	0.40000001	1800	0.15000001	\N	6370
13277	¿Qué parte del CCD se encarga de la sincronización y generación de reloj?	\N	1	0.60000002	30	0.40000001	\N	6272
13285	¿Dónde se ubica la ganancia electrónica del CCD?	\N	0	0.89999998	60	0.30000001	\N	6272
13282	¿Qué mide el pozo de potencial?	\N	0	0.60000002	20	0.30000001	\N	6272
4769	A quantidade de algarismos usado para escrever o número “quarenta mil e três” é:\r\n	\N	0	0.30000001	180	0.15000001	\N	4212
4775	Dado o número 3658, podemos afirmar que:\r\n\r\n 	\N	1	0.30000001	180	0.15000001	\N	4212
4781	Qual é o número?  4 unidades de milhar, 4 dezenas e 7 centenas.\r\n\r\n	\N	3	0.30000001	180	0.15000001	\N	4212
4787	Qual o número cuja forma decomposta é: 2 + 2000 + 200 + 20000\r\n	\N	1	0.30000001	180	0.15000001	\N	4212
4793	Qual o maior número formado por dois algarismos diferentes?\r\n \r\n	\N	3	0.30000001	180	0.15000001	\N	4212
4799	Qual o maior número formado por três algarismos diferentes?	\N	0	0.30000001	180	0.15000001	\N	4212
4805	No número 4752, qual algarismo representa a ordem das centenas?\r\n	\N	1	0.30000001	120	0.15000001	\N	4212
4811	Num número, o algarismo das unidades é 8 e o das dezenas é 5. Colocando o algarismo 6 à esquerda, obtemos um novo número, que é: \r\n	\N	0	0.40000001	180	0.15000001	\N	4212
4823	No sistema decimal, qual o menor número formado por três algarismos diferentes?\r\n	\N	0	0.40000001	180	0.15000001	\N	4212
4829	As informações a seguir representam um número, organize-as na forma de algarismos com: 8 dezenas + 5 unidades de milhar + 6 centenas + 3 unidades + 1 dezena de milhar.	\N	0	0.40000001	240	0.15000001	\N	4212
4835	Na subtração 761 – 254 = 507, o termo que representa o minuendo é:\r\n\r\n\r\n	\N	2	0.2	180	0.15000001	\N	4212
4841	Se o minuendo é 600 e o subtraendo 199, a diferença é:\r\n	\N	2	0.2	180	0.15000001	\N	4212
4847	Se o minuendo é oitocentos e quarenta e cinco e o subtraendo é duzentos e noventa e seis, então a diferença é o número:\r\n\r\n	\N	0	0.2	240	0.15000001	\N	4212
4853	O resultado de 7521 – 4627 é:	\N	3	0.2	240	0.15000001	\N	4212
4865	O segredo da seqüência é que devemos diminuir 8 para determinar o próximo número. Quais são os próximos 3 números dessa seqüência?  57, ___, ___, ___\r\n	\N	1	0.2	240	0.15000001	\N	4212
4871	Determine o próximo número da seqüência:150, 130, 110, 90, ___\r\n	\N	3	0.2	180	0.15000001	\N	4212
4883	Com os números seguintes, podemos fazer algumas subtrações: 88, 73, 15, 9, 24\r\nQuais estão corretas?\r\n	\N	2	0.2	240	0.15000001	\N	4212
4889	Qual o número que está faltando? \r\n1 + 5 + 11 + 23 + 42 + ___ = 100\r\n	\N	1	0.2	240	0.15000001	\N	4212
4895	Determine o resultado: 51 – 18 =	\N	0	0.2	180	0.15000001	\N	4212
4900	Determine o próximo número da seqüência:\r\n\r\n128, 125, 122, 119, 116, ____\r\n	\N	3	0.30000001	180	0.15000001	\N	4212
4906	Complete: ____ + 406 = 737\r\n\r\n	\N	1	0.30000001	240	0.15000001	\N	4212
4912	Complete: 199 - ____ = 66\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
4918	Com os algarismos 9, 7, 3 e 1, obtenha uma subtração com resultado 54=> _ _  -  _ _ = 54\r\n	\N	0	0.30000001	240	0.15000001	\N	4212
4924	A diferença entre o antecessor de 50 e o sucessor de 18:	\N	1	0.30000001	240	0.15000001	\N	4212
4930	Todos os números abaixo podem ser agrupados em pares que, se subtraídos apresentam o mesmo resultado. Quais são esses pares? \r\n 22; 19; 18; 15; 13; 9\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
4940	Qual a diferença entre 45 e 29?	\N	0	0.30000001	180	0.15000001	\N	4212
4946	Qual a diferença entre 528 e 342?	\N	1	0.30000001	180	0.15000001	\N	4212
4952	Complete:\r\n175 – 94 = ____ - 24 = ____ - 36 = _____ - 21 = 0\r\n	\N	3	0.30000001	240	0.15000001	\N	4212
4958	Complete: \r\n234 - ____ = 111\r\n	\N	2	0.30000001	180	0.15000001	\N	4212
4964	Com os algarismos 9, 8, 7, 4 e 1, obtenha uma subtração com o resultado 115=> _ _ _  -  _ _ = 115\r\n	\N	1	0.40000001	240	0.15000001	\N	4212
4974	Complete: 7 4 __ - 3 __ 2 = __ 7 6 \r\n                                                         \r\n	\N	1	0.40000001	240	0.15000001	\N	4212
4980	Complete:\r\n4738 – 2520 = _____ - 739 = _____ - 838 = _____\r\n	\N	0	0.40000001	240	0.15000001	\N	4212
4986	Complete:\r\n1378 – 275 = ____ - 708 = _____ \r\n	\N	3	0.40000001	240	0.15000001	\N	4212
4992	Complete:\r\n1  2  __ __  -  1   2   8 = __  __  0  6\r\n	\N	1	0.40000001	240	0.15000001	\N	4212
7912	Devido a um vírus no computador, alguns algarismos não aparecem na tela: 8 3 __ + __ __ 7 = 1 3 0 2  . As parcelas corretas são:	\N	2	0.30000001	240	0.15000001	\N	4212
4817	Qual é o número? O algarismo das unidades é 1; o algarismo das dezenas é o dobro do algarismo das unidades; o algarismo das centenas é o dobro do das dezenas; o algarismo dos milhares é o dobro do das centenas.	\N	2	0.40000001	240	0.15000001	\N	4212
7756	 Cinco dados são jogados simultaneamente. Determine a probabilidade de se obter uma quina.	\N	2	0.40000001	1800	0.15000001	\N	6370
8143	Escreva o número formado por 9 milhares mais 6 centenas mais 6 unidades:	\N	2	0.40000001	180	0.15000001	\N	4212
8149	Observe o número 5682. Se trocarmos o lugar do 6 com o do 8, o número aumenta ou diminui? Qual o novo número?	\N	3	0.40000001	180	0.15000001	\N	4212
8155	Oitenta unidades são quantas dezenas?	\N	1	0.40000001	180	0.15000001	\N	4212
8161	Escreva o número formado por 1 milhar mais 4 dezenas:	\N	0	0.40000001	180	0.15000001	\N	4212
8167	Sete centenas são quantas unidades?	\N	2	0.40000001	180	0.15000001	\N	4212
8482	A forma mais simples de escrever a seguinte soma é:\r\n728 + 728 + 728 + 728+ 728 + 728+ 728+ 728 =\r\n	\N	1	0.2	240	0.15000001	\N	4212
7738	 No jogo da sena seis números distintos são sorteados dentre os números 1, 2,..., 50. A probabilidade de que, numa extração, os seis números sorteados sejam ímpares vale aproximadamente: 	\N	1	0.40000001	1800	0.15000001	\N	6370
8173	Um milhar são quantas unidades?	\N	3	0.40000001	180	0.15000001	\N	4212
4998	Complete:\r\n949 – 149 = ____ - 456 =____ \r\n\r\n\t	\N	2	0.40000001	240	0.15000001	\N	4212
5004	Complete: 1000 – 231 = ____ - 528 = ____\r\n\r\n\t	\N	0	0.40000001	240	0.15000001	\N	4212
5010	Complete: 4623 – 1282 = ____ - 2267 = ____ \r\n\t	\N	1	0.40000001	240	0.15000001	\N	4212
5016	Complete:\r\n555 - 288 = ____ - 139 = ____\r\n	\N	1	0.40000001	240	0.15000001	\N	4212
5022	Complete:\r\n634 – 126 = ____ - 71 = ____ \r\n\t	\N	1	0.40000001	240	0.15000001	\N	4212
5028	Uma escola funciona em dois turnos. No turno da manhã há 1407 alunos e no turno da tarde, 1825 alunos. Quantos alunos estudam nessa escola?	\N	2	0.2	240	0.15000001	\N	4212
5034	A biblioteca da escola Aprender recebeu uma doação de livros. Desses livros, 53 eram de Matemática, 27 de Língua Portuguesa e os 40 livros restantes eram de História. Ao todo, quantos livros a escola recebeu?	\N	0	0.2	240	0.15000001	\N	4212
5040	Ana está juntando dinheiro. Já possui R$ 78,00 e vai guardar mais R$ 17,00. Com quanto ficará?	\N	2	0.2	240	0.15000001	\N	4212
5046	Em uma fábrica de calçados, no 1º trimestre foram produzidos 1235 calçados em janeiro, 1288 em fevereiro e 1261 em março. Quantos pares de calçado foram produzidos no trimestre?	\N	3	0.2	240	0.15000001	\N	4212
8488	Substitua o espaço pelo número conveniente: 48 . ____ = 48\r\n	\N	1	0.2	240	0.15000001	\N	4212
8494	Trinta  e nove multiplicado por oito é igual a:\r\n\r\n	\N	1	0.2	240	0.15000001	\N	4212
8500	Complete: ___ .  4 = 24\r\n\r\n	\N	0	0.2	240	0.15000001	\N	4212
8507	Complete os espaços: 6 x 4 = ___ x 3 = ___ \r\n	\N	2	0.2	240	0.15000001	\N	4212
8513	Complete: ___ . 8 = 16 . 3 = ___\r\n	\N	3	0.2	240	0.15000001	\N	4212
8519	O dobro de 1243 é:	\N	1	0.2	240	0.15000001	\N	4212
8525	O triplo de 836 é:	\N	3	0.2	240	0.15000001	\N	4212
8531	Os números que completam os espaços, são respectivamente: 3 x 3 = ___ x 3 = ___ \r\n	\N	2	0.2	240	0.15000001	\N	4212
8537	Complete: 8 x 7 = ___\r\n\r\n	\N	1	0.2	240	0.15000001	\N	4212
8543	O segredo da seqüência é que devemos multiplicar por 7 para determinar o próximo número. Quais são os próximos 3 números dessa seqüência?\r\n\t4, ___, ___, ___\r\n\r\n	\N	0	0.30000001	240	0.15000001	\N	4212
8549	Os números que completam os espaços, são respectivamente: 6 x 5 = ___ x 12 = ___ \r\n\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
8555	Complete a seqüência, sabendo que para determinar o próximo número é preciso multiplicar o resultado por 5: 2, ___, ___, ___\r\n	\N	0	0.30000001	240	0.15000001	\N	4212
8561	Qual o resultado de 25 x 13 ?	\N	2	0.30000001	240	0.15000001	\N	4212
8567	O quíntuplo de 135 é:	\N	1	0.30000001	240	0.15000001	\N	4212
8573	Qual o resultado de 25 x 1 x 8?	\N	2	0.30000001	240	0.15000001	\N	4212
8579	Qual o resultado de 18 x 15?	\N	3	0.30000001	240	0.15000001	\N	4212
8585	Qual o resultado de 64 x 3 = ____ x 4 = ____	\N	0	0.30000001	240	0.15000001	\N	4212
8591	Complete os espaços: 75 x 2 = ____ x 4 = ____ \r\n\r\n	\N	1	0.30000001	240	0.15000001	\N	4212
8597	O quádruplo de 300 é:	\N	0	0.30000001	240	0.15000001	\N	4212
7774	 Uma ampulheta é formada por dois cones idênticos. Inicialmente, o cone superior está cheio de areia e o cone inferior está vazio. A areia flui do cone superior para o inferior com vazão constante. O cone superior se esvazia em exatamente uma hora e meia. Quanto tempo demora até que a altura da areia no cone inferior seja metade da altura da areia no cone superior?	\N	2	0.40000001	1800	0.15000001	\N	6370
7761	 A tabela 1 mostra o estoque das mercadorias $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>1</mn> </mrow> </msub></math>##$ ,$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>2</mn> </mrow> </msub></math>##$  , $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msub> <mrow><mi>M</mi> </mrow> <mrow> <mn>3</mn> </mrow> </msub></math>##$  e   nas lojas A e B no dia 20; a tabela 2 mostra as vendas dessas mercadorias no dia 21. Qual o estoque restante dessas mercadorias em cada loja?	imagem 8.GIF	0	0.40000001	1800	0.15000001	\N	6370
7729	 Ao lançar um dado muitas vezes, uma pessoa percebeu que a face 6 saía com o dobro de freqüência da face 1, e que as outras faces saíam com a freqüência esperada em um dado não viciado. Qual a freqüência da face 1? 	\N	2	0.40000001	1800	0.15000001	\N	6370
8673	Complete=> ___ : 5 = 5\r\n	\N	1	0.2	240	0.15000001	\N	4212
8609	Complete: 23 x 77 = ____ \r\n	\N	3	0.40000001	240	0.15000001	\N	4212
8621	Qual o resultado de 730 x 15:	\N	0	0.40000001	240	0.15000001	\N	4212
8627	Qual o resultado de 62 x 34 :	\N	2	0.40000001	240	0.15000001	\N	4212
8633	Qual o resultado de 128 x 12:	\N	1	0.40000001	240	0.15000001	\N	4212
8639	Qual o resultado de 64 x 39:	\N	3	0.40000001	240	0.15000001	\N	4212
8645	Qual o resultado de 74 x 25 :	\N	0	0.40000001	240	0.15000001	\N	4212
8651	Qual o resultado de 111 x 33 :	\N	1	0.40000001	240	0.15000001	\N	4212
8657	O sêxtuplo de 654 é:	\N	3	0.40000001	240	0.15000001	\N	4212
8663	Complete=> 36 : 9 = ___\r\n	\N	0	0.2	240	0.15000001	\N	4212
8679	Complete=> 100 : 2 = ___ \r\n	\N	3	0.2	240	0.15000001	\N	4212
8685	A metade de 30 é:	\N	2	0.2	240	0.15000001	\N	4212
8691	A terça parte de 33 é:	\N	0	0.2	240	0.15000001	\N	4212
8697	Cento e vinte e oito dividido por 8 é:	\N	2	0.2	240	0.15000001	\N	4212
8703	A metade de 324 é:	\N	3	0.2	240	0.15000001	\N	4212
8709	Complete=> ___ : 2 = 8 \r\n	\N	3	0.2	240	0.15000001	\N	4212
8715	Complete=> 81 : 9 = ___\r\n	\N	1	0.2	240	0.15000001	\N	4212
8721	Complete=> ___ : 5 = 10 \r\n	\N	1	0.2	240	0.15000001	\N	4212
8733	Complete => 144 : 12 = ___ \r\n	\N	1	0.30000001	240	0.15000001	\N	4212
8739	Complete=> 325 : 25 = ___\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
8745	A quarta parte de 496 é:	\N	1	0.30000001	240	0.15000001	\N	4212
8751	Complete=> 104 : 8 = ___\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
8757	Complete=> 162 : 9 = ___\r\n	\N	0	0.30000001	240	0.15000001	\N	4212
8763	Complete=> 189 : 7 = ___\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
8769	Complete=> 288 : 8 = ___\r\n	\N	3	0.30000001	240	0.15000001	\N	4212
8775	Complete=> 270 : 6 = ___\r\n	\N	2	0.30000001	240	0.15000001	\N	4212
8781	Complete=> 200 : 10 = ___\r\n	\N	0	0.30000001	240	0.15000001	\N	4212
8787	Numa divisão, o dividendo é 575 e o divisor é 25. Quais são o quociente e o resto?	\N	0	0.40000001	240	0.15000001	\N	4212
8793	Numa divisão, o divisor é 24, o quociente é 5 e o resto é 1. Qual é o dividendo?\r\n\r\n	\N	1	0.40000001	240	0.15000001	\N	4212
8799	Qual o resto da divisão 120 : 7 ?	\N	2	0.40000001	240	0.15000001	\N	4212
8805	Complete=> 1050 : 15 = ___\r\n	\N	0	0.40000001	240	0.15000001	\N	4212
8811	A divisão entre o antecessor de 326 e o sucessor de 12 é:	\N	3	0.40000001	240	0.15000001	\N	4212
8817	Complete=> 585 : 39 = ___\r\n\r\n	\N	2	0.40000001	240	0.15000001	\N	4212
8823	Complete=> 756 : 21 = ___\r\n	\N	3	0.40000001	240	0.15000001	\N	4212
8836	Complete=> 625 : 25 = ___\r\n	\N	1	0.40000001	240	0.15000001	\N	4212
8830	Complete=> 342 : 19 = ___\r\n\r\n	\N	0	0.40000001	240	0.15000001	\N	4212
8842	Complete=> 253 : 23 = ___\r\n	\N	2	0.40000001	240	0.15000001	\N	4212
8848	Marcos tem 18 anos. O pai tem o triplo da idade dele. Qual a idade do pai de Marcos?	\N	2	0.2	240	0.15000001	\N	4212
8854	Minha classe tem 5 fileiras e, em cada fileira, 9 carteiras. Quantas carteiras há na minha classe?	\N	2	0.2	240	0.15000001	\N	4212
8860	Quantos pés têm 26 galinhas?	\N	0	0.2	240	0.15000001	\N	4212
8866	Paulo tem 3 calças e 4 camisas. De quantas maneiras diferentes ele pode se vestir?	\N	1	0.2	240	0.15000001	\N	4212
8872	Cinco ônibus partem para uma excursão, cada um levando 39 passageiros. Quantas pessoas participam dessa excursão?	\N	1	0.2	240	0.15000001	\N	4212
8878	Tenho 126 laranjas. Se ensacá-las de 7 em 7, quantos sacos usarei?	\N	3	0.2	240	0.15000001	\N	4212
8884	Uma escola comprou 3 computadores iguais por  R$ 6600,00. O preço de cada computador foi de:	\N	2	0.2	240	0.15000001	\N	4212
8896	Uma estrada de 105 quilômetros vai ser asfaltada. Ela foi dividida em 7 partes iguais, cada uma sob responsabilidade de uma equipe de operários. Qual é o comprimento de cada parte?	\N	3	0.2	240	0.15000001	\N	4212
8890	Se R$ 65,00 é o preço de 13 cadernos, qual é o preço de 1 caderno?	\N	1	0.2	240	0.15000001	\N	4212
8902	Lúcia tem 2 notas de R$ 10,00 e 5 moedas de R$ 1,00. Ela quer trocar tudo por notas de R$ 5,00. Quantas notas ela vai receber?	\N	2	0.2	240	0.15000001	\N	4212
8908	1 hora tem 60 minutos. Quantos minutos têm 12 horas?	\N	0	0.30000001	240	0.15000001	\N	4212
8914	Quanto custam duas dúzias de lenços, sabendo que cada lenço custa R$ 2,00?	\N	3	0.30000001	240	0.15000001	\N	4212
8920	Um funcionário deve arrumar, em cada pavimento, 6 salas com 25 cadeiras cada. Se o prédio tem 3 pavimentos, o total de cadeiras a serem arrumadas é:	\N	2	0.30000001	240	0.15000001	\N	4212
8926	Em 3 horas, Paulinho leu 88 páginas de um livro. Mantendo esse ritmo, quantas páginas ele vai ler em 6 horas?	\N	1	0.30000001	240	0.15000001	\N	4212
8932	Ceci tem 11 notas de 100 reais e 7 notas de 50 reais. Qual o valor total?	\N	2	0.30000001	240	0.15000001	\N	4212
8938	Três centenas e meia de laranjas foram distribuídas igualmente em caixas. Em cada caixa foram colocadas 25 laranjas. Quantas caixas foram formadas?	\N	1	0.30000001	240	0.15000001	\N	4212
8944	Foram separados 15000 impressos para distribuição. Diariamente distribuem-se 600 impressos. Qual o número de dias necessários para a total distribuição dos impressos?	\N	3	0.30000001	240	0.15000001	\N	4212
8950	Lélia está guardando seus livros em caixas. Em cada caixa cabem 8 livros. Ela tem 47 livros para guardar. Quantas caixas ficarão cheia? Quantos livros sobrarão?	\N	0	0.30000001	240	0.15000001	\N	4212
8956	Denise comprou 3 camisetas de mesmo preço. Pagou com 2 notas de R$ 20,00 , 4 notas de R$ 5,00 e 6 notas de R$ 2,00. Não houve troco. Quanto custou cada camiseta?	\N	2	0.30000001	240	0.15000001	\N	4212
8962	Dona Laura vai embalar 60 bombons em caixas colocando uma dúzia de bombons em cada uma. De quantas caixas ela vai precisar?	\N	1	0.30000001	240	0.15000001	\N	4212
8968	Se um livro de Matemática custa 41 reais, quanto custarão 32 desses livros?	\N	0	0.40000001	240	0.15000001	\N	4212
8974	Um trabalhador ganha R$ 5,00 por hora. Trabalhando 8 horas por dia, quanto ele ganhará em 20 dias?	\N	2	0.40000001	240	0.15000001	\N	4212
8986	Na escola de Pedro há 8 classes de 35 alunos, 5 classes de 33 alunos e 12 classes de 30 alunos. Qual é o total de alunos nessa escola?	\N	2	0.40000001	240	0.15000001	\N	4212
9010	Para estimular a reciclagem de lixo e ao mesmo tempo incentivar a leitura, a prefeitura de uma cidade doa um livro para cada 18 kg de lixo reciclável que as escolas arrecadarem. A escola onde Sandro estuda arrecadou, ao todo, 2574 kg de lixo reciclável. Com essa quantidade de lixo, quantos livros a escola vai receber?	\N	1	0.40000001	180	0.15000001	\N	4212
8998	Deseja-se colocar 179 litros de álcool em garrafões de 5 litros cada um. Quantos garrafões são necessários? Quantos litros de álcool vão sobrar?	\N	0	0.40000001	240	0.15000001	\N	4212
9015	Para estimular a reciclagem de lixo e ao mesmo tempo incentivar a leitura, a prefeitura de uma cidade doa um livro para cada 18 kg de lixo reciclável que as escolas arrecadarem. A escola onde Sandro estuda arrecadou, ao todo, 2574 kg de lixo reciclável. Com essa quantidade de lixo, quantos livros a escola vai receber?	\N	1	0.40000001	240	0.15000001	\N	4212
9021	Jorge é proprietário de uma granja. Em 15 dias ele gastou cerca de 1320 kg de ração para alimentar suas galinhas. Quantos quilogramas de ração as galinhas dessa granja consomem em 1 dia?	\N	3	0.40000001	240	0.15000001	\N	4212
9027	Ana dividiu igualmente os bombons que tinha entre seus 5 sobrinhos e comeu os que restaram. Sabendo que ela possuía 78 bombons, quantos ela comeu?	\N	2	0.40000001	240	0.15000001	\N	4212
9033	Há num ônibus 39 pessoas sentadas e 18 pessoas em pé. Se todas elas estivessem com meias, quantas meias teriam ao todo?	\N	2	0.2	300	0.15000001	\N	4212
9039	Em um jogo de basquete, César acertou 5 arremessos de 3 pontos e 8 arremessos de 2 pontos. Nessas condições, quantos pontos ele marcou nesse jogo?	\N	1	0.2	300	0.15000001	\N	4212
9045	Se do quádruplo de 295, você subtrair 967, qual será o resultado?	\N	2	0.2	300	0.15000001	\N	4212
9051	Tenho 27 cédulas de 5 reais e 13 cédulas de 10 reais. Qual a quantia que tenho?	\N	1	0.2	300	0.15000001	\N	4212
9057	Um ônibus chegou a um ponto com 45 passageiros. Desceram 13 passageiros e subiram 8. Com quantos passageiros saiu desse ponto?	\N	1	0.2	300	0.15000001	\N	4212
9063	Lúcia, Fernanda e Renata são irmãs. Lúcia tem 15 anos e Fernanda, 9 anos a mais que Lúcia. A soma das idades das três é 45. Qual é a idade de Renata?	\N	1	0.2	300	0.15000001	\N	4212
9069	Numa adição de 3 parcelas, a primeira é 701, a segunda é 394 e a terceira é a diferença entre as duas primeiras. A soma das três parcelas é:	\N	2	0.2	300	0.15000001	\N	4212
9075	Uma pessoa deu R$ 57,00 de entrada na compra de um objeto e pagou mais 6 prestações de R$ 29,00. Quanto custou o objeto?	\N	3	0.2	300	0.15000001	\N	4212
9081	Somando o dobro de 82 com o triplo de 25, obtemos:	\N	2	0.2	300	0.15000001	\N	4212
9087	A soma de três números é 12751. O primeiro desses números é 4121 e o terceiro, 1739. Qual é o segundo número?	\N	3	0.2	300	0.2	\N	4212
9093	O álbum de figurinhas de André contém 10 folhas com espaço para 6 figurinhas, 12 folhas para 4 figurinhas e 5 folhas para 8 figurinhas. Se André já colou 40 figurinhas, quantas ainda faltam para completar o álbum?	\N	0	0.30000001	300	0.15000001	\N	4212
9099	Para uma demonstração de ginástica, o Colégio A enviou 162 alunos e o Colégio B enviou 174 alunos. Esses alunos foram, então distribuídos igualmente em 12 blocos. Quantos alunos foram colocados em cada bloco?	\N	3	0.30000001	300	0.15000001	\N	4212
9105	Vítor foi a uma papelaria e comprou 7 cadernos. Cada caderno custou doze reais. Se Vítor deu duas notas de 50 reais para pagar a despesa, qual a quantia que ele recebeu de troco?	\N	0	0.30000001	300	0.15000001	\N	4212
9111	Um teatro tem 45 filas, com 28 lugares cada uma. Quantas pessoas podem assistir a uma apresentação teatral?	\N	1	0.30000001	300	0.15000001	\N	4212
9117	Um avicultor encheu 145 bandejas com 30 ovos cada uma. Ao transportá-la, quebraram-se 19 ovos. Quantos ovos restaram?	\N	1	0.30000001	300	0.15000001	\N	4212
9123	Em uma lanchonete trabalham 2 garçons. No final de um dia de trabalho, um deles recebeu 25 reais de gorjeta e o outro recebeu 29 reais de gorjeta. Como o combinado entre eles é dividir por igual toda a gorjeta do dia, qual a quantia que cada um recebeu nesse dia?	\N	3	0.30000001	300	0.15000001	\N	4212
9129	Márcia comprou 3 camisetas pagando R$ 15,00 cada uma. Deu 2 notas de R$ 20,00 e 1 nota de R$ 10,00 para pagar. Quanto recebeu de troco?	\N	1	0.30000001	300	0.15000001	\N	4212
9135	O preço de 3 CDs é R4 42,00. Logo, o preço de 4 CDs é:	\N	2	0.30000001	300	0.15000001	\N	4212
9141	Os alunos organizaram uma festinha e cada um contribuiu com alguma coisa. Havia 6 caixas de brigadeiros, cada uma com 45 doces, e 6 caixas de branquinhos, cada uma com duas dúzias. Qual o total de doces?	\N	0	0.30000001	300	0.15000001	\N	4212
9147	Você repartiu certa quantidade de balas para 5 amigos. Cada amigo recebeu 16 balas e restaram ainda 2 balas. Quantas balas você repartiu?	\N	2	0.30000001	300	0.15000001	\N	4212
9153	Comprei 8 pratos por R$ 24,00. Quanto pagaria por três dúzias?	\N	3	0.40000001	300	0.15000001	\N	4212
9159	Uma loja anunciou a venda de um aparelho de som, com as seguintes condições: R$ 646,00 à vista ou 5 prestações de R$ 157,00. Qual a diferença entre os dois preços?	\N	0	0.40000001	300	0.15000001	\N	4212
9165	Em um estacionamento os carros ficam em disposição retangular com 12 linhas e 13 colunas. No momento em que houver 68 carros estacionados ainda haverá vagas para quantos?	\N	1	0.40000001	300	0.15000001	\N	4212
9172	Um número aumentado de 25, é igual a 157. Qual é esse número?	\N	3	0.40000001	300	0.15000001	\N	4212
9178	Juliana possui 195 fotografias e 4 álbuns. Dessas fotografias, ela colocou 75 em um álbum e distribuiu o restante igualmente entre os outros 3 álbuns. Quantas fotografias Juliana colocou em cada um desses 3 álbuns?	\N	1	0.40000001	300	0.15000001	\N	4212
9184	Jaqueline foi à papelaria e gastou R$ 57,00 na compra de 5 cadernos iguais e uma mochila. Sabendo que a mochila custou R$ 32,00, qual o preço de cada caderno?	\N	2	0.40000001	300	0.15000001	\N	4212
9190	Ontem resolvi trazer bombons para meus 35 colegas de classe. Dei 4 bombons para cada um; e comi 3 bombons. Quantos bombons eu trouxe?	\N	3	0.40000001	300	0.15000001	\N	4212
9196	Um cata-vento dá 420 voltas em 14 minutos. Quantas voltas terá dado em 1 minuto?	\N	0	0.40000001	300	0.15000001	\N	4212
9202	Um ônibus tem um banco de sete lugares e vinte e seis bancos de dois lugares. Viajam nesse ônibus 83 passageiros. Quantos passageiros estão em pé?	\N	2	0.40000001	300	0.15000001	\N	4212
9208	Um operário ganha R$ 73,00 por dia de trabalho e gasta R$ 24,00 por dia em despesas com a família. Quanto economiza em 30 dias?	\N	3	0.40000001	300	0.15000001	\N	4212
9331	Escolhe-se ao acaso três vértices distintos de um cubo. A probabilidade de que estes vértices pertençam a uma mesma face é:\r\n\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
9341	Uma caixa contém 3 bolas verdes, 4 bolas amarelas e 2 bolas pretas. Duas bolas são retiradas ao acaso e sem reposição. A probabilidade de ambas serem da mesma cor é:\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
9351	Em uma pesquisa realizada em uma Faculdade foram feitas duas perguntas aos alunos. Cento e vinte responderam "sim" a ambas; 300 responderam "sim" à primeira; 250 responderam "sim" à segunda e 200 responderam "não" a ambas. Se um aluno for escolhido ao acaso, qual é a probabilidade de ele ter respondido "não" à primeira pergunta?\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
9356	Uma urna tem 100 cartões numerados de 101 a 200. A probabilidade de se sortear um cartão dessa urna e o número nele marcado ter os três algarismos distintos entre si é de\r\n\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
9371	Considerando-se um hexágono regular e tomando-se ao acaso uma de suas diagonais, a probabilidade de que ela passe pelo centro do hexágono é de:\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
9381	Tem-se um lote de 6 peças defeituosas. Quer-se acrescentar a esse lote, b peças perfeitas de modo que, retirando, ao acaso e sem reposição, duas peças do novo lote, a probabilidade de serem ambas defeituosas seja menor que 10%. Calcule o menor valor possível de b.\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
9386	Um baralho consiste em 100 cartões numerados de 1 a 100. Retiram-se dois cartões ao acaso (sem reposição). A probabilidade de que a soma dos dois números dos cartões retirados seja igual a 100 é:\r\n	\N	0	0.40000001	1800	0.15000001	\N	6370
11262	Determine o termo x da seqüência: 1, 2,  4, 8, x	\N	3	0.2	600	0.15000001	\N	6370
11513	Numa pesquisa feita com 1000 famílias para se verificar a audiência dos programas de TV, os seguintes resultados foram encontrados: 510 famílias assistem ao programa A, 305 assistem ao programa B e 386 assistem ao programa C. Sabe-se ainda que 180 famílias assistem aos programas A e B, 60 assistem aos programas B e C, 25 assistem a A e C e 10 família assistem aos três programas. Quantas famílias assistem somente ao programa A? 	\N	1	0.40000001	1800	0.15000001	\N	6370
9396	Dois jogadores A e B vão lançar um par de dados. Eles combinam que se a soma dos números dos dados for 5, A ganha e se a soma for 8, B é quem ganha. Os dados são lançados. Sabe-se que A não ganhou. Qual a probabilidade de B ter ganho?\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
9406	Num grupo de 12 professores, somente 5 são de matemática. Escolhidos ao acaso 3 professores do grupo, a probabilidade de no máximo um deles ser de matemática é:\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
9416	Numa eleição para prefeito de uma certa cidade, concorreram somente os candidatos A e B. Em uma seção eleitoral votaram 250 eleitores. Do número total de votos dessa seção, 42% foram para o candidato A, 34% para o candidato B, 18% foram anulados e os restantes estavam em branco. Tirando-se, ao acaso, um voto dessa urna, a probabilidade de que seja um voto em branco é:\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
9426	Uma urna contém bolas numeradas de 1 a 5. Sorteia-se uma bola, verifica-se o seu número e ela é reposta na urna.\r\nNum segundo sorteio, procede-se da mesma forma que no primeiro sorteio. A probabilidade de que o número da segunda bola seja estritamente maior que o da primeira é\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
9596	Durante a semana, de 2ª a 6ª feira uma loja de CDs vendeu 125, 140, 100, 130 e 120 CDs, respectivamente. Em média, quantos CDS foram vendidos por dia? 	\N	0	0.2	600	0.15000001	\N	6370
9559	Analisando o número 5, podemos afirmar que ele é resposta do problema: \r\n	\N	0	0.2	600	0.15000001	\N	6370
9568	Analisando o número 36, podemos afirmar que ele é resposta do problema: \r\n	\N	0	0.2	600	0.15000001	\N	6370
9577	Analisando o número 7, podemos afirmar que ele é resposta do problema: 	\N	2	0.2	600	0.15000001	\N	6370
9587	Analisando os números 2 e 3, podemos afirmar que são resposta do problema: \r\n	\N	1	0.2	600	0.15000001	\N	6370
9606	Ao contar o número de ervilhas em cada uma das 27 vagens, Dimas encontrou: 3, 3, 3, 2, 4, 3, 3, 4, 3, 2, 3, 3, 4, 4, 2, 3, 3, 3, 4, 2, 4, 2, 3, 3, 3, 4, 3. Determine a moda nessa situação. 	\N	1	0.2	600	0.15000001	\N	6370
9616	Num curso de iniciação à informática, a distribuição das idades dos alunos, segundo o sexo, é dada pelo gráfico. Com base nos dados do gráfico, pode-se afirmar que:	1.JPG	3	0.2	600	0.15000001	\N	6370
9630	No gráfico, tem-se a evolução da área da vegetação nativa paulista, em quilômetros quadrados, nos períodos indicados. (Fonte: "Folha de S. Paulo", 04/10/2002). A área, no 4º período, apresenta: 	2.JPG	3	0.2	600	0.15000001	\N	6370
11497	Numa pesquisa feita com 1000 famílias para se verificar a audiência dos programas de TV, os seguintes resultados foram encontrados: 510 famílias assistem ao programa A, 305 assistem ao programa B e 386 assistem ao programa C. Sabe-se ainda que 180 famílias assistem aos programas A e B, 60 assistem aos programas B e C, 25 assistem a A e C e 10 família assistem aos três programas. Quantas famílias não assistem nem ao programa A nem ao programa B? 	\N	3	0.40000001	1800	0.15000001	\N	6370
12466	O jogo da sena consiste no sorteio de 6 números distintos, escolhidos ao acaso, entre os números 1,2,3,...,até 50. Uma aposta consiste na escolha (pelo apostador) de 6 números distintos entre os 50 possíveis, sendo premiadas aquelas que acertarem 4(quadra), 5(quina) ou todos os 6(sena) números sorteados. Um apostador, que dispõe de muito dinheiro para jogar, escolhe 20 números e faz todos os 38760 jogos possíveis de serem realizados com esses 20 números. Realizado o sorteio, ele verifica que TODOS os 6 números sorteados estão entre os 20 que ele escolheu. Além de uma aposta premiada com a sena. Quantas apostas premiadas com a quina este apostador conseguiu?\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
12478	De quantas maneiras podem ser escolhidos 3 números naturais distintos, de 1 a 30, de modo que sua soma seja par?\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
9949	 Vinte e quatro times são divididos em dois grupos de 12 times cada. Qual é a probabilidade de dois desses times ficarem no mesmo grupo? 	\N	2	0.40000001	1800	0.15000001	\N	6370
13918	 Na tabela acima(Adaptado da Revista Saneamento Ambiental. Ano XIV. n. 105. São Paulo: Signus. p. 39), têm-se dados sobre a utilização de água em Campinas no período de 1993 a 2003. \r\n \r\n\t\r\nSobre a tabela, é correto afirmar que:\r\n	r20.GIF	2	0.40000001	1800	0.15000001	\N	6370
13895	A tabela acima mostra os resultados de uma pesquisa sobre a faixa salarial dos funcionários de uma empresa que usam bicicleta para ir ao trabalho. \r\n \r\nO salário médio desses trabalhadores é\r\n\r\n	r19.GIF	3	0.40000001	1800	0.15000001	\N	6370
5052	O Departamento de Trânsito contou quantos carros passaram pela rua Beija-Flor em um dia. A contagem foi: 324 carros de manhã; 263 à tarde; 112 à noite. Quantos carros passaram pela rua, no total?	\N	2	0.2	240	0.15000001	\N	4212
5058	Um pipoqueiro vendeu 365 saquinhos de pipoca no jogo de futebol e 243 no jogo de basquete. Qual a diferença entre as vendas dos dois jogos?\r\n\r\n	\N	3	0.2	240	0.15000001	\N	4212
5064	Roger tem 7 anos e seu pai tem 34 anos. A idade da mãe de Roger é a diferença entre a idade dele e a de seu pai. Quantos anos tem a mãe de Roger?\r\n\r\n	\N	1	0.2	240	0.15000001	\N	4212
5070	Na quitanda de Dona Marta havia 1200 laranjas no início do dia e 139 laranjas no fim do dia. Quantas laranjas foram vendidas nesse dia?	\N	0	0.2	240	0.15000001	\N	4212
5076	Um caminhoneiro está percorrendo uma distância de 1500 km. Depois de ter percorrido 367 km, ele parou para descansar. Quantos quilômetros faltam para completar a viagem?	\N	3	0.2	240	0.15000001	\N	4212
5082	Uma indústria de bolas recebeu uma encomenda de 835 unidades. Como já produziu 600 unidades, quantas faltam para completar a encomenda?	\N	2	0.2	240	0.15000001	\N	4212
12490	Uma prova consta de 3 partes, cada uma com 5 questões. Cada questão, independente da parte a que pertença, vale 1 ponto, sendo o critério de correção "certo ou errado". De quantas maneiras diferentes podemos alcançar 10 pontos nessa prova, se devem ser resolvidas pelo menos 3 questões de cada parte e 10 questões no total?	\N	0	0.40000001	1800	0.15000001	\N	6370
5088	Uma empresa produziu no primeiro trimestre 6905 peças. No segundo trimestre, a mesma empresa produziu 765 peças a mais que no primeiro trimestre. Quantas peças a empresa produziu no segundo trimestre?	\N	2	0.30000001	240	0.15000001	\N	4212
5094	Ao receber o meu salário paguei R$ 178,00 de aluguel, R$ 7,00 de impostos, R$ 238,00 de gastos com alimentação e ainda me sobraram R$ 94,00. Quanto recebi de salário?	\N	0	0.30000001	240	0.15000001	\N	4212
13271	¿En qué unidad se mide la ganancia de un CCD?	\N	3	0.80000001	50	0.30000001	\N	6272
13480	Ejes de arrastre en un CCD vertical	\N	0	0.2	10	0.2	\N	6272
5100	Para a decoração da igreja, no dia do casamento de Aurélia e Francisco, foram usadas 150 rosas brancas, 6 centenas de rosas vermelhas e 280 rosas amarelas. Quantas rosas foram usadas ao todo na igreja?	\N	2	0.30000001	240	0.15000001	\N	4212
5106	Roberto nasceu em 1998. Em que ano ele fará 18 anos?	\N	0	0.30000001	240	0.15000001	\N	4212
5112	Alexandre ganhou do avô R$ 40,00 e, do pai, R$ 65,00. Comprou um relógio por R$ 84,00. Com quanto Alexandre ficou?	\N	1	0.30000001	240	0.15000001	\N	4212
5118	Numa cesta há 25 frutas. Mário come 6 frutas e dá algumas a um amigo. No final sobram 12 na cesta. Quantas frutas Mário deu a seu amigo?	\N	3	0.30000001	240	0.15000001	\N	4212
9650	As Olimpíadas são uma oportunidade para o congraçamento de um grande número de países, sem discriminação política ou racial, ainda que seus resultados possam refletir características culturais, socioeconômicas e étnicas. Em 2000, nos Jogos Olímpicos de Sydney, o total de 300 medalhas de ouro conquistadas apresentou a seguinte distribuição entre os 196 países participantes, como mostra o gráfico.Esses resultados mostram que, na distribuição das medalhas de ouro em 2000	4.JPG	1	0.2	600	0.15000001	\N	6370
10525	O dominó mais conhecido tem como maior peça o duplo 6. Neste dominó são empregadas 28 peças diferentes. Quantas peças têm o dominó cuja maior peça é o duplo 8?\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
10516	Qual o menor ângulo formado pelos ponteiros de um relógio que marca 12h e 20 minutos?\r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
15112	Qual o resultado da simplificação da expressão 3(4 – 2)+1 ?	\N	2	0.30000001	100	0.15000001	\N	40
11273	Determine o termo x da seqüência: 2, 3, 5, 7, x	\N	0	0.2	600	0.15000001	\N	6370
11284	Determine o termo x da seqüência: 1, 3, 5, 7, x	\N	2	0.2	600	0.15000001	\N	6370
11305	Determine o termo x da seqüência: 2, 4, 6, 8, x	\N	1	0.2	600	0.15000001	\N	6370
11536	Numa pesquisa feita com 1000 famílias para se verificar a audiência dos programas de TV, os seguintes resultados foram encontrados: 510 famílias assistem ao programa A, 305 assistem ao programa B e 386 assistem ao programa C. Sabe-se ainda que 180 famílias assistem aos programas A e B, 60 assistem aos programas B e C, 25 assistem a A e C e 10 família assistem aos três programas. Quantas famílias não assistem a nenhum desses programas? 	\N	2	0.40000001	1800	0.15000001	\N	6370
12319	Os alunos de uma escola participaram de uma excursão, para a qual dois ônibus foram contratados. Quando os ônibus chegaram, 57 alunos entraram no primeiro ônibus e apenas 31 no segundo. Quantos alunos devem passar do primeiro para o segundo ônibus para que a mesma quantidade de alunos seja transportada nos dois ônibus?  \r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
12327	Uma professora tem 237 balas para dar a seus 31 alunos. Qual é o número mínimo de balas a mais que ela precisa conseguir para que todos os alunos recebam a mesma quantidade de balas, sem sobrar nenhuma para ela? \r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
12342	Dezoito quadrados iguais são construídos e sombreados como mostra a figura. Qual fração da área total é sombreada?\r\n	a1.JPG	1	0.30000001	1200	0.15000001	\N	6370
13635	 Um negociante trabalha com as mercadorias A, B, e C de cada uma das quais tem um pequeno estoque não nulo. Se vender cada unidade de A por R$ 2,00, cada uma de B por R$ 3,00 e cada uma de C por R$ 4,00, obtém uma receita de R$ 50,00. Mas se vender cada unidade respectivamente por R$ 2,00, R$ 6,00 e R$ 3,00, a receita será de R$ 60,00. Calcular o número total de unidades que possui. \r\n\r\n\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
11556	Uma prova com duas questões foi dada a uma classe de quarenta alunos. Dez alunos acertaram as duas questões, 25 acertaram a primeira questão e 20 acertaram a segunda questão. Quantos alunos erraram as duas questões?	\N	0	0.40000001	1800	0.15000001	\N	6370
5124	Um cinema tem 420 lugares. Antes da primeira sessão começar, já entraram 285 pessoas e, do lado de fora, há uma fila com 315 pessoas. Quando o cinema lotar, quantas pessoas deverão esperar pela próxima sessão?	\N	0	0.30000001	240	0.15000001	\N	4212
10595	Para medir a área de uma fazenda de forma triangular, um agrimensor, utilizando um sistema de localização por satélite, encontrou como vértices desse triângulo os pontos A(2,1), B(3,5) e C(7,4) do plano cartesiano, com as medidas em km. Determine a área dessa fazenda, em km². \r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
5130	Anderson tinha 112 miniaturas de carros e seu pai deu mais algumas. Agora ele tem 160 miniaturas. Quantas seu pai lhe deu?	\N	2	0.30000001	240	0.15000001	\N	4212
10549	Um pacote de folhas de papel, retangulares e iguais tem massa de 1,5 kg. Considere um segundo pacote, de mesma espessura e qualidade do papel, só que com a metade do número de folhas, sendo estas com o dobro do comprimento e o triplo da largura. Qual a  massa deste segundo pacote, em quilogramas?\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
10541	Os vértices do triângulo PRF da figura representam, respectivamente, uma papelaria, uma relojoaria e uma farmácia, estando às distâncias representadas em metro. Qual a distância entre a papelaria e a farmácia, em km?\r\n	imagem2.JPG	1	0.30000001	1200	0.15000001	\N	6370
10563	Um fazendeiro plantou 4500 árvores em sua propriedade no período de 12 meses. A plantação foi feita mês a mês. No primeiro mês foram plantadas x árvores, no mês seguinte (x + r) árvores, r > 0, e assim sucessivamente, sempre plantando no mês seguinte r árvores a mais do que no mês anterior. Sabendo-se que ao término do nono mês do início do plantio ainda restavam 1800 árvores para serem plantadas, o número de árvores plantadas no primeiro mês foi:\r\n	\N	2	0.30000001	1200	0.15000001	\N	6370
10556	O gráfico representa o consumo mensal de água em uma determinada residência no período de um ano. \r\nAssim, por exemplo, o gasto no mês de março, que corresponde ao consumo de 34 m3, em reais, é:\r\n10×0,50 + 10×1,00 + 10×1,50 + 4×2,00 = 38,00.\r\nVamos supor que essas tarifas tenham se mantido no ano todo. Note que nos meses de janeiro e fevereiro, juntos, foram consumidos 56 m3 de água e para pagar essas duas contas foram gastos X reais. O mesmo consumo ocorreu nos meses de julho e agosto, juntos, mas para pagar essas duas contas foram gastos Y reais. Determine a diferença   X – Y.\r\n	imagem3.JPG	1	0.30000001	1200	0.15000001	\N	6370
10570	Um boato tem um público-alvo e alastra-se com determinada rapidez. Em geral, essa rapidez é diretamente proporcional ao número de pessoas desse público que conhecem o boato e diretamente proporcional também ao número de pessoas que não o conhecem. Em outras palavras, sendo R a rapidez de propagação, P o público-alvo e x o número de pessoas que conhecem o boato, tem-se: R(x) = k.x.(P-x), onde k é uma constante positiva característica do boato.\r\nA melhor representação gráfica para esta função é a de uma:\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
15415	602	img2_6.GIF	3	0.40000001	180	0.15000001	\N	40
10578	Suponha que o preço de um automóvel tenha uma desvalorização média de 19% ao ano sobre o preço do ano anterior. Se F representa o preço inicial (preço de fábrica) e p (t), o preço após t anos. Qual será o tempo mínimo necessário, em número inteiro de anos, após a saída da fábrica, para que um automóvel venha a valer menos que 5% do valor inicial?\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
10587	Neste plano cartesiano, estão representados o gráfico da função y = log  x e o retângulo  ABCD, cujos lados são paralelos aos eixos coordenados.\r\nSabe-se que:\r\n- os pontos B e D pertencem ao gráfico da função y = log  x ; \r\n- as abscissas dos pontos A e B são, respectivamente, 1/4 e 8.\r\nEntão, é CORRETO afirmar que a área do retângulo ABCD  é:\r\n	imagem4.JPG	0	0.30000001	1200	0.15000001	\N	6370
15403	601	img1_6.GIF	2	0.40000001	160	0.15000001	\N	40
10613	Por ocasião do Natal, uma empresa gratificará seus funcionários com certo número de cédulas de R$ 50,00. Se cada funcionário receber 8 cédulas, sobrarão 45 delas; se cada um receber 11 cédulas, faltarão 27. O montante a ser distribuído é:\r\n	\N	2	0.30000001	1200	0.15000001	\N	6370
10622	Um navegador devia viajar durante duas horas, no rumo nordeste, para chegar a certa ilha. Enganou-se, e navegou duas horas no rumo norte. Tomando, a partir daí, o rumo correto, em quanto tempo, aproximadamente, chegará à ilha?\r\n	\N	2	0.30000001	1200	0.15000001	\N	6370
10630	Deseja-se medir a distância entre duas cidades B e C sobre um mapa, sem escala. Sabe-se que AB = 80 km e AC = 120 km, onde A é uma cidade conhecida, como mostra a figura. Logo, a distância entre B e C, em km, é:\r\n	imagem5.JPG	2	0.30000001	1200	0.15000001	\N	6370
11569	Feita uma pesquisa em uma escola com 300 alunos, concluíram que 90 alunos só estudam Português, 75 estudam Português e Matemática, 50 estudam História, 10 estudam as três, 12 estudam Matemática e História, 18 estudam Português e História e 100 alunos estudam Matemática. Pergunta-se: Quantos estudam uma única disciplina? 	\N	2	0.40000001	1800	0.15000001	\N	6370
11582	Feita uma pesquisa em uma escola com 300 alunos, concluíram que 90 alunos só estudam Português, 75 estudam Português e Matemática, 50 estudam História, 10 estudam as três, 12 estudam Matemática e História, 18 estudam Português e História e 100 alunos estudam Matemática. Pergunta-se: Quantos não estudam nenhuma disciplina? 	\N	0	0.40000001	1800	0.15000001	\N	6370
11595	Feita uma pesquisa em uma escola com 300 alunos, concluíram que 90 alunos só estudam Português, 75 estudam Português e Matemática, 50 estudam História, 10 estudam as três, 12 estudam Matemática e História, 18 estudam Português e História e 100 alunos estudam Matemática. Pergunta-se: Quantos alunos estudam só duas disciplinas? 	\N	3	0.40000001	1800	0.15000001	\N	6370
11608	O algarismos das unidades de\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>9</mn></mrow> <mrow><mn>81</mn></mrow> </msup></math>##$\r\né:	\N	3	0.40000001	1800	0.15000001	\N	6370
11621	Se  $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi>n</mi><mo> &equals; </mo><msup> <mrow><mn>10</mn></mrow> <mrow><mn>7</mn></mrow> </msup><mo> &minus; </mo><mn>10</mn></math>##$ , então  não é múltiplo de:	\N	3	0.40000001	1800	0.15000001	\N	6370
13727	 Estas são as alturas, em centímetros, de um grupo de dez crianças: 119, 120, 121, 121, 121, 123, 124, 124, 125, 128. Qual é a mediana? \r\n\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
13741	O tempo que um ônibus gasta para ir do ponto inicial ao ponto final de uma linha varia, durante o dia, conforme as condições do trânsito, demorando mais nos horários de maior movimento. A empresa que opera essa linha forneceu, no gráfico abaixo, o tempo médio de duração da viagem conforme o horário de saída do ponto inicial, no período da manhã. \r\n \r\nDe acordo com as informações do gráfico, um passageiro que necessita chegar até as 10h30min ao ponto final dessa linha, deve tomar o ônibus no ponto inicial, no máximo, até as:\r\n	r6.GIF	0	0.30000001	1200	0.15000001	\N	6370
5136	Uma indústria já produziu 5988 peças. Para atingir 10000 peças, quantas ainda devem ser produzidas?	\N	3	0.30000001	240	0.15000001	\N	4212
5142	Laura jogou 5 rodadas de videogame e fez nas três primeiras rodadas 47 pontos em cada uma e, nas seguintes, 51 e 49 pontos. Quantos pontos faltaram para totalizar 270 pontos?	\N	1	0.30000001	240	0.15000001	\N	4212
5148	Fábio possui uma coleção de 35 lápis. Ricardo tem 17 lápis a mais que Fábio. Felipe possui o mesmo que Fábio e Ricardo juntos. Quantos lápis os três possuem juntos?	\N	0	0.40000001	240	0.15000001	\N	4212
13768	 A idade de uma árvore pode ser avaliada pela medida do diâmetro de seu tronco. A construção de diagramas indicando a distribuição em intervalos de classe para o diâmetro é uma forma de analisar a estrutura etária de uma população de árvores. O gráfico a seguir mostra a distribuição das classes de diâmetro para a espécie arbórea Xylopia aromática. \r\nConsiderando esses dados, quantas árvores possuem troncos com diâmetro não inferiores a 8 cm?\r\n\r\n	r9.GIF	3	0.30000001	1200	0.15000001	\N	6370
13713	 Um aluno realizou três trabalhos no trimestre. No primeiro sua nota foi 7,5 e no segundo 6,0. Como sua média foi 7,0, a nota do terceiro trabalho foi:  \r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
5158	Quando minha filha nasceu, eu tinha 34 anos. Hoje, minha filha faz 11 anos. Qual é a soma de nossas idades?	\N	1	0.40000001	240	0.15000001	\N	4212
5164	Tinha uma quantia, gastei R$ 147,00 e fiquei com R$ 209,00. Que quantia eu tinha?	\N	3	0.40000001	240	0.15000001	\N	4212
13777	 Considerando o universo de 61,5 milhões de brasileiras com idade igual ou superior a 15 anos, o quadro a seguir fornece dados sobre alguns tipos de violência sofridos (física, psicológica, sexual). \r\n \r\nCom base no texto e no quadro anterior, é correto afirmar:\r\n	r10.GIF	1	0.30000001	1200	0.15000001	\N	6370
13786	 A média da altura de um grupo de 5 atletas é 1,85 m. Se chegar mais um atleta de 1,97 m, a média de altura do grupo:  \r\n	\N	0	0.40000001	1800	0.15000001	\N	6370
13718	João registrou, durante dez dias, o tempo gasto em minutos para ir de sua casa à escola: 15 min, 14 min, 18 min, 15 min, 14 min, 25 min, 16 min, 15 min, 15 min e 16 min. Qual foi a moda? \r\n	\N	0	0.30000001	1800	0.15000001	\N	6370
13750	  No gráfico acima, mostra-se como variou o valor do dólar, em relação ao real, entre o final de 2001 e o início de 2005. Por exemplo, em janeiro de 2002, um dólar valia cerca de R$2,40. \r\n \r\nDurante esse período, a época em que o real esteve mais desvalorizado em relação ao dólar foi no:\r\n	r7.GIF	1	0.30000001	1200	0.15000001	\N	6370
13759	A escolaridade dos jogadores de futebol nos grandes centros é maior do que se imagina, como mostra a pesquisa abaixo, realizada com os jogadores profissionais dos quatro principais clubes de futebol do Rio de Janeiro. \r\n \r\nDe acordo com esses dados, o percentual dos jogadores dos quatro clubes que concluíram o Ensino Médio é de aproximadamente:\r\n\r\n	r8.GIF	3	0.30000001	1200	0.15000001	\N	6370
13791	Os pontos de 0 a 100 obtidos por 21 alunos em um teste foram: 71, 40, 86, 55, 63, 70, 44, 90, 37, 68, 53, 55, 57, 60, 82, 91, 62, 72, 56, 42, 36. Determine a mediana desses valores: \r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
5170	Se um sapateiro fizer 250 pares de sapato, ainda ficam faltando 182 pares para atender uma encomenda de 750 pares de sapato. Quantos pares de sapatos já estavam prontos?	\N	0	0.40000001	240	0.15000001	\N	4212
5180	Pensei em um número, somei 25 a ele e obtive 81. Em que número pensei?\r\n\r\n	\N	1	0.40000001	240	0.15000001	\N	4212
5186	Qual é o número que adicionado a 289 tem como resultado 836?\r\n\r\n	\N	3	0.40000001	240	0.15000001	\N	4212
6451	Uma folha quadrada foi cortada em 42 quadrados menores, dos quais um tem área maior do que 1 cm2  e os demais têm área de 1 cm2. Qual é a medida do lado da folha? 	\N	2	0.2	600	0.15000001	\N	6370
13832	 O número de atletas nas Olimpíadas vem aumentando nos últimos anos, como mostra o gráfico. Mais de 10.000 atletas participaram dos Jogos Olímpicos de Sydney, em 2000. \r\n \r\nNas últimas cinco Olimpíadas, esse aumento ocorreu devido ao crescimento da participação de:\r\n	r14.GIF	3	0.40000001	1800	0.15000001	\N	6370
13863	João e Antônio utilizam a mesma linha de ônibus para ir trabalhar, no período considerado no gráfico, nas seguintes condições: \r\n \r\n- trabalham vinte dias por mês:\r\n- João viaja sempre no horário em que o ônibus faz o trajeto no menor tempo;\r\n- Antônio viaja sempre no horário em que o ônibus faz o trajeto no maior tempo;\r\n- na volta do trabalho, ambos fazem o trajeto no mesmo tempo de percurso.\r\nConsiderando-se a diferença de tempo de percurso, Antônio gasta, por mês, em média,\r\n\r\n	r17.GIF	2	0.40000001	1800	0.15000001	\N	6370
6516	Eu planejava fazer um curral quadrado, com uma certa área, usando uma certa quantidade de cerca de arame farpado.  Descobri, porém, que tenho 10% a menos de cerca do que esperava. Por esta razão, a área cercada será:	\N	2	0.2	600	0.15000001	\N	6370
13881	Acidentes custam R$ 5,3 bilhões por ano. Os custos totais dos acidentes de trânsito nas áreas urbanas do país somam R$ 5,3 bilhões por ano. Só o afastamento temporário ou definitivo do trabalho - a perda de produção - significa 42,8% desse total. Os custos com os veículos representam 28,8%, e o atendimento médico-hospitalar e a reabilitação, 14,5%. \r\n \r\n\tFonte: "Folha de São Paulo", 1Ž. 06.03, p. C1 (adaptado).\r\n\r\nDe acordo com os dados do gráfico por setores, o custo relativo à perda de produção devido a acidentes de trânsito, nas áreas urbanas do país, em bilhões de reais, foi, aproximadamente:\r\n	r18.GIF	0	0.40000001	1800	0.15000001	\N	6370
5192	Pensei em um número. Subtraí 463 desse número e obtive 241 como resultado. Em que número pensei?	\N	1	0.40000001	240	0.15000001	\N	4212
5198	Pedro tinha 567 selos. Deu 45 para Carla, 39 para Beto e 27 para Bia. Com quantos selos ele ficou?	\N	2	0.40000001	240	0.15000001	\N	4212
5204	Em 1986, Roberto tinha 14 anos. Em que ano Roberto nasceu?\r\n\r\n	\N	3	0.40000001	240	0.15000001	\N	4212
5210	Dom Pedro II, imperador do Brasil, que morreu em 1891, com 66 anos de idade, começou a reinar quando fez 15 anos. Em que ano começou a reinar?\r\n\r\n	\N	0	0.40000001	240	0.15000001	\N	4212
13809	O índice de confiabilidade na economia é um número entre 0 e 100 que mede a confiança dos empresários na economia brasileira. Os gráficos acima ilustram os valores destes índices para grandes e para médios empresários, de outubro de 2002 a outubro de 2003, em dados trimestrais. \r\n \r\nAnalise a veracidade das afirmações seguintes, acerca dos índices de confiabilidade na economia brasileira dos grandes e médios empresários, representados no gráfico acima. O crescimento e decrescimento citados nas afirmações são relativos ao trimestre anterior.\r\nI. O índice dos médios empresários sempre cresceu, de jan/2003 a out/2003.\r\nII. Quando o índice dos médios empresários cresceu, o mesmo ocorreu com o índice dos grandes empresários.\r\nIII. Quando o índice dos grandes empresários decresceu, o índice dos médios empresários cresceu.\r\nIV. O índice dos grandes empresários sempre foi superior ao índice dos médios empresários.\r\nV. Em outubro, o crescimento percentual do índice dos grandes empresários foi igual ao dos médios empresários.\r\n\r\nMarque a alternativa correta.\r\n	r12.GIF	2	0.40000001	1800	0.15000001	\N	6370
13818	 Este gráfico representa o resultado de uma pesquisa realizada com 1 000 famílias com filhos em idade escolar: \r\n \r\nConsidere estas afirmativas referentes às famílias pesquisadas:\r\nI) O pai participa da renda familiar em menos de 850 dessas famílias.\r\nII) O pai e a mãe participam, juntos, da renda familiar em mais de 500 dessas famílias.\r\nEntão, é CORRETO afirmar que:\r\n	r13.GIF	2	0.40000001	1800	0.15000001	\N	6370
13841	 Segundo a Organização das Nações Unidas (ONU), o mundo não conseguirá atingir a meta de reduzir a fome pela metade em 2015. Nem mesmo em 2030 esse objetivo poderá ser alcançado.  O gráfico a seguir mostra o número, em milhões, de pessoas com fome em cinco regiões do mundo, em diferentes anos (1992, 1999, 2015 e 2030), segundo dados e estimativas da ONU. \r\n\r\n \r\nCom base nos dados fornecidos pelo gráfico, pode-se afirmar que:\r\n	r15.GIF	2	0.40000001	1800	0.15000001	\N	6370
13854	 A tabela acima apresenta o levantamento das quantidades de peças defeituosas para cada lote de 100 unidades fabricadas em uma linha de produção de autopeças, durante um período de 30 dias úteis. \r\n\r\n \r\nConsiderando S a série numérica de distribuição de freqüências de peças defeituosas por lote de 100 unidades, julgue os itens abaixo.\r\n(1) A moda da série S é 5.\r\n(2) Durante o período de levantamento desses dados, o percentual de peças defeituosas ficou, em média, abaixo de 3,7%.\r\n(3) Os dados obtidos nos 10 primeiros dias do levantamento geram uma série numérica de distribuição de freqüências com a mesma mediana da série S.\r\n\r\n	r16.GIF	0	0.40000001	1800	0.15000001	\N	6370
14030	 Dois rapazes e duas moças ocupam ao acaso os quatro lugares de um banco. A probabilidade de não ficarem lado a lado duas pessoas do mesmo sexo é:\r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
14035	 Dois dados não viciados são lançados. A probabilidade de obter-se a soma de seus pontos maior ou igual a 5 é\r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
6600	Fabrício é um menino que gosta muito de matemática. Quando perguntaram a ele que idade tinha, ele deu a seguinte resposta: eu tenho dois irmãos, as nossas idades são números primos e o produto de nossas idades é 2717. Sabendo que sou o mais novo dos três, tenho...\r\n\r\n\r\n	\N	2	0.2	600	0.15000001	\N	6370
13995	 Uma urna contém 4 bolas brancas e 5 bolas pretas. Duas bolas, escolhidas ao acaso, são sacadas dessa urna, sucessivamente e sem reposição. A probabilidade de que ambas sejam brancas vale:\r\n\r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
14000	 Considere todos os números de cinco algarismos distintos obtidos pela permutação dos algarismos 4, 5, 6, 7 e 8. Escolhendo-se um desses números, ao acaso, a probabilidade dele ser um número ímpar é\r\n	\N	2	0.30000001	1200	0.15000001	\N	6370
14015	 O número de fichas de certa urna é igual ao número de anagramas da palavra VESTIBULAR. Se em cada ficha escrevermos apenas um dos anagramas, a probabilidade de sortearmos uma ficha dessa urna e no anagrama marcado as vogais estarem juntas é\r\n\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
14020	Num baralho comum, de 52 cartas, existem quatro cartas "oito". Retirando-se duas cartas desse baralho, sem reposição, qual a probabilidade de se obter um par de "oitos"?\r\n\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
14040	 A probabilidade de um casal ter um filho do sexo masculino é 0,25. Então a probabilidade do casal ter dois filhos de sexos diferentes é:\r\n\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
14045	 Numa urna foram colocadas 30 bolas: 10 bolas azuis numeradas de 1 a 10, 15 bolas brancas numeradas de 1 a 15 e 5 bolas cinzas numeradas de 1 a 5. Ao retirar-se aleatoriamente uma bola, a probabilidade de obter-se uma bola par ou branca é:\r\n	\N	3	0.30000001	1800	0.15000001	\N	6370
14053	 Numa caixa A, temos um dado preto e outro branco e, numa caixa B, dois dados brancos e um preto. Escolhida ao acaso uma caixa, se retirarmos dela, também ao acaso, um dado, então a probabilidade de termos um dado branco com o número 2 é:\r\n\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
14058	 Um prisma quadrangular regular maciço é construído todo de chumbo. Sabendo que a densidade do chumbo é de 11,3 g/ml e que a aresta da base mede 6 cm e a altura 8 cm, determine a quantidade de massa existente nesse prisma.\r\n	\N	0	0.30000001	1800	0.15000001	\N	6370
14063	O volume do sólido gerado pela revolução do triângulo da figura em torno do  eixo L é:\r\n\r\n	r23.GIF	1	0.40000001	1800	0.15000001	\N	6370
6585	Meu irmão tem 70 figurinhas. Eu tenho menos que ele. Arrumando as minhas figurinhas em montinhos de 12 ou em montinhos de 15, não sobra nenhuma. Quantas figurinhas eu tenho?\r\n\r\n\r\n	\N	1	0.2	600	0.15000001	\N	6370
6679	Dois quadrados, cada um com área 25cm2, são colocados lado a lado para formar um retângulo. Qual é o perímetro do retângulo? 	\N	0	0.2	600	0.15000001	\N	6370
6689	Os resultados de uma pesquisa das cores de cabelo de 1200 pessoas são:30% possuem cabelo castanho, 24% possuem cabelo preto, 16 % possuem cabelo ruivo e o restante possuem cabelo loiro.\r\nQuantas dessas pessoas possuem o cabelo loiro? 	\N	2	0.2	600	0.15000001	\N	6370
13930	 Dois estados produzem trigo e soja. Os gráficos acima representam a produção relativa de grãos de cada um desses estados. \r\nA produção de soja do estado A corresponde a que porcentagem da produção de grãos do estado?\r\n	r21.GIF	3	0.40000001	1800	0.15000001	\N	6370
13943	 Dois estados produzem trigo e soja. Os gráficos acima representam a produção relativa de grãos de cada um desses estados. \r\n \r\nA produção de trigo do estado B corresponde a que porcentagem da produção de grãos do estado?\r\n\r\n	r22.GIF	1	0.40000001	1800	0.15000001	\N	6370
13965	Em um concurso de televisão, apresentam-se ao participante três fichas voltadas para baixo, estando representadas em cada uma delas as letras T, V e E. As fichas encontram-se alinhadas em uma ordem qualquer. O participante deve ordenar as fichas a seu gosto, mantendo as letras voltadas para baixo, tentando obter a sigla TVE. Ao desvirá-las, para cada letra que esteja na posição correta ganhará um prêmio de R$200,00.\r\nA probabilidade de o PARTICIPANTE não ganhar qualquer prêmio é igual a:\r\n	\N	1	0.30000001	1200	0.15000001	\N	6370
13970	 Uma urna contém três bolas pretas e cinco bolas brancas. Quantas bolas azuis devem ser colocadas nessa urna de modo que, retirando-se uma bola ao acaso, a probabilidade de ela ser azul seja igual a 2/3?\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
13985	 Tomando-se, ao acaso, uma das retas determinadas pelos vértices de um pentágono regular, a probabilidade de que a reta tomada ligue dois vértices consecutivos é:\r\n\r\n	\N	0	0.30000001	1200	0.15000001	\N	6370
14025	Em um campeonato de tiro ao alvo, dois finalistas atiram num alvo com probabilidade de 60% e 70%, respectivamente, de acertar. Nessas condições, a probabilidade de ambos errarem o alvo é:\r\n\r\n	\N	3	0.30000001	1200	0.15000001	\N	6370
14123	 Tem-se um recipiente cilíndrico, de raio 3cm, com água. Se mergulharmos inteiramente uma bolinha esférica nesse recipiente, o nível da água sobe cerca de 1,2cm. Sabe-se, então, que o raio da bolinha vale aproximadamente:\r\n\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
14169	Qual algarismo a letra A representa na expressão ?	img_qt8.GIF	1	0.55000001	210	0.2	\N	40
14364	O recorde de João Carlos Oliveira, o João do Pulo, durou quase dez anos. Ele só foi quebrado no dia 16 de junho de 1985 pelo americano Willie Banks, em Indiana, EUA. Para descobrir a distância do salto triplo de Willie Banks você deve resolver a multiplicação abaixo. Nela, cada letra representa um algarismo. Encontre o algarismo que cada letra representa, sabendo que:\r\n·Letras iguais representam o mesmo algarismo;\r\n·Os algarismos que formam os números envolvidos nessa multiplicação são 0, 1, 5, 7, 8 e 9;\r\n·A letra C representa um algarismo par.\r\n	img_qt11.GIF	2	0.55000001	270	0.2	\N	40
14765	Para calcularmos a área de um retângulo podemos usar a fórmula  , sabendo disso Juliana resolveu verificar qual a área que o jardim da frente de sua casa ocupava. A figura abaixo apresenta as medidas obtidas por Juliana para o espaço ocupado por flores e por arbustos que ocupam um espaço de 1,5 m de largura ao longo do caminho(C) que leva a porta da casa. Determine a área do jardim.	qt14_5serie.gif	1	0.40000001	180	0.15000001	\N	40
14409	O retângulo EBCF representa um terreno com área de 252 m2. Observe a figura abaixo e calcule a área do terreno representado pelo retângulo AEFD.	img_qt12.GIF	1	0.40000001	180	0.15000001	\N	40
7280	As diagonais de um polígono unem um vértice aos demais.\r\nDê uma lei da para a função que relaciona o número de lados (n) e o número de triângulos (t) de cada figura.\r\n	poligono.JPG	2	0.30000001	1200	0.15000001	\N	6370
7305	Para embalar presentes estão sendo confeccionadas caixas com cartolinas quadradas, das quais se recortam as quinas, como se pode ver na figura . Essas caixas devem ter um volume de 2 000 cm³. Esta caixa seria adequada para acomodar 16 esferas de 2,5 cm de raio? 	caixa.JPG	1	0.30000001	1200	0.15000001	\N	6370
14432	O retângulo EBCF representa um terreno com área de 252 m2. Observe a figura abaixo e calcule o perímetro do terreno representado pelo retângulo AEFD.	img_qt12.GIF	2	0.40000001	180	0.15000001	\N	40
14745	A propriedade associativa da adição assegura que (a+b)+c=a+(b+c). A partir disso, sabendo que X = 91, Y = 368 e Z = 196, podemos afirmar que: fazendo x+(y+z) obteremos um resultado mais correto do que se fizermos (x+y)+z ?	\N	1	0.30000001	100	0.15000001	\N	40
14775	Para calcularmos o perímetro de um retângulo podemos fazer P=2c+2l , onde c é o comprimento e l a largura. César deseja cercar um terreno com tela para criar faisões. O desenho abaixo representa o terreno que ele deseja cercar. Quantos metros de tela  César deve comprar?	qt15_5serie.gif	1	0.30000001	100	0.15000001	\N	40
14785	A raiz quadrada de 9 é 3 porque 9=3x3 ; da mesma forma a raiz quadrada de 36 é 6 porque 36=6x6. Podemos então concluir que a raiz quadrada (r) de um número N é:	\N	2	0.30000001	100	0.15000001	\N	40
7592	 Depois de achar os irracionais, os gregos antigos aprenderam a lidar com o infinito. Eles sabiam, por exemplo, fazer a soma infinita da ilustração dada: 1+ 1/2+ 1/4+ 1/8+... .Onde cada novo termo é a metade do anterior e sempre haverá mais um pedacinho de queijo no rabo da soma. Os gregos sabiam quantos queijos se obtêm somando todos os nacos ao queijo inteiro. Qual é o seu palpite?	imagem.GIF	2	0.40000001	1800	0.15000001	\N	6370
14809	A fórmula A=(LxH)/2, nos permite calcular a área de um triângulo retângulo. Qual a metade da área que tem uma sala de aula que mede 8 metros de largura por 10,5 m de comprimento?	\N	3	0.55000001	210	0.2	\N	40
14797	A fórmula  CP=0,5PU+IP é bem traduzida da seguinte forma:	\N	4	0.40000001	180	0.15000001	\N	40
14095	 A superfície lateral de um cone de altura h, quando planificada, gera um semicírculo de raio 10. O valor de h é:\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
14108	 Dois recipiente cilíndricos têm altura de 40 cm e raios da base medindo 10 cm e 5 cm. O maior deles contém água até 1/5 de sua capacidade:\r\n\r\n\r\n\r\nEssa água é despejada no recipiente menor, \r\nalcançando a altura h, de:\r\n	r26.GIF	0	0.40000001	1800	0.15000001	\N	6370
14156	No quadro estão registrados os números de 2 até 100.Nesse quadro, os números 2, 3, 5, 7, 11, 13, 17, 19, ... foram contornados e todos os seus múltiplos riscados até sobrarem apenas os números com dois divisores naturais. O último a ser contornado foi 97.\r\nSe houvesse mais números nesse quadro, qual seria o próximo número contornado na seqüência?\r\n	img_qt7.GIF	0	0.55000001	180	0.2	\N	40
14753	A propriedade distributiva da multiplicação em relação à adição pode ser representada de forma geral na seguinte forma: a(b+c)=ab+ac . Portanto, o próximo passo na resolução correta da expressão 7(8+6) aplicando a propriedade distributiva é:	\N	2	0.30000001	100	0.15000001	\N	40
14103	 Um reservatório de água tem a forma de um cone circular reto, de eixo vertical e vértice para baixo. Quando o nível de água atinge a metade da altura do tanque, o volume ocupado é igual a $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow> <mi> &pi; </mi> </mrow> <mrow><mtext></mtext></mrow> </msup></math>##$. A capacidade do tanque é:\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
14819	A seqüência 4, 8, 12, 16, 20,... é composta pelos:	\N	1	0.40000001	180	0.15000001	\N	40
14829	A seqüência 3, 7, 11, 15, 19, 23, ... é composta pelos:	\N	2	0.60000002	210	0.2	\N	40
14118	 O volume de uma esfera A é 1/8 do volume de uma esfera B. Se o raio da esfera B mede 10, então o raio da esfera A mede:\r\n\r\n\r\n	\N	0	0.40000001	1800	0.15000001	\N	6370
14141	Desejamos escrever o número 115 (conforme a figura) entre dois múltiplos consecutivos do número 13. Por quais valores devemos substituir as letras A e D?	IMG_QT5.GIF	3	0.30000001	100	0.15000001	\N	40
14147	Observando a figura, podemos calcular a distância entre os pontos A e B, fazendo:	IMG_QT6.GIF	1	0.40000001	180	0.15000001	\N	40
15023	A expressão 2x+1 pode ser lida como:	\N	1	0.30000001	100	0.15000001	\N	40
14128	 Determine o volume de um cubo circunscrito a uma esfera de $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>16</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$ cm2 de superfície.\r\n	\N	0	0.40000001	1800	0.15000001	\N	6370
15002	Considere formados e dispostos em ordem crescente todos os números que se obtêm permutando os algarismos 1, 3, 5, 7 e 9. O número 75391 ocupa, nessa disposição, o lugar...\r\n	\N	2	0.40000001	1800	0.15000001	\N	6370
15015	Com os dígitos 1, 2, 3, 4, 6 e 8, podem-se formar x números ímpares, com três algarismos distintos cada um. Determine x.\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
7702	 Duas pessoas A e B decidem se encontrar em um determinado local, no período de tempo entre 0h e 1h. Para cada par ordenado (x0, y0), pertencente à região hachurada do gráfico mostrado, x0 e y0 representam, respectivamente, o instante de chegada de A e B ao local de encontro.\r\n \r\nDetermine as coordenadas dos pontos da região hachurada, os quais indicam a chegada de ambas as pessoas ao local de encontro exatamente aos 40 minutos. 	imagem  6.GIF	0	0.40000001	1800	0.15000001	\N	6370
14180	Quando dividimos potências com a mesma base é válida a seguinte propriedade:  Em qual alternativa essa propriedade foi corretamente empregada?$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><msup> <mrow><mi>c</mi></mrow> <mrow><mi>m</mi></mrow> </msup></mrow> <mrow><msup> <mrow><mi>c</mi></mrow> <mrow><mi>n</mi></mrow> </msup></mrow> </mfrac><mo> &equals; </mo><msup> <mrow><mi>c</mi></mrow> <mrow><mi>m</mi><mo> &minus; </mo><mi>n</mi></mrow> </msup></math>##$	img_qt9.GIF	2	0.30000001	40	0.1	\N	40
15058	Qual fórmula nos permite calcular o perímetro de um quadrado?	\N	2	0.30000001	100	0.15000001	\N	40
15078	501	img_qt15.GIF	2	0.40000001	150	0.15000001	\N	40
7747	 No jogo da Mega-Sena são sorteados, a cada extração, 6 dos números de 1 a 60. Quantos são os resultados possíveis da Mega-Sena? 	\N	0	0.40000001	1800	0.15000001	\N	6370
9291	Um dado é jogado três vezes, uma após a outra.  Quantos são os resultados possíveis em que os três números obtidos são diferentes? \r\n\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
9301	Num grupo de 100 pessoas da zona rural, 25 estão afetadas por uma parasitose intestinal A e 11 por uma parasitose intestinal B, não se verificando nenhum caso de incidência conjunta de A e B. Duas pessoas desse grupo são escolhidas, aleatoriamente, uma após a outra. Determine a probabilidade de que, dessa dupla, a primeira pessoa esteja afetada por A e a segunda por B.\r\n\r\n	\N	1	0.40000001	1800	0.15000001	\N	6370
9640	As empresas querem a metade das pessoas trabalhando o dobro para produzir o triplo. (Revista "Você S/A", 2004)\r\nPreocupado em otimizar seus ganhos, um empresário encomendou um estudo sobre a produtividade de seus funcionários nos últimos quatro anos, entendida por ele, de forma simplificada, como a relação direta entre seu lucro anual (L) e o número de operários envolvidos na produção (n). Do estudo, resultou o gráfico. Ao procurar, no gráfico, uma relação entre seu lucro, produtividade e número de operários, o empresário concluiu que a maior produtividade ocorreu em 2002, e o maior lucro	3.JPG	1	0.2	600	0.15000001	\N	6370
9975	 A tabela  mostra o número de unidades vendidas dos produtos M1  , M2  nas lojas A e B: \r\n\r\n\r\n\t \r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mtext></mtext></mtd><mtd><mtext>M1</mtext></mtd><mtd><mtext>M2</mtext></mtd></mtr><mtr><mtd><mi>A</mi></mtd><mtd><mn>10</mn></mtd><mtd><mn>15</mn></mtd></mtr><mtr><mtd><mi>B</mi></mtd><mtd><mn>20</mn></mtd><mtd><mn>10</mn></mtd></mtr></mtable></mfenced></math>##$\r\n\r\n\tDetermine a matriz que representa o total recebido pelas vendas desses produtos em cada loja sabendo que a matriz dos preços é  \r\n\r\nP= $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>20</mn></mtd></mtr><mtr><mtd><mn>30</mn></mtd></mtr></mtable></mfenced></math>##$	\N	1	0.30000001	1200	0.15000001	\N	6370
10533	Para que serve a trigonometria? Por exemplo, a trigonometria serve para resolver o seguinte problema: O teodolito é um instrumento capaz de medir ângulos, muito usado por agrimensores, engenheiros e topógrafos no cálculo de distâncias inacessíveis. Este instrumento ótico mede ângulos horizontais e verticais com suas duas escalas circulares graduadas em graus. Para calcular a altura de um prédio, o topógrafo colocou seu teodolito na praça em frente. Ele mediu a distância do prédio ao teodolito com uma trena e encontrou 27 m. Mirando o alto do prédio, ele verificou na escala do teodolito, que o ângulo formado por essa linha visual com a horizontal é de 58 graus. Se a luneta do teodolito está a 1,7 m do chão, qual é a altura do prédio? \r\n	imagem1.JPG	1	0.30000001	1200	0.15000001	\N	6370
10803	 O brinquedo favorito de Cícero é um cone reto de vidro com 5 cm de altura. Cícero encheu o cone com areia até a altura de 3 cm, como mostrado na figura 1. Em seguida, Cícero fechou a base do cone e virou-o de cabeça para baixo, como indicado na figura 2. A que altura da base do cone, em cm, ficou a marca de areia?	imagem ulbra 1.GIF	2	0.30000001	1200	0.15000001	\N	6370
11052	Para medir a largura   de um rio um homem usou o seguinte procedimento: localizou um ponto B de onde podia ver na margem oposta o coqueiro C, de forma que o ângulo ABC fosse 60°; determinou o ponto D no prolongamento de   de forma que o ângulo CBD fosse de 90°. Medindo   = 40 metros, achou a largura do rio. Determine essa largura.  \r\n	8.JPG	1	0.30000001	1200	0.15000001	\N	6370
11071	Um holofote está situado no ponto A, a 30 metros de altura, no alto de uma torre perpendicular ao plano do chão. Ele ilumina, em movimento de vaivém, uma parte desse chão, do ponto C ao ponto D, alinhados à base B, conforme demonstra a figura. \r\nSe o ponto B dista 20 metros de C e 150 metros de D, a medida do ângulo CÂD corresponde a: \r\n	imagem10.JPG	2	0.30000001	1200	0.15000001	\N	6370
15132	Podemos calcular o perímetro de um hexágono utilizando P=6L. Qual o é o perímetro, em metros de um hexágono com 2,5 m de lado?	\N	2	0.30000001	100	0.15000001	\N	40
15178	503	img_qt17.GIF	1	0.30000001	100	0.15000001	\N	40
15189	O valor de uma corrida de taxi é dado pela expressão V=3+0,3X, onde V é a velocidade e X é a distância percorrida. Qual o valor de uma corrida de 22 km?	\N	0	0.40000001	150	0.15000001	\N	40
15200	504	img_qt18.GIF	3	0.40000001	170	0.15000001	\N	40
15212	505	img_qt19.GIF	1	0.55000001	210	0.2	\N	40
15224	O que vem depois na seqüência XAXAXXAAXXAAXXXAAA... ?	\N	0	0.55000001	220	0.2	\N	40
15234	O que vem depois na seqüência AVMAAVMAVVMAVMM... ?	\N	0	0.60000002	220	0.2	\N	40
15100	502	img_qt16.GIF	3	0.40000001	150	0.15000001	\N	40
15122	Qual o resultado da simplificação da expressão matemática (3-4)+4(6-1)+1 ?	\N	1	0.30000001	100	0.15000001	\N	40
15744	Qual deve ser o valor de X na igualdade 11+X- 3=6(15-7) seja verdadeira?	\N	1	0.40000001	210	0.15000001	\N	40
15754	506	qt16_5serie.GIF	1	0.30000001	100	0.15000001	\N	40
15764	507	qt17_5serie.GIF	2	0.30000001	100	0.15000001	\N	40
15775	508	qt18_5serie.GIF	1	0.40000001	150	0.15000001	\N	40
15787	509	qt19_5serie.GIF	2	0.30000001	100	0.15000001	\N	40
15798	Os cientistas registraram a passagem dos cometas A, B e C perto da Terra no ano de 1997. Sabendo-se que o cometa A passa perto da Terra de 6 em 6 anos, o cometa B, de 12 em 12 anos, e o cometa C, de 30 em 30 anos, daqui a quantos anos os três cometas passarão perto da Terra no mesmo ano?	\N	3	0.55000001	220	0.2	\N	40
15809	O número 115 pode ser escrito como o produto de dois números (um deles é 13), mais a soma de um terceiro. Como podemos representar essa afirmação?	\N	0	0.30000001	100	0.15000001	\N	40
15819	510	qt20_5serie.GIF	2	0.30000001	100	0.15000001	\N	40
15830	A propriedade distributiva está sendo corretamente utilizada em:	\N	2	0.30000001	100	0.15000001	\N	40
15840	607	qt10_6serie.GIF	0	0.30000001	100	0.15000001	\N	40
15850	608	qt11_6serie.GIF	3	0.40000001	160	0.15000001	\N	40
15864	609	qt12_6serie.GIF	4	0.55000001	200	0.2	\N	40
11840	Os coelhos se reproduzem mais rapidamente que a maioria dos mamíferos. Considere uma colônia de coelhos que se inicia com um único casal de coelhos adultos e denote por a(n) o número de casais adultos no final de n meses e, para $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi>n</mi><mo> &geq; </mo><mn>2</mn></math>##$,a(n+1)=a(n)+a(n-1); Qual será o número de casais de coelhos adultos na colônia ao final do quinto mês?	\N	1	0.40000001	1800	0.15000001	\N	6370
11901	Em uma pista de corrida, cujo formato é de um polígono regular de n vértices, numerados de 1 até n no sentido anti-horário, existem três pessoas: Nelly, Sônia e Penha, estando inicialmente todas em um mesmo vértice. Em um dado momento elas começam a caminhar pelos lados do polígono. Nelly caminha no sentido anti-horário, enquanto que Sônia e Penha caminham no sentido contrário. Nelly cruza com Sônia pela primeira vez em um vértice e com Penha dois vértices à frente. A velocidade de Nelly é o dobro da velocidade de Sônia e a velocidade de Sônia é o dobro da velocidade de Penha. Quantos vértices têm o polígono?  	\N	2	0.40000001	1800	0.15000001	\N	6370
12156	Millôr Fernandes, em uma bela homenagem à Matemática, escreveu um poema do qual extraímos o fragmento abaixo\r\n\tÀs folhas de um livro de Matemática,\r\num Quociente apaixonou-se um dia doidamente\r\npor uma Incógnita.\r\nOlhou-a com seu olhar inumerável\r\nE viu-a do ápice à base: uma figura ímpar;\r\nOlhos rombóides, boca trapezóide,\r\nCorpo retangular, seios esferóides.\r\nFez da sua uma vida paralela à dela,\r\nAté que se encontraram no Infinito.\r\n“Quem és tu?”- indagou ele em ânsia radical.\r\n“Sou a soma dos quadrados dos catetos.\r\n\r\nMas pode me chamar de hipotenusa”.\r\n\t\t\t\t(Millôr Fernandes. Trinta Anos de Mim Mesmo).\r\nA Incógnita se enganou ao dizer quem era. Para atender ao Teorema de Pitágoras, deveria dar a seguinte resposta: \r\n	\N	3	0.2	600	0.15000001	\N	6370
13630	 Uma empresa de autopeças vem sofrendo sucessivas quedas em suas vendas a partir de julho de 2002. Naquele mês, ela vendeu 100.000 peças e, desde então, a cada mês tem vendido 2.000 peças a menos. Para reverter essa tendência, o departamento de marketing da empresa resolveu lançar uma campanha cuja meta é aumentar o volume de vendas à razão de 10% ao mês nos próximos seis meses, a partir de janeiro de 2004. A respeito das vendas dessa empresa, é correto afirmar: 	\N	3	0.40000001	1800	0.15000001	\N	6370
13643	Alessandra, Joana e Sônia vendem saladas prontas, contendo porções de tomate, pimentão e repolho. A matriz M fornece o número de porções de tomate, pimentão e repolho usadas na composição das saladas. A matriz N fornece, em real, o custo das saladas.\r\n \r\nSabendo-se que o determinante de M é não-nulo, obtém-se a matriz que fornece, em real, o custo de cada porção de tomate, pimentão e repolho, efetuando-se a operação:\r\n	r2.GIF	3	0.40000001	1800	0.15000001	\N	6370
13583	Os romanos utilizavam um sistema de numeração diferente do nosso. A tabela mostra a relação entre a escrita romana e a nossa. Para escrever os números eles utilizavam duas regras: um número escrito a direita de um número maior ou igual deve ser adicionado e se for escrito a esquerda de um número maior deve ser subtraído, sendo que o mesmo símbolo não pode aparecer mais do que três vezes. Por exemplo: 22 = XXII ou 9 = IX\r\n\r\nUtilizando as informações acima, como são escritos na numeração romana os números 89 e 212?\r\n	qt2_5serie.gif	1	0.55000001	270	0.2	\N	40
14306	Uma emissora de televisão dispõe de um aparelho que registra a temperatura a cada hora do dia e, ao mesmo tempo, lança os valores em um gráfico:\r\nAnalise as afirmações abaixo utilizando o gráfico para verificar sua validade.\r\nI – A temperatura permanece estável depois das 22 horas.\r\nII – A temperatura mais baixa do dia é registra a 0 hora.\r\nIII – A temperatura permanece em elevação entre as 5 h e as 12 h.\r\nIV – A amplitude térmica  é a diferença entre a temperatura máxima e a mínima de um determinado dia, nesse dia representado no gráfico, a amplitude térmica foi de 16º C.\r\n\r\nA(s) afirmação(ões) é(são) correta(s):\r\n	img_qt10.GIF	3	0.40000001	150	0.15000001	\N	40
15031	Joana comprou 4 laranjas, 3 maças e 5 tomates. Podemos representar a soma de todos esses items através da relação:	\N	1	0.30000001	100	0.15000001	\N	40
15875	610	qt13_6serie.gif	1	0.30000001	100	0.15000001	\N	40
15885	611	qt14_6serie.gif	2	0.30000001	100	0.15000001	\N	40
15897	612	qt15_6serie.gif	0	0.30000001	100	0.15000001	\N	40
15909	613	img6_6.GIF	1	0.40000001	150	0.15000001	\N	40
15921	Simplificando a expressão -9(X+3)-18 , obtemos:	\N	0	0.30000001	100	0.15000001	\N	40
15933	Qual o valor de X na expressão 3X – 8 = X + 8?	\N	4	0.30000001	100	0.15000001	\N	40
16345	Ao triplo de um número adicionamos 90. O resultado é igual ao quíntuplo do mesmo número. Qual é esse número?	\N	3	0.40000001	120	0.15000001	\N	40
16355	Em uma caixa cabem 24 garrafas. Se você colocar 1520 garrafas em caixas como essa, vai obter x caixas completas e uma incompleta, com 8 garrafas. Quantas caixa completas você vai obter?	\N	2	0.30000001	100	0.15000001	\N	40
16365	Uma empresa tem a matriz em Porto Alegre e filiais em todo o Brasil, e possui um total de 1264 funcionários. O número de pessoas que trabalham nas filiais é o triplo do número de pessoas que trabalham na matriz. Podemos determinar o número de funcionários que trabalha na matriz resolvendo:	\N	3	0.40000001	150	0.15000001	\N	40
16375	624	qt23_6serie.GIF	0	0.40000001	160	0.15000001	\N	40
16385	Em um banco, constatou-se que uma caixa leva em média, 5 minutos para atender 3 clientes. Qual é o tempo necessário para essa caixa atender 36 clientes?	\N	1	0.30000001	100	0.15000001	\N	40
16395	Quem vem depois na seqüência 1234112341223412... ?	\N	0	0.55000001	200	0.2	\N	40
14084	 Na figura, o cone reto está inscrito no cubo.\r\n\r\nSe a diferença entre os volumes do cubo e do cone é $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>1</mn><mo> &minus; </mo><mfrac> <mrow> <mi> &pi; </mi> </mrow> <mrow><mn>12</mn></mrow> </mfrac></math>##$,   então  a diagonal da face do cubo mede:\r\n\r\n	r25.GIF	0	0.40000001	1800	0.15000001	\N	6370
16032	Um quilograma de feijão custa x reais e um quilograma de arroz custa R$ 0,43 a mais que um quilograma de feijão. Cinco quilogramas de feijão custam o mesmo que 4 quilogramas de arroz. Quanto custa um quilograma de feijão?	\N	2	0.55000001	220	0.2	\N	40
16042	617	qt16_6serie.gif	2	0.30000001	100	0.15000001	\N	40
16052	Para calcular o valor de uma corrida de táxi, um taxista utiliza a seguinte fórmula: V=3,50(D x 0,75) , onde V é o valor a ser cobrado e D é a distância percorrida. Utilizando essas informações determine o valor de uma corrida de 11km  que demorou 15 min devido ao trânsito lento.	\N	2	0.30000001	100	0.15000001	\N	40
16062	Na prova de Matemática, certo aluno, afirma que a solução da equação 3x+2=8  é 3. Você concorda com essa afirmação?	\N	1	0.30000001	100	0.15000001	\N	40
16072	618	qt17_6serie.gif	2	0.55000001	150	0.2	\N	40
16083	619	qt18_6serie.GIF	1	0.40000001	180	0.15000001	\N	40
16094	Na festa de aniversário de João, havia 6 meninas para cada 5 meninos. Se havia 42 meninas, quantos eram os meninos?	\N	0	0.55000001	200	0.2	\N	40
16104	620	qt19_6serie.GIF	1	0.40000001	150	0.15000001	\N	40
16115	621	qt20_6serie.GIF	2	0.40000001	150	0.15000001	\N	40
16125	622	qt21_6serie.GIF	0	0.30000001	100	0.15000001	\N	40
16139	623	qt22_6serie.GIF	1	0.40000001	150	0.15000001	\N	40
16149	Em um supermercado 5 kg de arroz estão sendo vendidos por R$ 7,74 enquanto em outro vendem 4 kg  por R$ 6,10. Em qual dos supermercados o arroz está sendo vendido mais barato?	\N	1	0.40000001	160	0.15000001	\N	40
16157	A simplificação de 4x+4-x+y-2+x resulta em:	\N	1	0.30000001	100	0.15000001	\N	40
16319	Eliminando parênteses e colchetes, escreva da forma mais simples possível a expressão: \r\n3x-(-2x+7x)-[10x+(-4x-2x)-(7x+10x)].\r\n	\N	2	0.55000001	220	0.2	\N	40
16329	Daqui a 10 anos Karina terá 28 anos. A equação que nos permite calcular a idade de Karina hoje é:	\N	3	0.40000001	160	0.15000001	\N	40
16335	O conjunto solução da equação de 1º grau 4(x-2)=4+2(x-1) é:	\N	1	0.40000001	180	0.15000001	\N	40
27635	Um copo é um cone (oco), cuja altura é o dobro do diâmetro. Se uma pessoa bebe desde que o copo está cheio até o nível da bebida fica exatamente na metade da altura do copo, a fração do volume total que deixou de ser consumida é:\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
27645	Na figura, O é o centro do cubo.Se o volume do cubo é 1, o volume da pirâmide de base ABCD e vértice O é:	cubo.JPG	3	0.40000001	1800	0.15000001	\N	6370
27659	Um cone circular reto tem altura de 8cm e raio da base medindo 6cm. Qual é, aproximadamente, em centímetros quadrados, sua área lateral?\r\n\r\n	\N	3	0.40000001	1800	0.15000001	\N	6370
16542	Seguindo os passos descritos abaixo você é capaz de adivinhar um número inicialmente escolhido por  uma pessoa.\r\n·\tEscreva um número menor que 100.\r\n·\tMultiplique-o por 5.\r\n·\tSome 6 ao resultado.\r\n·\tMultiplique por 4 o resultado anterior.\r\n·\tSome 9 ao resultado.\r\n·\tMultiplique por 5 o resultado.\r\n·\tSubtraia 100.\r\nAlgebricamente, para que você possa descobrir com rapidez o número pensado, todos os passos descritos acima podem ser resumidos na equação:	\N	0	0.55000001	250	0.2	\N	40
16552	703	img3_7.GIF	2	0.30000001	100	0.15000001	\N	40
16562	Davi trabalha como taxista. Para fazer uma corrida, ele cobra R$ 3,00 a bandeirada e mais R$ 2,00 por quilômetro rodado. Se considerarmos Y como o preço, em reais, e x o número de quilômetros rodados, podemos escrever uma fórmula que permite calcular o preço de cada corrida. Qual das fórmulas listadas nos permite fazer esse cálculo?	img4_7.GIF	3	0.40000001	160	0.15000001	\N	40
16572	704	img5_7.GIF	2	0.55000001	210	0.2	\N	40
16584	Quanto vale X na equação 5(x+2)-3(x+6)=40 ?	\N	1	0.40000001	160	0.15000001	\N	40
16599	625	qt24_6serie.gif	1	0.55000001	220	0.2	\N	40
27669	Em um concurso para ganhar um carro, é necessário adivinhar atrás de que porta ele está escondido. Após um concorrente escolher uma das três portas, e antes de ela ser verificada, o mediador do concurso abre uma porta, e atrás dela havia uma zebra. O mediador, então, permite que o concorrente mude o palpite original. Podemos dizer então 	porta.JPG	2	0.40000001	1800	0.15000001	\N	6370
16799	712	qt8_7serie.gif	4	0.30000001	100	0.15000001	\N	40
16840	713	qt9_7serie.GIF	0	0.30000001	100	0.15000001	\N	40
17290	733	img8_7.GIF	0	0.40000001	180	0.15000001	\N	40
16850	714	qt10_7serie.GIF	1	0.40000001	160	0.15000001	\N	40
16881	716	qt12_7serie.GIF	0	0.30000001	100	0.15000001	\N	40
16891	Quanto vale X na equação 5(x+2)-3(x+6)=40 ?	\N	1	0.30000001	110	0.15000001	\N	40
16921	718	qt14_7serie.GIF	0	0.40000001	180	0.15000001	\N	40
16948	Para cavar 34 m de valos em uma obra, 2 operários demoram em média meio dia. Quantos metros de valo serão cavados em 3 dias por 3 operários?	\N	1	0.55000001	210	0.2	\N	40
17003	Em uma sessão de cinema entraram 280 pessoas e foram arrecadados R$ 1290,00. Para essa sessão, uma entrada inteira custava R$ 6,00 e meia-entrada, R$ 3,00. Sendo x o número de pessoas que pagaram a entrada inteira, qual das equações abaixo permite encontrar o valor de x ?	\N	1	0.55000001	250	0.2	\N	40
17054	722	qt18_7serie.GIF	1	0.40000001	160	0.15000001	\N	40
17064	Qual a forma simplificada da expressão 5(x+2)-8+x ?	\N	3	0.30000001	100	0.15000001	\N	40
17097	724	qt20_7serie.GIF	1	0.55000001	210	0.2	\N	40
17107	725	qt21-7serie.GIF	2	0.40000001	160	0.15000001	\N	40
17117	726	qt22_7serie.GIF	0	0.30000001	110	0.15000001	\N	40
17127	727	qt23_7serie.GIF	3	0.40000001	160	0.15000001	\N	40
17137	O resultado da resolução da expressão matemática (a+b)(a-b), fica bem resumida assim:	\N	1	0.40000001	150	0.15000001	\N	40
17157	729	qt25_7serie.GIF	0	0.30000001	100	0.15000001	\N	40
17163	730	qt26_7serie.GIF	0	0.55000001	180	0.2	\N	40
17173	801	qt1_8serie.GIF	1	0.55000001	210	0.2	\N	40
17183	802	qt2_8serie.GIF	1	0.55000001	220	0.2	\N	40
17249	808	qt8_8serie.GIF	3	0.40000001	160	0.15000001	\N	40
17207	804	qt4_8serie.GIF	2	0.40000001	210	0.15000001	\N	40
17217	805	qt5_8serie.GIF	0	0.30000001	100	0.15000001	\N	40
17228	806	qt6_8serie.GIF	1	0.40000001	180	0.15000001	\N	40
17239	807	qt7_8serie.GIF	1	0.30000001	110	0.15000001	\N	40
17736	810	qt10_8serie.gif	1	0.30000001	125	0.15000001	\N	40
17304	734	img9_7.GIF	1	0.30000001	110	0.15000001	\N	40
17261	731	img6_7.GIF	2	0.40000001	180	0.15000001	\N	40
17271	) Dois irmãos conversando sobre suas economias afirmam que:\r\n...\r\n- Antônio, se você me der um terço do que você economizou, eu ficarei com 110 reais.\r\n- Olha, Bento, eu preciso de menos. Basta que você me dê um quarto das suas economias para que eu fique com 110 reais.\r\n...\r\nO par ordenado que representa a quantidade de dinheiro de cada irmão é:\r\n	\N	3	0.55000001	220	0.2	\N	40
17314	735	img10_7.GIF	2	0.55000001	180	0.2	\N	40
17324	736	img11_7.GIF	1	0.40000001	180	0.15000001	\N	40
17334	A solução da inequação 10+x-3 < 2x-1+x é:	\N	0	0.30000001	100	0.15000001	\N	40
17423	A soma de dois números consecutivos quaisquer, resulta sempre em um número:	\N	1	0.30000001	100	0.15000001	\N	40
17746	811	qt11_8serie.gif	0	0.30000001	150	0.15000001	\N	40
17195	803	qt3_8serie.GIF	2	0.40000001	120	0.15000001	\N	40
17756	812	qt12_8serie.gif	2	0.40000001	150	0.15000001	\N	40
16861	Qual a forma fatorada do polinômio 6ax+8ay ?	\N	3	0.55000001	220	0.2	\N	40
16780	711	qt7_7serie.gif	2	0.40000001	150	0.15000001	\N	40
16871	715	qt11_7serie.GIF	2	0.40000001	170	0.15000001	\N	40
16911	717	qt13_7serie.GIF	2	0.40000001	160	0.15000001	\N	40
16983	720	qt16_7serie.GIF	0	0.40000001	160	0.15000001	\N	40
16971	719	qt15_7serie.GIF	3	0.30000001	100	0.15000001	\N	40
17013	Em uma pesquisa, verificou-se que, em certa cidade, havia 5 mulheres para cada 4 homens. Sabendo-se que nessa cidade há 125000 mulheres, qual o número de homens?	\N	1	0.30000001	110	0.15000001	\N	40
17023	Se 2 costureiras demoram 6 horas para fabricar uma certa quantidade de peças de roupa, quantas costureiras seriam necessárias para realizar o mesmo serviço em 4 horas?	\N	1	0.40000001	150	0.15000001	\N	40
17034	Em um lago a área ocupada por nenúfares (espécie de planta aquática) dobra a cada dia. Sabendo-se que em 16 dias os nenúfares ocuparam 100 m2 da área desse lago, quantos dias eles levaram para ocupar 50 m2?	\N	0	0.40000001	160	0.15000001	\N	40
17044	721	qt17_7serie.GIF	1	0.55000001	220	0.2	\N	40
17076	Pensei em um número. Multipliquei-o por 4 e depois adicionei 6. O resultado foi –10 . Em que número pensei?	\N	2	0.55000001	200	0.2	\N	40
17087	723	qt19_7serie.GIF	2	0.40000001	150	0.15000001	\N	40
17147	728	qt24_7serie.GIF	0	0.55000001	200	0.2	\N	40
17281	732	img7_7.GIF	1	0.40000001	160	0.15000001	\N	40
17344	O triplo de um número adicionado à metade desse número é menor que a diferença entre 25 e 18. Que condição deve cumprir esse número?	\N	1	0.55000001	240	0.2	\N	40
17354	Uma máquina copiadora reproduz 43 cópias por minuto. Quantas máquinas iguais a essa seriam necessárias para reproduzir, em dois minutos, 516 cópias?	\N	1	0.40000001	160	0.15000001	\N	40
17364	O mecanismo de acionamento de uma impressora conta com duas rodas dentadas. Uma roda com 60 dentes esta engrenada com outra de 48 dentes. Enquanto a segunda roda dá 600 voltas, a primeira irá dar:	\N	0	0.40000001	180	0.15000001	\N	40
17375	A soma de um número com seu quadrado irá resultar sempre em um número:	\N	0	0.40000001	150	0.15000001	\N	40
17383	Numa cidade, a bandeirada de uma corrida de táxi custa R$ 3,40 e um percurso de 16 km sai por R$ 32,20. O preço do quilômetro rodado num táxi dessa cidade é?	\N	3	0.40000001	180	0.15000001	\N	40
17393	Vera e Joana tomaram lanche juntas. A despesa ficou em R$ 28,00. Como Vera comeu mais que Joana, pagou R$ 13,00 a mais que ela. Quanto pagou cada uma?	\N	1	0.30000001	110	0.15000001	\N	40
17403	Numa prova de Matemática, 15% dos alunos de uma turma não resolveram a última questão, 45% resolveram com alguns erros e os alunos restantes acertaram a questão. Quantos alunos havia na turma?	\N	2	0.40000001	180	0.15000001	\N	40
17413	737	qt27_7serie.gif	0	0.55000001	240	0.2	\N	40
17726	809	qt9_8serie.gif	0	0.40000001	180	0.15000001	\N	40
20199	Durante as atividades realizadas no dia-a-dia, nosso corpo consome energia. Para recuperá-la, precisamos de uma alimentação saudável e de um período de sono adequado. A necessidade diária de sono é individual e varia, mas entre outros fatores, de acordo com a idade.\r\nObservando o gráfico acima podemos concluir que:\r\nI – A medida que a idade aumenta o tempo de sono noturno e diurno diminuem.\r\nII – À medida que a idade aumenta apenas a necessidade do sono noturno diminui.\r\nIII – À medida que a idade aumenta a necessidade de sono noturno diminui e a de sono diurno aumenta.\r\nIV – À medida que a idade aumenta a necessidade de sono noturno diminui e a do sono diurno diminui até a adolescência e depois aumenta um pouco.\r\nÉ(são) correta(s):	qt2_8serie.JPG	1	0.55000001	220	0.2	\N	40
20388	822	qt22_8serie.GIF	1	0.30000001	120	0.15000001	\N	40
13573	As figuras abaixo foram identificadas por letras. Quais dessas figuras são quadrados?	qt1_5serie.gif	0	0.30000001	100	0.15000001	\N	40
13598	Gustavo foi a uma loja e comprou uma camiseta(A), uma calça(B) e um par te tênis(C). Por tudo ele  pagou R$ 195,00(T). Quando chegou em casa foi conferir as etiquetas para saber quanto havia pago por cada item descobriu que havia pago R$ 15,00 pela camiseta (A) e R$ 110,00 pelo par de tênis (C), no entanto não encontrou a etiqueta com o valor pago pela calça(B). Qual operação Gustavo teve que fazer para descobrir o valor pago pela calça?	\N	1	0.40000001	180	0.15000001	\N	40
15950	Qual o valor de Z na expressão Z + 2Z + 4 = Z + Z +5?	\N	1	0.40000001	150	0.15000001	\N	40
16532	702	img2_7.GIF	2	0.55000001	240	0.2	\N	40
16638	O reajuste que se dá trimestralmente aos funcionários de uma fábrica é determinado pela fórmula R= 0,1I+0,5, onde I representa o índice de inflação do período. Analisando essa fórmula podemos constatar que:\r\n	\N	2	0.40000001	150	0.15000001	\N	40
16775	710	qt6_7serie.gif	1	0.55000001	240	0.2	\N	40
16940	O par ordenado (-3, 5) é solução, ao mesmo tempo, das equações: 4x+3y=3  e 2x-5y=-31  ?	\N	0	0.30000001	100	0.15000001	\N	40
16959	Para construir 18 metros quadrados(18 m2) de parede em meio dia (4 h), uma firma de construção utiliza 2 pedreiros. Se o mestre de obras estiver com presa para terminar uma parede com essa medida e resolver utilizar 5 pedreiros em uma manhã, quanto tempo eles demorarão para levantar a parede?	\N	2	0.55000001	240	0.2	\N	40
18138	813	qt13_8serie.gif	1	0.55000001	250	0.2	\N	40
18148	814	qt14_8serie.gif	2	0.40000001	180	0.15000001	\N	40
18158	Um estacionamento cobra R$ 6,00 pela primeira hora e mais R$ 0,75 por hora adicional. Qual das fórmulas abaixo nos permite calcular o valor pago por cada usuário?	\N	1	0.40000001	160	0.15000001	\N	40
18427	816	qt16_8serie.gif	1	0.30000001	120	0.15000001	\N	40
20402	823	qt23_8serie.GIF	3	0.30000001	150	0.15000001	\N	40
18437	817	qt17_8serie.gif	0	0.40000001	180	0.15000001	\N	40
18447	O próximo passo na resolução da equação x-21=15 é:	\N	1	0.30000001	100	0.15000001	\N	40
18457	A expressão 3x+4y é equivalente a:	\N	2	0.30000001	100	0.15000001	\N	40
18467	Se x=4, podemos concluir que 5x é igual a:	\N	1	0.30000001	100	0.15000001	\N	40
18477	É possível que a seguinte igualdade 4X+4–Y=3X+4+R–Y, seja verdadeira?	\N	2	0.30000001	120	0.15000001	\N	40
18489	Em um jogo de basquete, as equipes A e B fizeram, ao todo, 153 pontos. A equipe B fez o dobro de pontos da equipe A, menos 3 pontos. Quantos pontos fez cada equipe?	\N	2	0.40000001	180	0.15000001	\N	40
18499	A casa de seu José fica num terreno retangular que tem 84 metros  de perímetro. O comprimento desse terreno é o triplo da largura. Quais são as medidas dos lados do terreno onde está a casa de seu José?	\N	3	0.55000001	240	0.2	\N	40
20145	818	qt18_8serie.GIF	2	0.40000001	160	0.15000001	\N	40
20155	819	qt19_8serie.GIF	0	0.55000001	200	0.2	\N	40
20165	820	qt20_8serie.GIF	2	0.40000001	170	0.15000001	\N	40
20175	821	qt21_8serie.GIF	2	0.40000001	180	0.15000001	\N	40
20187	O gráfico mostra a evolução da produção de café no Brasil entre os anos de 1994 e 2003. A produção média ao longo desse período foi de 2,9 milhões de toneladas por ano. Diante dessa informação podemos afirmar que a produção brasileira de café foi acima da média:	qt01_8serie.JPG	1	0.30000001	100	0.15000001	\N	40
20412	Edson trabalha com técnico em computação. Para fazer um atendimento domiciliar, ele cobra R$ 30,00 a visita mais R$ 18,00 cada hora de trabalho. Qual das fórmulas abaixo representa o preço cobrado por Edson em função da horas trabalhadas?	\N	2	0.30000001	100	0.15000001	\N	40
20422	Observando a seqüência de palitos responda, quantos palitos terá o 4º elemento desse seqüência?	qt04_8serie.JPG	0	0.40000001	160	0.15000001	\N	40
20437	824	\N	2	0.40000001	170	0.15000001	\N	40
20442	824	\N	2	0.40000001	170	0.15000001	\N	40
20447	824	qt05_8serie.JPG	2	0.40000001	170	0.15000001	\N	40
21019	A seqüência de quadrados foi construída com palitos de sorvete. Note que o número de palitos utilizados varia de acordo com o número de quadrados. Qual a fórmula que representa o número de palitos (y) em função do número de quadrados obtidos(x)?	qt06_8serie.JPG	1	0.40000001	150	0.15000001	\N	40
21029	A seqüência de quadrados foi construída com palitos de sorvete. Note que o número de palitos utilizados varia de acordo com o número de quadrados. Quantos palitos são necessários para formar 21 quadrados?	qt06_8serie.JPG	2	0.55000001	210	0.2	\N	40
21039	Paulo era funcionário de uma universidade e estava procurando um carro para comprar. Na primeira concessionária que visitou, em março, o automóvel que desejava era oferecido a R$ 21.000,00 e na segunda por R$ 20.500,00. Desde então Paulo tem acompanhado a variação no preço do tão deseja carro. No mês de abril o preço da primeira loja sofreu um desconto de 10%, enquanto que na outra concessionária o automóvel teve um desconte de 8%. Depois de dois meses da primeira visita, Paulo resolveu finalmente adquirir o automóvel, agora em maio. Na primeira concessionária o preço do carro tinha sido reajustado em 10% e na segunda em 11%, em relação ao mês anterior. Em qual loja Paulo deve fazer a compra?	\N	1	0.40000001	180	0.15000001	\N	40
18168	815	qt15_8serie.gif	1	0.40000001	160	0.15000001	\N	40
21047	Existe diferença entre ‘calcular as raízes de uma equação de 2º grau’ e ‘calcular os zeros’ dessa mesma equação?	\N	1	0.30000001	110	0.15000001	\N	40
21156	825	qt24_8serie.gif	1	0.55000001	220	0.2	\N	40
21478	Com base no digrama podemos concluir:	qt07_8serie.JPG	0	0.55000001	210	0.2	\N	40
21490	826	qt25_8serie.GIF	1	0.30000001	120	0.15000001	\N	40
21524	O teorema de Pitágoras pode ser utilizado em triângulos. Em particular, ele é sempre válido em triângulos:	\N	2	0.30000001	110	0.15000001	\N	40
11104	 Dona Maria, a costureira do bairro, dispõe de duas fitas de seda de tamanhos diferentes. Com as mãos, ela mediu as fitas: a primeira deu 24 palmos e a segunda 32 palmos. Em seguida Maria decidiu que ambas as fitas deveriam ser cortadas em partes iguais e com a maior medida possível. Quantos palmos deverá ter cada fita? 	\N	2	0.30000001	1200	0.15000001	\N	6370
7724	Após uma partida de futebol, em que as equipes jogaram com as camisas numeradas de 1 a 11 e não houve substituições, procede-se ao sorteio de dois jogadores de cada equipe para exame anti-doping. Os jogadores da primeira equipe são representados por 11 bolas numeradas de 1 a 11 de uma urna A e os da segunda, da mesma maneira, por bolas de uma urna B. Sorteia-se primeiro, ao acaso e simultaneamente, uma bola de cada urna. Depois, para o segundo sorteio, o processo deve ser repetido com as 10 bolas restantes de cada urna. Se na primeira extração foram sorteados dois jogadores de números iguais, a probabilidade de que aconteça o mesmo na segunda extração é de:	\N	1	0.40000001	1800	0.15000001	\N	6370
22625	827	qt26_8serie.GIF	0	0.40000001	180	0.15000001	\N	40
22635	828	qt27_8serie.GIF	1	0.55000001	220	0.2	\N	40
22645	829	qt28_8serie.GIF	2	0.55000001	210	0.2	\N	40
22655	830	qt29_8serie.GIF	0	0.40000001	180	0.15000001	\N	40
9965	Em um grupo de 4 pessoas, qual é a probabilidade de haver alguma coincidência de signos zodiacais? 	\N	2	0.30000001	1200	0.15000001	\N	6370
9995	 A tabela  mostra o número de unidades vendidas dos produtos  P1, P2  e P3  de duas unidades de uma fábrica em Porto Alegre e Recife nos meses de janeiro e fevereiro. Para atender a uma proposta de exportação, no mês de março a empresa deverá duplicar a produção de janeiro e triplicar a de fevereiro. Quais os totais de estoque do mês de março? \r\n\r\n\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mtext>JANEIRO</mtext></mtd><mtd><mtext>P1</mtext></mtd><mtd><mtext>P2</mtext></mtd><mtd><mtext>P3</mtext></mtd></mtr><mtr><mtd><mtext>Porto</mtext><mo> &sdot; </mo><mtext>Alegre</mtext></mtd><mtd><mn>383</mn></mtd><mtd><mn>410</mn></mtd><mtd><mn>321</mn></mtd></mtr><mtr><mtd><mtext>Recife</mtext></mtd><mtd><mn>622</mn></mtd><mtd><mn>590</mn></mtd><mtd><mn>603</mn></mtd></mtr></mtable></mfenced></math>##$\r\n\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mtext>FEVEREIRO</mtext></mtd><mtd><mtext>P1</mtext></mtd><mtd><mtext>P2</mtext></mtd><mtd><mtext>P3</mtext></mtd></mtr><mtr><mtd><mtext>Porto</mtext><mo> &sdot; </mo><mtext>Alegre</mtext></mtd><mtd><mn>210</mn></mtd><mtd><mn>420</mn></mtd><mtd><mn>301</mn></mtd></mtr><mtr><mtd><mtext>Recife</mtext></mtd><mtd><mn>481</mn></mtd><mtd><mn>601</mn></mtd><mtd><mn>600</mn></mtd></mtr></mtable></mfenced></math>##$	\N	3	0.30000001	1200	0.15000001	\N	6370
10893	  Três torneiras estão com vazamento. Da primeira cai uma gota de 4 em 4 minutos; da segunda, uma de 6 em 6 minutos e da terceira, uma de 10 em 10 minutos. Exatamente às 2 horas cai uma gota de cada torneira. As torneiras pingarão juntas novamente em que horário? 	\N	1	0.30000001	1200	0.15000001	\N	6370
10938	 Analisando a seqüência abaixo$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>9</mn></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &equals; </mo><mn>81</mn></math>##$; $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>99</mn></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &equals; </mo><mn>9801</mn></math>##$;\r\n\r\n\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>999</mn></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &equals; </mo><mn>998001</mn></math>##$,\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>9999</mn></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &equals; </mo><mn>99980001</mn></math>##$\r\n\r\nConclui-se que $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mn>999999</mn></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$ vale	\N	3	0.30000001	1200	0.15000001	\N	6370
11117	 Um professor de Matemática comprou duas caixas de giz, uma contendo a gizes brancos e a outra b gizes amarelos, contabilizando um total de 63. Determinado em reabastecer o maior número de salas de aula e em quantidades iguais de giz, ele conseguiu distribuir as duas caixas entre 9 salas de aula, de modo que todas as salas de aula tinham a mesma quantidade de giz branco e a mesma quantidade de giz amarelo. Sabendo-se que tem mais gizes brancos do que amarelos e que cada caixa tem mais de 20 unidades, determine quantos gizes tem cada caixa.	\N	2	0.30000001	1200	0.15000001	\N	6370
13621	 Numa região muito pobre e com escassez de água, uma família usa para tomar banho um chuveiro manual, cujo reservatório de água tem o formato de um cilindro circular reto de 30 cm de altura e base com 12 cm de raio, seguido de um tronco de cone reto cujas bases são círculos paralelos, de raios medindo 12 cm e 6 cm, respectivamente, e altura 10 cm, como mostrado na figura. \r\n\r\n \r\nPor outro lado, numa praça de uma certa cidade há uma torneira com um gotejamento que provoca um desperdício de 46,44 litros de água por dia. Considerando a aproximação π = 3, determine quantos dias de gotejamento são necessários para que a quantidade de água desperdiçada seja igual à usada para 6 banhos, ou seja, encher completamente 6 vezes aquele chuveiro manual. Dado: 1 000 cm3 = 1 litro.\r\n\r\n	r1.GIF	2	0.40000001	1800	0.15000001	\N	6370
22665	Certa substância foi aquecida a partir de 0 ºC até atingir 60 ºC. O gráfico está representando esse aquecimento. Qual função polinomial de 1º grau representa a variação da temperatura em função do tempo?	qt08_8serie.gif	1	0.40000001	150	0.15000001	\N	40
22675	O zero da função representada no gráfico é:	qt09_8serie.gif	2	0.30000001	120	0.15000001	\N	40
22989	dgdfgsfg	\N	0	0.69999999	123	0.2	\N	6272
23023	preg nodo 2	\N	0	0.89999998	123	0.1	\N	6272
23026	preg nodo 2 2	\N	0	0.89999998	123	0.1	\N	6272
23029	preg nodo 2 3	\N	0	0.89999998	123	0.1	\N	6272
13732	 O excesso de veículos e os congestionamentos em grandes cidades são temas de freqüentes reportagens. Os meios de transportes utilizados e a forma como são ocupados têm reflexos nesses congestionamentos, além de problemas ambientais e econômicos. No gráfico a seguir, podem-se observar valores médios do consumo de energia por passageiro e por quilômetro rodado, em diferentes meios de transporte, para veículos em duas condições de ocupação (número de passageiros): ocupação típica e ocupação máxima. \r\n \r\nEsses dados indicam que políticas de transporte urbano devem também levar em conta que a maior eficiência no uso de energia ocorre para os:\r\n\r\n	r5.GIF	1	0.30000001	1200	0.15000001	\N	6370
28818	O ponto de ordenada -1 e abscissa 2 pertence a reta	\N	2	0.30000001	180	0.2	\N	4350
28892	A reta com coeficiente linear positivo é\r\n\r\n	\N	3	0.30000001	240	0.2	\N	4350
28902	Os pontos A de abscissa 2 e ordenada 1; B de abscissa 0 e ordenada 3 e C de abscissa  -1 e ordenada 1 determinam um triângulo, então a altura relativa ao lado BC é\r\n\t	\N	1	0.44999999	480	0.2	\N	4350
28912	A reta que tem coeficiente angular positivo é\r\n	\N	0	0.30000001	180	0.2	\N	4350
28931	O coeficiente angular da reta que passa pelos pontos A de abscissa “a” e ordenada 1 e B de abscissa 2 e ordenada “b” é\r\n\t	\N	2	0.34999999	360	0.2	\N	4350
28921	Duas retas r e s têm coeficientes angulares iguais a A e B respectivamente. Para que elas sejam perpendiculares a relação verdadeira é\r\n	\N	2	0.34999999	240	0.2	\N	4350
28949	A reta que faz um ângulo de 60 graus  com o eixo das abscissas é\r\n\t\r\n\r\n\r\n	\N	2	0.34999999	240	0.2	\N	4350
28967	A equação da reta que intersecta um eixo coordenado em ordenada igual a -1 e é perpendicular à bissetriz do primeiro quadrante é\r\n	\N	1	0.34999999	360	0.2	\N	4350
28989	O valor de p em função de q sabendo que os pontos A de abscissa zero e ordenada um; B de abscissa um e ordenada zero e C de abscissa “p” e ordenada “q” estão alinhados é\r\n	\N	1	0.44999999	420	0.2	\N	4350
28999	A equação da reta de coeficiente angular igual a -4/5 e que passa pelo ponto de abscissa dois e ordenada menos cinco é\r\n\r\n	\N	0	0.30000001	240	0.2	\N	4350
29009	Observando as retas de equação\r\n – x + 3y + 6 = 0 e 2x + y – 4 = 0, podemos afirmar\r\n\r\n	\N	2	0.30000001	300	0.2	\N	4350
29019	O ângulo que a reta de equação\r\n √3x – 3y = 6 faz com o eixo das abscissas é\r\n\r\n	\N	3	0.30000001	120	0.2	\N	4350
29029	A reta perpendicular a reta x = 4 é\r\n\r\n	\N	1	0.30000001	120	0.2	\N	4350
29042	Sobre a equação da reta – kx – 2y + 4 = 0, onde k é um número real não negativo podemos afirmar que quando k varia em valores crescentes\r\n	\N	2	0.34999999	300	0.2	\N	4350
29074	Usando duas retas e o eixo das abscissas para formar um triângulo eqüilátero, onde uma das retas faz 60 graus de inclinação com o eixo das abscissas e passa pelo ponto de abscissa zero e ordenada 2, então a outra reta que passa pelo ponto de abscissa 0 e ordenada 8 é\r\n\t	\N	0	0.44999999	480	0.2	\N	4350
29084	Podemos dizer que os ângulos que as retas – x – 2y + 6 = 0 e 2x – y + 5 = 0 fazem com o eixo das abscissas\r\n	\N	0	0.44999999	420	0.2	\N	4350
29097	Sendo duas retas onde uma faz 135 graus com o eixo das abscissas e outra que passa na origem do plano cartesiano e também pelo ponto P(-1,-4) então as retas são\r\n	\N	2	0.34999999	300	0.2	\N	4350
29111	Sendo “k” qualquer valor real, então podemos dizer que na medida em que “k” varia o ponto P(4k-1, 2k+3)\r\n	\N	1	0.44999999	540	0.2	\N	4350
29124	Sendo “t” um número real, então podemos dizer que na medida que “t” varia, o ponto P(1,t) se move\r\n	\N	0	0.30000001	240	0.2	\N	4350
29134	Dados os pontos A(x,y); B(y,x) e a reta y = x, então podemos dizer que\r\n	\N	0	0.30000001	300	0.2	\N	4350
29148	Sejam “r” e “s” as reta x=5 e ax – y – 2 = 0 respectivamente onde “a” é um número real, então podemos dizer que a tangente do menor ângulo formado pelo encontro das duas retas e a tangente do ângulo da reta “s”\r\n	\N	1	0.44999999	660	0.2	\N	4350
29167	A bissetriz que passa no ponto de encontro das retas 4x – 2y – 4 = 0 e – x – 2y + 2 = 0 é uma reta que\r\n	\N	3	0.34999999	420	0.2	\N	4350
29177	Podemos dizer que a reta perpendicular à bissetriz que passa no ponto de encontro das retas  -2x + y - 2= 0 e -x + 2y + 2 = 0\r\n	\N	3	0.44999999	600	0.2	\N	4350
29197	Podemos dizer que o lugar geométrico dos pontos eqüidistantes dos pontos (1,3) e (5,1):\r\n	\N	1	0.44999999	420	0.2	\N	4350
29207	O ângulo que a reta de coeficiente angular    -√3/3 forma com o eixo das abscissas é\r\n\t	\N	0	0.44999999	420	0.2	\N	4350
29241	Encontre o gráfico que apresenta uma reta que passa no segundo quadrante	pergunta1.gif	2	0.30000001	180	0.2	\N	4350
29260	A reta que faz 30graus com o eixo das abscissas está no gráfico:	pergunta2.gif	2	0.30000001	360	0.2	\N	4350
29270	Qual reta é perpendicular e possui um coeficiente angular igual a 4	pergunta3.gif	2	0.34999999	300	0.2	\N	4350
29284	O gráfico cuja equação não apresenta coeficiente angular é	pergunta4.gif	0	0.30000001	180	0.2	\N	4350
29294	Em qual dos gráficos os pontos são colineares	pergunta 5.gif	2	0.34999999	360	0.2	\N	4350
29304	Qual dos gráficos apresenta duas retas perpendiculares	pergunta6.gif	2	0.34999999	420	0.2	\N	4350
29231	Sabendo que o valor de m + n = 21/5, então podemos dizer que as retas de equações 2x – y + m – 2n = 0 e 3/2x – y + n – 3 = 0 são ........... no ponto P(1,2)\r\n	\N	2	0.34999999	300	0.2	\N	4350
29322	O gráfico que apresenta uma reta que não possui coeficiente linear é	pergunta 9.gif	0	0.34999999	300	0.2	\N	4350
29332	A reta bissetriz do ângulo formado pelo encontro de duas retas no ponto de abscissa 0,5 e ordenada 0,5 onde a primeira tem coeficiente angular igual a 1/3 e a outra com coeficiente angular igual a 3 é	pergunta10.gif	2	0.44999999	540	0.2	\N	4350
29342	Sendo duas retas perpendiculares no ponto de abscissa 1 e ordenada 1, onde uma passa pela origem e é bissetriz do primeiro quadrante e a outra tem coeficiente linear igual a reta	pergunta11.gif	2	0.44999999	540	0.2	\N	4350
29352	Sendo duas retas concorrentes no ponto de abscissa -1 e ordenada 2 onde uma das retas é paralela ao eixo das abscissas então a outra que faz 45 graus com essa reta terá coeficiente angular igual a reta	pergunta 12.gif	1	0.34999999	360	0.2	\N	4350
29531	Com base no gráfico:	pergunta27.gif	0	0.44999999	420	0.2	\N	4350
29362	O caminho do ponto que passa pelos pontos “A” de abscissa k e ordenada t e “B” de abscissa t e ordenada k corresponde a reta   \r\n	pergunta13.gif	1	0.44999999	480	0.2	\N	4350
29372	O coeficiente linear de uma reta que passa pelos pontos “A” de abscissa 2 e ordenada 2 e “B” de abscissa -1 e ordenada -4 está conforme o gráfico	pergunta 14.gif	0	0.30000001	240	0.2	\N	4350
29382	A reta que passa nos pontos “A” de abscissa 2 e ordenada 3 e “B” de abscissa 6 e ordenada 5 é	pergunta15.gif	2	0.30000001	240	0.2	\N	4350
29392	Podemos dizer que a reta do gráfico: \r\n	pergunta 16.gif	2	0.30000001	180	0.2	\N	4350
29429	De acordo com o gráfico:	pergunta17.gif	1	0.30000001	180	0.2	\N	4350
29444	Temos neste gráfico a reta “r” e o segmento de reta AB e podemos afirmar que \r\n\r\n	pergunt 18.gif	1	0.34999999	300	0.2	\N	4350
29454	Segundo o gráfico:	pergunta 19.gif	3	0.30000001	180	0.2	\N	4350
29464	De acordo com o gráfico:	pergunta 20.gif	1	0.34999999	240	0.2	\N	4350
29474	Segundo o gráfico onde a reta “s” é perpendicular ao eixo das abscissas e onde os ângulos “a”e “b” são	pergunta21.gif	1	0.44999999	480	0.2	\N	4350
29484	De acordo com o gráfico podemos afirmar que	pergunta 22.gif	0	0.30000001	240	0.2	\N	4350
29494	Dado o gráfico então podemos dizer que	pergunta23.gif	0	0.34999999	360	0.2	\N	4350
29504	Segundo o gráfico:	pergunta24.gif	0	0.34999999	360	0.2	\N	4350
29511	De acordo com o gráfico a reta bissetriz destas retas e que passa pelo quarto quadrante terá	pergunta25.gif	1	0.44999999	420	0.2	\N	4350
29521	Segundo o gráfico:	pergunta26.gif	1	0.44999999	480	0.2	\N	4350
29633	A equação reduzida da reta representada no gráfico é \r\n\r\n	p9.gif	3	0.30000001	240	0.2	\N	4350
29545	De acordo com o gráfico:	pergunta29.gif	1	0.34999999	360	0.2	\N	4350
29552	Segundo o gráfico:	pergunta30.gif	3	0.30000001	180	0.2	\N	4350
29559	O coeficiente angular da reta do seguinte gráfico é 	p1.gif	2	0.30000001	240	0.2	\N	4350
29569	A equação da reta representada pelo seguinte gráfico é 	p2.gif	2	0.30000001	240	0.2	\N	4350
29691	O ângulo formado por uma reta com o eixo das abscissas que passa no ponto de encontro de duas retas e no ponto “P”conforme o gráfico é	p15.gif	3	0.44999999	420	0.2	\N	4350
29579	A equação geral que representa o seguinte gráfico da reta é 	p3.gif	2	0.30000001	240	0.2	\N	4350
29586	Sabendo que a reta s é perpendicular à reta r e a reta t é paralela à reta s, então a equação das retas “s” e “t” são respectivamente	p4.gif	0	0.34999999	360	0.2	\N	4350
29644	A equação da reta representada pelo gráfico é 	p10.gif	3	0.30000001	240	0.2	\N	4350
29593	O ponto de intersecção das retas do gráfico é	p5.gif	2	0.34999999	300	0.2	\N	4350
29651	O coeficiente linear da reta perpendicular a reta do gráfico no ponto P é	p11.gif	1	0.34999999	360	0.2	\N	4350
29600	A equação geral da reta perpendicular a reta do gráfico no ponto indicado é	p6.gif	3	0.34999999	360	0.2	\N	4350
29611	A área do triângulo ABC limitado pelas retas do gráfico é\r\n\r\n	p7.gif	0	0.44999999	420	0.2	\N	4350
29661	O coeficiente linear da reta paralela a reta "r" e que passa no ponto P é	p12.gif	0	0.34999999	360	0.2	\N	4350
29671	O ponto de encontro das duas retas é	p13.gif	2	0.44999999	420	0.2	\N	4350
29681	O coeficiente linear da reta que passa no ponto de encontro das retas do gráfico e pelo ponto “P” é	p14.gif	2	0.44999999	420	0.2	\N	4350
29739	O coeficiente linear da reta do gráfico é	p19.gif	3	0.30000001	240	0.2	\N	4350
29221	A equação da reta que passa pelo ponto de abscissa dois e ordenada cinco e tem uma inclinação de 135 graus é\r\n	\N	2	0.34999999	420	0.2	\N	4350
29538	Segundo o gráfico o triângulo de maior área é	pergunta28.gif	1	0.44999999	540	0.2	\N	4350
29709	Segundo o gráfico o coeficiente angular da reta é	p16.gif	1	0.30000001	180	0.2	\N	4350
29719	Conforme o gráfico, o ângulo que a reta faz com o eixo das abscissas é	p17.gif	3	0.30000001	300	0.2	\N	4350
29763	A equação que representa corretamente o gráfico da reta é	p21.gif	1	0.34999999	360	0.2	\N	4350
29749	O ponto que pertence à reta conforme o gráfico está corretamente definido na alternativa	p20.gif	2	0.30000001	180	0.2	\N	4350
29773	Podemos dizer que o ponto de encontro das retas do gráfico é	p22.gif	3	0.34999999	420	0.2	\N	4350
29783	A equação da reta que passa pelos pontos do gráfico é	p23.gif	0	0.34999999	360	0.2	\N	4350
29793	O coeficiente linear da reta que passa pelos pontos do gráfico é	p24.gif	3	0.34999999	360	0.2	\N	4350
29803	O coeficiente angular da reta que passa pelos pontos do gráfico é	p25.gif	0	0.34999999	360	0.2	\N	4350
29813	A equação da reta perpendicular à reta do gráfico no ponto “P” é	p26.gif	1	0.44999999	480	0.2	\N	4350
29823	A equação da reta paralela a reta do gráfico e passa no ponto “P” é	p27.gif	1	0.44999999	480	0.2	\N	4350
29622	A equação geral da reta s perpendicular à reta r do gráfico é	p8.gif	0	0.44999999	420	0.2	\N	4350
29833	A equação da reta que passa pelo ponto de encontro das retas e também pela origem do plano cartesiano do gráfico é	p28.gif	2	0.44999999	480	0.2	\N	4350
29843	O coeficiente linear da reta que passa pelo ponto de encontro das retas e o ponto “P” do gráfico é	p29.gif	3	0.44999999	480	0.2	\N	4350
29853	O ângulo formado pela reta perpendicular a reta que passa pelos pontos do gráfico e pela origem do plano cartesiano é	p30.gif	0	0.44999999	540	0.2	\N	4350
29863	Qual dos gráficos possui a maior região limitada por duas retas e um eixo coordenado	pergunta7.gif	0	0.44999999	600	0.2	\N	4350
29878	Identifique o gráfico que possui maior ângulo interno formado entre as retas 	pergunta8.gif	1	0.44999999	900	0.2	\N	4350
28798	Sejam Oxy um sistema cartesiano ortogonal e o triangulo ABC, para o qual os pontos MA de abscissa 3 e ordenada 1; MB de de abscissa 0 e ordenada 5 e MC de de abscissa 2 e ordenada 3 são os pontos médios dos lados opostos aos vértices A, B e C, respectivamente, então a equação da reta suporte do lado BC do triângulo é	\N	0	0.44999999	660	0.2	\N	4350
29224	O gráfico que representa a equação 2x + y + 1 = 0 é	pg2.gif	2	0.34999999	360	0.2	\N	4350
29139	¿Cuáles son las principales ventajas de la segmentación en los procesadores MIPS?	\N	1	0.30000001	10	0.25	\N	17259
29155	En los procesadores segmentados, en determinadas circunstancias es necesario insertar operaciones NOP en el código objeto del programa. Esto se suele realizar para resolver...	\N	3	0.25	10	0.25	\N	17259
28858	Las redes de interconexión son las responsables de...	\N	3	1	120	1	\N	17259
23032	preg nodo 2 4$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>3</mn></mrow> </msup></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><mroot> <mrow><msup> <mrow><mi>y</mi></mrow> <mrow><mn>3</mn></mrow> </msup></mrow> <mrow><mn>3</mn></mrow> </mroot></math>##$	\N	0	0.89999998	123	0.1	\N	6272
29229	A equação que representa uma circunferência de raio cinco e com centro na origem é	\N	3	0.30000001	240	0.2	\N	4350
28750	O par de retas paralelas é	\N	1	0.30000001	240	0.2	\N	4350
7270	Calcular\r\n$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><mfrac> <mrow><mi> sin </mi><mfenced> <mrow><mi>y</mi></mrow> </mfenced></mrow> <mrow><msqrt> <mrow><msup> <mrow><mi>z</mi></mrow> <mrow><mi>n</mi></mrow> </msup></mrow> </msqrt></mrow> </mfrac></math>##$	\N	0	0.69999999	5	0.30000001	\N	6272
6297	question 1$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>8</mn><mo> &minus; </mo><mn>8</mn></math>##$ sajdfsfhsdfsdf $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow><mo>&int;</mo> <mrow><mi>f</mi><mo> &sdot; </mo><mi>x</mi></mrow> <mo>&DifferentialD;</mo> <mrow><mi>x</mi></mrow> </mrow></math>##$	tiksi.png	0	0.80000001	123	0.2	\N	6272
29196	O caminho percorrido pelo ponto  (2k-1, –k+3) pode ser descrito pela reta	pg1.gif	0	0.44999999	540	0.2	\N	4350
29249	Dados os pontos A(1,3) e B(2,5), então a reta que passa por esses pontos é	pg3.gif	0	0.34999999	300	0.2	\N	4350
29284	Uma circunferência de raio dois tem sua origem no eixo das ordenadas no ponto	\N	3	0.30000001	180	0.2	\N	4350
\.


--
-- Data for Name: questiongroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY questiongroups (questionid, contentgrouppropertyid, groupid) FROM stdin;
\.


--
-- Data for Name: questionresponse; Type: TABLE DATA; Schema: public; Owner: root
--

COPY questionresponse (id, response, responsetime, questionid, timeleft) FROM stdin;
5596	-1	2008-05-27 17:25:18.833	1893	108
5597	0	2008-05-27 17:25:31.172	187	109
5599	-1	2008-05-27 20:16:20.55	187	0
5600	0	2008-05-27 20:18:54.222	1893	106
5603	-1	2008-05-27 20:19:22.065	1893	0
5604	1	2008-05-27 20:21:54.101	187	108
16819	3	2008-09-27 21:37:51.759	16682	51
16820	2	2008-09-27 21:38:09.637	16532	63
16821	1	2008-09-27 21:38:26.779	16542	81
16822	2	2008-09-27 21:38:42.703	16765	60
16823	3	2008-09-27 21:38:54.67	16562	59
16824	1	2008-09-27 21:39:07.694	16754	65
16826	2	2008-09-27 21:39:31.092	16694	56
16827	2	2008-09-27 21:39:47.638	16572	63
16828	1	2008-09-27 21:40:01.173	16775	61
16829	0	2008-09-27 21:40:12.453	16522	56
19745	2	2008-10-06 17:35:28.09	15754	39
19746	3	2008-10-06 17:36:43.629	14775	41
19747	2	2008-10-06 17:37:52.023	15132	51
19748	1	2008-10-06 17:38:49.826	14765	119
19749	0	2008-10-06 17:39:59.28	14809	172
19911	-1	2008-10-06 18:08:37.788	16115	0
19912	-1	2008-10-06 18:08:50.779	16115	0
19913	-1	2008-10-06 18:08:50.995	16115	0
19914	2	2008-10-06 18:08:57.841	15449	175
19915	0	2008-10-06 18:09:55.592	15212	180
19916	1	2008-10-06 18:10:35.281	16395	168
19917	0	2008-10-06 18:11:20.261	16599	193
19918	2	2008-10-06 18:11:54.441	16072	130
20645	-1	2008-10-08 18:00:00.046	17393	0
20646	-1	2008-10-08 18:02:20.47	16921	77
20647	0	2008-10-08 18:03:05.259	17364	121
20648	0	2008-10-08 18:04:22.292	16948	165
20649	3	2008-10-08 18:05:23.391	17383	49
20650	-1	2008-10-08 18:07:56.24	17403	0
20651	1	2008-10-08 18:08:01.36	17003	198
20652	1	2008-10-08 18:09:07.709	17271	44
20653	1	2008-10-08 18:12:15.159	17354	75
20654	2	2008-10-08 18:13:49.664	17344	223
20655	3	2008-10-08 18:14:14.596	17413	83
20656	3	2008-10-08 18:17:03.221	16959	78
20658	3	2008-10-08 18:04:55.411	16971	45
20659	2	2008-10-08 18:06:19.735	16694	139
20660	2	2008-10-08 18:07:23.584	16572	105
20661	0	2008-10-08 18:09:33.22	17314	90
20662	0	2008-10-08 18:11:21.212	16522	126
20663	1	2008-10-08 18:12:01.484	17044	113
20664	2	2008-10-08 18:14:02.856	16775	153
20665	1	2008-10-08 18:15:42.703	17324	114
20666	0	2008-10-08 18:16:58.943	17087	126
20667	2	2008-10-08 18:17:33.283	17423	23
20821	3	2008-10-08 18:52:59.977	18158	120
20822	2	2008-10-08 18:53:55.577	17239	46
20823	2	2008-10-08 18:55:18.177	20412	73
20824	0	2008-10-08 18:56:11.433	17173	153
20825	3	2008-10-08 18:57:34.877	20155	100
21241	2	2008-10-10 17:44:39.299	14809	147
21242	1	2008-10-10 17:45:56.393	14765	124
21243	1	2008-10-10 17:47:08.357	14775	46
21244	2	2008-10-10 17:48:13.574	15132	57
21245	2	2008-10-10 17:49:05.736	15754	32
21247	3	2008-10-10 17:41:34.899	15744	85
21248	3	2008-10-10 17:43:57.703	15112	78
21249	0	2008-10-10 17:44:32.615	15122	43
21250	2	2008-10-10 17:45:45.596	14432	71
21251	2	2008-10-10 17:47:44.084	14169	166
21252	3	2008-10-10 17:48:38.621	14306	9
21253	2	2008-10-10 17:51:10.188	14364	203
21255	0	2008-10-10 17:45:39.737	15189	78
21256	4	2008-10-10 17:47:15.835	14169	121
21257	2	2008-10-10 17:48:58.651	14409	70
21258	0	2008-10-10 17:51:07.348	15112	61
21259	2	2008-10-10 17:51:59.991	15122	18
21422	3	2008-10-10 18:46:05.057	15449	102
21423	2	2008-10-10 18:48:24.927	15212	179
21424	1	2008-10-10 18:49:16.374	16115	114
21425	1	2008-10-10 18:50:09.52	16395	154
21426	2	2008-10-10 18:51:06.787	16599	196
21694	3	2008-10-13 18:17:38.536	18467	83
21695	1	2008-10-13 18:18:14.178	20402	74
21696	1	2008-10-13 18:18:24.111	18447	67
21697	1	2008-10-13 18:19:13.833	18437	105
21698	2	2008-10-13 18:20:42.612	18457	68
21699	2	2008-10-13 18:21:25.735	20175	107
22033	3	2008-10-14 21:29:57.206	4805	55
22034	3	2008-10-14 21:30:26.185	4697	56
22035	3	2008-10-14 21:30:53.53	4687	54
22036	3	2008-10-14 21:31:21.788	4709	57
22037	3	2008-10-14 21:31:46.495	4745	56
22039	1	2008-10-14 21:33:42.173	4775	52
22040	0	2008-10-14 21:34:16.28	4823	53
22041	0	2008-10-14 21:34:48.832	4811	48
22042	2	2008-10-14 21:35:25.67	4817	109
22043	2	2008-10-14 21:35:59.33	8143	52
22045	1	2008-10-14 21:37:18.334	4940	45
22046	3	2008-10-14 21:38:02.906	4835	55
22047	3	2008-10-14 21:38:35.522	4841	108
22048	3	2008-10-14 21:39:13.203	4847	108
22049	2	2008-10-14 21:39:50.986	4853	109
22051	2	2008-10-14 21:41:13.525	4912	99
22052	0	2008-10-14 21:42:04.241	4980	99
22053	1	2008-10-14 21:42:53.814	4974	98
22054	1	2008-10-14 21:43:45.392	4964	104
22055	1	2008-10-14 21:44:28.355	4992	94
22056	2	2008-10-14 21:45:20.28	4986	111
22057	3	2008-10-14 21:45:54.303	4906	109
22058	2	2008-10-14 21:46:29.648	4835	57
22059	2	2008-10-14 21:46:56.729	4900	57
22976	1	2008-10-20 18:32:22.318	16329	23
22977	1	2008-10-20 18:34:51.801	15988	32
22978	1	2008-10-20 18:35:28.796	16607	24
22979	-1	2008-10-20 18:35:33.644	15978	0
22980	1	2008-10-20 18:35:38.634	16646	18
22981	3	2008-10-20 18:38:31.188	16345	64
22982	2	2008-10-20 18:39:39.47	16365	95
22983	3	2008-10-20 18:40:42.706	15996	42
22984	-1	2008-10-20 18:41:08.796	16355	0
22985	1	2008-10-20 18:43:01.903	16062	27
22986	3	2008-10-20 18:44:20.908	16375	50
22987	1	2008-10-20 18:46:17.982	16335	80
22988	2	2008-10-20 18:48:03.921	16638	71
23000	0	2008-10-21 08:23:55.181	6924	4997
23001	0	2008-10-21 08:24:00.455	7254	55
23002	0	2008-10-21 08:24:07.092	7270	66
23004	0	2008-10-21 08:24:27.786	7270	66
23005	0	2008-10-21 08:24:34.189	6924	4994
23006	0	2008-10-21 08:24:42.036	7254	59
23009	0	2008-10-21 08:26:00.859	7254	58
23010	0	2008-10-21 08:26:04.80	7270	69
23012	1	2008-10-21 19:31:47.39	7254	57
23013	1	2008-10-21 19:31:57.432	7270	66
23017	1	2008-10-21 19:35:47.852	7270	66
23018	1	2008-10-21 19:35:55.744	7254	57
23116	-1	2008-10-22 16:43:23.238	15830	0
23117	-1	2008-10-22 16:45:34.989	14753	0
23118	-1	2008-10-22 16:45:56.499	14753	0
23119	-1	2008-10-22 16:45:58.097	14753	0
23120	-1	2008-10-22 16:45:58.976	14753	0
23121	-1	2008-10-22 16:45:59.497	14753	0
23122	-1	2008-10-22 16:45:59.503	14753	0
23123	-1	2008-10-22 16:46:00.582	14753	0
23124	-1	2008-10-22 16:46:15.239	14753	0
23125	-1	2008-10-22 16:47:13.591	14141	0
23126	-1	2008-10-22 16:47:18.456	14141	0
23127	2	2008-10-22 16:47:18.463	14141	72
23128	0	2008-10-22 16:50:26.086	15078	121
23129	0	2008-10-22 16:53:14.437	14745	89
23130	3	2008-10-22 16:55:15.432	15100	119
23131	2	2008-10-22 16:57:48.842	15775	117
23265	0	2008-10-22 17:36:39.409	15970	47
23266	2	2008-10-22 17:37:04.758	16020	124
23267	1	2008-10-22 17:37:37.075	15875	84
23268	2	2008-10-22 17:38:05.855	16006	63
23269	3	2008-10-22 17:39:17.207	15850	21
23270	1	2008-10-22 17:42:02.155	15909	127
23271	2	2008-10-22 17:42:37.081	15885	78
18559	2	2008-10-03 22:40:43.512	14797	1
18560	1	2008-10-03 22:41:55.783	15023	31
18561	3	2008-10-03 22:42:21.719	15031	3
18562	0	2008-10-03 22:43:14.61	13573	8
18564	-1	2008-10-03 22:44:20.454	13598	0
18565	0	2008-10-03 22:46:02.405	15809	22
18566	-1	2008-10-03 22:46:50.508	14147	0
18567	-1	2008-10-03 22:48:35.021	15819	0
18568	2	2008-10-03 22:50:49.961	15058	19
18569	-1	2008-10-03 22:51:23.111	13583	0
18570	2	2008-10-03 22:53:16.415	15787	26
18571	1	2008-10-03 22:53:55.241	15178	14
18573	3	2008-10-03 22:54:58.366	14364	2
18574	3	2008-10-03 22:56:37.794	15112	22
18575	-1	2008-10-03 22:57:16.079	15744	0
18576	0	2008-10-03 22:58:58.38	15122	25
18577	-1	2008-10-03 22:59:30.909	14432	0
18579	2	2008-10-03 23:02:06.863	15132	16
18580	1	2008-10-03 23:02:50.604	14765	6
18581	-1	2008-10-03 23:04:03.124	14809	0
18582	-1	2008-10-03 23:05:19.624	15754	0
18583	2	2008-10-03 23:06:27.352	14775	24
18585	2	2008-10-03 23:07:13.039	15830	1
18586	2	2008-10-03 23:08:13.954	15775	3
18587	-1	2008-10-03 23:09:21.913	14745	0
18588	-1	2008-10-03 23:10:42.762	14753	0
18589	2	2008-10-03 23:11:36.716	15078	41
18590	3	2008-10-03 23:12:03.444	15100	42
18592	2	2008-10-03 23:12:43.38	14785	13
18593	1	2008-10-03 23:13:43.139	14819	3
18594	-1	2008-10-03 23:14:51.475	15798	0
18595	3	2008-10-03 23:16:42.696	15224	36
18596	3	2008-10-03 23:17:25.88	15200	46
18597	0	2008-10-03 23:18:00.809	14156	11
18598	0	2008-10-03 23:19:13.617	14829	1
18599	2	2008-10-03 23:20:41.176	13607	2
18600	3	2008-10-03 23:21:46.01	15234	55
18602	3	2008-10-03 23:22:54.493	15850	22
18603	1	2008-10-03 23:23:44.30	15909	28
18604	0	2008-10-03 23:24:28.031	15840	17
18605	2	2008-10-03 23:25:22.438	16006	23
18606	-1	2008-10-03 23:26:12.812	16020	0
18607	1	2008-10-03 23:27:53.159	15875	45
18608	2	2008-10-03 23:28:16.343	15885	49
18609	0	2008-10-03 23:28:33.086	15897	4
18610	0	2008-10-03 23:29:25.293	15970	23
18613	3	2008-10-03 23:30:29.988	16042	11
18614	2	2008-10-03 23:31:27.96	16052	11
18615	1	2008-10-03 23:32:36.04	15427	5
18616	1	2008-10-03 23:33:43.802	16628	34
18617	2	2008-10-03 23:34:16.707	15403	14
18618	3	2008-10-03 23:35:09.228	15415	38
18620	1	2008-10-03 23:35:59.284	16104	13
18621	1	2008-10-03 23:37:05.38	16094	7
18622	-1	2008-10-03 23:38:21.546	16149	0
18623	0	2008-10-03 23:40:11.519	16125	3
18624	-1	2008-10-03 23:41:22.214	16083	0
18625	-1	2008-10-03 23:42:59.767	16385	0
18626	1	2008-10-03 23:44:44.978	17013	30
18627	-1	2008-10-03 23:45:39.026	16032	0
18628	-1	2008-10-03 23:47:31.136	15469	0
18629	2	2008-10-03 23:49:33.113	15459	7
19751	-1	2008-10-06 17:36:47.589	15754	0
19752	2	2008-10-06 17:36:55.615	14775	63
19753	2	2008-10-06 17:37:36.872	15132	6
19754	1	2008-10-06 17:39:19.236	14765	149
19755	0	2008-10-06 17:39:57.12	14809	182
19756	2	2008-10-06 17:40:31.815	15754	75
19921	2	2008-10-06 18:05:52.274	16032	150
19922	0	2008-10-06 18:07:16.383	16094	172
19923	2	2008-10-06 18:07:57.485	16149	134
19924	2	2008-10-06 18:08:34.006	15459	49
19925	3	2008-10-06 18:09:34.117	16385	45
19926	0	2008-10-06 18:10:38.016	16125	19
19927	3	2008-10-06 18:12:04.619	17013	59
20453	1	2008-10-08 04:03:27.205	17097	201
20454	0	2008-10-08 04:04:03.919	17163	175
20455	3	2008-10-08 04:04:31.951	16861	212
20456	0	2008-10-08 04:05:01.241	17147	182
20457	1	2008-10-08 04:05:40.885	16850	150
20458	2	2008-10-08 04:06:10.28	17107	142
20669	0	2008-10-08 18:17:39.643	17183	140
20670	1	2008-10-08 18:19:14.657	17756	62
20671	2	2008-10-08 18:20:57.644	17736	19
20672	1	2008-10-08 18:22:39.397	18477	107
20673	1	2008-10-08 18:22:59.321	20145	96
20832	1	2008-10-08 18:59:42.695	20165	109
20833	1	2008-10-08 19:01:07.60	20187	38
20834	2	2008-10-08 19:02:32.199	20199	155
21261	3	2008-10-10 17:52:46.268	15744	149
21262	3	2008-10-10 17:54:00.809	15112	80
21263	0	2008-10-10 17:54:34.293	15122	90
21264	2	2008-10-10 17:54:56.997	14432	176
21265	2	2008-10-10 17:55:12.257	14169	206
21266	3	2008-10-10 17:55:25.925	14306	142
21267	2	2008-10-10 17:55:43.432	14364	258
21428	-1	2008-10-10 18:45:09.179	15960	119
21429	4	2008-10-10 18:46:10.597	15921	3
21430	4	2008-10-10 18:48:02.405	15933	62
21431	1	2008-10-10 18:49:02.364	16139	116
21432	3	2008-10-10 18:50:02.593	16319	162
21433	3	2008-10-10 18:51:13.512	15950	123
21434	2	2008-10-10 18:51:54.539	16157	20
21435	2	2008-10-10 18:53:25.968	15438	116
21701	2	2008-10-13 18:15:23.477	17736	47
21702	4	2008-10-13 18:16:59.607	18477	97
21703	1	2008-10-13 18:17:39.819	21490	72
21704	2	2008-10-13 18:18:45.418	17756	122
21705	1	2008-10-13 18:19:26.419	17183	136
21706	1	2008-10-13 18:21:04.412	20145	62
21707	3	2008-10-13 18:22:52.444	21524	86
22061	1	2008-10-14 21:47:59.938	4426	55
22062	1	2008-10-14 21:48:36.61	4442	78
22063	3	2008-10-14 21:49:49.57	4448	108
22064	2	2008-10-14 21:50:31.118	4454	53
22066	2	2008-10-14 21:52:09.809	5076	101
22067	3	2008-10-14 21:52:55.817	5028	110
22068	3	2008-10-14 21:53:31.344	5034	107
22069	3	2008-10-14 21:54:08.707	5040	111
22070	2	2008-10-14 21:54:40.927	5046	106
23020	1	2008-10-21 19:43:54.134	7254	57
23021	1	2008-10-21 19:44:04.588	7270	59
23133	3	2008-10-22 16:43:40.371	17137	87
23134	1	2008-10-22 16:48:58.885	16682	0
23135	-1	2008-10-22 16:54:26.20	16562	0
23136	-1	2008-10-22 16:56:58.013	17054	0
23137	2	2008-10-22 16:59:15.583	17127	104
23272	0	2008-10-22 17:43:07.218	15897	88
23273	0	2008-10-22 17:43:26.039	15840	14
23275	1	2008-10-22 17:48:42.151	15921	15
23276	2	2008-10-22 17:50:16.574	15933	90
23277	3	2008-10-22 17:50:34.747	16157	84
23278	0	2008-10-22 17:50:58.947	15960	137
23279	2	2008-10-22 17:51:30.046	16139	103
23281	2	2008-10-22 17:42:09.788	17344	123
23282	2	2008-10-22 17:44:17.927	16921	123
23283	3	2008-10-22 17:45:26.733	17393	27
23284	0	2008-10-22 17:46:59.534	17364	138
23285	3	2008-10-22 17:47:54.357	16948	163
23286	0	2008-10-22 17:48:52.119	17383	100
23287	1	2008-10-22 17:50:21.364	17403	105
23288	2	2008-10-22 17:51:45.442	17003	197
24337	0	2008-10-27 12:32:31.511	7270	68
24338	0	2008-10-27 12:32:35.675	7254	59
24340	0	2008-10-27 12:32:46.951	7276	59
24342	0	2008-10-27 12:32:58.169	7276	59
24344	0	2008-10-27 12:33:06.416	23023	121
24345	0	2008-10-27 12:33:11.793	23026	122
24346	0	2008-10-27 12:33:15.381	23029	121
24347	0	2008-10-27 12:33:19.656	23032	122
24349	1	2008-10-27 12:33:28.297	6297	107
24443	2	2008-10-27 16:20:52.012	15415	65
24444	1	2008-10-27 16:22:56.616	15427	16
18631	2	2008-10-03 23:50:47.832	16599	10
18632	-1	2008-10-03 23:51:53.181	16115	0
18633	1	2008-10-03 23:53:37.717	15212	11
18634	-1	2008-10-03 23:54:52.354	16395	0
18635	3	2008-10-03 23:56:13.547	15449	2
18636	2	2008-10-03 23:57:37.36	16072	16
18638	1	2008-10-03 23:58:55.102	15438	21
18639	-1	2008-10-03 23:59:51.749	16319	0
18640	0	2008-10-04 00:01:34.367	15960	1
18641	0	2008-10-04 00:02:50.53	15921	1
18642	1	2008-10-04 00:04:04.538	15950	6
18643	3	2008-10-04 00:05:18.919	15864	27
18644	1	2008-10-04 00:06:04.207	16139	19
18645	1	2008-10-04 00:06:53.363	15933	20
18646	2	2008-10-04 00:07:39.522	16157	15
18648	-1	2008-10-04 00:08:41.418	16646	0
18649	1	2008-10-04 00:10:12.634	16062	10
18650	-1	2008-10-04 00:11:09.487	16607	0
18651	0	2008-10-04 00:12:23.742	15988	6
18652	3	2008-10-04 00:13:16.399	16335	6
18653	1	2008-10-04 00:14:28.769	15978	23
18654	2	2008-10-04 00:15:03.774	16365	8
18655	1	2008-10-04 00:16:12.528	15996	16
18656	3	2008-10-04 00:16:51.027	16375	61
18657	2	2008-10-04 00:17:08.332	16355	20
18658	2	2008-10-04 00:18:00.152	16638	17
18659	1	2008-10-04 00:18:50.539	16329	46
18660	-1	2008-10-04 00:19:15.966	16345	0
18662	-1	2008-10-04 00:21:15.824	16780	0
18663	2	2008-10-04 00:23:13.019	16552	41
18664	2	2008-10-04 00:23:48.287	16871	14
18665	0	2008-10-04 00:24:53.027	16861	47
18666	0	2008-10-04 00:25:26.183	17107	1
18667	0	2008-10-04 00:26:51.818	16799	18
18668	0	2008-10-04 00:27:47.71	16840	25
18669	2	2008-10-04 00:28:34.824	17097	9
18670	2	2008-10-04 00:29:46.995	17147	6
18671	2	2008-10-04 00:31:05.273	17163	15
18672	0	2008-10-04 00:32:14.821	17064	14
18674	0	2008-10-04 00:33:36.298	16881	30
18675	0	2008-10-04 00:34:24.707	16617	7
18676	1	2008-10-04 00:35:48.215	16891	2
18677	-1	2008-10-04 00:37:03.915	17290	0
18678	-1	2008-10-04 00:38:46.735	17304	0
18679	-1	2008-10-04 00:40:23.427	16940	0
18680	-1	2008-10-04 00:41:39.593	17334	0
18682	-1	2008-10-04 00:43:31.16	16682	0
18683	1	2008-10-04 00:44:55.786	16765	15
18684	3	2008-10-04 00:46:00.945	16562	4
18685	2	2008-10-04 00:47:17.799	16532	3
18686	1	2008-10-04 00:48:39.336	16542	35
18687	2	2008-10-04 00:49:48.232	16911	14
18688	1	2008-10-04 00:50:56.576	17054	15
18689	2	2008-10-04 00:51:59.935	17127	5
18690	1	2008-10-04 00:53:14.473	17137	13
18691	-1	2008-10-04 00:54:16.353	16754	0
18693	4	2008-10-04 00:56:15.988	16694	15
18694	3	2008-10-04 00:57:21.185	16971	50
18695	0	2008-10-04 00:57:51.939	16522	47
18696	2	2008-10-04 00:58:21.80	16572	13
18697	2	2008-10-04 00:59:31.543	16775	9
18698	2	2008-10-04 01:00:37.977	17087	52
18699	3	2008-10-04 01:01:08.218	17044	20
18700	1	2008-10-04 01:02:06.627	17324	26
18701	1	2008-10-04 01:02:59.311	17314	9
18702	0	2008-10-04 01:04:14.184	17375	48
18704	1	2008-10-04 01:04:59.504	17383	7
18705	-1	2008-10-04 01:06:38.927	17393	0
18706	0	2008-10-04 01:08:29.703	16921	16
18707	1	2008-10-04 01:09:42.775	17003	22
18708	1	2008-10-04 01:11:02.161	17271	34
18709	1	2008-10-04 01:12:43.68	17403	7
18710	1	2008-10-04 01:14:21.071	17354	52
18711	1	2008-10-04 01:14:56.573	17344	58
18712	-1	2008-10-04 01:16:08.053	16959	0
18713	3	2008-10-04 01:17:44.307	17364	17
18714	3	2008-10-04 01:19:03.785	17413	26
19760	3	2008-10-06 17:33:05.644	14306	21
19761	1	2008-10-06 17:35:31.194	14169	73
19762	1	2008-10-06 17:38:02.52	15744	68
19763	3	2008-10-06 17:40:34.714	15112	76
19764	0	2008-10-06 17:41:06.609	15122	57
19929	1	2008-10-06 18:12:49.097	15950	139
19930	1	2008-10-06 18:13:30.23	16319	110
19931	3	2008-10-06 18:13:53.098	15960	138
19932	1	2008-10-06 18:14:30.14	15921	81
19933	2	2008-10-06 18:15:01.567	15933	91
19934	0	2008-10-06 18:15:21.413	16157	91
20675	-1	2008-10-08 18:05:50.597	17271	0
20676	2	2008-10-08 18:06:14.907	16921	126
20677	0	2008-10-08 18:08:04.973	17393	44
20678	3	2008-10-08 18:09:39.208	17364	73
20679	2	2008-10-08 18:11:46.127	17383	81
20680	2	2008-10-08 18:13:41.668	17403	113
20681	2	2008-10-08 18:15:02.917	16948	19
20682	1	2008-10-08 18:18:28.498	17354	74
20683	0	2008-10-08 18:20:06.379	17003	155
20684	2	2008-10-08 18:21:54.777	17271	200
20685	1	2008-10-08 18:22:24.703	17344	203
20686	2	2008-10-08 18:23:11.035	17413	130
20687	0	2008-10-08 18:25:11.254	16959	179
20836	2	2008-10-08 18:59:37.974	17173	142
20837	2	2008-10-08 19:01:19.80	18158	122
20838	0	2008-10-08 19:02:16.419	17239	84
20839	2	2008-10-08 19:02:50.103	20412	61
20840	1	2008-10-08 19:03:39.854	20155	154
21269	2	2008-10-10 17:50:52.569	14753	33
21270	4	2008-10-10 17:52:12.551	15078	106
21271	2	2008-10-10 17:53:09.364	14141	16
21272	3	2008-10-10 17:54:45.93	15830	24
21273	0	2008-10-10 17:56:14.063	15100	98
21275	2	2008-10-10 17:54:03.835	14753	10
21276	-1	2008-10-10 17:55:52.739	15078	0
21277	4	2008-10-10 17:56:01.719	14141	60
21278	4	2008-10-10 17:56:58.026	15830	53
21279	1	2008-10-10 17:57:04.97	15100	44
21281	2	2008-10-10 17:57:35.185	13607	150
21282	3	2008-10-10 17:58:19.778	14156	106
21283	3	2008-10-10 17:59:51.745	14819	145
21284	2	2008-10-10 18:00:40.93	14785	60
21285	3	2008-10-10 18:01:33.013	15200	122
21286	2	2008-10-10 18:02:37.027	15224	176
21287	1	2008-10-10 18:03:32.792	14829	157
21288	0	2008-10-10 18:04:34.837	15234	167
21290	3	2008-10-10 17:59:25.469	13607	139
21291	2	2008-10-10 18:00:20.947	14785	61
21292	2	2008-10-10 18:01:21.606	14819	154
21293	3	2008-10-10 18:02:01.979	15200	137
21294	2	2008-10-10 18:02:50.277	14156	99
21295	2	2008-10-10 18:04:22.46	15224	195
21296	0	2008-10-10 18:04:59.10	14829	178
21297	0	2008-10-10 18:05:39.913	15234	182
21437	2	2008-10-10 18:51:59.595	15950	137
21438	4	2008-10-10 18:52:28.135	15921	52
21439	4	2008-10-10 18:53:33.863	15933	59
21440	1	2008-10-10 18:54:29.356	15960	149
21441	3	2008-10-10 18:54:52.006	16157	75
21710	3	2008-10-13 18:18:26.961	20145	116
21711	3	2008-10-13 18:19:35.345	17736	9
21712	4	2008-10-13 18:21:46.749	18477	80
21713	0	2008-10-13 18:22:41.273	21490	57
21443	1	2008-10-10 18:55:46.869	16335	111
21444	1	2008-10-10 18:57:21.20	16607	101
21445	1	2008-10-10 18:57:59.284	16345	98
21446	2	2008-10-10 18:58:42.777	15988	19
21714	0	2008-10-13 18:23:58.623	21524	72
23040	0	2008-10-21 20:06:33.753	23026	118
23041	0	2008-10-21 20:06:43.697	23023	120
23042	0	2008-10-21 20:06:52.208	23029	118
23043	0	2008-10-21 20:07:01.394	23032	120
23045	1	2008-10-21 20:07:43.585	6300	22
10011	0	2008-08-26 09:18:26.978	7254	58
10012	0	2008-08-26 09:18:30.627	6924	4998
10013	1	2008-08-26 09:18:34.645	7266	59
10014	0	2008-08-26 09:18:37.392	7270	67
10015	2	2008-08-26 09:18:41.722	6300	29
19659	4	2008-10-06 17:22:19.943	14797	122
19660	1	2008-10-06 17:23:27.541	15023	82
19661	3	2008-10-06 17:23:52.765	15031	61
19662	1	2008-10-06 17:24:43.112	13573	81
19769	0	2008-10-06 17:41:34.915	15830	45
19770	1	2008-10-06 17:42:47.896	14753	38
19771	3	2008-10-06 17:44:03.625	14141	75
19772	3	2008-10-06 17:44:46.524	15078	117
19773	1	2008-10-06 17:45:29.595	14745	93
19774	3	2008-10-06 17:45:43.319	15100	125
19775	2	2008-10-06 17:46:14.441	15775	132
19777	3	2008-10-06 17:40:41.305	15112	64
19778	0	2008-10-06 17:41:28.519	15122	48
19779	2	2008-10-06 17:42:32.441	15744	96
19780	4	2008-10-06 17:44:39.292	14169	161
19781	4	2008-10-06 17:45:36.704	14306	91
19936	3	2008-10-06 18:09:33.958	16032	184
19937	1	2008-10-06 18:10:22.55	16149	121
19938	0	2008-10-06 18:11:20.616	16094	169
19939	2	2008-10-06 18:12:01.843	15459	43
19940	3	2008-10-06 18:13:12.352	16385	60
19941	3	2008-10-06 18:14:07.275	16125	37
19942	3	2008-10-06 18:15:20.189	17013	92
20689	0	2008-10-08 18:17:06.771	16522	98
20690	2	2008-10-08 18:18:17.159	16572	106
20691	0	2008-10-08 18:20:18.753	17314	156
20692	2	2008-10-08 18:21:03.984	16694	57
20693	1	2008-10-08 18:23:23.019	17044	106
20694	1	2008-10-08 18:25:39.305	16775	202
20695	1	2008-10-08 18:26:30.701	17324	163
20696	0	2008-10-08 18:26:59.417	17087	134
20697	0	2008-10-08 18:27:26.126	17423	75
20698	3	2008-10-08 18:28:00.333	16971	60
20700	1	2008-10-08 18:24:35.731	18467	75
20701	1	2008-10-08 18:25:21.277	18437	113
20702	1	2008-10-08 18:26:42.196	18447	60
20703	4	2008-10-08 18:27:32.287	20175	147
20704	2	2008-10-08 18:28:17.352	18457	47
20705	0	2008-10-08 18:29:18.822	20402	35
20846	0	2008-10-08 19:04:14.717	17207	183
20847	2	2008-10-08 19:05:04.233	18148	112
20848	0	2008-10-08 19:06:34.69	20422	88
20850	3	2008-10-08 19:00:11.977	17249	99
20851	0	2008-10-08 19:01:48.495	17726	109
20852	2	2008-10-08 19:03:15.446	17195	21
20853	2	2008-10-08 19:04:49.323	20388	49
20854	1	2008-10-08 19:06:21.086	18168	68
20855	1	2008-10-08 19:07:22.845	18427	36
20857	-1	2008-10-08 19:08:27.027	17746	0
20858	3	2008-10-08 19:08:34.953	18489	156
20859	3	2008-10-08 19:09:20.124	18138	231
20860	1	2008-10-08 19:09:57.122	18499	216
21299	3	2008-10-10 17:56:51.052	15764	44
21300	1	2008-10-10 17:58:03.663	14775	52
21301	1	2008-10-10 17:59:09.493	14765	69
21302	2	2008-10-10 18:01:15.632	14809	148
21303	2	2008-10-10 18:02:34.001	15132	67
21304	2	2008-10-10 18:03:24.397	14409	129
21305	2	2008-10-10 18:04:26.846	15754	60
21306	1	2008-10-10 18:05:22.594	15189	82
21448	0	2008-10-10 18:54:54.328	16607	58
21449	1	2008-10-10 18:56:19.282	15988	30
21450	2	2008-10-10 18:57:11.307	15978	15
21451	1	2008-10-10 18:58:14.612	15996	47
21452	2	2008-10-10 18:58:50.354	16345	94
21716	2	2008-10-13 18:23:50.241	17173	172
21717	1	2008-10-13 18:24:45.975	18158	152
21718	3	2008-10-13 18:25:11.468	20155	197
21719	1	2008-10-13 18:25:28.634	20447	154
21720	1	2008-10-13 18:26:04.885	17239	23
21721	1	2008-10-13 18:27:42.784	21019	106
21722	3	2008-10-13 18:28:39.983	20412	84
21724	1	2008-10-13 18:24:18.612	18447	74
21725	1	2008-10-13 18:24:59.283	18437	112
21726	0	2008-10-13 18:26:22.58	20402	100
21727	2	2008-10-13 18:27:24.918	18457	70
21728	2	2008-10-13 18:28:06.057	20175	129
21729	1	2008-10-13 18:29:09.508	18467	80
22802	1	2008-10-20 16:26:00.131	15031	39
22803	1	2008-10-20 16:27:08.50	14797	55
22804	1	2008-10-20 16:29:20.578	15023	63
22805	3	2008-10-20 16:30:04.235	13573	46
23046	1	2008-10-21 20:07:57.775	7254	56
23047	0	2008-10-21 20:08:06.413	6924	4996
23048	1	2008-10-21 20:08:14.658	7266	56
23049	1	2008-10-21 20:08:22.934	7270	67
23139	1	2008-10-22 16:42:56.461	17261	91
23140	0	2008-10-22 16:48:13.911	16881	37
23141	-1	2008-10-22 16:53:55.847	16617	0
23142	-1	2008-10-22 16:56:55.904	16891	0
23143	-1	2008-10-22 16:58:34.464	17304	0
23290	3	2008-10-22 17:52:50.804	15996	40
23291	0	2008-10-22 17:53:23.912	15988	43
23292	1	2008-10-22 17:53:52.805	16607	109
23293	2	2008-10-22 17:54:14.529	16345	102
23294	0	2008-10-22 17:54:43.007	15978	37
23295	1	2008-10-22 17:55:16.403	16355	7
23296	1	2008-10-22 17:56:59.198	16062	59
23297	-1	2008-10-22 17:57:48.607	16365	141
23298	2	2008-10-22 17:58:07.695	16375	127
23299	0	2008-10-22 17:58:20.034	16329	151
23300	1	2008-10-22 17:58:36.639	16335	65
23301	1	2008-10-22 18:00:38.81	16638	77
23303	-1	2008-10-22 18:02:20.256	14819	0
23304	2	2008-10-22 18:02:37.312	14785	78
23305	2	2008-10-22 18:03:08.771	13607	146
23306	2	2008-10-22 18:03:52.342	14156	170
23307	3	2008-10-22 18:04:09.904	15200	152
23308	2	2008-10-22 18:04:35.575	15224	207
23310	2	2008-10-22 17:53:21.959	17756	63
23311	1	2008-10-22 17:54:59.166	17183	165
23312	2	2008-10-22 17:56:03.676	20145	48
23313	3	2008-10-22 17:58:06.325	22625	35
23314	1	2008-10-22 18:00:41.07	17736	6
23315	1	2008-10-22 18:02:50.161	18477	87
23316	1	2008-10-22 18:03:30.39	21490	20
23317	1	2008-10-22 18:05:18.91	21524	89
23319	2	2008-10-22 18:06:10.778	18437	65
23320	0	2008-10-22 18:08:14.196	20402	16
23321	1	2008-10-22 18:10:36.355	18447	77
23322	2	2008-10-22 18:11:07.721	20175	150
23323	0	2008-10-22 18:11:46.395	22635	99
23324	0	2008-10-22 18:13:55.189	18457	59
23325	1	2008-10-22 18:14:41.953	18467	64
23413	2	2008-10-23 16:49:44.441	4859	58
23414	3	2008-10-23 16:51:07.918	4906	115
23415	3	2008-10-23 16:52:17.293	4835	53
23416	3	2008-10-23 16:53:12.852	4841	116
23417	3	2008-10-23 16:53:41.555	4847	109
23486	3	2008-10-23 17:08:34.641	5094	110
23487	3	2008-10-23 17:09:46.32	5028	108
23488	3	2008-10-23 17:11:09.427	5034	100
23489	3	2008-10-23 17:12:37.644	5040	113
23490	3	2008-10-23 17:13:17.004	5046	116
24351	0	2008-10-27 15:56:04.923	4697	102
24352	3	2008-10-27 15:56:42.464	4751	161
24353	0	2008-10-27 15:57:20.037	4811	147
24354	1	2008-10-27 15:58:10.464	4823	169
24355	0	2008-10-27 15:58:38.209	4757	158
24356	2	2008-10-27 15:59:16.218	4817	207
24357	3	2008-10-27 16:00:05.341	8143	131
24358	2	2008-10-27 16:01:15.361	4763	172
24359	1	2008-10-27 16:01:45.871	8149	117
24360	0	2008-10-27 16:03:03.666	4769	139
24361	1	2008-10-27 16:04:04.895	8155	161
24362	0	2008-10-27 16:04:40.311	8161	156
24445	-1	2008-10-27 16:24:28.119	16628	103
24446	-1	2008-10-27 16:25:47.418	16042	60
24447	2	2008-10-27 16:26:37.908	16052	9
19664	-1	2008-10-06 17:26:00.649	15031	0
19783	2	2008-10-06 17:41:07.256	15078	101
19784	3	2008-10-06 17:42:16.576	15100	115
19785	2	2008-10-06 17:43:03.997	15775	108
19786	3	2008-10-06 17:44:01.131	14753	27
19787	2	2008-10-06 17:45:21.951	14141	36
19788	0	2008-10-06 17:46:33.28	15830	64
19945	1	2008-10-06 18:08:18.321	16020	36
19946	1	2008-10-06 18:10:14.325	15875	50
19947	0	2008-10-06 18:11:26.01	16006	54
19948	2	2008-10-06 18:12:52.91	15885	76
19949	1	2008-10-06 18:13:43.033	15850	117
19950	0	2008-10-06 18:14:36.592	15897	77
19951	2	2008-10-06 18:15:07.701	15909	122
19952	0	2008-10-06 18:15:42.455	15840	41
19953	0	2008-10-06 18:16:53.185	15970	50
24619	0	2008-10-27 17:05:03.30	21029	105
24620	1	2008-10-27 17:07:01.516	18489	92
24621	0	2008-10-27 17:08:39.713	17746	76
20497	3	2008-10-08 17:10:19.90	17147	124
20498	0	2008-10-08 17:11:56.591	17107	125
20499	0	2008-10-08 17:12:51.39	16552	59
20707	2	2008-10-08 18:19:19.874	17271	92
20708	-1	2008-10-08 18:21:47.34	16921	0
20709	3	2008-10-08 18:25:34.095	17393	27
20710	2	2008-10-08 18:27:16.941	17364	24
20711	2	2008-10-08 18:30:12.15	17383	27
20713	3	2008-10-08 18:27:04.568	18477	62
20714	1	2008-10-08 18:28:13.909	17736	21
20715	1	2008-10-08 18:29:55.257	17756	99
20716	2	2008-10-08 18:30:56.019	20145	89
20717	2	2008-10-08 18:32:17.727	17183	179
20866	2	2008-10-08 19:05:15.156	17195	40
20867	3	2008-10-08 19:06:44.985	17249	151
20868	0	2008-10-08 19:07:18.61	17726	91
20869	2	2008-10-08 19:09:10.682	20388	77
20870	1	2008-10-08 19:10:15.279	18168	43
20871	1	2008-10-08 19:11:38.962	18427	40
20873	2	2008-10-08 19:09:38.304	20165	100
20874	3	2008-10-08 19:11:02.391	20199	150
20875	2	2008-10-08 19:12:24.629	20187	50
21308	1	2008-10-10 18:07:25.249	16006	113
21309	1	2008-10-10 18:08:00.853	15875	91
21310	2	2008-10-10 18:08:18.404	16020	97
21311	2	2008-10-10 18:09:19.923	15885	83
21312	3	2008-10-10 18:09:30.958	15850	90
21313	2	2008-10-10 18:11:06.112	15909	110
21314	1	2008-10-10 18:12:06.169	15897	28
21315	3	2008-10-10 18:13:31.484	15840	62
21316	0	2008-10-10 18:14:20.819	15970	45
21531	1	2008-10-13 17:13:18.57	16780	114
21532	3	2008-10-13 17:14:17.286	16552	76
21533	3	2008-10-13 17:15:26.912	16799	58
21534	3	2008-10-13 17:16:44.832	16840	26
21535	3	2008-10-13 17:17:26.388	17064	48
21731	3	2008-10-13 18:25:35.843	18457	15
21732	0	2008-10-13 18:27:14.755	20402	81
21733	1	2008-10-13 18:28:42.963	18447	82
21734	2	2008-10-13 18:29:18.416	18437	150
21735	3	2008-10-13 18:30:04.697	18467	58
22807	1	2008-10-20 16:32:59.775	15031	50
22808	3	2008-10-20 16:33:56.06	14797	69
22809	1	2008-10-20 16:35:53.61	15023	78
22810	1	2008-10-20 16:36:21.914	13573	45
23051	1	2008-10-21 21:19:46.906	7276	56
23145	2	2008-10-22 16:59:13.238	13607	170
23146	2	2008-10-22 16:59:33.762	14156	139
23147	0	2008-10-22 17:00:26.281	14819	170
23148	2	2008-10-22 17:00:48.292	14785	41
23149	3	2008-10-22 17:01:55.863	15200	134
23150	3	2008-10-22 17:02:40.655	15224	199
23151	2	2008-10-22 17:03:10.179	14829	200
23152	2	2008-10-22 17:03:26.256	15234	202
23327	1	2008-10-22 18:21:08.669	8149	54
23328	3	2008-10-22 18:21:32.505	4751	57
23329	3	2008-10-22 18:21:53.139	4823	55
23330	2	2008-10-22 18:22:15.746	4757	50
23331	0	2008-10-22 18:22:42.455	4697	50
23333	0	2008-10-22 18:15:43.121	22645	146
23334	3	2008-10-22 18:16:56.696	18158	132
23335	1	2008-10-22 18:17:34.228	17239	89
23336	1	2008-10-22 18:18:04.455	20447	87
23337	2	2008-10-22 18:19:37.967	20412	76
23338	2	2008-10-22 18:20:09.663	21019	19
23339	0	2008-10-22 18:22:29.336	17173	132
23340	1	2008-10-22 18:23:54.678	20155	153
23342	0	2008-10-22 18:25:06.12	17726	5
23343	0	2008-10-22 18:28:08.871	21156	29
23344	3	2008-10-22 18:31:27.50	17249	30
23345	-1	2008-10-22 18:33:45.352	17195	0
23346	-1	2008-10-22 18:35:56.295	20388	0
23347	1	2008-10-22 18:38:14.841	18427	1
23348	2	2008-10-22 18:40:21.352	18168	115
23349	0	2008-10-22 18:41:16.908	21047	101
23351	4	2008-10-22 18:41:48.034	20187	43
23352	3	2008-10-22 18:42:55.027	22675	97
23353	2	2008-10-22 18:43:27.399	20165	116
23354	4	2008-10-22 18:44:30.003	20199	117
23355	2	2008-10-22 18:46:21.099	22665	99
23356	4	2008-10-22 18:47:19.312	21478	103
24364	1	2008-10-27 15:56:15.892	4775	103
24365	2	2008-10-27 15:57:51.187	4811	95
24366	3	2008-10-27 15:59:34.128	4751	127
24367	0	2008-10-27 16:00:44.464	4823	160
24368	3	2008-10-27 16:01:26.312	4817	188
24369	0	2008-10-27 16:02:34.807	4757	148
24370	1	2008-10-27 16:03:22.545	8143	153
24371	3	2008-10-27 16:04:11.862	4763	160
24372	0	2008-10-27 16:04:49.842	4721	157
24373	2	2008-10-27 16:05:30.55	4715	79
24448	1	2008-10-27 16:28:14.683	15403	75
24533	1	2008-10-27 16:47:30.991	16395	173
24534	0	2008-10-27 16:48:08.302	16115	38
24535	3	2008-10-27 16:50:15.141	15449	166
24536	0	2008-10-27 16:51:16.921	15212	186
24537	2	2008-10-27 16:51:49.623	16599	189
24538	0	2008-10-27 16:52:28.047	16072	127
24622	3	2008-10-27 17:10:01.21	18138	210
24623	0	2008-10-27 17:10:49.745	21039	89
24701	2	2008-10-27 17:27:17.18	16765	238
24702	0	2008-10-27 17:28:06.763	16542	186
24703	0	2008-10-27 17:29:25.072	16532	216
24704	2	2008-10-27 17:30:12.904	16682	43
24705	0	2008-10-27 17:32:12.074	16562	127
24706	2	2008-10-27 17:32:53.625	17054	118
24771	0	2008-10-27 17:45:08.287	17736	105
24772	1	2008-10-27 17:45:38.786	18477	105
24773	2	2008-10-27 17:46:02.347	21490	110
24774	1	2008-10-27 17:46:19.478	21524	90
24775	1	2008-10-27 17:46:53.791	17756	131
24777	1	2008-10-27 17:43:37.495	17044	206
24778	3	2008-10-27 17:44:11.663	16572	195
24779	2	2008-10-27 17:44:41.678	16694	164
24780	3	2008-10-27 17:45:07.76	17314	165
24781	0	2008-10-27 17:45:33.274	16522	136
24782	1	2008-10-27 17:45:57.953	16775	217
24783	-1	2008-10-27 17:46:29.956	17324	172
24784	3	2008-10-27 17:46:52.449	17423	162
24785	0	2008-10-27 17:46:59.436	16971	87
24786	0	2008-10-27 17:47:19.60	17087	142
24834	2	2008-10-27 17:58:37.133	20155	194
24835	3	2008-10-27 17:58:52.273	18158	152
24836	0	2008-10-27 17:59:06.80	17239	95
24837	2	2008-10-27 17:59:30.477	20412	92
24838	2	2008-10-27 17:59:45.062	21019	145
25688	2	2008-11-03 15:45:45.537	8615	208
25689	3	2008-11-03 15:46:23.536	8543	182
25690	1	2008-11-03 15:47:28.957	8482	210
25691	1	2008-11-03 15:48:04.563	8549	154
25692	1	2008-11-03 15:49:36.762	8488	230
25715	2	2008-11-03 15:58:11.275	8627	167
25716	1	2008-11-03 15:59:29.153	8633	189
25717	0	2008-11-03 16:00:25.002	8639	80
25718	1	2008-11-03 16:03:11.628	8555	192
25720	3	2008-11-03 15:51:29.656	9135	232
19666	1	2008-10-06 17:27:28.416	15023	92
19667	4	2008-10-06 17:27:57.277	14797	174
19668	3	2008-10-06 17:28:08.525	15031	85
19669	0	2008-10-06 17:28:29.969	13573	91
19793	3	2008-10-06 17:46:56.86	14809	173
19794	1	2008-10-06 17:47:44.445	14765	123
19795	2	2008-10-06 17:48:54.895	14775	75
19796	2	2008-10-06 17:49:29.63	15132	71
19797	3	2008-10-06 17:50:04.224	15754	41
19955	1	2008-10-06 18:13:28.778	15449	181
19956	2	2008-10-06 18:14:24.687	16115	66
19957	2	2008-10-06 18:16:01.34	15212	177
19958	0	2008-10-06 18:16:52.959	16395	183
19959	0	2008-10-06 18:17:22.383	16599	180
19960	0	2008-10-06 18:18:09.795	16072	125
20501	1	2008-10-08 17:14:37.345	16940	58
20502	0	2008-10-08 17:15:45.701	16881	65
20503	-1	2008-10-08 17:16:36.377	16617	149
20504	1	2008-10-08 17:17:07.358	16891	54
20505	0	2008-10-08 17:18:24.688	17290	159
20506	-1	2008-10-08 17:18:59.044	17261	0
20507	2	2008-10-08 17:22:23.08	17304	6
20508	2	2008-10-08 17:24:16.155	17334	44
20509	2	2008-10-08 17:25:19.949	17034	125
20719	3	2008-10-08 18:31:00.943	20155	154
20720	2	2008-10-08 18:31:58.211	18158	94
20721	3	2008-10-08 18:33:19.494	17239	47
20722	1	2008-10-08 18:34:50.336	20412	25
20723	0	2008-10-08 18:36:25.048	17173	165
20881	1	2008-10-08 19:13:36.641	20187	48
20882	2	2008-10-08 19:14:46.559	20165	125
20883	3	2008-10-08 19:15:39.807	20199	144
21318	2	2008-10-10 18:07:00.695	15078	113
21319	3	2008-10-10 18:08:08.806	15100	105
21320	2	2008-10-10 18:09:10.127	15775	59
21321	2	2008-10-10 18:11:00.823	14753	59
21322	1	2008-10-10 18:12:01.504	14141	27
21323	2	2008-10-10 18:13:25.446	15830	46
21324	1	2008-10-10 18:14:28.832	14745	59
21545	1	2008-10-13 17:14:20.319	17147	163
21546	1	2008-10-13 17:15:20.124	17107	137
21547	-1	2008-10-13 17:15:38.892	16780	0
21548	2	2008-10-13 17:16:03.344	16552	69
21549	-1	2008-10-13 17:16:49.921	16871	0
21550	2	2008-10-13 17:17:09.442	16799	39
21551	2	2008-10-13 17:17:43.903	16840	20
21552	3	2008-10-13 17:19:25.731	17064	15
21553	-1	2008-10-13 17:21:08.24	17117	0
21554	3	2008-10-13 17:21:14.705	17097	166
21555	1	2008-10-13 17:22:35.419	17157	64
21556	2	2008-10-13 17:23:47.772	17163	144
21557	3	2008-10-13 17:24:51.608	16861	194
21737	3	2008-10-13 18:30:25.249	18158	122
21738	1	2008-10-13 18:31:20.024	17239	100
21739	0	2008-10-13 18:31:50.367	20447	117
21740	2	2008-10-13 18:32:58.431	20412	66
21741	3	2008-10-13 18:33:47.431	21019	121
21742	0	2008-10-13 18:34:31.215	17173	180
21743	3	2008-10-13 18:35:12.508	20155	142
21745	2	2008-10-13 18:31:29.916	20155	169
21746	3	2008-10-13 18:32:17.196	18158	142
21747	2	2008-10-13 18:32:49.408	17239	76
21748	2	2008-10-13 18:33:37.708	20412	77
21749	1	2008-10-13 18:34:11.338	21019	95
21750	1	2008-10-13 18:35:18.893	17173	128
21752	2	2008-10-13 18:30:00.366	21156	192
21753	3	2008-10-13 18:30:50.568	17249	127
21754	2	2008-10-13 18:31:43.027	17195	42
21755	0	2008-10-13 18:33:18.177	17726	164
21756	1	2008-10-13 18:33:53.768	18168	46
21757	1	2008-10-13 18:36:00.303	20388	15
21758	0	2008-10-13 18:37:55.891	18427	90
21759	0	2008-10-13 18:38:41.153	21047	89
22812	0	2008-10-20 16:35:05.557	13598	44
22813	0	2008-10-20 16:37:29.477	15058	77
22814	2	2008-10-20 16:37:58.75	15809	11
22816	1	2008-10-20 16:38:28.938	13598	61
22817	0	2008-10-20 16:40:34.659	15058	54
22818	0	2008-10-20 16:41:26.787	15809	14
23053	3	2008-10-22 16:26:50.021	14797	69
23054	2	2008-10-22 16:28:48.518	15023	60
23055	3	2008-10-22 16:29:38.145	15031	73
23056	1	2008-10-22 16:30:11.525	13573	68
23154	1	2008-10-22 16:58:54.579	14775	41
23155	2	2008-10-22 17:00:03.412	14765	107
23156	0	2008-10-22 17:01:25.301	15132	5
23157	1	2008-10-22 17:03:08.747	15754	66
23158	2	2008-10-22 17:03:51.594	14809	139
23358	2	2008-10-23 00:10:06.856	4805	58
23359	2	2008-10-23 00:10:26.65	4697	56
23360	2	2008-10-23 00:10:47.901	4687	57
23361	2	2008-10-23 00:11:07.494	4751	50
23362	2	2008-10-23 00:11:33.668	4709	55
23510	3	2008-10-23 17:14:23.397	8488	59
23511	2	2008-10-23 17:14:51.20	8482	58
23512	3	2008-10-23 17:15:11.029	8494	58
23513	2	2008-10-23 17:15:31.068	8500	56
23514	3	2008-10-23 17:15:51.566	8507	58
24377	-1	2008-10-27 16:11:20.866	17163	0
24378	2	2008-10-27 16:11:37.937	17107	145
24379	3	2008-10-27 16:12:15.856	17097	187
24380	1	2008-10-27 16:13:04.741	16780	124
24381	0	2008-10-27 16:13:47.173	16552	81
24382	3	2008-10-27 16:14:23.196	16799	63
24450	1	2008-10-27 16:27:47.875	17064	55
24451	0	2008-10-27 16:28:56.339	16552	92
24452	1	2008-10-27 16:29:15.558	16799	85
24453	3	2008-10-27 16:29:43.874	16840	63
24454	1	2008-10-27 16:30:32.177	17117	44
24541	3	2008-10-27 16:27:50.498	4442	156
24542	1	2008-10-27 16:28:54.889	4476	102
24543	3	2008-10-27 16:29:34.77	4448	92
24544	0	2008-10-27 16:31:20.868	4458	86
24545	3	2008-10-27 16:33:11.846	4486	152
24546	3	2008-10-27 16:34:21.444	4539	190
24547	-1	2008-10-27 16:35:37.683	4498	0
24548	1	2008-10-27 16:35:41.403	4573	125
24549	0	2008-10-27 16:36:58.719	4549	177
24550	2	2008-10-27 16:38:22.558	4591	117
24551	3	2008-10-27 16:40:42.033	4555	172
24552	0	2008-10-27 16:42:04.004	4597	136
24553	1	2008-10-27 16:44:09.077	4561	91
24554	0	2008-10-27 16:46:50.666	4567	82
24555	2	2008-10-27 16:49:40.016	4579	102
24556	0	2008-10-27 16:52:09.711	4585	150
24625	1	2008-10-27 17:11:55.861	22665	137
24626	4	2008-10-27 17:12:21.564	20199	188
24627	1	2008-10-27 17:13:03.268	20165	149
24628	4	2008-10-27 17:13:31.817	20187	78
24629	2	2008-10-27 17:14:03.268	22675	87
24630	0	2008-10-27 17:14:44.863	21478	160
24632	-1	2008-10-27 17:01:52.035	17117	0
24633	2	2008-10-27 17:04:40.044	16552	91
24634	0	2008-10-27 17:05:14.329	17107	119
24635	0	2008-10-27 17:06:07.055	16799	24
24636	0	2008-10-27 17:07:32.506	16840	25
24637	0	2008-10-27 17:08:57.026	16780	45
24638	1	2008-10-27 17:10:52.886	17064	23
24639	0	2008-10-27 17:12:21.481	17157	75
24640	2	2008-10-27 17:12:59.306	16871	149
24641	3	2008-10-27 17:13:28.747	17097	181
24642	1	2008-10-27 17:14:08.195	17163	149
24643	2	2008-10-27 17:14:46.602	16861	198
24644	2	2008-10-27 17:15:15.241	17147	156
24708	0	2008-10-27 17:32:58.397	18138	233
24709	1	2008-10-27 17:33:31.768	18489	160
24710	1	2008-10-27 17:34:01.385	17746	124
24711	1	2008-10-27 17:34:38.898	18499	215
24712	1	2008-10-27 17:35:12.625	21039	163
24713	2	2008-10-27 17:35:36.177	21029	205
24788	0	2008-10-27 17:47:48.093	17413	230
24789	2	2008-10-27 17:48:17.58	17003	240
24790	0	2008-10-27 17:48:37.865	17383	169
24791	2	2008-10-27 17:48:56.54	17393	56
24792	3	2008-10-27 17:49:57.834	17403	175
24840	0	2008-10-27 18:00:17.074	17726	156
19672	3	2008-10-06 17:26:18.951	15058	82
19673	2	2008-10-06 17:27:01.075	15809	76
19674	2	2008-10-06 17:27:46.304	13598	111
19800	2	2008-10-06 17:47:40.568	14785	82
19801	2	2008-10-06 17:48:12.084	13607	155
19802	0	2008-10-06 17:48:52.85	14156	134
19803	1	2008-10-06 17:49:51.019	14829	187
19804	2	2008-10-06 17:50:28.063	15224	205
19805	2	2008-10-06 17:50:55.298	14819	166
19806	0	2008-10-06 17:51:15.586	15200	149
19964	2	2008-10-06 18:15:59.454	16395	188
19965	1	2008-10-06 18:16:30.491	16115	97
19966	3	2008-10-06 18:17:36.973	15449	194
19967	0	2008-10-06 18:18:16.437	15212	170
19968	0	2008-10-06 18:19:06.047	16599	174
19969	1	2008-10-06 18:20:02.812	16072	122
20511	3	2008-10-08 17:10:11.11	17064	50
20512	2	2008-10-08 17:11:23.795	17107	126
20513	3	2008-10-08 17:12:25.815	17097	148
20514	2	2008-10-08 17:14:11.523	16780	11
20515	2	2008-10-08 17:16:48.692	17163	101
20516	2	2008-10-08 17:18:32.488	16871	137
20517	1	2008-10-08 17:19:20.808	16861	182
20518	2	2008-10-08 17:20:12.987	16552	78
20519	0	2008-10-08 17:20:49.103	17147	16
20520	2	2008-10-08 17:24:04.154	16799	5
20521	1	2008-10-08 17:25:48.368	16840	25
20522	0	2008-10-08 17:27:12.554	17117	29
20733	3	2008-10-08 18:33:50.444	18447	51
20734	0	2008-10-08 18:35:14.167	18457	83
20735	1	2008-10-08 18:35:52.334	18467	72
20736	1	2008-10-08 18:36:45.32	18437	103
20737	1	2008-10-08 18:38:24.928	20402	21
20885	0	2008-10-08 19:13:59.254	20422	121
20886	2	2008-10-08 19:14:53.662	17207	181
20887	1	2008-10-08 19:15:33.457	18148	144
20888	0	2008-10-08 19:16:29.367	17217	73
20889	3	2008-10-08 19:17:16.766	17228	156
21326	-1	2008-10-10 18:06:49.999	15850	0
21327	1	2008-10-10 18:07:04.925	15875	75
21328	4	2008-10-10 18:07:56.60	16020	113
21329	1	2008-10-10 18:08:44.526	16006	66
21330	0	2008-10-10 18:09:53.547	15885	51
21331	2	2008-10-10 18:11:06.091	15897	43
21332	1	2008-10-10 18:12:20.839	15909	75
21333	2	2008-10-10 18:13:48.688	15840	44
21334	0	2008-10-10 18:14:56.892	15970	30
21563	1	2008-10-13 17:19:29.306	17261	32
21564	3	2008-10-13 17:22:25.063	16881	60
21565	3	2008-10-13 17:23:53.025	17304	29
21566	2	2008-10-13 17:25:42.241	17334	92
21567	2	2008-10-13 17:27:09.333	16940	52
21761	2	2008-10-13 18:39:32.658	20165	125
21762	3	2008-10-13 18:40:36.044	20199	193
21763	2	2008-10-13 18:41:15.288	20187	72
21764	1	2008-10-13 18:41:54.563	21478	176
22820	1	2008-10-20 16:40:03.822	14169	21
22821	0	2008-10-20 16:43:18.48	15744	13
22822	3	2008-10-20 16:46:43.053	15112	9
22823	2	2008-10-20 16:48:21.013	15122	3
22824	3	2008-10-20 16:50:05.929	14306	5
22826	4	2008-10-20 16:43:50.593	14169	100
22827	-1	2008-10-20 16:47:39.563	15744	0
22828	3	2008-10-20 16:52:08.902	15112	11
22829	-1	2008-10-20 16:53:45.455	15122	0
22830	0	2008-10-20 16:57:07.189	14306	1
23058	1	2008-10-22 16:23:38.525	17157	60
23059	-1	2008-10-22 16:24:31.836	16706	26
23060	2	2008-10-22 16:25:57.494	16552	46
23061	2	2008-10-22 16:27:06.565	17107	52
23062	3	2008-10-22 16:29:06.483	17097	125
23063	-1	2008-10-22 16:30:38.653	16780	0
23064	-1	2008-10-22 16:30:47.095	16871	0
23065	0	2008-10-22 16:30:50.994	16799	39
23160	2	2008-10-22 17:04:25.924	15909	113
23161	1	2008-10-22 17:05:15.836	15875	85
23162	3	2008-10-22 17:05:39.929	16020	100
23163	4	2008-10-22 17:06:29.032	15885	69
23164	3	2008-10-22 17:07:11.727	15897	67
23365	0	2008-10-23 15:19:39.212	4930	111
23366	2	2008-10-23 15:20:06.238	4835	57
23367	2	2008-10-23 15:20:27.543	4906	114
23368	-1	2008-10-23 15:20:51.476	4841	0
23369	3	2008-10-23 15:23:18.589	4847	114
23441	1	2008-10-23 16:56:56.014	4448	118
23442	3	2008-10-23 16:58:19.473	4527	116
23443	3	2008-10-23 16:59:40.204	4442	111
23444	3	2008-10-23 17:01:35.562	4533	56
23445	2	2008-10-23 17:02:44.301	4454	57
24384	0	2008-10-27 16:05:39.583	4745	151
24385	-1	2008-10-27 16:06:23.979	4721	0
24386	3	2008-10-27 16:06:44.474	4721	167
24387	1	2008-10-27 16:07:17.719	4751	153
24388	2	2008-10-27 16:08:01.783	4715	43
24389	-1	2008-10-27 16:09:21.427	4757	0
24390	2	2008-10-27 16:09:36.232	4687	165
24391	2	2008-10-27 16:10:12.65	4763	169
24392	2	2008-10-27 16:10:49.202	4811	154
24393	1	2008-10-27 16:11:42.934	4769	161
24394	0	2008-10-27 16:12:22.213	4697	108
24395	1	2008-10-27 16:13:09.028	4775	153
24396	3	2008-10-27 16:13:54.038	4823	168
24397	2	2008-10-27 16:14:26.474	4781	55
24398	0	2008-10-27 16:16:43.844	4703	95
24456	3	2008-10-27 16:23:14.211	20155	102
24457	3	2008-10-27 16:25:04.676	18158	86
24458	1	2008-10-27 16:26:29.65	17239	73
24459	0	2008-10-27 16:27:17.804	20447	50
24460	2	2008-10-27 16:29:31.438	20412	54
24461	2	2008-10-27 16:30:26.666	21019	86
24462	0	2008-10-27 16:31:39.124	17173	178
24463	1	2008-10-27 16:32:17.284	22645	140
24559	1	2008-10-27 16:50:12.751	20165	139
24560	4	2008-10-27 16:50:54.135	20187	25
24561	1	2008-10-27 16:52:16.701	22675	90
24562	0	2008-10-27 16:52:56.784	22665	89
24563	1	2008-10-27 16:54:06.706	20199	67
24564	0	2008-10-27 16:56:47.586	21478	144
24646	1	2008-10-27 16:56:59.137	5022	165
24647	3	2008-10-27 16:58:40.49	4964	209
24648	3	2008-10-27 16:59:38.891	4900	156
24649	0	2008-10-27 17:00:26.423	4974	213
24650	1	2008-10-27 17:01:18.215	4906	202
24651	3	2008-10-27 17:02:13.586	4980	84
24652	-1	2008-10-27 17:05:21.927	4912	0
24653	2	2008-10-27 17:05:25.139	4912	172
24654	0	2008-10-27 17:06:48.243	4986	198
24655	0	2008-10-27 17:08:07.223	4918	115
24656	1	2008-10-27 17:10:36.725	4992	157
24657	0	2008-10-27 17:12:13.243	4998	118
24658	2	2008-10-27 17:14:28.467	4924	213
24659	1	2008-10-27 17:15:07.413	4859	29
24660	3	2008-10-27 17:15:50.544	4835	153
24715	3	2008-10-27 17:16:54.814	5204	212
24716	0	2008-10-27 17:17:43.254	5148	135
24717	0	2008-10-27 17:19:49.762	5158	212
24718	2	2008-10-27 17:20:40.564	5088	182
24719	3	2008-10-27 17:21:55.45	5164	199
24720	1	2008-10-27 17:23:10.979	5170	191
24721	0	2008-10-27 17:24:17.173	5094	153
24722	1	2008-10-27 17:26:00.778	5180	187
24723	3	2008-10-27 17:27:12.30	5186	166
24724	1	2008-10-27 17:29:03.411	5192	208
24725	2	2008-10-27 17:30:16.272	5198	59
24726	0	2008-10-27 17:33:50.134	5210	133
24794	3	2008-10-27 17:32:34.833	5088	131
24795	2	2008-10-27 17:35:06.117	5028	181
24796	0	2008-10-27 17:36:40.551	5094	117
24797	0	2008-10-27 17:39:02.491	5148	126
24798	0	2008-10-27 17:41:25.825	5158	197
24799	2	2008-10-27 17:42:29.357	5100	164
24800	3	2008-10-27 17:44:16.677	5164	216
24801	3	2008-10-27 17:44:56.155	5170	197
24802	0	2008-10-27 17:45:55.193	5106	205
24803	1	2008-10-27 17:47:03.65	5180	190
24804	1	2008-10-27 17:48:28.245	5186	49
14961	1	2008-09-17 11:10:21.792	14943	27
19677	1	2008-10-06 17:25:12.569	15023	34
19678	4	2008-10-06 17:26:44.166	14797	123
19679	2	2008-10-06 17:28:03.473	15031	56
19680	0	2008-10-06 17:28:53.226	13573	84
19808	2	2008-10-06 17:42:18.199	14809	155
19809	1	2008-10-06 17:43:26.716	14765	29
19810	2	2008-10-06 17:46:08.006	14775	66
19811	2	2008-10-06 17:46:53.441	15132	73
19812	3	2008-10-06 17:47:30.393	14409	19
19813	1	2008-10-06 17:50:19.308	15754	75
19814	0	2008-10-06 17:50:53.639	15189	49
19815	2	2008-10-06 17:52:48.073	15764	23
19817	-1	2008-10-06 17:47:53.595	15840	0
19818	0	2008-10-06 17:48:03.836	15875	51
19819	2	2008-10-06 17:49:02.469	15885	72
19820	1	2008-10-06 17:49:42.027	16020	104
19821	0	2008-10-06 17:50:32.779	15897	41
19822	1	2008-10-06 17:51:41.014	16006	85
19823	2	2008-10-06 17:52:39.664	15840	67
19824	2	2008-10-06 17:53:55.088	15850	46
19825	0	2008-10-06 17:54:12.652	15970	52
19826	2	2008-10-06 17:54:39.115	15909	106
19975	-1	2008-10-06 18:16:17.894	16329	0
19976	-1	2008-10-06 18:17:00.529	15988	0
19977	-1	2008-10-06 18:17:04.911	15988	0
19978	-1	2008-10-06 18:17:13.073	15988	0
19979	1	2008-10-06 18:17:20.612	15988	49
19980	3	2008-10-06 18:17:49.104	15978	54
19981	1	2008-10-06 18:18:14.585	15996	27
19982	1	2008-10-06 18:19:04.277	16607	69
19983	3	2008-10-06 18:20:17.497	16345	94
19984	2	2008-10-06 18:21:11.894	16365	129
19985	0	2008-10-06 18:22:01.101	16355	82
19986	0	2008-10-06 18:22:43.47	16062	47
19987	3	2008-10-06 18:23:45.91	16375	138
19989	3	2008-10-06 18:20:48.909	16139	144
19990	4	2008-10-06 18:21:22.702	15921	78
19991	2	2008-10-06 18:22:08.435	15933	83
19992	1	2008-10-06 18:22:42.788	16157	65
19993	3	2008-10-06 18:23:28.53	15960	110
20524	-1	2008-10-08 17:09:14.187	17117	0
20525	3	2008-10-08 17:11:36	16552	84
20526	0	2008-10-08 17:12:15.343	16799	52
20527	0	2008-10-08 17:13:37.536	16840	5
20528	2	2008-10-08 17:15:43.464	17107	37
20529	3	2008-10-08 17:18:14.517	17097	104
20530	0	2008-10-08 17:20:27.908	16780	65
20531	3	2008-10-08 17:22:08.278	17064	19
20532	2	2008-10-08 17:23:41.063	16871	64
20533	1	2008-10-08 17:25:38.633	17163	158
20534	0	2008-10-08 17:26:17.655	17157	78
20535	3	2008-10-08 17:26:52.647	16861	188
20536	3	2008-10-08 17:27:35.134	17147	64
20739	-1	2008-10-08 18:33:52.818	17756	0
20740	1	2008-10-08 18:34:10.203	17736	20
20741	1	2008-10-08 18:36:03.433	20145	72
20742	1	2008-10-08 18:37:50.721	18477	36
20743	1	2008-10-08 18:39:34.645	17183	167
20895	3	2008-10-08 19:17:27.138	18148	127
20896	1	2008-10-08 19:18:42.409	17217	69
20897	2	2008-10-08 19:19:32.048	17207	180
20898	2	2008-10-08 19:20:19.722	17228	140
20899	0	2008-10-08 19:21:15.113	20422	121
21336	1	2008-10-10 18:16:18.109	15415	175
21337	2	2008-10-10 18:16:35.11	16042	95
21338	2	2008-10-10 18:16:51.185	16628	150
21339	2	2008-10-10 18:17:23.463	16052	29
21340	3	2008-10-10 18:18:46.293	15403	119
21569	2	2008-10-13 17:26:21.966	16940	65
21570	2	2008-10-13 17:27:32.35	16881	33
21571	3	2008-10-13 17:27:58.92	17304	71
21572	3	2008-10-13 17:29:06.174	17334	62
21573	2	2008-10-13 17:30:03.469	17290	83
21575	0	2008-10-13 17:14:36.512	17064	44
195	1	2007-11-22 19:50:34.538	187	0
21576	2	2008-10-13 17:16:12.992	16552	55
21577	2	2008-10-13 17:17:41.762	17107	121
21578	3	2008-10-13 17:18:54.575	17097	77
21579	1	2008-10-13 17:21:43.379	16780	3
21580	3	2008-10-13 17:24:54.664	16799	6
21581	0	2008-10-13 17:27:04.017	16840	63
21582	3	2008-10-13 17:28:23.717	16871	136
21583	-1	2008-10-13 17:29:29.487	17117	0
21584	0	2008-10-13 17:33:16.65	17157	68
21585	2	2008-10-13 17:34:03.705	17163	130
21586	2	2008-10-13 17:35:05.456	16861	146
21587	1	2008-10-13 17:36:29.247	17147	107
21589	3	2008-10-13 17:31:49.609	16881	90
21590	2	2008-10-13 17:32:16.704	17304	101
21591	2	2008-10-13 17:32:41.042	17334	83
21592	2	2008-10-13 17:33:13.407	16940	90
21593	0	2008-10-13 17:33:40.594	17290	48
21594	3	2008-10-13 17:36:03.523	17261	16
21595	2	2008-10-13 17:39:00.33	17034	149
21766	1	2008-10-13 18:37:27.706	21047	89
21767	-1	2008-10-13 18:38:07.264	17249	36
21768	-1	2008-10-13 18:40:31.795	20388	0
21769	0	2008-10-13 18:43:00.71	18427	98
21770	1	2008-10-13 18:43:39.467	17195	88
22832	2	2008-10-20 16:53:06.535	14775	33
22833	2	2008-10-20 16:54:21.604	15132	43
22834	2	2008-10-20 16:55:24.68	14765	17
22835	1	2008-10-20 16:58:16.709	15754	17
22836	2	2008-10-20 16:59:45.009	14809	59
23067	1	2008-10-22 16:31:23.032	15809	71
23068	2	2008-10-22 16:32:11.149	15058	60
23069	2	2008-10-22 16:33:02.727	13598	47
23166	1	2008-10-22 17:08:25.57	15403	117
23167	0	2008-10-22 17:09:22.63	16042	69
23168	2	2008-10-22 17:10:03.331	16052	76
23169	1	2008-10-22 17:10:35.306	16628	152
23170	1	2008-10-22 17:11:01.027	15415	161
23371	1	2008-10-23 15:24:46.087	5010	117
23372	2	2008-10-23 15:25:07.502	4980	117
23373	2	2008-10-23 15:25:28.95	4906	118
23374	3	2008-10-23 15:25:48.904	4835	58
23375	2	2008-10-23 15:26:09.037	4841	102
24400	0	2008-10-27 16:07:08.818	4733	165
24401	3	2008-10-27 16:07:43.454	4751	144
24402	-1	2008-10-27 16:08:43.336	4811	0
24403	-1	2008-10-27 16:09:01.437	4721	0
24404	-1	2008-10-27 16:09:17.752	4823	0
24405	1	2008-10-27 16:09:18.684	4823	159
24406	0	2008-10-27 16:10:00.798	4757	153
24407	2	2008-10-27 16:10:55.802	4817	195
24408	2	2008-10-27 16:12:00.293	8143	145
24409	3	2008-10-27 16:13:07.718	8149	133
24410	0	2008-10-27 16:14:10.417	8155	153
24411	2	2008-10-27 16:17:47.304	4763	160
24412	3	2008-10-27 16:18:25.373	8161	143
24465	3	2008-10-27 16:25:12.215	17207	100
24466	0	2008-10-27 16:27:14.976	17217	80
24467	2	2008-10-27 16:27:46.407	18148	78
24468	3	2008-10-27 16:29:39.31	22655	13
24469	3	2008-10-27 16:32:35.316	17228	146
24470	0	2008-10-27 16:33:16.082	20422	50
24566	0	2008-10-27 16:54:37.561	4986	117
24567	2	2008-10-27 16:57:03.712	4900	127
24568	0	2008-10-27 16:58:16.42	4859	32
24569	1	2008-10-27 16:59:01.568	4835	163
24570	3	2008-10-27 16:59:45.663	4841	136
24728	2	2008-10-27 17:19:51.169	5040	203
24729	1	2008-10-27 17:20:57.915	5088	162
24730	2	2008-10-27 17:22:36.27	5028	184
24731	0	2008-10-27 17:23:49.535	5094	156
24662	0	2008-10-27 17:11:39.047	4426	67
24663	1	2008-10-27 17:12:58.269	4476	111
24664	1	2008-10-27 17:13:26.263	4442	17
24665	3	2008-10-27 17:16:41.535	4448	52
24732	1	2008-10-27 17:25:45.309	5148	134
24733	2	2008-10-27 17:27:53.82	5100	209
24734	0	2008-10-27 17:29:06.025	5158	208
24735	0	2008-10-27 17:30:20.981	5106	182
24736	3	2008-10-27 17:31:33.753	5164	192
24737	3	2008-10-27 17:32:39.056	5170	204
19686	2	2008-10-06 17:29:11.681	13598	121
19687	0	2008-10-06 17:30:19.535	15058	85
19688	0	2008-10-06 17:30:42.022	15809	61
19828	2	2008-10-06 17:51:25.201	15775	88
19829	4	2008-10-06 17:52:56.493	14753	74
19830	1	2008-10-06 17:54:00.168	14141	57
19831	0	2008-10-06 17:55:17.69	15830	91
19832	2	2008-10-06 17:55:41.75	15078	132
19833	0	2008-10-06 17:56:13.39	15100	130
19834	2	2008-10-06 17:56:43.723	14745	92
19996	-1	2008-10-06 18:17:30.838	16052	0
19997	2	2008-10-06 18:19:21.18	15427	24
19998	3	2008-10-06 18:20:57.332	16042	30
19999	3	2008-10-06 18:22:19.462	16628	134
20000	3	2008-10-06 18:23:03.862	15415	121
20001	0	2008-10-06 18:24:08.684	15403	99
20538	-1	2008-10-08 17:10:57.67	16780	0
20539	2	2008-10-08 17:14:25.48	16552	89
20540	2	2008-10-08 17:14:53.982	17107	105
20541	1	2008-10-08 17:16:07.057	17097	111
20542	0	2008-10-08 17:18:07.475	17163	60
20543	2	2008-10-08 17:20:33.663	16861	110
20544	2	2008-10-08 17:22:39.114	16871	112
20545	0	2008-10-08 17:23:50.811	17147	76
20546	-1	2008-10-08 17:26:10.297	16799	0
20547	0	2008-10-08 17:29:10.488	16840	43
20548	3	2008-10-08 17:30:20.579	17064	66
20745	1	2008-10-08 18:29:04.40	17271	81
20746	0	2008-10-08 18:31:41.173	16921	21
20747	0	2008-10-08 18:34:51.515	16948	112
20748	2	2008-10-08 18:37:04.703	17364	10
20749	2	2008-10-08 18:40:27.407	17393	55
20750	1	2008-10-08 18:42:15.726	17383	45
20905	3	2008-10-08 19:18:16.453	18138	193
20906	2	2008-10-08 19:19:32.969	18489	46
20907	0	2008-10-08 19:22:03.548	18499	120
20908	1	2008-10-08 19:24:22.052	17746	56
20910	3	2008-10-08 19:22:25.761	17746	38
20911	1	2008-10-08 19:24:02.859	18489	142
20912	3	2008-10-08 19:24:53.083	18138	216
20913	3	2008-10-08 19:25:43.805	18499	205
21342	3	2008-10-10 18:17:36.075	15224	201
21343	2	2008-10-10 18:18:14.154	13607	178
21344	1	2008-10-10 18:18:41.014	14156	78
21345	0	2008-10-10 18:20:39.301	14819	142
21346	0	2008-10-10 18:21:34.79	14785	42
21348	0	2008-10-10 18:16:05.758	15403	82
21349	1	2008-10-10 18:17:43.186	15427	22
21350	1	2008-10-10 18:19:14.264	16628	120
21351	2	2008-10-10 18:20:17.197	15415	149
21352	1	2008-10-10 18:21:01.088	16042	52
21353	0	2008-10-10 18:21:59.441	16052	37
21355	2	2008-10-10 18:20:03.594	16032	146
21356	0	2008-10-10 18:21:39.563	16094	4
21357	0	2008-10-10 18:25:11.021	16149	126
21358	2	2008-10-10 18:25:56.92	15459	48
21359	1	2008-10-10 18:27:00.228	16385	49
21360	0	2008-10-10 18:28:02.394	16125	59
21361	2	2008-10-10 18:28:53.012	17013	38
21597	-1	2008-10-13 17:38:38.749	17261	0
21598	0	2008-10-13 17:39:00.299	16881	16
21599	-1	2008-10-13 17:40:42.769	17290	120
21600	2	2008-10-13 17:42:00.255	17304	45
21601	2	2008-10-13 17:43:19.805	17334	40
21602	1	2008-10-13 17:43:26.832	16940	67
21772	2	2008-10-13 18:43:03.542	18148	149
21773	1	2008-10-13 18:43:50.289	17207	178
21774	0	2008-10-13 18:44:37.37	17217	78
21775	1	2008-10-13 18:45:11.28	17228	144
21776	0	2008-10-13 18:45:57.724	20422	87
22838	2	2008-10-20 17:00:10.499	15132	7
22839	1	2008-10-20 17:01:49.76	14765	54
22840	0	2008-10-20 17:04:05.721	14809	68
22841	3	2008-10-20 17:06:35.41	14775	15
22842	3	2008-10-20 17:08:06.24	15754	13
23071	-1	2008-10-22 16:31:40.173	14797	0
23072	1	2008-10-22 16:34:47.729	15023	80
23073	3	2008-10-22 16:35:14.193	15031	74
23074	0	2008-10-22 16:35:46.982	13573	86
23172	-1	2008-10-22 17:00:43.729	16775	0
23173	1	2008-10-22 17:00:54.835	16694	97
23174	1	2008-10-22 17:02:29.072	17423	61
23175	0	2008-10-22 17:03:19.431	16522	89
23176	2	2008-10-22 17:04:32.323	16572	52
23177	1	2008-10-22 17:07:20.428	17314	127
23178	1	2008-10-22 17:08:22.86	17324	126
23179	1	2008-10-22 17:09:25.314	17044	112
23180	0	2008-10-22 17:11:21.253	17087	118
23181	0	2008-10-22 17:12:00.141	16971	42
23182	0	2008-10-22 17:13:05.781	17375	119
24414	-1	2008-10-27 16:14:42.844	15897	0
24415	1	2008-10-27 16:15:16.058	15875	63
24416	1	2008-10-27 16:16:02.509	16020	69
24417	2	2008-10-27 16:17:23.896	15885	78
24418	2	2008-10-27 16:17:57.207	16006	73
24419	3	2008-10-27 16:19:20.141	15850	140
24472	2	2008-10-27 16:20:06.065	4527	50
24473	3	2008-10-27 16:23:45.796	4539	152
24474	1	2008-10-27 16:26:04.532	4573	139
24475	0	2008-10-27 16:27:05.226	4549	170
24476	3	2008-10-27 16:28:51.965	4591	76
24477	0	2008-10-27 16:31:58.252	4597	140
24478	1	2008-10-27 16:34:16.836	4555	203
24479	1	2008-10-27 16:35:12.39	4476	91
24480	3	2008-10-27 16:37:06.295	4442	115
24481	3	2008-10-27 16:38:33.468	4486	139
24572	4	2008-10-27 16:53:19.057	15864	186
24573	-1	2008-10-27 16:53:45.355	16319	0
24574	1	2008-10-27 16:57:42.576	15960	106
24575	4	2008-10-27 16:58:46.243	15921	22
24576	2	2008-10-27 17:00:14.255	15933	76
24667	0	2008-10-27 17:16:00.769	17217	81
24668	1	2008-10-27 17:16:34.801	17207	187
24669	2	2008-10-27 17:17:08.866	18148	160
24670	3	2008-10-27 17:17:38.297	22655	141
24671	2	2008-10-27 17:18:25.623	17228	172
24672	1	2008-10-27 17:18:39.48	20422	126
24738	1	2008-10-27 17:33:43.951	5112	198
24739	1	2008-10-27 17:34:58.269	5180	183
24740	3	2008-10-27 17:36:14.748	5186	213
24741	0	2008-10-27 17:37:14.29	5192	215
24742	0	2008-10-27 17:37:54.666	5118	221
24805	1	2008-10-27 17:52:01.889	5112	194
24806	3	2008-10-27 17:53:10.077	5192	211
24808	3	2008-10-27 17:36:00.236	5118	199
24809	1	2008-10-27 17:37:24.237	5148	131
24810	2	2008-10-27 17:39:34.384	5088	129
24811	0	2008-10-27 17:41:46.399	5158	194
24812	0	2008-10-27 17:42:53.78	5094	172
24813	3	2008-10-27 17:44:26.881	5164	200
24814	1	2008-10-27 17:45:22.531	5170	174
24815	2	2008-10-27 17:47:01.746	5100	193
24816	1	2008-10-27 17:48:26.618	5180	175
24817	3	2008-10-27 17:49:46.395	5186	196
24818	0	2008-10-27 17:50:50.083	5192	189
24819	3	2008-10-27 17:52:03.443	5106	196
24820	2	2008-10-27 17:53:09.174	5028	196
24841	0	2008-10-27 18:00:50.742	21156	204
24842	3	2008-10-27 18:01:15.555	17249	150
24843	1	2008-10-27 18:01:33.397	17195	72
24844	1	2008-10-27 18:02:29.754	20388	108
24845	0	2008-10-27 18:02:48.701	18168	145
24846	2	2008-10-27 18:03:12.264	18427	106
24847	2	2008-10-27 18:03:33.614	21047	107
25694	1	2008-11-03 15:51:42.796	8567	204
25695	2	2008-11-03 15:52:24.587	8603	147
25696	3	2008-11-03 15:54:07.951	8615	164
25697	2	2008-11-03 15:55:30.257	8543	161
25698	1	2008-11-03 15:56:55.16	8482	216
25699	2	2008-11-03 15:57:27.522	8549	189
25700	3	2008-11-03 15:58:23.838	8609	197
25701	0	2008-11-03 15:59:12.234	8621	186
25702	2	2008-11-03 16:00:11.406	8627	199
25703	1	2008-11-03 16:00:56.956	8633	185
25704	2	2008-11-03 16:01:56.106	8639	180
25705	2	2008-11-03 16:03:00.799	8555	196
19697	2	2008-10-06 17:29:46.236	13598	119
19698	0	2008-10-06 17:30:54.895	15058	77
19699	0	2008-10-06 17:31:24.452	15809	22
19836	0	2008-10-06 17:52:46.521	15840	41
19837	3	2008-10-06 17:54:37.664	16020	94
19838	1	2008-10-06 17:55:46.83	15875	82
19839	1	2008-10-06 17:56:22.714	16006	86
19840	0	2008-10-06 17:57:10.577	15885	70
19841	2	2008-10-06 17:57:50.413	15897	61
19842	0	2008-10-06 17:58:36.99	15850	128
20003	0	2008-10-06 18:18:55.82	15960	104
20004	0	2008-10-06 18:20:11.262	15921	44
20005	3	2008-10-06 18:21:30.681	16139	99
20006	4	2008-10-06 18:22:37.577	15933	59
20007	1	2008-10-06 18:23:30.921	15950	98
20008	1	2008-10-06 18:24:33.169	16319	113
20009	3	2008-10-06 18:26:26.808	16157	41
20550	1	2008-10-08 17:30:27.284	16940	66
20551	0	2008-10-08 17:31:18.43	16881	65
20552	2	2008-10-08 17:32:22.218	16617	72
20553	0	2008-10-08 17:34:08.075	16891	10
20554	0	2008-10-08 17:36:09.235	17304	47
20556	-1	2008-10-08 17:31:29.574	17290	0
20557	0	2008-10-08 17:34:59.108	16881	61
20558	2	2008-10-08 17:35:52.255	17261	150
20559	2	2008-10-08 17:36:34.633	17034	83
20560	-1	2008-10-08 17:38:03.204	17304	0
20561	1	2008-10-08 17:40:15.424	17334	32
20562	1	2008-10-08 17:41:39.386	16940	7
20564	2	2008-10-08 17:26:25.375	16542	204
20565	1	2008-10-08 17:27:30.187	16682	89
20566	3	2008-10-08 17:28:53.977	16562	110
20567	1	2008-10-08 17:30:02.738	16765	161
20568	1	2008-10-08 17:32:17.372	17054	79
20569	2	2008-10-08 17:33:57.928	17076	81
20570	2	2008-10-08 17:36:19.092	16532	160
20571	1	2008-10-08 17:37:51.483	17127	63
20572	1	2008-10-08 17:39:40.034	17137	104
20573	3	2008-10-08 17:40:35.593	16911	62
20574	0	2008-10-08 17:42:25.74	17281	80
20756	2	2008-10-08 18:41:13.651	17173	138
20757	2	2008-10-08 18:42:57.881	18158	108
20758	2	2008-10-08 18:44:09.179	17239	55
20759	2	2008-10-08 18:45:25.652	20412	68
20760	0	2008-10-08 18:46:07.186	20155	122
21056	2	2008-10-09 11:09:10.499	20145	21
21057	2	2008-10-09 11:11:39.531	17183	111
21058	1	2008-10-09 11:13:37.423	17756	12
21059	-1	2008-10-09 11:16:12.571	17736	0
21060	2	2008-10-09 11:19:01.335	18477	32
21062	3	2008-10-09 11:21:10.392	20175	33
21063	1	2008-10-09 11:23:50.331	18447	74
21064	1	2008-10-09 11:24:27.607	18437	19
21065	2	2008-10-09 11:27:18.967	18457	79
21066	1	2008-10-09 11:27:49.131	18467	85
21067	-1	2008-10-09 11:28:12.014	20402	0
21069	1	2008-10-09 11:31:19.745	17239	69
21070	3	2008-10-09 11:32:15.397	18158	31
21071	1	2008-10-09 11:34:40.48	20412	46
21072	1	2008-10-09 11:35:46.916	21019	67
21073	0	2008-10-09 11:37:18.506	17173	178
21074	1	2008-10-09 11:37:58.381	20155	95
21076	1	2008-10-09 11:40:15.25	20388	21
21077	-1	2008-10-09 11:42:07.743	17249	118
21078	-1	2008-10-09 11:43:11.276	17195	0
21079	-1	2008-10-09 11:45:16.798	18168	0
21080	-1	2008-10-09 11:48:14.179	18427	29
21082	2	2008-10-09 11:52:31.585	20199	21
21083	-1	2008-10-09 11:56:02.218	20165	0
21084	-1	2008-10-09 11:59:02.183	20187	0
21086	2	2008-10-09 12:01:09.297	17207	164
21087	2	2008-10-09 12:02:05.744	18148	120
21088	3	2008-10-09 12:03:15.917	20422	47
21090	1	2008-10-09 12:05:43.142	21039	59
21091	3	2008-10-09 12:07:56.439	18138	165
21092	3	2008-10-09 12:09:35.365	18489	37
21093	3	2008-10-09 12:12:09.805	17746	31
21094	2	2008-10-09 12:13:53.643	18499	124
21363	3	2008-10-10 18:31:40.16	15909	108
21364	1	2008-10-10 18:32:52.081	15875	86
21365	1	2008-10-10 18:33:28.664	16020	109
21366	0	2008-10-10 18:34:18.744	15885	83
21367	4	2008-10-10 18:34:49.877	15897	71
21369	-1	2008-10-10 18:31:34.888	16115	0
21370	-1	2008-10-10 18:31:49.834	15449	0
21371	-1	2008-10-10 18:31:55.192	15449	0
21372	1	2008-10-10 18:32:07.779	15212	152
21373	1	2008-10-10 18:33:22.523	16395	166
21374	2	2008-10-10 18:34:10.245	16599	161
21375	1	2008-10-10 18:35:26.007	16072	145
21604	1	2008-10-13 17:39:48.525	17054	155
21605	3	2008-10-13 17:40:12.083	16765	245
21606	1	2008-10-13 17:40:54.333	16682	109
21607	3	2008-10-13 17:41:51.276	16562	100
21608	2	2008-10-13 17:43:09.331	16542	194
21609	2	2008-10-13 17:44:21	17127	132
21610	0	2008-10-13 17:45:02.727	17137	118
21611	2	2008-10-13 17:45:48.794	16911	120
21612	3	2008-10-13 17:46:40.384	16532	204
21614	0	2008-10-13 17:32:20.172	16542	65
21615	2	2008-10-13 17:35:43.683	16765	144
21616	2	2008-10-13 17:38:06.461	16532	220
21617	3	2008-10-13 17:38:53.324	16682	109
21618	3	2008-10-13 17:39:59.378	16562	18
21619	1	2008-10-13 17:42:41.644	17054	88
21620	2	2008-10-13 17:44:09.854	17127	64
21621	0	2008-10-13 17:46:07.09	17137	103
21622	0	2008-10-13 17:47:07.166	16911	39
21778	1	2008-10-13 18:44:48.482	20187	29
21779	2	2008-10-13 18:46:14.04	20165	139
21780	4	2008-10-13 18:46:56.336	20199	184
21781	2	2008-10-13 18:47:48.805	21478	183
22844	3	2008-10-20 17:02:39.837	15100	76
22845	2	2008-10-20 17:04:04.666	15078	115
22846	1	2008-10-20 17:04:48.277	15775	12
22847	2	2008-10-20 17:07:15.07	14753	17
22848	2	2008-10-20 17:08:44.931	14141	15
22849	2	2008-10-20 17:10:16.201	15830	12
22850	1	2008-10-20 17:11:49.014	14745	26
23088	4	2008-10-22 16:19:58.76	17064	4
23089	2	2008-10-22 16:21:45.855	16552	55
23090	2	2008-10-22 16:22:43.055	17107	22
23091	2	2008-10-22 16:25:11.232	17097	44
23092	2	2008-10-22 16:28:08.18	16780	2
23093	3	2008-10-22 16:30:53.608	17163	81
23094	3	2008-10-22 16:32:42.467	16871	107
23095	4	2008-10-22 16:33:54.375	16799	5
23096	1	2008-10-22 16:35:37.70	16861	180
23097	0	2008-10-22 16:36:25.021	16840	20
23098	2	2008-10-22 16:37:59.562	17147	48
23099	-1	2008-10-22 16:40:42.857	17117	0
23100	0	2008-10-22 16:40:59.654	17157	67
23077	3	2008-10-22 16:32:51.717	16891	25
23078	0	2008-10-22 16:34:26.614	16881	52
23079	-1	2008-10-22 16:36:13.228	16617	0
23080	-1	2008-10-22 16:40:19.667	17304	0
23184	1	2008-10-22 17:05:43.82	15744	46
23185	1	2008-10-22 17:08:35.276	14169	29
23186	3	2008-10-22 17:11:45.669	15112	55
23187	3	2008-10-22 17:13:34.633	15122	70
23188	1	2008-10-22 17:14:14.795	14306	50
23190	2	2008-10-22 17:11:50.875	16032	198
23191	1	2008-10-22 17:12:22.136	16094	119
23192	0	2008-10-22 17:13:56.332	16149	122
23193	3	2008-10-22 17:14:43.349	15459	59
23194	2	2008-10-22 17:15:32.123	16385	51
23195	2	2008-10-22 17:15:39.507	16125	21
23196	3	2008-10-22 17:17:04.988	17013	84
23459	1	2008-10-23 16:57:05.377	5016	73
23460	1	2008-10-23 16:59:21.843	4980	85
23461	-1	2008-10-23 17:01:56.67	4906	0
19704	3	2008-10-06 17:29:42.133	14306	101
19705	2	2008-10-06 17:30:46.875	14169	172
19706	3	2008-10-06 17:31:32.603	15744	136
19707	3	2008-10-06 17:32:57.182	15112	70
19708	2	2008-10-06 17:33:34.342	15122	50
19845	3	2008-10-06 17:56:33.964	16628	154
19846	0	2008-10-06 17:57:06.133	15427	38
19847	1	2008-10-06 17:58:27.005	16042	63
19848	3	2008-10-06 17:59:13.488	16052	51
19849	4	2008-10-06 18:00:10.007	15415	157
20017	-1	2008-10-06 18:24:54.659	13607	0
20018	2	2008-10-06 18:25:03.872	14785	163
20019	2	2008-10-06 18:25:25.009	13607	150
20020	2	2008-10-06 18:26:07.244	14156	132
20021	2	2008-10-06 18:27:08.018	14819	134
20022	2	2008-10-06 18:28:02.545	15200	155
20023	0	2008-10-06 18:28:36.376	15224	199
20024	1	2008-10-06 18:29:05.003	14829	194
20025	2	2008-10-06 18:29:09.021	15234	203
20576	3	2008-10-08 17:29:02.806	17261	3
20577	0	2008-10-08 17:32:27.972	16881	67
20578	3	2008-10-08 17:33:15.614	16617	6
20579	0	2008-10-08 17:36:14.384	17290	148
20580	0	2008-10-08 17:37:02.763	17034	4
20581	1	2008-10-08 17:39:49.906	16891	56
20582	1	2008-10-08 17:40:54.829	16584	137
20583	1	2008-10-08 17:41:27.77	17304	24
20584	1	2008-10-08 17:43:03.39	17334	21
20585	0	2008-10-08 17:44:30.076	16940	15
20766	0	2008-10-08 18:37:54.50	17726	52
20767	3	2008-10-08 18:40:38.77	17249	90
20768	2	2008-10-08 18:42:38.27	17195	22
20769	-1	2008-10-08 18:44:18.28	20388	0
20770	1	2008-10-08 18:46:47.949	18168	17
20771	1	2008-10-08 18:48:42.501	18427	41
20773	2	2008-10-08 18:41:40.118	20175	11
20774	0	2008-10-08 18:45:01.667	18437	24
20775	1	2008-10-08 18:47:55.036	18447	43
20776	2	2008-10-08 18:49:12.157	18457	84
20777	1	2008-10-08 18:49:43.20	18467	79
20778	0	2008-10-08 18:50:26.112	20402	13
20780	0	2008-10-08 18:45:33.379	20145	95
20781	1	2008-10-08 18:46:59.503	17736	54
20782	1	2008-10-08 18:48:16.73	17756	85
20783	2	2008-10-08 18:49:44.286	18477	38
20784	2	2008-10-08 18:51:26.711	17183	172
21188	3	2008-10-10 17:23:31.883	15031	21
21189	1	2008-10-10 17:25:03.356	15023	56
21190	2	2008-10-10 17:25:58.697	14797	110
21191	0	2008-10-10 17:27:25.652	13573	64
21193	1	2008-10-10 17:23:21.594	15023	20
21194	4	2008-10-10 17:24:53.79	14797	122
21195	3	2008-10-10 17:26:03.876	15031	56
21196	3	2008-10-10 17:26:56.414	13573	13
21377	0	2008-10-10 18:31:19.635	16094	138
21378	2	2008-10-10 18:32:46.832	16032	167
21379	-1	2008-10-10 18:33:56.243	16104	0
21380	1	2008-10-10 18:34:03.009	16149	120
21381	2	2008-10-10 18:34:59.166	15469	182
21382	0	2008-10-10 18:35:51.448	15459	43
21383	1	2008-10-10 18:37:02	16385	62
21384	1	2008-10-10 18:37:53.135	16125	51
21385	2	2008-10-10 18:38:57.985	17013	73
21624	1	2008-10-13 17:47:58.357	16522	71
21625	2	2008-10-13 17:53:24.486	17423	83
21626	4	2008-10-13 17:54:00.402	16971	93
21627	4	2008-10-13 17:54:22.818	16694	137
21628	2	2008-10-13 17:55:38.091	17324	151
21630	0	2008-10-13 17:45:55.778	16562	126
21631	3	2008-10-13 17:46:53.937	16682	108
21632	-1	2008-10-13 17:47:57.201	16765	196
21633	1	2008-10-13 17:53:41.937	17054	96
21634	3	2008-10-13 17:55:08.853	16542	192
21635	2	2008-10-13 17:56:42.237	17127	81
21636	3	2008-10-13 17:58:24.726	17137	105
21638	0	2008-10-13 17:53:37.913	16971	25
21639	-1	2008-10-13 17:55:31.203	17423	0
21640	2	2008-10-13 17:55:35.964	17423	70
21641	1	2008-10-13 17:56:44.283	16694	63
21642	2	2008-10-13 17:59:04.495	16522	109
21783	0	2008-10-13 18:36:44.724	17726	17
21784	0	2008-10-13 18:39:44.045	21156	58
21785	3	2008-10-13 18:42:40.562	17249	73
21786	2	2008-10-13 18:44:25.375	17195	36
21787	1	2008-10-13 18:46:05.861	18168	146
21788	1	2008-10-13 18:47:46.142	20388	82
21789	1	2008-10-13 18:48:40.448	18427	41
21790	2	2008-10-13 18:50:11.103	21047	93
21792	3	2008-10-13 18:48:46.195	18148	136
21793	0	2008-10-13 18:49:41.207	17207	171
21794	0	2008-10-13 18:50:32.265	20422	142
22852	1	2008-10-20 17:10:13.997	15078	43
22853	0	2008-10-20 17:12:09.382	14753	26
22854	-1	2008-10-20 17:13:31.356	14141	0
22855	2	2008-10-20 17:15:22.324	15830	9
22856	3	2008-10-20 17:17:00.416	15100	90
22857	3	2008-10-20 17:18:07.161	15775	66
22858	1	2008-10-20 17:19:38.675	14745	29
22860	3	2008-10-20 17:13:22.612	15200	146
22861	0	2008-10-20 17:13:57.18	14156	8
22862	1	2008-10-20 17:16:57.477	14829	167
22863	0	2008-10-20 17:17:48.947	15224	121
22864	1	2008-10-20 17:19:35.91	15234	188
22865	2	2008-10-20 17:20:15.815	13607	118
22866	1	2008-10-20 17:21:24.037	14819	135
22867	2	2008-10-20 17:22:15.773	14785	38
23082	1	2008-10-22 16:35:50.452	14306	113
23083	3	2008-10-22 16:36:36.604	15112	69
23084	0	2008-10-22 16:37:16.742	15122	11
23085	1	2008-10-22 16:39:07.164	15744	186
23086	1	2008-10-22 16:40:51.283	14169	193
23198	0	2008-10-22 17:13:57.203	17344	218
23199	0	2008-10-22 17:14:28.526	17383	64
23200	3	2008-10-22 17:16:36.111	17393	76
23201	1	2008-10-22 17:17:18.662	17403	141
23202	3	2008-10-22 17:18:06.05	17003	178
23462	1	2008-10-23 17:04:59.992	4835	52
23463	2	2008-10-23 17:05:24.152	4841	88
24421	1	2008-10-27 16:15:51.844	16617	74
24422	0	2008-10-27 16:17:32.114	16881	68
24423	1	2008-10-27 16:18:17.773	17290	125
24424	0	2008-10-27 16:19:24.048	16891	19
24425	3	2008-10-27 16:21:05.646	17304	92
24483	0	2008-10-27 16:32:19.728	16694	124
24484	0	2008-10-27 16:33:27.325	17423	73
24485	3	2008-10-27 16:34:16.805	16971	27
24486	0	2008-10-27 16:35:44.742	16522	103
24487	3	2008-10-27 16:36:42.086	16572	155
24488	1	2008-10-27 16:37:46.939	17324	133
24489	0	2008-10-27 16:38:41.687	17314	119
24490	0	2008-10-27 16:39:50.863	17087	108
24491	1	2008-10-27 16:40:41.782	17375	141
24492	1	2008-10-27 16:41:00.284	17044	155
24493	2	2008-10-27 16:42:12.674	16775	178
24579	2	2008-10-27 16:54:29.596	20175	92
24580	1	2008-10-27 16:56:09.574	22635	146
24581	3	2008-10-27 16:57:32.104	18437	130
24582	1	2008-10-27 16:58:32.516	20402	6
24583	1	2008-10-27 17:01:08.392	18447	67
24584	2	2008-10-27 17:01:49.675	18457	75
24585	1	2008-10-27 17:02:21.184	18467	77
24675	3	2008-10-27 17:16:33.626	17034	137
24676	0	2008-10-27 17:17:10.686	16881	61
24677	1	2008-10-27 17:17:58.302	17290	8
24678	1	2008-10-27 17:21:03.021	17304	50
24679	0	2008-10-27 17:22:11.181	17261	119
24680	1	2008-10-27 17:23:22.016	17334	54
24681	1	2008-10-27 17:24:17.226	16940	80
24682	3	2008-10-27 17:24:45.799	16584	44
24744	2	2008-10-27 17:37:18.571	15132	87
24745	3	2008-10-27 17:37:39.115	14765	175
24746	2	2008-10-27 17:37:52.511	14775	81
24747	0	2008-10-27 17:38:24.195	15754	73
24748	0	2008-10-27 17:38:59.901	14809	195
24822	3	2008-10-27 17:50:45.247	21490	84
24823	1	2008-10-27 17:51:31.283	17736	17
19713	-1	2008-10-06 17:34:55.442	14775	0
19852	2	2008-10-06 17:54:58.21	15775	95
19853	2	2008-10-06 17:56:19.94	14753	73
19854	2	2008-10-06 17:57:00.584	15078	116
19855	3	2008-10-06 17:57:45.044	15100	125
19856	2	2008-10-06 17:58:23.923	14141	32
19857	2	2008-10-06 17:59:40.08	15830	45
19858	1	2008-10-06 18:00:42.138	14745	58
20027	2	2008-10-06 18:27:42.857	16365	113
20028	0	2008-10-06 18:28:47.415	15988	33
20029	3	2008-10-06 18:29:54.273	16607	58
20030	-1	2008-10-06 18:31:16.517	15978	24
20587	3	2008-10-08 17:38:32.287	16532	204
20588	2	2008-10-08 17:39:26.498	16682	112
20589	3	2008-10-08 17:40:26.472	16562	105
20590	2	2008-10-08 17:41:45.63	16765	113
20591	2	2008-10-08 17:44:40.543	16542	20
20592	1	2008-10-08 17:48:43.936	17054	92
20593	-1	2008-10-08 17:50:04.994	17127	0
20594	3	2008-10-08 17:50:13.997	17127	59
20595	2	2008-10-08 17:52:13.832	17137	83
20596	0	2008-10-08 17:53:33.676	16911	108
20597	1	2008-10-08 17:54:35.107	16850	79
20598	-1	2008-10-08 17:56:02.649	16983	0
20786	2	2008-10-08 18:50:37.261	20187	37
20787	3	2008-10-08 18:51:59.297	20165	128
20788	3	2008-10-08 18:53:01.207	20199	196
21198	4	2008-10-10 17:23:31.946	14797	51
21199	0	2008-10-10 17:25:56.043	15023	39
21200	3	2008-10-10 17:27:09.34	15031	69
21201	3	2008-10-10 17:27:54.144	13573	57
21387	1	2008-10-10 18:36:07.32	16628	141
21388	4	2008-10-10 18:36:50.386	15415	120
21389	1	2008-10-10 18:38:06.035	16042	89
21390	1	2008-10-10 18:38:30.088	16052	21
21391	0	2008-10-10 18:40:02.921	15403	143
21644	3	2008-10-13 17:59:48.704	16572	159
21645	4	2008-10-13 18:01:00.422	16694	108
21646	1	2008-10-13 18:02:43.456	17423	47
21647	2	2008-10-13 18:03:56.098	16522	116
21648	3	2008-10-13 18:04:54.086	16971	53
21649	0	2008-10-13 18:06:02.839	17324	125
21650	1	2008-10-13 18:07:15.373	17087	115
21651	2	2008-10-13 18:08:09.509	17375	108
21652	2	2008-10-13 18:09:09.886	17314	94
21796	-1	2008-10-13 18:52:02.306	18138	0
21797	2	2008-10-13 18:52:17.665	18489	152
21798	3	2008-10-13 18:53:01.58	18499	221
21799	3	2008-10-13 18:53:33.828	21029	164
21800	2	2008-10-13 18:54:31.30	17746	159
21801	2	2008-10-13 18:54:36.476	21039	123
21803	0	2008-10-13 18:47:37.948	21029	124
21804	0	2008-10-13 18:49:21.001	18489	151
21805	0	2008-10-13 18:50:05.118	17746	84
21806	3	2008-10-13 18:51:24.472	18138	219
21807	1	2008-10-13 18:52:10.993	21039	64
21808	1	2008-10-13 18:54:21.212	18499	153
22869	3	2008-10-20 17:24:00.673	16020	44
22870	1	2008-10-20 17:25:46.89	15875	88
22871	1	2008-10-20 17:26:07.61	16006	20
22872	2	2008-10-20 17:27:55.793	15885	88
22873	3	2008-10-20 17:28:15.201	15850	133
22874	1	2008-10-20 17:28:50.322	15909	82
22875	0	2008-10-20 17:30:06.35	15897	81
22876	0	2008-10-20 17:30:32.242	15840	32
22877	0	2008-10-20 17:31:47.621	15970	35
23102	-1	2008-10-22 16:42:35.575	15754	0
23204	-1	2008-10-22 17:18:06.695	16115	118
23205	1	2008-10-22 17:18:47.388	15449	167
23206	0	2008-10-22 17:19:50.385	15212	167
23207	0	2008-10-22 17:20:41.073	16395	179
23208	1	2008-10-22 17:21:09.264	16599	210
24428	1	2008-10-27 16:18:03.545	4555	127
24429	1	2008-10-27 16:20:18.354	4476	92
24430	0	2008-10-27 16:21:08.416	4442	43
24431	0	2008-10-27 16:23:53.184	4448	144
24432	0	2008-10-27 16:24:47.653	4458	83
24495	1	2008-10-27 16:39:39.821	4859	40
24496	0	2008-10-27 16:40:20.167	4835	146
24497	3	2008-10-27 16:41:16.225	4841	121
24498	1	2008-10-27 16:42:35.958	4847	166
24499	3	2008-10-27 16:44:18.032	4853	130
24501	1	2008-10-27 16:30:24.679	16094	5
24502	1	2008-10-27 16:34:01.581	16104	18
24503	2	2008-10-27 16:36:24.219	16032	116
24504	0	2008-10-27 16:38:25.038	16149	21
24505	2	2008-10-27 16:40:52.601	15459	49
24506	4	2008-10-27 16:41:51.337	15469	159
24507	3	2008-10-27 16:43:00.001	16385	2
24508	0	2008-10-27 16:44:45.233	16125	67
24509	-1	2008-10-27 16:45:24.464	17013	24
24587	-1	2008-10-27 16:58:17.876	22655	0
24588	0	2008-10-27 16:58:26.301	17217	61
24589	3	2008-10-27 16:59:15.741	17207	150
24590	2	2008-10-27 17:00:25.815	18148	120
24591	1	2008-10-27 17:01:33.909	17228	138
24592	0	2008-10-27 17:02:23.141	20422	42
24684	-1	2008-10-27 17:21:57.876	4448	0
24685	-1	2008-10-27 17:23:08.266	4442	0
24686	3	2008-10-27 17:23:26.078	4442	107
24687	1	2008-10-27 17:25:00.65	4476	106
24688	2	2008-10-27 17:25:47.543	4458	67
24689	0	2008-10-27 17:28:11.247	4454	44
24690	2	2008-10-27 17:29:07.967	4436	32
24750	0	2008-10-27 17:34:14.12	15996	30
24751	0	2008-10-27 17:35:07.31	15988	42
24752	3	2008-10-27 17:35:38.853	16607	95
24753	2	2008-10-27 17:36:25.544	15978	43
24754	2	2008-10-27 17:37:04.576	16355	36
24755	3	2008-10-27 17:38:23.533	16345	22
24756	2	2008-10-27 17:40:10.20	16365	101
24757	-1	2008-10-27 17:41:05.345	16062	0
24758	2	2008-10-27 17:41:10.665	16375	72
24759	1	2008-10-27 17:42:50.503	16329	142
24761	1	2008-10-27 17:39:57.569	17127	141
24762	1	2008-10-27 17:40:26.586	16682	140
24763	3	2008-10-27 17:40:47.618	16562	144
24764	2	2008-10-27 17:41:19.422	16765	265
24765	2	2008-10-27 17:41:35.268	16542	236
24766	1	2008-10-27 17:41:59.063	17054	144
24767	1	2008-10-27 17:42:24.145	16532	228
24768	2	2008-10-27 17:42:45.168	17137	134
24769	2	2008-10-27 17:43:07.975	16911	139
24824	1	2008-10-27 17:53:26.767	17756	115
24825	0	2008-10-27 17:54:10.795	18477	92
24826	0	2008-10-27 17:54:47.084	21524	91
24828	2	2008-10-27 17:55:41.96	18447	81
24829	1	2008-10-27 17:56:09.868	20402	120
24830	0	2008-10-27 17:56:48.296	18457	84
24831	3	2008-10-27 17:57:12.474	18467	84
24832	1	2008-10-27 17:57:37.092	18437	150
24849	0	2008-10-27 18:03:57.90	22665	131
24850	4	2008-10-27 18:04:27.123	20187	71
24851	1	2008-10-27 18:05:03.741	22675	87
24852	2	2008-10-27 18:05:43.555	20165	155
24853	3	2008-10-27 18:06:05.675	20199	206
24854	4	2008-10-27 18:06:27.841	21478	166
24856	3	2008-10-27 18:08:16.288	18148	153
24857	2	2008-10-27 18:08:51.616	17207	199
24858	0	2008-10-27 18:09:08.73	22655	156
24859	1	2008-10-27 18:09:38.812	20422	148
24861	1	2008-10-27 18:10:07.22	18138	233
24862	3	2008-10-27 18:10:32.872	18499	233
24863	2	2008-10-27 18:10:47.231	21029	203
24864	1	2008-10-27 18:11:00.39	18489	176
24865	3	2008-10-27 18:11:09.478	17746	134
24866	1	2008-10-27 18:11:31.443	21039	161
25707	3	2008-11-03 15:47:07.534	8579	172
25708	2	2008-11-03 15:48:21.079	8603	64
25709	2	2008-11-03 15:51:22.366	8615	195
25710	1	2008-11-03 15:52:12.376	8543	194
25711	1	2008-11-03 15:53:06.312	8482	220
25712	2	2008-11-03 15:53:33.285	8549	172
25713	3	2008-11-03 15:54:47.98	8609	136
25714	0	2008-11-03 15:56:38.652	8621	152
15495	2	2008-09-20 02:37:03.492	14797	11
15496	1	2008-09-20 02:37:31.798	15031	19
15497	1	2008-09-20 02:37:50.425	15023	5
15498	0	2008-09-20 02:38:23.238	13573	6
15500	2	2008-09-20 02:39:16.256	15058	27
15501	0	2008-09-20 02:39:30.131	13598	39
15502	-1	2008-09-20 02:39:42.547	15178	0
15503	1	2008-09-20 02:40:24.658	14147	42
15504	1	2008-09-20 02:40:39.913	13583	55
15506	3	2008-09-20 02:41:07.452	14306	40
15507	1	2008-09-20 02:41:37.54	14169	43
15508	2	2008-09-20 02:41:48.627	14432	26
15509	0	2008-09-20 02:42:15.074	15122	17
15510	2	2008-09-20 02:42:39.648	15112	29
15511	2	2008-09-20 02:42:51.289	14364	55
15513	2	2008-09-20 02:43:17.626	14409	47
15514	1	2008-09-20 02:43:29.445	14775	27
15515	1	2008-09-20 02:43:47.828	14765	32
15516	2	2008-09-20 02:43:57.132	14809	25
15517	0	2008-09-20 02:44:08.292	15189	34
15518	2	2008-09-20 02:44:19.859	15132	24
15520	3	2008-09-20 02:44:47.532	15100	24
15521	1	2008-09-20 02:45:01.506	14180	36
15522	2	2008-09-20 02:45:14.334	14753	24
15523	2	2008-09-20 02:45:33.083	15078	27
15524	1	2008-09-20 02:45:42.526	14745	37
15525	3	2008-09-20 02:45:50.38	14141	43
15527	3	2008-09-20 02:46:11.379	15200	24
15528	1	2008-09-20 02:46:31.378	14819	27
15529	0	2008-09-20 02:46:43.598	14156	58
15530	0	2008-09-20 02:46:54.324	14829	28
15531	1	2008-09-20 02:47:13.554	15212	37
15532	0	2008-09-20 02:47:24.555	15234	42
15533	0	2008-09-20 02:47:35.532	15224	29
15537	3	2008-09-20 02:48:54.558	15415	21
15538	2	2008-09-20 02:49:13.762	15403	26
15540	2	2008-09-20 02:49:37.88	15459	32
15542	3	2008-09-20 02:49:58.019	15449	37
19716	0	2008-10-06 17:31:59.646	15122	24
19717	3	2008-10-06 17:33:23.917	15112	86
19718	-1	2008-10-06 17:33:46.659	15744	197
19719	2	2008-10-06 17:34:06.547	14169	188
19720	3	2008-10-06 17:34:34.803	14306	77
19860	1	2008-10-06 17:57:12.648	15224	157
19861	2	2008-10-06 17:58:32.721	13607	161
19862	0	2008-10-06 17:59:02.167	14156	135
19863	2	2008-10-06 17:59:57.971	14829	198
19864	0	2008-10-06 18:00:18.719	15234	210
19865	1	2008-10-06 18:00:36.08	14819	175
19866	3	2008-10-06 18:00:47.338	15200	143
19867	2	2008-10-06 18:01:20.845	14785	70
20032	0	2008-10-06 18:24:45.33	15988	28
20033	1	2008-10-06 18:25:39.162	16607	95
20034	2	2008-10-06 18:26:19.556	16345	100
20035	2	2008-10-06 18:26:58.616	15978	23
20036	3	2008-10-06 18:27:50.274	15996	44
20037	2	2008-10-06 18:28:25.181	16355	52
20038	2	2008-10-06 18:29:42.409	16365	148
20039	1	2008-10-06 18:30:08.334	16062	71
20040	0	2008-10-06 18:30:48.419	16375	8
20041	2	2008-10-06 18:33:31.35	16329	157
20042	3	2008-10-06 18:33:43.112	16335	173
20043	1	2008-10-06 18:33:55.285	16638	148
20052	2	2008-10-06 18:25:34.589	16032	152
20053	3	2008-10-06 18:27:03.661	16094	137
20054	1	2008-10-06 18:28:31.074	16104	40
20055	0	2008-10-06 18:30:40.212	15469	117
20056	0	2008-10-06 18:33:41.827	16149	106
20057	2	2008-10-06 18:34:49.823	15459	30
20058	3	2008-10-06 18:36:07.695	16385	62
20059	0	2008-10-06 18:36:55.184	16125	55
20060	1	2008-10-06 18:37:48.60	17013	12
20062	0	2008-10-06 18:39:49.286	16599	195
20063	2	2008-10-06 18:40:27.121	16115	33
20064	3	2008-10-06 18:42:34.973	15449	163
20065	1	2008-10-06 18:43:41.826	15212	109
20066	0	2008-10-06 18:45:29.809	16395	171
20067	2	2008-10-06 18:46:05.687	16072	113
20601	3	2008-10-08 17:44:08.717	16775	133
20602	2	2008-10-08 17:46:13.905	16694	99
20603	2	2008-10-08 17:47:54.541	16572	98
20604	1	2008-10-08 17:50:23.983	17314	130
20605	0	2008-10-08 17:51:34.714	16522	68
20606	1	2008-10-08 17:53:08.819	17044	166
20607	1	2008-10-08 17:54:15.24	17324	159
20608	3	2008-10-08 17:54:45.749	17087	67
20609	2	2008-10-08 17:56:18.103	17423	72
20610	3	2008-10-08 17:56:54.708	16971	34
20611	0	2008-10-08 17:58:15.053	17375	87
20794	3	2008-10-08 18:53:49.924	20422	121
20795	0	2008-10-08 18:54:42.198	17207	176
20796	1	2008-10-08 18:55:32.413	18148	174
21208	0	2008-10-10 17:29:34.608	15058	34
21209	1	2008-10-10 17:31:09.455	15809	63
21210	0	2008-10-10 17:31:56.367	13598	52
21212	1	2008-10-10 17:29:38.674	15809	16
21213	2	2008-10-10 17:31:25.541	15058	52
21214	0	2008-10-10 17:32:22.068	13598	7
21393	-1	2008-10-10 18:40:32.265	16115	0
21394	-1	2008-10-10 18:40:44.176	15449	156
21395	0	2008-10-10 18:42:02.609	15212	173
21396	0	2008-10-10 18:42:53.225	16395	172
21397	0	2008-10-10 18:43:35.223	16599	192
21398	1	2008-10-10 18:44:12.924	16072	127
21654	2	2008-10-13 17:56:58.59	16959	209
21655	2	2008-10-13 17:57:50.443	16948	169
21656	1	2008-10-13 17:58:53.648	16921	120
21657	2	2008-10-13 18:00:18.249	17393	39
21658	0	2008-10-13 18:01:49.98	17364	130
21659	2	2008-10-13 18:02:57.276	17003	231
21660	0	2008-10-13 18:03:32.643	17383	43
21661	2	2008-10-13 18:06:10.166	17403	154
21662	2	2008-10-13 18:06:49.004	17271	170
21663	1	2008-10-13 18:07:52.201	17354	111
21664	3	2008-10-13 18:08:53.336	17344	228
21665	1	2008-10-13 18:09:22.681	17413	227
21810	1	2008-10-13 18:50:57.984	20165	144
21811	2	2008-10-13 18:51:37.047	20187	45
21812	3	2008-10-13 18:52:44.516	20199	115
21813	0	2008-10-13 18:54:42.107	21478	137
22879	2	2008-10-20 17:21:08.376	15234	64
22880	3	2008-10-20 17:23:52.588	14156	65
22881	3	2008-10-20 17:25:55.837	13607	5
22882	2	2008-10-20 17:28:57.363	14785	36
22883	1	2008-10-20 17:30:09.695	14819	148
22884	3	2008-10-20 17:30:49.043	15224	181
22885	3	2008-10-20 17:31:34.567	15200	128
22886	2	2008-10-20 17:32:23	14829	150
23105	0	2008-10-22 16:36:47.866	13598	25
23106	0	2008-10-22 16:39:54.548	15058	75
23107	1	2008-10-22 16:40:57.895	15809	18
23210	3	2008-10-22 17:16:26.175	15100	80
23211	2	2008-10-22 17:17:46.851	15078	129
23212	4	2008-10-22 17:18:18.712	15775	91
23213	3	2008-10-22 17:19:30.107	14753	35
23214	0	2008-10-22 17:20:43.301	14141	18
23215	2	2008-10-22 17:22:12.294	15830	71
23216	2	2008-10-22 17:22:48.19	14745	12
23218	2	2008-10-22 17:01:08.038	16542	27
23219	2	2008-10-22 17:04:59.708	16682	31
23220	0	2008-10-22 17:07:11.535	16562	43
23221	3	2008-10-22 17:09:21.323	17054	107
23222	3	2008-10-22 17:10:24.746	17127	81
23223	2	2008-10-22 17:11:54.657	16765	107
23224	3	2008-10-22 17:14:49.833	16532	104
23225	0	2008-10-22 17:17:14.631	17137	14
23226	-1	2008-10-22 17:19:41.231	16911	0
23227	1	2008-10-22 17:23:33.135	16850	67
23228	2	2008-10-22 17:25:16.20	16983	84
23230	0	2008-10-22 17:19:56.486	17183	176
23231	1	2008-10-22 17:20:51.416	17756	129
23232	2	2008-10-22 17:21:21.43	17736	3
23233	4	2008-10-22 17:23:34.295	18477	29
23234	-1	2008-10-22 17:25:15.045	21490	0
16168	0	2008-09-21 19:01:28.932	15909	44
16169	3	2008-09-21 19:02:02.099	15850	48
16170	2	2008-09-21 19:02:27.708	16006	55
16171	4	2008-09-21 19:02:48.188	16020	58
16172	0	2008-09-21 19:03:06.357	15840	57
16173	1	2008-09-21 19:03:19.47	15427	61
16174	1	2008-09-21 19:03:36.351	15875	56
16175	2	2008-09-21 19:03:51.121	15885	54
19723	1	2008-10-06 17:36:04.124	15023	91
19724	4	2008-10-06 17:36:20.072	14797	178
19725	-1	2008-10-06 17:36:28.395	15031	95
19726	3	2008-10-06 17:36:39.406	13573	92
19869	0	2008-10-06 18:01:08.681	15415	129
19870	0	2008-10-06 18:02:10.103	16042	71
19871	2	2008-10-06 18:02:52.287	16052	22
19872	1	2008-10-06 18:04:18.533	16628	146
19873	1	2008-10-06 18:04:50.219	15403	126
19875	1	2008-10-06 18:02:20.517	15850	131
19876	1	2008-10-06 18:03:02.767	15875	69
19877	3	2008-10-06 18:03:49.582	16020	88
19878	0	2008-10-06 18:04:56.532	15885	66
19879	1	2008-10-06 18:05:44.686	15897	80
20069	3	2008-10-06 18:47:01.035	15864	176
20070	2	2008-10-06 18:47:39.142	15960	130
20071	3	2008-10-06 18:48:20.274	16319	181
20072	0	2008-10-06 18:49:10.701	16139	130
20073	4	2008-10-06 18:49:41.395	15921	38
20074	4	2008-10-06 18:50:51.608	15933	44
20075	1	2008-10-06 18:51:55.277	15950	96
20076	2	2008-10-06 18:52:55.285	16157	50
20077	2	2008-10-06 18:53:51.274	15438	128
20079	1	2008-10-06 18:54:41.064	16062	31
20080	1	2008-10-06 18:56:07.66	16607	13
20081	1	2008-10-06 18:58:10.603	16646	111
20082	3	2008-10-06 18:59:38.957	16345	95
20083	2	2008-10-06 19:00:17.807	16365	118
20084	0	2008-10-06 19:01:02.713	15988	42
20085	0	2008-10-06 19:01:34.738	16375	68
20086	3	2008-10-06 19:03:19.257	16329	131
20087	1	2008-10-06 19:03:58.26	16335	82
20088	1	2008-10-06 19:05:44.522	16638	87
20613	2	2008-10-08 17:44:05.599	16765	137
20614	2	2008-10-08 17:46:38.26	16542	47
20615	3	2008-10-08 17:50:31.879	16682	71
20616	2	2008-10-08 17:52:08.951	16532	38
20617	3	2008-10-08 17:55:45.369	16562	109
20618	2	2008-10-08 17:56:48.571	17054	79
20619	0	2008-10-08 17:58:23.547	17127	107
20620	3	2008-10-08 17:59:30.053	17137	40
20621	2	2008-10-08 18:01:47.24	16911	8
20798	2	2008-10-08 18:56:14.503	18499	224
20799	1	2008-10-08 18:56:57.964	18489	128
20800	0	2008-10-08 18:58:07.835	17746	107
20801	2	2008-10-08 18:58:35.336	18138	244
21216	0	2008-10-10 17:35:13.957	13598	166
21217	0	2008-10-10 17:35:50.201	15058	146
21218	-1	2008-10-10 17:36:10.596	15809	0
21220	0	2008-10-10 17:28:59.757	14147	44
21221	0	2008-10-10 17:31:40.51	15058	63
21222	0	2008-10-10 17:32:30.808	15809	6
21223	-1	2008-10-10 17:34:16.284	13598	0
21224	1	2008-10-10 17:34:24.984	15819	20
21225	0	2008-10-10 17:36:13.713	15178	36
21226	3	2008-10-10 17:37:48.662	15787	50
21227	1	2008-10-10 17:38:48.553	13583	148
21400	1	2008-10-10 18:41:18.108	16149	153
21401	2	2008-10-10 18:41:39.381	16032	174
21402	0	2008-10-10 18:42:38.919	16094	195
21403	3	2008-10-10 18:43:00.063	15459	51
21404	1	2008-10-10 18:44:02.334	16385	88
21405	0	2008-10-10 18:44:24.551	16125	75
21406	1	2008-10-10 18:45:00.452	17013	94
21667	0	2008-10-13 18:00:28.018	17393	9
21668	1	2008-10-13 18:02:37.30	16921	71
21669	0	2008-10-13 18:04:59.202	17364	150
21670	2	2008-10-13 18:05:48.687	16948	92
21671	3	2008-10-13 18:08:08.768	17383	146
21672	3	2008-10-13 18:09:06.764	17003	131
21673	2	2008-10-13 18:09:30.774	17403	146
21674	3	2008-10-13 18:10:20.795	17271	153
21675	0	2008-10-13 18:11:41.801	17344	218
21676	2	2008-10-13 18:12:16.879	17354	97
21677	1	2008-10-13 18:13:32.503	17413	204
21815	1	2008-10-13 18:56:25.237	20422	94
21816	0	2008-10-13 18:57:43.985	17217	41
21817	2	2008-10-13 18:58:56.217	17207	190
21818	3	2008-10-13 18:59:27.443	18148	162
21819	2	2008-10-13 18:59:56.322	17228	166
22888	1	2008-10-20 17:32:42.289	16052	4
22889	0	2008-10-20 17:34:25.843	15427	15
22890	1	2008-10-20 17:35:59.996	16042	33
22891	1	2008-10-20 17:37:16.413	16628	140
22892	2	2008-10-20 17:37:53.532	15415	54
22893	0	2008-10-20 17:40:08.252	15403	13
22895	1	2008-10-20 17:34:41.925	16006	53
22896	1	2008-10-20 17:36:01.28	15875	78
22897	1	2008-10-20 17:36:33.853	16020	38
22898	0	2008-10-20 17:38:25.808	15885	70
22899	0	2008-10-20 17:39:03.673	15897	62
22900	0	2008-10-20 17:39:49.417	15850	92
22901	0	2008-10-20 17:41:05.46	15840	22
22902	1	2008-10-20 17:42:31.955	15909	90
22903	0	2008-10-20 17:43:38.599	15970	42
22905	-1	2008-10-20 17:44:24.887	15415	0
22906	-1	2008-10-20 17:47:40.391	15427	0
22907	-1	2008-10-20 17:47:44.167	16042	0
22908	2	2008-10-20 17:47:46.07	16052	16
22909	1	2008-10-20 17:49:15.707	16628	16
22910	2	2008-10-20 17:51:53.761	15403	12
22912	0	2008-10-20 17:43:03.244	16104	29
22913	1	2008-10-20 17:45:13.873	15459	5
22914	1	2008-10-20 17:46:59.362	16385	8
22915	1	2008-10-20 17:48:43.131	16149	35
22916	1	2008-10-20 17:50:57.234	16032	41
22917	0	2008-10-20 17:54:02.61	16125	36
22918	0	2008-10-20 17:55:14.944	16094	57
22919	2	2008-10-20 17:57:44.218	15469	180
22920	1	2008-10-20 17:58:30.025	17013	53
22922	1	2008-10-20 17:59:48.577	16395	182
22923	1	2008-10-20 18:00:15.319	16115	18
22924	1	2008-10-20 18:02:36.829	15449	151
22925	2	2008-10-20 18:03:53.432	15212	165
22926	2	2008-10-20 18:04:45.279	16599	189
22928	1	2008-10-20 17:54:55.584	16032	50
22929	-1	2008-10-20 17:57:56.196	16083	0
22930	3	2008-10-20 18:01:14.153	15459	29
22931	3	2008-10-20 18:02:35.395	16385	14
22932	-1	2008-10-20 18:04:11.493	16125	0
22934	0	2008-10-20 18:05:46.342	16139	117
22935	3	2008-10-20 18:06:29.589	15921	2
22936	0	2008-10-20 18:08:18.112	15933	64
22937	2	2008-10-20 18:09:05.262	16157	9
22938	0	2008-10-20 18:10:44.047	15960	115
22940	0	2008-10-20 18:06:37.049	16599	132
22941	1	2008-10-20 18:08:15.105	16115	5
22942	-1	2008-10-20 18:10:49.355	15449	132
22943	1	2008-10-20 18:12:27.134	15212	129
22944	1	2008-10-20 18:12:29.408	16395	167
22946	1	2008-10-20 18:13:33.466	16319	2
22947	2	2008-10-20 18:17:22.315	15960	68
22948	2	2008-10-20 18:19:04.441	15864	156
22949	3	2008-10-20 18:19:56.821	16139	88
22950	4	2008-10-20 18:21:08.502	15921	36
22951	-1	2008-10-20 18:22:23.116	15933	19
16742	2	2008-09-25 22:17:21.898	8167	57
16743	1	2008-09-25 22:17:48.157	4823	47
16744	3	2008-09-25 22:18:24.791	4751	57
16745	1	2008-09-25 22:18:50.273	4811	52
13532	0	2008-09-12 00:36:15.671	13265	38
13534	1	2008-09-12 00:36:34.449	13256	58
13536	1	2008-09-12 00:36:44.41	13480	8
13538	1	2008-09-12 00:37:06.837	13277	28
13541	1	2008-09-12 00:37:43.129	13261	18
13543	0	2008-09-12 00:37:56.618	13282	2
13545	3	2008-09-12 00:38:25.615	13271	47
13550	-1	2008-09-12 01:17:39.138	13261	0
13552	3	2008-09-12 01:28:34.578	13277	27
16746	0	2008-09-25 22:19:20.617	4757	57
16747	2	2008-09-25 22:19:45.084	4817	108
16748	3	2008-09-25 22:20:18.06	8143	42
16749	2	2008-09-25 22:20:56.369	4763	58
16750	1	2008-09-25 22:21:17.773	8149	57
16751	3	2008-09-25 22:21:39.485	4769	36
16752	3	2008-09-25 22:22:22.342	4697	39
16753	3	2008-09-25 22:23:00.799	4687	58
19730	1	2008-10-06 17:37:00.327	13573	96
19731	1	2008-10-06 17:37:10.651	15023	97
19732	4	2008-10-06 17:37:19.867	14797	178
19733	3	2008-10-06 17:37:26.234	15031	98
19881	3	2008-10-06 18:01:48.406	15234	181
19882	0	2008-10-06 18:02:48.526	14156	126
19883	1	2008-10-06 18:04:00.20	14829	187
19884	3	2008-10-06 18:04:33.616	15224	204
19885	0	2008-10-06 18:05:01.081	13607	121
19886	2	2008-10-06 18:06:07.333	14785	80
19887	2	2008-10-06 18:06:34.44	14819	170
19888	3	2008-10-06 18:06:51.623	15200	115
19890	-1	2008-10-06 18:01:53.628	16385	0
19891	3	2008-10-06 18:02:05.044	15459	68
19892	3	2008-10-06 18:02:50.139	16385	93
19893	0	2008-10-06 18:03:10.469	16125	75
19894	2	2008-10-06 18:03:55.795	16104	130
19895	1	2008-10-06 18:04:27.694	17013	72
19896	2	2008-10-06 18:05:18.637	16149	129
19897	2	2008-10-06 18:05:58.733	16032	182
19898	3	2008-10-06 18:06:45.244	16094	171
19899	1	2008-10-06 18:07:20.535	15469	190
20212	2	2008-10-07 03:54:56.392	17756	121
4038	-1	2008-02-26 15:51:02.252	187	0
4039	0	2008-02-26 15:53:46.317	1893	0
4041	1	2008-02-26 19:43:23.712	187	0
4042	-1	2008-02-26 19:43:38.622	1893	0
4044	1	2008-02-26 19:54:07.618	187	0
4045	0	2008-02-26 19:54:13.50	1893	0
4191	1	2008-02-26 20:23:33.485	296	0
4192	1	2008-02-26 20:23:36.581	298	0
4193	1	2008-02-26 20:23:39.415	300	0
4197	1	2008-02-26 20:26:14.431	302	0
4198	1	2008-02-26 20:26:19.652	296	0
4199	1	2008-02-26 20:26:22.596	298	0
4200	1	2008-02-26 20:26:24.998	300	0
4203	0	2008-02-26 20:59:56.526	296	0
4204	0	2008-02-26 21:00:03.011	302	0
4205	0	2008-02-26 21:00:06.012	298	0
4206	0	2008-02-26 21:00:09.11	300	0
4337	0	2008-03-25 19:00:06.917	4329	0
4338	0	2008-03-25 19:00:12.123	4325	0
4340	0	2008-03-25 19:01:26.599	4243	0
4342	-1	2008-03-25 19:07:37.631	4243	0
4346	0	2008-03-25 19:09:59.619	4243	0
4353	0	2008-04-29 17:34:39.776	4243	0
20213	1	2008-10-07 03:55:35.871	17183	207
20214	2	2008-10-07 03:55:56.861	20145	156
20215	1	2008-10-07 03:56:08.045	17736	78
20216	1	2008-10-07 03:56:46.411	18477	114
20218	3	2008-10-07 03:57:14.662	18437	145
20219	1	2008-10-07 03:57:59.359	18447	78
20220	2	2008-10-07 03:58:29.834	20175	157
20221	2	2008-10-07 03:59:00.382	18457	96
20222	1	2008-10-07 03:59:09.842	18467	97
4397	0	2008-05-12 16:27:14.116	1893	0
4398	1	2008-05-12 16:27:22.196	187	0
20224	0	2008-10-07 03:59:33.113	17173	198
20225	3	2008-10-07 03:59:53.493	18158	156
20226	1	2008-10-07 04:00:04.399	17239	105
20227	1	2008-10-07 04:00:15.258	20155	197
20229	3	2008-10-07 04:00:37.422	17249	152
20230	0	2008-10-07 04:01:04.244	17726	175
20231	2	2008-10-07 04:01:17.487	17195	81
20232	1	2008-10-07 04:01:43.108	18168	106
20233	1	2008-10-07 04:01:52.977	18427	103
20235	1	2008-10-07 04:02:17.41	20199	182
20236	2	2008-10-07 04:03:03.364	20165	167
20237	1	2008-10-07 04:03:12.325	20187	93
20239	1	2008-10-07 04:03:35.145	17228	173
20240	2	2008-10-07 04:03:49.412	17207	203
20241	2	2008-10-07 04:04:03.843	18148	160
20242	0	2008-10-07 04:04:29.683	17217	92
20244	1	2008-10-07 04:04:51.666	17746	116
20245	2	2008-10-07 04:05:03.292	18489	177
20246	2	2008-10-07 04:05:11.784	18138	246
20247	3	2008-10-07 04:05:21.455	18499	237
20623	0	2008-10-08 17:59:48.878	17314	143
20624	1	2008-10-08 18:01:34.081	16694	106
20625	2	2008-10-08 18:03:12.363	17423	67
20626	3	2008-10-08 18:04:00.912	16971	75
20627	2	2008-10-08 18:04:40.505	16522	132
20807	2	2008-10-08 18:48:27.567	18168	30
20808	0	2008-10-08 18:50:17.509	17195	15
20809	1	2008-10-08 18:52:14.409	20388	26
20810	3	2008-10-08 18:54:02.959	17249	83
20811	3	2008-10-08 18:55:45.921	17726	90
20812	1	2008-10-08 18:57:41.361	18427	43
21229	3	2008-10-10 17:36:16.632	15744	59
21230	2	2008-10-10 17:39:17.706	15122	36
21231	3	2008-10-10 17:40:31.316	15744	149
21232	3	2008-10-10 17:41:41.792	14169	164
21233	1	2008-10-10 17:42:37.228	14306	78
21408	2	2008-10-10 18:36:54.451	16157	89
21409	2	2008-10-10 18:37:20.017	15921	15
21410	0	2008-10-10 18:39:08.823	15933	38
21411	3	2008-10-10 18:40:28.148	15960	122
21412	1	2008-10-10 18:41:24.919	16139	139
21413	2	2008-10-10 18:41:46.704	16319	59
21414	0	2008-10-10 18:44:41.67	15950	69
21679	4	2008-10-13 18:10:26.721	17183	212
21680	0	2008-10-13 18:10:49.621	17756	65
21681	-1	2008-10-13 18:12:33.836	17736	0
21682	2	2008-10-13 18:14:58.206	18477	116
21683	0	2008-10-13 18:15:15.375	20145	86
21821	0	2008-10-13 19:00:41.71	17746	77
21822	2	2008-10-13 19:02:18.847	18489	134
21823	3	2008-10-13 19:03:27.617	18138	223
21824	2	2008-10-13 19:04:13.883	21039	158
21825	3	2008-10-13 19:04:52.042	18499	217
21826	1	2008-10-13 19:05:29.657	21029	83
22953	2	2008-10-20 18:11:49.804	16355	15
22954	1	2008-10-20 18:13:24.576	16607	27
22955	0	2008-10-20 18:15:07.314	16345	24
22956	1	2008-10-20 18:16:52.783	15988	43
22957	1	2008-10-20 18:17:25.294	15978	46
22958	0	2008-10-20 18:17:50.287	16365	74
22959	3	2008-10-20 18:19:15.311	15996	38
22960	1	2008-10-20 18:19:45.448	16062	55
22961	2	2008-10-20 18:20:37.371	16375	44
22962	0	2008-10-20 18:22:43.954	16329	146
22963	1	2008-10-20 18:23:04.844	16335	72
22964	0	2008-10-20 18:24:59.639	16638	122
23112	1	2008-10-22 16:44:35.02	15809	73
23113	0	2008-10-22 16:46:25.846	15058	93
23114	2	2008-10-22 16:47:37.595	13598	149
23236	0	2008-10-22 17:24:44.888	13607	11
23237	2	2008-10-22 17:27:46.052	14785	70
23238	1	2008-10-22 17:28:27.673	14819	134
23239	3	2008-10-22 17:29:26.005	14156	88
7175	1	2008-07-31 13:12:55.22	6300	26
7176	0	2008-07-31 13:13:03.495	6924	4998
7177	1	2008-07-31 13:13:07.477	6342	58
7179	0	2008-08-01 08:41:22.102	6342	58
7180	0	2008-08-01 08:41:25.257	6924	4998
7181	0	2008-08-01 08:41:28.826	6300	28
7183	1	2008-08-01 08:41:35.045	6342	59
7184	0	2008-08-01 08:41:37.463	6924	4997
7185	1	2008-08-01 08:41:41.856	6300	29
7187	0	2008-08-01 08:50:49.424	6300	29
7188	0	2008-08-01 08:50:52.354	6924	4998
7189	1	2008-08-01 08:50:55.907	6342	59
7260	0	2008-08-05 09:27:50.673	6300	26
7261	0	2008-08-05 09:27:55.935	6924	4997
7262	0	2008-08-05 09:28:00.387	7254	57
7263	1	2008-08-05 09:28:04.827	6342	56
13555	2	2008-09-12 01:29:32.015	13480	9
16812	1	2008-09-27 21:36:07.302	16706	49
16813	1	2008-09-27 21:36:27.29	16780	49
16814	2	2008-09-27 21:36:45.047	16552	51
16815	4	2008-09-27 21:37:02.086	16799	58
16817	1	2008-09-27 21:37:27.365	16584	62
19741	0	2008-10-06 17:38:07.813	15058	91
19742	0	2008-10-06 17:38:26.237	15809	90
19743	2	2008-10-06 17:38:42.005	13598	94
19902	2	2008-10-06 18:06:38.853	16042	91
19903	1	2008-10-06 18:06:57.289	16628	162
19904	0	2008-10-06 18:07:16.347	15415	154
19905	0	2008-10-06 18:07:50.273	16052	69
19906	3	2008-10-06 18:08:29.271	15403	127
20630	2	2008-10-08 17:46:24.265	17127	79
20631	2	2008-10-08 17:48:11.103	16682	103
20632	3	2008-10-08 17:49:17.463	16562	54
20633	2	2008-10-08 17:51:27.005	16765	165
20634	2	2008-10-08 17:53:36.96	16542	3
20635	2	2008-10-08 17:57:56.549	17054	74
20636	3	2008-10-08 17:59:56.458	17137	90
20637	2	2008-10-08 18:01:24.23	16911	35
20638	0	2008-10-08 18:03:44.052	17076	149
20639	1	2008-10-08 18:04:48.736	17281	26
20640	2	2008-10-08 18:07:18.497	16532	52
20641	1	2008-10-08 18:10:39.01	16850	105
20642	0	2008-10-08 18:11:44.986	16983	3
20643	0	2008-10-08 18:14:32.394	17023	20
20814	1	2008-10-08 18:52:56.329	20175	68
20815	1	2008-10-08 18:55:06.401	18447	70
20816	0	2008-10-08 18:56:06.609	18437	169
20817	0	2008-10-08 18:56:47.413	18457	84
20818	1	2008-10-08 18:57:25.306	18467	92
20819	3	2008-10-08 18:57:52.671	20402	50
21235	1	2008-10-10 17:37:09.934	14775	25
21236	1	2008-10-10 17:38:36.884	14765	84
21237	2	2008-10-10 17:40:24.184	14809	126
21238	2	2008-10-10 17:42:00.048	15132	46
21239	1	2008-10-10 17:43:03.829	15754	2
21416	0	2008-10-10 18:46:36.89	16329	134
21417	1	2008-10-10 18:47:23.028	15988	50
21418	2	2008-10-10 18:47:51.552	15978	55
21419	3	2008-10-10 18:48:18.334	15996	41
21420	3	2008-10-10 18:49:06.473	16355	22
21685	1	2008-10-13 18:09:48.767	17003	217
21686	0	2008-10-13 18:10:39.348	17271	164
21687	3	2008-10-13 18:11:52.661	17383	112
21688	0	2008-10-13 18:13:14.837	17344	192
21689	1	2008-10-13 18:14:17.275	17403	134
21690	1	2008-10-13 18:15:23.429	17393	64
21691	3	2008-10-13 18:16:23.608	17413	203
21692	0	2008-10-13 18:17:12.087	17354	133
21865	-1	2008-10-14 13:32:50.872	7270	69
21866	-1	2008-10-14 13:32:58.436	7254	58
21867	0	2008-10-14 13:33:05.586	7266	57
21868	-1	2008-10-14 13:33:13.195	6924	4999
21869	-1	2008-10-14 13:33:17.946	6342	59
22966	1	2008-10-20 18:25:33.517	15950	28
22967	1	2008-10-20 18:27:46.105	16319	196
22968	2	2008-10-20 18:28:18.788	15960	146
22969	2	2008-10-20 18:28:41.524	15864	194
22970	3	2008-10-20 18:28:54.531	16139	138
22971	4	2008-10-20 18:29:12.791	15921	36
22972	4	2008-10-20 18:30:23.723	15933	83
22973	2	2008-10-20 18:30:47.119	15438	139
22974	0	2008-10-20 18:31:14.693	16157	55
24527	0	2008-10-27 16:44:03.031	17271	85
24528	0	2008-10-27 16:46:29.647	17383	92
23240	3	2008-10-22 17:31:12.871	15200	105
23241	1	2008-10-22 17:32:29.255	15224	189
23242	1	2008-10-22 17:33:09.28	14829	188
23243	3	2008-10-22 17:33:40.112	15234	145
23245	3	2008-10-22 17:29:53.669	20402	57
23246	3	2008-10-22 17:31:37.921	18437	14
23247	1	2008-10-22 17:34:35.995	18447	76
23248	4	2008-10-22 17:35:11.702	20175	66
23249	2	2008-10-22 17:37:17.60	18457	64
23250	1	2008-10-22 17:38:02.337	22635	142
23251	1	2008-10-22 17:39:30.176	18467	71
23253	0	2008-10-22 17:26:59.702	17087	128
23254	2	2008-10-22 17:27:34.611	17423	53
23255	1	2008-10-22 17:28:35.49	16971	32
23256	2	2008-10-22 17:29:57.633	16694	119
23257	0	2008-10-22 17:31:14.665	16572	5
23258	2	2008-10-22 17:34:51.449	16522	115
23259	1	2008-10-22 17:35:39.987	17324	154
23260	0	2008-10-22 17:36:16.443	17314	141
23261	0	2008-10-22 17:37:06.59	17375	113
23262	1	2008-10-22 17:37:53.983	17044	153
23263	1	2008-10-22 17:39:12.606	16775	83
24434	3	2008-10-27 16:23:40.615	17304	100
24435	-1	2008-10-27 16:24:00.486	16881	0
24436	-1	2008-10-27 16:24:14.124	16891	0
24437	1	2008-10-27 16:24:24.053	17334	77
24438	2	2008-10-27 16:24:51.042	16940	90
24439	1	2008-10-27 16:25:13.426	16617	129
24440	1	2008-10-27 16:25:58.433	17290	143
24441	0	2008-10-27 16:26:44.44	17261	160
24511	2	2008-10-27 16:35:26.714	21029	102
24512	3	2008-10-27 16:37:25.808	18138	163
24513	2	2008-10-27 16:39:01.697	18489	109
24514	2	2008-10-27 16:40:21.723	18499	18
24515	3	2008-10-27 16:44:12.361	17746	37
24516	0	2008-10-27 16:46:14.581	21039	33
24518	-1	2008-10-27 16:34:05.095	18168	0
24519	3	2008-10-27 16:39:16.854	20388	41
24520	1	2008-10-27 16:40:46.48	18427	25
24521	2	2008-10-27 16:42:31.026	17249	26
24522	1	2008-10-27 16:44:54.914	21047	80
24523	2	2008-10-27 16:45:32.936	17195	29
24524	2	2008-10-27 16:47:11.223	21156	29
24525	3	2008-10-27 16:47:15.99	17726	62
24529	1	2008-10-27 16:48:10.309	17393	4
24530	0	2008-10-27 16:50:06.219	17403	150
24531	2	2008-10-27 16:50:43.611	17003	129
24595	2	2008-10-27 16:46:38.642	4930	195
24596	1	2008-10-27 16:47:43.20	4964	190
24597	1	2008-10-27 16:48:52.508	4974	71
24598	2	2008-10-27 16:52:00.995	4980	5
24599	3	2008-10-27 16:56:17.722	4900	140
24600	0	2008-10-27 16:57:16.033	4986	93
24601	1	2008-10-27 16:59:59.292	4906	168
24602	3	2008-10-27 17:01:29.22	4992	134
24603	2	2008-10-27 17:03:31.911	4912	198
24604	2	2008-10-27 17:04:28.348	4998	169
24605	0	2008-10-27 17:05:53.57	5004	145
24606	2	2008-10-27 17:08:07.662	5010	179
24607	1	2008-10-27 17:09:23.989	4918	191
24609	1	2008-10-27 17:03:28.762	17173	178
24610	3	2008-10-27 17:04:11.743	20155	128
24611	0	2008-10-27 17:05:33.271	18158	123
24612	1	2008-10-27 17:06:19.384	17239	77
24613	2	2008-10-27 17:07:02.688	20447	125
24614	0	2008-10-27 17:08:02.572	22645	142
24615	2	2008-10-27 17:09:20.576	21019	131
24616	0	2008-10-27 17:09:48.246	20412	54
24692	1	2008-10-27 17:22:44.44	18168	73
24693	2	2008-10-27 17:24:23.085	21156	192
24694	3	2008-10-27 17:25:02.327	17249	40
24695	3	2008-10-27 17:27:14.243	17195	111
24696	1	2008-10-27 17:27:30.772	20388	17
24697	2	2008-10-27 17:29:21.356	17726	47
24698	2	2008-10-27 17:31:43.143	18427	102
24699	1	2008-10-27 17:32:07.74	21047	98
25721	0	2008-11-03 15:52:43.383	8673	224
25722	0	2008-11-03 15:53:07.636	8663	189
25723	3	2008-11-03 15:54:06.591	8727	209
25724	3	2008-11-03 15:54:47.336	8787	195
25725	1	2008-11-03 15:55:38.238	8733	148
25726	1	2008-11-03 15:57:15.387	8793	213
25727	2	2008-11-03 15:57:47.02	8799	185
25728	0	2008-11-03 15:58:46.815	8805	196
25729	1	2008-11-03 15:59:35.422	8811	224
25730	2	2008-11-03 15:59:55.963	8739	170
25731	2	2008-11-03 16:01:10.817	8817	128
25732	3	2008-11-03 16:03:07.62	8823	169
25734	0	2008-11-03 16:05:43.253	8938	217
25735	2	2008-11-03 16:06:12.365	8848	163
25736	0	2008-11-03 16:07:38.983	8908	199
25737	3	2008-11-03 16:08:29.194	8980	183
25738	3	2008-11-03 16:09:31.476	8914	215
25739	3	2008-11-03 16:10:02.009	8992	201
25740	3	2008-11-03 16:10:46.244	9004	201
25741	1	2008-11-03 16:11:33.126	8920	121
25742	2	2008-11-03 16:13:37.603	8854	211
25743	2	2008-11-03 16:14:11.395	8926	179
25745	1	2008-11-03 16:06:21.744	8733	171
25746	1	2008-11-03 16:07:39.434	8787	200
25747	3	2008-11-03 16:08:27.828	8727	207
25748	3	2008-11-03 16:09:07.079	8793	219
25749	2	2008-11-03 16:09:34.331	8739	170
25750	2	2008-11-03 16:10:50.802	8799	97
25751	1	2008-11-03 16:13:19.138	8805	93
25752	0	2008-11-03 16:15:52.137	8745	230
25753	-1	2008-11-03 16:16:08.083	8673	228
25754	0	2008-11-03 16:16:36.393	8663	176
25756	3	2008-11-03 16:06:58.714	8823	133
25757	0	2008-11-03 16:08:51.567	8787	179
25758	0	2008-11-03 16:09:58.666	8793	192
25759	2	2008-11-03 16:10:53.22	8727	217
25760	1	2008-11-03 16:11:22.016	8673	218
25761	1	2008-11-03 16:11:49.233	8733	214
25762	1	2008-11-03 16:12:21.752	8799	178
25763	2	2008-11-03 16:13:28.979	8739	196
25764	2	2008-11-03 16:14:17.932	8805	78
25765	1	2008-11-03 16:17:04.99	8745	191
25766	3	2008-11-03 16:17:59.299	8811	134
25767	1	2008-11-03 16:19:50.77	8817	111
25768	2	2008-11-03 16:22:06.802	8751	208
25769	1	2008-11-03 16:22:43.025	8836	197
25771	1	2008-11-03 16:17:51.558	9202	172
25772	3	2008-11-03 16:20:06.564	9093	215
25773	3	2008-11-03 16:21:37.919	9087	149
25774	1	2008-11-03 16:24:14.264	9099	143
25775	0	2008-11-03 16:26:56.721	9033	259
25778	0	2008-11-03 16:19:51.516	8980	124
25779	3	2008-11-03 16:21:54.105	8992	112
25780	1	2008-11-03 16:24:07.461	9004	113
25781	0	2008-11-03 16:26:20.123	8908	205
25782	0	2008-11-03 16:27:00.661	8968	189
25783	3	2008-11-03 16:27:56.694	8974	183
25784	3	2008-11-03 16:28:59.043	8914	202
25785	2	2008-11-03 16:29:41.56	8986	76
25786	2	2008-11-03 16:32:31.945	8998	127
25787	2	2008-11-03 16:34:30.152	8920	166
25788	1	2008-11-03 16:35:48.954	9015	194
25791	3	2008-11-03 16:24:40.42	8992	193
25792	2	2008-11-03 16:25:32.746	8980	86
25793	0	2008-11-03 16:28:12.686	8908	165
25794	1	2008-11-03 16:29:33.469	9004	197
25795	3	2008-11-03 16:30:21.839	8914	190
25796	0	2008-11-03 16:31:17.093	8968	214
25797	2	2008-11-03 16:32:03.683	8974	172
25798	2	2008-11-03 16:33:17.113	8986	100
25799	0	2008-11-03 16:35:42.899	8998	178
25800	1	2008-11-03 16:36:50.299	9015	92
25801	3	2008-11-03 16:39:22.662	9021	104
25802	1	2008-11-03 16:41:42.875	9027	184
25805	3	2008-11-03 16:41:30.228	9184	259
25806	0	2008-11-03 16:42:17.711	9093	231
25807	3	2008-11-03 16:43:32.049	9153	163
25808	1	2008-11-03 16:45:54.054	9159	262
25809	0	2008-11-03 16:46:36.616	9099	133
25810	0	2008-11-03 16:49:28.723	9087	188
25811	2	2008-11-03 16:51:26.381	9033	243
25832	3	2008-11-03 17:15:12.002	8513	195
25833	0	2008-11-03 17:16:02.664	8543	178
25834	-1	2008-11-03 17:17:10.513	8603	53
25835	2	2008-11-03 17:20:23.166	8549	194
25836	0	2008-11-03 17:21:14.832	8615	59
25837	0	2008-11-03 17:24:20.74	8555	171
25838	3	2008-11-03 17:25:35.208	8609	150
25839	0	2008-11-03 17:27:10.187	8621	161
25840	2	2008-11-03 17:28:34.16	8627	68
25841	1	2008-11-03 17:35:43.873	8633	195
25842	3	2008-11-03 17:36:33.409	8639	157
25843	0	2008-11-03 17:38:00.528	8645	155
25844	1	2008-11-03 17:39:30.06	8651	147
26281	3	2008-11-05 16:03:48.833	4521	95
26282	3	2008-11-05 16:05:23.812	4539	163
26283	-1	2008-11-05 16:06:48.171	4573	141
26284	1	2008-11-05 16:07:38.856	4549	131
26285	1	2008-11-05 16:07:48.968	4476	111
26286	3	2008-11-05 16:08:04.284	4442	44
26303	1	2008-11-05 16:07:16.86	4476	108
26304	1	2008-11-05 16:07:44.029	4442	58
26305	2	2008-11-05 16:09:53.292	4448	130
26306	0	2008-11-05 16:10:52.018	4458	103
26307	3	2008-11-05 16:12:19.023	4486	159
26308	3	2008-11-05 16:12:46.081	4539	183
26309	2	2008-11-05 16:13:51.124	4573	42
26310	2	2008-11-05 16:16:17.043	4549	163
26311	1	2008-11-05 16:17:38.786	4498	144
26312	3	2008-11-05 16:19:20.451	4555	123
26313	3	2008-11-05 16:21:22.376	4591	155
26314	0	2008-11-05 16:22:52.283	4597	171
26315	1	2008-11-05 16:24:07.891	4561	144
26316	0	2008-11-05 16:25:50.411	4567	149
26317	3	2008-11-05 16:27:27.238	4579	164
26319	2	2008-11-05 16:12:08.204	4998	174
26320	1	2008-11-05 16:13:24.087	4964	36
26321	2	2008-11-05 16:16:54.185	4974	24
26322	3	2008-11-05 16:20:36.505	4900	163
26323	3	2008-11-05 16:20:59.171	4980	18
26324	1	2008-11-05 16:24:47.334	4906	156
26325	0	2008-11-05 16:26:17.719	4986	141
26326	2	2008-11-05 16:28:02.984	4912	115
26327	1	2008-11-05 16:30:14.865	4992	25
26328	0	2008-11-05 16:33:56.399	5004	153
26329	3	2008-11-05 16:35:30.282	5010	81
26330	2	2008-11-05 16:38:15.598	4918	59
26332	3	2008-11-05 16:29:22.372	9190	252
26333	3	2008-11-05 16:30:18.357	9153	130
26334	0	2008-11-05 16:33:14.605	9159	168
26335	3	2008-11-05 16:35:33.633	9165	256
26336	0	2008-11-05 16:36:24.022	9093	185
26337	3	2008-11-05 16:38:26.30	9172	225
26338	3	2008-11-05 16:39:48.657	9178	194
26340	2	2008-11-05 16:29:54.238	4841	141
26341	3	2008-11-05 16:30:39.305	4900	165
26342	1	2008-11-05 16:31:00.557	4964	95
26343	1	2008-11-05 16:33:33.108	4974	63
26344	0	2008-11-05 16:36:37.717	4980	137
26345	3	2008-11-05 16:38:29.042	4986	169
26346	1	2008-11-05 16:39:45.379	4992	125
26347	2	2008-11-05 16:41:46.481	4998	176
26348	0	2008-11-05 16:42:57.795	5004	159
26349	1	2008-11-05 16:44:39.582	5010	148
26360	1	2008-11-05 16:43:47.643	8793	190
26361	0	2008-11-05 16:44:45.53	8787	144
26362	0	2008-11-05 16:46:35.395	8799	166
26363	3	2008-11-05 16:47:58.804	8727	207
26364	0	2008-11-05 16:48:41.638	8805	175
26365	1	2008-11-05 16:49:54.119	8811	158
26366	1	2008-11-05 16:51:22.34	8733	213
26367	3	2008-11-05 16:51:56.86	8817	145
26368	3	2008-11-05 16:53:39.893	8739	166
26370	2	2008-11-05 16:49:28.239	9117	141
26371	0	2008-11-05 16:52:16.462	9087	245
26372	1	2008-11-05 16:53:17.975	9033	221
26373	1	2008-11-05 16:54:43.635	9039	267
26377	0	2008-11-05 16:57:54.142	8962	168
26378	2	2008-11-05 16:59:22.804	8848	201
26379	0	2008-11-05 17:00:09.144	8908	212
26380	3	2008-11-05 17:00:43.849	8980	59
26381	3	2008-11-05 17:03:52.35	8914	196
26382	3	2008-11-05 17:04:43.668	8992	196
26383	2	2008-11-05 17:05:33.988	9004	96
26384	0	2008-11-05 17:08:04.476	8968	195
26385	2	2008-11-05 17:08:55.093	8974	202
26386	1	2008-11-05 17:09:38.933	8986	90
26387	2	2008-11-05 17:12:14.516	8920	176
26388	1	2008-11-05 17:13:24.796	8998	169
26390	3	2008-11-05 17:16:22.871	9208	235
26391	0	2008-11-05 17:17:34.651	9153	232
26392	3	2008-11-05 17:18:50.632	9093	217
26393	3	2008-11-05 17:20:19.642	9087	266
26394	3	2008-11-05 17:21:00.16	9099	148
26395	1	2008-11-05 17:23:41.416	9159	221
26396	0	2008-11-05 17:25:06.686	9105	199
26397	2	2008-11-05 17:26:53.574	9165	279
26398	1	2008-11-05 17:27:20.373	9111	290
26399	2	2008-11-05 17:27:35.809	9172	293
26400	2	2008-11-05 17:27:48.182	9123	294
26401	2	2008-11-05 17:27:59.754	9033	292
26402	1	2008-11-05 17:28:13.136	9129	296
26403	2	2008-11-05 17:28:22.019	9178	298
26404	1	2008-11-05 17:28:29.819	9141	298
26405	1	2008-11-05 17:28:37.413	9039	0
26406	2	2008-11-05 17:28:43.808	9147	298
26417	3	2008-11-05 17:18:47.692	9093	165
26418	2	2008-11-05 17:21:10.302	9087	169
26419	2	2008-11-05 17:23:31.086	9033	261
26420	3	2008-11-05 17:24:17.414	9099	174
26421	1	2008-11-05 17:26:29.894	9153	225
26422	0	2008-11-05 17:27:55.174	9105	239
26423	2	2008-11-05 17:29:02.898	9159	174
26424	1	2008-11-05 17:31:14.278	9111	243
26425	1	2008-11-05 17:32:17.52	9165	216
26426	1	2008-11-05 17:33:48.672	9172	264
26427	0	2008-11-05 17:34:31.079	9123	230
26428	1	2008-11-05 17:35:47.726	9039	276
26429	1	2008-11-05 17:36:17.407	9129	264
26430	3	2008-11-05 17:36:58.752	9178	216
26431	0	2008-11-05 17:38:27.276	9141	217
26432	1	2008-11-05 17:39:56.535	9184	282
26433	2	2008-11-05 17:40:20.214	9147	269
27285	2	2008-11-10 16:32:30.599	8161	168
27286	0	2008-11-10 16:32:51.361	4751	165
27287	0	2008-11-10 16:33:15.138	4721	157
27288	2	2008-11-10 16:33:21.826	4715	106
27289	1	2008-11-10 16:33:43.464	4757	154
27291	1	2008-11-10 16:34:16.664	4775	154
27292	3	2008-11-10 16:34:54.956	4811	131
27293	3	2008-11-10 16:35:59.54	4751	148
27294	0	2008-11-10 16:36:41.758	4823	149
27295	3	2008-11-10 16:37:22.867	4817	202
27296	2	2008-11-10 16:38:10.581	4757	146
27297	2	2008-11-10 16:38:55.331	4721	152
27298	2	2008-11-10 16:39:34.465	4715	90
27300	-1	2008-11-10 16:31:50.03	8149	0
27301	3	2008-11-10 16:32:03.91	4751	151
27302	2	2008-11-10 16:32:40.601	4811	68
27303	0	2008-11-10 16:34:41.151	4757	141
27304	1	2008-11-10 16:35:28.49	4823	164
27305	2	2008-11-10 16:35:59.672	4763	168
27306	0	2008-11-10 16:36:22.588	4817	181
27307	1	2008-11-10 16:37:39.932	4769	110
27308	2	2008-11-10 16:39:00.601	4721	137
27309	2	2008-11-10 16:39:58.386	4715	80
27311	2	2008-11-10 16:38:05.034	4924	216
27312	2	2008-11-10 16:38:38.47	4859	44
27313	0	2008-11-10 16:39:08.877	4900	147
27314	3	2008-11-10 16:39:59.418	4835	157
27315	3	2008-11-10 16:40:34.573	4841	158
27317	0	2008-11-10 16:36:57.222	4715	98
27318	-1	2008-11-10 16:37:37.182	4721	0
27319	0	2008-11-10 16:37:41.484	4721	74
27320	-1	2008-11-10 16:37:47.087	4721	0
27321	-1	2008-11-10 16:37:53.181	4687	0
27322	2	2008-11-10 16:37:55.999	4687	165
27323	3	2008-11-10 16:38:21.707	4751	91
27324	3	2008-11-10 16:39:55.19	4811	84
27325	-1	2008-11-10 16:40:10.986	4757	0
27326	0	2008-11-10 16:40:11.133	4757	150
27327	0	2008-11-10 16:40:53.592	4823	160
27328	2	2008-11-10 16:41:21.363	4817	194
27329	2	2008-11-10 16:42:14.097	8143	157
27330	3	2008-11-10 16:42:44.164	8149	151
27331	3	2008-11-10 16:43:20.176	8155	146
27333	2	2008-11-10 16:46:50.41	4498	219
27334	-1	2008-11-10 16:47:20.824	4442	0
27335	2	2008-11-10 16:47:32.489	4442	118
27336	2	2008-11-10 16:48:43.606	4448	98
27338	0	2008-11-10 16:40:34.993	8167	135
27339	2	2008-11-10 16:41:32.287	4751	161
27340	0	2008-11-10 16:41:59.738	4721	160
27341	2	2008-11-10 16:42:54.102	4715	65
27342	0	2008-11-10 16:43:57.489	4757	154
27343	1	2008-11-10 16:44:32.28	4811	151
27344	2	2008-11-10 16:45:09.524	4763	166
27345	0	2008-11-10 16:45:37.647	4823	157
27346	1	2008-11-10 16:46:12.334	4817	193
27347	1	2008-11-10 16:47:10.935	4769	129
27348	2	2008-11-10 16:48:09.994	4687	151
27349	-1	2008-11-10 16:48:56.032	4775	0
27350	1	2008-11-10 16:48:56.498	4775	141
27351	-1	2008-11-10 16:49:47.267	8143	0
27352	0	2008-11-10 16:49:47.421	8143	152
27353	1	2008-11-10 16:50:25.048	4781	145
27354	0	2008-11-10 16:50:29.137	4697	110
27356	2	2008-11-10 16:43:13.719	4416	82
27357	0	2008-11-10 16:44:04.867	4476	81
27358	3	2008-11-10 16:44:53.528	4539	197
27359	2	2008-11-10 16:45:45.334	4573	166
27360	0	2008-11-10 16:46:10.958	4549	219
27361	1	2008-11-10 16:46:40.492	4591	139
27362	3	2008-11-10 16:48:39.961	4555	224
27363	0	2008-11-10 16:49:15.853	4597	228
27364	3	2008-11-10 16:49:37.325	4561	115
27365	3	2008-11-10 16:51:56.278	4486	158
27366	1	2008-11-10 16:52:27.623	4567	204
27368	1	2008-11-10 16:48:02.903	8155	166
27369	1	2008-11-10 16:48:36.09	4811	147
27370	0	2008-11-10 16:49:00.994	4751	161
27371	1	2008-11-10 16:49:30.102	4721	157
27372	2	2008-11-10 16:50:03.758	4715	95
27373	0	2008-11-10 16:50:36.965	4757	152
27374	3	2008-11-10 16:51:12.96	4823	165
27375	2	2008-11-10 16:51:34.855	4763	170
27376	3	2008-11-10 16:51:58.23	4817	211
27377	1	2008-11-10 16:52:35.801	4769	143
27378	2	2008-11-10 16:53:21.249	4687	156
27379	2	2008-11-10 16:53:51.898	4775	153
27381	3	2008-11-10 16:51:02.961	4853	184
27382	3	2008-11-10 16:52:05.822	4900	178
27383	-1	2008-11-10 16:52:12.232	4906	0
27384	1	2008-11-10 16:52:19.315	4964	133
27385	1	2008-11-10 16:54:10.678	4974	126
27386	-1	2008-11-10 16:54:19.775	4912	0
27387	1	2008-11-10 16:54:25.444	4980	197
27388	1	2008-11-10 16:55:18.847	4918	192
27390	1	2008-11-10 16:45:23.971	4853	146
27391	2	2008-11-10 16:47:08.56	4859	30
27392	2	2008-11-10 16:47:48.477	4900	153
27393	2	2008-11-10 16:48:30.241	4835	137
27394	1	2008-11-10 16:49:23.86	4906	198
27395	1	2008-11-10 16:50:14.775	4964	155
27396	3	2008-11-10 16:51:50.372	4974	168
27397	0	2008-11-10 16:53:15.725	4912	194
27398	0	2008-11-10 16:54:14.373	4841	166
27399	0	2008-11-10 16:54:42.326	4847	146
27401	0	2008-11-10 16:53:19.542	4591	20
27402	1	2008-11-10 16:57:08.781	4539	206
27403	1	2008-11-10 16:57:51.822	4476	103
27404	0	2008-11-10 16:58:23.005	4442	160
27405	0	2008-11-10 16:58:52.153	4448	129
27407	1	2008-11-10 16:44:34.835	4533	131
27408	3	2008-11-10 16:45:36.653	4539	145
27409	-1	2008-11-10 16:47:32.454	4573	0
27410	3	2008-11-10 16:47:35.135	4591	100
27411	0	2008-11-10 16:50:06.765	4597	117
27412	0	2008-11-10 16:52:22.651	4549	78
27413	3	2008-11-10 16:55:14.44	4555	86
27414	1	2008-11-10 16:57:57.801	4561	102
27415	0	2008-11-10 17:00:30.287	4567	79
27417	2	2008-11-10 16:58:03.305	4597	220
27418	3	2008-11-10 16:58:34.518	4539	202
27419	1	2008-11-10 16:59:29.47	4573	149
27420	2	2008-11-10 17:00:11.566	4549	235
27421	0	2008-11-10 17:00:31.843	4476	110
27422	1	2008-11-10 17:01:00.623	4555	199
27423	3	2008-11-10 17:01:50.967	4486	163
27424	1	2008-11-10 17:02:19.488	4561	230
27425	2	2008-11-10 17:02:38.872	4591	231
27426	3	2008-11-10 17:02:57.513	4567	234
27427	3	2008-11-10 17:03:11.262	4498	237
27428	1	2008-11-10 17:03:23.228	4442	166
27430	0	2008-11-10 16:55:06.16	5070	200
27431	2	2008-11-10 16:55:54.503	5088	229
27432	2	2008-11-10 16:56:14.437	5148	219
27433	1	2008-11-10 16:56:47.819	5094	209
27434	2	2008-11-10 16:57:28.139	5028	189
27435	3	2008-11-10 16:58:30.544	5100	207
27436	0	2008-11-10 16:59:24.107	5034	194
27437	3	2008-11-10 17:00:26.309	5106	215
27438	2	2008-11-10 17:01:06.441	5040	172
27439	1	2008-11-10 17:02:26.507	5112	169
27440	3	2008-11-10 17:03:53.291	5158	212
27441	3	2008-11-10 17:04:29.858	5118	210
27442	3	2008-11-10 17:05:06.27	5164	218
27443	2	2008-11-10 17:05:37.66	5170	223
27444	1	2008-11-10 17:06:03.647	5124	231
27445	2	2008-11-10 17:06:20.124	5046	226
27446	2	2008-11-10 17:06:40.228	5052	151
27448	0	2008-11-10 16:59:15.721	4597	107
27449	1	2008-11-10 17:01:42.04	4573	153
27450	3	2008-11-10 17:02:24.122	4539	180
27451	3	2008-11-10 17:03:33.958	4591	86
27452	1	2008-11-10 17:06:16.633	4549	191
27453	1	2008-11-10 17:07:23.883	4476	90
27454	2	2008-11-10 17:08:01.809	4442	174
27455	0	2008-11-10 17:08:18.809	4448	140
27457	3	2008-11-10 17:07:15.042	5124	215
27458	2	2008-11-10 17:07:54.868	5028	220
27459	3	2008-11-10 17:08:33.68	5088	232
27460	2	2008-11-10 17:08:51.063	5034	236
27461	1	2008-11-10 17:09:05.017	5040	235
27463	3	2008-11-10 16:58:01.515	5076	178
27464	-1	2008-11-10 16:59:21.125	5088	0
27465	2	2008-11-10 16:59:25.213	5088	160
27466	2	2008-11-10 17:01:01.871	5148	143
27467	-1	2008-11-10 17:01:15.775	5094	0
27468	1	2008-11-10 17:01:20.175	5094	84
27469	1	2008-11-10 17:04:05.461	5028	78
27470	0	2008-11-10 17:04:11.227	5034	72
27471	0	2008-11-10 17:04:16.582	5100	180
27472	2	2008-11-10 17:05:24.586	5040	213
27473	0	2008-11-10 17:06:01.211	5106	177
27474	-1	2008-11-10 17:07:10.88	5158	0
27475	3	2008-11-10 17:07:21.698	5164	219
27476	2	2008-11-10 17:07:54.146	5170	187
27477	0	2008-11-10 17:08:55.373	5112	186
27479	0	2008-11-10 17:01:53.465	4835	129
27480	2	2008-11-10 17:03:01.487	4859	20
27481	-1	2008-11-10 17:03:53.204	4900	0
27482	1	2008-11-10 17:03:58.594	4906	208
27483	2	2008-11-10 17:04:39.827	4964	213
27484	0	2008-11-10 17:05:16.883	4912	222
27485	2	2008-11-10 17:05:42.834	4841	147
27486	0	2008-11-10 17:06:25.225	4918	204
27487	-1	2008-11-10 17:07:07.851	4847	0
27488	3	2008-11-10 17:07:19.041	4974	201
27489	0	2008-11-10 17:08:06.109	4924	228
27490	2	2008-11-10 17:08:33.857	4853	192
27491	0	2008-11-10 17:09:29.80	4865	188
27523	3	2008-11-10 17:06:08.501	4986	109
27524	2	2008-11-10 17:08:37.673	4964	67
27525	3	2008-11-10 17:11:39.163	4900	126
27526	3	2008-11-10 17:12:42.214	4974	88
27527	-1	2008-11-10 17:15:23.536	4906	0
27528	2	2008-11-10 17:15:33.008	4912	71
27529	0	2008-11-10 17:15:43.74	4980	42
27530	3	2008-11-10 17:19:09.593	4992	155
27531	0	2008-11-10 17:20:43.041	4918	194
27532	2	2008-11-10 17:21:36.036	4998	165
27533	0	2008-11-10 17:23:02.134	5004	141
27534	1	2008-11-10 17:24:48.988	5010	122
27535	1	2008-11-10 17:26:55.724	5016	125
27536	1	2008-11-10 17:29:00.245	5022	141
27537	3	2008-11-10 17:30:47.086	4924	201
27697	2	2008-11-12 13:48:22.036	12046	594
27698	2	2008-11-12 13:48:39.759	10831	1189
27699	0	2008-11-12 13:49:01.01	12068	589
27700	0	2008-11-12 13:49:21.882	6703	596
27701	3	2008-11-12 13:49:35.446	10845	1194
27703	1	2008-11-12 13:50:16.381	11813	1792
27704	2	2008-11-12 13:50:34.697	10831	1194
27705	2	2008-11-12 13:50:51.918	12046	592
27706	1	2008-11-12 13:51:10.183	10845	1197
27707	1	2008-11-12 13:51:23.338	12068	595
27711	1	2008-11-12 15:25:23.397	5064	192
27712	2	2008-11-12 15:26:21.268	5088	203
27713	2	2008-11-12 15:27:09.734	5148	177
27714	1	2008-11-12 15:28:22.982	5094	195
27715	2	2008-11-12 15:29:17.176	5028	186
27716	1	2008-11-12 15:30:18.911	5100	184
27719	0	2008-11-12 15:25:46.567	4940	105
27720	1	2008-11-12 15:27:14.477	4964	156
27721	3	2008-11-12 15:28:47.491	4974	181
27722	3	2008-11-12 15:29:56.14	4900	152
27723	0	2008-11-12 15:30:33.215	4980	121
27724	3	2008-11-12 15:32:40.641	4986	88
27725	1	2008-11-12 15:35:20.966	4992	129
27726	2	2008-11-12 15:37:19.549	4998	135
27727	2	2008-11-12 15:39:12.347	5004	140
27728	1	2008-11-12 15:41:00.029	4906	207
27730	2	2008-11-12 15:39:42.995	5180	202
27731	2	2008-11-12 15:40:31.288	5088	180
27732	1	2008-11-12 15:41:42.822	5148	149
27733	3	2008-11-12 15:43:23.226	5094	58
27734	2	2008-11-12 15:46:33.839	5028	184
27735	2	2008-11-12 15:47:38.488	5100	183
27736	0	2008-11-12 15:48:43.748	5158	196
27737	0	2008-11-12 15:49:35.757	5106	192
27738	3	2008-11-12 15:50:31.023	5164	149
27739	2	2008-11-12 15:52:10.105	5170	202
27740	1	2008-11-12 15:52:56.424	5112	158
27741	3	2008-11-12 15:54:25.475	5186	180
27742	1	2008-11-12 15:55:31.997	5192	207
27743	2	2008-11-12 15:56:11.617	5198	163
27744	3	2008-11-12 15:57:35.175	5204	198
27745	3	2008-11-12 15:58:26.184	5210	147
27747	3	2008-11-12 16:01:05.22	8703	209
27748	3	2008-11-12 16:01:47.657	8727	203
27749	2	2008-11-12 16:02:34.496	8787	202
27750	1	2008-11-12 16:03:21.759	8733	211
27751	3	2008-11-12 16:04:02.236	8793	206
27752	3	2008-11-12 16:04:44.414	8739	161
27753	1	2008-11-12 16:06:13.676	8673	222
27754	1	2008-11-12 16:06:40.786	8745	203
27755	2	2008-11-12 16:07:26.991	8799	210
27756	0	2008-11-12 16:08:07.239	8805	191
27757	0	2008-11-12 16:09:05.583	8811	146
27758	2	2008-11-12 16:10:46.572	8751	213
27759	3	2008-11-12 16:11:23.237	8817	200
27760	0	2008-11-12 16:12:10.617	8757	213
27763	2	2008-11-12 16:01:56.501	8507	187
27764	3	2008-11-12 16:02:59.119	8543	133
27765	1	2008-11-12 16:04:55.901	8482	208
27766	2	2008-11-12 16:05:39.387	8549	184
27767	3	2008-11-12 16:06:46.002	8603	45
27768	0	2008-11-12 16:10:09.778	8555	181
27769	1	2008-11-12 16:11:16.574	8615	182
27770	3	2008-11-12 16:12:22.417	8609	195
27771	1	2008-11-12 16:13:14.554	8621	171
27772	2	2008-11-12 16:14:31.848	8561	194
27773	2	2008-11-12 16:15:24.735	8627	159
27774	1	2008-11-12 16:16:53.41	8633	193
27775	3	2008-11-12 16:17:47.322	8639	138
27776	0	2008-11-12 16:19:36.085	8645	190
27778	1	2008-11-12 16:24:05.379	8811	202
27779	3	2008-11-12 16:24:52.906	8727	178
27780	1	2008-11-12 16:26:04.726	8787	172
27781	1	2008-11-12 16:27:21.079	8733	145
27782	0	2008-11-12 16:29:04.588	8793	180
27783	2	2008-11-12 16:30:12.965	8739	133
27784	2	2008-11-12 16:32:09.693	8799	90
27785	0	2008-11-12 16:34:47.269	8805	224
27786	3	2008-11-12 16:35:11.694	8817	214
27787	1	2008-11-12 16:35:47.17	8745	147
27788	2	2008-11-12 16:37:27.73	8823	196
27789	2	2008-11-12 16:38:18.826	8751	186
27792	1	2008-11-12 16:53:13.132	8494	220
27793	1	2008-11-12 16:53:37.688	8543	218
27794	-1	2008-11-12 16:53:53.692	8549	0
27795	1	2008-11-12 16:53:55.725	8482	210
27796	1	2008-11-12 16:54:34.727	8555	204
27797	1	2008-11-12 16:54:45.724	8488	230
27798	1	2008-11-12 16:55:07.824	8561	144
27799	-1	2008-11-12 16:56:51.639	8500	0
27800	1	2008-11-12 16:56:55.407	8500	232
27802	1	2008-11-12 16:40:33.883	8962	129
27803	2	2008-11-12 16:42:34.252	8980	109
27804	0	2008-11-12 16:44:54.21	8908	195
27805	3	2008-11-12 16:45:48.546	8992	187
27806	1	2008-11-12 16:46:50.235	9004	187
27807	3	2008-11-12 16:47:51.98	8914	202
27808	0	2008-11-12 16:48:38.829	8968	169
27809	2	2008-11-12 16:49:57.757	8974	186
27810	2	2008-11-12 16:50:59.236	8986	83
27811	1	2008-11-12 16:53:53.182	8998	203
27812	2	2008-11-12 16:54:43.946	8920	132
27813	3	2008-11-12 16:56:47.192	9015	127
27815	3	2008-11-12 16:58:40.302	8703	205
27816	0	2008-11-12 16:59:24.755	8727	208
27817	1	2008-11-12 17:00:06.474	8673	228
27818	3	2008-11-12 17:00:31.493	8733	232
27819	2	2008-11-12 17:00:48.44	8663	232
27823	2	2008-11-12 17:03:30.267	9069	242
27824	3	2008-11-12 17:04:38.25	9093	194
27825	2	2008-11-12 17:06:32.605	9087	142
27826	2	2008-11-12 17:09:19.627	9033	235
27827	1	2008-11-12 17:10:33.913	9099	38
27830	2	2008-11-12 17:10:12.606	8507	219
27831	1	2008-11-12 17:10:44.301	8543	225
27832	1	2008-11-12 17:11:11.263	8482	218
27833	2	2008-11-12 17:11:42.445	8549	221
27834	2	2008-11-12 17:12:09.885	8603	140
27835	1	2008-11-12 17:13:58.526	8615	185
27836	3	2008-11-12 17:15:04.887	8609	205
27837	0	2008-11-12 17:15:49.942	8621	180
27838	2	2008-11-12 17:16:58.002	8627	158
27839	1	2008-11-12 17:18:28.402	8633	203
27840	-1	2008-11-12 17:19:12.778	8639	178
27841	3	2008-11-12 17:20:25.168	8555	227
27843	-1	2008-11-12 17:23:44	9135	246
27844	3	2008-11-12 17:24:47.719	8673	225
27845	0	2008-11-12 17:25:12.784	8663	221
27846	1	2008-11-12 17:25:41.225	8727	198
27847	3	2008-11-12 17:26:33.746	8679	175
27849	0	2008-11-12 17:25:06.421	6703	597
27850	0	2008-11-12 17:25:21.198	10831	1127
27851	2	2008-11-12 17:26:46.616	12046	588
27852	2	2008-11-12 17:27:09.726	10845	1180
27853	3	2008-11-12 17:27:40.611	11759	1465
27854	3	2008-11-12 17:33:27.835	11772	1778
27855	1	2008-11-12 17:34:00.51	11785	1791
27856	2	2008-11-12 17:34:19.643	11799	1786
27857	2	2008-11-12 17:34:43.929	11813	1480
27858	3	2008-11-12 17:40:14.219	10859	1110
27860	2	2008-11-13 00:38:08.97	10622	1133
27861	2	2008-11-13 00:39:34.66	14072	1769
27862	2	2008-11-13 00:40:22.338	11889	1710
27863	0	2008-11-13 00:42:09.693	10819	1031
27864	1	2008-11-13 00:45:20.357	11143	1748
27865	1	2008-11-13 00:46:32.112	7711	1766
27866	0	2008-11-13 00:47:23.775	10977	1126
27867	2	2008-11-13 00:48:53.057	7774	1759
27868	1	2008-11-13 00:49:51.514	14063	1763
27869	2	2008-11-13 00:50:44.106	14123	1767
27870	2	2008-11-13 00:51:32.996	14095	1774
27876	-1	2008-11-13 13:07:36.097	6451	0
27877	2	2008-11-13 13:08:28.656	11913	501
27878	0	2008-11-13 13:10:25.371	10819	1133
27879	2	2008-11-13 13:11:48.757	14072	1771
27880	2	2008-11-13 13:12:35.024	11889	1747
27881	0	2008-11-13 13:13:43.982	10977	1169
27883	3	2008-11-13 13:14:55.811	12034	550
27884	0	2008-11-13 13:16:02.317	11975	548
27885	3	2008-11-13 13:17:11.627	10999	1145
27886	1	2008-11-13 13:18:25.483	11987	548
27887	3	2008-11-13 13:19:33.136	12000	478
27888	1	2008-11-13 13:21:50.68	11023	1142
27889	2	2008-11-13 13:23:03.765	11632	1764
27890	3	2008-11-13 13:23:55.412	11645	1769
27891	1	2008-11-13 13:24:41.491	11658	1777
27892	0	2008-11-13 13:25:19.567	11671	1770
27893	2	2008-11-13 13:26:04.373	11684	1772
27894	3	2008-11-13 13:26:46.649	12390	1167
27895	2	2008-11-13 13:27:34.098	11733	1766
27897	3	2008-11-13 13:28:43.205	13970	1149
27898	2	2008-11-13 13:29:56.857	13800	1717
27899	2	2008-11-13 13:31:41.819	7756	1756
27900	1	2008-11-13 13:32:46.47	7738	1722
27901	2	2008-11-13 13:34:25.368	7729	1772
27902	3	2008-11-13 13:35:13.451	9331	1747
27903	2	2008-11-13 13:36:26.562	9341	1761
27904	3	2008-11-13 13:37:25.581	9351	1766
27906	0	2008-11-13 13:38:36.395	6887	598
27907	0	2008-11-13 13:38:47.162	6827	598
27908	0	2008-11-13 13:38:57.69	6817	599
27909	0	2008-11-13 13:39:07.917	6837	598
27910	0	2008-11-13 13:39:17.663	6847	595
27912	2	2008-11-13 13:39:47.408	6827	540
27913	3	2008-11-13 13:40:57.979	12379	1150
27914	1	2008-11-13 13:41:58.105	11319	1757
27915	3	2008-11-13 13:42:51.483	12502	1729
27916	3	2008-11-13 13:44:11.856	12510	1770
27917	0	2008-11-13 13:44:51.741	11336	1766
27918	0	2008-11-13 13:45:34.356	11854	1729
27919	1	2008-11-13 13:46:56.344	11871	1766
27920	0	2008-11-13 13:47:39.106	12437	1778
27922	1	2008-11-13 13:48:22.552	11228	564
27923	2	2008-11-13 13:49:04.636	11173	582
27924	0	2008-11-13 13:49:29.40	11184	593
27925	1	2008-11-13 13:49:41.547	11195	589
27926	1	2008-11-13 13:49:57.918	11206	575
27927	1	2008-11-13 13:50:29.052	11217	591
27928	0	2008-11-13 13:50:43.24	11239	592
27929	0	2008-11-13 13:50:56.334	11250	591
27930	3	2008-11-13 13:51:09.495	11262	591
27931	0	2008-11-13 13:51:22.087	11273	591
27932	2	2008-11-13 13:51:34.292	11284	582
27933	1	2008-11-13 13:51:55.94	11305	590
27935	0	2008-11-13 13:52:18.936	9568	566
27936	0	2008-11-13 13:52:58.705	9559	582
27937	2	2008-11-13 13:53:21.663	9577	586
27938	0	2008-11-13 13:53:40.132	9587	595
27940	2	2008-11-13 13:53:56.561	9577	586
27941	0	2008-11-13 13:54:16.367	9559	587
27942	0	2008-11-13 13:54:34.042	9568	591
27943	1	2008-11-13 13:54:47.284	9587	582
27945	0	2008-11-13 13:55:18.651	9559	586
27946	0	2008-11-13 13:55:38.394	9568	586
27947	2	2008-11-13 13:55:57.148	9577	587
27948	1	2008-11-13 13:56:14.211	9587	592
27950	1	2008-11-13 13:56:34.461	9587	589
27951	1	2008-11-13 13:56:49.956	9559	595
27952	2	2008-11-13 13:56:58.841	9568	595
27953	2	2008-11-13 13:57:07.381	9577	595
27955	0	2008-11-13 13:57:26.526	9559	582
27956	0	2008-11-13 13:57:48.637	9568	597
27957	2	2008-11-13 13:57:56.60	9577	598
27958	1	2008-11-13 13:58:02.344	9587	595
27960	2	2008-11-13 13:58:31.383	9577	598
27961	0	2008-11-13 13:58:38.267	9559	597
27962	0	2008-11-13 13:58:45.768	9568	598
27963	1	2008-11-13 13:58:51.331	9587	591
27966	1	2008-11-17 15:41:12.894	8149	124
27967	3	2008-11-17 15:42:19.856	4751	157
27968	1	2008-11-17 15:42:52.671	4811	154
27969	0	2008-11-17 15:43:29.809	4757	141
27970	0	2008-11-17 15:44:19.958	4823	166
27971	2	2008-11-17 15:44:43.30	4817	221
27972	2	2008-11-17 15:45:11.447	8143	169
27973	2	2008-11-17 15:45:35.416	8155	149
27974	2	2008-11-17 15:46:16.068	4763	158
27975	-1	2008-11-17 15:46:47.448	8161	167
27976	1	2008-11-17 15:47:10.923	4769	163
27978	0	2008-11-17 15:43:18.892	4458	83
27979	1	2008-11-17 15:45:06.292	4476	96
27980	2	2008-11-17 15:45:41.789	4442	125
27981	0	2008-11-17 15:46:53.255	4448	131
27982	0	2008-11-17 15:47:54.067	4454	33
27984	0	2008-11-17 15:51:41.575	4597	129
27985	1	2008-11-17 15:53:44.692	4573	135
27986	1	2008-11-17 15:54:40.362	4539	180
27987	1	2008-11-17 15:55:55.67	4476	109
27988	1	2008-11-17 15:56:20.656	4442	136
27990	2	2008-11-17 15:51:15.454	4847	226
27991	2	2008-11-17 15:51:44.521	4859	44
27992	-1	2008-11-17 15:52:14.035	4835	0
27993	3	2008-11-17 15:52:15.896	4900	123
27994	2	2008-11-17 15:53:23.055	4964	226
27995	1	2008-11-17 15:53:48.894	4906	216
27996	3	2008-11-17 15:54:29.022	4974	231
27997	2	2008-11-17 15:54:46.397	4912	185
27998	0	2008-11-17 15:55:53.05	4980	205
27999	0	2008-11-17 15:56:38.16	4986	212
28000	0	2008-11-17 15:57:15.639	4918	210
28001	0	2008-11-17 15:57:52.711	4992	228
28003	2	2008-11-17 15:50:40.501	4912	167
28004	2	2008-11-17 15:52:06.152	4964	227
28005	3	2008-11-17 15:52:29.93	4900	132
28006	0	2008-11-17 15:53:28.396	4974	211
28007	1	2008-11-17 15:54:07.12	4906	125
28008	2	2008-11-17 15:56:11.516	4980	44
28009	3	2008-11-17 15:59:38.979	4918	230
28010	2	2008-11-17 15:59:57.69	4859	44
28012	2	2008-11-17 16:00:31.725	5028	162
28013	2	2008-11-17 16:02:01.841	5088	185
28014	1	2008-11-17 16:03:16.852	5148	122
28015	1	2008-11-17 16:05:25.572	5094	211
28016	0	2008-11-17 16:06:04.667	5034	180
28017	1	2008-11-17 16:07:14.049	5100	185
28019	3	2008-11-17 15:59:53.645	8603	55
28020	-1	2008-11-17 16:03:10.56	8543	0
28021	-1	2008-11-17 16:03:19.073	8543	0
28022	1	2008-11-17 16:07:48.986	8482	225
28023	2	2008-11-17 16:08:17.285	8549	179
28024	2	2008-11-17 16:09:28.807	8615	204
28025	0	2008-11-17 16:10:13.754	8555	209
28026	1	2008-11-17 16:11:03.057	8609	162
28027	2	2008-11-17 16:12:35.03	8561	227
28028	-1	2008-11-17 16:12:58.30	8621	218
28029	1	2008-11-17 16:13:30.041	8567	229
28030	0	2008-11-17 16:13:43.724	8627	219
28031	2	2008-11-17 16:14:12.863	8573	204
28033	1	2008-11-17 16:02:00.659	8733	198
28034	0	2008-11-17 16:02:57.344	8787	136
28035	2	2008-11-17 16:04:51.004	8793	195
28036	3	2008-11-17 16:05:46.507	8727	174
28037	2	2008-11-17 16:07:02.064	8799	145
28038	0	2008-11-17 16:08:46.72	8805	121
28039	1	2008-11-17 16:10:56.331	8811	226
28040	2	2008-11-17 16:11:18.209	8739	237
28041	2	2008-11-17 16:11:31.362	8817	193
28042	2	2008-11-17 16:12:35.116	8823	79
28044	2	2008-11-17 16:10:52.418	8721	209
28045	0	2008-11-17 16:11:37.091	8673	227
28046	3	2008-11-17 16:11:59.687	8663	168
28047	3	2008-11-17 16:13:21.029	8679	221
28048	3	2008-11-17 16:13:50.114	8727	206
28049	3	2008-11-17 16:14:35.382	8787	205
28050	3	2008-11-17 16:15:19.607	8733	211
28051	2	2008-11-17 16:15:59.804	8685	232
28052	3	2008-11-17 16:16:17.864	8739	231
28056	1	2008-11-17 16:19:53.991	8956	129
28057	2	2008-11-17 16:21:53.957	8848	195
28058	0	2008-11-17 16:22:48.235	8908	192
28059	2	2008-11-17 16:23:46.149	8980	235
28060	3	2008-11-17 16:24:01.174	8914	207
28061	2	2008-11-17 16:24:42.847	8992	223
28062	3	2008-11-17 16:25:11.067	8920	235
28063	2	2008-11-17 16:25:25.427	8854	207
28064	2	2008-11-17 16:26:07.366	8926	229
28067	3	2008-11-17 16:57:08.157	9129	291
28068	-1	2008-11-17 16:57:28.743	9087	298
28069	1	2008-11-17 16:57:39.881	9033	297
28070	3	2008-11-17 16:57:52.149	9039	294
28071	3	2008-11-17 16:58:06.653	9045	290
28073	2	2008-11-17 16:42:28.935	5136	140
28074	-1	2008-11-17 16:44:19.003	5028	0
28075	-1	2008-11-17 16:45:04.884	5034	0
28076	2	2008-11-17 16:45:56.448	5040	189
28077	2	2008-11-17 16:46:56.244	5088	129
28078	0	2008-11-17 16:48:56.265	5148	65
28079	0	2008-11-17 16:51:59.54	5158	212
28080	2	2008-11-17 16:52:37.937	5094	69
28081	1	2008-11-17 16:55:36.793	5046	61
28082	1	2008-11-17 16:58:44.291	5052	172
28085	0	2008-11-17 17:19:40.337	8926	216
28086	2	2008-11-17 17:20:17.84	8848	185
28087	2	2008-11-17 17:21:21.981	8908	215
28088	2	2008-11-17 17:22:00.482	8854	220
28089	2	2008-11-17 17:22:31.968	8914	225
28091	1	2008-11-17 17:20:04.646	8567	184
28092	3	2008-11-17 17:21:11.098	8603	202
28093	3	2008-11-17 17:22:05.482	8543	197
28094	1	2008-11-17 17:23:02.619	8482	215
28095	3	2008-11-17 17:23:37.746	8549	159
28097	1	2008-11-17 17:25:20.491	9123	232
28098	1	2008-11-17 17:26:38.46	9087	185
28099	0	2008-11-17 17:28:42.699	9033	247
28100	1	2008-11-17 17:29:45.261	9039	230
28101	1	2008-11-17 17:31:03.821	9093	243
28103	0	2008-11-17 17:26:39.617	8884	204
28104	3	2008-11-17 17:27:25.384	8848	202
28105	2	2008-11-17 17:28:13.481	8854	169
28106	0	2008-11-17 17:29:35.138	8908	200
28107	3	2008-11-17 17:30:23.863	8980	201
28108	2	2008-11-17 17:31:11.569	8914	215
28109	0	2008-11-17 17:31:47.152	8860	173
28110	3	2008-11-17 17:33:01.609	8920	211
28116	0	2008-11-20 10:06:41.713	7270	64
28117	0	2008-11-20 10:06:51.887	6924	4998
28118	0	2008-11-20 10:06:56.88	7254	58
28119	0	2008-11-20 10:07:00.192	7266	59
28120	-1	2008-11-20 10:07:03.079	6300	0
28122	0	2008-11-20 10:08:24.819	7270	69
28123	0	2008-11-20 10:08:28.653	6924	4999
28124	0	2008-11-20 10:08:32.137	7254	58
28125	0	2008-11-20 10:08:35.60	7266	59
28126	0	2008-11-20 10:08:38.734	6300	21
28128	-1	2008-11-20 12:58:17.227	6924	0
28129	-1	2008-11-20 13:00:14.121	7254	0
28130	-1	2008-11-20 13:00:23.613	7266	0
28131	-1	2008-11-20 13:01:31.702	7270	0
28132	-1	2008-11-20 13:02:54.259	6300	0
28134	-1	2008-11-20 13:03:10.32	7270	0
28135	-1	2008-11-20 13:03:44.818	7254	0
28136	-1	2008-11-20 13:03:51.136	6924	0
28137	-1	2008-11-20 13:04:39.592	7266	0
28138	-1	2008-11-20 13:04:47.501	6300	0
28140	-1	2008-11-20 13:05:44.609	6924	0
28141	-1	2008-11-20 13:07:04.558	7254	0
28142	-1	2008-11-20 13:07:51.59	7266	0
28143	-1	2008-11-20 13:08:55.351	7270	0
28144	-1	2008-11-20 13:09:41.129	6300	0
28146	-1	2008-11-20 13:11:27.614	6924	0
28147	-1	2008-11-20 13:22:12.293	7254	0
28148	-1	2008-11-20 13:22:17.234	7266	0
28149	-1	2008-11-20 13:24:59.497	7270	0
28150	-1	2008-11-20 13:25:40.772	6300	0
28152	-1	2008-11-20 14:55:39.136	6300	0
28153	-1	2008-11-20 14:59:58.277	7254	0
28154	-1	2008-11-20 15:00:17.009	7266	0
28155	-1	2008-11-20 15:01:49.264	6924	0
28156	-1	2008-11-20 15:02:09.696	7270	0
28158	-1	2008-11-20 15:02:25.24	6924	0
28159	-1	2008-11-20 15:03:46.793	7254	0
28160	-1	2008-11-20 15:08:03.421	7266	0
28161	-1	2008-11-20 15:08:42.265	7270	0
28162	-1	2008-11-20 15:09:03.865	6300	0
28876	1	2009-03-14 13:48:20.881	6342	0
28877	0	2009-03-14 13:48:30.21	7276	0
28201	2	2008-11-24 16:10:54.659	8685	0
28202	3	2008-11-24 16:11:21.481	8727	0
28203	2	2008-11-24 16:13:12.389	8787	0
28204	3	2008-11-24 16:14:11.495	8733	0
28205	1	2008-11-24 16:16:33.986	8673	0
28206	2	2008-11-24 16:17:00.513	8739	0
28207	0	2008-11-24 16:18:07.385	8793	0
28208	3	2008-11-24 16:18:41.577	8745	0
28209	2	2008-11-24 16:19:41.422	8663	0
28210	3	2008-11-24 16:19:56.926	8679	0
28212	2	2008-11-24 16:14:14.678	4687	0
28213	2	2008-11-24 16:14:56.55	4751	0
28214	0	2008-11-24 16:15:46.571	4721	0
28215	2	2008-11-24 16:16:18.509	4715	0
28216	0	2008-11-24 16:16:53.274	4757	0
28217	2	2008-11-24 16:17:23.896	4811	0
28218	3	2008-11-24 16:18:21.656	4763	0
28219	3	2008-11-24 16:18:45.243	4697	0
28220	3	2008-11-24 16:19:24.495	4703	0
28222	2	2008-11-24 16:14:19.08	4823	0
28223	3	2008-11-24 16:19:37.548	4751	0
28224	2	2008-11-24 16:20:49.133	4811	0
28225	0	2008-11-24 16:22:11.464	4757	0
28226	3	2008-11-24 16:22:37.382	4817	0
28227	1	2008-11-24 16:23:25.399	4763	0
28228	1	2008-11-24 16:24:04.086	4721	0
28229	2	2008-11-24 16:24:50.157	4715	0
28232	2	2008-11-24 16:14:17.776	4769	0
28233	1	2008-11-24 16:15:37.525	4721	0
28234	2	2008-11-24 16:16:18.564	4715	0
28235	3	2008-11-24 16:17:31.721	4751	0
28236	0	2008-11-24 16:18:59.674	4811	0
28237	3	2008-11-24 16:20:47.293	4823	0
28238	0	2008-11-24 16:22:14.409	4757	0
28239	2	2008-11-24 16:23:22.558	4817	0
28240	3	2008-11-24 16:24:28.797	8143	0
28241	2	2008-11-24 16:25:26.679	4763	0
28242	3	2008-11-24 16:25:56.764	8149	0
28243	1	2008-11-24 16:27:12.181	8155	0
28244	3	2008-11-24 16:27:39.956	8161	0
28245	3	2008-11-24 16:28:22.65	4775	0
28247	2	2008-11-24 16:14:37.243	4781	0
28248	1	2008-11-24 16:15:51.695	4721	0
28249	2	2008-11-24 16:16:50.376	4715	0
28250	3	2008-11-24 16:17:52.842	4751	0
28251	0	2008-11-24 16:19:08.097	4811	0
28252	0	2008-11-24 16:20:25.629	4823	0
28253	1	2008-11-24 16:21:10.908	4817	0
28254	0	2008-11-24 16:23:44.13	4757	0
28255	2	2008-11-24 16:24:30.144	8143	0
28256	3	2008-11-24 16:25:09.325	8149	0
28257	1	2008-11-24 16:26:13.825	8155	0
28258	0	2008-11-24 16:28:15.309	8161	0
28259	1	2008-11-24 16:28:35.973	8167	0
28261	0	2008-11-24 16:27:23.209	4549	0
28262	0	2008-11-24 16:29:14.33	4573	0
28263	3	2008-11-24 16:31:38.726	4591	0
28264	0	2008-11-24 16:34:08.577	4597	0
28265	3	2008-11-24 16:35:44.352	4539	0
28266	3	2008-11-24 16:37:01.62	4555	0
28267	1	2008-11-24 16:39:35.379	4561	0
28268	0	2008-11-24 16:41:48.983	4567	0
28270	3	2008-11-24 16:35:05.867	4952	0
28271	1	2008-11-24 16:37:20.599	4964	0
28272	1	2008-11-24 16:39:54.50	4974	0
28273	0	2008-11-24 16:43:59.261	4980	0
28274	3	2008-11-24 16:48:38.604	4986	0
28275	1	2008-11-24 16:51:02.038	4992	0
28276	2	2008-11-24 16:53:08.427	4998	0
28277	0	2008-11-24 16:54:19.733	5004	0
28278	0	2008-11-24 16:55:35.454	5010	0
28280	2	2008-11-24 16:32:10.743	4579	0
28281	1	2008-11-24 16:41:43.583	4573	0
28282	3	2008-11-24 16:44:45.03	4539	0
28283	3	2008-11-24 16:48:16.393	4591	0
28284	0	2008-11-24 16:50:43.683	4597	0
28285	3	2008-11-24 16:52:58.766	4549	0
28286	1	2008-11-24 16:54:06.431	4476	0
28287	3	2008-11-24 16:54:34.074	4442	0
28288	0	2008-11-24 16:57:55.281	4486	0
28290	0	2008-11-24 16:23:52.194	4585	0
28291	1	2008-11-24 16:24:58.452	4476	0
28292	1	2008-11-24 16:25:31.758	4442	0
28293	1	2008-11-24 16:28:12.825	4448	0
28294	3	2008-11-24 16:30:37.482	4486	0
28295	3	2008-11-24 16:31:22.424	4539	0
28296	1	2008-11-24 16:33:11.54	4573	0
28297	1	2008-11-24 16:33:55.881	4549	0
28298	1	2008-11-24 16:38:51.499	4498	0
28299	3	2008-11-24 16:40:18.62	4555	0
28300	3	2008-11-24 16:42:16.593	4591	0
28301	0	2008-11-24 16:45:17.409	4597	0
28302	1	2008-11-24 16:48:31.442	4561	0
28303	0	2008-11-24 16:50:08.552	4567	0
28304	2	2008-11-24 16:54:08.701	4579	0
28306	1	2008-11-24 16:46:24.635	4952	0
28307	2	2008-11-24 16:49:32.955	4859	0
28308	3	2008-11-24 16:50:10.517	4900	0
28309	1	2008-11-24 16:50:54.191	4964	0
28310	1	2008-11-24 16:51:49.596	4974	0
28311	0	2008-11-24 16:54:19.527	4980	0
28312	3	2008-11-24 16:55:52.51	4986	0
28313	0	2008-11-24 16:59:39.509	4992	0
28314	1	2008-11-24 17:01:32.38	4906	0
28315	2	2008-11-24 17:02:18.53	4998	0
28316	2	2008-11-24 17:04:44.395	5004	0
28318	1	2008-11-24 17:01:11.948	4515	0
28319	3	2008-11-24 17:03:43.553	4539	0
28320	2	2008-11-24 17:05:06.868	4573	0
28321	1	2008-11-24 17:06:38.234	4549	0
28322	1	2008-11-24 17:09:56.597	4476	0
28323	2	2008-11-24 17:10:32.526	4442	0
28325	0	2008-11-24 17:15:28.369	8902	0
28326	2	2008-11-24 17:16:05.486	8848	0
28327	2	2008-11-24 17:17:11.798	8908	0
28328	2	2008-11-24 17:18:15.904	8854	0
28329	2	2008-11-24 17:18:44.354	8914	0
28332	0	2008-11-24 17:03:06.78	4841	0
28333	0	2008-11-24 17:04:31.447	4859	0
28334	2	2008-11-24 17:05:17.605	4835	0
28335	3	2008-11-24 17:06:05.903	4900	0
28336	1	2008-11-24 17:07:01.38	4964	0
28337	1	2008-11-24 17:08:51.02	4974	0
28338	0	2008-11-24 17:10:25.94	4980	0
28339	0	2008-11-24 17:13:07.636	4986	0
28340	1	2008-11-24 17:15:58.439	4906	0
28341	1	2008-11-24 17:18:09.467	4992	0
28342	0	2008-11-24 17:19:13.911	4998	0
28343	2	2008-11-24 17:21:48.77	4912	0
28344	3	2008-11-24 17:23:13.14	5004	0
28346	0	2008-11-24 17:07:05.684	5106	0
28347	0	2008-11-24 17:08:09.948	5148	0
28348	0	2008-11-24 17:09:43.161	5158	0
28349	2	2008-11-24 17:10:23.497	5088	0
28350	0	2008-11-24 17:11:25.851	5164	0
28351	0	2008-11-24 17:13:03.589	5094	0
28352	1	2008-11-24 17:15:05.706	5170	0
28353	1	2008-11-24 17:17:05.172	5100	0
28354	2	2008-11-24 17:19:09.965	5028	0
28355	1	2008-11-24 17:20:19.556	5112	0
28356	1	2008-11-24 17:21:31.548	5180	0
28357	3	2008-11-24 17:22:14.52	5186	0
28358	0	2008-11-24 17:22:50.928	5192	0
28359	3	2008-11-24 17:23:32.981	5118	0
28360	3	2008-11-24 17:24:31.964	5198	0
28362	0	2008-11-24 17:02:31.937	4980	0
28363	0	2008-11-24 17:09:54.739	4964	0
28364	3	2008-11-24 17:13:47.685	4900	0
28365	0	2008-11-24 17:15:25.531	4974	0
28366	0	2008-11-24 17:16:46.267	4906	0
28367	2	2008-11-24 17:17:56.994	4859	0
28368	2	2008-11-24 17:18:52.056	4912	0
28369	0	2008-11-24 17:20:21.178	4986	0
28370	0	2008-11-24 17:23:15.111	4918	0
28371	0	2008-11-24 17:24:29.951	4992	0
28372	3	2008-11-24 17:25:22.537	4924	0
28373	0	2008-11-24 17:26:23.291	4835	0
28374	3	2008-11-24 17:26:48.766	4841	0
28376	0	2008-11-24 17:26:10.894	5198	0
28377	1	2008-11-24 17:27:14.714	5088	0
28378	2	2008-11-24 17:28:33.297	5028	0
28379	0	2008-11-24 17:29:36.208	5094	0
28380	0	2008-11-24 17:31:31.43	5148	0
28381	1	2008-11-24 17:33:21.086	5158	0
28382	3	2008-11-24 17:34:00.085	5164	0
28383	1	2008-11-24 17:34:41.883	5170	0
28384	-1	2008-11-24 17:35:53.117	5100	0
28385	0	2008-11-24 17:36:02.782	5034	0
28386	0	2008-11-24 17:36:44.477	5106	0
28388	3	2008-11-24 17:31:21.815	9045	0
28389	-1	2008-11-24 17:33:11.83	9033	0
28390	2	2008-11-24 17:33:18.997	9033	0
28391	1	2008-11-24 17:35:03.866	9093	0
28392	0	2008-11-24 17:37:07.223	9087	0
28394	2	2008-11-24 17:27:03.467	8549	0
28395	2	2008-11-24 17:28:11.274	8603	0
28396	2	2008-11-24 17:32:31.997	8615	0
28397	0	2008-11-24 17:33:18.858	8543	0
28398	3	2008-11-24 17:35:01.326	8609	0
28399	0	2008-11-24 17:35:58.575	8621	0
28400	2	2008-11-24 17:37:14.179	8627	0
28401	1	2008-11-24 17:38:56.156	8633	0
28402	3	2008-11-24 17:40:07.723	8639	0
28403	0	2008-11-24 17:41:14.096	8645	0
28404	1	2008-11-24 17:42:23.506	8651	0
28406	0	2008-11-24 17:30:34.509	5106	0
28407	0	2008-11-24 17:32:25.776	5148	0
28408	0	2008-11-24 17:35:16.173	5158	0
28409	2	2008-11-24 17:36:06.91	5088	0
28410	3	2008-11-24 17:36:58.743	5164	0
28411	1	2008-11-24 17:37:49.862	5170	0
28412	0	2008-11-24 17:39:16.234	5094	0
28413	2	2008-11-24 17:40:56.664	5180	0
28414	1	2008-11-24 17:41:29.746	5100	0
28415	2	2008-11-24 17:42:35.662	5028	0
28416	2	2008-11-24 17:43:18.901	5112	0
28418	0	2008-11-24 17:17:55.456	5192	0
28419	2	2008-11-24 17:19:58.921	5088	0
28420	0	2008-11-24 17:22:12.05	5148	0
28421	0	2008-11-24 17:25:19.941	5158	0
28422	0	2008-11-24 17:26:29.976	5094	0
28423	3	2008-11-24 17:29:28.461	5164	0
28424	0	2008-11-24 17:31:39.083	5170	0
28425	1	2008-11-24 17:37:13.844	5180	0
28426	3	2008-11-24 17:37:58.045	5186	0
28427	2	2008-11-24 17:40:05.045	5198	0
28428	3	2008-11-24 17:43:59.865	5204	0
28429	3	2008-11-24 17:45:25.823	5210	0
28434	2	2008-11-26 15:44:28.632	8721	0
28435	2	2008-11-26 15:46:38.477	8673	0
28436	2	2008-11-26 15:46:58.90	8663	0
28437	3	2008-11-26 15:48:41.881	8679	0
28438	0	2008-11-26 15:49:02.846	8727	0
28440	1	2008-11-26 15:51:59.965	8537	0
28441	0	2008-11-26 15:53:58.718	8543	0
28442	0	2008-11-26 15:57:42.938	8603	0
28443	2	2008-11-26 16:00:49.303	8549	0
28444	0	2008-11-26 16:04:01.496	8615	0
28445	0	2008-11-26 16:05:27.422	8555	0
28446	3	2008-11-26 16:06:56.387	8609	0
28447	0	2008-11-26 16:08:32.997	8621	0
28448	2	2008-11-26 16:11:26.843	8627	0
28449	1	2008-11-26 16:12:38.082	8633	0
28450	1	2008-11-26 16:14:45.845	8639	0
28451	0	2008-11-26 16:17:30.864	8561	0
28453	0	2008-11-26 16:20:59.536	8884	0
28454	2	2008-11-26 16:25:56.889	8848	0
28455	0	2008-11-26 16:26:50.05	8908	0
28456	0	2008-11-26 16:27:35.30	8980	0
28457	3	2008-11-26 16:29:04.596	8992	0
28458	0	2008-11-26 16:30:29.655	9004	0
28459	2	2008-11-26 16:31:30.371	8914	0
28460	2	2008-11-26 16:32:09.785	8854	0
28461	0	2008-11-26 16:33:28.80	8920	0
28463	2	2008-11-26 16:26:46.428	9184	0
28464	0	2008-11-26 16:29:17.67	9153	0
28465	1	2008-11-26 16:30:33.948	9093	0
28466	1	2008-11-26 16:33:03.921	9087	0
28467	2	2008-11-26 16:35:40.634	9033	0
28469	1	2008-11-26 16:38:48.173	8763	0
28470	2	2008-11-26 16:39:05.971	8673	0
28471	0	2008-11-26 16:39:36.304	8663	0
28472	0	2008-11-26 16:39:51.201	8727	0
28473	3	2008-11-26 16:40:09.266	8679	0
28475	1	2008-11-26 16:41:52.374	8878	0
28476	2	2008-11-26 16:42:34.446	8848	0
28477	3	2008-11-26 16:43:06.955	8908	0
28478	2	2008-11-26 16:43:49.60	8854	0
28479	2	2008-11-26 16:44:20.635	8914	0
28481	2	2008-11-26 16:45:44.533	9057	0
28482	2	2008-11-26 16:46:41.703	9033	0
28483	0	2008-11-26 16:49:54.377	9093	0
28484	2	2008-11-26 16:51:08.409	9153	0
28485	1	2008-11-26 16:53:28.244	9099	0
28486	1	2008-11-26 16:55:43.562	9087	0
28488	0	2008-11-26 16:38:36.962	9117	0
28489	0	2008-11-26 16:41:39.827	9087	0
28490	2	2008-11-26 16:42:48.507	9033	0
28491	0	2008-11-26 16:43:44.195	9093	0
28492	3	2008-11-26 16:46:52.712	9153	0
28493	2	2008-11-26 16:48:28.021	9159	0
28494	1	2008-11-26 16:52:10.014	9099	0
28495	1	2008-11-26 16:53:17.63	9039	0
28496	2	2008-11-26 16:55:24.863	9105	0
28500	1	2008-11-26 16:48:41.338	8633	0
28501	2	2008-11-26 16:50:00.247	8603	0
28502	2	2008-11-26 16:52:05.64	8615	0
28503	0	2008-11-26 16:53:45.445	8543	0
28504	3	2008-11-26 16:58:20.402	8609	0
28505	0	2008-11-26 17:01:40.993	8621	0
28506	0	2008-11-26 17:02:40.938	8627	0
28507	2	2008-11-26 17:07:09.831	8549	0
28508	1	2008-11-26 17:08:37.74	8639	0
28509	0	2008-11-26 17:11:15.521	8555	0
28511	0	2008-11-26 17:01:17.256	8663	0
28512	3	2008-11-26 17:02:07.231	8727	0
28513	0	2008-11-26 17:02:49.601	8787	0
28514	1	2008-11-26 17:04:55.651	8793	0
28515	3	2008-11-26 17:06:21.995	8799	0
28516	1	2008-11-26 17:08:28.567	8733	0
28517	0	2008-11-26 17:09:01.917	8805	0
28518	3	2008-11-26 17:09:49.976	8811	0
28519	2	2008-11-26 17:11:21.217	8817	0
28520	3	2008-11-26 17:13:33.808	8823	0
28521	1	2008-11-26 17:14:55.126	8836	0
28523	1	2008-11-26 17:18:23.357	8591	0
28524	2	2008-11-26 17:19:31.055	8603	0
28525	3	2008-11-26 17:20:20.273	8615	0
28526	0	2008-11-26 17:21:25.957	8543	0
28527	3	2008-11-26 17:22:41.701	8609	0
28528	3	2008-11-26 17:23:26.285	8621	0
28529	1	2008-11-26 17:24:53.776	8549	0
28530	1	2008-11-26 17:27:22.882	8482	0
28531	0	2008-11-26 17:27:54.402	8555	0
28532	1	2008-11-26 17:29:12.229	8627	0
28533	2	2008-11-26 17:30:21.453	8561	0
28534	1	2008-11-26 17:30:53.742	8633	0
28535	3	2008-11-26 17:32:09.104	8639	0
28537	2	2008-11-26 17:14:47.636	9135	0
28538	0	2008-11-26 17:17:22.13	8787	0
28539	1	2008-11-26 17:18:53.718	8793	0
28540	1	2008-11-26 17:20:46.252	8799	0
28541	3	2008-11-26 17:25:11.321	8727	0
28542	1	2008-11-26 17:27:49.028	8805	0
28543	1	2008-11-26 17:30:45.807	8733	0
28544	3	2008-11-26 17:31:23.25	8811	0
28545	3	2008-11-26 17:31:51.896	8817	0
28546	2	2008-11-26 17:33:54.164	8739	0
28547	3	2008-11-26 17:34:33.073	8823	0
28548	2	2008-11-26 17:37:24.814	8836	0
28550	2	2008-12-01 15:42:30.52	4687	0
28551	0	2008-12-01 15:42:59.531	4751	0
28552	2	2008-12-01 15:43:20.58	4721	0
28553	2	2008-12-01 15:43:40.229	4715	0
28554	0	2008-12-01 15:44:00.821	4757	0
28555	2	2008-12-01 15:44:26.196	4811	0
28556	0	2008-12-01 15:44:55.05	4763	0
28557	0	2008-12-01 15:45:17.624	4697	0
28558	1	2008-12-01 15:45:31.71	4769	0
28560	2	2008-12-01 15:44:14.826	4763	0
28561	1	2008-12-01 15:44:39.932	4811	0
28562	3	2008-12-01 15:45:56.503	4751	0
28563	0	2008-12-01 15:47:05.699	4823	0
28564	2	2008-12-01 15:47:57.526	4817	0
28565	2	2008-12-01 15:48:31.331	8143	0
28566	3	2008-12-01 15:49:33.696	8149	0
28567	0	2008-12-01 15:50:24.255	8155	0
28568	0	2008-12-01 15:50:56.262	4757	0
28570	0	2008-12-01 15:52:59.32	8920	0
28571	2	2008-12-01 15:53:53.515	8848	0
28572	3	2008-12-01 15:55:05.362	8908	0
28573	2	2008-12-01 15:56:21.119	8854	0
28574	2	2008-12-01 15:56:56.944	8914	0
28577	2	2008-12-01 15:48:18.055	8811	0
28578	3	2008-12-01 15:50:10.545	8727	0
28579	1	2008-12-01 15:50:55.445	8787	0
28580	1	2008-12-01 15:52:26.276	8733	0
28581	0	2008-12-01 15:53:51.809	8793	0
28582	2	2008-12-01 15:54:22.804	8739	0
28583	2	2008-12-01 15:55:02.066	8799	0
28584	0	2008-12-01 15:56:17.43	8805	0
28585	2	2008-12-01 15:58:59.926	8817	0
28586	3	2008-12-01 15:59:58.379	8823	0
28587	1	2008-12-01 16:00:55.396	8836	0
28588	0	2008-12-01 16:01:38.152	8830	0
28591	1	2008-12-01 15:57:13.983	4579	0
28592	1	2008-12-01 16:01:44.393	4476	0
28593	3	2008-12-01 16:02:42.07	4442	0
28594	3	2008-12-01 16:06:25.819	4486	0
28595	3	2008-12-01 16:07:06.745	4539	0
28596	2	2008-12-01 16:08:27.737	4573	0
28597	1	2008-12-01 16:10:31.668	4549	0
28598	1	2008-12-01 16:12:04.092	4498	0
28599	3	2008-12-01 16:13:17.986	4555	0
28600	3	2008-12-01 16:15:45.322	4591	0
28601	0	2008-12-01 16:17:49.523	4597	0
28602	0	2008-12-01 16:19:47.548	4561	0
28603	1	2008-12-01 16:22:03.78	4504	0
28605	1	2008-12-01 16:28:35.092	8769	0
28606	0	2008-12-01 16:31:51.463	8673	0
28607	0	2008-12-01 16:32:32.793	8663	0
28608	3	2008-12-01 16:34:29.365	8727	0
28609	0	2008-12-01 16:37:50.759	8787	0
28610	-1	2008-12-01 16:38:36.545	8793	0
28611	1	2008-12-01 16:38:43.17	8733	0
28612	0	2008-12-01 16:40:36.61	8799	0
28613	0	2008-12-01 16:42:09.267	8739	0
28614	3	2008-12-01 16:43:37.082	8679	0
28615	0	2008-12-01 16:44:03.70	8745	0
28617	1	2008-12-01 16:42:18.568	8482	0
28618	2	2008-12-01 16:42:33.523	8543	0
28619	1	2008-12-01 16:42:52.517	8488	0
28620	1	2008-12-01 16:43:04.849	8549	0
28621	1	2008-12-01 16:43:23.675	8494	0
28622	0	2008-12-01 16:43:52.164	8555	0
28623	1	2008-12-01 16:44:15.594	8603	0
28624	2	2008-12-01 16:44:30.004	8561	0
28625	1	2008-12-01 16:44:47.681	8615	0
28626	0	2008-12-01 16:45:01.261	8609	0
28627	1	2008-12-01 16:45:15.921	8567	0
28628	2	2008-12-01 16:45:39.525	8621	0
28629	2	2008-12-01 16:45:50.057	8573	0
28630	0	2008-12-01 16:46:06.074	8627	0
28631	2	2008-12-01 16:46:18.554	8579	0
28635	1	2008-12-01 16:48:20.393	9147	0
28636	2	2008-12-01 16:48:30.847	9087	0
28637	2	2008-12-01 16:48:45.874	9033	0
28638	3	2008-12-01 16:48:58.387	9093	0
28639	3	2008-12-01 16:49:14.507	9039	0
28641	0	2008-12-01 16:41:11.204	8998	0
28642	0	2008-12-01 16:42:12.379	8980	0
28643	3	2008-12-01 16:43:16.931	8992	0
28644	2	2008-12-01 16:44:17.285	9004	0
28645	0	2008-12-01 16:46:31.778	8968	0
28646	1	2008-12-01 16:47:13.781	8974	0
28647	0	2008-12-01 16:48:50.697	8908	0
28648	1	2008-12-01 16:49:41.99	8986	0
28650	0	2008-12-01 16:38:37.705	8920	0
28651	2	2008-12-01 16:39:51.365	8848	0
28652	0	2008-12-01 16:40:41.905	8908	0
28653	1	2008-12-01 16:41:18.539	8980	0
28654	2	2008-12-01 16:42:00.475	8914	0
28655	2	2008-12-01 16:42:18.919	8854	0
28656	1	2008-12-01 16:42:48.796	8926	0
28657	3	2008-12-01 16:44:05.976	8992	0
28658	1	2008-12-01 16:44:51.994	9004	0
28659	2	2008-12-01 16:46:08.939	8932	0
28660	0	2008-12-01 16:48:36.233	8968	0
28661	2	2008-12-01 16:49:47.522	8974	0
28662	1	2008-12-01 16:50:25.907	8986	0
28663	1	2008-12-01 16:51:09.093	8938	0
28664	0	2008-12-01 16:51:45.453	8998	0
28667	1	2008-12-01 16:30:24.41	8926	0
28668	0	2008-12-01 16:31:41.989	8980	0
28669	3	2008-12-01 16:33:02.423	8992	0
28670	2	2008-12-01 16:34:01.833	9004	0
28671	0	2008-12-01 16:39:58.037	8968	0
28672	2	2008-12-01 16:40:57.967	8974	0
28673	2	2008-12-01 16:43:56.122	8986	0
28674	0	2008-12-01 16:49:06.392	8998	0
28675	1	2008-12-01 16:51:19.048	9015	0
28677	2	2008-12-01 16:52:06.501	9093	0
28678	1	2008-12-01 16:53:11.829	9087	0
28679	1	2008-12-01 16:53:46.189	9033	0
28680	1	2008-12-01 16:55:11.212	9039	0
28681	1	2008-12-01 16:56:01.51	9099	0
28684	0	2008-12-01 16:57:23.141	9159	0
28685	3	2008-12-01 17:00:49.304	9153	0
28686	1	2008-12-01 17:03:51.221	9165	0
28687	3	2008-12-01 17:05:25.334	9172	0
28688	3	2008-12-01 17:07:01.142	9178	0
28689	3	2008-12-01 17:08:56.737	9093	0
28690	3	2008-12-01 17:13:24.819	9087	0
28691	0	2008-12-01 17:15:33.782	9099	0
28693	0	2008-12-01 17:06:06.87	9111	0
28694	0	2008-12-01 17:07:24.177	9087	0
28695	2	2008-12-01 17:10:35.156	9033	0
28696	0	2008-12-01 17:12:19.51	9093	0
28697	0	2008-12-01 17:13:59.793	9153	0
28698	3	2008-12-01 17:15:40.567	9099	0
28699	2	2008-12-01 17:17:28.87	9159	0
28700	2	2008-12-01 17:19:52.031	9105	0
28701	1	2008-12-01 17:21:02.695	9039	0
28702	1	2008-12-01 17:22:31.64	9123	0
28704	1	2008-12-01 17:12:54.048	9087	0
28705	0	2008-12-01 17:14:04.777	9033	0
28706	1	2008-12-01 17:15:15.639	9039	0
28707	1	2008-12-01 17:17:13.752	9093	0
28708	2	2008-12-01 17:17:43.658	9045	0
28709	2	2008-12-01 17:20:00.726	9099	0
28710	1	2008-12-01 17:21:09.874	9051	0
28711	2	2008-12-01 17:22:44.10	9105	0
28712	2	2008-12-01 17:23:40.149	9057	0
28714	2	2008-12-01 17:26:50.878	9051	0
28715	0	2008-12-01 17:28:09.385	9033	0
28716	1	2008-12-01 17:29:11.594	9039	0
28717	3	2008-12-01 17:29:57.987	9093	0
28718	1	2008-12-01 17:30:58.192	9087	0
28734	1	2008-12-16 15:11:52.933	4817	0
28735	1	2008-12-16 15:12:05.905	4751	0
28736	2	2008-12-16 15:12:19.053	4721	0
28737	0	2008-12-16 15:12:31.148	4715	0
28738	2	2008-12-16 15:12:43.461	4687	0
28768	0	2009-03-24 18:33:39.138	7254	0
28769	0	2009-03-24 18:33:44.453	7270	0
28807	2	2009-03-25 11:58:27.685	29197	0
28808	3	2009-03-25 12:01:03.645	28931	0
28809	3	2009-03-25 12:02:50.735	28818	0
28810	1	2009-03-25 12:03:31.656	28892	0
28811	2	2009-03-25 12:03:59.849	28912	0
28813	2	2009-03-25 12:08:08.782	29221	0
28814	2	2009-03-25 12:12:02.682	28818	0
28815	2	2009-03-25 12:12:43.232	28931	0
28816	1	2009-03-25 12:13:11.60	28902	0
28817	1	2009-03-25 12:17:19.201	28989	0
28818	2	2009-03-25 12:17:49.805	29074	0
28819	2	2009-03-25 12:18:24.861	28921	0
28820	0	2009-03-25 12:19:12.93	29084	0
28821	0	2009-03-25 12:19:50.089	28798	0
28822	1	2009-03-25 12:20:08.353	29111	0
28823	1	2009-03-25 12:20:55.579	29148	0
28824	3	2009-03-25 12:21:41.989	29177	0
28825	1	2009-03-25 12:22:47.731	29197	0
28852	1	2009-03-25 13:30:50.097	29029	0
28853	2	2009-03-25 13:37:37.454	28931	0
28854	-1	2009-03-25 13:38:35.172	28902	0
28855	-1	2009-03-25 13:38:49.779	28921	0
28856	-1	2009-03-25 13:39:07.874	28818	0
28857	-1	2009-03-25 13:39:17.466	28892	0
28871	1	2009-03-26 10:23:43.808	29392	0
28872	3	2009-03-26 10:23:57.896	29241	0
28873	2	2009-03-26 10:24:11.148	29260	0
28874	0	2009-03-26 10:24:25.681	29270	0
28875	1	2009-03-26 10:24:40.821	29284	0
28878	-1	2009-03-26 10:31:02.902	29029	0
28879	-1	2009-03-26 10:32:12.879	28818	0
28880	-1	2009-03-26 10:32:27.99	28892	0
28881	-1	2009-03-26 10:32:35.743	28912	0
28882	-1	2009-03-26 10:32:43.719	28999	0
28883	-1	2009-03-26 10:32:51.193	29009	0
28906	2	2009-03-26 10:58:46.15	29148	0
28907	1	2009-03-26 10:59:00.548	28931	0
28908	1	2009-03-26 10:59:12.993	28818	0
28909	3	2009-03-26 10:59:50.916	28892	0
28910	2	2009-03-26 11:00:57.114	28921	0
28911	1	2009-03-26 11:01:16.841	28902	0
28912	1	2009-03-26 11:01:49.115	28989	0
28913	0	2009-03-26 11:02:30.003	29074	0
28914	0	2009-03-26 11:03:45.384	29084	0
28915	0	2009-03-26 11:04:28.541	28798	0
28916	1	2009-03-26 11:04:41.244	29111	0
28917	3	2009-03-26 11:05:02.748	29177	0
28918	1	2009-03-26 11:05:22.745	29197	0
28919	0	2009-03-26 11:05:40.065	29207	0
28921	0	2009-03-26 11:09:36.871	29863	0
28922	2	2009-03-26 11:11:05.431	29332	0
28923	2	2009-03-26 11:11:34.974	29342	0
28924	0	2009-03-26 11:11:58.13	29531	0
28925	1	2009-03-26 11:12:53.143	29362	0
28926	3	2009-03-26 11:13:23.528	29538	0
28927	1	2009-03-26 11:19:26.722	29474	0
28928	1	2009-03-26 11:20:50.298	29511	0
28929	1	2009-03-26 11:22:07.40	29521	0
28930	1	2009-03-26 11:22:30.511	29878	0
28932	0	2009-03-26 11:25:38.873	29783	0
28933	3	2009-03-26 11:27:05.374	29691	0
28934	0	2009-03-26 11:27:42.777	29611	0
28935	2	2009-03-26 11:28:38.683	29671	0
28936	2	2009-03-26 11:29:49.044	29681	0
28937	1	2009-03-26 11:30:18.347	29813	0
28938	1	2009-03-26 11:31:00.90	29823	0
28939	0	2009-03-26 11:31:27.476	29622	0
28940	2	2009-03-26 11:32:06.871	29833	0
28941	3	2009-03-26 11:33:00.943	29843	0
28944	0	2009-03-26 11:35:48.823	29167	0
28945	-1	2009-03-26 11:36:03.016	28818	0
28946	-1	2009-03-26 11:36:11.823	28892	0
28947	-1	2009-03-26 11:36:18.782	28912	0
28948	-1	2009-03-26 11:36:26.207	28999	0
28950	-1	2009-03-26 11:49:54.103	29124	0
28951	-1	2009-03-26 11:51:37.702	28818	0
28952	-1	2009-03-26 11:51:50.63	28892	0
28953	-1	2009-03-26 11:51:59.89	28912	0
28954	-1	2009-03-26 11:52:38.039	28999	0
28956	-1	2009-03-26 12:09:03.533	7270	0
28957	-1	2009-03-26 12:10:46.572	7254	0
28959	-1	2009-03-26 12:11:25.264	7254	0
28960	-1	2009-03-26 12:12:23.06	7270	0
28978	1	2009-03-26 12:28:22.715	6342	0
28979	-1	2009-03-26 12:28:46.966	7276	0
28981	-1	2009-03-26 12:31:01.543	7276	0
28982	-1	2009-03-26 12:33:56.712	6342	0
28984	-1	2009-03-26 12:34:39.455	6297	0
29019	-1	2009-03-26 12:57:49.036	6342	0
29020	-1	2009-03-26 13:00:45.712	7276	0
29022	-1	2009-03-26 13:04:37.695	7270	0
29023	-1	2009-03-26 13:09:22.737	7254	0
29025	-1	2009-03-26 13:12:02.184	7270	0
29026	-1	2009-03-26 13:12:44.883	7254	0
29037	-1	2009-04-24 04:08:56.924	29569	0
29038	-1	2009-04-24 04:09:34.355	29633	0
29039	-1	2009-04-24 04:13:05.938	29559	0
29040	0	2009-04-24 04:14:31.845	29579	0
29041	0	2009-04-24 04:14:47.356	29644	0
29042	0	2009-04-24 04:15:02.734	29739	0
29043	0	2009-04-24 04:15:15.865	29709	0
29044	0	2009-04-24 04:15:29.258	29719	0
\.


--
-- Data for Name: relatedcontent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY relatedcontent (id, filename, creatorid, nodeid, relatedcontentinfoid, recover) FROM stdin;
7163	exploit.c	6272	\N	7164	f
21863	cv.log	6272	\N	7164	f
4036	iptables.savefile	72	3593	\N	f
4035	usuarios.sql	72	80	\N	f
4183	t1.as	72	4167	\N	f
4182	imap.rar	72	4164	\N	f
4209	README.txt	72	\N	\N	f
4249	cartel.jpg	4210	4282	\N	f
4311	url.txt	4210	4291	\N	f
4312	url.txt	4210	4290	\N	f
12246	IMG00025.jpg	6272	\N	12247	f
7264	El desarrollo sostenible en la Universidad de La Laguna.doc	6272	\N	7161	f
5701	Mediator1.1	72	3596	\N	f
12303	SistemaDecimal.htm	4212	\N	9240	f
5859	Adapter1.1	72	\N	\N	f
5860	Bridge1.jpg	72	\N	5863	f
5858	SOMA3.TXT	72	3595	5865	f
12838	Subtracao.htm	4212	\N	10521	f
12886	Adicao.htm	4212	\N	10188	f
12955	Problemas+e-.htm	4212	\N	10056	f
13546	Multiplica.htm	4212	\N	13547	f
16739	Dividir.htm	4212	\N	15351	f
17766	Problemasxediv.htm	4212	\N	18183	f
18425	Problemas.htm	4212	\N	17431	f
21870	gato.odt	6272	\N	7258	t
12291	Makefile	6272	\N	7258	f
24330	exploit.c	6272	\N	12247	t
28732	5ª-avalia1-1ºT-2008.doc	4212	\N	9240	t
28745	recuperacao.htm	4350	\N	28746	t
28747	Educação Tecnológica html.htm	4350	\N	28748	t
28804	resumo_cap1_pesquisa_qualitativa_Eliaquim.htm	4350	\N	28805	f
\.


--
-- Data for Name: relatedcontentgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY relatedcontentgroups (relatedcontentid, contentgrouppropertyid, groupid) FROM stdin;
4036	2	17
4182	2	17
4183	2	17
4209	1	17
5858	2	17
5859	2	17
5860	2	17
\.


--
-- Data for Name: relatedcontentinfo; Type: TABLE DATA; Schema: public; Owner: graph
--

COPY relatedcontentinfo (id, description, nodeid) FROM stdin;
5862	Desc001	78
5863	Node002	80
5865	descripcion problema sgerais	4167
7161	\N	6284
7164	\N	6285
7258	\N	6287
9240	Nesta sequência você estudará sobre o sistema de numeração decimal. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7821
10188	Nesta sequência você estudará sobre a soma. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7819
10521	Nesta sequência você estudará sobre a subtração. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7820
10056	Nesta sequência você estudará sobre os problemas com soma e subtração. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7816
12247	\N	6286
12796	\N	4159
13407	\N	13218
13409	\N	13208
13412	\N	13202
13539	\N	13229
13547	Nesta sequência você estudará sobre a multiplicação. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7817
13571	\N	13557
14916	\N	14608
14921	\N	14605
15351	Nesta sequência você estudará sobre divisão. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7823
18183	Nesta sequência você estudará os problemas com multiplicação e divisão. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7822
17431	Nesta sequência você estudará os problemas com as 4 operações matemáticas. Clique sobre o documento e faça a leitura e os exercícios com muita atenção. Bom estudo!!!	7824
18611	\N	15394
19843	\N	15396
21708	\N	16903
24374	\N	16519
24593	\N	16906
28746	\N	28796
28748	\N	28791
28805	\N	28793
28894	\N	28792
29035	\N	28790
\.


--
-- Data for Name: responserelatedcontent; Type: TABLE DATA; Schema: public; Owner: graph
--

COPY responserelatedcontent (id, filename, relatedcontentid, testuserid) FROM stdin;
13415	\N	7163	9728
5864	Command1.jpg	5860	190
5866	Composite.1	5858	190
5882	\N	5860	5867
13548	\N	13546	5482
13894	\N	12955	13876
16740	\N	16739	5482
18184	\N	17766	5482
18426	\N	18425	5482
23363	\N	12303	22685
23515	\N	18425	22721
25686	\N	12886	23786
25776	\N	13546	23758
25789	\N	12838	23786
25803	\N	12886	23767
25812	\N	18425	23777
26374	\N	12303	26350
26375	\N	18425	23767
27708	\N	12303	27015
27709	\N	12886	27006
27717	\N	12886	27024
27761	\N	12303	26407
27790	\N	12838	27015
27820	\N	12838	27024
27821	\N	13546	27006
27828	\N	18425	26997
27964	\N	18425	26350
28053	\N	16739	27024
28054	\N	16739	27006
28065	\N	17766	27015
28083	\N	18425	27015
28230	\N	17766	27006
28330	\N	18425	27006
28430	\N	12303	28173
28431	\N	12886	28164
28432	\N	12303	28182
28497	\N	16739	28173
28498	\N	16739	28191
7165	Test.java	7163	7158
7265	\N	7264	7158
28575	\N	17766	28182
28589	\N	17766	28173
28632	\N	18425	28191
28633	\N	18425	23758
28665	\N	18425	28173
28682	\N	18425	28182
10009	\N	7264	9728
12294	\N	12291	9728
12293	\N	12291	9728
12304	\N	12303	5482
12839	\N	12838	5482
12887	\N	12886	5482
12956	\N	12955	5482
28777	\N	28745	28749
28826	\N	28804	28749
28876	\N	28747	28749
\.


--
-- Data for Name: respvar; Type: TABLE DATA; Schema: public; Owner: root
--

COPY respvar (id, response, questionid) FROM stdin;
68	2	67
69	1,2	67
70	123	67
71	154	67
74	1	73
75	2	73
76	3	73
27493	4/5	13985
27494	1/5	13985
27495	2/5	13985
29256	gráfico a)	29241
29257	gráfico b)	29241
29258	gráfico c)	29241
29259	gráfico d)	29241
188	asdasas	187
189	dsdd	187
10571	reta paralela ao eixo x\r\n	10570
10572	reta que corta o eixo x em -2 e o eixo y em 3\r\n	10570
10573	parábola com a concavidade voltada para cima\r\n	10570
10574	parábola com a concavidade voltada para baixo\r\n	10570
26186	8	7400
26187	4	7400
13456	Cuentas digitales	13271
13457	Electrones	13271
26188	4$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7400
26189	8$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7400
13458	Fotones	13271
13459	Adimensional	13271
13460	Voltios	13271
299	2	298
301	3	300
305	UYUYUYUYU	304
307	7	306
309	8	308
311	8	310
313	yuy	312
315	99898	314
317	99	316
26191	9	7410
26192	14	7410
26193	13	7410
26194	12	7410
24114	29	4924
24115	30	4924
13461	Horizontal y vertical	13256
13462	Horizontal y recto	13256
13463	Vertical	13256
13464	Vertical y recto	13256
24116	28	4924
24117	31	4924
10579	32 anos\r\n	10578
10580	15 anos \r\n	10578
10581	30 anos\r\n	10578
10582	5 anos\r\n	10578
10588	38,75\t\t\r\n	10587
13465	Ser potencia de dos	13261
19275	23	16395
10589	38\t\t\t\r\n	10587
10590	38,25\t\t\r\n	10587
13466	Tener forma ovalada	13261
13467	No sigue ninguna regla	13261
19276	a	16522
19277	b	16522
19278	c	16522
19279	d	16522
13469	Electrónica de potencia	13277
13470	Electrónica de control	13277
13471	Mecánica de soporte	13277
13472	Pre-etapa óptica	13277
13473	Capacidad de almacenamiento de carga por pixel	13282
13474	Capacidad de almacenamiento de fotones por unidad de tiempo	13282
10591	38,5\r\n	10587
19280	a	16532
19281	b	16532
19282	c	16532
19283	d	16532
13481	Vertical	13480
13482	Horizontal	13480
13483	Oblicuo	13480
26196	x - 2y = - 6	7420
26197	x + 2y = 6	7420
26198	x + y = 3	7420
26199	y - x = 3	7420
19284	100x+25	16542
19285	100x-25	16542
19286	25x+65	16542
13496	Distancia entre objetos celestes	13265
13497	Contenido en frecuencia de la radiación	13265
13498	Magnitud de objetos celestes	13265
19287	10x+25	16542
19288	a	16552
19289	b	16552
19290	c	16552
13499	Origen de objetos celestes	13265
13500	Temperatura de objetos celestes	13265
19291	d	16552
29266	gráfico a)	29260
29267	gráfico b)	29260
29268	gráfico c)	29260
29269	gráfico d)	29260
26201	1/2	7430
26202	1	7430
26203	2	7430
29280	gráfico a)	29270
29281	gráfico b)	29270
29282	gráfico c)	29270
29283	gráfico d)	29270
29290	gráfico a)	29284
29291	gráfico b)	29284
29292	gráfico c)	29284
29293	gráfico d)	29284
29310	gráfico a)	29304
29311	gráfico b)	29304
29312	gráfico c)	29304
29313	gráfico d)	29304
29314	gráfico a)	29294
29315	gráfico b)	29294
29316	gráfico c)	29294
29317	gráfico d)	29294
29318	Coincidentes.	29231
29319	Perpendiculares.	29231
18180	b	14180
18181	c	14180
18182	d	14180
19565	Joana pagou R$ 7,00 e Vera pagou R$ 21,00	17393
29320	Concorrentes e não perpendiculares.	29231
29321	d)\tNulas, pois não existe ponto de intersecção para m + n.	29231
19606	V=6,75h	18158
19607	Nenhuma dessas	18158
19566	Joana pagou R$ 7,50 e Vera pagou R$ 20,50	17393
19567	Joana pagou R$ 6,00 e Vera pagou R$ 22,00	17393
19568	Joana pagou R$ 15,00 e Vera pagou R$ 13,00	17393
26204	3	7430
27498	1/6	13995
27499	2/9	13995
26206	0,180664 m² 	7440
26207	0,00180664 m²	7440
26208	1,80664 m²	7440
19569	32 alunos	17403
19570	36 alunos	17403
19571	40 alunos	17403
23966	8621	4757
23967	8261	4757
19572	44 alunos	17403
23968	6281	4757
23969	8612	4757
26209	18,0664 m²	7440
23970	100	4763
19573	a	17413
19574	b	17413
19575	c	17413
26211	56	7450
26212	5600	7450
26213	600	7450
26214	560	7450
19576	d	17413
23971	01	4763
23972	11	4763
23973	99	4763
19577	Par	17423
19578	Impar	17423
19579	Primo	17423
26216	-20	7460
26217	-30	7460
27500	 4/9	13995
26218	-48	7460
26219	-58	7460
27501	16/81	13995
26221	13,5cm	7470
26222	6cm	7470
26223	9cm	7470
26224	5cm	7470
26226	57	7480
26227	128	7480
26228	64	7480
29328	gráfico a)	29322
26229	38	7480
29329	gráfico b)	29322
29330	gráfico c)	29322
23974	5	4769
23975	4	4769
23976	3	4769
29331	gráfico d)	29322
26231	40º	7490
23977	2	4769
26232	20º	7490
26233	60º	7490
26234	30º	7490
26236	32º20’26’’	7500
26237	34º16’	7500
26238	34º16’12’’	7500
26239	17º8’	7500
12320	8\t\t\r\n	12319
12321	13	12319
12322	16\t\t\r\n	12319
12323	26\t\t\r\n	12319
26241	10cm	7510
26242	15cm	7510
26243	20cm	7510
26244	12cm	7510
26246	infinitos	7592
24118	19 - 18 ; 22 - 13 ; 15 - 9	4930
24119	13 - 13 ; 22 - 9 ; 19 - 18	4930
24120	19 - 15 ; 22 - 18; 13 - 9	4930
24121	18 - 15 ; 22 - 9 ; 19 - 13	4930
24266	10	5118
24267	8	5118
24268	6	5118
24269	7	5118
26247	1,9999	7592
26248	2	7592
26249	3	7592
12391	12h\t  \t\r\n	12390
12392	12h30min\t\r\n	12390
12393	13h\t   \t\r\n \r\n	12390
12394	13h30min \t \r\n	12390
18178	e	14180
12398	7\t\t\r\n	12397
12399	10\t\t\r\n	12397
12400	12	12397
12401	13	12397
18179	a	14180
26251	(2/3, 2/3)	7702
19592	a	17756
26252	(1/2, 1/3)	7702
19593	b	17756
19594	c	17756
19595	d	17756
26253	(2/3, 1/2)	7702
26254	(1/2, 1/2)	7702
12503	Todas as afirmações são verdadeiras.\r\n	12502
26256	6	7711
29338	gráfico a)	29332
29339	gráfico b)	29332
29340	gráfico c)	29332
29341	gráfico d)	29332
19596	a	18138
19597	b	18138
19598	c	18138
19599	d	18138
29348	gráfico a)	29342
29349	gráfico b)	29342
29350	gráfico c)	29342
29351	gráfico d)	29342
29358	gráfico a)	29352
29359	gráfico b)	29352
29360	gráfico c)	29352
29361	gráfico d)	29352
29368	gráfico a)	29362
29369	gráfico b)	29362
29370	gráfico c)	29362
29371	gráfico d)	29362
19604	V=6+0,75	18158
19605	V=6+0,75h	18158
29378	gráfico a)	29372
29379	gráfico b)	29372
29380	gráfico c)	29372
29381	gráfico d)	29372
3707	dwwdww	3706
26257	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>12</mn><mo> &sdot; </mo><msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7711
26258	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>24</mn><mo> &sdot; </mo><msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7711
26259	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>3</mn><mo> &sdot; </mo><msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7711
23978	o valor posicional do algarismo 5 é 500.	4775
23979	o valor posicional do algarismo 3 é 3000.	4775
23980	o valor posicional do algarismo 6 é 6.	4775
26261	30 min	7774
26262	10 min	7774
26263	1h 03min 20s	7774
26264	1h 10 min 12s	7774
27506	1	14000
27507	1/2	14000
27508	2/5	14000
27509	1/4	14000
29388	gráfico a)	29382
29389	gráfico b)	29382
29390	gráfico c)	29382
29391	gráfico d)	29382
3786	srsdfsdfsdf	3736
3787	sdfsdfsdfsd ""	3736
3788	if a<b and z="string" $##<math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow> <munder> <mrow> <mi>lim</mi> </mrow> <mrow><mi>n</mi> <mo>&rarr;</mo> <mn>1</mn></mrow> </munder> <mrow><mrow> <munderover> <mo>&prod;</mo> <mrow><mi>i</mi><mo> &equals; </mo><mn>1</mn></mrow> <mrow> <mi> &omega; </mi> </mrow> </munderover> <mrow><mi>w</mi></mrow> </mrow></mrow> </mrow></math>##$	3736
3789	sadyusadas  " sakdjsakdjsa <maoidfoejfds	3736
3798	 $##<math xmlns="http://www.w3.org/1998/Math/MathML"> <mroot> <mrow><mn>5</mn></mrow> <mrow><mn>2</mn></mrow> </mroot></math>##$	3740
3799	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow> <mi> Θ </mi> </mrow> <mrow><mi> det </mi><mfenced> <mrow> <mi> Φ </mi> </mrow> </mfenced></mrow> </msup></math>##$	3740
3800	aaaa$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi> max </mi><mfenced> <mrow><mn>7</mn></mrow> </mfenced></math>##$	3738
3801	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mrow><mn>5</mn></mrow></mfenced></math>##$	3738
3898	afaga	1893
3899	bnbnbnbn$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi> max </mi><mfenced> <mrow><mfenced open="|" close="|"><mrow><mn>5</mn></mrow></mfenced></mrow> </mfenced></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi> log </mi><mfenced> <mrow><mi> ln </mi><mfenced> <mrow><mn>5</mn></mrow> </mfenced></mrow> </mfenced></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msub> <mrow><mn>5</mn> </mrow> <mrow> <mn>5</mn> </mrow> </msub></math>##$$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="|" close="|"><mrow><mn>9</mn></mrow></mfenced></math>##$	1893
3901	wwww	3900
3903	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>7</mn><mo> ⋅ </mo><mi>x</mi></mrow> <mrow><msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></mrow> </mfrac></math>##$	3902
3906	wwwww	3904
3915	ewrewrwe	3907
3918	z<dxz<xz<	3916
3920	werwrwrwerw	3919
3922	Einstein	3921
3923	Newton	3921
3924	Kafka	3921
3926	xxxxx	3925
4034	resp1	4033
4194	4	302
4201	1sfsdfsdfsdfsdfsadfsa	296
4241	resp1	4240
4242	resp2 	4240
4244	respuesta4	4243
4303	f1	4302
4304	f2	4302
4305	f3	4302
4326	valida	4325
4327	erronea	4325
4330	true	4329
4331	false	4329
23981	o valor posicional do algarismo 5 é 58.	4775
19296	a	16572
19297	b	16572
19298	c	16572
19299	d	16572
19300	4	16584
19301	24	16584
19302	15	16584
19303	Não tem solução	16584
19304	a	16599
19305	b	16599
19306	c	16599
19307	19	16607
19308	27	16607
19309	3	16607
19310	0	16607
26266	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>25</mn></mtd><mtd><mn>24</mn></mtd><mtd><mn>24</mn></mtd><mtd><mn>26</mn></mtd></mtr><mtr><mtd><mn>20</mn></mtd><mtd><mn>23</mn></mtd><mtd><mn>12</mn></mtd><mtd><mn>20</mn></mtd></mtr></mtable></mfenced></math>##$	7761
26267	Não é possível responder pois a multiplicação entre matrizes não pode ser feita.	7761
26268	 $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>51</mn></mtd><mtd><mn>60</mn></mtd><mtd><mn>76</mn></mtd><mtd><mn>96</mn></mtd></mtr><mtr><mtd><mn>60</mn></mtd><mtd><mn>67</mn></mtd><mtd><mn>68</mn></mtd><mtd><mn>100</mn></mtd></mtr></mtable></mfenced></math>##$	7761
26269	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>13</mn></mtd><mtd><mn>18</mn></mtd><mtd><mn>26</mn></mtd><mtd><mn>35</mn></mtd></mtr><mtr><mtd><mn>20</mn></mtd><mtd><mn>22</mn></mtd><mtd><mn>28</mn></mtd><mtd><mn>40</mn></mtd></mtr></mtable></mfenced></math>##$	7761
27514	 1/3	14030
27515	2/3.	14030
27516	1/2.	14030
27517	 3/4.	14030
21015	a	20447
5961	Por la cantidad de datos	5960
5962	Por su trama	5960
5963	Por su color o por su trama	5960
21016	b	20447
6084	Suma.	6083
6085	Contar.	6083
6086	Totalizar.	6083
6088	Suma.	6087
6089	Contar.	6087
6090	Totalizar.	6087
21017	c	20447
6096	Son datos de resumen.	6095
6097	Son valores de celdas origen.	6095
6098	Son datos detallados.	6095
6104	Campos de datos.	6103
6105	Campos de datos y Campos calculados.	6103
6106	Campos de datos y Elementos calculados.	6103
6108	Seleccionaremos la serie a tratar.	6107
6109	Seleccionaremos los marcadores de datos.	6107
6401	Desarrollado por el Barón Otto Wilhelm von Monte-Carlo und Runge-Kutta, es un método para encontrar aproximaciones a ecuaciones diferenciales ordinarias mediante iteraciones.\r\n	6400
6402	El nombre se debe al Casino de Monte-Carlo y bajo esta etiqueta se agrupan métodos muy diferentes entre sí, que tienen en común utilizar una función de evaluación estocástica.\r\n	6400
6343	falsa	6342
6344	correcta	6342
6345	falsa	6342
6346	falsa	6342
6403	Desarrollado por Armando del Monte y Gian-Carlo Filipini, es un algoritmo de búsqueda minimax aplicado a diversos problemas de optimización.\r\n	6400
6436	TEIDE	6433
6437	TEEIDE	6433
6439	Nuevo metafile y cerrar metafile	6438
6440	Nuevo metafile y abrir metafile	6438
6441	Abrir metafile y cerrar metafile	6438
6442	Abrir metafile, cerrar metafile y nuevo metafile	6438
6444	Abre un fichero .vme y carga los datos indicados en ese fichero de la base de datos access	6443
26271	1/5	7756
26272	1/216	7756
26273	1/1296	7756
26274	1/25	7756
6044	En la parte izquierda del área de datos.	6043
6045	En la parte inferior del área de datos.	6043
6046	En la parte superior del área de datos.	6043
6048	Fila o Columna.	6047
6049	Fila.	6047
6050	Columna.	6047
27538	5/6 \r\n	14035
27539	13/18	14035
6056	Pueden repetirse las veces que haga falta dentro del campo.	6055
27540	2/3	14035
27541	5/12	14035
21018	d	20447
5973	Sí	5972
5974	No	5972
5975	Sí, excepto los circulares	5972
5981	Los títulos de las columnas o de las filas de datos de la hoja de cálculo.	5980
5982	Los títulos de las columnas de datos de la hoja de cálculo.	5980
5983	Los títulos de las filas de datos de la hoja de cálculo.	5980
19616	a	18437
19617	b	18437
18715	A e E	13573
5989	Unidades	5988
18716	A, C e E	13573
18717	A, B e E	13573
5990	Fechas	5988
5991	Valores enteros	5988
5997	Signos que sirven para desplazarse por el gráfico.	5996
5998	Hiperenlaces hacia los datos.	5996
5999	Valores procedentes de las celdas de la hoja.	5996
18718	Apenas A	13573
6445	Abre un fichero .vne y carga los datos indicados en ese fichero de la base de datos access	6443
6446	Abre un fichero .vne y carga los datos indicados en ese fichero de la base de datos excel	6443
6002	Serie.	6000
6003	Categoría.	6000
6004	Línea recta o curva de separación entre datos.	6000
6008	Y.	6007
6009	X.	6007
6010	Z.	6007
6012	Y.	6011
6013	X.	6011
6014	Z.	6011
6016	Datos.	6015
6017	Series.	6015
6018	Categorías.	6015
6028	Datos.	6027
6029	Series.	6027
6030	Categorías.	6027
6032	Aquél que solamente se repite una vez.	6031
6033	El más próximo al área de datos.	6031
6034	El primero por la izquierda.	6031
6036	Interno o Externo.	6035
6037	Interior o Exterior.	6035
6038	Interior o Externo.	6035
6057	Solamente se aplican a campos de fila.	6055
6058	Son valores únicos dentro del campo.	6055
6060	Una subcategoría de un campo en un informe de tabla dinámica.	6059
6061	Un subelemento de un campo en un informe de tabla dinámica.	6059
6062	Una combinación de datos de un campo en un informe de tabla dinámica.	6059
6064	Campo de referencia.	6063
6065	Campo de filtro.	6063
6066	Campo de orden.	6063
6068	La esquina inferior izquierda del informe de tabla dinámica.	6067
6069	La esquina superior derecha del informe de tabla dinámica.	6067
6070	La esquina superior izquierda del informe de tabla dinámica.	6067
6072	El informe mostrará los datos referidos dicho elemento.	6071
6073	El informe se ordenará según dicho elemento.	6071
6074	El informe tomará el formato de dicho elemento.	6071
6076	Un botón de opción para seleccionar cada campo.	6075
6077	Una casilla de verificación para seleccionar cada campo.	6075
6078	Cada campo se selecciona directamente.	6075
19618	c	18437
19619	d	18437
6249	Series.	6191
6250	Categorías.	6191
6251	Depende del tipo de gráfico.	6191
6252	Marcadores de datos.	6191
6253	Filas y columnas.	6191
18719	LXXXIX e CCVVII	13583
6447	Abre un fichero .mdb y carga los datos indicados en ese fichero de la base de datos access	6443
10614	R$ 9.600,00\r\n	10613
10615	R$ 10.550,00\r\n	10613
10616	R$ 11.850,00\r\n	10613
10617	R$ 13.250,00\r\n	10613
19620	x=15-21	18447
19621	x=21+15	18447
19622	–21x=15\t	18447
10623	30 min\r\n	10622
10624	1 h\r\n	10622
10625	1 h 30 min\r\n	10622
10626	2 h\r\n	10622
10631	menor que 90.\r\n	10630
10632	maior que 90 e menor que 100.\r\n	10630
10633	maior que 100 e menor que 110.\r\n	10630
10634	maior que 110 e menor que 120.\r\n	10630
19623	x=15/21	18447
19624	7xy	18457
23982	4704	4781
23983	447	4781
23984	4470	4781
19625	12xy	18457
19626	3x+4y	18457
25410	10	8842
25411	12	8842
25412	11	8842
27566	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>250</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14063
27567	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>375</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14063
27568	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>425</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14063
27555	29/39	14045
25413	15	8842
27556	7/15	14045
27557	1/2	14045
27558	11/15	14045
27546	 1/16\r\n	14040
27547	 3/8	14040
27548	9/16	14040
27549	3/16	14040
27569	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>500</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14063
27561	3542 g	14058
27562	5478 g	14058
27563	 3254,4 	14058
27564	2145 g	14058
25414	27	8848
25415	37	8848
25416	54	8848
25417	44	8848
23568	 7,0\r\n\r\n	13713
25418	43	8854
25419	44	8854
23569	6,5	13713
23570	8,0	13713
23571	7,5	13713
19627	4x+3y	18457
25420	45	8854
25421	50	8854
27574	2 cm	14072
25422	52	8860
25423	48	8860
27575	3 cm	14072
27576	4 cm	14072
25424	36	8860
25425	69	8860
27577	5 cm	14072
25426	11	8866
19628	54	18467
25427	12	8866
25428	7	8866
25429	8	8866
19629	20	18467
19630	54x	18467
19631	20x	18467
25430	185	8872
19632	sim, sempre será verdadeira	18477
19633	sim, depende do valor de Y	18477
19634	sim, desde que X=R\t	18477
19635	Não, pois X, Y e R são sempre diferentes	18477
19636	Não, nunca será verdadeira	18477
25431	195	8872
25432	205	8872
25433	175	8872
19637	51 pt e 101 pt	18489
19638	50 pt e 103pt	18489
25434	15	8878
25435	16	8878
25436	17	8878
25437	18	8878
25438	R$ 1200,00	8884
25439	R$ 3300,00	8884
25440	R$ 2200,00	8884
25441	R$ 2450,00	8884
25442	12	8896
25443	13	8896
25444	14	8896
25445	15	8896
25446	R$ 4,00	8890
25447	R$ 5,00	8890
25448	R$ 4,50	8890
25449	R$ 3,20	8890
25450	3	8902
25451	4	8902
25452	5	8902
25453	6	8902
25454	720	8908
25455	540	8908
25456	680	8908
25457	312	8908
25458	R$ 45,00	8914
25459	R$ 46,00	8914
25460	R$ 24,00	8914
25461	R$ 48,00	8914
25462	320	8920
25463	400	8920
25464	450	8920
25465	480	8920
25466	166	8926
25467	176	8926
25468	186	8926
25469	196	8926
25470	1000	8932
25471	1320	8932
25472	1450	8932
25473	1550	8932
25474	13	8938
25475	14	8938
25476	15	8938
25477	16	8938
25478	22	8944
19639	52 pt e 101 pt	18489
19640	51pt e 100 pt	18489
25479	23	8944
25480	24	8944
25481	25	8944
19641	31 m e 10,33 m	18499
25482	5 cheias e sobrarão 5 livros	8950
25483	4 cheias e sobrarão 5 livros	8950
26276	50.063.860	7747
26277	10.125.230	7747
26278	110.340.000	7747
26279	15.456.345	7747
19642	30 m e 10 m	18499
19643	33 m e 11 m	18499
19644	31,5 m e 10,5 m	18499
19645	a	16562
25484	4 cheias e sobrarão 4 livros	8950
25485	5 cheias e sobrarão 4 livros	8950
18720	LXXXIX e CCXII	13583
18721	LXXXVIIII e CCXII	13583
18722	LXXXXI e CCXIIIV	13583
25486	R$ 22,00	8956
25487	R$ 23,00	8956
19646	b	16562
19647	c	16562
19648	d	16562
25488	R$ 24,00	8956
25489	R4 25,00	8956
19649	x+2ay	16861
25499	4	8962
25500	5	8962
25501	6	8962
25502	7	8962
26288	50 %	7738
26289	 1 %	7738
19650	2(3ax+4ay)	16861
19651	14a(x+y)	16861
19652	2a(3x+4y)	16861
23985	4740	4781
26290	25 %	7738
26291	10 %	7738
27602	32 cm 	14108
27603	24 cm	14108
24122	16	4940
24123	15	4940
27604	16 cm	14108
27605	12 cm	14108
27583	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	14084
27584	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>2</mn><mo> &sdot; </mo><msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	14084
27585	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>3</mn><mo> &sdot; </mo><msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	14084
27586	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>4</mn><mo> &sdot; </mo><msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	14084
27588	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>3</mn></mrow> </msqrt></math>##$	14095
27589	5	14095
18723	B=T-A-C	13598
27590	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>5</mn><mo> &sdot; </mo><msqrt> <mrow><mn>3</mn></mrow> </msqrt></math>##$	14095
27591	10	14095
21025	y=3+1	21019
21026	y=3x+1	21019
20433	27 palitos	20422
20434	24 palitos	20422
27597	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>8</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14103
27598	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>8</mn><mo> &sdot; </mo> <mi> &pi; </mi> </mrow> <mrow><mn>3</mn></mrow> </mfrac></math>##$	14103
27599	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>4</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14103
20435	21 palitos	20422
20436	29 palitos	20422
21027	y=4+x	21019
21028	y=4x+1	21019
27600	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>6</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	14103
18724	B=A-C-T	13598
18725	T=A+C-B	13598
18726	T=B-A-C	13598
26293	1/3	7729
26294	2/3	7729
26295	1/9	7729
26296	2/9	7729
27611	5	14118
27612	4	14118
27613	2,5	14118
27614	2	14118
27616	1 cm	14123
27617	1,5 cm	14123
27618	2 cm	14123
27619	2,5 cm	14123
25510	R$ 1312,00	8968
25511	R$ 1212,00	8968
25512	R$ 1450,00	8968
25513	R$ 1333,00	8968
25514	R$ 789,00	8974
25515	R$ 790,00	8974
25516	R$ 800,00	8974
25517	R$ 820,00	8974
27628	V= 64 cm3	14128
27629	V =32cm3	14128
27630	V = 16 cm3	14128
27631	 V = 48 cm3	14128
21035	84 palitos	21029
24124	14	4940
21036	83 palitos	21029
21037	64 palitos	21029
21038	63 palitos	21029
18731	7 E 9	14141
18732	9 E 10	14141
18733	8 E 10	14141
18734	8 E 9	14141
18735	8 e 11	14141
21466	a	18168
21467	b	18168
21468	c	18168
21044	Na primeira	21039
24125	17	4940
21045	Na segunda	21039
21046	As duas têm o mesmo preço	21039
18736	AC – DB	14147
18737	AC + DB – DC	14147
18738	AD + DC +DB	14147
18739	AD + DB	14147
18740	101	14156
18741	103	14156
18742	105	14156
18743	107	14156
21469	d	18168
20438	a	20437
20439	b	20437
21052	Sim	21047
21053	Não	21047
21054	Não sei	21047
20440	c	20437
20441	d	20437
21461	a	17195
21462	b	17195
21463	c	17195
21464	d	17195
21465	e	17195
21470	a	18427
21471	b	18427
21472	c	18427
21473	d	18427
18744	1	14169
21474	a	20402
18745	9	14169
18746	10	14169
18747	-10	14169
18748	100	14169
21475	b	20402
21476	c	20402
21477	d	20402
6110	Seleccionaremos los elementos de campo a mostrar.	6107
6116	De fila y columna.	6115
6117	De fila, columna y página.	6115
6118	De columna y de página.	6115
6120	Seleccionamos (Todas) del primer campo de página.	6119
6121	Seleccionamos (Todas) en todos los campos de página.	6119
6122	Ordenamos los campos de página existentes.	6119
6260	Puede tener o no un informe de tabla dinámica asociado. Ambos informes tienen campos que se corresponden entre si. Si cambiamos la posición de un campo en un informe, también cambiará el campo correspondiente del otro informe. En gráfico superior la numeración corresponde a 1 Campo de página, 2 Campo de datos, 3 Campo de categoría, 4 Campo de fila.	6221
6261	Puede tener o no un informe de tabla dinámica asociado. Ambos informes tienen campos que se corresponden entre si. Si cambiamos la posición de un campo en un informe, también cambiará el campo correspondiente del otro informe. En gráfico superior la numeración corresponde a 1 Campo de página, 2 Campo de datos, 3 Campo de categoría, 4 Campo de serie.	6221
6262	Puede tener o no un informe de tabla dinámica asociado. Ambos informes tienen campos que se corresponden entre si. Si cambiamos la posición de un campo en un informe, no cambiará el campo correspondiente del otro informe. En gráfico superior la numeración corresponde a 1 Campo de página, 2 Campo de datos, 3 Campo de categoría, 4 Campo de serie.	6221
6263	Siempre tiene un informe de tabla dinámica asociado. Ambos informes tienen campos que se corresponden entre si. Si cambiamos la posición de un campo en un informe, también cambiará el campo correspondiente del otro informe. En gráfico superior la numeración corresponde a 1 Campo de página, 2 Campo de datos, 3 Campo de categoría, 4 Campo de serie.	6221
6264	Siempre tiene un informe de tabla dinámica asociado. Ambos informes tienen campos que se corresponden entre si. Si cambiamos la posición de un campo en un informe, no cambiará el campo correspondiente del otro informe. En gráfico superior la numeración corresponde a 1 Campo de página, 2 Campo de datos, 3 Campo de categoría, 4 Campo de serie.	6221
6265	Siempre tiene un informe de tabla dinámica asociado. Ambos informes tienen campos que se corresponden entre si. Si cambiamos la posición de un campo en un informe, también cambiará el campo correspondiente del otro informe. En gráfico superior la numeración corresponde a 1 Campo de página, 2 Campo de datos, 3 Campo de categoría, 4 Campo de fila.	6221
27642	2/3	27635
27643	3/8	27635
27644	1/8	27635
27665	30 x 3,1415	27659
18749	apenas I	14306
27666	40 x 3,1415	27659
27667	50 x 3,1415	27659
18750	apenas III	14306
18751	II, III e IV	14306
25518	192	8980
25519	193	8980
25520	194	8980
25521	202	8980
26298	0,09	7724
26299	0,1	7724
18752	I e III	14306
18753	III e IV	14306
18754	17,870 m	14364
27668	60 x 3,1415	27659
26300	0,12	7724
18755	17,670 m	14364
18756	17,970 m	14364
18757	27,870 m	14364
26301	0,1	7724
27670	É bom mudar a escolha porque suas chances aumentaram de 33% para 50%;\r\n\t\r\n\t	27669
27671	Tanto faz. Como restam duas portas, suas chances serão de 50% se não mudar, e também de 50% se o fizer;	27669
18758	160 m2	14409
18759	168 m2	14409
27672	É bom mudar a escolha, porque as chances de acertar aumentaram de 33% (uma em três) para 66% (duas em três);	27669
18760	144 m2	14409
18761	172 m2	14409
27673	É melhor não mudar a escolha pois a chance de acertar continua a mesma.\r\n\r\n	27669
27641	1/2	27635
18762	48 m	14432
18763	50 m	14432
18764	52 m	14432
27655	1/2	27645
20443	a	20442
20444	b	20442
20445	c	20442
20446	d	20442
27656	1/3	27645
27657	1/4	27645
27658	1/6	27645
23592	14%\r\n\r\n	13759
23593	48%	13759
23594	54%	13759
23595	60%	13759
23596	8 árvores\r\n	13768
23597	140 árvores	13768
6124	Añadir un campo de página.	6123
6125	Añadir un campo de página y seleccionar elementos.	6123
6126	Quitar los campos de página existentes.	6123
6132	Proporcionan valores para comparar o medir.	6131
6133	No son imprescindibles en los gráficos dinámicos.	6131
6134	No es necesario que se resuman con ninguna función.	6131
6136	Se puede aplicar únicamente una función de resumen a la vez.	6135
6137	Se puede aplicar varias funciones de resumen a la vez.	6135
6138	Se puede aplicar varias funciones de resumen a la vez, pero siempre sobre campos distintos.	6135
6144	Se ubican en el eje de categorías.	6143
6145	Se ubican en la leyenda.	6143
6146	Pueden ubicarse en el eje de categorías o en la leyenda.	6143
7255	verdadera	7254
7256	falsa	7254
6152	Campos de categoría.	6151
6153	Campos de serie.	6151
6154	Campos de categoría y campos de serie.	6151
6156	Aparecen siempre en la leyenda.	6155
6157	Aparecen en el eje X.	6155
6158	Aparecen en el eje Y.	6155
7267	verdadera	7266
6164	Ambos campos siguen siendo de categoría y de serie.	6163
6165	Ambos campos no son intercambiables.	6163
6166	Intercambiarán su nomenglatura.	6163
6168	Los campos de serie.	6167
6169	Los campos de serie y página.	6167
6170	Los campos de serie, categoría y página.	6167
6172	En los gráficos dinámicos sí pueden contener repetidos.	6171
6173	Representan valores únicos para cada campo.	6171
6174	No aparecen ordenados en los gráficos dinámicos.	6171
7268	falsa	7266
27874	45,5 m	12057
6184	Se creará, únicamente, un nuevo informe de gráfico dinámico en una hoja nueva.	6183
6185	Se creará, únicamente, un nuevo informe de gráfico dinámico en la hoja que seleccionemos.	6183
6186	Se creará un nuevo informe de tabla dinámica y de gráfico dinámico en la hoja que seleccionemos.	6183
6188	Aparecerán siempre en una nueva hoja.	6187
6189	Podremos seleccionar en qué hoja deseamos que se muestren.	6187
6190	Aparecerán siempre en la hoja de datos.	6187
18777	0, 1, 2, 3 e 4	13607
25530	709	8986
18778	1 E 2	13607
18767	sim	14745
25531	799	8986
7274	verdadera	7270
7275	falsa	7270
23598	4 árvores	13768
25532	805	8986
25533	815	8986
18768	não	14745
18769	não sei	14745
26435	60	9291
26436	120	9291
26437	240	9291
23599	18 árvores 	13768
7277	true	7276
7278	false	7276
26438	300	9291
26440	1/25	9301
26441	1/36	9301
26442	1/12	9301
26443	1/275	9301
18770	48+6	14753
18771	48+42	14753
27871	57,74 m 	12057
26445	3/14	9331
26446	2/7	9331
27872	50 m	12057
26447	5/14	9331
26448	 3/7	9331
27873	86,66 m	12057
18772	56+42	14753
18765	54 m	14432
18766	nenhum desses valores	14432
26450	13/72	9341
18773	98	14753
18774	56+6	14753
18775	0, 1, 2 e 3	13607
18776	0, 1 E 2	13607
18779	18 m2	14765
18780	13,5 m2	14765
18781	9 m2	14765
18782	20,25 m2	14765
18783	528 m	14775
18784	66 m	14775
18785	216 m	14775
18786	33 m	14775
18787	N=r	14785
18788	N=r+r	14785
18789	N=r x r	14785
18790	N=r/r	14785
18791	Nenhuma dessas alternativas é correta.	14785
26451	1/18	9341
26452	5/18	9341
26453	1/9	9341
18797	84 m2	14809
18798	40 m2	14809
18799	42 m2	14809
18800	18,5 m2	14809
26455	1/7	9351
18801	múltiplos de 2	14819
18802	múltiplos de 4	14819
18803	números pares	14819
26456	1/2	9351
18804	números primos pares	14819
26457	3/8	9351
26458	11/21	9351
18805	Números que obedecem a fórmula: N=4-4X, onde N é um termo da seqüência e X é o número natural, incluindo zero.	14829
18806	Números impares	14829
28111	true	6300
28112	false	6300
28113	false	6300
28114	false	6300
26505	Perímetro da área de um triângulo de lado 6 unidades.	9568
26506	Área de um triângulo de base 6 unidades e altura 6 unidades.	9568
25535	1500	8992
25536	1600	8992
25537	1700	8992
25538	1800	8992
18807	Números primos	14829
26507	A área de um quadrado de lado 6 unidades.	9568
26508	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$-36=0	9568
26460	17/25	9356
26461	71/100	9356
26462	18/25	9356
26463	73/100	9356
18808	Números que obedecem a fórmula: N=3+4X, onde N é o termos da seqüência e X é um número natural.	14829
26465	1/9	9371
26466	1/6	9371
23986	22 222	4787
26467	1/3	9371
26468	2/9	9371
26470	8	9381
26471	10	9381
26472	12	9381
26473	14	9381
26475	49/4950	9386
26476	50/4950	9386
26477	1%	9386
26478	49/5000	9386
26480	10/36	9396
26481	5/32	9396
26482	5/36	9396
26483	5/35	9396
26485	7/11	9406
26486	8/11	9406
26487	3/11	9406
26488	5/11	9406
26510	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &minus; </mo><mn>49</mn></math>##$=0	9577
26511	Minha idade ao quadrado, diminuído de 49 é zero.	9577
26490	1/100	9416
26491	3/50	9416
26492	1/50	9416
26493	1/25	9416
26512	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><mn>49</mn><mo> &equals; </mo><mn>0</mn></math>##$	9577
26513	A área de um quadrado de lado 3,5 unidades	9577
26495	4/5	9426
26496	2/5	9426
26497	1/5	9426
26498	1/25	9426
26500	Minha idade ao quadrado mais 75 anos é igual a um século. Qual a minha idade?	9559
26501	Qual o número que elevado ao quadrado dá 25?	9559
26502	Qual o número que elevado ao quadrado mais 75 dá 100?	9559
26503	Um número menos vinte é igual a 15. Qual é esse número?	9559
26515	A soma das idades de meus filhos dá 5 anos. A idade do mais novo elevado ao quadrado a idade do mais velho mais 1.	9587
26516	A soma de dois números é igual a 5 e o triplo do primeiro número subtraído do dobro do segundo número é zero.	9587
26517	A área de um triângulo isósceles de lados medindo 2 unidades e 3 unidades  é  3 unidades de área.	9587
26518	A área de um retângulo de lados 2 e 3 é de 5 unidades de área. 	9587
26520	123	9596
26521	141	9596
26522	124	9596
26523	138	9596
26525	2	9606
26526	3	9606
26527	3,5	9606
26528	4	9606
26530	 O número total de alunos é 19.	9616
26531	A média de idade das meninas é 15 anos.	9616
26532	o número de meninas com, no máximo, 16 anos é maior que o número de meninos nesse mesmo intervalo de idades.	9616
26533	o número de meninos é igual ao número de meninas. 	9616
26535	uma diminuição de 38.587.000 m² em relação à do 1º período.	9630
26536	uma diminuição de 39.697.000.000 m² em relação à do 1º período.	9630
26537	uma diminuição de 9.952.800 m² em relação à do 2º período.	9630
26538	Um aumento de 678.600.000 m² em relação à do 3º período.	9630
9011	142	9010
9012	143	9010
9013	144	9010
9014	145	9010
23987	22 202	4787
23988	20 222	4787
23989	22 022	4787
18809	o dobro de um número	15023
18810	o dobro de um número mais um	15023
18811	o dobro de um número vezes um	15023
18812	l+3m+t resulta no total	15031
18813	l+m+t resulta no total	15031
18814	4l+3m+t resulta no total	15031
18815	nenhuma dessas	15031
25546	35 garrafões; resto 4 litros	8998
25547	34 garrafões; resto 4 litros	8998
25548	34 garrafões; resto 3 litros	8998
25549	35 garrafões; resto 3 litros	8998
18816	P=LxL	15058
23624	 homens e mulheres, na mesma proporção.\r\n	13832
18817	P=4+L	15058
18818	P=4L	15058
18819	P=2+L	15058
23625	 homens, pois a de mulheres vem diminuindo a cada Olimpíada.	13832
23626	 homens, pois a de mulheres praticamente não se alterou.	13832
25550	R$ 50,00	9004
25551	R$ 60,00	9004
25552	R$ 70,00	9004
25553	R$ 80,00	9004
25554	142	9015
25555	143	9015
25556	144	9015
25557	145	9015
25558	85	9021
25559	86	9021
25560	87	9021
25561	88	9021
25562	1	9027
25563	2	9027
25564	3	9027
25565	4	9027
25566	112	9033
25567	113	9033
25568	114	9033
25569	115	9033
25574	211	9045
25575	212	9045
25576	213	9045
25577	214	9045
25570	30	9039
25571	31	9039
25572	32	9039
25573	33	9039
25585	42	9057
25578	R$ 255,00	9051
25579	R$ 265,00	9051
25580	R$ 275,00	9051
25581	R$ 280,00	9051
8199	sim	4859
8200	não sei	4859
8201	não	4859
25582	39	9057
25583	40	9057
25584	41	9057
25590	1404	9069
25591	1403	9069
25592	1402	9069
25593	1401	9069
25586	3	9063
25587	6	9063
25588	9	9063
25589	12	9063
25594	228	9075
25595	229	9075
25596	230	9075
25597	231	9075
25602	6861	9087
25603	6871	9087
25604	6881	9087
25605	6891	9087
25598	233	9081
25599	236	9081
25600	239	9081
25601	242	9081
26540	Em 2000, indicando que, quanto maior o número de operários trabalhando, maior é o seu lucro.	9640
26541	Em 2001, indicando que a redução do número de operários não significa necessariamente o aumento dos lucros.	9640
26542	também em 2002, indicando que lucro e produtividade mantêm uma relação direta que independe do número de operários.	9640
26543	em 2003, devido à significativa redução de despesas com salários e encargos trabalhistas de seus operários.	9640
26545	Cada país participante conquistou pelo menos uma.	9650
26546	Cerca de um terço foi conquistado por apenas três países.	9650
26547	Os cinco países mais populosos obtiveram os melhores resultados.	9650
26548	Os cinco países mais desenvolvidos obtiveram os melhores resultados	9650
25606	96	9093
25607	100	9093
25608	102	9093
26550	11/12	9949
26551	11/24	9949
26552	11/23	9949
26553	1/12	9949
25609	106	9093
25614	16	9105
25615	18	9105
25616	20	9105
26555	41/96	9965
25617	22	9105
25610	25	9099
25611	26	9099
25612	27	9099
26556	1/12	9965
26557	 36/53	9965
25613	28	9099
25625	4335	9117
25618	1360	9111
25619	1260	9111
25620	1250	9111
25621	1350	9111
25629	27	9123
25622	4350	9117
25623	4331	9117
25624	4333	9117
25630	R$ 5,50	9129
25631	R$ 5,00	9129
25632	R$ 4,50	9129
25633	R$ 4,00	9129
25626	54	9123
25627	34	9123
25628	26	9123
18820	a	15078
18821	b	15078
25634	R$ 28,00	9135
25635	R$ 58,00	9135
25636	R$ 56,00	9135
26559	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>20</mn></mtd></mtr><mtr><mtd><mn>30</mn></mtd></mtr></mtable></mfenced></math>##$	9975
26560	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>650</mn></mtd></mtr><mtr><mtd><mn>700</mn></mtd></mtr></mtable></mfenced></math>##$	9975
26561	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>700</mn></mtd></mtr><mtr><mtd><mn>650</mn></mtd></mtr></mtable></mfenced></math>##$	9975
25637	R$ 60,00	9135
26562	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>30</mn></mtd></mtr><mtr><mtd><mn>20</mn></mtd></mtr></mtable></mfenced></math>##$	9975
23627	mulheres, pois a de homens praticamente não se alterou. 	13832
25664	60	9178
25665	45	9178
23644	R$ 400,00\r\n\r\n	13895
23645	R$ 480,00	13895
23646	R$ 521,00	13895
23647	R$ 565,00	13895
23652	 80% \r\n	13930
23653	 70%	13930
23654	60%	13930
23655	 20%	13930
18822	c	15078
25638	414	9141
25639	412	9141
25640	415	9141
25641	413	9141
25646	R$ 103,00	9153
25647	R$ 105,00	9153
25648	R$ 107,00	9153
25642	78	9147
25643	80	9147
25644	82	9147
25645	81	9147
25649	R$ 108,00	9153
25654	98	9165
25655	88	9165
25656	78	9165
25657	68	9165
25650	R$ 139,00	9159
25651	R$ 141,00	9159
25652	R$ 129,00	9159
25653	R$ 138,00	9159
25666	R$ 4,00	9184
25667	R$ 4,50	9184
25658	135	9172
25659	134	9172
25660	133	9172
25661	132	9172
25662	50	9178
25663	40	9178
25668	R$ 5,00	9184
25669	R$ 5,50	9184
25670	135	9190
25671	138	9190
25672	140	9190
25673	143	9190
25674	30	9196
25675	31	9196
25676	32	9196
25677	33	9196
25678	73	9202
25679	27	9202
25680	24	9202
25681	66	9202
25682	R$ 850,00	9208
25683	R$ 900,00	9208
25684	R$ 1200,00	9208
25685	R$ 1470,00	9208
18823	d	15078
23664	8 bolas\r\n	13970
23665	10 bolas	13970
23666	14 bolas	13970
23667	16 bolas	13970
18824	e	15078
19311	a	16617
19312	b	16617
19313	c	16617
19314	d	16617
6927	oioioii	6924
6928	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mroot> <mrow><mn>67</mn></mrow> <mrow><mn>7</mn></mrow> </mroot></math>##$	6924
26564	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>1389</mn></mtd><mtd><mn>3575</mn></mtd><mtd><mn>1232</mn></mtd></mtr><mtr><mtd><mn>2245</mn></mtd><mtd><mn>1257</mn></mtd><mtd><mn>6443</mn></mtd></mtr></mtable></mfenced></math>##$	9995
26565	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>766</mn></mtd><mtd><mn>820</mn></mtd><mtd><mn>642</mn></mtd></mtr><mtr><mtd><mn>1244</mn></mtd><mtd><mn>1180</mn></mtd><mtd><mn>1206</mn></mtd></mtr></mtable></mfenced></math>##$	9995
25885	10% menor	6516
25886	19% menor	6516
25887	20% menor	6516
25888	5% menor	6516
6233	Es una tabla no interactiva que se puede utilizar para resumir y analizar rápidamente grandes volúmenes de datos procedentes, incluso, de orígenes externos a Excel.	6197
6234	Es una tabla interactiva que se puede utilizar para resumir y analizar rápidamente grandes volúmenes de datos almacenados, exclusivamente, en Excel.	6197
6235	Es una hoja de Excel interactiva que se puede utilizar para resumir y analizar rápidamente grandes volúmenes de datos procedentes, incluso, de orígenes externos a Excel.	6197
6236	Es una tabla interactiva que se puede utilizar para resumir y analizar rápidamente grandes volúmenes de datos procedentes, incluso, de orígenes externos a Excel.	6197
6237	Es una tabla interactiva que se puede utilizar para resumir y analizar rápidamente grandes volúmenes de datos procedentes, incluso, de orígenes externos a Excel, aunque Access no se encuentre entre ellos.	6197
25890	0.3777	6526
25891	0.47	6526
25892	0.17	6526
25893	0.2777	6526
25899	1/10	6536
25900	1/15	6536
25901	1/5	6536
25902	1/20	6536
18846	R$ 9,60	15189
18847	R$ 6,60	15189
25904	O primeiro	6546
18848	R$ 69,00	15189
25905	O último	6546
25906	Independe	6546
25907	As chances do último são maiores	6546
18849	R$ 72,60	15189
18825	a	15100
18826	b	15100
18827	c	15100
18828	d	15100
18834	20	15122
18835	25	15122
18836	2	15122
18837	22	15122
18829	e	15100
18838	2,5 m	15132
18839	10 m	15132
18850	a	15200
18851	b	15200
18852	c	15200
18840	15 m	15132
18841	8,5 m	15132
18830	-1	15112
18831	4	15112
18832	11	15112
18833	7	15112
18853	d	15200
18854	e	15200
18867	AVVVM	15234
18842	a	15178
18843	b	15178
18844	c	15178
18845	d	15178
18860	XXX	15224
18861	XXXX	15224
18862	XXXAAAA	15224
18863	XXXXAAAA	15224
18855	a	15212
18856	b	15212
18857	c	15212
18858	d	15212
18859	e	15212
18870	c	15403
18871	d	15403
18872	e	15403
18864	AAAVM	15234
18865	AAVM	15234
18866	AVVM	15234
18868	a	15403
18869	b	15403
18883	a	15427
18884	b	15427
18885	c	15427
18886	d	15427
18878	a	15415
18879	b	15415
18880	c	15415
18881	d	15415
18882	e	15415
25880	6cm	6451
25881	12cm	6451
25882	21cm	6451
25883	19cm	6451
6244	Representa gráficamente los datos de un informe de tabla dinámica, aunque es independiente del mismo. Podemos cambiar el diseño y los datos mostrados en un informe de gráfico dinámico igual que en un informe de tabla dinámica.	6215
6245	Representa gráficamente los datos de un informe de tabla dinámica. Aunque no podemos cambiar su diseño directamente. Para ellos debemos modificar el informe de tabla dinámica asociado.	6215
26592	 0,0007\r\n\r\n\r\n\r\n	10541
26593	 0,007	10541
26594	 0,07	10541
26566	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>630</mn></mtd><mtd><mn>1260</mn></mtd><mtd><mn>903</mn></mtd></mtr><mtr><mtd><mn>1443</mn></mtd><mtd><mn>601</mn></mtd><mtd><mn>600</mn></mtd></mtr></mtable></mfenced></math>##$	9995
26567	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>1396</mn></mtd><mtd><mn>2080</mn></mtd><mtd><mn>1545</mn></mtd></mtr><mtr><mtd><mn>2687</mn></mtd><mtd><mn>2983</mn></mtd><mtd><mn>3086</mn></mtd></mtr></mtable></mfenced></math>##$	9995
23672	 1/6\r\n	13990
23673	 4/9	13990
26595	0,7	10541
23674	2/11	13990
23675	5/18	13990
19319	o aumento salarial é geralmente acima da inflação do período.	16638
26597	 3 kg\r\n\r\n\r\n\r\n	10549
19320	O aumento salarial é igual a inflação do período	16638
26598	 4,5 kg	10549
26599	 5 kg	10549
26600	 6 kg	10549
26577	110º	10516
26578	120º	10516
26579	150º	10516
26580	100º	10516
26582	34	10525
26583	36	10525
26584	42	10525
26585	45	10525
26587	43,2 m\r\n\r\n\r\n	10533
26588	44,9 m	10533
26589	24,38 m	10533
26590	 22,68 m	10533
26602	\tA diferença vale zero pois o consumo nos períodos foi o mesmo.\r\n\t\r\n\t\r\n\t\r\n\r\n	10556
23687	 1/5040\r\n	14015
23688	1/1260	14015
23689	1/60	14015
23690	1/30	14015
23694	 1/2704\r\n\r\n	14020
23695	 1/2652	14020
23696	1/1352	14020
23697	1/221 	14020
23701	 30 %\r\n	14025
23702	42 %	14025
23703	50 %	14025
23704	12 %	14025
26603	A diferença vale R$ 5,00. 	10556
26604	A diferença vale R$ -5,00, pois resulta em um número negativo.	10556
26605	A diferença vale R$ 3,00.	10556
26607	50	10563
23740	 1/12\r\n\r\n\r\n\r\n	14053
23741	1/36	14053
23742	5/72	14053
23743	 7/72	14053
26608	75	10563
26609	100	10563
26610	150	10563
26615	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>17</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></math>##$	10595
26616	17	10595
26617	2$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>17</mn></mrow> </msqrt></math>##$	10595
26618	4$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>17</mn></mrow> </msqrt></math>##$	10595
23994	102	4793
23995	87	4793
23996	99	4793
23997	98	4793
26623	1	10803
23998	987	4799
23999	123	4799
24000	789	4799
24001	999	4799
26624	2	10803
26625	5 - $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mroot> <mrow><mn>98</mn></mrow> <mrow><mn>3</mn></mrow> </mroot></math>##$	10803
26626	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mroot> <mrow><mn>98</mn></mrow> <mrow><mn>3</mn></mrow> </mroot></math>##$	10803
24002	4	4805
24003	7	4805
24004	5	4805
24126	086	4946
24127	186	4946
24128	176	4946
24129	196	4946
24270	180	5124
6246	Representa gráficamente los datos de uno o varios informes de tabla dinámica. Podemos cambiar el diseño y los datos mostrados en un informe de gráfico dinámico igual que en un informe de tabla dinámica.	6215
6247	Representa gráficamente los datos de un informe de tabla dinámica. Podemos cambiar el diseño y los datos mostrados en un informe de gráfico dinámico igual que en un informe de tabla dinámica permaneciendo este último invariable.	6215
6248	Representa gráficamente los datos de un informe de tabla dinámica. Podemos cambiar el diseño y los datos mostrados en un informe de gráfico dinámico igual que en un informe de tabla dinámica. Los cambios realizados se reflejarán directamente en el informe de tabla dinámico asociado.	6215
26628	4	10819
26629	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>1</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	10819
26630	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>2</mn><mo> &sdot; </mo> <mi> &pi; </mi> <mo> &minus; </mo><mn>2</mn></math>##$	10819
26631	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mn>3</mn><mo> &sdot; </mo> <mi> &pi; </mi> </math>##$	10819
26633	26	10831
26634	41	10831
26635	36	10831
26636	31	10831
18891	a	15438
7858	O resultado da soma é o dobro da parcela	4436
7859	O valor da soma diminui	4436
7860	A soma permanece a mesma	4436
7861	Não temos como fazer esse cálculo	4436
18892	b	15438
18893	c	15438
18894	d	15438
7873	Não	4454
7874	Sim	4454
11045	38 km\r\n	11044
11046	42 km\r\n	11044
11047	28 km\r\n	11044
11048	45 km\r\n	11044
7875	Não sei	4454
11053	80 m\r\n	11052
11054	120 m\r\n	11052
11055	160 m\r\n	11052
11056	60 m\r\n	11052
11062	21,5 m\r\n	11061
11063	32 metros\r\n	11061
11064	24 metros\r\n	11061
11065	29 metros\r\n	11061
18895	a	15449
18896	b	15449
24005	2	4805
18897	c	15449
18898	d	15449
18899	25	15459
18900	24	15459
18901	26	15459
18902	36	15459
18903	c	15469
18904	d	15469
18905	e	15469
18906	a	15469
18907	b	15469
18908	38	15744
18909	40	15744
18910	4	15744
18911	5	15744
19315	a	16628
19316	b	16628
19317	c	16628
25913	20%	6556
25914	30%	6556
25915	15%	6556
25916	25%	6556
26670	1200(3-$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>3</mn></mrow> </msqrt></math>##$)m	10977
26671	600$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>3</mn></mrow> </msqrt></math>##$m	10977
26672	1200$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>3</mn></mrow> </msqrt></math>##$m	10977
26638	26	10845
26639	15	10845
26640	11	10845
26641	16	10845
26643	56	10859
26644	35	10859
26645	63	10859
26646	49	10859
26648	30 dias	10880
26649	45 dias	10880
26650	60 dias	10880
26651	35 dias	10880
26653	às 3h15 min	10893
26654	às 3h	10893
26655	às 3h30min	10893
26656	às 2h30 min	10893
23799	7351	4416
23800	637	4416
23801	1537	4416
23802	1357	4416
26658	 30 de abril	10909
26659	24 de março	10909
26660	10 de maio	10909
26661	20 de abril	10909
26663	13 minutos	10925
26664	24 minutos	10925
26665	6 minutos	10925
26666	12 minutos	10925
26669	600(3-$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>3</mn></mrow> </msqrt></math>##$)m	10977
26675	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd></mtr></mtable></mfenced></math>##$	10999
18912	a	15754
18913	b	15754
18914	c	15754
18915	d	15754
24006	658	4811
24007	586	4811
23795	680	4366
23796	780	4366
23797	786	4366
18920	a	15775
18921	b	15775
24008	685	4811
18922	c	15775
18923	d	15775
23798	486	4366
18916	a	15764
18917	b	15764
18918	c	15764
18919	d	15764
23807	15, 22, 29	4426
23808	14, 21, 28	4426
23809	16, 23, 30	4426
18924	e	15775
23810	15, 21, 29	4426
18925	a	15787
18926	b	15787
18927	c	15787
18928	d	15787
18929	30 anos	15798
23811	94 + 49 = 143; 49 + 37 = 94	4442
19321	O aumento salarial é geralmente inferior a inflação do período.	16638
18930	48 anos	15798
18931	60 anos	15798
18932	90 anos	15798
19322	a	16646
19323	b	16646
19324	c	16646
18933	115 = 13 x A +C	15809
18934	115 = 13(A+C)	15809
19325	d	16646
18935	115= A+13+C	15809
18936	115= (13+C)x A	15809
23812	143 + 37 = 94; 49 + 94 = 143	4442
18937	a	15819
18938	b	15819
18939	c	15819
24009	865	4811
24130	82; 57; 21	4952
23813	86 + 37 = 143; 37 + 49 = 94	4442
23814	37 + 49 = 86; 49 + 94 = 143	4442
24131	81; 56; 21	4952
18940	d	15819
26678	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></math>##$	10999
21485	Que a região norte é a mais desenvolvida já que temo menor índice de trabalho infantil.	21478
21486	que considerando os dados das regiões sul e sudeste, podemos afirmar que na média mais de 20% das crianças destas duas regiões trabalha.	21478
18955	c	15864
18956	d	15864
18957	e	15864
21487	Que o trabalho infantil é importante para do formação do caráter, tanto que nas regiões mais desenvolvidas do país o índice é maior.	21478
21488	Que o trabalho infantil é um traço cultural da sociedade brasileira.	21478
21489	Que o Brasil tem quase 5 milhões e meio de crianças.	21478
18941	3(4+3)= 15	15830
18942	3(5+6)= 30	15830
18943	4(8 -3) = 20	15830
18944	5(7 –5)= 25 	15830
21500	a	21490
21501	b	21490
21502	c	21490
21503	d	21490
26676	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></mtd></mtr><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></mtd></mtr><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></mtd></mtr><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></mtd></mtr></mtable></mfenced></math>##$	10999
23815	12 e 19; 11 e 18; 13 e 17	4448
18945	a	15840
18946	b	15840
23816	19 e 11; 12 e 18; 13 e 17	4448
18947	c	15840
18948	d	15840
23817	17 e 11; 13 e 18; 12 e 19	4448
23818	19 e 17; 11 e 12; 13 e 18	4448
18949	a	15850
18950	b	15850
18951	c	15850
18952	d	15850
18958	a	15875
18959	b	15875
18953	a	15864
18954	b	15864
18960	c	15875
18961	d	15875
18962	a	15885
18963	b	15885
18964	c	15885
18965	d	15885
18966	e	15885
18967	a	15897
18968	b	15897
18969	c	15897
18970	d	15897
18971	e	15897
18972	a	15909
18973	b	15909
18974	c	15909
18975	d	15909
18976	e	15909
23819	2942	4458
23820	17648	4458
23821	2941	4458
23822	2912	4458
18977	-9X-45	15921
18978	-9x-15	15921
18979	9X-45	15921
18980	9X-15	15921
18981	-9X-9	15921
18982	4	15933
18983	0	15933
18984	2	15933
24132	81; 58; 22	4952
24133	81; 57; 21	4952
24271	190	5124
18985	-2	15933
18986	Nenhum desses valores	15933
18987	0	15950
18988	1	15950
18989	2	15950
18990	4	15950
18991	y+3y+17=39	15960
18992	4y+17=39	15960
18993	4y-17=39	15960
18994	2y=39+17	15960
25321	11	8733
18995	Sim	15970
18996	Não	15970
18997	Não sei	15970
18998	0	15978
25322	12	8733
25323	13	8733
25324	14	8733
18999	1	15978
19000	2	15978
19001	4	15978
19002	Sim	15988
19003	Não	15988
19004	Não sei	15988
19005	uma equação	15996
19006	uma inequeção	15996
19007	uma identidade	15996
25927	27	6566
19008	uma função	15996
19009	a	16006
26680	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>5</mn></mtd><mtd><mn>8</mn></mtd><mtd><mn>10</mn></mtd></mtr><mtr><mtd><mn>9</mn></mtd><mtd><mn>6</mn></mtd><mtd><mn>4</mn></mtd></mtr></mtable></mfenced></math>##$x$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mi>x</mi></mtd></mtr><mtr><mtd><mi>y</mi></mtd></mtr><mtr><mtd><mi>z</mi></mtd></mtr></mtable></mfenced></math>##$	11023
26681	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>5</mn></mtd><mtd><mn>8</mn></mtd><mtd><mn>10</mn></mtd></mtr><mtr><mtd><mi>x</mi></mtd><mtd><mi>y</mi></mtd><mtd><mi>z</mi></mtd></mtr></mtable></mfenced></math>##$x$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>9</mn></mtd></mtr><mtr><mtd><mn>6</mn></mtd></mtr><mtr><mtd><mn>4</mn></mtd></mtr></mtable></mfenced></math>##$	11023
19326	a	16682
19327	b	16682
19328	c	16682
25928	30	6566
25929	34	6566
25930	36	6566
23823	6496	4464
10991	65 m²\r\n	10990
10992	46 m²\r\n	10990
10993	18 m²\r\n	10990
10994	72 m² \r\n	10990
23824	6395	4464
26677	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd></mtr><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd></mtr><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd></mtr><mtr><mtd><mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></mtd></mtr></mtable></mfenced></math>##$	10999
19329	d	16682
19330	e	16682
19331	a	16694
19332	b	16694
19333	c	16694
19334	d	16694
19335	e	16694
24014	6431	4817
24015	3221	4817
12504	Apenas a afirmação (I) é verdadeira.\r\n	12502
12505	Apenas a afirmação (II) é verdadeira.\r\n	12502
12506	Apenas as afirmações (II) e (III) são verdadeiras. \r\n	12502
23825	5405	4464
23826	6405	4464
24016	8421	4817
24017	1248	4817
19336	a	16706
19337	b	16706
19338	c	16706
19339	d	16706
25932	Duas vezes maior.	6576
25933	Três vezes maior.	6576
25934	Quatro vezes maior.	6576
19340	a	16754
24018	102	4823
24019	201	4823
24020	111	4823
24021	100	4823
24272	170	5124
25935	Sete vezes maior	6576
19341	b	16754
19342	c	16754
19343	d	16754
12429	156\r\n	12428
24134	121	4958
24135	122	4958
12430	144	12428
12431	13	12428
12432	12	12428
25937	120	6585
25938	60	6585
19344	a	16765
19345	b	16765
19346	c	16765
19347	d	16765
19348	a	16775
19349	b	16775
19350	c	16775
19351	d	16775
19352	a	16780
19353	b	16780
19354	c	16780
19355	d	16780
19356	a	16799
19357	b	16799
19358	c	16799
19359	d	16799
19360	e	16799
19361	a	16840
19362	b	16840
19363	c	16840
19364	d	16840
19365	a	16850
19366	b	16850
19367	c	16850
19368	d	16850
19015	=2X-26	16020
19016	=3(X-6)+8	16020
19017	Nenhuma das alternativas acima	16020
26682	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mi>x</mi></mtd><mtd><mi>y</mi></mtd><mtd><mi>z</mi></mtd></mtr></mtable></mfenced></math>##$x$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>4</mn></mtd><mtd><mn>10</mn></mtd></mtr><mtr><mtd><mn>6</mn></mtd><mtd><mn>8</mn></mtd></mtr><mtr><mtd><mn>9</mn></mtd><mtd><mn>5</mn></mtd></mtr></mtable></mfenced></math>##$	11023
25939	30	6585
25940	45	6585
26683	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>5</mn></mtd><mtd><mn>8</mn></mtd><mtd><mn>10</mn></mtd></mtr><mtr><mtd><mi>x</mi></mtd><mtd><mi>y</mi></mtd><mtd><mi>z</mi></mtd></mtr></mtable></mfenced></math>##$x$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfenced open="[" close="]"><mtable><mtr><mtd><mn>9</mn></mtd><mtd><mn>6</mn></mtd><mtd><mn>4</mn></mtd></mtr><mtr><mtd><mi>x</mi></mtd><mtd><mi>y</mi></mtd><mtd><mi>z</mi></mtd></mtr></mtable></mfenced></math>##$	11023
19018	R$ 1,50	16032
19019	R$ 1,43	16032
19020	R$ 1,72	16032
19021	R$ 2,15	16032
19010	b	16006
19011	c	16006
19012	d	16006
12355	2,5 km\t\t\r\n	12354
12356	5,0 km\t\r\n	12354
12357	7,5 km\t\r\n	12354
12358	10,0 km\t\r\n	12354
26688	15°	11071
19373	a	16871
19022	a	16042
19374	b	16871
19375	c	16871
19376	d	16871
23827	10160	4470
19023	b	16042
19024	c	16042
19025	d	16042
19013	=X+8-6	16020
19014	=X+8-3(6)	16020
23828	11160	4470
23829	11060	4470
26689	60°	11071
26690	45°	11071
25947	Sim, Rubinho pisará todos os degraus que são múltiplos de 3.	6610
19377	a	16881
25948	Sim, Felício pois ele vai pisar todos os ímpares.	6610
23830	10159	4470
24273	185	5124
19026	R$ 15,25	16052
19027	R$ 19,25	16052
19028	R$ 11,75	16052
19029	R$ 14,75	16052
25949	Não, nenhum dos dois vai pisar no 15º. degrau pois 15 é ímpar.	6610
26691	30°	11071
19030	sim	16062
25942	13	6600
25943	9	6600
25944	11	6600
25945	17	6600
26693	11	11088
26694	12	11088
26695	13	11088
26696	14	11088
26716	100ml	11143
26717	200ml	11143
26718	150 ml	11143
26719	77 ml	11143
19031	não, a solução correta é 2	16062
19032	não, a solução correta é 4	16062
19033	não, a solução correta é 0	16062
24022	15683	4829
24023	51638	4829
26701	8 palmos	11104
26702	12 palmos	11104
26703	4 palmos	11104
26704	6 palmos	11104
26706	 27 amarelos e 25 brancos\r\n\r\n \r\n \r\n	11117
26707	23 amarelos e 36 brancos	11117
26708	27 amarelos e 36 brancos	11117
26709	36 amarelos e 27 brancos	11117
26711	10	11130
26712	11	11130
26713	23	11130
26714	7	11130
19034	a	16072
26721	18	11173
26722	-18	11173
26723	32	11173
26724	-32	11173
26726	768	11184
26727	-384	11184
26728	384	11184
26729	-768	11184
19035	b	16072
19036	c	16072
19037	d	16072
26731	20	11195
26732	22	11195
26733	23	11195
26734	24	11195
26736	37	11206
26737	36	11206
26738	33	11206
26739	30	11206
26741	40	11217
26742	38	11217
19038	a	16083
26743	35	11217
26744	30	11217
26746	3.5	11228
26747	7/4	11228
19039	b	16083
19040	c	16083
19041	d	16083
26748	1.75	11228
26749	7/8	11228
26751	81	11239
26752	36	11239
26753	30	11239
26754	33	11239
26756	25	11250
26757	32	11250
26758	23	11250
26759	zero	11250
26761	64	11262
26762	32	11262
26763	24	11262
26764	16	11262
26766	9	11273
26767	11	11273
19042	35	16094
19043	31	16094
19044	42	16094
19045	38	16094
19378	b	16881
26768	13	11273
26769	17	11273
26773	o próximo primo depois de 7	11284
26774	o próximo par depois de 8	11284
26776	9	11305
26777	10	11305
23835	148, 158, 168.	4486
23836	155, 158, 161.	4486
23837	150, 154, 165.	4486
26778	11	11305
23838	150, 153, 156.	4486
26779	12	11305
19381	4	16891
19382	24	16891
19383	15	16891
19384	Não tem solução	16891
19379	c	16881
13286	Registro de salida serie	13285
13287	Amplificador de salida	13285
13252	0	13243
13253	1	13243
13254	2	13243
13255	4	13243
19380	d	16881
24024	15863	4829
24025	51683	4829
25953	 Sim, Felício pois ele vai pisar todos os ímpares.	6619
25954	 Sim, os dois vão pisar no 23º. degrau pois 23 é ímpar.	6619
25955	Não, pois 23 não é múltiplo nem de 2 nem de 3.	6619
25957	Sim, somente Rubinho pisará no 18º. degrau.	6634
23839	569 + 211	4498
13288	Conversor A/D	13285
13289	Generador de reloj	13285
23840	669 + 212	4498
23841	669 + 222	4498
23842	569 + 232	4498
25950	Sim Rubinho e Felício vão pisar juntos no 15º. degrau. 	6610
26771	o próximo número natural depois de 7	11284
26772	o próximo número ímpar depois de 7 	11284
26782	28%	11319
23831	41	4476
26783	22%	11319
26784	75%	11319
26785	47%	11319
23832	39	4476
23833	40	4476
23834	42	4476
25952	 Sim, Rubinho pisará todos os degraus que terminam em três, 3,13,23,...	6619
25958	Sim, os dois, pois 18 é múltiplo de 2 e de 3.	6634
25959	Sim, somente Felício pisará no 18º. degrau.	6634
25960	Não, pois 18 não é múltiplo nem de 2 nem de 3.	6634
23843	53 + 41 = 39 + 42	4504
23844	34 + 42 = 39 + 37	4504
23845	42 + 48 = 35 + 52	4504
25962	Os degraus de números 6, 18, 24, 30, pois são múltiplos comuns de 2 e 3.	6644
25963	 Os degraus de números 6, 18, 20,24, 30, pois são múltiplos comuns de 2 ou 3.	6644
24026	9666	8143
25964	Os degraus de números 6, 12,24, 30, pois são múltiplos comuns de 2 e 3.	6644
25965	Os degraus de números 6, 12, 18, 24, 30, pois são múltiplos comuns de 2 e 3.	6644
26787	16296	11336
26788	5040	11336
26789	10000	11336
26790	22500	11336
19385	a	16911
19386	b	16911
19387	c	16911
19388	d	16911
23846	2595	4509
23847	2406	4509
23848	2506	4509
23849	2516	4509
26792	44	11367
26793	51	11367
26794	4	11367
26795	8	11367
19389	a	16921
24027	9066	8143
19390	b	16921
19391	c	16921
19392	d	16921
24028	9606	8143
24029	9660	8143
19393	Sim	16940
24136	123	4958
23854	9321	4515
24137	124	4958
23855	9322	4515
23856	9422	4515
23857	9332	4515
25967	O primeiro degrau que os dois irão pisar é o 1º. pois mdc(2,3) = 1.	6654
24030	Diminui. 5286	8149
24031	Diminui. 5862	8149
25968	O primeiro degrau que os dois irão pisar é o 6º, pois o mmc(2,3) = 6.	6654
25969	O primeiro degrau que os dois irão pisar é o 2º. pois dois é par e primo.	6654
25970	O primeiro degrau que os dois irão pisar é o 6º. pois 2x3=6 .	6654
25972	1	6669
25973	3	6669
25974	5	6669
25975	7	6669
26797	15	11388
25977	30 cm	6679
25978	25 cm	6679
26798	4	11388
26799	44	11388
26800	8	11388
19394	Não	16940
26802	0	11401
19395	Não sei	16940
26803	30	11401
26804	34	11401
26805	17	11401
26807	66	11415
26808	100	11415
26809	87	11415
26810	70	11415
19396	102	16948
19397	306	16948
26812	60	11434
26813	45	11434
26814	35	11434
26815	50	11434
26817	10	11458
26818	20	11458
26819	15	11458
26820	25	11458
19398	240	16948
19399	316	16948
26822	15	11474
26823	25	11474
26824	10	11474
19400	Uma hora	16959
24032	Aumenta. 5286	8149
24033	Aumenta. 5862	8149
26834	500	11513
26835	407	11513
25979	50 cm	6679
25980	20 cm	6679
25982	60	6689
25983	320	6689
25984	360	6689
24034	80	8155
24035	8	8155
24036	800	8155
25985	400	6689
26837	0	11536
26838	60	11536
26839	54	11536
26840	73	11536
26842	5	11556
26843	0	11556
26844	10	11556
26845	15	11556
26847	240	11569
26848	150	11569
26849	143	11569
26850	228	11569
26825	20	11474
14897	un virus	14896
14898	un organismo alienígena	14896
14899	es la unidad morfológica y funcional de todo ser vivo. 	14896
25987	5	6703
24037	8000	8155
25988	4	6703
26827	311	11497
26828	54	11497
26829	386	11497
26852	72	11582
26853	0	11582
14936	Eucariotas y procariotas	14900
14937	Lípidas y protéicas	14900
14938	Aminoácidos y eucariotas	14900
19401	Aproximadamente 1h 20 min	16959
19402	Aproximadamente 1h 45 min	16959
19403	Aproximadamente 2 horas	16959
26854	22	11582
14955	Utilidad, especializacion	14943
14956	Función, Tamaño, Forma	14943
14957	Color, densidad	14943
26855	62	11582
21151	a	20388
21152	b	20388
21153	c	20388
21154	d	20388
21155	Nenhuma das alternativas	20388
26857	85	11595
26858	105	11595
26859	90	11595
26860	75	11595
26830	365	11497
26832	510	11513
26833	315	11513
25989	3	6703
25990	2	6703
24038	1040	8161
26862	6	11608
26863	7	11608
24039	4010	8161
24040	1400	8161
24041	1004	8161
26864	8	11608
26865	9	11608
25992	5%	6713
24042	7	8167
24043	70	8167
24044	700	8167
24045	7000	8167
26868	12	11621
26869	15	11621
25993	10%	6713
25994	30%	6713
24138	174 - 98	4964
24139	189 - 74	4964
26870	9	11621
25995	25%	6713
24140	148 - 79	4964
24141	987 - 14	4964
25997	5/6	6723
24274	58	5130
24275	47	5130
25998	1/6	6723
25999	10%	6723
24276	48	5130
24277	57	5130
26000	3/6	6723
26002	75%	6738
26003	50%	6738
26004	45%	6738
26005	25%	6738
26007	1/3	6748
26008	1/6	6748
26009	1/9	6748
26010	1/2	6748
26012	2/3	6758
26013	3/8	6758
26014	2/6	6758
26015	1/8	6758
26871	10	11621
26017	5%	6768
26018	25%	6768
26019	2,5%	6768
26873	12 macacos	11632
26874	14 macacos	11632
26875	16 macacos	11632
26876	26 macacos	11632
26878	76 abelhas	11645
26879	26 abelhas	11645
26880	42 abelhas	11645
26881	72 abelhas	11645
26883	Diofante viveu 74 anos.	11658
26884	Diofante viveu 84 anos.	11658
26885	Diofante viveu 64 anos.	11658
26886	Diofante viveu 94 anos.	11658
26888	44 + 56 = 100	11671
26889	55 + 45 = 100	11671
26890	33 + 77 = 100	11671
26891	66 + 34 = 100	11671
26893	3 quadras de vôlei e 2 de basquete. 	11684
26894	5 quadras de vôlei e 7 de basquete.	11684
26895	5 quadras de vôlei e 2 de basquete.	11684
26896	Este problema não possui solução.	11684
23877	9 e 15	4549
24046	1	8173
24047	10	8173
24048	100	8173
24049	1000	8173
23858	43 + 25	4521
23859	35 + 24	4521
23860	34 + 52	4521
23861	53 + 42	4521
23862	A = 5; B = 3; C = 8	4527
23863	A = 6; B = 2; C = 8	4527
23864	A = 6; B = 3; C = 8	4527
23865	A = 6; B = 3; C = 7	4527
26020	1%	6768
23866	136	4533
23867	135	4533
23868	134	4533
24050	507	4835
24051	254	4835
24052	761	4835
24053	542	4835
26022	1/30	6778
26023	1/15	6778
26024	3/15	6778
26025	3/30	6778
23878	421 + 422 + 423	4555
23879	420 + 422 + 424	4555
23880	423 + 425 + 427	4555
23869	133	4533
19414	3x+6x=1290	17003
19415	3x+6(x-280)=1290	17003
19416	6x=3(280-x)=1290	17003
23881	423 + 424 + 425	4555
23870	9 + 10 + 11	4539
23871	7 + 8 + 9	4539
19417	3+6(x-280)=1290	17003
23872	10 + 11 + 12	4539
23873	8 + 9 + 10	4539
19404	a	16971
19405	b	16971
19406	c	16971
19407	d	16971
19408	e	16971
19418	110000	17013
19419	100000	17013
19420	155000	17013
19421	225000	17013
19409	a	16983
19410	b	16983
19411	c	16983
19412	d	16983
19413	e	16983
19422	2 costureiras	17023
19423	3 costureiras	17023
19424	4 costureiras	17023
19425	6 costureiras	17023
19426	15 dias	17034
19427	12 dias	17034
19428	8 dias	17034
19429	4 dias	17034
19430	a	17044
26027	5%	6788
26028	10%	6788
23874	6 e 15	4549
23875	9 e 11	4549
23876	6 e 11	4549
26029	16,7%	6788
26030	15%	6788
19431	b	17044
19432	c	17044
19433	d	17044
19434	a	17054
19435	b	17054
19436	c	17054
19437	d	17054
23882	9999	4561
23883	10000	4561
19438	-3x+10	17064
23884	10002	4561
23885	8990	4561
19439	-3x+2	17064
19440	6x-6	17064
19441	6x+2	17064
19442	-2x+10	17064
19443	1	17076
19444	4	17076
19445	-4	17076
26032	1/4	6798
26033	2/4	6798
19446	8	17076
19447	a	17087
19448	b	17087
19449	c	17087
19450	d	17087
19451	a	17097
19452	b	17097
19453	c	17097
19454	d	17097
23886	5031; 12397; 17365	4567
23887	5031; 12397; 17635	4567
19455	a	17107
23888	5030; 12396; 17365	4567
23889	5031; 12297, 17265	4567
26034	2/16	6798
26035	1/16	6798
24058	799	4841
24059	411	4841
24060	401	4841
26037	1/67600	6808
26038	1/6912 	6808
26039	 1/676	6808
26041	5	6817
26042	10	6817
26043	6	6817
26044	8	6817
26046	20	6827
26047	9	6827
26048	10	6827
26049	6	6827
23890	a = 17; x = 8; y = 5	4573
23891	a = 15; x = 8; y = 5	4573
26898	5 quadras de vôlei e 2 de basquete. 	11733
26899	2 quadras de vôlei e 9 de basquete.	11733
26900	3 quadras de vôlei e 2 de basquete. 	11733
23892	a = 17; x = 8; y = 3	4573
26901	5 quadras de vôlei e 7 de basquete.	11733
23893	a = 17; x = 10; y = 5	4573
26903	28 pessoas	11746
26904	35 pessoas	11746
26905	43 pessoas	11746
19456	b	17107
19457	c	17107
19458	d	17107
26051	5	6837
26052	12	6837
23894	99	4579
23895	97	4579
23896	100	4579
23897	104	4579
24061	501	4841
15003	21º\r\n	15002
15004	64 º\r\n	15002
15005	88º \r\n	15002
15006	92º\r\n	15002
26053	6	6837
26054	10	6837
19459	a	17117
19460	b	17117
19461	c	17117
19462	d	17117
21166	a	21156
26056	12	6847
19218	a	16104
26906	27 pessoas	11746
26057	6	6847
26058	4	6847
19463	a	17127
19464	b	17127
19219	b	16104
19220	c	16104
19221	d	16104
19222	a	16115
19223	b	16115
19224	c	16115
19225	d	16115
19226	a	16125
19227	b	16125
19228	c	16125
19229	d	16125
19230	a	16139
19231	b	16139
19232	c	16139
19233	d	16139
26059	3	6847
26908	11	11759
19234	No primeiro	16149
19235	No segundo	16149
26909	13	11759
26910	17	11759
26911	19	11759
19241	3x	16319
19242	-24x	16319
26913	280	11772
26914	180	11772
26915	160	11772
26916	340	11772
19236	O preço é o mesmo nos dois	16149
19243	-3x	16319
19244	x	16319
19237	y=2(x-1)	16157
19238	4x+2	16157
26918	180	11785
26919	190	11785
26920	185	11785
19239	4x+y+2	16157
19240	y=-4x	16157
26921	170	11785
19245	10-28=x	16329
19246	10x=28	16329
19247	x-10=28	16329
19248	x+10=28	16329
19249	4/3	16335
19250	5	16335
19251	6	16335
19252	7	16335
26933	100	11827
26934	99	11827
26935	50	11827
26936	90	11827
26938	3	11840
26939	5	11840
26940	10	11840
26941	12	11840
26963	5	11913
26964	10	11913
26965	15	11913
26966	20	11913
26943	720	11854
26983	João R$ 42.000,00; Pedro R$ 30.000,00 	11975
26984	João R$ 32.000,00; Pedro R$ 40.000,00	11975
26985	João R$ 40.000,00; Pedro R$ 30.000,00	11975
26944	540	11854
26945	371	11854
26946	462	11854
26986	João R$ 46.000,00; Pedro R$ 30.000,00	11975
26948	15	11871
26949	60	11871
26950	72	11871
26951	24	11871
26973	MN	11950
26974	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mtext>NM</mtext></mrow> <mrow><mo> &minus; </mo<mfenced> <mrow><mn>1</mn></mrow> </mfenced></mrow> </msup></math>##$	11950
26975	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mtext>MN</mtext></mrow> <mrow><mo> &minus; </mo<mfenced> <mrow><mn>1</mn></mrow> </mfenced></mrow> </msup></math>##$	11950
26976	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>M</mi></mrow> <mrow><mo> &minus; </mo<mfenced> <mrow><mn>1</mn></mrow> </mfenced></mrow> </msup></math>##$ N	11950
26953	14	11889
26978	25 unidades	11962
26954	6	11889
26955	12	11889
26956	13	11889
26979	18 unidades	11962
26980	21 unidades 	11962
26981	30 unidades	11962
26958	30	11901
26959	60	11901
26988	6 pessoas	11987
26989	7 pessoas 	11987
26990	11 pessoas	11987
26960	15	11901
26961	10	11901
26991	10 pessoas	11987
26993	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow><mi>p</mi></mrow> <mfenced> <mrow><mi>t</mi></mrow> </mfenced><mo> &equals; </mo><msup> <mrow><mrow><mi>F</mi></mrow> <mfenced> <mrow><mn>19</mn></mrow> </mfenced></mrow> <mrow><mi>t</mi></mrow> </msup></math>##$	12000
26994	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow><mi>p</mi></mrow> <mfenced> <mrow><mi>t</mi></mrow> </mfenced><mo> &equals; </mo><msup> <mrow><mrow><mi>F</mi></mrow> <mfenced> <mrow><mtext>0,19</mtext></mrow> </mfenced></mrow> <mrow><mi>t</mi></mrow> </msup></math>##$	12000
26061	8	6857
26062	12	6857
26063	10	6857
26064	16	6857
23898	5000	4585
23899	4000	4585
23900	4900	4585
23901	4999	4585
22593	\r\n9999800001\r\n	10938
22594	99998000001	10938
22595	99999800001	10938
22596	999998000001	10938
23902	653; 1299; 1437	4591
23903	663; 1289; 1427	4591
23904	663; 1299; 1427	4591
23905	663; 1299; 1437	4591
26066	12	6867
26067	6	6867
26068	9	6867
26069	15	6867
23906	962; 1897; 2026	4597
23907	962; 1897; 3187	4597
23908	963; 1898; 3188	4597
23909	962; 1895; 2126	4597
26071	9	6877
23910	834 + 567	7912
23911	834 + 647	7912
23912	835 + 467	7912
24062	549	4847
24063	550	4847
24064	459	4847
24065	539	4847
26072	10	6877
26073	6	6877
26074	27	6877
26076	8	6887
26077	12	6887
26078	10	6887
26079	6	6887
26081	12	6897
26082	8	6897
26083	6	6897
26084	20	6897
26086	16	6912
26087	32	6912
26923	O menor número de discos que Vítor poderia ter é 127. 	11799
26924	O menor número de discos que Vítor poderia ter é 135.	11799
26925	O menor número de discos que Vítor poderia ter é 133. 	11799
26926	O menor número de discos que Vítor poderia ter é 131.	11799
26928	79 ovos	11813
26929	49 ovos	11813
26930	59 ovos 	11813
26931	69 ovos	11813
26995	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow><mi>p</mi></mrow> <mfenced> <mrow><mi>t</mi></mrow> </mfenced><mo> &equals; </mo><msup> <mrow><mfenced> <mrow><mtext>F-0,81</mtext></mrow> </mfenced></mrow> <mrow><mi>t</mi></mrow> </msup></math>##$	12000
26996	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mrow><mi>p</mi></mrow> <mfenced> <mrow><mi>t</mi></mrow> </mfenced><mo> &equals; </mo><msup> <mrow><mrow><mi>F</mi></mrow> <mfenced> <mrow><mtext>0,81</mtext></mrow> </mfenced></mrow> <mrow><mi>t</mi></mrow> </msup></math>##$	12000
27034	100	12011
27035	2	12011
27036	10	12011
27037	2.30	12011
27039	R$ 300,00 e R$ 500,00	12022
27040	R$ 550,00 e R$ 850,00	12022
27041	R$ 650,00 e R$ 1000,00	12022
27042	R$ 650,00 e R$ 1300,00	12022
27044	Não, depende da medida do lado.	12034
27045	Sim, a medida do perímetro é sempre o dobro da medida do lado do quadrado.	12034
27046	Não, só se o número for inteiro.	12034
27047	Sim, a medida do perímetro é sempre quatro vezes maior que a medida do quadrado.	12034
27049	as mulheres representam metade da população brasileira dependente de álcool.	12046
23913	845 + 467	7912
27050	o país, para tratar pessoas com problemas provocados pelo alcoolismo, gasta o dobro do que movimenta para produzir bebida alcoólica.	12046
27051	o aumento do número de brasileiros dependentes de álcool acarreta decréscimo no percentual do PIB gasto no tratamento dessas pessoas.	12046
27052	o elevado percentual de estudantes que já consumiram bebida alcoólica é indicativo de que o consumo do álcool é problema que deve ser enfrentado pela sociedade. 	12046
15016	35\r\n	15015
15017	40\r\n\r\n	15015
15018	55\r\n	15015
15019	75	15015
19465	c	17127
19466	d	17127
19467	O produto da soma e da diferença é sempre nulo.	17137
19468	O produto da soma de dois termos é igual ao quadrado do primeiro mais o quadrado do segundo.	17137
19469	O produto da soma pela diferença de dois termos é igual ao quadrado do primeiro menos o quadrado do segundo.	17137
19470	O produto da soma pela diferença de dois termos é igual ao quadrado do primeiro mais o produto do segundo.	17137
24066	3894	4853
24067	2994	4853
24068	2993	4853
24069	2894	4853
26088	28	6912
26089	24	6912
20418	P=48x	20412
20419	P=18x	20412
20420	P=30+18x	20412
20421	P=12x	20412
27059	34	12068
27060	64	12068
27061	67	12068
27062	68	12068
21167	b	21156
21168	c	21156
21169	d	21156
27064	45 segundos. 	12083
27065	25 segundos. 	12083
27066	35 segundos. 	12083
27067	50 segundos. 	12083
21175	a	17249
21176	b	17249
21177	c	17249
21178	d	17249
27069	2006	12094
27070	571	12094
21179	a	17726
21180	b	17726
21181	c	17726
21182	d	17726
27071	2011	12094
27072	1003	12094
27074	Serão 8 galhos na próxima etapa e 13 na etapa seguinte; 	12106
21558	Equilátero	21524
21559	Isósceles	21524
21560	Retângulo	21524
21561	Escaleno	21524
23914	583	4687
23915	835	4687
23916	385	4687
23917	358	4687
22617	  Neste mês de dezembro, se for confirmada a tendência de queda, serão vendidas 76.000 peças.\r\n	13630
22618	O total de peças vendidas nos últimos 12 meses, até novembro de 2003, inclusive, é de 900.000 peças.	13630
22619	Se a meta da campanha for atingida, os números de peças vendidas mês a mês, a partir do seu lançamento, formarão uma progressão geométrica de razão 10.	13630
22620	Se a meta da campanha for atingida, o número de peças a serem vendidas no mês de março de 2004 será superior a 80.000.	13630
22631	a	22625
22632	b	22625
22633	c	22625
22634	d	22625
22641	a	22635
22642	b	22635
22643	c	22635
22644	d	22635
22651	a	22645
22652	b	22645
22653	c	22645
22654	d	22645
22661	a	22655
22662	b	22655
22663	c	22655
22664	d	22655
22671	T=t+15	22665
22672	T=3t	22665
22673	T=3(t+15)	22665
27075	Serão 7 galhos na próxima etapa e 11 na etapa seguinte;	12106
27076	Serão 5 galhos na próxima etapa e 6 na etapa seguinte;	12106
27077	Serão 8 galhos na próxima etapa e 8 na etapa seguinte.	12106
27079	210	12121
27080	1344	12121
22674	T=3+t	22665
27081	672	12121
27082	336	12121
26091	625-$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$	7099
26092	625-$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></mrow> <mrow><mn>2</mn></mrow> </mfrac></math>##$	7099
27084	10	12132
23922	6734	4703
23923	6743	4703
23924	4637	4703
27085	9	12132
27086	18	12132
27087	20	12132
23925	6473	4703
23918	67	4697
23919	76	4697
23920	670	4697
23921	766	4697
27089	60	12144
23926	5008	4709
23927	8005	4709
23928	8050	4709
23929	5080	4709
27090	8	12144
27091	64	12144
27092	7	12144
24146	748 - 352 = 376	4974
27094	“Sou a soma dos catetos. Mas pode me chamar de hipotenusa”.	12156
19471	a	17147
19472	b	17147
19473	c	17147
19474	d	17147
19475	Sim	17157
19476	Não	17157
19253	37	16345
19254	36	16345
19255	31	16345
19256	45	16345
19477	a	17163
19478	b	17163
19479	c	17163
19480	d	17163
27095	“Sou o quadrado da soma dos catetos. Mas pode me chamar de hipotenusa”.	12156
27096	“Sou o quadrado da soma dos catetos. Mas pode me chamar de quadrado da hipotenusa”.	12156
27097	“Sou a soma dos quadrados dos catetos. Mas pode me chamar de quadrado da hipotenusa”. 	12156
19481	a	17173
21202	o custo de produção é igual a metade do preço unitário	14797
21203	o custo de produção é igual a metade do preço unitário mais metade dos impostos	14797
19482	b	17173
19483	c	17173
21204	o custo de produção é igual a metade do custo de produção mais impostos	14797
19484	d	17173
19257	32 caixas	16355
19258	62 caixas	16355
19259	63 caixas	16355
19260	64 caixas	16355
19485	a	17183
19486	b	17183
19487	c	17183
21205	o custo de produção é igual  R$0,50 mais o custo de produção mais imposto	14797
19488	d	17183
19489	e	17183
24147	748 - 372 = 376	4974
24148	745 - 362 = 376	4974
24149	749 - 372 = 276	4974
27099	15 m	12167
21206	Nenhuma dessas	14797
27100	20 m	12167
27101	10 m	12167
27102	18 m	12167
22681	-9	22675
27105	11\t	12327
22682	-9/2	22675
19495	a	17207
19496	b	17207
19497	c	17207
22683	-2	22675
27106	20	12327
27107	21	12327
27108	31	12327
19498	d	17207
19273	33	16395
19274	34	16395
19499	a	17217
19500	b	17217
19501	c	17217
19502	d	17217
22684	0	22675
19503	a	17228
19504	b	17228
19505	c	17228
19506	d	17228
19507	a	17239
19508	b	17239
19509	c	17239
19510	d	17239
19261	3x-x=1264	16365
19262	x+x+3=1264	16365
19263	3x=1264	16365
19264	x+3x=1264	16365
19265	a	16375
19266	b	16375
19267	c	16375
19268	d	16375
19269	54 minutos	16385
19270	1 hora	16385
19271	50 minutos	16385
19272	1 hora e meia	16385
26102	32 Reais	7128
26103	320 reais	7128
26104	256 Reais	7128
23930	Dois mil, oitocentos e quatro	4715
23931	Oito mil, quatrocentos e dois	4715
23932	Oito mil, duzentos e quatro	4715
23933	Oito mil, oitocentos e quatro	4715
23934	5	4721
23935	8	4721
23936	3	4721
23937	4	4721
26093	1250-$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></mrow> <mrow><mn>2</mn></mrow> </mfrac></math>##$	7099
26094	250-$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></mrow> <mrow><mn>2</mn></mrow> </mfrac></math>##$	7099
23938	2000 + 30 + 9	4727
23939	2000 + 300 + 9	4727
23940	200 + 30 + 9	4727
23941	2000 + 30 + 9	4727
23946	7003	4733
23947	7030	4733
23948	1703	4733
23949	3007	4733
26096	5	7108
26097	5 $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7108
26098	7	7108
19515	a	17261
27110	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>7</mn></mrow> <mrow><mn>18</mn></mrow> </mfrac></math>##$	12342
27111	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>4</mn></mrow> <mrow><mn>9</mn></mrow> </mfrac></math>##$	12342
27112	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>3</mn></mrow> </mfrac></math>##$	12342
27113	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>5</mn></mrow> <mrow><mn>9</mn></mrow> </mfrac></math>##$	12342
26099	7  $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msqrt> <mrow><mn>2</mn></mrow> </msqrt></math>##$	7108
23950	75	4739
23951	11	4739
23952	99	4739
23953	100	4739
23954	1	4745
23955	4	4745
23956	7	4745
23957	8	4745
26101	25,6 Reais	7128
23958	8621	4751
23959	1628	4751
23960	1286	4751
23961	1268	4751
26106	28	7138
26107	49	7138
26108	36	7138
26109	38	7138
24074	48, 40, 32	4865
24075	49, 41, 33	4865
24076	50, 48, 40	4865
24077	49, 40, 33	4865
24078	100	4871
24079	80	4871
24080	60	4871
24081	70	4871
19516	b	17261
19517	c	17261
19518	d	17261
26111	12	7207
26112	6	7207
26113	8	7207
26114	10	7207
24082	88 - 15 = 73 ; 73 - 24 = 15	4883
24083	24 - 15 = 9 ; 73 - 15 = 88	4883
24084	88 - 15 = 73 ; 24 - 15 = 9	4883
24085	88 - 73 = 9 ; 73 - 24 = 15	4883
26116	113	7217
26117	117	7217
26118	24	7217
26119	111	7217
24086	8	4889
24087	18	4889
24088	19	4889
24089	9	4889
26121	 p(A∩B) = p(A) . p(B) + p(A∩B)	7227
26122	p(A∩B) = p(A) + p(B) . p(A∩B)	7227
26123	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mtext>p(A</mtext><mo> &Union; </mo><mtext>B)=p(A)+p(B)-p(A</mtext><mo> &Intersection; </mo><mtext>B)</mtext></math>##$	7227
26124	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mtext>p(A</mtext><mo> &Union; </mo><mtext>B)=p(A)</mtext><mo> &sdot; </mo><mtext>p(B)-p(A</mtext><mo> &Union; </mo><mtext>B)</mtext></math>##$	7227
27116	A	12361
27117	B	12361
27118	C	12361
27119	D	12361
19519	(120, -30)	17271
19520	(85, 95)	17271
19521	(90, 80)	17271
24094	33	4895
24095	23	4895
24096	34	4895
24097	24	4895
24098	120	4900
24099	114	4900
24100	115	4900
24101	113	4900
19522	(80, 90)	17271
19523	a	17281
19524	b	17281
19525	c	17281
21453	a	17736
21454	b	17736
21455	c	17736
21456	d	17736
19526	a	17290
21457	a	17746
21458	b	17746
21459	c	17746
21460	d	17746
27121	2	12379
27122	8	12379
27123	5	12379
24150	2218; 1479; 641	4980
24151	2218; 1379; 541	4980
24152	2219; 1480; 641	4980
24153	2220; 1378; 650	4980
26130	 P (x e y) = P(x) . P(y)	7237
26131	 P (x ou y) = P(x) + P(y)	7237
27124	4	12379
24278	3911	5136
24279	3912	5136
24280	4011	5136
24281	4012	5136
19318	d	16628
19527	b	17290
19528	c	17290
19529	d	17290
19530	a	17304
19531	b	17304
19532	c	17304
19533	d	17304
19534	a	17314
19535	b	17314
19536	c	17314
19537	d	17314
19538	a	17324
19539	b	17324
19540	c	17324
19541	d	17324
19542	x>4	17334
19543	x<4	17334
19544	x=4	17334
19545	x>4 e x<4	17334
19546	x<4	17344
19547	x<2	17344
19548	x>2	17344
19549	x>-2	17344
19550	8 máquinas	17354
19551	12 máquinas	17354
19552	4 máquinas	17354
19553	6 máquinas	17354
19554	480 voltas	17364
19555	500 voltas	17364
19556	540 voltas	17364
19557	620 voltas	17364
19558	Par	17375
19559	Impar	17375
19560	Primo	17375
19561	Maior que R$ 2,00	17383
19562	Maior que R$ 1,80	17383
19563	Menor que R$ 1,50	17383
19564	Igual a R$ 1,80	17383
27128	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>2</mn></mrow> </mfrac></math>##$	12404
26141	Não, porque a tenda tem altura de 120 cm, já que essa é a altura do triângulo isósceles formado na parte da frente da tenda.	7290
26142	Sim, porque a altura da tenda é de 150 cm.Como se pode observar na figura.	7290
20194	entre 1996 e 2000	20187
20195	entre 1998 e 2001	20187
20196	em 2000 e 2001	20187
20151	a	20145
20152	b	20145
20153	c	20145
20154	d	20145
26143	Não, porque a  tenda tem somente  90 cm de altura, que corresponde a metade da base da sua porta de entrada.	7290
20197	em 1996, 1998, 2000 e 2001	20187
20198	em todos os anos, com exceção de 1995 e 2003	20187
27129	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>8</mn></mrow> <mrow><mn>21</mn></mrow> </mfrac></math>##$	12404
27130	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>4</mn></mrow> <mrow><mn>9</mn></mrow> </mfrac></math>##$	12404
27131	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>3</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></math>##$	12404
20161	a	20155
20162	b	20155
20163	c	20155
20164	d	20155
26145	Como o volume do sólido deve ser de 2 000 cm³ e sua altura é de 5 cm, a base deve medir 400 cm², logo a cartolina deve medir 20 x 20 cm.	7298
26146	Se a cartolina medir 40cm x 40cm e a altura do sólido for de 5cm,o volume do sólido será de 2 000 cm³.	7298
26147	A cartolina deve ser um quadrado de lado 25 cm, já que 5 cm serão utilizados para a altura da caixa.	7298
24102	1143	4906
24103	331	4906
24104	321	4906
24105	1243	4906
20171	a	20165
20172	b	20165
20173	c	20165
20174	d	20165
24106	35	4912
20206	I	20199
20207	IV	20199
20208	I e II	20199
20209	III e IV	20199
20182	a	20175
20183	b	20175
20184	c	20175
20185	d	20175
20186	e	20175
24107	63	4912
24108	133	4912
24109	265	4912
26132	P (x ou y) = P(x) + P(y) – P(x e y)	7237
24154	1103; 396	4986
24155	1013; 394	4986
24156	1203; 395	4986
24157	1103; 395	4986
26133	P (x ou y) = P(x) - P(y) . P(x e y)	7237
20210	II, III e IV	20199
20248	a	18148
20249	b	18148
20250	c	18148
20251	d	18148
26135	n = t-2	7280
26136	t=2n	7280
26137	t=n-2	7280
26138	t=n+2	7280
26140	Sim, porque a tenda tem 10 cm de altura a mais que a necessária.	7290
24162	1243 - 128 = 1206	4992
24163	1234 – 128 = 1106	4992
24164	1234 - 128 = 1116	4992
24165	1233 - 128 = 1106	4992
24170	800; 345	4998
24171	800; 334	4998
24172	800; 344	4998
24173	799; 334	4998
24178	769; 241	5004
24179	769; 342	5004
24180	779; 241	5004
24181	769; 243	5004
24282	30	5142
24283	29	5142
24284	19	5142
24285	28	5142
24286	174	5148
24287	164	5148
24288	175	5148
24289	165	5148
27133	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>3</mn></mrow> <mrow><mn>16</mn></mrow> </mfrac></math>##$	12416
27134	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></math>##$	12416
27135	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>15</mn></mrow> <mrow><mn>16</mn></mrow> </mfrac></math>##$	12416
27136	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>1</mn></mrow> <mrow><mn>16</mn></mrow> </mfrac></math>##$	12416
27139	63	12437
27140	89	12437
27141	26	12437
27142	720	12437
27144	15	12453
27145	12	12453
27146	10	12453
27147	16	12453
27185	MN	13643
27186	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi>N</mi><mo> &sdot; </mo><msup> <mrow><mi>M</mi></mrow> <mrow><mo> &minus; </mo<mfenced> <mrow><mn>1</mn></mrow> </mfenced></mrow> </msup></math>##$	13643
27187	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mi>M</mi><mo> &sdot; </mo><msup> <mrow><mi>N</mi></mrow> <mrow><mo> &minus; </mo<mfenced> <mrow><mn>1</mn></mrow> </mfenced></mrow> </msup></math>##$	13643
27188	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>M</mi></mrow> <mrow><mo> &minus; </mo<mfenced> <mrow><mn>1</mn></mrow> </mfenced></mrow> </msup><mo> &sdot; </mo><mi>N</mi></math>##$	13643
27149	63	12466
27150	84	12466
27151	26	12466
27152	120	12466
27154	1015	12478
27155	2030	12478
26148	A cartolina deve ser quadrada de lado com dimensões de 30 cm, pois de cada “quina” serão retirados 5 cm, portanto a base será um quadrado de 20 cm de lado e sua altura terá 5 cm.	7298
22990	fdhhhhhhhh	22989
24110	91 - 37	4918
24111	37 - 19	4918
24112	79 - 13	4918
24113	71 - 19	4918
27156	260	12478
27157	1200	12478
26151	Não, porque a caixa é maior do que o necessário e, portanto haveria desperdício de material.	7305
26152	Como o volume de cada esfera é de aproximadamente 65 cm³ é possível armazenar 30 esferas na caixa, portanto é adequada.	7305
26153	Não, porque o volume da caixa é insuficiente para armazenar as esferas.	7305
26154	Sim, porque na caixa eu poderia armazenar exatamente 16 esferas desse tamanho, logo é adequada.	7305
24290	45	5158
24291	56	5158
24292	65	5158
24293	88	5158
24294	R$ 62,00	5164
24295	R$ 162,00	5164
24296	R$ 168,00	5164
24297	R$ 356,00	5164
26156	30cm	7312
26157	35 cm	7312
26158	40cm	7312
26159	45 cm	7312
24298	318	5170
24299	507	5170
24300	517	5170
24301	333	5170
24302	65	5180
24303	56	5180
24304	106	5180
24305	105	5180
26162	a probabilidade é de 5 em 2, já que são 5 alunos para 2 ingressos.	7321
27159	1500	12490
27160	1000	12490
27161	500	12490
24306	1125	5186
24307	1025	5186
24308	1135	5186
24309	547	5186
27162	750	12490
24310	222	5192
24311	704	5192
24312	604	5192
24313	223	5192
27165	20	12510
27166	21	12510
27167	25	12510
27168	31	12510
27170	69	12902
27171	2024	12902
27172	9562	12902
27173	12144	12902
27175	Aproximadamente 1 dia	13621
27176	Aproximadamente 1,5 dias	13621
27177	Aproximadamente 2 dias 	13621
27178	Aproximadamente 2,5 dias	13621
27181	18 unidades	13635
27182	 21 unidades	13635
27183	30 unidades	13635
27191	15 min	13718
27192	18 min	13718
27193	14,5 min	13718
27194	14 min	13718
27196	121	13727
27197	122,5	13727
27198	124	13727
27199	122	13727
27211	final de 2001.	13750
27212	final de 2002.	13750
27213	início de 2003.	13750
27214	final de 2004.	13750
23024	0	23023
23025	false	23023
23027	true	23026
23028	false	23026
23030	preg nodo 2 3	23029
23031	preg nodo 2 3 false	23029
24182	3341; 1174	5010
24183	3341; 1074	5010
24184	3342; 1075	5010
24185	3343; 1174	5010
27201	automóveis, com poucos passageiros.	13732
27202	transportes coletivos, com ocupação máxima.	13732
27203	automóveis, com ocupação máxima.	13732
27204	ônibus, com ocupação típica.	13732
24186	267; 129	5016
24187	267; 128	5016
24188	267; 138	5016
24189	257; 128	5016
27206	8h50min 	13741
27207	9h30min	13741
27208	9h00min	13741
27209	8h30min	13741
25095	4286	8519
25096	2486	8519
25097	8642	8519
25098	4682	8519
24194	508; 436	5022
24195	508; 437	5022
24196	508; 446	5022
24197	518; 436	5022
24198	3231	5028
24199	3331	5028
24200	3232	5028
24201	3031	5028
27218	Aproximadamente 42% das mulheres não foram agredidas fisicamente.	13777
27219	 Mais de 30% das mulheres já sofreram algum tipo de violência.	13777
27220	Aproximadamente 25% das mulheres já foram agredidas sexualmente.	13777
27221	Menos de 20% das mulheres sofreram violência psicológica.	13777
24202	120	5034
24203	130	5034
24204	119	5034
24205	220	5034
24206	R$ 85,00	5040
24207	R$ 105,00	5040
24208	R$ 95,00	5040
24209	R$ 94,00	5040
27223	 ficará próximo a 1,85 m  	13786
27224	não irá se alterar, porque é apenas uma atleta.	13786
27225	aumentará muito, porque o atleta que chegou tem altura muito maior que a média.	13786
27226	será a soma entre a média e altura do novo atleta, dividido por dois.	13786
24210	3694	5046
24211	3684	5046
24212	3794	5046
24213	3784	5046
27228	60	13791
27229	63	13791
27230	71	13791
27231	55	13791
25071	728 x 728	8482
25072	8 x 728	8482
25073	7 x 728	8482
25074	6 x 728	8482
24218	689	5052
24219	688	5052
24220	699	5052
24221	698	5052
24222	123	5058
24223	119	5058
24224	121	5058
24225	122	5058
27233	2/5	13800
27234	11/25	13800
27235	12/25	13800
27236	1/2	13800
27238	 F V F V V	13809
25099	2498	8525
25100	2504	8525
27239	 F V F V F	13809
27240	F V V V F	13809
25101	2608	8525
25102	2508	8525
25075	0	8488
25076	1	8488
25077	2	8488
25078	48	8488
25079	314	8494
25080	312	8494
25081	316	8494
25082	292	8494
25083	6	8500
25084	5	8500
25085	3	8500
25086	4	8500
25087	18; 72	8507
25088	18; 54	8507
25089	24; 72	8507
25090	24; 81	8507
25091	3; 38	8513
25092	3; 48	8513
25093	2; 38	8513
25094	2; 48	8513
25103	6; 18	8531
25104	9; 18	8531
25105	9; 27	8531
25106	6; 27	8531
25107	64	8537
25108	56	8537
25109	72	8537
25110	49	8537
25111	28; 196; 1372	8543
25112	28; 196; 1472	8543
25113	24; 168; 1176	8543
25114	28; 177; 1232	8543
25115	30; 350	8549
25116	35; 360	8549
25117	30; 360	8549
25118	30; 362	8549
25119	10, 50, 250	8555
25120	10, 100, 1000	8555
25121	10, 50, 240	8555
25122	50, 10, 250	8555
25123	352	8561
25124	335	8561
25125	325	8561
25126	125	8561
25127	140	8567
25128	675	8567
25129	345	8567
27242	ambas as afirmativas são verdadeiras.	13818
27243	apenas a afirmativa I é verdadeira.	13818
27244	apenas a afirmativa II é verdadeira.	13818
27245	nenhuma das afirmativas é verdadeira.	13818
27248	 em 2030, haverá mais de 700 milhões de pessoas com fome nas regiões destacadas no gráfico;	13841
26161	a probabilidade é de $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>3</mn></mrow> <mrow><mn>5</mn></mrow> </mfrac><mo> &sdot; </mo><mfrac> <mrow><mn>2</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></math>##$,pois o primeiro ingresso sorteado tem probabilidade de 3 alunos em 5 e o segundo de 2 alunas em quatro, já que um aluno já foi sorteado.	7321
26163	a probabilidade é de 0,4, já que são 2 ingressos para 5 alunos.	7321
26164	a probabilidade é de $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <mfrac> <mrow><mn>3</mn></mrow> <mrow><mn>5</mn></mrow> </mfrac><mo> &plus; </mo><mfrac> <mrow><mn>2</mn></mrow> <mrow><mn>4</mn></mrow> </mfrac></math>##$ , pois o primeiro ingresso sorteado tem probabilidade de 3 alunos em 5 e o segundo de 2 alunas em quatro, já que um aluno já foi sorteado.	7321
24226	28	5064
24227	27	5064
24228	34	5064
24229	29	5064
24230	1061	5070
24231	1071	5070
24232	1051	5070
24233	1161	5070
26166	20%	7326
26167	50%	7326
26168	25%	7326
26169	40%	7326
24234	1033	5076
24235	1233	5076
24236	1132	5076
24237	1133	5076
26171	pa+n	7336
26172	pa+pn	7336
26173	p(a+n)/2	7336
26174	2p+2a+2n	7336
25143	130; 500	8591
25144	150; 600	8591
25145	150; 550	8591
25146	150; 580	8591
24242	225	5082
24243	135	5082
24244	235	5082
24245	125	5082
24246	6142	5088
24247	6140	5088
24248	7670	5088
24249	6670	5088
26176	150ml	7345
26177	200ml	7345
26178	77ml	7345
26179	100ml	7345
24250	R$ 517,00	5094
24251	R$ 518,00	5094
24252	R$ 417,00	5094
24253	R$ 516,00	5094
24254	1020	5100
24255	436	5100
24256	1030	5100
24257	634	5100
26181	100ml	7353
26182	150ml	7353
26183	77ml	7353
26184	200ml	7353
24258	2016	5106
24259	2116	5106
24260	2000	5106
24261	2015	5106
24262	R$ 189,00	5112
24263	R$ 21,00	5112
24264	R$ 20,00	5112
24265	R$ 198,00	5112
24318	678	5198
24319	876	5198
24320	456	5198
24321	446	5198
24322	2008	5204
24323	1974	5204
24324	2000	5204
24325	1972	5204
24326	1840	5210
24327	1972	5210
24328	1942	5210
24329	1977	5210
25130	520	8567
25131	150	8573
25132	100	8573
25133	200	8573
25134	400	8573
25135	240	8579
25136	250	8579
25137	260	8579
25138	270	8579
25139	192; 768	8585
25140	192; 778	8585
25141	192; 868	8585
25142	182; 768	8585
25147	1200	8597
25148	1500	8597
25149	120	8597
25150	150	8597
25151	25812	8603
25152	26912	8603
25153	25912	8603
25154	25815	8603
25155	1881	8609
25156	1871	8609
25157	1761	8609
25158	1771	8609
25159	514	8615
25160	504	8615
25161	328	8615
25162	405	8615
25163	10950	8621
25164	11950	8621
25165	10850	8621
25166	10555	8621
25167	2118	8627
25168	2098	8627
25169	2108	8627
25170	2228	8627
25171	1436	8633
25172	1536	8633
25173	1546	8633
25174	1566	8633
25175	2446	8639
25176	2486	8639
25177	2596	8639
25178	2496	8639
25179	1850	8645
25180	1860	8645
25181	1950	8645
25182	1960	8645
25183	3673	8651
25184	3663	8651
25185	3363	8651
25186	2663	8651
25187	3824	8657
25188	3944	8657
25189	3934	8657
25190	3924	8657
25191	4	8663
25192	5	8663
25193	6	8663
25194	7	8663
25195	10	8673
25196	25	8673
25197	50	8673
25198	20	8673
25199	20	8679
25200	25	8679
25201	10	8679
25202	50	8679
25203	10	8685
25204	3	8685
25205	15	8685
25206	12	8685
25207	11	8691
25208	3	8691
25209	66	8691
25210	30	8691
25288	15	8697
25289	14	8697
25290	16	8697
25291	26	8697
25292	150	8703
25293	124	8703
25294	152	8703
25295	162	8703
25296	4	8709
25297	8	8709
25298	12	8709
25299	16	8709
25300	18	8715
25301	9	8715
25302	1	8715
25303	90	8715
25304	20	8721
25305	50	8721
25306	10	8721
25307	100	8721
25316	38, 48, 28	8727
25317	33; 22; 11	8727
25318	11; 22; 44	8727
25319	44; 22; 11	8727
25332	11	8739
25333	12	8739
25334	13	8739
25335	14	8739
25336	248	8745
25337	124	8745
25338	125	8745
25339	123	8745
25340	11	8751
25341	12	8751
25342	13	8751
25343	14	8751
25345	18	8757
25346	19	8757
25347	20	8757
25348	21	8757
25349	25	8763
25350	26	8763
25351	27	8763
25352	28	8763
25353	33	8769
25354	34	8769
25355	35	8769
25356	36	8769
25357	43	8775
25358	44	8775
25359	45	8775
25360	46	8775
25361	20	8781
25362	10	8781
25363	50	8781
25364	2	8781
25365	q = 23 e r = 0	8787
25366	q = 22 e r = 0	8787
25367	q = 23 e r = 2	8787
25368	q = 23 e r = 1	8787
25369	120	8793
25370	121	8793
25371	112	8793
25372	123	8793
25373	3	8799
25374	2	8799
25375	1	8799
25376	0	8799
25377	70	8805
25378	66	8805
25379	71	8805
25380	68	8805
25381	21	8811
25382	22	8811
25383	24	8811
25384	25	8811
25385	13	8817
25386	14	8817
25387	15	8817
25388	16	8817
25389	33	8823
25390	34	8823
25391	35	8823
25392	36	8823
25401	24	8836
25402	25	8836
25403	26	8836
25404	27	8836
25406	18	8830
25407	19	8830
25408	29	8830
25409	28	8830
27249	em cada região destacada no gráfico, o número de pessoas com fome em 2030 será menor do que em 1992;	13841
27250	em cada região destacada no gráfico, o número de pessoas com fome em 2030 será menor do que em 2015; 	13841
27251	em cada região destacada no gráfico, o número de pessoas com fome em 2015 será menor do que em 1999;	13841
27253	 F V V  	13854
27254	F F V	13854
27255	V F V	13854
27256	V V V	13854
27258	 05 horas a mais que João.	13863
27259	10 horas a mais que João.	13863
27260	20 horas a mais que João.	13863
27261	40 horas a mais que João.	13863
27263	43% de 5,3 bilhões. 	13881
27264	metade de 5,3 bilhões.	13881
27265	 54% de 5,3 bilhões.	13881
27266	67% de 5,3 bilhões	13881
27269	a média de consumo diário per capta nos 5 primeiros anos (1993-1997) foi maior que nos 5 anos de 1998 a 2002.	13918
27270	se o volume médio captado, de 1993 a 1997, foi igual ao que ocorreu de 1998 a 2003, então o volume x captado em 2003 é de 11,12 milhões de m³.	13918
27271	se o volume y utilizado em 2003 correspondeu a 85% do volume médio utilizado no período 1993-2002, então y é maior que 5,5 milhões de m³	13918
27274	33,3% 	13943
27275	 66,6%	13943
27276	60%	13943
27277	85%	13943
27279	0	13965
27280	 1/3 	13965
27281	1/4	13965
27282	1/2	13965
29015	As duas retas são paralelas e passam pelo segundo quadrante.	29009
29016	As duas retas são perpendiculares e passam no primeiro quadrante.	29009
29017	As duas retas se intersectam no quarto quadrante.	29009
29018	As duas retas não passam no segundo quadrante.	29009
28945	 a/b	28931
28946	a/(b+1)	28931
28947	(b-1)/(2-a)	28931
28948	(-a)/b	28931
28825	2x + y – 1 = 0	28818
28826	x - 2y + 2 = 0	28818
28827	- x - 3y – 1 = 0	28818
28828	- 3x - 5y + 10 = 0	28818
28898	3x + y + 1 = 0	28892
28899	x - 4y – 2 = 0	28892
28900	x + y + 1 = 0	28892
28901	2x + y – 1 = 0	28892
29056	A reta gira em torno do ponto de abscissa zero e ordenada quatro no sentido anti-horário.	29042
28908	3√3/2	28902
28909	6√5/5	28902
28910	√5	28902
28911	5√3/5	28902
29038	Bissetriz ao segundo quadrante.	29029
28985	2x – y = 1	28967
28986	x + y + 1 = 0	28967
28987	x – 2y + 1 = 0	28967
28988	– x + y – 1 = 0	28967
29039	Paralela ao eixo das abscissas.	29029
28963	√3 x – 5y = 0	28949
28964	-√3 x + 2y – 3 = 0	28949
28965	5√3 x + 10 – 5y = 0	28949
28936	A = B	28921
28937	2A = B	28921
28938	– 1/A = B	28921
28939	A = 1/2B	28921
29040	Perpendicular à bissetriz do segundo quadrante.	29029
29041	Paralela ao eixo das ordenadas.	29029
28966	-2√3 x – 3 – 5y = 0	28949
29025	É maior que 60 graus.	29019
29026	É 60 graus.	29019
28995	q = – 1 + p.	28989
28996	p = 1 – q	28989
28997	p = q – 1	28989
28998	q = – p – 1	28989
29027	É menor que 30 graus.	29019
29028	É 30 graus.	29019
29005	4x + 5y +17 = 0	28999
29006	3x – y – 1 = 0	28999
29007	– x + 3y = 0	28999
29008	– 2x + y + 9 = 0	28999
29057	A reta se desloca verticalmente passando pelo ponto de abscissa zero e ordenada quatro.	29042
29058	A reta gira em torno do ponto de abscissa zero e ordenada dois no sentido horário.	29042
29059	A reta se desloca horizontalmente na direção positiva passando pelo ponto de abscissa zero e ordenada quatro.	29042
29080	-3√3x + 3y – 2 = 0	29074
29081	-2√3x - 2y + 16 = 0	29074
29082	4√3x - y + 8 = 0	29074
29083	√3x - 3y + 24 = 0	29074
29450	São paralelos.	29444
29130	Por uma reta paralela ao eixo das ordenadas.	29124
29131	Pela reta bissetriz do primeiro quadrante.	29124
29132	Por uma reta paralela ao eixo das abscissas.	29124
29133	Não anda em linha reta.	29124
29093	Têm uma diferença de 90 graus.	29084
29094	São complementares.	29084
29095	São suplementares.	29084
29096	Têm uma diferença de 180 graus.	29084
29399	Possui coeficiente linear positivo.	29392
29400	É a bissetriz do primeiro quadrante.	29392
29401	É perpendicular a uma reta que passa no segundo quadrante.	29392
29402	Possui coeficiente angular negativo pois passa no terceiro quadrante.	29392
29163	Tem sinais opostos.	29148
29164	São inversos.	29148
29165	A diferença entre eles é zero.	29148
29103	Perpendiculares entre si.	29097
29104	Possuem coeficiente linear positivo.	29097
29105	Possuem coeficientes angulares com sinais contrários.	29097
29106	Paralelas.	29097
29166	São iguais.	29148
29144	Todos os pontos com esta forma são eqüidistantes a esta reta.	29134
29145	Todos os pontos com esta forma estão sobre a reta.	29134
29146	Os pontos estarão sempre separados pela reta.	29134
29147	A reta irá sempre juntá-los em um determinado quadrante.	29134
29120	Gira em torno da origem.	29111
29121	Anda sobre uma reta com coeficiente angular igual a 0,5.	29111
29122	Passa na origem do plano cartesiano.	29111
29123	Faz movimento ondulatório.	29111
29435	Não possui coeficiente linear, pois não toca o eixo das abscissas.	29429
29436	Possui coeficiente angular nulo.	29429
29437	Podemos entender então que para qualquer valor de “y”, “x” vai valer sempre dois.	29429
29438	A reta não possui coeficiente angular, pois não faz ângulo com o eixo das abscissas.	29429
29173	Possui coeficiente linear negativo.	29167
29451	Ao contrário do segmento, a reta não tem início nem fim.	29444
29452	O segmento começa em A e termina em B.	29444
29453	Possuem a mesma inclinação com relação ao eixo das abscissas.	29444
29217	150 graus	29207
29174	Passa na origem do plano cartesiano.	29167
29175	É perpendicular ao eixo das abscissas.	29167
29176	Possui coeficiente angular negativo.	29167
29218	30 graus	29207
29219	60 graus	29207
29220	135 graus	29207
29203	Corta o eixo das ordenadas na altura três.	29197
29204	Corta o eixo das ordenadas na altura dois.	29197
29205	Corta o eixo das ordenadas na origem.	29197
29206	Corta o eixo das ordenadas na altura menos três.	29197
29460	Os pontos A,B e D são colineares.	29454
29461	O ponto A pertence ao primeiro quadrante.	29454
29462	O ponto C está sobre o eixo das abscissas.	29454
29463	Os pontos A e C equidistam da origem do plano cartesiano.	29454
29470	A reta não possui coeficiente linear.	29464
29471	A reta possui coeficiente linear igual a três.	29464
29472	A reta possui coeficiente angular positivo.	29464
29473	A reta não possui coeficiente angular.	29464
29480	Simétricos.	29474
29481	Inversos.	29474
29482	Suplementares.	29474
29483	Não possuem relação.	29474
29490	O coeficiente angular da reta perpendicular a esta será positivo.	29484
29491	A reta não passa no quarto quadrante.	29484
29492	Uma reta paralela a esta possuirá coeficiente angular simétrico ao seu.	29484
29493	Seu coeficiente angular será maior que um.	29484
29500	“r” é perpendicular a “s”.	29494
29501	São retas concorrentes e não perpendiculares.	29494
29502	São retas que se encontram no ponto de abscissa 1 e ordenada 1.	29494
29503	O coeficiente linear da reta “s” é três.	29494
29507	Os segmentos têm o mesmo tamanho.	29504
29508	Os segmentos estão no primeiro e segundo quadrante.\r\n	29504
29509	As retas diretrizes dos segmentos possuem o mesmo coeficiente linear.\r\n	29504
29510	As retas diretrizes não possuem ponto em comum.\r\n	29504
29582	2x – 1 = y\r\n	29579
29548	A reta paralela a reta “r” que contiver o ponto “P” passará pela origem do plano cartesiano.	29545
29549	A reta perpendicular a reta “r” que passa no ponto “P” tem coeficiente linear menor que quatro.	29545
29550	Uma reta paralela ao eixo das abscissas que passa no ponto “P” intersecta a reta “r” no primeiro quadrante.	29545
29517	Coeficiente linear maior que dois.	29511
29518	Coeficiente linear menor que um.\r\n	29511
29519	Coeficiente linear igual a um.	29511
29520	Coeficiente linear entre um e dois.	29511
29551	Uma reta que passa no terceiro quadrante e contém o ponto “P” não intersecta a reta “r”.	29545
29583	x/2 – 2 = y	29579
29584	x – 2y + 4 = 0	29579
29527	O conjunto de todos os pontos eqüidistantes aos pontos A e B forma uma reta paralela ao eixo das ordenadas.	29521
29528	O conjunto de todos os pontos eqüidistantes aos pontos A e B não passa pelo ponto C.	29521
29529	O Ponto C está à mesma distância dos pontos A e B.	29521
29530	Se um ponto for eqüidistante a A e B, entao ele será equidistante a C.	29521
29555	Os pontos A, B e C são colineares.	29552
29556	Os pontos A e B têm o mesmo valor da ordenada.	29552
29534	A reta bissetriz forma o conjunto de todos os pontos equidistantes dos pontos que compõem as duas retas.	29531
29535	Uma reta perpendicular a uma das retas teria coeficiente linear inverso ao da  outra.	29531
29536	O ângulo formado pelo encontro das duas retas é o mesmo ângulo formado pela reta “r”.	29531
29537	Existe uma reta perpendicular às duas retas no seu ponto de encontro.	29531
29585	3x – y = 2\r\n	29579
29557	Os pontos A e B estão no primeiro quadrante.	29552
29558	Os Pontos A e C têm abscissas simétricas.	29552
29589	4x – 3y – 16 = 0 e 4x – 3y – 4 = 0	29586
29590	3x + 2y – 4 = 0 e 3x – 2y – 2 = 0\r\n	29586
29565	1	29559
29566	2	29559
29567	3	29559
29568	4	29559
29591	2x – 2y + 1 = 0 e 2x – 2y – 4 = 0	29586
29592	2x – 2y – 8 = 0 e 2x + 2y – 12 = 0\r\n	29586
29575	3x – 2 = y	29569
29576	x – y + 1 = 0\r\n	29569
29577	x/4 + y/2 = 1	29569
29578	3/2x – y = 2	29569
29596	(9/7,8/7)	29593
29597	(13/5,7/5)\r\n	29593
29598	(16/7,9/7)	29593
29599	(16/7,13/11)\r\n	29593
29618	12\t	29611
29619	11	29611
29620	3	29611
29621	18	29611
29607	3/2x + 3 = y	29600
29608	2x + 3y + 1 = 0	29600
29609	– 2x – 3y + 6 = 0	29600
29610	– 2/3x = y	29600
29657	12	29651
29658	7	29651
29640	 -2x + 3y – 1 = 0	29633
29641	 -3x + 2y – 2 = 0	29633
29642	-3/2x + 1 = y	29633
29643	-2/3x – 2 = y	29633
29659	5	29651
29660	4	29651
29647	2x + 4y + 1 = 0	29644
29648	2x + 4y = 0	29644
29649	4x – 2y = 0	29644
29650	2x – 2y = 0	29644
29687	4	29681
29688	5	29681
29689	6	29681
29677	(2;1,5)	29671
29678	(3;1)	29671
29679	(2,1)	29671
29680	(1;2,5)	29671
29667	3	29661
29668	4	29661
29669	5	29661
29670	6	29661
29690	7	29681
29705	30 graus	29691
29706	60 graus	29691
29707	25 graus	29691
29708	45 graus	29691
29715	-1/2	29709
29716	-2	29709
29717	-1	29709
29718	1	29709
29725	45 graus	29719
29726	60 graus	29719
29727	120 graus	29719
29728	135 graus	29719
29874	gráfico a)	29863
29875	gráfico b)	29863
29876	gráfico c)	29863
29877	gráfico d)	29863
29819	2x+y-4=0	29813
29820	3x+2y-11=0	29813
29821	3/2x-y+11=0	29813
29822	-3x+2y-11=0	29813
29745	3	29739
29746	1	29739
29747	-1/3	29739
29748	-1	29739
29759	(-3,1)	29749
29760	(1,3)	29749
29761	(0,-4)	29749
29762	(-3,-1)	29749
29829	2x+y-1=0	29823
29830	–x+2y-1=0	29823
29831	–x+3y+5=0	29823
29832	x-2y-1=0	29823
29769	2x-y-5=0	29763
29770	-3x+y+6=0	29763
29771	–x+y+5=0	29763
29772	x/2-y-6=0	29763
29779	(2,2)	29773
29780	(3; 1,5)	29773
29781	(2,;1,5)	29773
29782	(3,2)	29773
29839	2x+y=0	29833
29840	-3x+y=0	29833
29841	–x+2y=0	29833
29842	x-3y=0	29833
29789	-2x+5y-2=0	29783
29790	3x-2y-1=0	29783
29791	–x+2y+1=0	29783
29792	x-3y-1=0	29783
29884	gráfico a)	29878
29885	gráfico b)	29878
29886	gráfico c)	29878
29887	gráfico d)	29878
29799	-2	29793
29800	-3	29793
29801	-8/3	29793
29802	-5/2	29793
29809	-3/2	29803
29810	3/2	29803
29811	-2/3	29803
29812	2/3	29803
29888	5x – 2 – 2y = 0	29622
29889	5x – 2y – 2 = 0	29622
29890	3x – 2y – 3 = 0	29622
29891	3/2x – 3/2 = y	29622
29849	-1	29843
29850	-3/2	29843
29851	-5/3	29843
29852	-1/4	29843
29859	-45 graus	29853
29860	-60 graus	29853
29861	60 graus	29853
29862	-135 graus	29853
29150	Pocas y sencillas instrucciones, pocos y sencillos modos de direccionamiento, modelo de ejecución registro-registro	29139
29151	Pocas y sencillas instrucciones, fácil decodificación de la instrucción	29139
29152	Pocas y sencillas instrucciones, pocos y sencillos modos de direccionamiento	29139
28839	– 3x = – 4y	28912
28840	x + y + 1 = 0	28912
28841	x + y = 2	28912
28842	-2x = 3y - 6	28912
28843	2x + y – 9 = 0	29221
28844	x – 3y + 1 = 0	29221
28845	x – y + 3 = 0	29221
28846	- x - y = 0	29221
29153	Pocos y sencillos modos de direccionamiento, acceso eficiente a memoria	29139
28967	true	23032
28968	false	23032
28847	Forma ângulo reto com o eixo das abscissas.	29177
28848	Forma ângulo reto com o eixo das ordenadas.	29177
28849	É paralelo a uma das retas.	29177
28850	Forma ângulo maior que 90 graus com o eixo das abscissas.	29177
29156	Problemas estructurales	29155
29157	Dependencias de datos	29155
29158	Dependencias de datos y modificaciones del flujo de programa	29155
29031	x + y – 4 = 0	28798
29032	2x – y = 2	28798
29033	– x + 3y – 1 = 0	28798
29034	x + 2y + 1 = 0	28798
29159	Modificaciones en el flujo de programa	29155
29051	Comunicación entre procesadores	28858
29052	Comunicación entre procesadores y memoria	28858
28973	3x – 2y + 1 = 0 e y + x + 1 = 0	28750
28974	6x – 2y + 2 = 0 e 3x – y + 1 = 0	28750
28975	x + 2y – 2 = 0 e 2x + y – 5 = 0	28750
28976	x – 3y + 1 = 0 e x + 2y = 0	28750
29053	Comunicación entre la E/S y el bus de datos	28858
29054	Las dos primeras son correctas	28858
29183	Será formado por um ponto que estará sobre a reta “s”.	29538
29184	Será formado por um ponto que estará acima da reta “r”.	29538
29185	Será formado por um ponto que estará abaixo da reta “s”.	29538
29186	Será formado por um ponto que estará sobre a reta “r”.	29538
29210	gráfico a)	29196
29211	gráfico b)	29196
29212	gráfico c)	29196
29213	gráfico d)	29196
29245	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><msup> <mrow><mi>y</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><mn>2</mn><mo> &sdot; </mo><mi>x</mi><mo> &equals; </mo><mn>0</mn></math>##$	29229
29246	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><msup> <mrow><mi>y</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &minus; </mo><mn>5</mn><mo> &equals; </mo><mn>0</mn></math>##$	29229
29247	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><msup> <mrow><mi>y</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &minus; </mo><mn>5</mn><mo> &sdot; </mo><mi>x</mi><mo> &minus; </mo><mn>5</mn><mo> &sdot; </mo><mi>y</mi><mo> &plus; </mo><mn>5</mn><mo> &equals; </mo><mn>0</mn></math>##$	29229
29248	$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><msup> <mrow><mi>y</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &minus; </mo><mn>25</mn><mo> &equals; </mo><mn>0</mn></math>##$	29229
29237	resp2$## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$ + $## <math xmlns="http://www.w3.org/1998/Math/MathML"> <msup> <mrow><mi>x</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><msup> <mrow><mi>y</mi></mrow> <mrow><mn>2</mn></mrow> </msup><mo> &plus; </mo><msup> <mrow><mi>z</mi></mrow> <mrow><mn>2</mn></mrow> </msup></math>##$	6297
29238	iuhuu esta es la tercera	6297
29240	gráfico a)	29224
29241	gráfico b)	29224
29242	gráfico c)	29224
29243	gráfico d)	29224
29275	gráfico a)	29249
29276	gráfico b)	29249
29277	gráfico c)	29249
29278	gráfico d)	29249
29285	(2,0)\r\n\r\n	29284
29286	(0,4)	29284
29287	(4,0)	29284
29288	(0,2)	29284
\.


--
-- Data for Name: scocommentgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY scocommentgroups (scocommentid, contentgrouppropertyid, groupid) FROM stdin;
\.


--
-- Data for Name: scocomments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY scocomments (commentid, comment, commentdatetime, commentlocation, activityid, creatorid) FROM stdin;
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: root
--

COPY test (id, finished, points, pointsstringarray, groupownerid, testgroupid) FROM stdin;
194	t	0.2	0.2;0.2	\N	191
25777	t	0.99172622	0.1;0.22857141;0.4413793;0.4413793;0.6124402;0.80820835;0.80820835;0.89393276;0.9574008;0.9574008;0.97823685;0.97823685;0.9917262	\N	23783
26302	t	0.99843818	0.12903227;0.12903227;0.12903227;0.12903227;0.16494846;0.28318587;0.51302606;0.51302606;0.51302606;0.67814565;0.8489119;0.95740074;0.98899865;0.9958459;0.9984382;0.9984382	\N	23770
26389	t	0.94399631	0.1;0.22857141;0.22857141;0.22857141;0.22857143;0.37209302;0.37209302;0.5423729;0.5423729;0.7032967;0.7032967;0.7032967;0.7596439;0.8634064;0.8634064;0.8634064;0.8939328;0.9439963	\N	23794
27299	t	0.54237288	0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.47058824;0.47058824;0.47058824;0.5423729	\N	26412
27310	t	0.12903227	0.1;0.1;0.12903227;0.12903227;0.12903227;0.12903227	\N	27019
27332	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1;0.1	\N	27009
27355	t	0.97823685	0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.6781457;0.6781457;0.8489119;0.95740074;0.95740074;0.95740074;0.97823685;0.97823685	\N	27018
27380	t	0.98955148	0.1;0.12903227;0.16494846;0.20846906;0.4125705;0.6519179;0.8331765;0.9301593;0.97261435;0.9895515;0.9895515;0.9895515	\N	27010
27389	t	0.58414149	0.1;0.1;0.12903227;0.12903227;0.16494846;0.28318587;0.51302606;0.51302606;0.51302606;0.51302606;0.5841415	\N	26411
27416	t	0.86340636	0.1;0.1;0.22857141;0.22857141;0.22857141;0.37209302;0.5423729;0.5423729;0.7032967;0.86340636;0.86340636;0.86340636;0.86340636;0.86340636	\N	26410
27447	t	0.82580644	0.1;0.30769232;0.30769232;0.5423729;0.82580644;0.82580644;0.82580644;0.82580644;0.82580644	\N	26353
27522	t	0.99765909	0.1;0.22857141;0.22857141;0.37209302;0.37209302;0.37209302;0.37209302;0.61244017;0.61244017;0.7596439;0.89393276;0.9574008;0.98358834;0.9937818;0.9976591;0.9976591	\N	27001
27710	t	0.28318584	0.1;0.12903227;0.22857143;0.22857143;0.22857143;0.28318584;0.28318584	\N	27025
27729	t	0.99688125	0.1;0.1;0.18181819;0.18181819;0.18181819;0.22857144;0.37209302;0.37209302;0.5423729;0.7596439;0.7596439;0.8634064;0.9439963;0.97823685;0.9917262;0.99688125;0.99688125	\N	26998
13428	t	0.60000002	0.6	\N	13423
13429	t	0.2	0.2	\N	13427
16741	t	0.86340642	0.1;0.22857141;0.22857141;0.37209302;0.37209302;0.5423729;0.7596439;0.7596439;0.8634064;0.8634064;0.8634064;0.8634064;0.8634064	\N	16727
19665	t	0.30769232	0.1;0.18181819;0.18181819;0.18181819;0.30769232	\N	18262
19685	t	0.18181819	0.1;0.1;0.1;0.18181819	\N	18259
19712	t	0.1	0.1	\N	18236
19722	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18214
19740	t	0.18181819	0.1;0.1;0.18181819;0.18181819	\N	18211
19759	t	0.68482494	0.1;0.22857141;0.4489796;0.68482494;0.68482494;0.68482494	\N	18282
19789	t	0.1	0.1	\N	18266
19807	t	0.86340642	0.1;0.1;0.22857141;0.22857141;0.37209302;0.37209302;0.5423729;0.7596439;0.8634064	\N	18284
19816	t	0.63999999	0.1;0.18181819;0.30769232;0.30769232;0.47058824;0.47058824;0.47058824;0.47058824;0.64;0.64	\N	18266
19844	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18264
19868	t	0.37209302	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302	\N	18240
19874	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18218
19910	t	0.23404256	0.1;0.1;0.1;0.1;0.1;0.23404256	\N	18263
19928	t	0.44137931	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.4413793	\N	18268
19944	t	0.78048778	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.47058824;0.64;0.7804878	\N	18290
19974	t	0.61244017	0.1;0.1;0.1;0.18181819;0.37209302;0.61244017;0.61244017;0.61244017;0.61244017;0.61244017	\N	18267
19988	t	0.18181819	0.1;0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18220
20002	t	0.54237288	0.1;0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729;0.5423729	\N	18244
20031	t	0.86340636	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.5423729;0.5423729;0.7032967;0.86340636;0.86340636;0.86340636;0.86340636	\N	18219
20051	t	0.8669951	0.1;0.23404256;0.23404256;0.4489796;0.4489796;0.4489796;0.6197183;0.6197183;0.76521736;0.8669951	\N	18289
20061	t	0.94427603	0.1;0.1;0.22857141;0.4489796;0.69142854;0.8603749;0.94427603	\N	18287
20452	t	0.9985857	0.6345177;0.826819;0.92922527;0.9730499;0.9900289;0.9962374;0.9985857	\N	16720
20628	t	0.1	0.1	\N	18271
20496	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18224
20523	t	0.94560111	0.1;0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.5423729;0.7596439;0.7596439;0.8634064;0.9456011;0.9456011	\N	18272
20575	t	0.98899865	0.1;0.1;0.18181819;0.37209302;0.61244017;0.8082083;0.8939327;0.9574008;0.97823685;0.97823685;0.98899865	\N	18294
20600	t	0.9883697	0.1;0.1;0.22857141;0.4489796;0.4489796;0.68482494;0.8566372;0.9409477;0.9409477;0.9409477;0.9695755;0.9883697	\N	18225
20644	t	0.85281646	0.1;0.1;0.1;0.22857141;0.22857141;0.22857141;0.4413793;0.6848249;0.6848249;0.85281646;0.85281646;0.85281646;0.85281646	\N	18223
20657	t	0.96957552	0.1;0.18181819;0.37209302;0.6197183;0.6197183;0.812933;0.9227836;0.9227836;0.9695755;0.9695755;0.9695755	\N	18249
20674	t	0.68482488	0.1;0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.4413793;0.4413793;0.4413793;0.6848249;0.6848249;0.6848249	\N	18271
20712	t	0.37209302	0.1;0.1;0.18181819;0.18181819;0.37209302;0.37209302	\N	18280
20732	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18275
20744	t	0.22857141	0.1;0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18295
20765	t	0.86340642	0.1;0.22857141;0.4413793;0.6124402;0.6124402;0.7596439;0.8634064	\N	18231
20772	t	0.86340642	0.1;0.22857141;0.4413793;0.6124402;0.7596439;0.8634064;0.8634064	\N	18251
20779	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232	\N	18304
20793	t	0.1	0.1;0.1;0.1;0.1	\N	18226
20806	t	0.54237288	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.5423729	\N	18279
20820	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18254
20835	t	0.18181819	0.1;0.1;0.1;0.1;0.18181819;0.18181819	\N	18302
20856	t	0.1	0.1;0.1;0.1;0.1	\N	18277
20865	t	0.86340642	0.1;0.18181819;0.37209302;0.61244017;0.61244017;0.7596439;0.8634064	\N	18303
20872	t	0.22857141	0.1;0.22857141;0.22857141;0.22857141	\N	18252
20880	t	0.37209302	0.1;0.18181819;0.37209302;0.37209302	\N	18300
20884	t	0.61244023	0.1;0.22857141;0.4413793;0.4413793;0.6124402;0.6124402	\N	18250
20894	t	0.44137931	0.1;0.1;0.1;0.22857141;0.22857141;0.4413793	\N	18298
20904	t	0.22857141	0.1;0.1;0.22857141;0.22857141;0.22857141	\N	18253
20909	t	0.23404256	0.1;0.1;0.1;0.1;0.23404256	\N	18301
21055	t	0.37209302	0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.37209302	\N	18208
21061	t	0.47058824	0.1;0.1;0.18181819;0.18181819;0.30769232;0.47058824;0.47058824	\N	18203
25687	t	0.16494846	0.1;0.1;0.1;0.12903227;0.12903227;0.16494846	\N	23760
25790	t	0.99765909	0.1;0.22857141;0.22857141;0.37209302;0.37209302;0.5423729;0.7596439;0.89393276;0.9574008;0.98358834;0.9937818;0.9976591;0.9976591	\N	23773
26318	t	0.98358834	0.12903227;0.28318584;0.51302606;0.51302606;0.67814565;0.67814565;0.80820835;0.80820835;0.89393276;0.9574008;0.98358834;0.98358834;0.98358834	\N	23790
26331	t	0.9876405	0.44137928;0.6781457;0.8489119;0.93743384;0.93743384;0.9677067;0.9876405;0.9876405	\N	23785
26416	t	0.97823685	0.12903227;0.12903227;0.12903227;0.16494846;0.28318587;0.28318587;0.44137934;0.44137934;0.6124402;0.80820835;0.80820835;0.80820835;0.8489119;0.91828275;0.91828275;0.95740086;0.95740086;0.97823685	\N	23775
27400	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	27027
28145	t	0.93089408	0.9308941	\N	22996
13531	t	0.8888889	0.8;0.8888889	\N	13506
13533	t	0.5	0.5;0.5	\N	13510
13535	t	0.5	0.5;0.5	\N	13511
13537	t	0.69230777	0.6;0.6923078	\N	13515
13540	t	0.89999998	0.9;0.9	\N	13520
13542	t	0.8888889	0.8;0.8888889	\N	13529
13544	t	0.91428572	0.8;0.9142857	\N	13523
13549	t	0.89999998	0.9	\N	13520
13551	t	0.69230777	0.6923078;0.6923078	\N	13515
14915	t	0.5	0.5	\N	14914
14917	t	0.5	0.5	\N	14909
14919	t	0.5	0.5	\N	14914
14934	t	0.5	0.5	\N	14927
14952	t	0.5	0.5	\N	14948
14953	t	0.5	0.5	\N	14948
14958	t	0.5	0.5	\N	14948
14959	t	0.5	0.5	\N	14949
15494	t	0.72727275	0.1;0.25000003;0.4;0.57142854;0.72727275	\N	15487
15499	t	0.72727275	0.1;0.1818182;0.1818182;0.1818182;0.4;0.72727275	\N	15484
15505	t	0.96774197	0.1;0.25000003;0.625;0.8333334;0.8333334;0.90909094;0.96774197	\N	15483
15512	t	0.84210527	0.1;0.1;0.1818182;0.47058827;0.47058827;0.72727275;0.84210527	\N	15485
15519	t	0.8888889	0.1;0.25000003;0.25000003;0.4;0.6666667;0.8;0.8888889	\N	15486
15526	t	0.99900097	0.1;0.25000003;0.5714286;0.86956525;0.86956525;0.97087383;0.99502486;0.99900097	\N	15482
15534	t	0.1	0.1	\N	15491
15535	t	0.1	0.1	\N	15491
15536	t	0.50000006	0.1;0.25000003;0.50000006	\N	15489
15539	t	0.1818182	0.1;0.1818182	\N	15490
15541	t	0.35714287	0.1;0.35714287	\N	15488
15543	t	0.1	0.1	\N	15493
15544	t	0.1	0.1	\N	15492
16811	t	0.63451773	0.1;0.21739131;0.21739131;0.40983608;0.6345177	\N	16720
16816	t	0.30769235	0.1;0.30769235	\N	16718
16818	t	0.99364853	0.1;0.30769235;0.70967746;0.70967746;0.9072165;0.9750692;0.9936485	\N	16717
16825	t	0.98174441	0.1;0.30769235;0.70967746;0.9307692;0.9817444	\N	16721
16830	t	0.1	0.1	\N	16719
16831	t	0.1	0.1	\N	16719
19658	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18238
19671	t	0.1	0.1;0.1;0.1;0.1	\N	18235
19696	t	0.18181819	0.1;0.1;0.1;0.18181819	\N	18283
19714	t	0.1	0.1	\N	18214
19715	t	0.22857141	0.1;0.1;0.1;0.1;0.1;0.22857141	\N	18258
19729	t	0.24701193	0.14090909;0.14090909;0.24701193;0.24701193;0.24701193	\N	18214
19744	t	0.37209302	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302	\N	18236
19768	t	0.54237288	0.1;0.1;0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729	\N	18261
19776	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18210
19792	t	0.61971831	0.1;0.23404256;0.4489796;0.4489796;0.6197183;0.6197183	\N	18212
19827	t	0.22857141	0.1;0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141	\N	18213
19850	t	0.1	0.1	\N	18265
19851	t	0.86340642	0.1;0.1;0.18181819;0.37209302;0.61244017;0.61244017;0.7596439;0.8634064	\N	18285
19880	t	0.61971831	0.1;0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.3793103;0.3793103;0.6197183	\N	18281
19889	t	0.55000001	0.1;0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.55;0.55;0.55	\N	18265
19919	t	0.1	0.1	\N	18268
19935	t	0.61971831	0.1;0.1;0.22857141;0.4489796;0.6197183;0.6197183;0.6197183;0.6197183	\N	18217
19954	t	0.44897959	0.1;0.1;0.22857141;0.22857141;0.4489796;0.4489796;0.4489796	\N	18239
19994	t	0.1	0.1	\N	18257
20016	t	0.68482488	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.6848249;0.6848249;0.6848249	\N	18257
20068	t	0.61244017	0.1;0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.37209302;0.61244017;0.61244017;0.61244017	\N	18292
20078	t	0.99378181	0.1;0.18181819;0.37209302;0.61244017;0.8082083;0.8082083;0.8939327;0.9574008;0.98358834;0.9937818;0.9937818	\N	18291
20211	t	0.81293309	0.1;0.22857141;0.4489796;0.68482494;0.8129331;0.8129331	\N	17002
20217	t	0.70329672	0.1;0.1;0.18181819;0.37209302;0.5423729;0.7032967	\N	16997
20223	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819	\N	17000
20228	t	0.86340642	0.1;0.22857141;0.4413793;0.6124402;0.7596439;0.8634064	\N	17001
20234	t	0.61971831	0.1;0.23404256;0.4489796;0.6197183	\N	16998
20238	t	0.80820841	0.1;0.22857141;0.4413793;0.6781457;0.8082084	\N	16996
20243	t	0.44897959	0.1;0.1;0.22857141;0.22857141;0.4489796	\N	16999
20500	t	0.54237288	0.1;0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729;0.5423729;0.5423729;0.5423729	\N	18222
20537	t	0.99245036	0.1;0.1;0.18181819;0.37209302;0.6197183;0.8175676;0.8175676;0.9227837;0.9704703;0.9704703;0.98501384;0.99245036	\N	18248
20586	t	0.93921453	0.1;0.1;0.1;0.22857141;0.4489796;0.4489796;0.4489796;0.68482494;0.8528165;0.8528165;0.8528165;0.9392145;0.9392145	\N	18269
20612	t	0.94094771	0.1;0.23404256;0.23404256;0.4489796;0.69142854;0.8566372;0.8566372;0.8566372;0.8566372;0.9409477	\N	18245
20629	t	0.99125183	0.1;0.1;0.1;0.22857141;0.4489796;0.4489796;0.4489796;0.4489796;0.68482494;0.68482494;0.8528165;0.9409478;0.97700673;0.9912518;0.9912518	\N	18293
20668	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18232
20688	t	0.98871815	0.1;0.22857141;0.4489796;0.4489796;0.68482494;0.8566372;0.9426345;0.97768795;0.97768795;0.97768795;0.98871815	\N	18297
20699	t	0.47058824	0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.47058824	\N	18227
20718	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18230
20738	t	0.37931034	0.1;0.18181819;0.18181819;0.18181819;0.37931034	\N	18256
20755	t	0.37931034	0.1;0.1;0.1;0.1;0.18181819;0.37931034	\N	18278
20785	t	0.1	0.1;0.1;0.1;0.1	\N	18228
20797	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819	\N	18229
20813	t	0.70329672	0.1;0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7032967	\N	18299
20831	t	0.18181819	0.1;0.1;0.18181819;0.18181819	\N	18276
20845	t	0.44137931	0.1;0.1;0.22857141;0.4413793	\N	18274
20849	t	0.86340642	0.1;0.22857141;0.4413793;0.6124402;0.6124402;0.7596439;0.8634064	\N	18255
13553	t	0.60000002	0.6	\N	13512
13554	t	0.5	0.5;0.5	\N	13511
25693	t	0.9876405	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.44137928;0.61244017;0.8082083;0.9182827;0.9677067;0.9876405;0.9876405;0.9876405	\N	23769
25706	t	0.9876405	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.44137928;0.61244017;0.8082083;0.9182827;0.9677067;0.9876405;0.9876405;0.9876405	\N	23779
25719	t	0.99378181	0.1;0.1;0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.61244017;0.8082083;0.9182827;0.9182827;0.9574008;0.98358834;0.9937818	\N	23765
25804	t	0.44137928	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.44137928	\N	23785
26339	t	0.99868184	0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.8489119;0.93743384;0.9755829;0.99070174;0.99649274;0.99868184	\N	23771
26359	t	0.89393276	0.1;0.22857141;0.4413793;0.4413793;0.6124402;0.80820835;0.80820835;0.89393276;0.89393276;0.89393276	\N	23793
26369	t	0.12903227	0.1;0.1;0.1;0.1;0.1;0.12903227	\N	23775
27284	t	0.12903227	0.1;0.1;0.1;0.1;0.12903227;0.12903227	\N	27020
28151	t	0.93089402	0.930894	\N	22996
12788	t	0.89999998	0.9	\N	12786
4037	t	0.2	0.2;0.2;0.2	\N	191
4040	t	0.2	0.2;0.2	\N	191
4043	t	0.2	0.2;0.2;0.2	\N	191
4184	t	0.2	0.2	\N	4174
4185	t	0.2	0.2	\N	4174
4186	t	0.2	0.2	\N	4174
4190	t	0.37209299	0.2;0.25;0.3076923;0.372093	\N	4174
4196	t	0.87259442	0.24302325;0.742891;0.7939221;0.8370463;0.8725944	\N	4174
4202	t	0.92577243	0.3689374;0.438046;0.8752424;0.9034195;0.9257724	\N	4174
4336	t	0.89999998	0.1;0.5;0.9	\N	4333
4339	t	0.25000003	0.1;0.25000003	\N	4335
4341	t	0.25	0.25	\N	4335
4345	t	0.5	0.25;0.5	\N	4335
4352	t	0.60000002	0.33333334;0.6	\N	4335
4396	t	0.40000001	0.2;0.4;0.4	\N	191
4399	t	0.2	0.2	\N	4169
4400	t	0.2	0.2	\N	4177
14960	t	0.5714286	0.5;0.5714286	\N	14950
16167	t	0.99925053	0.1;0.30769235;0.64000005;0.8767124;0.96603775;0.9861325;0.9953343;0.9981285;0.99925053	\N	15491
18558	t	0.7352941	0.1;0.30769235;0.5263158;0.5263158;0.7352941	\N	18190
18563	t	0.63451773	0.1;0.1;0.21739131;0.21739131;0.21739131;0.40983608;0.40983608;0.6345177;0.6345177	\N	18187
18572	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18186
5595	t	0.24000001	0.24000001;0.24000001;0.24000001	\N	191
5598	t	0.45714289	0.24000001;0.24000001;0.4571429	\N	191
5601	t	0.2	0.2	\N	4169
5602	t	0.27102044	0.27102044;0.27102044;0.27102044	\N	191
5605	t	0.2	0.2	\N	4177
18578	t	0.52631575	0.1;0.21739131;0.52631575;0.52631575;0.52631575;0.52631575	\N	18188
18584	t	0.8163265	0.1;0.21739131;0.21739131;0.21739131;0.21739131;0.52631575;0.8163265	\N	18189
18591	t	0.98987627	0.1;0.21739131;0.52631575;0.52631575;0.52631575;0.8163265;0.96069866;0.96069866;0.9898763;0.9898763	\N	18185
18601	t	0.99427301	0.1;0.30769235;0.30769235;0.5263158;0.81632656;0.81632656;0.9174312;0.96525097;0.9858044;0.994273	\N	18194
18612	t	0.9815951	0.1;0.1;0.21739131;0.45454547;0.7692308;0.9302326;0.9815951	\N	18192
18619	t	0.8741259	0.1;0.30769235;0.30769235;0.30769235;0.5263158;0.5263158;0.5263158;0.7352941;0.7352941;0.7352941;0.8741259	\N	18193
18630	t	0.94868141	0.1;0.1;0.1;0.37931037;0.37931037;0.7707007;0.9486814	\N	18191
18637	t	0.99592578	0.1;0.30769235;0.30769235;0.30769235;0.5263158;0.81632656;0.96069866;0.9898763;0.9959258;0.9959258	\N	18196
18647	t	0.97747892	0.1;0.1;0.21739131;0.21739131;0.40983608;0.40983608;0.6345177;0.6345177;0.8127438;0.8127438;0.91561675;0.9774789;0.9774789;0.9774789	\N	18195
18661	t	0.7352941	0.1;0.1;0.21739131;0.52631575;0.52631575;0.52631575;0.52631575;0.7352941;0.7352941;0.7352941;0.7352941;0.7352941	\N	18200
18673	t	0.40983608	0.1;0.21739131;0.21739131;0.40983608;0.40983608;0.40983608;0.40983608;0.40983608	\N	18198
7174	t	0.6511628	0.2;0.2;0.4;0.6511628	\N	7162
7178	t	0.9330557	0.6511628;0.6511628;0.8327138;0.9330557	\N	7162
7182	t	0.96604371	0.79210925;0.9143;0.9660437;0.9660437	\N	7162
7186	t	0.99163544	0.8500874;0.9407497;0.9769267;0.99163544	\N	7162
7259	t	0.9973557	0.88547444;0.9558473;0.98297286;0.992631;0.9973557	\N	7162
18681	t	0.99364853	0.1;0.1;0.1;0.30769235;0.70967746;0.70967746;0.9072165;0.9750692;0.9750692;0.9936485;0.9936485	\N	18197
18692	t	0.9974497	0.1;0.1;0.21739131;0.52631575;0.85937494;0.85937494;0.9606987;0.9606987;0.9898763;0.9898763;0.9974497	\N	18201
18703	t	0.98174441	0.1;0.1;0.1;0.30769235;0.70967746;0.70967746;0.70967746;0.9072165;0.9817444;0.9817444;0.9817444;0.9817444	\N	18199
19663	t	0.1	0.1	\N	18262
19676	t	0.30769232	0.1;0.18181819;0.18181819;0.18181819;0.30769232	\N	18286
19703	t	0.22857141	0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18234
19721	t	0.1	0.1	\N	18260
10010	t	0.78399998	0.2;0.36842105;0.6086956;0.6086956;0.784;0.784	\N	10007
19735	t	0.1	0.1	\N	18211
19750	t	0.37209302	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302	\N	18260
19782	t	0.44137931	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.4413793	\N	18237
19799	t	0.61971831	0.1;0.18181819;0.37209302;0.6197183;0.6197183;0.6197183;0.6197183;0.6197183	\N	18233
19835	t	0.30769232	0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232;0.30769232	\N	18242
19859	t	0.99050295	0.1;0.1;0.22857141;0.4489796;0.70967746;0.88;0.95135134;0.98118466;0.99050295	\N	18209
19900	t	0.1	0.1	\N	18263
19901	t	0.37209302	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302	\N	18216
19920	t	0.77070063	0.1;0.23404256;0.4566038;0.4566038;0.626943;0.626943;0.77070063;0.77070063	\N	18241
19943	t	0.1	0.1	\N	18267
19963	t	0.23404256	0.1;0.1;0.1;0.23404256;0.23404256;0.23404256;0.23404256	\N	18215
19995	t	0.22857141	0.1;0.1;0.1;0.1;0.1;0.22857141;0.22857141	\N	18288
20026	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18243
20510	t	0.97888243	0.1;0.18181819;0.37209302;0.37209302;0.61244017;0.61244017;0.8082083;0.8082083;0.8939327;0.9586383;0.9586383;0.9586383;0.97888243	\N	18296
20549	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18270
20555	t	0.37209302	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.37209302	\N	18246
20563	t	0.94094771	0.1;0.1;0.1;0.22857141;0.22857141;0.4413793;0.6848249;0.8566371;0.8566371;0.9409477;0.9409477;0.9409477	\N	18221
20599	t	0.1	0.1	\N	18273
20622	t	0.18181819	0.1;0.1;0.1;0.1;0.18181819;0.18181819	\N	18273
20706	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18247
21068	t	0.37209302	0.1;0.18181819;0.18181819;0.18181819;0.37209302;0.37209302;0.37209302	\N	18206
21075	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819;0.18181819	\N	18207
21081	t	0.1	0.1;0.1;0.1;0.1	\N	18204
21085	t	0.44137931	0.1;0.22857141;0.4413793;0.4413793	\N	18202
21089	t	0.22857141	0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18205
21187	t	0.54237288	0.1;0.1;0.18181819;0.37209302;0.5423729	\N	18310
21192	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18334
21197	t	0.1	0.1;0.1;0.1;0.1;0.1	\N	18358
21207	t	0.1	0.1;0.1;0.1;0.1	\N	18331
21211	t	0.18181819	0.1;0.1;0.18181819;0.18181819	\N	18355
21215	t	0.1	0.1;0.1;0.1	\N	18331
21219	t	0.55000001	0.1;0.1;0.1;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232;0.55	\N	18307
21228	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18354
21234	t	0.70329672	0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7032967	\N	18332
21240	t	0.54237288	0.1;0.1;0.22857141;0.37209302;0.5423729;0.5423729	\N	18356
21246	t	0.68482488	0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.4413793;0.6848249	\N	18306
21254	t	0.22857141	0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18330
21260	t	0.97700679	0.6848249;0.6848249;0.6848249;0.6848249;0.85281646;0.85281646;0.9392145;0.9770068	\N	18306
21268	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819;0.18181819	\N	18357
21274	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819;0.18181819	\N	18333
21280	t	0.82580644	0.1;0.22857141;0.22857141;0.22857141;0.37209302;0.61244017;0.61244017;0.61244017;0.82580644	\N	18353
21289	t	0.63999999	0.1;0.1;0.18181819;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.64	\N	18329
21298	t	0.54237288	0.1;0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.5423729;0.5423729;0.5423729	\N	18308
21307	t	0.37209302	0.1;0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.37209302	\N	18338
21317	t	0.86340642	0.1;0.22857141;0.4413793;0.4413793;0.6124402;0.6124402;0.7596439;0.8634064	\N	18309
21325	t	0.75964391	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.61244017;0.61244017;0.7596439	\N	18362
21335	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232	\N	18336
21341	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18305
21347	t	0.37209302	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302	\N	18360
21354	t	0.87050366	0.1;0.23404256;0.4566038;0.4566038;0.626943;0.77070063;0.87050366;0.87050366	\N	18337
21362	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18314
21368	t	0.23404256	0.1;0.23404256;0.23404256;0.23404256;0.23404256	\N	18335
21376	t	0.81756753	0.1;0.23404256;0.23404256;0.4566038;0.69142854;0.69142854;0.69142854;0.8175675;0.8175675;0.8175675	\N	18361
21386	t	0.22857141	0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18312
21392	t	0.23404256	0.1;0.1;0.1;0.23404256;0.23404256;0.23404256	\N	18359
21399	t	0.94716239	0.1;0.22857141;0.4489796;0.69142854;0.69142854;0.8175675;0.8996282;0.9471624	\N	18313
21407	t	0.44897959	0.1;0.1;0.1;0.1;0.1;0.22857141;0.4489796;0.4489796	\N	18340
21415	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18339
21421	t	0.23404256	0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.23404256	\N	18311
21427	t	0.37209302	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.37209302	\N	18364
21436	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18316
21447	t	0.18181819	0.1;0.1;0.1;0.1;0.18181819;0.18181819	\N	18363
21736	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232	\N	18326
21442	t	0.44137931	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.4413793	\N	18315
21530	t	0.18181819	0.1;0.1;0.1;0.1;0.1;0.18181819	\N	18344
21544	t	0.83018869	0.1;0.1;0.1;0.1;0.18181819;0.30769232;0.47058824;0.47058824;0.47058824;0.64;0.64;0.64;0.64;0.8301887	\N	18320
21562	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18342
21568	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18318
21574	t	0.70329672	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.5423729;0.5423729;0.5423729;0.7032967;0.7032967;0.7032967;0.7032967	\N	18368
21588	t	0.22857141	0.1;0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141	\N	18342
21596	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819;0.18181819	\N	18366
21603	t	0.67814571	0.1;0.22857141;0.22857141;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.6781457;0.6781457	\N	18341
21613	t	0.97768795	0.1;0.23404256;0.4566038;0.6979549;0.8603749;0.9426346;0.97768795;0.97768795;0.97768795;0.97768795	\N	18317
21623	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18345
21629	t	0.44137931	0.1;0.1;0.22857141;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.4413793	\N	18365
21637	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18321
21643	t	0.30769232	0.1;0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232;0.30769232	\N	18369
21653	t	0.85281652	0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.4489796;0.4489796;0.4489796;0.68482494;0.68482494;0.8528165;0.8528165;0.8528165	\N	18343
21666	t	0.93921453	0.1;0.1;0.1;0.22857141;0.22857141;0.4413793;0.6781457;0.8489119;0.9392145;0.9392145;0.9392145;0.9392145	\N	18319
21678	t	0.18181819	0.1;0.1;0.1;0.1;0.18181819;0.18181819	\N	18352
21684	t	0.61971831	0.1;0.23404256;0.23404256;0.4489796;0.4489796;0.4489796;0.6197183;0.6197183;0.6197183	\N	18367
21693	t	0.70329666	0.1;0.1;0.18181819;0.30769232;0.30769232;0.47058824;0.70329666	\N	18347
21700	t	0.61971831	0.1;0.1;0.1;0.18181819;0.37209302;0.6197183;0.6197183;0.6197183	\N	18328
21709	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18376
21715	t	0.61244017	0.1;0.1;0.22857141;0.22857141;0.22857141;0.37209302;0.61244017;0.61244017	\N	18350
21723	t	0.70329672	0.1;0.18181819;0.18181819;0.18181819;0.30769232;0.5423729;0.7032967	\N	18323
21730	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18371
21744	t	0.61971831	0.1;0.1;0.1;0.1;0.18181819;0.37209302;0.6197183	\N	18374
21751	t	0.91828275	0.1;0.1;0.22857141;0.4413793;0.6781457;0.8489119;0.91828275;0.91828275;0.91828275	\N	18351
21760	t	0.22857141	0.1;0.22857141;0.22857141;0.22857141;0.22857141	\N	18348
21765	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819;0.18181819	\N	18375
21771	t	0.80820829	0.1;0.22857141;0.22857141;0.37209302;0.61244017;0.8082083	\N	18346
21777	t	0.37209302	0.1;0.18181819;0.37209302;0.37209302;0.37209302	\N	18372
21782	t	0.95740086	0.1;0.22857141;0.22857141;0.4413793;0.6781457;0.8489119;0.91828275;0.95740086;0.95740086	\N	18327
21791	t	0.22857141	0.1;0.1;0.1;0.22857141	\N	18370
21795	t	0.69142854	0.1;0.22857141;0.4489796;0.4489796;0.69142854;0.69142854	\N	18373
21802	t	0.37209302	0.1;0.1;0.1;0.18181819;0.18181819;0.37209302;0.37209302	\N	18349
21809	t	0.23404256	0.1;0.1;0.1;0.1;0.23404256	\N	18324
21814	t	0.37209302	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302	\N	18322
21820	t	0.61971831	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.6197183;0.6197183	\N	18325
21864	t	0.98570687	0.9078506;0.9078506;0.9078506;0.98570687;0.98570687;0.98570687	\N	7162
22032	t	0.86340642	0.8634064;0.8634064;0.8634064;0.8634064;0.8634064;0.8634064	\N	16727
22038	t	0.99843818	0.8634064;0.92669684;0.97119147;0.9889987;0.995846;0.9984382	\N	16727
22044	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	16726
22050	t	0.93743384	0.1;0.18181819;0.37209302;0.61244017;0.8082083;0.9182827;0.9182827;0.9182827;0.93743384;0.93743384	\N	16726
22060	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	16725
22065	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	16723
25733	t	0.67814571	0.1;0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.61244017;0.61244017;0.61244017;0.6781457;0.6781457	\N	23764
25831	t	0.99912089	0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.37209302;0.5423729;0.7596439;0.89393276;0.9574008;0.98358834;0.9937818;0.9976591;0.9991209	\N	23788
22801	t	0.30769232	0.1;0.18181819;0.18181819;0.30769232;0.30769232	\N	18382
22806	t	0.30769232	0.1;0.18181819;0.18181819;0.30769232;0.30769232	\N	18406
22811	t	0.1	0.1;0.1;0.1;0.1	\N	18379
22815	t	0.37209302	0.1;0.22857141;0.22857141;0.37209302	\N	18403
22819	t	0.44897959	0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.4489796	\N	18378
22825	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18402
22831	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232	\N	18380
22837	t	0.37209302	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302	\N	18404
22843	t	0.94399631	0.1;0.22857141;0.4413793;0.6781457;0.8082084;0.8082084;0.8939328;0.9439963	\N	18381
22851	t	0.54237288	0.1;0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.5423729	\N	18405
22859	t	0.96957552	0.1;0.22857141;0.4489796;0.4489796;0.69142854;0.69142854;0.8566372;0.9409477;0.9695755	\N	18377
22868	t	0.96195394	0.1;0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.7596439;0.8634064;0.92669684;0.96195394	\N	18386
22878	t	0.82580644	0.1;0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.61244017;0.82580644	\N	18401
22887	t	0.22857141	0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141	\N	18384
22894	t	0.82580644	0.1;0.1;0.18181819;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.70329666;0.82580644	\N	18410
22904	t	0.61244017	0.1;0.1;0.1;0.1;0.18181819;0.37209302;0.61244017	\N	18408
22911	t	0.8669951	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.76521736;0.76521736;0.8669951	\N	18385
22921	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18383
22927	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1;0.1	\N	18409
22933	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18388
22939	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18407
22945	t	0.22857141	0.1;0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18412
22952	t	0.86340636	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.5423729;0.5423729;0.5423729;0.7032967;0.7032967;0.7032967;0.86340636;0.86340636	\N	18387
22965	t	0.80820841	0.22857141;0.4413793;0.4413793;0.6781457;0.6781457;0.6781457;0.6781457;0.8082084;0.8082084;0.8082084	\N	18412
22975	t	0.9574008	0.1;0.1;0.18181819;0.18181819;0.18181819;0.37209302;0.61244017;0.61244017;0.61244017;0.61244017;0.7596439;0.7596439;0.89393276;0.9574008	\N	18411
22999	t	0.78399998	0.2;0.4;0.6086956;0.784	\N	22996
23003	t	0.98137695	0.784;0.8943937;0.957599;0.98137695	\N	22996
23008	t	0.97617102	0.88268846;0.9461112;0.976171	\N	22996
23011	t	0.91384935	0.91384935;0.91384935;0.91384935	\N	22996
23016	t	0.1	0.1;0.1;0.1	\N	23015
23019	t	0.1	0.1;0.1;0.1	\N	23015
23022	t	0.2	0.2	\N	22995
23039	t	0.99939072	0.2;0.6923077;0.9529412;0.99454296;0.9993907	\N	22995
23044	t	0.22857141	0.1;0.1;0.1;0.22857141;0.22857141;0.22857141	\N	23015
23050	t	0.2	0.2;0.2	\N	192
23052	t	0.1	0.1;0.1;0.1;0.1;0.1	\N	18514
23057	t	0.37209302	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.37209302	\N	18416
23066	t	0.18181819	0.1;0.1;0.18181819;0.18181819	\N	18511
23070	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.30769232	\N	19055
23075	t	0.1	0.1	\N	22726
23081	t	0.44897959	0.1;0.1;0.1;0.1;0.22857141;0.4489796	\N	18510
23087	t	0.92669684	0.1;0.1;0.18181819;0.37209302;0.37209302;0.61244017;0.61244017;0.61244017;0.7596439;0.7596439;0.8634064;0.8634064;0.8634064;0.92669684	\N	18392
23076	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18414
23101	t	0.1	0.1	\N	18512
23103	t	0.1	0.1	\N	18413
23104	t	0.1	0.1;0.1;0.1;0.1	\N	19052
23189	t	0.37931031	0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.3793103;0.3793103;0.3793103	\N	18517
23197	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18415
23111	t	0.1	0.1;0.1;0.1;0.1	\N	19052
23203	t	0.4566038	0.1;0.1;0.1;0.1;0.23404256;0.4566038	\N	18515
23209	t	0.61244023	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.4413793;0.6124402;0.6124402	\N	19054
23115	t	0.22857141	0.1;0.1;0.1;0.1;0.22857141;0.22857141	\N	18513
23132	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18413
23138	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18390
23144	t	0.82580644	0.1;0.22857141;0.22857141;0.22857141;0.37209302;0.61244017;0.61244017;0.82580644;0.82580644	\N	18509
23153	t	0.30769232	0.1;0.18181819;0.18181819;0.18181819;0.30769232;0.30769232	\N	19053
23159	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18518
23165	t	0.37209302	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302	\N	18516
23171	t	0.96957552	0.1;0.1;0.18181819;0.37209302;0.6197183;0.6197183;0.812933;0.9227836;0.9227836;0.9227836;0.9695755	\N	18417
23183	t	0.44897959	0.1;0.22857141;0.4489796;0.4489796;0.4489796;0.4489796	\N	19051
23217	t	0.68482494	0.1;0.1;0.1;0.1;0.1;0.22857141;0.4489796;0.4489796;0.4489796;0.68482494;0.68482494	\N	18389
23229	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18424
23235	t	0.61244017	0.1;0.1;0.18181819;0.37209302;0.37209302;0.61244017;0.61244017;0.61244017;0.61244017	\N	19050
23244	t	0.83018869	0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.7096774;0.8301887	\N	18419
23252	t	0.94094777	0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141;0.4413793;0.4413793;0.6781457;0.85281646;0.9409478	\N	18393
23264	t	0.98538524	0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.7596439;0.89393276;0.9439963;0.97119147;0.98538524	\N	19059
23274	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18520
23280	t	0.22857141	0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.22857141	\N	18391
23289	t	0.75964391	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.5423729;0.5423729;0.5423729;0.5423729;0.7596439;0.7596439	\N	18519
23302	t	0.98538524	0.82580644;0.90459365;0.96195394;0.96195394;0.98538524;0.98538524	\N	18509
23309	t	0.89681536	0.1;0.22857141;0.4489796;0.68482494;0.68482494;0.8129331;0.8129331;0.89681536;0.89681536	\N	18400
23318	t	0.54237288	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.5423729	\N	18395
23326	t	0.96357119	0.908417;0.908417;0.95201105;0.95201105;0.95201105;0.9635712	\N	16727
23332	t	0.30769232	0.1;0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232	\N	18398
23341	t	0.61244023	0.1;0.22857141;0.22857141;0.4413793;0.4413793;0.4413793;0.6124402;0.6124402;0.6124402	\N	18399
23350	t	0.22857141	0.1;0.1;0.1;0.22857141;0.22857141;0.22857141;0.22857141	\N	18396
23357	t	0.12903227	0.1;0.1;0.1;0.12903227;0.12903227;0.12903227	\N	22690
23364	t	0.12903227	0.1;0.1;0.12903227;0.12903227;0.12903227;0.12903227	\N	22689
23370	t	0.34501347	0.12903227;0.28318584;0.28318584;0.28318584;0.28318584;0.34501347	\N	22689
23412	t	0.12903227	0.1;0.12903227;0.12903227;0.12903227;0.12903227;0.12903227	\N	22725
23440	t	0.16494846	0.1;0.12903227;0.12903227;0.16494846;0.16494846;0.16494846	\N	22724
23458	t	0.52483952	0.23702288;0.45307794;0.45307794;0.45307794;0.45307794;0.5248395	\N	22689
23485	t	0.12903227	0.1;0.1;0.1;0.1;0.1;0.12903227	\N	22722
23509	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	22723
24336	t	0.57647055	0.2;0.36842105;0.57647055	\N	24333
24339	t	0.59999996	0.2;0.59999996	\N	24335
24341	t	0.90000004	0.59999996;0.90000004	\N	24335
24343	t	0.99939072	0.2;0.6923077;0.9529412;0.99454296;0.9993907	\N	24332
24348	t	0.2	0.2;0.2	\N	24334
24350	t	0.99172622	0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.6124402;0.80820835;0.80820835;0.89393276;0.89393276;0.9439963;0.97823685;0.9917262	\N	23772
24363	t	0.75964391	0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729;0.7032967;0.7032967;0.7032967;0.7032967;0.7596439	\N	23763
24375	t	0.1	0.1	\N	18524
24376	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18524
24383	t	0.65191787	0.1;0.1;0.1;0.12903227;0.12903227;0.16494846;0.20846906;0.25989848;0.41257054;0.41257054;0.41257054;0.48358914;0.6519179;0.6519179;0.6519179;0.6519179;0.6519179	\N	23782
24399	t	0.98899865	0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.5423729;0.5423729;0.7032967;0.86340636;0.9439963;0.97823685;0.97823685;0.98899865;0.98899865	\N	23791
24413	t	0.99947882	0.98538524;0.99263877;0.99263877;0.9963058;0.9986115;0.9994788	\N	19059
24420	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	18522
24426	t	0.1	0.1	\N	18521
24427	t	0.12903227	0.1;0.1;0.1;0.1;0.1;0.12903227	\N	23770
24433	t	0.30769232	0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232;0.30769232	\N	18522
24442	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.18181819;0.30769232;0.30769232	\N	19057
24449	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18524
24455	t	0.30769232	0.1;0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232	\N	18422
24464	t	0.61244017	0.1;0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.61244017	\N	18394
24471	t	0.98538524	0.1;0.18181819;0.37209302;0.37209302;0.61244017;0.86340636;0.961954;0.961954;0.961954;0.97119147;0.98538524	\N	23761
24482	t	0.81293303	0.1;0.1;0.1;0.18181819;0.37209302;0.37209302;0.61244017;0.61244017;0.61244017;0.61244017;0.812933;0.812933	\N	18525
24494	t	0.12903227	0.1;0.1;0.1;0.1;0.1;0.12903227	\N	23790
24500	t	0.89962828	0.1;0.1;0.22857141;0.4489796;0.4489796;0.6197183;0.8175676;0.8175676;0.8996283;0.8996283	\N	19058
24510	t	0.44897959	0.1;0.23404256;0.23404256;0.4489796;0.4489796;0.4489796;0.4489796	\N	18397
24517	t	0.75964391	0.1;0.1;0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.7596439;0.7596439	\N	18423
24526	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18523
24532	t	0.23404256	0.1;0.1;0.1;0.23404256;0.23404256;0.23404256;0.23404256	\N	19056
24539	t	0.1	0.1	\N	18532
24540	t	0.99824333	0.1;0.12903227;0.12903227;0.12903227;0.16494846;0.28318587;0.28318587;0.51302606;0.51302606;0.7374865;0.7374865;0.8822357;0.9677066;0.9876405;0.99532914;0.99824333;0.99824333	\N	23780
24557	t	0.1	0.1	\N	23771
24558	t	0.4566038	0.1;0.1;0.1;0.1;0.1;0.23404256;0.4566038	\N	18420
24565	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	23771
24571	t	0.23404256	0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.23404256	\N	19061
24577	t	0.1	0.1	\N	19060
24578	t	0.8669951	0.1;0.22857141;0.4489796;0.4489796;0.4489796;0.6197183;0.76521736;0.8669951	\N	18527
24586	t	0.80820829	0.1;0.18181819;0.18181819;0.37209302;0.61244017;0.8082083	\N	18418
24594	t	0.98899871	0.1;0.18181819;0.37209302;0.61244017;0.61244017;0.7596439;0.7596439;0.8634064;0.8634064;0.92669684;0.97119147;0.9889987;0.9889987;0.9889987	\N	23762
24608	t	0.61971831	0.1;0.23404256;0.23404256;0.23404256;0.3793103;0.6197183;0.6197183;0.6197183;0.6197183	\N	18530
24617	t	0.1	0.1	\N	18531
24618	t	0.18181819	0.1;0.1;0.1;0.18181819;0.18181819;0.18181819	\N	18421
24624	t	0.61971831	0.1;0.22857141;0.22857141;0.22857141;0.22857141;0.37209302;0.6197183	\N	18528
24631	t	0.70329666	0.1;0.1;0.18181819;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.47058824;0.70329666;0.70329666;0.70329666;0.70329666;0.70329666	\N	19065
24645	t	0.92669684	0.1;0.22857141;0.22857141;0.37209302;0.37209302;0.5423729;0.5423729;0.5423729;0.7032967;0.7032967;0.82580644;0.92669684;0.92669684;0.92669684;0.92669684;0.92669684	\N	23781
24666	t	0.37209302	0.1;0.18181819;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302	\N	18526
24683	t	0.20846906	0.12903227;0.16494846;0.16494846;0.16494846;0.16494846;0.20846906	\N	23789
24661	t	0.12903227	0.1;0.12903227;0.12903227;0.12903227;0.12903227;0.12903227;0.12903227	\N	23789
24673	t	0.1	0.1	\N	18529
24674	t	0.30769232	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232;0.30769232	\N	19063
24691	t	0.75964391	0.1;0.22857141;0.22857141;0.4413793;0.4413793;0.6124402;0.6124402;0.6124402;0.7596439	\N	18531
24700	t	0.4566038	0.1;0.23404256;0.4566038;0.4566038;0.4566038;0.4566038;0.4566038	\N	19062
24707	t	0.44897959	0.1;0.1;0.1;0.1;0.1;0.22857141;0.4489796	\N	18529
24714	t	0.99912089	0.1;0.22857141;0.4413793;0.4413793;0.6124402;0.80820835;0.80820835;0.89393276;0.9574008;0.98358834;0.9937818;0.9976591;0.9991209	\N	23768
24727	t	0.98358834	0.1;0.12903227;0.12903227;0.16494846;0.28318587;0.28318587;0.44137934;0.44137934;0.6124402;0.80820835;0.80820835;0.89393276;0.9574008;0.98358834;0.98358834;0.98358834	\N	23759
24743	t	0.18181819	0.1;0.18181819;0.18181819;0.18181819;0.18181819;0.18181819	\N	18512
24749	t	0.54237288	0.1;0.1;0.18181819;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729;0.5423729;0.5423729;0.5423729	\N	19060
24760	t	0.85281652	0.1;0.1;0.1;0.22857141;0.4489796;0.4489796;0.68482494;0.68482494;0.68482494;0.8528165	\N	18521
24770	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	18532
24776	t	0.85663718	0.1;0.23404256;0.23404256;0.4489796;0.4489796;0.68482494;0.8566372;0.8566372;0.8566372;0.8566372;0.8566372	\N	19066
24787	t	0.23404256	0.1;0.23404256;0.23404256;0.23404256;0.23404256;0.23404256	\N	19064
24793	t	0.97823685	0.1;0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.6124402;0.80820835;0.80820835;0.89393276;0.9574008;0.9574008;0.97823685;0.97823685	\N	23778
24807	t	0.97823685	0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.70329666;0.70329666;0.82580644;0.92669684;0.97119147;0.97119147;0.97119147;0.97823685	\N	23787
24821	t	0.18181819	0.1;0.1;0.18181819;0.18181819;0.18181819;0.18181819	\N	19073
24827	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	19068
24833	t	0.18181819	0.1;0.1;0.1;0.1;0.18181819;0.18181819	\N	19071
24839	t	0.61244023	0.1;0.22857141;0.22857141;0.4413793;0.4413793;0.6124402;0.6124402;0.6124402;0.6124402	\N	19072
24848	t	0.22857141	0.1;0.1;0.1;0.1;0.22857141;0.22857141;0.22857141	\N	19069
24855	t	0.44137931	0.1;0.1;0.22857141;0.4413793;0.4413793	\N	19067
24860	t	0.86037493	0.1;0.23404256;0.4566038;0.6979549;0.6979549;0.6979549;0.8603749	\N	19070
25744	t	0.75964385	0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.70329666;0.70329666;0.70329666;0.70329666;0.75964385	\N	23784
25755	t	0.99172622	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.51302606;0.67814565;0.67814565;0.80820835;0.80820835;0.89393276;0.9574008;0.9574008;0.97823685;0.9917262	\N	23774
25770	t	0.10000002	0.1;0.1;0.1;0.10000002;0.10000002;0.10000002	\N	23766
26280	t	0.59077036	0.16875067;0.28877103;0.51985675;0.51985675;0.51985675;0.51985675;0.59077036	\N	23789
26376	t	0.98358828	0.1;0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.61244017;0.8082083;0.9182827;0.9677067;0.9677067;0.9835883;0.9835883	\N	23792
27290	t	0.61244017	0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729;0.5423729;0.5423729;0.61244017	\N	27002
27316	t	0.99882817	0.1;0.1;0.1;0.1;0.12903227;0.22857143;0.37209302;0.5423729;0.7032967;0.86340636;0.9439963;0.97823685;0.9917262;0.99688125;0.9988282	\N	27011
27337	t	0.93743384	0.1;0.1;0.1;0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.61244017;0.61244017;0.61244017;0.6781457;0.7374865;0.84891194;0.91828275;0.91828275;0.91828275;0.93743384	\N	27029
27367	t	0.84891188	0.1;0.22857141;0.4413793;0.4413793;0.4413793;0.51302606;0.67814565;0.67814565;0.80820835;0.80820835;0.80820835;0.8489119;0.8489119	\N	26355
27406	t	0.99921846	0.1;0.18181819;0.37209302;0.61244017;0.86340636;0.961954;0.98538524;0.9944689;0.99791867;0.99921846	\N	27000
27429	t	0.93015927	0.1;0.12903227;0.22857143;0.22857143;0.22857143;0.28318584;0.34501347;0.34501347;0.4125705;0.4125705;0.4835891;0.6519178;0.6519178;0.789286;0.9089976;0.9089976;0.9089976;0.9089976;0.9301593	\N	27016
27456	t	0.12903227	0.1;0.1;0.12903227;0.12903227;0.12903227;0.12903227	\N	26408
27462	t	0.97823685	0.1;0.12903227;0.16494846;0.28318587;0.44137934;0.6124402;0.6124402;0.6124402;0.7596439;0.7596439;0.80820835;0.89393276;0.9439963;0.97823685;0.97823685;0.97823685	\N	27007
27478	t	0.51302606	0.1;0.1;0.12903227;0.16494846;0.28318587;0.28318587;0.28318587;0.3450135;0.3450135;0.51302606;0.51302606;0.51302606;0.51302606;0.51302606	\N	27028
27696	t	0.30769229	0.2;0.25;0.25;0.25;0.3076923;0.3076923	\N	27694
27702	t	0.37209299	0.3076923;0.3076923;0.3076923;0.372093;0.372093;0.372093	\N	27694
27718	t	0.99172622	0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7596439;0.89393276;0.9574008;0.98358834;0.98358834;0.9917262	\N	26354
27746	t	0.97823685	0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.37209302;0.37209302;0.44137928;0.61244017;0.8082083;0.9182827;0.9182827;0.9574008;0.9574008;0.97823685	\N	26414
27762	t	0.99824333	0.1;0.12903227;0.12903227;0.16494846;0.28318587;0.28318587;0.44137934;0.6781457;0.8489119;0.8489119;0.91828275;0.96770674;0.9876406;0.99532914;0.99824333	\N	26999
27777	t	0.96195394	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.47058824;0.70329666;0.86340636;0.86340636;0.92669684;0.92669684;0.96195394	\N	27004
27791	t	0.38434833	0.1;0.12903227;0.16494846;0.20846906;0.25989848;0.3189038;0.38434833;0.38434833;0.38434833;0.38434833	\N	27008
27801	t	0.98899865	0.1;0.18181819;0.18181819;0.30769232;0.5423729;0.5423729;0.7032967;0.86340636;0.9439963;0.97823685;0.97823685;0.98899865;0.98899865	\N	27003
27814	t	0.16494846	0.1;0.12903227;0.12903227;0.16494846;0.16494846;0.16494846	\N	27013
27822	t	0.16494846	0.1;0.12903227;0.12903227;0.12903227;0.16494846;0.16494846	\N	27005
27829	t	0.99301004	0.1;0.12903227;0.12903227;0.16494846;0.28318587;0.51302606;0.7374865;0.8822357;0.95232975;0.9815747;0.99301004;0.99301004;0.99301004	\N	27017
27842	t	0.16494846	0.1;0.1;0.1;0.12903227;0.12903227;0.16494846	\N	27022
27848	t	0.99462813	0.33989263;0.4070701;0.4070701;0.47791222;0.64673966;0.8299916;0.9286674;0.972002;0.9893138;0.9893138;0.99462813	\N	27694
27859	t	0.99861151	0.2;0.33333334;0.57142854;0.57142854;0.7272727;0.8767123;0.8767123;0.93430656;0.97431016;0.9902091;0.9963058;0.9986115	\N	27695
27875	t	0.99990225	0.9986115;0.9989583;0.9994789;0.9998045;0.9998045;0.99990225	\N	27695
27882	t	0.99584591	0.2;0.2;0.25;0.25;0.25;0.3076923;0.4705882;0.70329666;0.86340636;0.9439963;0.97823685;0.97823685;0.98899865;0.9958459	\N	27691
27896	t	0.99791867	0.2;0.33333334;0.57142854;0.7804878;0.90459365;0.96195394;0.98538524;0.9944689;0.99791867	\N	27690
27905	t	0.2	0.2;0.2;0.2;0.2;0.2;0.2	\N	27692
27911	t	0.99843818	0.2;0.25;0.4;0.64000005;0.8258065;0.92669684;0.97119147;0.9889987;0.995846;0.9984382	\N	27692
27921	t	0.9404217	0.2;0.25;0.47058824;0.5423729;0.61244017;0.6781457;0.7374865;0.789286;0.83317655;0.86943716;0.8987737;0.9221091;0.9404217	\N	27693
27934	t	0.37209299	0.2;0.25;0.3076923;0.372093;0.372093	\N	27689
27939	t	0.65191782	0.372093;0.44137925;0.513026;0.5841414;0.6519178	\N	27689
27944	t	0.76830393	0.5120054;0.5831487;0.65099025;0.7132205;0.76830393	\N	27689
27949	t	0.72515267	0.5974383;0.664293;0.664293;0.664293;0.7251527	\N	27689
27954	t	0.84293497	0.6293669;0.6936382;0.7511707;0.8009987;0.84293497	\N	27689
27959	t	0.86626589	0.6720805;0.7320978;0.7846502;0.8292975;0.8662659	\N	27689
27965	t	0.9574008	0.12903227;0.12903227;0.22857143;0.22857143;0.37209302;0.61244017;0.8082083;0.9182827;0.9182827;0.9574008;0.9574008;0.9574008	\N	27020
27977	t	0.12903227	0.1;0.12903227;0.12903227;0.12903227;0.12903227;0.12903227	\N	27027
27983	t	0.30769232	0.1;0.30769232;0.30769232;0.30769232;0.30769232;0.30769232	\N	27009
27989	t	0.9835884	0.51302606;0.51302606;0.51302606;0.5841415;0.7374865;0.7374865;0.84891194;0.84891194;0.91828275;0.96770674;0.96770674;0.9835884;0.9835884	\N	27028
28084	t	0.16494846	0.1;0.1;0.12903227;0.12903227;0.16494846;0.16494846	\N	27012
28002	t	0.61244017	0.12903227;0.22857143;0.22857143;0.37209302;0.37209302;0.5423729;0.5423729;0.5423729;0.5423729;0.61244017	\N	27019
28011	t	0.58414149	0.28318584;0.34501347;0.51302606;0.51302606;0.51302606;0.5841415;0.5841415	\N	27025
28018	t	0.93015933	0.38434833;0.38434833;0.38434833;0.38434833;0.45426568;0.62473553;0.62473553;0.76903045;0.76903045;0.8694373;0.8694373;0.8694373;0.8694373;0.93015933	\N	27008
28032	t	0.9876405	0.16494846;0.28318587;0.51302606;0.51302606;0.67814565;0.8489119;0.93743384;0.93743384;0.9677067;0.9876405;0.9876405	\N	27022
28043	t	0.28318584	0.1;0.1;0.1;0.1;0.12903227;0.22857143;0.22857143;0.22857143;0.28318584;0.28318584	\N	27031
28055	t	0.44137928	0.1;0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.37209302;0.37209302;0.44137928;0.44137928	\N	27021
28066	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1;0.1	\N	27023
28072	t	0.44137931	0.1;0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.4413793;0.4413793;0.4413793	\N	26351
28090	t	0.22857144	0.1;0.18181819;0.18181819;0.18181819;0.22857144;0.22857144	\N	27026
28096	t	0.12903227	0.1;0.1;0.1;0.1;0.12903227;0.12903227	\N	27014
28102	t	0.28318584	0.1;0.1;0.1;0.12903227;0.22857143;0.22857143;0.22857143;0.28318584;0.28318584	\N	27030
28115	t	0.99907321	0.91384935;0.9611666;0.98507524;0.99354863;0.9990732	\N	22996
28121	t	0.97935039	0.14285713;0.27999997;0.50909084;0.70758116;0.94425327;0.9793504	\N	23015
28127	t	0.93089408	0.9308941	\N	22996
28133	t	0.35198045	0.35198045	\N	23015
28139	t	0.35198045	0.35198045	\N	23015
28157	t	0.93089402	0.930894	\N	22996
28875	t	0.80769235	0.2;0.4117647;0.80769235	\N	192
28200	t	0.65191782	0.16494846;0.20846906;0.3450135;0.3450135;0.3450135;0.4125705;0.58414143;0.58414143;0.58414143;0.58414143;0.6519178	\N	27013
28211	t	0.3450135	0.1;0.12903227;0.12903227;0.12903227;0.16494846;0.28318587;0.28318587;0.28318587;0.28318587;0.3450135	\N	28187
28221	t	0.37209302	0.1;0.1;0.18181819;0.18181819;0.30769232;0.30769232;0.30769232;0.30769232;0.37209302	\N	28178
28231	t	0.98358834	0.1;0.1;0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.6124402;0.80820835;0.80820835;0.89393276;0.9574008;0.98358834;0.98358834;0.98358834	\N	28196
28246	t	0.99532914	0.1;0.1;0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.6781457;0.8082084;0.9182827;0.9677067;0.9876405;0.99532914;0.99532914	\N	28169
28260	t	0.99895823	0.1;0.22857141;0.5423728;0.82580644;0.9499073;0.9806081;0.99263877;0.9972268;0.99895823	\N	28176
28269	t	0.99532914	0.1;0.18181819;0.37209302;0.61244017;0.8082083;0.9182827;0.9677067;0.9876405;0.99532914;0.99532914	\N	28168
28279	t	0.94399631	0.1;0.22857141;0.22857141;0.4413793;0.7596439;0.92669684;0.92669684;0.92669684;0.9439963;0.9439963	\N	28194
28289	t	0.99921846	0.1;0.1;0.1;0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.4413793;0.6124402;0.80820835;0.94399625;0.9853852;0.9944689;0.99791867;0.99921846	\N	28185
28305	t	0.9876405	0.1;0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.8489119;0.93743384;0.93743384;0.9677067;0.9876405;0.9876405	\N	28177
28317	t	0.37209302	0.1;0.18181819;0.37209302;0.37209302;0.37209302;0.37209302;0.37209302	\N	28167
28324	t	0.25989848	0.16494846;0.16494846;0.20846906;0.20846906;0.25989848;0.25989848	\N	27012
28331	t	0.9835884	0.1;0.1;0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.8489119;0.8489119;0.91828275;0.96770674;0.96770674;0.9835884;0.9835884	\N	28186
28345	t	0.98899865	0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.5423729;0.7032967;0.7032967;0.7032967;0.7596439;0.8634064;0.9439963;0.97823685;0.97823685;0.98899865;0.98899865	\N	28174
28361	t	0.75964391	0.1;0.22857141;0.22857141;0.37209302;0.37209302;0.37209302;0.44137928;0.61244017;0.61244017;0.7596439;0.7596439;0.7596439;0.7596439;0.7596439	\N	28195
28375	t	0.93743384	0.1;0.1;0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.8489119;0.8489119;0.8489119;0.8822357;0.93743384	\N	28183
28387	t	0.16494846	0.12903227;0.12903227;0.12903227;0.16494846;0.16494846;0.16494846	\N	27014
28393	t	0.99912089	0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7596439;0.89393276;0.9574008;0.98358834;0.9937818;0.9976591;0.9991209	\N	28175
28405	t	0.89393282	0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7596439;0.7596439;0.8634064;0.8634064;0.8634064;0.8939328;0.8939328	\N	28192
28417	t	0.99765909	0.1;0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7596439;0.89393276;0.9574008;0.98358834;0.9937818;0.9976591;0.9976591	\N	28165
28433	t	0.12903227	0.1;0.1;0.1;0.1;0.12903227;0.12903227	\N	28198
28439	t	0.98358834	0.1;0.12903227;0.22857143;0.22857143;0.37209302;0.37209302;0.5423729;0.7596439;0.89393276;0.9574008;0.98358834;0.98358834;0.98358834	\N	28193
28452	t	0.73748648	0.1;0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.6781457;0.6781457;0.7374865;0.7374865	\N	28197
28462	t	0.41257051	0.16494846;0.34501347;0.34501347;0.34501347;0.34501347;0.4125705	\N	27005
28468	t	0.16494846	0.1;0.1;0.1;0.12903227;0.12903227;0.16494846	\N	28180
28474	t	0.16494846	0.1;0.1;0.12903227;0.12903227;0.16494846;0.16494846	\N	28179
28480	t	0.22857143	0.1;0.1;0.12903227;0.22857143;0.22857143;0.22857143;0.22857143	\N	28181
28487	t	0.51302606	0.1;0.1;0.1;0.12903227;0.22857143;0.4413793;0.4413793;0.4413793;0.51302606;0.51302606	\N	28199
28499	t	0.97823685	0.1;0.22857141;0.4413793;0.4413793;0.6124402;0.80820835;0.9182827;0.9182827;0.9574008;0.9574008;0.97823685	\N	28166
28510	t	0.99824333	0.1;0.12903227;0.22857143;0.4413793;0.6781457;0.6781457;0.8082084;0.9182827;0.9677067;0.9876405;0.99532914;0.99824333	\N	28189
28522	t	0.99172622	0.1;0.18181819;0.37209302;0.37209302;0.5423729;0.7596439;0.7596439;0.7596439;0.80820835;0.89393276;0.89393276;0.9439963;0.97823685;0.9917262	\N	28184
28536	t	0.98899871	0.1;0.18181819;0.37209302;0.61244017;0.61244017;0.7596439;0.7596439;0.8634064;0.9439963;0.9439963;0.97119147;0.9889987;0.9889987	\N	28171
28549	t	0.73748648	0.37209302;0.44137928;0.44137928;0.44137928;0.51302606;0.67814565;0.67814565;0.67814565;0.7374865;0.7374865	\N	28178
28559	t	0.99532914	0.3450135;0.51302606;0.51302606;0.67814565;0.8489119;0.93743384;0.9755829;0.99070174;0.99070174;0.99532914	\N	28187
28569	t	0.16494846	0.1;0.1;0.12903227;0.12903227;0.16494846;0.16494846	\N	28188
28576	t	0.99824333	0.16494846;0.16494846;0.28318587;0.28318587;0.44137934;0.44137934;0.6124402;0.80820835;0.9182827;0.9677067;0.9876405;0.99532914;0.99824333	\N	28180
28590	t	0.99861145	0.37209302;0.37209302;0.37209302;0.44137928;0.61244017;0.8082083;0.8082083;0.8082083;0.8939327;0.9574008;0.9889988;0.9972268;0.9972268;0.99861145	\N	28167
28604	t	0.88223577	0.12903227;0.12903227;0.12903227;0.16494846;0.28318587;0.51302606;0.7374865;0.84891194;0.84891194;0.84891194;0.88223577;0.88223577	\N	28198
28616	t	0.95232975	0.16494846;0.20846906;0.20846906;0.25989848;0.25989848;0.3189038;0.48358917;0.48358917;0.6519179;0.8331765;0.8331765;0.90899754;0.90899754;0.95232975;0.95232975;0.95232975	\N	23760
28634	t	0.12903228	0.10000002;0.10000002;0.10000002;0.12903228;0.12903228;0.12903228	\N	23766
28640	t	0.98157477	0.16494846;0.34501347;0.58414143;0.789286;0.9089976;0.9638161;0.9638161;0.9815748;0.9815748	\N	28188
28649	t	0.99649274	0.16494846;0.16494846;0.20846906;0.3450135;0.3450135;0.3450135;0.4125705;0.58414143;0.789286;0.789286;0.8822357;0.95232975;0.9815747;0.9815747;0.99070174;0.99649274	\N	28179
28666	t	0.99824333	0.1;0.18181819;0.37209302;0.61244017;0.8082083;0.9182827;0.9677067;0.9876405;0.99532914;0.99824333	\N	28170
28676	t	0.12903227	0.1;0.1;0.1;0.1;0.12903227;0.12903227	\N	28190
28683	t	0.84891194	0.1;0.22857141;0.4413793;0.6781457;0.8489119;0.8489119;0.8489119;0.84891194;0.84891194	\N	28172
28692	t	0.88223577	0.51302606;0.51302606;0.51302606;0.5841415;0.7374865;0.7374865;0.84891194;0.84891194;0.84891194;0.88223577;0.88223577	\N	28199
28703	t	0.41257051	0.22857143;0.22857143;0.22857143;0.28318584;0.28318584;0.34501347;0.34501347;0.4125705;0.4125705;0.4125705	\N	28181
28713	t	0.16494846	0.12903227;0.12903227;0.12903227;0.16494846;0.16494846;0.16494846	\N	28190
28733	t	0.12903227	0.1;0.1;0.1;0.1;0.1;0.12903227	\N	28729
28767	t	0.78399998	0.4;0.6086956;0.784	\N	28766
28806	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	28803
28812	t	0.99702609	0.1;0.1;0.14285715;0.22580646;0.39622644;0.59621453;0.59621453;0.720981;0.8532426;0.92898446;0.96714115;0.9851245;0.9933336;0.9970261	\N	28803
28851	t	0.7612865	0.54851305;0.64568603;0.7612865;0.7612865;0.7612865;0.7612865;0.7612865	\N	28803
28870	t	0.14285715	0.1;0.1;0.1;0.14285715;0.14285715;0.14285715	\N	28801
28877	t	0.61943752	0.6194375;0.6194375;0.6194375;0.6194375;0.6194375;0.6194375	\N	28803
28905	t	0.99768549	0.1;0.1;0.1;0.1;0.14285715;0.22580646;0.39622644;0.59621453;0.7686399;0.8820073;0.94388;0.9742551;0.9883918;0.99480736;0.9976855	\N	28903
28920	t	0.99730074	0.1;0.2;0.35999998;0.55862063;0.74010146;0.8649966;0.9351334;0.97009265;0.9864833;0.99394715;0.99730074	\N	28898
28931	t	0.9965322	0.1;0.1627907;0.3043478;0.49606296;0.6889429;0.8328709;0.9181177;0.9618735;0.9826882;0.99223113;0.9965322	\N	28900
28942	t	0.1	0.1	\N	28897
28943	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	28892
28949	t	0.1	0.1;0.1;0.1;0.1;0.1;0.1	\N	28892
28955	t	0.35198045	0.35198045	\N	23015
28958	t	0.35198045	0.35198045	\N	23015
28977	t	0.73981446	0.50384617;0.73981446	\N	192
28980	t	0.58250231	0.5825023	\N	192
28983	t	0.2	0.2	\N	24334
29018	t	0.2	0.2	\N	22998
29021	t	0.92082667	0.9208267	\N	7162
29024	t	0.35198045	0.35198045;0.35198045	\N	23015
29036	t	0.9965322	0.9965322;0.9965322;0.9965322;0.9965322;0.9965322;0.9965322	\N	28900
29045	t	0.1	0.1	\N	28897
29046	t	0.1	0.1	\N	28897
29047	t	0.1	0.1	\N	28897
29048	t	0.1	0.1	\N	28904
29049	t	0.1	0.1	\N	28897
\.


--
-- Data for Name: testgroup; Type: TABLE DATA; Schema: public; Owner: root
--

COPY testgroup (id, finished, qua, nodeid, workid, testuserid) FROM stdin;
191	f	0.2	80	81	190
13505	f	0.80000001	13202	13485	13239
13506	f	0.80000001	13210	13485	13239
13507	f	0.1	13221	13485	13239
13508	f	0.1	13224	13485	13239
13509	f	0.1	13226	13485	13239
13510	f	0.5	13204	13501	13240
12772	f	0.89999998	4154	4046	6450
12773	f	0.89999998	4155	4046	6450
28176	t	0.1	7819	16722	28173
28169	t	0.1	7821	16722	28164
28168	t	0.1	7820	16722	28164
28194	t	0.1	7819	16722	28191
28196	t	0.1	7821	16722	28191
28177	t	0.1	7820	16722	28173
12774	f	0.89999998	4156	4046	6450
12775	f	0.89999998	4157	4046	6450
12776	f	0.89999998	4158	4046	6450
12777	f	0.89999998	4159	4046	6450
12778	f	0.89999998	4160	4046	6450
12779	f	0.89999998	4161	4046	6450
12780	f	0.89999998	4162	4046	6450
12781	f	0.89999998	4164	4046	6450
12782	f	0.89999998	4165	4046	6450
12783	f	0.89999998	4166	4046	6450
12784	f	0.89999998	4167	4046	6450
12785	f	0.89999998	4168	4046	6450
12786	f	0.89999998	3583	6352	21
12787	f	0.89999998	3610	6352	21
13511	f	0.5	13205	13501	13240
13512	f	0.60000002	13225	13501	13240
13513	f	0.69999999	13219	13502	13241
13514	f	0.1	13220	13502	13241
13515	f	0.60000002	13222	13502	13241
13516	f	0.1	13227	13502	13241
28174	t	0.1	7816	16722	28173
28195	t	0.1	7820	16722	28191
28186	t	0.1	7820	16722	28182
28185	t	0.1	7819	16722	28182
28183	t	0.1	7816	16722	28182
28193	t	0.1	7817	16722	28191
28192	t	0.1	7816	16722	28191
28197	t	0.1	7822	16722	28191
28175	t	0.1	7817	16722	28173
28165	t	0.1	7816	16722	28164
28166	t	0.1	7817	16722	28164
28189	t	0.1	7823	16722	28182
28184	t	0.1	7817	16722	28182
28178	t	0.1	7821	16722	28173
28171	t	0.1	7823	16722	28164
28187	t	0.1	7821	16722	28182
28180	t	0.1	7823	16722	28173
28167	t	0.1	7819	16722	28164
28198	t	0.1	7823	16722	28191
28188	t	0.1	7822	16722	28182
28179	t	0.1	7822	16722	28173
28170	t	0.1	7822	16722	28164
28172	t	0.1	7824	16722	28164
28199	t	0.1	7824	16722	28191
28181	t	0.1	7824	16722	28173
28190	t	0.1	7824	16722	28182
13517	f	0.1	13228	13502	13241
13518	f	0.60000002	13229	13502	13241
13519	f	0.1	13238	13502	13241
13520	f	0.89999998	13200	13503	13242
13521	f	0.69999999	13203	13503	13242
13522	f	0.2	13236	13503	13242
13523	f	0.80000001	13207	13504	13242
13524	f	0.2	13209	13504	13242
13525	f	0.2	13212	13504	13242
13526	f	0.2	13215	13504	13242
13527	f	0.75999999	13217	13504	13242
13528	f	0.2	13233	13504	13242
13529	f	0.80000001	13234	13504	13242
13530	f	0.2	13237	13504	13242
14906	f	0.5	14600	14904	14894
14907	f	0.5	14601	14904	14894
14908	f	0.5	14602	14904	14894
14909	f	0.5	14603	14904	14894
14910	f	0.5	14604	14904	14894
14911	f	0.5	14605	14904	14894
14912	f	0.5	14606	14904	14894
14913	f	0.5	14608	14904	14894
14914	f	0.5	14609	14904	14894
14927	f	0.5	14600	14922	14894
14928	f	0.5	14601	14922	14894
14929	f	0.5	14602	14922	14894
14930	f	0.5	14603	14922	14894
14931	f	0.5	14604	14922	14894
14932	f	0.5	14605	14922	14894
14933	f	0.5	14609	14922	14894
4169	f	0.2	4154	4046	190
4170	f	0.2	4155	4046	190
4171	f	0.30000001	4156	4046	190
4172	f	0.2	4157	4046	190
4173	f	0.2	4158	4046	190
4174	f	0.2	4160	4046	190
4175	f	0.2	4161	4046	190
4176	f	0.2	4162	4046	190
4177	f	0.2	4164	4046	190
4178	f	0.2	4165	4046	190
4179	f	0.2	4166	4046	190
4180	f	0.2	4167	4046	190
4181	f	0.2	4168	4046	190
4334	f	0.1	4290	4294	4245
4335	f	0.1	4291	4294	4245
4333	t	0.1	4282	4294	4245
14948	f	0.5	14600	14947	14895
14949	f	0.5	14603	14947	14895
14950	f	0.5	14609	14947	14895
15482	f	0.1	13557	15401	10972
15483	f	0.1	13558	15401	10972
15484	f	0.1	13560	15401	10972
15485	f	0.1	13561	15401	10972
15486	f	0.1	13562	15401	10972
15487	f	0.1	13563	15401	10972
15488	f	0.1	15394	15402	10972
15489	f	0.1	15395	15402	10972
15490	f	0.1	15396	15402	10972
15491	f	0.1	15397	15402	10972
15492	f	0.1	15398	15402	10972
15493	f	0.1	15399	15402	10972
16731	f	0.1	7816	16722	9214
16732	f	0.1	7817	16722	9214
16733	f	0.1	7819	16722	9214
16734	f	0.1	7820	16722	9214
16735	f	0.1	7821	16722	9214
16736	f	0.1	7822	16722	9214
16737	f	0.1	7823	16722	9214
16738	f	0.1	7824	16722	9214
18185	f	0.1	13557	15401	1804
18186	f	0.1	13558	15401	1804
18187	f	0.1	13560	15401	1804
18188	f	0.1	13561	15401	1804
18189	f	0.1	13562	15401	1804
18190	f	0.1	13563	15401	1804
18191	f	0.1	15394	15402	1804
18192	f	0.1	15395	15402	1804
18193	f	0.1	15396	15402	1804
18194	f	0.1	15397	15402	1804
18195	f	0.1	15398	15402	1804
18196	f	0.1	15399	15402	1804
18197	f	0.1	16517	16582	1804
18198	f	0.1	16518	16582	1804
18199	f	0.1	16519	16582	1804
18200	f	0.1	16520	16582	1804
18201	f	0.1	16521	16582	1804
18202	f	0.1	16903	16583	1804
18203	f	0.1	16904	16583	1804
5868	f	0.5	80	81	5867
5869	f	0.2	4154	4046	5867
5870	f	0.2	4155	4046	5867
5871	f	0.2	4156	4046	5867
5872	f	0.2	4157	4046	5867
5873	f	0.2	4158	4046	5867
5874	f	0.2	4160	4046	5867
5875	f	0.2	4161	4046	5867
5876	f	0.2	4162	4046	5867
5877	f	0.2	4164	4046	5867
5878	f	0.2	4165	4046	5867
5879	f	0.2	4166	4046	5867
5880	f	0.2	4167	4046	5867
5881	f	0.2	4168	4046	5867
7162	f	0.2	6285	7159	7158
10007	f	0.2	6285	7159	9728
10008	f	0.5	6287	7159	9728
10017	f	0.30000001	6285	7159	10016
10018	f	0.30000001	6287	7159	10016
16717	f	0.1	16517	16582	10972
13421	f	0.30000001	13219	13420	9728
13422	f	0.5	13220	13420	9728
13423	f	0.60000002	13222	13420	9728
13424	f	0.2	13227	13420	9728
13425	f	0.1	13228	13420	9728
13426	f	0.30000001	13229	13420	9728
13427	f	0.2	13238	13420	9728
16718	f	0.1	16518	16582	10972
16719	f	0.1	16519	16582	10972
16720	f	0.1	16520	16582	10972
16721	f	0.1	16521	16582	10972
16723	f	0.1	7816	16722	5482
16724	f	0.1	7817	16722	5482
16725	f	0.1	7819	16722	5482
16726	f	0.1	7820	16722	5482
16727	f	0.1	7821	16722	5482
16728	f	0.1	7822	16722	5482
16729	f	0.1	7823	16722	5482
16730	f	0.1	7824	16722	5482
16996	f	0.1	16903	16583	10972
16997	f	0.1	16904	16583	10972
16998	f	0.1	16905	16583	10972
16999	f	0.1	16906	16583	10972
17000	f	0.1	16907	16583	10972
17001	f	0.1	16909	16583	10972
17002	f	0.1	16910	16583	10972
18204	f	0.1	16905	16583	1804
18205	f	0.1	16906	16583	1804
18206	f	0.1	16907	16583	1804
18207	f	0.1	16909	16583	1804
18208	f	0.1	16910	16583	1804
18209	f	0.1	13557	15401	1805
18210	f	0.1	13558	15401	1805
18211	f	0.1	13560	15401	1805
18212	f	0.1	13561	15401	1805
18213	f	0.1	13562	15401	1805
18214	f	0.1	13563	15401	1805
18215	f	0.1	15394	15402	1805
18216	f	0.1	15395	15402	1805
18217	f	0.1	15396	15402	1805
18218	f	0.1	15397	15402	1805
18219	f	0.1	15398	15402	1805
18220	f	0.1	15399	15402	1805
18221	f	0.1	16517	16582	1805
18222	f	0.1	16518	16582	1805
18223	f	0.1	16519	16582	1805
18224	f	0.1	16520	16582	1805
18225	f	0.1	16521	16582	1805
18226	f	0.1	16903	16583	1805
18227	f	0.1	16904	16583	1805
18228	f	0.1	16905	16583	1805
18229	f	0.1	16906	16583	1805
18230	f	0.1	16907	16583	1805
18231	f	0.1	16909	16583	1805
18232	f	0.1	16910	16583	1805
18233	f	0.1	13557	15401	2273
18234	f	0.1	13558	15401	2273
18235	f	0.1	13560	15401	2273
18236	f	0.1	13561	15401	2273
18237	f	0.1	13562	15401	2273
18238	f	0.1	13563	15401	2273
18239	f	0.1	15394	15402	2273
18240	f	0.1	15395	15402	2273
18241	f	0.1	15396	15402	2273
18242	f	0.1	15397	15402	2273
18243	f	0.1	15398	15402	2273
18244	f	0.1	15399	15402	2273
18245	f	0.1	16517	16582	2273
18246	f	0.1	16518	16582	2273
18247	f	0.1	16519	16582	2273
18248	f	0.1	16520	16582	2273
18249	f	0.1	16521	16582	2273
18250	f	0.1	16903	16583	2273
18251	f	0.1	16904	16583	2273
18252	f	0.1	16905	16583	2273
18253	f	0.1	16906	16583	2273
18254	f	0.1	16907	16583	2273
18255	f	0.1	16909	16583	2273
18256	f	0.1	16910	16583	2273
18257	f	0.1	13557	15401	2283
18258	f	0.1	13558	15401	2283
18259	f	0.1	13560	15401	2283
18260	f	0.1	13561	15401	2283
18261	f	0.1	13562	15401	2283
18262	f	0.1	13563	15401	2283
18263	f	0.1	15394	15402	2283
18264	f	0.1	15395	15402	2283
18265	f	0.1	15396	15402	2283
18266	f	0.1	15397	15402	2283
18267	f	0.1	15398	15402	2283
18268	f	0.1	15399	15402	2283
18269	f	0.1	16517	16582	2283
18270	f	0.1	16518	16582	2283
18271	f	0.1	16519	16582	2283
18272	f	0.1	16520	16582	2283
18273	f	0.1	16521	16582	2283
18274	f	0.1	16903	16583	2283
18275	f	0.1	16904	16583	2283
18276	f	0.1	16905	16583	2283
18277	f	0.1	16906	16583	2283
18278	f	0.1	16907	16583	2283
18279	f	0.1	16909	16583	2283
18280	f	0.1	16910	16583	2283
18281	f	0.1	13557	15401	2426
18282	f	0.1	13558	15401	2426
18283	f	0.1	13560	15401	2426
18284	f	0.1	13561	15401	2426
18285	f	0.1	13562	15401	2426
18286	f	0.1	13563	15401	2426
18287	f	0.1	15394	15402	2426
18288	f	0.1	15395	15402	2426
18289	f	0.1	15396	15402	2426
18290	f	0.1	15397	15402	2426
18291	f	0.1	15398	15402	2426
18292	f	0.1	15399	15402	2426
18293	f	0.1	16517	16582	2426
18294	f	0.1	16518	16582	2426
18295	f	0.1	16519	16582	2426
18296	f	0.1	16520	16582	2426
18297	f	0.1	16521	16582	2426
18298	f	0.1	16903	16583	2426
18299	f	0.1	16904	16583	2426
18300	f	0.1	16905	16583	2426
18301	f	0.1	16906	16583	2426
18302	f	0.1	16907	16583	2426
18303	f	0.1	16909	16583	2426
18304	f	0.1	16910	16583	2426
18305	f	0.1	13557	15401	2436
18306	f	0.1	13558	15401	2436
18307	f	0.1	13560	15401	2436
18308	f	0.1	13561	15401	2436
18309	f	0.1	13562	15401	2436
18310	f	0.1	13563	15401	2436
18311	f	0.1	15394	15402	2436
18312	f	0.1	15395	15402	2436
18313	f	0.1	15396	15402	2436
18314	f	0.1	15397	15402	2436
18315	f	0.1	15398	15402	2436
18316	f	0.1	15399	15402	2436
18317	f	0.1	16517	16582	2436
18318	f	0.1	16518	16582	2436
18319	f	0.1	16519	16582	2436
18320	f	0.1	16520	16582	2436
18321	f	0.1	16521	16582	2436
18322	f	0.1	16903	16583	2436
18323	f	0.1	16904	16583	2436
18324	f	0.1	16905	16583	2436
18325	f	0.1	16906	16583	2436
18326	f	0.1	16907	16583	2436
18327	f	0.1	16909	16583	2436
18328	f	0.1	16910	16583	2436
18329	f	0.1	13557	15401	2446
18330	f	0.1	13558	15401	2446
18331	f	0.1	13560	15401	2446
18332	f	0.1	13561	15401	2446
18333	f	0.1	13562	15401	2446
18334	f	0.1	13563	15401	2446
18335	f	0.1	15394	15402	2446
18336	f	0.1	15395	15402	2446
18337	f	0.1	15396	15402	2446
18338	f	0.1	15397	15402	2446
18339	f	0.1	15398	15402	2446
18340	f	0.1	15399	15402	2446
18341	f	0.1	16517	16582	2446
18342	f	0.1	16518	16582	2446
18343	f	0.1	16519	16582	2446
18344	f	0.1	16520	16582	2446
18345	f	0.1	16521	16582	2446
18346	f	0.1	16903	16583	2446
18347	f	0.1	16904	16583	2446
18348	f	0.1	16905	16583	2446
18349	f	0.1	16906	16583	2446
18350	f	0.1	16907	16583	2446
18351	f	0.1	16909	16583	2446
18352	f	0.1	16910	16583	2446
18353	f	0.1	13557	15401	2456
18354	f	0.1	13558	15401	2456
18355	f	0.1	13560	15401	2456
18356	f	0.1	13561	15401	2456
18357	f	0.1	13562	15401	2456
18358	f	0.1	13563	15401	2456
18359	f	0.1	15394	15402	2456
18360	f	0.1	15395	15402	2456
18361	f	0.1	15396	15402	2456
18362	f	0.1	15397	15402	2456
18363	f	0.1	15398	15402	2456
18364	f	0.1	15399	15402	2456
18365	f	0.1	16517	16582	2456
18366	f	0.1	16518	16582	2456
18367	f	0.1	16519	16582	2456
18368	f	0.1	16520	16582	2456
18369	f	0.1	16521	16582	2456
18370	f	0.1	16903	16583	2456
18371	f	0.1	16904	16583	2456
18372	f	0.1	16905	16583	2456
18373	f	0.1	16906	16583	2456
18374	f	0.1	16907	16583	2456
18375	f	0.1	16909	16583	2456
18376	f	0.1	16910	16583	2456
18377	f	0.1	13557	15401	2466
18378	f	0.1	13558	15401	2466
18379	f	0.1	13560	15401	2466
18380	f	0.1	13561	15401	2466
18381	f	0.1	13562	15401	2466
18382	f	0.1	13563	15401	2466
18383	f	0.1	15394	15402	2466
18384	f	0.1	15395	15402	2466
18385	f	0.1	15396	15402	2466
18386	f	0.1	15397	15402	2466
18387	f	0.1	15398	15402	2466
18388	f	0.1	15399	15402	2466
18389	f	0.1	16517	16582	2466
18390	f	0.1	16518	16582	2466
18391	f	0.1	16519	16582	2466
18392	f	0.1	16520	16582	2466
18393	f	0.1	16521	16582	2466
18394	f	0.1	16903	16583	2466
18395	f	0.1	16904	16583	2466
18396	f	0.1	16905	16583	2466
18397	f	0.1	16906	16583	2466
18398	f	0.1	16907	16583	2466
18399	f	0.1	16909	16583	2466
18400	f	0.1	16910	16583	2466
18401	f	0.1	13557	15401	3088
18402	f	0.1	13558	15401	3088
18403	f	0.1	13560	15401	3088
18404	f	0.1	13561	15401	3088
18405	f	0.1	13562	15401	3088
18406	f	0.1	13563	15401	3088
18407	f	0.1	15394	15402	3088
18408	f	0.1	15395	15402	3088
18409	f	0.1	15396	15402	3088
18410	f	0.1	15397	15402	3088
18411	f	0.1	15398	15402	3088
18412	f	0.1	15399	15402	3088
18413	f	0.1	16517	16582	3088
18414	f	0.1	16518	16582	3088
18415	f	0.1	16519	16582	3088
18416	f	0.1	16520	16582	3088
18417	f	0.1	16521	16582	3088
18418	f	0.1	16903	16583	3088
18419	f	0.1	16904	16583	3088
18420	f	0.1	16905	16583	3088
18421	f	0.1	16906	16583	3088
18422	f	0.1	16907	16583	3088
18423	f	0.1	16909	16583	3088
18424	f	0.1	16910	16583	3088
18509	f	0.1	13557	15401	3098
18510	f	0.1	13558	15401	3098
18511	f	0.1	13560	15401	3098
18512	f	0.1	13561	15401	3098
18513	f	0.1	13562	15401	3098
18514	f	0.1	13563	15401	3098
18515	f	0.1	15394	15402	3098
18516	f	0.1	15395	15402	3098
18517	f	0.1	15396	15402	3098
18518	f	0.1	15397	15402	3098
18519	f	0.1	15398	15402	3098
18520	f	0.1	15399	15402	3098
18521	f	0.1	16517	16582	3098
18522	f	0.1	16518	16582	3098
18523	f	0.1	16519	16582	3098
18524	f	0.1	16520	16582	3098
18525	f	0.1	16521	16582	3098
18526	f	0.1	16903	16583	3098
18527	f	0.1	16904	16583	3098
18528	f	0.1	16905	16583	3098
18529	f	0.1	16906	16583	3098
18530	f	0.1	16907	16583	3098
18531	f	0.1	16909	16583	3098
18532	f	0.1	16910	16583	3098
19050	f	0.1	13557	15401	3108
19051	f	0.1	13558	15401	3108
19052	f	0.1	13560	15401	3108
19053	f	0.1	13561	15401	3108
19054	f	0.1	13562	15401	3108
19055	f	0.1	13563	15401	3108
19056	f	0.1	15394	15402	3108
19057	f	0.1	15395	15402	3108
19058	f	0.1	15396	15402	3108
19059	f	0.1	15397	15402	3108
19060	f	0.1	15398	15402	3108
19061	f	0.1	15399	15402	3108
19062	f	0.1	16517	16582	3108
19063	f	0.1	16518	16582	3108
19064	f	0.1	16519	16582	3108
19065	f	0.1	16520	16582	3108
19066	f	0.1	16521	16582	3108
19067	f	0.1	16903	16583	3108
19068	f	0.1	16904	16583	3108
19069	f	0.1	16905	16583	3108
19070	f	0.1	16906	16583	3108
19071	f	0.1	16907	16583	3108
19072	f	0.1	16909	16583	3108
19073	f	0.1	16910	16583	3108
19074	f	0.1	13557	15401	10957
19075	f	0.1	13558	15401	10957
19076	f	0.1	13560	15401	10957
19077	f	0.1	13561	15401	10957
19078	f	0.1	13562	15401	10957
19079	f	0.1	13563	15401	10957
19080	f	0.1	15394	15402	10957
19081	f	0.1	15395	15402	10957
19082	f	0.1	15396	15402	10957
19083	f	0.1	15397	15402	10957
19084	f	0.1	15398	15402	10957
19085	f	0.1	15399	15402	10957
19086	f	0.1	16517	16582	10957
19087	f	0.1	16518	16582	10957
19088	f	0.1	16519	16582	10957
19089	f	0.1	16520	16582	10957
19090	f	0.1	16521	16582	10957
19091	f	0.1	16903	16583	10957
19092	f	0.1	16904	16583	10957
19093	f	0.1	16905	16583	10957
19094	f	0.1	16906	16583	10957
19095	f	0.1	16907	16583	10957
19096	f	0.1	16909	16583	10957
19097	f	0.1	16910	16583	10957
19098	f	0.1	13557	15401	10958
19099	f	0.1	13558	15401	10958
19100	f	0.1	13560	15401	10958
19101	f	0.1	13561	15401	10958
19102	f	0.1	13562	15401	10958
19103	f	0.1	13563	15401	10958
19104	f	0.1	15394	15402	10958
19105	f	0.1	15395	15402	10958
19106	f	0.1	15396	15402	10958
19107	f	0.1	15397	15402	10958
19108	f	0.1	15398	15402	10958
19109	f	0.1	15399	15402	10958
19110	f	0.1	16517	16582	10958
19111	f	0.1	16518	16582	10958
19112	f	0.1	16519	16582	10958
19113	f	0.1	16520	16582	10958
19114	f	0.1	16521	16582	10958
19115	f	0.1	16903	16583	10958
19116	f	0.1	16904	16583	10958
19117	f	0.1	16905	16583	10958
19118	f	0.1	16906	16583	10958
19119	f	0.1	16907	16583	10958
19120	f	0.1	16909	16583	10958
19121	f	0.1	16910	16583	10958
19122	f	0.1	13557	15401	10959
19123	f	0.1	13558	15401	10959
19124	f	0.1	13560	15401	10959
19125	f	0.1	13561	15401	10959
19126	f	0.1	13562	15401	10959
19127	f	0.1	13563	15401	10959
19128	f	0.1	16517	16582	10959
19129	f	0.1	16518	16582	10959
19130	f	0.1	16519	16582	10959
19131	f	0.1	16520	16582	10959
19132	f	0.1	16521	16582	10959
19133	f	0.1	15394	15402	10959
19134	f	0.1	15395	15402	10959
19135	f	0.1	15396	15402	10959
19136	f	0.1	15397	15402	10959
19137	f	0.1	15398	15402	10959
19138	f	0.1	15399	15402	10959
19139	f	0.1	16903	16583	10959
19140	f	0.1	16904	16583	10959
19141	f	0.1	16905	16583	10959
19142	f	0.1	16906	16583	10959
19143	f	0.1	16907	16583	10959
19144	f	0.1	16909	16583	10959
19145	f	0.1	16910	16583	10959
19146	f	0.1	13557	15401	10960
19147	f	0.1	13558	15401	10960
19148	f	0.1	13560	15401	10960
19149	f	0.1	13561	15401	10960
19150	f	0.1	13562	15401	10960
19151	f	0.1	13563	15401	10960
19152	f	0.1	15394	15402	10960
19153	f	0.1	15395	15402	10960
19154	f	0.1	15396	15402	10960
19155	f	0.1	15397	15402	10960
19156	f	0.1	15398	15402	10960
19157	f	0.1	15399	15402	10960
19158	f	0.1	16517	16582	10960
19159	f	0.1	16518	16582	10960
19160	f	0.1	16519	16582	10960
19161	f	0.1	16520	16582	10960
19162	f	0.1	16521	16582	10960
19163	f	0.1	16903	16583	10960
19164	f	0.1	16904	16583	10960
19165	f	0.1	16905	16583	10960
19166	f	0.1	16906	16583	10960
19167	f	0.1	16907	16583	10960
19168	f	0.1	16909	16583	10960
19169	f	0.1	16910	16583	10960
19170	f	0.1	13557	15401	10961
19171	f	0.1	13558	15401	10961
19172	f	0.1	13560	15401	10961
19173	f	0.1	13561	15401	10961
19174	f	0.1	13562	15401	10961
19175	f	0.1	13563	15401	10961
19176	f	0.1	15394	15402	10961
19177	f	0.1	15395	15402	10961
19178	f	0.1	15396	15402	10961
19179	f	0.1	15397	15402	10961
19180	f	0.1	15398	15402	10961
19181	f	0.1	15399	15402	10961
19182	f	0.1	16517	16582	10961
19183	f	0.1	16518	16582	10961
19184	f	0.1	16519	16582	10961
19185	f	0.1	16520	16582	10961
19186	f	0.1	16521	16582	10961
19187	f	0.1	16903	16583	10961
19188	f	0.1	16904	16583	10961
19189	f	0.1	16905	16583	10961
19190	f	0.1	16906	16583	10961
19191	f	0.1	16907	16583	10961
19192	f	0.1	16909	16583	10961
19193	f	0.1	16910	16583	10961
19194	f	0.1	13557	15401	10962
19195	f	0.1	13558	15401	10962
19196	f	0.1	13560	15401	10962
19197	f	0.1	13561	15401	10962
19198	f	0.1	13562	15401	10962
19199	f	0.1	13563	15401	10962
19200	f	0.1	15394	15402	10962
19201	f	0.1	15395	15402	10962
19202	f	0.1	15396	15402	10962
19203	f	0.1	15397	15402	10962
19204	f	0.1	15398	15402	10962
19205	f	0.1	15399	15402	10962
19206	f	0.1	16517	16582	10962
19207	f	0.1	16518	16582	10962
19208	f	0.1	16519	16582	10962
19209	f	0.1	16520	16582	10962
19210	f	0.1	16521	16582	10962
19211	f	0.1	16903	16583	10962
19212	f	0.1	16904	16583	10962
19213	f	0.1	16905	16583	10962
19214	f	0.1	16906	16583	10962
19215	f	0.1	16907	16583	10962
19216	f	0.1	16909	16583	10962
19217	f	0.1	16910	16583	10962
26353	t	0.1	7819	16722	26350
26355	t	0.1	7821	16722	26350
26354	t	0.1	7820	16722	26350
26351	f	0.1	7816	16722	26350
26352	f	0.1	7817	16722	26350
26356	f	0.1	7822	16722	26350
26357	f	0.1	7823	16722	26350
26358	f	0.1	7824	16722	26350
27007	t	0.1	7816	16722	27006
27011	t	0.1	7821	16722	27006
27010	t	0.1	7820	16722	27006
27016	t	0.1	7816	16722	27015
27018	t	0.1	7819	16722	27015
27029	t	0.1	7821	16722	27024
26410	t	0.1	7819	16722	26407
26998	t	0.1	7816	16722	26997
26414	t	0.1	7823	16722	26407
26999	t	0.1	7817	16722	26997
27004	t	0.1	7823	16722	26997
27003	t	0.1	7822	16722	26997
27017	t	0.1	7817	16722	27015
27020	t	0.1	7821	16722	27015
27027	t	0.1	7819	16722	27024
27028	t	0.1	7820	16722	27024
27019	t	0.1	7820	16722	27015
27025	t	0.1	7816	16722	27024
27008	t	0.1	7817	16722	27006
27009	t	0.1	7819	16722	27006
27022	t	0.1	7823	16722	27015
27013	t	0.1	7823	16722	27006
25539	f	0.2	25523	25534	25220
25540	f	0.2	25524	25534	25220
25541	f	0.2	25525	25534	25220
25542	f	0.2	25526	25534	25220
25543	f	0.2	25527	25534	25220
25544	f	0.2	25528	25534	25220
25545	f	0.2	25529	25534	25220
23765	t	0.1	7823	16722	23758
23769	t	0.1	7817	16722	23767
23764	t	0.1	7822	16722	23758
23770	t	0.1	7819	16722	23767
23771	t	0.1	7820	16722	23767
22686	f	0.1	7816	16722	22685
22687	f	0.1	7817	16722	22685
22688	f	0.1	7819	16722	22685
22689	f	0.1	7820	16722	22685
22691	f	0.1	7822	16722	22685
22692	f	0.1	7823	16722	22685
22693	f	0.1	7824	16722	22685
26408	f	0.1	7816	16722	26407
26409	f	0.1	7817	16722	26407
26411	f	0.1	7820	16722	26407
26412	f	0.1	7821	16722	26407
26413	f	0.1	7822	16722	26407
26415	f	0.1	7824	16722	26407
22722	f	0.1	7816	16722	22721
22723	f	0.1	7817	16722	22721
22724	f	0.1	7819	16722	22721
22725	f	0.1	7820	16722	22721
22726	f	0.1	7821	16722	22721
22727	f	0.1	7822	16722	22721
22728	f	0.1	7823	16722	22721
22729	f	0.1	7824	16722	22721
27021	f	0.1	7822	16722	27015
27023	f	0.1	7824	16722	27015
27026	f	0.1	7817	16722	27024
27030	f	0.1	7822	16722	27024
27031	f	0.1	7823	16722	27024
27032	f	0.1	7824	16722	27024
27002	t	0.1	7821	16722	26997
27001	t	0.1	7820	16722	26997
27000	t	0.1	7819	16722	26997
27012	t	0.1	7822	16722	27006
27014	t	0.1	7824	16722	27006
27005	t	0.1	7824	16722	26997
23760	t	0.1	7817	16722	23758
23766	t	0.1	7824	16722	23758
22995	f	0.2	6284	22994	7158
22996	f	0.2	6285	22994	7158
22997	f	0.2	6286	22994	7158
22998	f	0.2	6287	22994	7158
23015	f	0.1	6285	23014	7158
192	f	0.2	6287	7159	7158
22690	t	0.1	7821	16722	22685
23763	t	0.1	7821	16722	23758
23772	t	0.1	7821	16722	23767
23761	t	0.1	7819	16722	23758
23762	t	0.1	7820	16722	23758
23768	t	0.1	7816	16722	23767
23759	t	0.1	7816	16722	23758
24332	f	0.2	6284	24331	7158
24333	f	0.2	6285	24331	7158
24334	f	0.2	6286	24331	7158
24335	f	0.2	6287	24331	7158
23782	t	0.1	7821	16722	23777
23791	t	0.1	7821	16722	23786
23780	t	0.1	7819	16722	23777
23781	t	0.1	7820	16722	23777
23778	t	0.1	7816	16722	23777
23787	t	0.1	7816	16722	23786
27689	f	0.2	25860	25867	6939
27690	f	0.2	25861	25867	6939
27691	f	0.2	25862	25867	6939
27692	f	0.2	25863	25867	6939
27693	f	0.2	25864	25867	6939
27694	f	0.2	25865	25867	6939
27695	f	0.2	25866	25867	6939
23779	t	0.1	7817	16722	23777
23774	t	0.1	7823	16722	23767
23784	t	0.1	7823	16722	23777
23783	t	0.1	7822	16722	23777
23773	t	0.1	7822	16722	23767
23788	t	0.1	7817	16722	23786
28725	f	0.1	7816	28724	5482
28726	f	0.1	7817	28724	5482
28727	f	0.1	7819	28724	5482
28728	f	0.1	7820	28724	5482
28729	f	0.1	7821	28724	5482
28730	f	0.1	7822	28724	5482
25868	f	0.2	25860	25867	20089
25869	f	0.2	25861	25867	20089
25870	f	0.2	25862	25867	20089
25871	f	0.2	25863	25867	20089
25872	f	0.2	25864	25867	20089
25873	f	0.2	25865	25867	20089
25874	f	0.2	25866	25867	20089
23789	t	0.1	7819	16722	23786
23790	t	0.1	7820	16722	23786
23785	t	0.1	7824	16722	23777
23793	t	0.1	7823	16722	23786
23792	t	0.1	7822	16722	23786
23794	t	0.1	7824	16722	23786
23775	t	0.1	7824	16722	23767
28731	f	0.1	7823	28724	5482
28765	f	0.2	6284	28764	7158
28766	f	0.40000001	6285	28764	7158
28779	f	0.2	28796	28743	28843
28896	f	0.1	28789	28895	28749
28801	f	0.1	28791	28743	28749
28802	f	0.1	28793	28743	28749
28803	f	0.1	28796	28743	28749
28885	f	0.1	28789	28884	28749
28886	f	0.1	28790	28884	28749
28887	f	0.1	28791	28884	28749
28888	f	0.1	28792	28884	28749
28889	f	0.1	28793	28884	28749
28890	f	0.1	28794	28884	28749
28891	f	0.1	28795	28884	28749
28892	f	0.1	28796	28884	28749
28893	f	0.1	28797	28884	28749
28897	f	0.1	28790	28895	28749
28898	f	0.1	28791	28895	28749
28899	f	0.1	28792	28895	28749
28900	f	0.1	28793	28895	28749
28901	f	0.1	28794	28895	28749
28902	f	0.1	28795	28895	28749
28903	f	0.1	28796	28895	28749
28904	f	0.1	28797	28895	28749
\.


--
-- Data for Name: testquestionresponse; Type: TABLE DATA; Schema: public; Owner: root
--

COPY testquestionresponse (testid, questionresponseid, testindexcol) FROM stdin;
194	195	0
16818	16819	0
16818	16820	1
16818	16821	2
16818	16822	3
16818	16823	4
16818	16824	5
16825	16826	0
16825	16827	1
16825	16828	2
16825	16829	3
19676	19677	0
19676	19678	1
19676	19679	2
19676	19680	3
19729	19730	0
19729	19731	1
19729	19732	2
19729	19733	3
19792	19793	0
19792	19794	1
19792	19795	2
19792	19796	3
19792	19797	4
19859	19860	0
19859	19861	1
19859	19862	2
19859	19863	3
19859	19864	4
19859	19865	5
19859	19866	6
19859	19867	7
19935	19936	0
19935	19937	1
19935	19938	2
19935	19939	3
19935	19940	4
19935	19941	5
19935	19942	6
20016	20017	0
20016	20018	1
20016	20019	2
20016	20020	3
20016	20021	4
20016	20022	5
20016	20023	6
20016	20024	7
20016	20025	8
20452	20453	0
20452	20454	1
20452	20455	2
20452	20456	3
20452	20457	4
20452	20458	5
20537	20538	0
20537	20539	1
20537	20540	2
20537	20541	3
20537	20542	4
20537	20543	5
20537	20544	6
20537	20545	7
20537	20546	8
20537	20547	9
20537	20548	10
20629	20630	0
20629	20631	1
20629	20632	2
20629	20633	3
20629	20634	4
20629	20635	5
20629	20636	6
20629	20637	7
20629	20638	8
20629	20639	9
20629	20640	10
20629	20641	11
20629	20642	12
20629	20643	13
20718	20719	0
20718	20720	1
20718	20721	2
20718	20722	3
20718	20723	4
20793	20794	0
20793	20795	1
20793	20796	2
20835	20836	0
20835	20837	1
20835	20838	2
20835	20839	3
20835	20840	4
20904	20905	0
20904	20906	1
20904	20907	2
20904	20908	3
20909	20910	0
20909	20911	1
20909	20912	2
20909	20913	3
21215	21216	0
21215	21217	1
21215	21218	2
21219	21220	0
21219	21221	1
21219	21222	2
21219	21223	3
21219	21224	4
21219	21225	5
21219	21226	6
21219	21227	7
21274	21275	0
21274	21276	1
21274	21277	2
21274	21278	3
21274	21279	4
21280	21281	0
21280	21282	1
21280	21283	2
21280	21284	3
21280	21285	4
21280	21286	5
21280	21287	6
21280	21288	7
21289	21290	0
21289	21291	1
21289	21292	2
21289	21293	3
21289	21294	4
21289	21295	5
21289	21296	6
21289	21297	7
21335	21336	0
21335	21337	1
21335	21338	2
21335	21339	3
21335	21340	4
21392	21393	0
21392	21394	1
21392	21395	2
21392	21396	3
21392	21397	4
21392	21398	5
21421	21422	0
21421	21423	1
21421	21424	2
21421	21425	3
21421	21426	4
21447	21448	0
21447	21449	1
21447	21450	2
21447	21451	3
21447	21452	4
21562	21563	0
21562	21564	1
21562	21565	2
21562	21566	3
21562	21567	4
21596	21597	0
21596	21598	1
21596	21599	2
21596	21600	3
21596	21601	4
21596	21602	5
21603	21606	2
21603	21607	3
21603	21608	4
21603	21609	5
21603	21610	6
21603	21611	7
21603	21612	8
21613	21614	0
21613	21615	1
21613	21616	2
21613	21617	3
21613	21618	4
21613	21619	5
21613	21620	6
21613	21621	7
21613	21622	8
18558	18559	0
18558	18560	1
18558	18561	2
18558	18562	3
18563	18564	0
18563	18565	1
18563	18566	2
18563	18567	3
18563	18568	4
18563	18569	5
18563	18570	6
18563	18571	7
18572	18573	0
18572	18574	1
18572	18575	2
18572	18576	3
18572	18577	4
18578	18579	0
18578	18580	1
18578	18581	2
18578	18582	3
18578	18583	4
18584	18585	0
18584	18586	1
18584	18587	2
18584	18588	3
18584	18589	4
18584	18590	5
18591	18592	0
18591	18593	1
18591	18594	2
18591	18595	3
18591	18596	4
18591	18597	5
18591	18598	6
18591	18599	7
18591	18600	8
18601	18602	0
18601	18603	1
18601	18604	2
18601	18605	3
18601	18606	4
18601	18607	5
18601	18608	6
18601	18609	7
18601	18610	8
18612	18613	0
18612	18614	1
18612	18615	2
18612	18616	3
18612	18617	4
18612	18618	5
18619	18620	0
18619	18621	1
18619	18622	2
18619	18623	3
18619	18624	4
18619	18625	5
18619	18626	6
18619	18627	7
18619	18628	8
18619	18629	9
19685	19686	0
19685	19687	1
19685	19688	2
19740	19741	0
19740	19742	1
19740	19743	2
19799	19800	0
19799	19801	1
19799	19802	2
19799	19803	3
19799	19804	4
19799	19805	5
19799	19806	6
19868	19869	0
19868	19870	1
19868	19871	2
19868	19872	3
19868	19873	4
19874	19875	0
19874	19876	1
19874	19877	2
19874	19878	3
19874	19879	4
19944	19945	0
19944	19946	1
19944	19947	2
19944	19948	3
19944	19949	4
19944	19950	5
19944	19951	6
19944	19952	7
19944	19953	8
20026	20027	0
20026	20028	1
20026	20029	2
20026	20030	3
20549	20550	0
20549	20551	1
20549	20552	2
20549	20553	3
20549	20554	4
20555	20556	0
20555	20557	1
20555	20558	2
20555	20559	3
20555	20560	4
20555	20561	5
20555	20562	6
20563	20564	0
20563	20565	1
20563	20566	2
20563	20567	3
20563	20568	4
20563	20569	5
20563	20570	6
20563	20571	7
20563	20572	8
20563	20573	9
20563	20574	10
20644	20645	0
20644	20646	1
20644	20647	2
20644	20648	3
20644	20649	4
20644	20650	5
20644	20651	6
20644	20652	7
20644	20653	8
20644	20654	9
20644	20655	10
20644	20656	11
20732	20733	0
20732	20734	1
20732	20735	2
20732	20736	3
20732	20737	4
20797	20798	0
20797	20799	1
20797	20800	2
20797	20801	3
20845	20846	0
20845	20847	1
20845	20848	2
20849	20850	0
20849	20851	1
20849	20852	2
20849	20853	3
20849	20854	4
20849	20855	5
20856	20857	0
20856	20858	1
20856	20859	2
20856	20860	3
21055	21056	0
21055	21057	1
21055	21058	2
21055	21059	3
21055	21060	4
21061	21062	0
21061	21063	1
21061	21064	2
21061	21065	3
21061	21066	4
21061	21067	5
21068	21069	0
21068	21070	1
21068	21071	2
21068	21072	3
21068	21073	4
21068	21074	5
21075	21076	0
21075	21077	1
21075	21078	2
21075	21079	3
21075	21080	4
21081	21082	0
21081	21083	1
21081	21084	2
18630	18631	0
18630	18632	1
18630	18633	2
18630	18634	3
18630	18635	4
18630	18636	5
18637	18638	0
18637	18639	1
18637	18640	2
18637	18641	3
18637	18642	4
18637	18643	5
18637	18644	6
18637	18645	7
18637	18646	8
18647	18648	0
18647	18649	1
18647	18650	2
18647	18651	3
18647	18652	4
18647	18653	5
18647	18654	6
18647	18655	7
18647	18656	8
18647	18657	9
18647	18658	10
18647	18659	11
18647	18660	12
18661	18662	0
18661	18663	1
18661	18664	2
18661	18665	3
18661	18666	4
18661	18667	5
18661	18668	6
18661	18669	7
18661	18670	8
18661	18671	9
18661	18672	10
18673	18674	0
18673	18675	1
18673	18676	2
18673	18677	3
18673	18678	4
18673	18679	5
18673	18680	6
18681	18682	0
18681	18683	1
18681	18684	2
18681	18685	3
18681	18686	4
18681	18687	5
18681	18688	6
18681	18689	7
18681	18690	8
18681	18691	9
18692	18693	0
18692	18694	1
18692	18695	2
18692	18696	3
18692	18697	4
18692	18698	5
18692	18699	6
18692	18700	7
18692	18701	8
18692	18702	9
18703	18704	0
18703	18705	1
18703	18706	2
18703	18707	3
18703	18708	4
18703	18709	5
18703	18710	6
18703	18711	7
18703	18712	8
18703	18713	9
18703	18714	10
19696	19697	0
19696	19698	1
19696	19699	2
19744	19745	0
19744	19746	1
19744	19747	2
19744	19748	3
19744	19749	4
19807	19808	0
19807	19809	1
19807	19810	2
19807	19811	3
19807	19812	4
19807	19813	5
19807	19814	6
19807	19815	7
19816	19817	0
19816	19818	1
19816	19819	2
19816	19820	3
19816	19821	4
19816	19822	5
19816	19823	6
19816	19824	7
19816	19825	8
19816	19826	9
19880	19881	0
19880	19882	1
19880	19883	2
19880	19884	3
19880	19885	4
19880	19886	5
19880	19887	6
19880	19888	7
19889	19890	0
19889	19891	1
19889	19892	2
19889	19893	3
19889	19894	4
19889	19895	5
19889	19896	6
19889	19897	7
19889	19898	8
19889	19899	9
19954	19955	0
19954	19956	1
19954	19957	2
19954	19958	3
19954	19959	4
19954	19960	5
20031	20032	0
20031	20033	1
20031	20034	2
20031	20035	3
20031	20036	4
20031	20037	5
20031	20038	6
20031	20039	7
20031	20040	8
20031	20041	9
20031	20042	10
20031	20043	11
20051	20052	0
20051	20053	1
20051	20054	2
20051	20055	3
20051	20056	4
20051	20057	5
20051	20058	6
20051	20059	7
20051	20060	8
20061	20062	0
20061	20063	1
20061	20064	2
20061	20065	3
20061	20066	4
20061	20067	5
20575	20576	0
20575	20577	1
20575	20578	2
20575	20579	3
20575	20580	4
20575	20581	5
20575	20582	6
20575	20583	7
20575	20584	8
20575	20585	9
20657	20658	0
20657	20659	1
20657	20660	2
20657	20661	3
20657	20662	4
20657	20663	5
20657	20664	6
20657	20665	7
20657	20666	8
20657	20667	9
20738	20739	0
20738	20740	1
20738	20741	2
20738	20742	3
20738	20743	4
20806	20807	0
20806	20808	1
20806	20809	2
15494	15495	0
15494	15496	1
15494	15497	2
15494	15498	3
13531	13532	0
13533	13534	0
13535	13536	0
13537	13538	0
13540	13541	0
13542	13543	0
13544	13545	0
13549	13550	0
13551	13552	0
15499	15500	0
15499	15501	1
15499	15502	2
15499	15503	3
15499	15504	4
15505	15506	0
15505	15507	1
15505	15508	2
15505	15509	3
15505	15510	4
15505	15511	5
15512	15513	0
15512	15514	1
15512	15515	2
15512	15516	3
15512	15517	4
15512	15518	5
15519	15520	0
15519	15521	1
15519	15522	2
15519	15523	3
15519	15524	4
15519	15525	5
15526	15527	0
15526	15528	1
15526	15529	2
15526	15530	3
15526	15531	4
15526	15532	5
15526	15533	6
15536	15537	0
15536	15538	1
15539	15540	0
15541	15542	0
19658	19659	0
19658	19660	1
19658	19661	2
19658	19662	3
19703	19704	0
19703	19705	1
19703	19706	2
19703	19707	3
19703	19708	4
19750	19751	0
19750	19752	1
19750	19753	2
19750	19754	3
19750	19755	4
19750	19756	5
19827	19828	0
19827	19829	1
19827	19830	2
19827	19831	3
19827	19832	4
19827	19833	5
19827	19834	6
19901	19902	0
19901	19903	1
19901	19904	2
19901	19905	3
19901	19906	4
19963	19964	0
19963	19965	1
19963	19966	2
19963	19967	3
19963	19968	4
19963	19969	5
20068	20069	0
20068	20070	1
20068	20071	2
20068	20072	3
20068	20073	4
20068	20074	5
20068	20075	6
20068	20076	7
20068	20077	8
20078	20079	0
20078	20080	1
20078	20081	2
20078	20082	3
20078	20083	4
20078	20084	5
20078	20085	6
20078	20086	7
20078	20087	8
20078	20088	9
20496	20497	0
20496	20498	1
20496	20499	2
20586	20587	0
20586	20588	1
20586	20589	2
20586	20590	3
20586	20591	4
20586	20592	5
20586	20593	6
20586	20594	7
20586	20595	8
20586	20596	9
20586	20597	10
20586	20598	11
20668	20669	0
20668	20670	1
20668	20671	2
20668	20672	3
20668	20673	4
20744	20745	0
20744	20746	1
20744	20747	2
20744	20748	3
20744	20749	4
20744	20750	5
20806	20810	3
20806	20811	4
20806	20812	5
20865	20866	0
20865	20867	1
20865	20868	2
20865	20869	3
20865	20870	4
20865	20871	5
20872	20873	0
20872	20874	1
20872	20875	2
21085	21086	0
21085	21087	1
21085	21088	2
21089	21090	0
21089	21091	1
21089	21092	2
21089	21093	3
21089	21094	4
21228	21229	0
21228	21230	1
21228	21231	2
21228	21232	3
21228	21233	4
21234	21235	0
21234	21236	1
21234	21237	2
21234	21238	3
21234	21239	4
21298	21299	0
21298	21300	1
21298	21301	2
21298	21302	3
21298	21303	4
21298	21304	5
21298	21305	6
21298	21306	7
21341	21342	0
21341	21343	1
21341	21344	2
21341	21345	3
21341	21346	4
21347	21348	0
21347	21349	1
21347	21350	2
21347	21351	3
21347	21352	4
21347	21353	5
21354	21355	0
21354	21356	1
21354	21357	2
21354	21358	3
21354	21359	4
21354	21360	5
21354	21361	6
21399	21400	0
13554	13555	0
16167	16168	0
16167	16169	1
16167	16170	2
16167	16171	3
16167	16172	4
16167	16173	5
16167	16174	6
16167	16175	7
19663	19664	0
19712	19713	0
19759	19760	0
19759	19761	1
19759	19762	2
19759	19763	3
19759	19764	4
19835	19836	0
19835	19837	1
19835	19838	2
19835	19839	3
19835	19840	4
19835	19841	5
19835	19842	6
19910	19911	0
19910	19912	1
19910	19913	2
19910	19914	3
19910	19915	4
19910	19916	5
19910	19917	6
19910	19918	7
19974	19975	0
19974	19976	1
19974	19977	2
19974	19978	3
19974	19979	4
19974	19980	5
19974	19981	6
19974	19982	7
19974	19983	8
19974	19984	9
19974	19985	10
19974	19986	11
19974	19987	12
19988	19989	0
19988	19990	1
19988	19991	2
19988	19992	3
19988	19993	4
20211	20212	0
20211	20213	1
20211	20214	2
20211	20215	3
20211	20216	4
20217	20218	0
20217	20219	1
20217	20220	2
20217	20221	3
20217	20222	4
20223	20224	0
20223	20225	1
20223	20226	2
20223	20227	3
20228	20229	0
20228	20230	1
20228	20231	2
20228	20232	3
20228	20233	4
20234	20235	0
20234	20236	1
20234	20237	2
20238	20239	0
20238	20240	1
20238	20241	2
20238	20242	3
20243	20244	0
20243	20245	1
20243	20246	2
20243	20247	3
20500	20501	0
20500	20502	1
20500	20503	2
20500	20504	3
20500	20505	4
20500	20506	5
20500	20507	6
20500	20508	7
20500	20509	8
20600	20601	0
20600	20602	1
20600	20603	2
20600	20604	3
20600	20605	4
20600	20606	5
20600	20607	6
20600	20608	7
20600	20609	8
20600	20610	9
20600	20611	10
20674	20675	0
20674	20676	1
20674	20677	2
20674	20678	3
20674	20679	4
20674	20680	5
20674	20681	6
20674	20682	7
20674	20683	8
20674	20684	9
20674	20685	10
20674	20686	11
20674	20687	12
20755	20756	0
20755	20757	1
20755	20758	2
20755	20759	3
20755	20760	4
20813	20814	0
20813	20815	1
20813	20816	2
20813	20817	3
20813	20818	4
20813	20819	5
20880	20881	0
20880	20882	1
20880	20883	2
21187	21188	0
21187	21189	1
21187	21190	2
21187	21191	3
21192	21193	0
21192	21194	1
21192	21195	2
21192	21196	3
21240	21241	0
21240	21242	1
21240	21243	2
21240	21244	3
21240	21245	4
21246	21247	0
21246	21248	1
21246	21249	2
21246	21250	3
21246	21251	4
21246	21252	5
21246	21253	6
21254	21255	0
21254	21256	1
21254	21257	2
21254	21258	3
21254	21259	4
21307	21308	0
21307	21309	1
21307	21310	2
21307	21311	3
21307	21312	4
21307	21313	5
21307	21314	6
21307	21315	7
21307	21316	8
21362	21363	0
21362	21364	1
21362	21365	2
21362	21366	3
21362	21367	4
21368	21369	0
21368	21370	1
21368	21371	2
21368	21372	3
21368	21373	4
21368	21374	5
21368	21375	6
21399	21401	1
21399	21402	2
21399	21403	3
21399	21404	4
21399	21405	5
21399	21406	6
21427	21428	0
21427	21429	1
21427	21430	2
21427	21431	3
21427	21432	4
21427	21433	5
21427	21434	6
16741	16742	0
16741	16743	1
14960	14961	0
16741	16744	2
16741	16745	3
16741	16746	4
16741	16747	5
16741	16748	6
16741	16749	7
16741	16750	8
16741	16751	9
16741	16752	10
16741	16753	11
19665	19666	0
19665	19667	1
19665	19668	2
19665	19669	3
19715	19716	0
19715	19717	1
19715	19718	2
19715	19719	3
19715	19720	4
19768	19769	0
19768	19770	1
19768	19771	2
19768	19772	3
19768	19773	4
19768	19774	5
19768	19775	6
19776	19777	0
19776	19778	1
19776	19779	2
19776	19780	3
19776	19781	4
19844	19845	0
19844	19846	1
19844	19847	2
19844	19848	3
19844	19849	4
19920	19921	0
19920	19922	1
19920	19923	2
19920	19924	3
19920	19925	4
19920	19926	5
19920	19927	6
19995	19996	0
19995	19997	1
19995	19998	2
19995	19999	3
19995	20000	4
19995	20001	5
20510	20511	0
20510	20512	1
20510	20513	2
20510	20514	3
20510	20515	4
20510	20516	5
20510	20517	6
20510	20518	7
20510	20519	8
20510	20520	9
20510	20521	10
20510	20522	11
20612	20613	0
20612	20614	1
20612	20615	2
20612	20616	3
20612	20617	4
20612	20618	5
20612	20619	6
20612	20620	7
20612	20621	8
20688	20689	0
20688	20690	1
20688	20691	2
20688	20692	3
20688	20693	4
20688	20694	5
20688	20695	6
20688	20696	7
20688	20697	8
20688	20698	9
20699	20700	0
20699	20701	1
20699	20702	2
20699	20703	3
20699	20704	4
20699	20705	5
20765	20766	0
20765	20767	1
20765	20768	2
20765	20769	3
20765	20770	4
20765	20771	5
20772	20773	0
20772	20774	1
20772	20775	2
20772	20776	3
20772	20777	4
20772	20778	5
20779	20780	0
20779	20781	1
20779	20782	2
20779	20783	3
20779	20784	4
20820	20821	0
20820	20822	1
20820	20823	2
20820	20824	3
20820	20825	4
20884	20885	0
20884	20886	1
20884	20887	2
20884	20888	3
20884	20889	4
21197	21198	0
21197	21199	1
21197	21200	2
21197	21201	3
21260	21261	0
21260	21262	1
21260	21263	2
21260	21264	3
21260	21265	4
21260	21266	5
21260	21267	6
21317	21318	0
21317	21319	1
21317	21320	2
21317	21321	3
21317	21322	4
21317	21323	5
21317	21324	6
21376	21377	0
21376	21378	1
21376	21379	2
21376	21380	3
4037	4038	0
4037	4039	1
4040	4041	0
4040	4042	1
4043	4044	0
4043	4045	1
4190	4191	0
4190	4192	1
4190	4193	2
4196	4197	0
4196	4198	1
4196	4199	2
4196	4200	3
4202	4203	0
4202	4204	1
4202	4205	2
4202	4206	3
4336	4337	0
4336	4338	1
4339	4340	0
4341	4342	0
4345	4346	0
4352	4353	0
21376	21381	4
21376	21382	5
21376	21383	6
21376	21384	7
21376	21385	8
21407	21408	0
21407	21409	1
21407	21410	2
21407	21411	3
4396	4397	0
4396	4398	1
21407	21412	4
21407	21413	5
21407	21414	6
21427	21435	7
21530	21531	0
21530	21532	1
21530	21533	2
21530	21534	3
21530	21535	4
21568	21569	0
21568	21570	1
21568	21571	2
16811	16812	0
16811	16813	1
16811	16814	2
16811	16815	3
16816	16817	0
19671	19672	0
19671	19673	1
19671	19674	2
19722	19723	0
19722	19724	1
19722	19725	2
19722	19726	3
19782	19783	0
19782	19784	1
19782	19785	2
19782	19786	3
19782	19787	4
19782	19788	5
19851	19852	0
19851	19853	1
19851	19854	2
19851	19855	3
19851	19856	4
19851	19857	5
19851	19858	6
19928	19929	0
19928	19930	1
19928	19931	2
19928	19932	3
19928	19933	4
19928	19934	5
20002	20003	0
20002	20004	1
5595	5596	0
5595	5597	1
5598	5599	0
5598	5600	1
5602	5603	0
5602	5604	1
10010	10011	0
10010	10012	1
10010	10013	2
10010	10014	3
10010	10015	4
20002	20005	2
20002	20006	3
20002	20007	4
20002	20008	5
20002	20009	6
20523	20524	0
20523	20525	1
20523	20526	2
20523	20527	3
20523	20528	4
20523	20529	5
20523	20530	6
20523	20531	7
20523	20532	8
20523	20533	9
20523	20534	10
20523	20535	11
20523	20536	12
20622	20623	0
20622	20624	1
20622	20625	2
20622	20626	3
20622	20627	4
20706	20707	0
20706	20708	1
20706	20709	2
20706	20710	3
20706	20711	4
20712	20713	0
20712	20714	1
20712	20715	2
20712	20716	3
20712	20717	4
20785	20786	0
20785	20787	1
20785	20788	2
20831	20832	0
20831	20833	1
20831	20834	2
20894	20895	0
20894	20896	1
20894	20897	2
20894	20898	3
20894	20899	4
21207	21208	0
21207	21209	1
21207	21210	2
21211	21212	0
21211	21213	1
21211	21214	2
21268	21269	0
21268	21270	1
21268	21271	2
21268	21272	3
21268	21273	4
21325	21326	0
21325	21327	1
21325	21328	2
21325	21329	3
21325	21330	4
21325	21331	5
21325	21332	6
21325	21333	7
21325	21334	8
21386	21387	0
21386	21388	1
21386	21389	2
21386	21390	3
21386	21391	4
21415	21416	0
7174	7175	0
7174	7176	1
7174	7177	2
7178	7179	0
7178	7180	1
7178	7181	2
7182	7183	0
7182	7184	1
7182	7185	2
7186	7187	0
7186	7188	1
7186	7189	2
7259	7260	0
7259	7261	1
7259	7262	2
7259	7263	3
21415	21417	1
21415	21418	2
21415	21419	3
21415	21420	4
21436	21437	0
21436	21438	1
21436	21439	2
21436	21440	3
21436	21441	4
21442	21443	0
21442	21444	1
21442	21445	2
21442	21446	3
21544	21545	0
21544	21546	1
21544	21547	2
21544	21548	3
21544	21549	4
21544	21550	5
21544	21551	6
21544	21552	7
21544	21553	8
21544	21554	9
21544	21555	10
21544	21556	11
21544	21557	12
21568	21572	3
21568	21573	4
21574	21575	0
21574	21576	1
21574	21577	2
21574	21578	3
21574	21579	4
21574	21580	5
21574	21581	6
21574	21582	7
21574	21583	8
21574	21584	9
21574	21585	10
21574	21586	11
21574	21587	12
21588	21589	0
21588	21590	1
21588	21591	2
21588	21592	3
21588	21593	4
21588	21594	5
21588	21595	6
21603	21604	0
21603	21605	1
21623	21624	0
21623	21625	1
21623	21626	2
21623	21627	3
21623	21628	4
21629	21630	0
21629	21631	1
21629	21632	2
21629	21633	3
21629	21634	4
21629	21635	5
21629	21636	6
21637	21638	0
21637	21639	1
21637	21640	2
21637	21641	3
21637	21642	4
21643	21644	0
21643	21645	1
21643	21646	2
21643	21647	3
21643	21648	4
21643	21649	5
21643	21650	6
21643	21651	7
21643	21652	8
21653	21654	0
21653	21655	1
21653	21656	2
21653	21657	3
21653	21658	4
21653	21659	5
21653	21660	6
21653	21661	7
21653	21662	8
21653	21663	9
21653	21664	10
21653	21665	11
21666	21667	0
21666	21668	1
21666	21669	2
21666	21670	3
21666	21671	4
21666	21672	5
21666	21673	6
21666	21674	7
21666	21675	8
21666	21676	9
21666	21677	10
21678	21679	0
21678	21680	1
21678	21681	2
21678	21682	3
21678	21683	4
21684	21685	0
21684	21686	1
21684	21687	2
21684	21688	3
21684	21689	4
21684	21690	5
21684	21691	6
21684	21692	7
21693	21694	0
21693	21695	1
21693	21696	2
21693	21697	3
21693	21698	4
21693	21699	5
21700	21701	0
21700	21702	1
21700	21703	2
21700	21704	3
21700	21705	4
21700	21706	5
21700	21707	6
21709	21710	0
21709	21711	1
21709	21712	2
21709	21713	3
21709	21714	4
21715	21716	0
21715	21717	1
21715	21718	2
21715	21719	3
21715	21720	4
21715	21721	5
21715	21722	6
21723	21724	0
21723	21725	1
21723	21726	2
21723	21727	3
21723	21728	4
21723	21729	5
21730	21731	0
21730	21732	1
21730	21733	2
21730	21734	3
21730	21735	4
21736	21737	0
21736	21738	1
21736	21739	2
21736	21740	3
21736	21741	4
21736	21742	5
21736	21743	6
21744	21745	0
21744	21746	1
21744	21747	2
21744	21748	3
21744	21749	4
21744	21750	5
21751	21752	0
21751	21753	1
21751	21754	2
21751	21755	3
21751	21756	4
21751	21757	5
21751	21758	6
21751	21759	7
21760	21761	0
21760	21762	1
21760	21763	2
21760	21764	3
21765	21766	0
21765	21767	1
21765	21768	2
21765	21769	3
21765	21770	4
21771	21772	0
21771	21773	1
21771	21774	2
21771	21775	3
21771	21776	4
21777	21778	0
21777	21779	1
21777	21780	2
21777	21781	3
21782	21783	0
21782	21784	1
21782	21785	2
21782	21786	3
21782	21787	4
21782	21788	5
21782	21789	6
21782	21790	7
21791	21792	0
21791	21793	1
21791	21794	2
21795	21796	0
21795	21797	1
21795	21798	2
21795	21799	3
21795	21800	4
21795	21801	5
21802	21803	0
21802	21804	1
21802	21805	2
21802	21806	3
21802	21807	4
21802	21808	5
21809	21810	0
21809	21811	1
21809	21812	2
21809	21813	3
21814	21815	0
21814	21816	1
21814	21817	2
21814	21818	3
21814	21819	4
21820	21821	0
21820	21822	1
21820	21823	2
21820	21824	3
21820	21825	4
21820	21826	5
21864	21865	0
21864	21866	1
21864	21867	2
21864	21868	3
21864	21869	4
22032	22033	0
22032	22034	1
22032	22035	2
22032	22036	3
22032	22037	4
22038	22039	0
22038	22040	1
22038	22041	2
22038	22042	3
22038	22043	4
22044	22045	0
22044	22046	1
22044	22047	2
22044	22048	3
22044	22049	4
22050	22051	0
22050	22052	1
22050	22053	2
22050	22054	3
22050	22055	4
22050	22056	5
22050	22057	6
22050	22058	7
22050	22059	8
22060	22061	0
22060	22062	1
22060	22063	2
22060	22064	3
22065	22066	0
22065	22067	1
22065	22068	2
22065	22069	3
22065	22070	4
22801	22802	0
22801	22803	1
22801	22804	2
22801	22805	3
22806	22807	0
22806	22808	1
22806	22809	2
22806	22810	3
22811	22812	0
22811	22813	1
22811	22814	2
22815	22816	0
22815	22817	1
22815	22818	2
22819	22820	0
22819	22821	1
22819	22822	2
22819	22823	3
22819	22824	4
22825	22826	0
22825	22827	1
22825	22828	2
22825	22829	3
22825	22830	4
22831	22832	0
22831	22833	1
22831	22834	2
22831	22835	3
22831	22836	4
22837	22838	0
22837	22839	1
22837	22840	2
22837	22841	3
22837	22842	4
22843	22844	0
22843	22845	1
22843	22846	2
22843	22847	3
22843	22848	4
22843	22849	5
22843	22850	6
22851	22852	0
22851	22853	1
22851	22854	2
22851	22855	3
22851	22856	4
22851	22857	5
22851	22858	6
22859	22860	0
22859	22861	1
22859	22862	2
22859	22863	3
22859	22864	4
22859	22865	5
22859	22866	6
22859	22867	7
22868	22869	0
22868	22870	1
22868	22871	2
22868	22872	3
22868	22873	4
22868	22874	5
22868	22875	6
22868	22876	7
22868	22877	8
22878	22879	0
22878	22880	1
22878	22881	2
22878	22882	3
22878	22883	4
22878	22884	5
22878	22885	6
22878	22886	7
22887	22888	0
22887	22889	1
22887	22890	2
22887	22891	3
22887	22892	4
22887	22893	5
22894	22895	0
22894	22896	1
22894	22897	2
22894	22898	3
22894	22899	4
22894	22900	5
22894	22901	6
22894	22902	7
22894	22903	8
22904	22905	0
22904	22906	1
22904	22907	2
22904	22908	3
22904	22909	4
22904	22910	5
22911	22912	0
22911	22913	1
22911	22914	2
22911	22915	3
22911	22916	4
22911	22917	5
22911	22918	6
22911	22919	7
22911	22920	8
22921	22922	0
22921	22923	1
22921	22924	2
22921	22925	3
22921	22926	4
22927	22928	0
22927	22929	1
22927	22930	2
22927	22931	3
22927	22932	4
22933	22934	0
22933	22935	1
22933	22936	2
22933	22937	3
22933	22938	4
22939	22940	0
22939	22941	1
22939	22942	2
22939	22943	3
22939	22944	4
22945	22946	0
22945	22947	1
22945	22948	2
22945	22949	3
22945	22950	4
22945	22951	5
22952	22953	0
22952	22954	1
22952	22955	2
22952	22956	3
22952	22957	4
22952	22958	5
22952	22959	6
22952	22960	7
22952	22961	8
22952	22962	9
22952	22963	10
22952	22964	11
22965	22966	0
22965	22967	1
22965	22968	2
22965	22969	3
22965	22970	4
22965	22971	5
22965	22972	6
22965	22973	7
22965	22974	8
22975	22976	0
22975	22977	1
22975	22978	2
22975	22979	3
22975	22980	4
22975	22981	5
22975	22982	6
22975	22983	7
22975	22984	8
22975	22985	9
22975	22986	10
22975	22987	11
22975	22988	12
22999	23000	0
22999	23001	1
22999	23002	2
23003	23004	0
23003	23005	1
23003	23006	2
23008	23009	0
23008	23010	1
23011	23012	0
23011	23013	1
23016	23017	0
23016	23018	1
23019	23020	0
23019	23021	1
23039	23040	0
23039	23041	1
23039	23042	2
23039	23043	3
23044	23045	0
23044	23046	1
23044	23047	2
23044	23048	3
23044	23049	4
23050	23051	0
23052	23053	0
23052	23054	1
23052	23055	2
23052	23056	3
23057	23058	0
23057	23059	1
23057	23060	2
23057	23061	3
23057	23062	4
23057	23063	5
23057	23064	6
23057	23065	7
23066	23067	0
23066	23068	1
23066	23069	2
23070	23071	0
23070	23072	1
23070	23073	2
23070	23074	3
23076	23077	0
23076	23078	1
23076	23079	2
23076	23080	3
23081	23082	0
23081	23083	1
23081	23084	2
23081	23085	3
23081	23086	4
23087	23088	0
23087	23089	1
23087	23090	2
23087	23091	3
23087	23092	4
23087	23093	5
23087	23094	6
23087	23095	7
23087	23096	8
23087	23097	9
23087	23098	10
23087	23099	11
23087	23100	12
23101	23102	0
23104	23105	0
23104	23106	1
23104	23107	2
23111	23112	0
23111	23113	1
23111	23114	2
23115	23116	0
23115	23117	1
23115	23118	2
23115	23119	3
23115	23120	4
23115	23121	5
23115	23122	6
23115	23123	7
23115	23124	8
23115	23125	9
23115	23126	10
23115	23127	11
23115	23128	12
23115	23129	13
23115	23130	14
23115	23131	15
23132	23133	0
23132	23134	1
23132	23135	2
23132	23136	3
23132	23137	4
23138	23139	0
23138	23140	1
23138	23141	2
23138	23142	3
23138	23143	4
23144	23145	0
23144	23146	1
23144	23147	2
23144	23148	3
23144	23149	4
23144	23150	5
23144	23151	6
23144	23152	7
23153	23154	0
23153	23155	1
23153	23156	2
23153	23157	3
23153	23158	4
23159	23160	0
23159	23161	1
23159	23162	2
23159	23163	3
23159	23164	4
23165	23166	0
23165	23167	1
23165	23168	2
23165	23169	3
23165	23170	4
23171	23172	0
23171	23173	1
23171	23174	2
23171	23175	3
23171	23176	4
23171	23177	5
23171	23178	6
23171	23179	7
23171	23180	8
23171	23181	9
23171	23182	10
23183	23184	0
23183	23185	1
23183	23186	2
23183	23187	3
23183	23188	4
23189	23190	0
23189	23191	1
23189	23192	2
23189	23193	3
23189	23194	4
23189	23195	5
23189	23196	6
23197	23198	0
23197	23199	1
23197	23200	2
23197	23201	3
23197	23202	4
23203	23204	0
23203	23205	1
23203	23206	2
23203	23207	3
23203	23208	4
23209	23210	0
23209	23211	1
23209	23212	2
23209	23213	3
23209	23214	4
23209	23215	5
23209	23216	6
23217	23218	0
23217	23219	1
23217	23220	2
23217	23221	3
23217	23222	4
23217	23223	5
23217	23224	6
23217	23225	7
23217	23226	8
23217	23227	9
23217	23228	10
23229	23230	0
23229	23231	1
23229	23232	2
23229	23233	3
23229	23234	4
23235	23236	0
23235	23237	1
23235	23238	2
23235	23239	3
23235	23240	4
23235	23241	5
23235	23242	6
23235	23243	7
23244	23245	0
23244	23246	1
23244	23247	2
23244	23248	3
23244	23249	4
23244	23250	5
23244	23251	6
23252	23253	0
23252	23254	1
23252	23255	2
23252	23256	3
23252	23257	4
23252	23258	5
23252	23259	6
23252	23260	7
23252	23261	8
23252	23262	9
23252	23263	10
23264	23265	0
23264	23266	1
23264	23267	2
23264	23268	3
23264	23269	4
23264	23270	5
23264	23271	6
23264	23272	7
23264	23273	8
23274	23275	0
23274	23276	1
23274	23277	2
23274	23278	3
23274	23279	4
23280	23281	0
23280	23282	1
23280	23283	2
23280	23284	3
23280	23285	4
23280	23286	5
23280	23287	6
23280	23288	7
23289	23290	0
23289	23291	1
23289	23292	2
23289	23293	3
23289	23294	4
23289	23295	5
23289	23296	6
23289	23297	7
23289	23298	8
23289	23299	9
23289	23300	10
23289	23301	11
23302	23303	0
23302	23304	1
23302	23305	2
23302	23306	3
23302	23307	4
23302	23308	5
23309	23310	0
23309	23311	1
23309	23312	2
23309	23313	3
23309	23314	4
23309	23315	5
23309	23316	6
23309	23317	7
23318	23319	0
23318	23320	1
23318	23321	2
23318	23322	3
23318	23323	4
23318	23324	5
23318	23325	6
23326	23327	0
23326	23328	1
23326	23329	2
23326	23330	3
23326	23331	4
23332	23333	0
23332	23334	1
23332	23335	2
23332	23336	3
23332	23337	4
23332	23338	5
23332	23339	6
23332	23340	7
23341	23342	0
23341	23343	1
23341	23344	2
23341	23345	3
23341	23346	4
23341	23347	5
23341	23348	6
23341	23349	7
23350	23351	0
23350	23352	1
23350	23353	2
23350	23354	3
23350	23355	4
23350	23356	5
23357	23358	0
23357	23359	1
23357	23360	2
23357	23361	3
23357	23362	4
23364	23365	0
23364	23366	1
23364	23367	2
23364	23368	3
23364	23369	4
23370	23371	0
23370	23372	1
23370	23373	2
23370	23374	3
23370	23375	4
23412	23413	0
23412	23414	1
23412	23415	2
23412	23416	3
23412	23417	4
23440	23441	0
23440	23442	1
23440	23443	2
23440	23444	3
23440	23445	4
23458	23459	0
23458	23460	1
23458	23461	2
23458	23462	3
23458	23463	4
23485	23486	0
23485	23487	1
23485	23488	2
23485	23489	3
23485	23490	4
23509	23510	0
23509	23511	1
23509	23512	2
23509	23513	3
23509	23514	4
24336	24337	0
24336	24338	1
24339	24340	0
24341	24342	0
24343	24344	0
24343	24345	1
24343	24346	2
24343	24347	3
24348	24349	0
24350	24351	0
24350	24352	1
24350	24353	2
24350	24354	3
24350	24355	4
24350	24356	5
24350	24357	6
24350	24358	7
24350	24359	8
24350	24360	9
24350	24361	10
24350	24362	11
24363	24364	0
24363	24365	1
24363	24366	2
24363	24367	3
24363	24368	4
24363	24369	5
24363	24370	6
24363	24371	7
24363	24372	8
24363	24373	9
24376	24377	0
24376	24378	1
24376	24379	2
24376	24380	3
24376	24381	4
24376	24382	5
24383	24384	0
24383	24385	1
24383	24386	2
24383	24387	3
24383	24388	4
24383	24389	5
24383	24390	6
24383	24391	7
24383	24392	8
24383	24393	9
24383	24394	10
24383	24395	11
24383	24396	12
24383	24397	13
24383	24398	14
24399	24400	0
24399	24401	1
24399	24402	2
24399	24403	3
24399	24404	4
24399	24405	5
24399	24406	6
24399	24407	7
24399	24408	8
24399	24409	9
24399	24410	10
24399	24411	11
24399	24412	12
24413	24414	0
24413	24415	1
24413	24416	2
24413	24417	3
24413	24418	4
24413	24419	5
24420	24421	0
24420	24422	1
24420	24423	2
24420	24424	3
24420	24425	4
24427	24428	0
24427	24429	1
24427	24430	2
24427	24431	3
24427	24432	4
24433	24434	0
24433	24435	1
24433	24436	2
24433	24437	3
24433	24438	4
24433	24439	5
24433	24440	6
24433	24441	7
24442	24443	0
24442	24444	1
24442	24445	2
24442	24446	3
24442	24447	4
24442	24448	5
24449	24450	0
24449	24451	1
24449	24452	2
24449	24453	3
24449	24454	4
24455	24456	0
24455	24457	1
24455	24458	2
24455	24459	3
24455	24460	4
24455	24461	5
24455	24462	6
24455	24463	7
24464	24465	0
24464	24466	1
24464	24467	2
24464	24468	3
24464	24469	4
24464	24470	5
24471	24472	0
24471	24473	1
24471	24474	2
24471	24475	3
24471	24476	4
24471	24477	5
24471	24478	6
24471	24479	7
24471	24480	8
24471	24481	9
24482	24483	0
24482	24484	1
24482	24485	2
24482	24486	3
24482	24487	4
24482	24488	5
24482	24489	6
24482	24490	7
24482	24491	8
24482	24492	9
24482	24493	10
24494	24495	0
24494	24496	1
24494	24497	2
24494	24498	3
24494	24499	4
24500	24501	0
24500	24502	1
24500	24503	2
24500	24504	3
24500	24505	4
24500	24506	5
24500	24507	6
24500	24508	7
24500	24509	8
24510	24511	0
24510	24512	1
24510	24513	2
24510	24514	3
24510	24515	4
24510	24516	5
24517	24518	0
24517	24519	1
24517	24520	2
24517	24521	3
24517	24522	4
24517	24523	5
24517	24524	6
24517	24525	7
24526	24527	0
24526	24528	1
24526	24529	2
24526	24530	3
24526	24531	4
24532	24533	0
24532	24534	1
24532	24535	2
24532	24536	3
24532	24537	4
24532	24538	5
24540	24541	0
24540	24542	1
24540	24543	2
24540	24544	3
24540	24545	4
24540	24546	5
24540	24547	6
24540	24548	7
24540	24549	8
24540	24550	9
24540	24551	10
24540	24552	11
24540	24553	12
24540	24554	13
24540	24555	14
24540	24556	15
24558	24559	0
24558	24560	1
24558	24561	2
24558	24562	3
24558	24563	4
24558	24564	5
24565	24566	0
24565	24567	1
24565	24568	2
24565	24569	3
24565	24570	4
24571	24572	0
24571	24573	1
24571	24574	2
24571	24575	3
24571	24576	4
24578	24579	0
24578	24580	1
24578	24581	2
24578	24582	3
24578	24583	4
24578	24584	5
24578	24585	6
24586	24587	0
24586	24588	1
24586	24589	2
24586	24590	3
24586	24591	4
24586	24592	5
24594	24595	0
24594	24596	1
24594	24597	2
24594	24598	3
24594	24599	4
24594	24600	5
24594	24601	6
24594	24602	7
24594	24603	8
24594	24604	9
24594	24605	10
24594	24606	11
24594	24607	12
24608	24609	0
24608	24610	1
24608	24611	2
24608	24612	3
24608	24613	4
24608	24614	5
24608	24615	6
24608	24616	7
24618	24619	0
24618	24620	1
24618	24621	2
24618	24622	3
24618	24623	4
24624	24625	0
24624	24626	1
24624	24627	2
24624	24628	3
24624	24629	4
24624	24630	5
24631	24632	0
24631	24633	1
24631	24634	2
24631	24635	3
24631	24636	4
24631	24637	5
24631	24638	6
24631	24639	7
24631	24640	8
24631	24641	9
24631	24642	10
24631	24643	11
24631	24644	12
24645	24646	0
24645	24647	1
24645	24648	2
24645	24649	3
24645	24650	4
24645	24651	5
24645	24652	6
24645	24653	7
24645	24654	8
24645	24655	9
24645	24656	10
24645	24657	11
24645	24658	12
24645	24659	13
24645	24660	14
24661	24662	0
24661	24663	1
24661	24664	2
24661	24665	3
24666	24667	0
24666	24668	1
24666	24669	2
24666	24670	3
24666	24671	4
24666	24672	5
24674	24675	0
24674	24676	1
24674	24677	2
24674	24678	3
24674	24679	4
24674	24680	5
24674	24681	6
24674	24682	7
24683	24684	0
24683	24685	1
24683	24686	2
24683	24687	3
24683	24688	4
24683	24689	5
24683	24690	6
24691	24692	0
24691	24693	1
24691	24694	2
24691	24695	3
24691	24696	4
24691	24697	5
24691	24698	6
24691	24699	7
24700	24701	0
24700	24702	1
24700	24703	2
24700	24704	3
24700	24705	4
24700	24706	5
24707	24708	0
24707	24709	1
24707	24710	2
24707	24711	3
24707	24712	4
24707	24713	5
24714	24715	0
24714	24716	1
24714	24717	2
24714	24718	3
24714	24719	4
24714	24720	5
24714	24721	6
24714	24722	7
24714	24723	8
24714	24724	9
24714	24725	10
24714	24726	11
24727	24728	0
24727	24729	1
24727	24730	2
24727	24731	3
24727	24732	4
24727	24733	5
24727	24734	6
24727	24735	7
24727	24736	8
24727	24737	9
24727	24738	10
24727	24739	11
24727	24740	12
24727	24741	13
24727	24742	14
24743	24744	0
24743	24745	1
24743	24746	2
24743	24747	3
24743	24748	4
24749	24750	0
24749	24751	1
24749	24752	2
24749	24753	3
24749	24754	4
24749	24755	5
24749	24756	6
24749	24757	7
24749	24758	8
24749	24759	9
24760	24761	0
24760	24762	1
24760	24763	2
24760	24764	3
24760	24765	4
24760	24766	5
24760	24767	6
24760	24768	7
24760	24769	8
24770	24771	0
24770	24772	1
24770	24773	2
24770	24774	3
24770	24775	4
24776	24777	0
24776	24778	1
24776	24779	2
24776	24780	3
24776	24781	4
24776	24782	5
24776	24783	6
24776	24784	7
24776	24785	8
24776	24786	9
24787	24788	0
24787	24789	1
24787	24790	2
24787	24791	3
24787	24792	4
24793	24794	0
24793	24795	1
24793	24796	2
24793	24797	3
24793	24798	4
24793	24799	5
24793	24800	6
24793	24801	7
24793	24802	8
24793	24803	9
24793	24804	10
24793	24805	11
24793	24806	12
24807	24808	0
24807	24809	1
24807	24810	2
24807	24811	3
24807	24812	4
24807	24813	5
24807	24814	6
24807	24815	7
24807	24816	8
24807	24817	9
24807	24818	10
24807	24819	11
24807	24820	12
24821	24822	0
24821	24823	1
24821	24824	2
24821	24825	3
24821	24826	4
24827	24828	0
24827	24829	1
24827	24830	2
24827	24831	3
24827	24832	4
24833	24834	0
24833	24835	1
24833	24836	2
24833	24837	3
24833	24838	4
24839	24840	0
24839	24841	1
24839	24842	2
24839	24843	3
24839	24844	4
24839	24845	5
24839	24846	6
24839	24847	7
24848	24849	0
24848	24850	1
24848	24851	2
24848	24852	3
24848	24853	4
24848	24854	5
24855	24856	0
24855	24857	1
24855	24858	2
24855	24859	3
24860	24861	0
24860	24862	1
24860	24863	2
24860	24864	3
24860	24865	4
24860	24866	5
25687	25688	0
25687	25689	1
25687	25690	2
25687	25691	3
25687	25692	4
25693	25694	0
25693	25695	1
25693	25696	2
25693	25697	3
25693	25698	4
25693	25699	5
25693	25700	6
25693	25701	7
25693	25702	8
25693	25703	9
25693	25704	10
25693	25705	11
25706	25707	0
25706	25708	1
25706	25709	2
25706	25710	3
25706	25711	4
25706	25712	5
25706	25713	6
25706	25714	7
25706	25715	8
25706	25716	9
25706	25717	10
25706	25718	11
25719	25720	0
25719	25721	1
25719	25722	2
25719	25723	3
25719	25724	4
25719	25725	5
25719	25726	6
25719	25727	7
25719	25728	8
25719	25729	9
25719	25730	10
25719	25731	11
25719	25732	12
25733	25734	0
25733	25735	1
25733	25736	2
25733	25737	3
25733	25738	4
25733	25739	5
25733	25740	6
25733	25741	7
25733	25742	8
25733	25743	9
25744	25745	0
25744	25746	1
25744	25747	2
25744	25748	3
25744	25749	4
25744	25750	5
25744	25751	6
25744	25752	7
25744	25753	8
25744	25754	9
25755	25756	0
25755	25757	1
25755	25758	2
25755	25759	3
25755	25760	4
25755	25761	5
25755	25762	6
25755	25763	7
25755	25764	8
25755	25765	9
25755	25766	10
25755	25767	11
25755	25768	12
25755	25769	13
25770	25771	0
25770	25772	1
25770	25773	2
25770	25774	3
25770	25775	4
25777	25778	0
25777	25779	1
25777	25780	2
25777	25781	3
25777	25782	4
25777	25783	5
25777	25784	6
25777	25785	7
25777	25786	8
25777	25787	9
25777	25788	10
25790	25791	0
25790	25792	1
25790	25793	2
25790	25794	3
25790	25795	4
25790	25796	5
25790	25797	6
25790	25798	7
25790	25799	8
25790	25800	9
25790	25801	10
25790	25802	11
25804	25805	0
25804	25806	1
25804	25807	2
25804	25808	3
25804	25809	4
25804	25810	5
25804	25811	6
25831	25832	0
25831	25833	1
25831	25834	2
25831	25835	3
25831	25836	4
25831	25837	5
25831	25838	6
25831	25839	7
25831	25840	8
25831	25841	9
25831	25842	10
25831	25843	11
25831	25844	12
26280	26281	0
26280	26282	1
26280	26283	2
26280	26284	3
26280	26285	4
26280	26286	5
26302	26303	0
26302	26304	1
26302	26305	2
26302	26306	3
26302	26307	4
26302	26308	5
26302	26309	6
26302	26310	7
26302	26311	8
26302	26312	9
26302	26313	10
26302	26314	11
26302	26315	12
26302	26316	13
26302	26317	14
26318	26319	0
26318	26320	1
26318	26321	2
26318	26322	3
26318	26323	4
26318	26324	5
26318	26325	6
26318	26326	7
26318	26327	8
26318	26328	9
26318	26329	10
26318	26330	11
26331	26332	0
26331	26333	1
26331	26334	2
26331	26335	3
26331	26336	4
26331	26337	5
26331	26338	6
26339	26340	0
26339	26341	1
26339	26342	2
26339	26343	3
26339	26344	4
26339	26345	5
26339	26346	6
26339	26347	7
26339	26348	8
26339	26349	9
26359	26360	0
26359	26361	1
26359	26362	2
26359	26363	3
26359	26364	4
26359	26365	5
26359	26366	6
26359	26367	7
26359	26368	8
26369	26370	0
26369	26371	1
26369	26372	2
26369	26373	3
26376	26377	0
26376	26378	1
26376	26379	2
26376	26380	3
26376	26381	4
26376	26382	5
26376	26383	6
26376	26384	7
26376	26385	8
26376	26386	9
26376	26387	10
26376	26388	11
26389	26390	0
26389	26391	1
26389	26392	2
26389	26393	3
26389	26394	4
26389	26395	5
26389	26396	6
26389	26397	7
26389	26398	8
26389	26399	9
26389	26400	10
26389	26401	11
26389	26402	12
26389	26403	13
26389	26404	14
26389	26405	15
26389	26406	16
26416	26417	0
26416	26418	1
26416	26419	2
26416	26420	3
26416	26421	4
26416	26422	5
26416	26423	6
26416	26424	7
26416	26425	8
26416	26426	9
26416	26427	10
26416	26428	11
26416	26429	12
26416	26430	13
26416	26431	14
26416	26432	15
26416	26433	16
27284	27285	0
27284	27286	1
27284	27287	2
27284	27288	3
27284	27289	4
27290	27291	0
27290	27292	1
27290	27293	2
27290	27294	3
27290	27295	4
27290	27296	5
27290	27297	6
27290	27298	7
27299	27300	0
27299	27301	1
27299	27302	2
27299	27303	3
27299	27304	4
27299	27305	5
27299	27306	6
27299	27307	7
27299	27308	8
27299	27309	9
27310	27311	0
27310	27312	1
27310	27313	2
27310	27314	3
27310	27315	4
27316	27317	0
27316	27318	1
27316	27319	2
27316	27320	3
27316	27321	4
27316	27322	5
27316	27323	6
27316	27324	7
27316	27325	8
27316	27326	9
27316	27327	10
27316	27328	11
27316	27329	12
27316	27330	13
27316	27331	14
27332	27333	0
27332	27334	1
27332	27335	2
27332	27336	3
27337	27338	0
27337	27339	1
27337	27340	2
27337	27341	3
27337	27342	4
27337	27343	5
27337	27344	6
27337	27345	7
27337	27346	8
27337	27347	9
27337	27348	10
27337	27349	11
27337	27350	12
27337	27351	13
27337	27352	14
27337	27353	15
27337	27354	16
27355	27356	0
27355	27357	1
27355	27358	2
27355	27359	3
27355	27360	4
27355	27361	5
27355	27362	6
27355	27363	7
27355	27364	8
27355	27365	9
27355	27366	10
27367	27368	0
27367	27369	1
27367	27370	2
27367	27371	3
27367	27372	4
27367	27373	5
27367	27374	6
27367	27375	7
27367	27376	8
27367	27377	9
27367	27378	10
27367	27379	11
27380	27381	0
27380	27382	1
27380	27383	2
27380	27384	3
27380	27385	4
27380	27386	5
27380	27387	6
27380	27388	7
27389	27390	0
27389	27391	1
27389	27392	2
27389	27393	3
27389	27394	4
27389	27395	5
27389	27396	6
27389	27397	7
27389	27398	8
27389	27399	9
27400	27401	0
27400	27402	1
27400	27403	2
27400	27404	3
27400	27405	4
27406	27407	0
27406	27408	1
27406	27409	2
27406	27410	3
27406	27411	4
27406	27412	5
27406	27413	6
27406	27414	7
27406	27415	8
27416	27417	0
27416	27418	1
27416	27419	2
27416	27420	3
27416	27421	4
27416	27422	5
27416	27423	6
27416	27424	7
27416	27425	8
27416	27426	9
27416	27427	10
27416	27428	11
27429	27430	0
27429	27431	1
27429	27432	2
27429	27433	3
27429	27434	4
27429	27435	5
27429	27436	6
27429	27437	7
27429	27438	8
27429	27439	9
27429	27440	10
27429	27441	11
27429	27442	12
27429	27443	13
27429	27444	14
27429	27445	15
27429	27446	16
27447	27448	0
27447	27449	1
27447	27450	2
27447	27451	3
27447	27452	4
27447	27453	5
27447	27454	6
27447	27455	7
27456	27457	0
27456	27458	1
27456	27459	2
27456	27460	3
27456	27461	4
27462	27463	0
27462	27464	1
27462	27465	2
27462	27466	3
27462	27467	4
27462	27468	5
27462	27469	6
27462	27470	7
27462	27471	8
27462	27472	9
27462	27473	10
27462	27474	11
27462	27475	12
27462	27476	13
27462	27477	14
27478	27479	0
27478	27480	1
27478	27481	2
27478	27482	3
27478	27483	4
27478	27484	5
27478	27485	6
27478	27486	7
27478	27487	8
27478	27488	9
27478	27489	10
27478	27490	11
27478	27491	12
27522	27523	0
27522	27524	1
27522	27525	2
27522	27526	3
27522	27527	4
27522	27528	5
27522	27529	6
27522	27530	7
27522	27531	8
27522	27532	9
27522	27533	10
27522	27534	11
27522	27535	12
27522	27536	13
27522	27537	14
27696	27697	0
27696	27698	1
27696	27699	2
27696	27700	3
27696	27701	4
27702	27703	0
27702	27704	1
27702	27705	2
27702	27706	3
27702	27707	4
27710	27711	0
27710	27712	1
27710	27713	2
27710	27714	3
27710	27715	4
27710	27716	5
27718	27719	0
27718	27720	1
27718	27721	2
27718	27722	3
27718	27723	4
27718	27724	5
27718	27725	6
27718	27726	7
27718	27727	8
27718	27728	9
27729	27730	0
27729	27731	1
27729	27732	2
27729	27733	3
27729	27734	4
27729	27735	5
27729	27736	6
27729	27737	7
27729	27738	8
27729	27739	9
27729	27740	10
27729	27741	11
27729	27742	12
27729	27743	13
27729	27744	14
27729	27745	15
27746	27747	0
27746	27748	1
27746	27749	2
27746	27750	3
27746	27751	4
27746	27752	5
27746	27753	6
27746	27754	7
27746	27755	8
27746	27756	9
27746	27757	10
27746	27758	11
27746	27759	12
27746	27760	13
27762	27763	0
27762	27764	1
27762	27765	2
27762	27766	3
27762	27767	4
27762	27768	5
27762	27769	6
27762	27770	7
27762	27771	8
27762	27772	9
27762	27773	10
27762	27774	11
27762	27775	12
27762	27776	13
27777	27778	0
27777	27779	1
27777	27780	2
27777	27781	3
27777	27782	4
27777	27783	5
27777	27784	6
27777	27785	7
27777	27786	8
27777	27787	9
27777	27788	10
27777	27789	11
27791	27792	0
27791	27793	1
27791	27794	2
27791	27795	3
27791	27796	4
27791	27797	5
27791	27798	6
27791	27799	7
27791	27800	8
27801	27802	0
27801	27803	1
27801	27804	2
27801	27805	3
27801	27806	4
27801	27807	5
27801	27808	6
27801	27809	7
27801	27810	8
27801	27811	9
27801	27812	10
27801	27813	11
27814	27815	0
27814	27816	1
27814	27817	2
27814	27818	3
27814	27819	4
27822	27823	0
27822	27824	1
27822	27825	2
27822	27826	3
27822	27827	4
27829	27830	0
27829	27831	1
27829	27832	2
27829	27833	3
27829	27834	4
27829	27835	5
27829	27836	6
27829	27837	7
27829	27838	8
27829	27839	9
27829	27840	10
27829	27841	11
27842	27843	0
27842	27844	1
27842	27845	2
27842	27846	3
27842	27847	4
27848	27849	0
27848	27850	1
27848	27851	2
27848	27852	3
27848	27853	4
27848	27854	5
27848	27855	6
27848	27856	7
27848	27857	8
27848	27858	9
27859	27860	0
27859	27861	1
27859	27862	2
27859	27863	3
27859	27864	4
27859	27865	5
27859	27866	6
27859	27867	7
27859	27868	8
27859	27869	9
27859	27870	10
27875	27876	0
27875	27877	1
27875	27878	2
27875	27879	3
27875	27880	4
27875	27881	5
27882	27883	0
27882	27884	1
27882	27885	2
27882	27886	3
27882	27887	4
27882	27888	5
27882	27889	6
27882	27890	7
27882	27891	8
27882	27892	9
27882	27893	10
27882	27894	11
27882	27895	12
27896	27897	0
27896	27898	1
27896	27899	2
27896	27900	3
27896	27901	4
27896	27902	5
27896	27903	6
27896	27904	7
27905	27906	0
27905	27907	1
27905	27908	2
27905	27909	3
27905	27910	4
27911	27912	0
27911	27913	1
27911	27914	2
27911	27915	3
27911	27916	4
27911	27917	5
27911	27918	6
27911	27919	7
27911	27920	8
27921	27922	0
27921	27923	1
27921	27924	2
27921	27925	3
27921	27926	4
27921	27927	5
27921	27928	6
27921	27929	7
27921	27930	8
27921	27931	9
27921	27932	10
27921	27933	11
27934	27935	0
27934	27936	1
27934	27937	2
27934	27938	3
27939	27940	0
27939	27941	1
27939	27942	2
27939	27943	3
27944	27945	0
27944	27946	1
27944	27947	2
27944	27948	3
27949	27950	0
27949	27951	1
27949	27952	2
27949	27953	3
27954	27955	0
27954	27956	1
27954	27957	2
27954	27958	3
27959	27960	0
27959	27961	1
27959	27962	2
27959	27963	3
27965	27966	0
27965	27967	1
27965	27968	2
27965	27969	3
27965	27970	4
27965	27971	5
27965	27972	6
27965	27973	7
27965	27974	8
27965	27975	9
27965	27976	10
27977	27978	0
27977	27979	1
27977	27980	2
27977	27981	3
27977	27982	4
27983	27984	0
27983	27985	1
27983	27986	2
27983	27987	3
27983	27988	4
27989	27990	0
27989	27991	1
27989	27992	2
27989	27993	3
27989	27994	4
27989	27995	5
27989	27996	6
27989	27997	7
27989	27998	8
27989	27999	9
27989	28000	10
27989	28001	11
28002	28003	0
28002	28004	1
28002	28005	2
28002	28006	3
28002	28007	4
28002	28008	5
28002	28009	6
28002	28010	7
28011	28012	0
28011	28013	1
28011	28014	2
28011	28015	3
28011	28016	4
28011	28017	5
28018	28019	0
28018	28020	1
28018	28021	2
28018	28022	3
28018	28023	4
28018	28024	5
28018	28025	6
28018	28026	7
28018	28027	8
28018	28028	9
28018	28029	10
28018	28030	11
28018	28031	12
28032	28033	0
28032	28034	1
28032	28035	2
28032	28036	3
28032	28037	4
28032	28038	5
28032	28039	6
28032	28040	7
28032	28041	8
28032	28042	9
28043	28044	0
28043	28045	1
28043	28046	2
28043	28047	3
28043	28048	4
28043	28049	5
28043	28050	6
28043	28051	7
28043	28052	8
28055	28056	0
28055	28057	1
28055	28058	2
28055	28059	3
28055	28060	4
28055	28061	5
28055	28062	6
28055	28063	7
28055	28064	8
28066	28067	0
28066	28068	1
28066	28069	2
28066	28070	3
28066	28071	4
28072	28073	0
28072	28074	1
28072	28075	2
28072	28076	3
28072	28077	4
28072	28078	5
28072	28079	6
28072	28080	7
28072	28081	8
28072	28082	9
28084	28085	0
28084	28086	1
28084	28087	2
28084	28088	3
28084	28089	4
28090	28091	0
28090	28092	1
28090	28093	2
28090	28094	3
28090	28095	4
28096	28097	0
28096	28098	1
28096	28099	2
28096	28100	3
28096	28101	4
28102	28103	0
28102	28104	1
28102	28105	2
28102	28106	3
28102	28107	4
28102	28108	5
28102	28109	6
28102	28110	7
28115	28116	0
28115	28117	1
28115	28118	2
28115	28119	3
28115	28120	4
28121	28122	0
28121	28123	1
28121	28124	2
28121	28125	3
28121	28126	4
28127	28128	0
28127	28129	1
28127	28130	2
28127	28131	3
28127	28132	4
28133	28134	0
28133	28135	1
28133	28136	2
28133	28137	3
28133	28138	4
28139	28140	0
28139	28141	1
28139	28142	2
28139	28143	3
28139	28144	4
28145	28146	0
28145	28147	1
28145	28148	2
28145	28149	3
28145	28150	4
28151	28152	0
28151	28153	1
28151	28154	2
28151	28155	3
28151	28156	4
28157	28158	0
28157	28159	1
28157	28160	2
28157	28161	3
28157	28162	4
28875	28876	0
28875	28877	1
28200	28201	0
28200	28202	1
28200	28203	2
28200	28204	3
28200	28205	4
28200	28206	5
28200	28207	6
28200	28208	7
28200	28209	8
28200	28210	9
28211	28212	0
28211	28213	1
28211	28214	2
28211	28215	3
28211	28216	4
28211	28217	5
28211	28218	6
28211	28219	7
28211	28220	8
28221	28222	0
28221	28223	1
28221	28224	2
28221	28225	3
28221	28226	4
28221	28227	5
28221	28228	6
28221	28229	7
28231	28232	0
28231	28233	1
28231	28234	2
28231	28235	3
28231	28236	4
28231	28237	5
28231	28238	6
28231	28239	7
28231	28240	8
28231	28241	9
28231	28242	10
28231	28243	11
28231	28244	12
28231	28245	13
28246	28247	0
28246	28248	1
28246	28249	2
28246	28250	3
28246	28251	4
28246	28252	5
28246	28253	6
28246	28254	7
28246	28255	8
28246	28256	9
28246	28257	10
28246	28258	11
28246	28259	12
28260	28261	0
28260	28262	1
28260	28263	2
28260	28264	3
28260	28265	4
28260	28266	5
28260	28267	6
28260	28268	7
28269	28270	0
28269	28271	1
28269	28272	2
28269	28273	3
28269	28274	4
28269	28275	5
28269	28276	6
28269	28277	7
28269	28278	8
28279	28280	0
28279	28281	1
28279	28282	2
28279	28283	3
28279	28284	4
28279	28285	5
28279	28286	6
28279	28287	7
28279	28288	8
28289	28290	0
28289	28291	1
28289	28292	2
28289	28293	3
28289	28294	4
28289	28295	5
28289	28296	6
28289	28297	7
28289	28298	8
28289	28299	9
28289	28300	10
28289	28301	11
28289	28302	12
28289	28303	13
28289	28304	14
28305	28306	0
28305	28307	1
28305	28308	2
28305	28309	3
28305	28310	4
28305	28311	5
28305	28312	6
28305	28313	7
28305	28314	8
28305	28315	9
28305	28316	10
28317	28318	0
28317	28319	1
28317	28320	2
28317	28321	3
28317	28322	4
28317	28323	5
28324	28325	0
28324	28326	1
28324	28327	2
28324	28328	3
28324	28329	4
28331	28332	0
28331	28333	1
28331	28334	2
28331	28335	3
28331	28336	4
28331	28337	5
28331	28338	6
28331	28339	7
28331	28340	8
28331	28341	9
28331	28342	10
28331	28343	11
28331	28344	12
28345	28346	0
28345	28347	1
28345	28348	2
28345	28349	3
28345	28350	4
28345	28351	5
28345	28352	6
28345	28353	7
28345	28354	8
28345	28355	9
28345	28356	10
28345	28357	11
28345	28358	12
28345	28359	13
28345	28360	14
28361	28362	0
28361	28363	1
28361	28364	2
28361	28365	3
28361	28366	4
28361	28367	5
28361	28368	6
28361	28369	7
28361	28370	8
28361	28371	9
28361	28372	10
28361	28373	11
28361	28374	12
28375	28376	0
28375	28377	1
28375	28378	2
28375	28379	3
28375	28380	4
28375	28381	5
28375	28382	6
28375	28383	7
28375	28384	8
28375	28385	9
28375	28386	10
28387	28388	0
28387	28389	1
28387	28390	2
28387	28391	3
28387	28392	4
28393	28394	0
28393	28395	1
28393	28396	2
28393	28397	3
28393	28398	4
28393	28399	5
28393	28400	6
28393	28401	7
28393	28402	8
28393	28403	9
28393	28404	10
28405	28406	0
28405	28407	1
28405	28408	2
28405	28409	3
28405	28410	4
28405	28411	5
28405	28412	6
28405	28413	7
28405	28414	8
28405	28415	9
28405	28416	10
28417	28418	0
28417	28419	1
28417	28420	2
28417	28421	3
28417	28422	4
28417	28423	5
28417	28424	6
28417	28425	7
28417	28426	8
28417	28427	9
28417	28428	10
28417	28429	11
28433	28434	0
28433	28435	1
28433	28436	2
28433	28437	3
28433	28438	4
28439	28440	0
28439	28441	1
28439	28442	2
28439	28443	3
28439	28444	4
28439	28445	5
28439	28446	6
28439	28447	7
28439	28448	8
28439	28449	9
28439	28450	10
28439	28451	11
28452	28453	0
28452	28454	1
28452	28455	2
28452	28456	3
28452	28457	4
28452	28458	5
28452	28459	6
28452	28460	7
28452	28461	8
28462	28463	0
28462	28464	1
28462	28465	2
28462	28466	3
28462	28467	4
28468	28469	0
28468	28470	1
28468	28471	2
28468	28472	3
28468	28473	4
28474	28475	0
28474	28476	1
28474	28477	2
28474	28478	3
28474	28479	4
28480	28481	0
28480	28482	1
28480	28483	2
28480	28484	3
28480	28485	4
28480	28486	5
28487	28488	0
28487	28489	1
28487	28490	2
28487	28491	3
28487	28492	4
28487	28493	5
28487	28494	6
28487	28495	7
28487	28496	8
28499	28500	0
28499	28501	1
28499	28502	2
28499	28503	3
28499	28504	4
28499	28505	5
28499	28506	6
28499	28507	7
28499	28508	8
28499	28509	9
28510	28511	0
28510	28512	1
28510	28513	2
28510	28514	3
28510	28515	4
28510	28516	5
28510	28517	6
28510	28518	7
28510	28519	8
28510	28520	9
28510	28521	10
28522	28523	0
28522	28524	1
28522	28525	2
28522	28526	3
28522	28527	4
28522	28528	5
28522	28529	6
28522	28530	7
28522	28531	8
28522	28532	9
28522	28533	10
28522	28534	11
28522	28535	12
28536	28537	0
28536	28538	1
28536	28539	2
28536	28540	3
28536	28541	4
28536	28542	5
28536	28543	6
28536	28544	7
28536	28545	8
28536	28546	9
28536	28547	10
28536	28548	11
28549	28550	0
28549	28551	1
28549	28552	2
28549	28553	3
28549	28554	4
28549	28555	5
28549	28556	6
28549	28557	7
28549	28558	8
28559	28560	0
28559	28561	1
28559	28562	2
28559	28563	3
28559	28564	4
28559	28565	5
28559	28566	6
28559	28567	7
28559	28568	8
28569	28570	0
28569	28571	1
28569	28572	2
28569	28573	3
28569	28574	4
28576	28577	0
28576	28578	1
28576	28579	2
28576	28580	3
28576	28581	4
28576	28582	5
28576	28583	6
28576	28584	7
28576	28585	8
28576	28586	9
28576	28587	10
28576	28588	11
28590	28591	0
28590	28592	1
28590	28593	2
28590	28594	3
28590	28595	4
28590	28596	5
28590	28597	6
28590	28598	7
28590	28599	8
28590	28600	9
28590	28601	10
28590	28602	11
28590	28603	12
28604	28605	0
28604	28606	1
28604	28607	2
28604	28608	3
28604	28609	4
28604	28610	5
28604	28611	6
28604	28612	7
28604	28613	8
28604	28614	9
28604	28615	10
28616	28617	0
28616	28618	1
28616	28619	2
28616	28620	3
28616	28621	4
28616	28622	5
28616	28623	6
28616	28624	7
28616	28625	8
28616	28626	9
28616	28627	10
28616	28628	11
28616	28629	12
28616	28630	13
28616	28631	14
28634	28635	0
28634	28636	1
28634	28637	2
28634	28638	3
28634	28639	4
28640	28641	0
28640	28642	1
28640	28643	2
28640	28644	3
28640	28645	4
28640	28646	5
28640	28647	6
28640	28648	7
28649	28650	0
28649	28651	1
28649	28652	2
28649	28653	3
28649	28654	4
28649	28655	5
28649	28656	6
28649	28657	7
28649	28658	8
28649	28659	9
28649	28660	10
28649	28661	11
28649	28662	12
28649	28663	13
28649	28664	14
28666	28667	0
28666	28668	1
28666	28669	2
28666	28670	3
28666	28671	4
28666	28672	5
28666	28673	6
28666	28674	7
28666	28675	8
28676	28677	0
28676	28678	1
28676	28679	2
28676	28680	3
28676	28681	4
28683	28684	0
28683	28685	1
28683	28686	2
28683	28687	3
28683	28688	4
28683	28689	5
28683	28690	6
28683	28691	7
28692	28693	0
28692	28694	1
28692	28695	2
28692	28696	3
28692	28697	4
28692	28698	5
28692	28699	6
28692	28700	7
28692	28701	8
28692	28702	9
28703	28704	0
28703	28705	1
28703	28706	2
28703	28707	3
28703	28708	4
28703	28709	5
28703	28710	6
28703	28711	7
28703	28712	8
28713	28714	0
28713	28715	1
28713	28716	2
28713	28717	3
28713	28718	4
28733	28734	0
28733	28735	1
28733	28736	2
28733	28737	3
28733	28738	4
28767	28768	0
28767	28769	1
28806	28807	0
28806	28808	1
28806	28809	2
28806	28810	3
28806	28811	4
28812	28813	0
28812	28814	1
28812	28815	2
28812	28816	3
28812	28817	4
28812	28818	5
28812	28819	6
28812	28820	7
28812	28821	8
28812	28822	9
28812	28823	10
28812	28824	11
28812	28825	12
28851	28852	0
28851	28853	1
28851	28854	2
28851	28855	3
28851	28856	4
28851	28857	5
28870	28871	0
28870	28872	1
28870	28873	2
28870	28874	3
28870	28875	4
28877	28878	0
28877	28879	1
28877	28880	2
28877	28881	3
28877	28882	4
28877	28883	5
28905	28906	0
28905	28907	1
28905	28908	2
28905	28909	3
28905	28910	4
28905	28911	5
28905	28912	6
28905	28913	7
28905	28914	8
28905	28915	9
28905	28916	10
28905	28917	11
28905	28918	12
28905	28919	13
28920	28921	0
28920	28922	1
28920	28923	2
28920	28924	3
28920	28925	4
28920	28926	5
28920	28927	6
28920	28928	7
28920	28929	8
28920	28930	9
28931	28932	0
28931	28933	1
28931	28934	2
28931	28935	3
28931	28936	4
28931	28937	5
28931	28938	6
28931	28939	7
28931	28940	8
28931	28941	9
28943	28944	0
28943	28945	1
28943	28946	2
28943	28947	3
28943	28948	4
28949	28950	0
28949	28951	1
28949	28952	2
28949	28953	3
28949	28954	4
28955	28956	0
28955	28957	1
28958	28959	0
28958	28960	1
28977	28978	0
28977	28979	1
28980	28981	0
28980	28982	1
28983	28984	0
29018	29019	0
29018	29020	1
29021	29022	0
29021	29023	1
29024	29025	0
29024	29026	1
29036	29037	0
29036	29038	1
29036	29039	2
29036	29040	3
29036	29041	4
29036	29042	5
29036	29043	6
29036	29044	7
\.


--
-- Data for Name: testusersgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY testusersgroups (testuserid, contentgrouppropertyid, groupid) FROM stdin;
190	2	17
5867	2	17
\.


--
-- Data for Name: usercourseinfo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY usercourseinfo (userid, courseid) FROM stdin;
\.


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY userinfo (userid, language, email, password, lastname, firstname, username, active, audiocaptioning, audiolevel, deliveryspeed, creatorid) FROM stdin;
21	es	alu@pip.com	56ba8e3517e1c79ce1b84d96e4d033e4	alu1	alu1	alu1	t	1	0.69999999	0.80000001	20
190	es	alu@hjhj.coo	b9839cf7b6959e0763df69ba8468d618	alu	alu	alu	t	1	0.69999999	0.80000001	72
4245	es	ej@ull.es	43ba05fa3d117189be753d7e09f487de	Evelio	Prueba	userevelio	t	1	0.69999999	0.80000001	4210
2283	es	elbecher@bol.com.br	78726962b5611538c061cb3d45dccaee	aluno4	aluno4	aluno4	t	1	0.69999999	0.80000001	40
2426	es	elbecher@bol.com.br	7bfcdc5426598c8b3ff9ed961a3879b6	aluno5	aluno5	aluno5	t	1	0.69999999	0.80000001	40
5867	es	alu2@ghgh.cv	ef1680b2ed91339a192ba2b8e2982096	alu2	alu2	alu2	t	1	0.69999999	0.80000001	72
6268	es	alberto@duria.es	d80031ff51a3643e748ce58e06617ccb	test	alberto	alberto	t	1	0.69999999	0.80000001	5890
6269	es	antonio@duria.es	d80031ff51a3643e748ce58e06617ccb	test	antonio	antonio	t	1	0.69999999	0.80000001	5890
6399	es	euler@ull.es	202cb962ac59075b964b07152d234b70	Ficticio Euler		UsuarioCreadoPorSantiago	t	1	0.69999999	0.80000001	6353
6432	es	lola@terra.es	fceeb9b9d469401fe558062c4bd25954	Lola	Lopez	lola	t	1	0.69999999	0.80000001	6420
6450	es	gece@ulbra.br	603cbba58c893f4e22c491fe78a40bdd	gece	gece	gece	t	1	0.69999999	0.80000001	20
7158	es	77878@hhh.com	7359821dd2d9e4abdc6f13b928bde0ae	787878	777y	alu34	t	1	0.69999999	0.80000001	6272
12187	es	tick@ulbra.com	e5e5c0754f1e26bf915455e21cf2eba5	zoch	tick	tick	t	1	0.69999999	0.80000001	6370
5482	es	adriano@hotmail.com	5e082012573775c13199192bf00694e7	adriano	adri	adriano	t	1	0.69999999	0.80000001	4212
9728	es	nalu@hotmail.es	15dfe787af172038f611dcba30ee7c7c	nalu	nalu	nalu	t	1	0.69999999	0.80000001	6272
10016	es	nnalu@hotmail.com	de3fcd64b666f0f4a079b12be009b6a1	nnalu	nnalu	nnalu	t	1	0.69999999	0.80000001	6272
10957	es	elbecher@bol.com	b122ab10160c66e0ee05c1c9ef6586f6	aluno13	aluno13	aluno13	t	1	0.69999999	0.80000001	40
10958	es	elbecher@bol.com	c58ef999226b607db1ab9c53a3f03896	aluno14	aluno14	aluno14	t	1	0.69999999	0.80000001	40
10959	es	elbecher@bol.com	89fde6e1dca6aa98e2099e7932720a76	aluno15	aluno15	aluno15	t	1	0.69999999	0.80000001	40
10960	es	elbecher@bol.com	17c4c2fe781a42a895711778c2ed2daa	aluno16	aluno16	aluno16	t	1	0.69999999	0.80000001	40
10961	es	elbecher@bol.com	3661d156d58cd0609dde4d86146a49bd	aluno17	aluno17	aluno17	t	1	0.69999999	0.80000001	40
10962	es	elbecher@bol.com	698f5a9a13065480bf218085871e49b2	aluno18	aluno18	aluno18	t	1	0.69999999	0.80000001	40
10972	es	elbecher@bol.com	698dc19d489c4e4db73e28a713eab07b	teste	teste	teste	t	1	0.69999999	0.80000001	40
2446	es	elbecher@bol.com.br	1acc8346c0837dc85674ccd6928c05e7	aluno7	aluno7	aluno7	t	1	0.69999999	0.80000001	40
2456	es	elbecher@bol.com.br	a522a249ee3d8b7b0b92da5f849bc7b1	aluno8	aluno8	aluno8	t	1	0.69999999	0.80000001	40
2436	es	elbecher@bol.com.br	8a432b349ea8af6d0693b0e164fc2e78	aluno6	aluno6	aluno6	t	1	0.69999999	0.80000001	40
6939	es	patrick@ulbra.br	6c84cbd30cf9350a990bad2bcc1bec5f	zoch	patrick	patrick	t	1	0.69999999	0.80000001	6370
13240	es	user02@user.com	d2954386928c499219bbb35fdeff0a05	Nombre_02	Apellido_02	user_det_02	t	1	0.69999999	0.80000001	6272
13241	es	user03@user.com	6e31fdd47743bc0a30cecca27a941c4d	Nombre_03	Apellido_03	user_det_03	t	1	0.69999999	0.80000001	6272
13242	es	user04@user.com	98de842cd100b15045f5893dfe10c838	Nombre_04	Apellido_04	user_det_04	t	1	0.69999999	0.80000001	6272
13239	es	user01@user.com	9e4679a1c821a31b19f6335503bfebd2	Nombre_01	Apellido_01	user_det_01	t	1	0.69999999	0.80000001	6272
13876	es	homa@hotmail.com	322da727ca480a6c425128d190395859	homa	homa	homa	t	1	0.69999999	0.80000001	4212
14894	es	us1@mail.com	144cce165e9b405a014d015e9059a7fd	us1	us_1	us1	t	1	0.69999999	0.80000001	6272
14895	es	us2@mail.com	dddc3c797b55e57459abadac14706030	us2	us_2	us2	t	1	0.69999999	0.80000001	6272
14962	es	alfa@ulbra.br	56aed7e7485ff03d5605b885b86e947e	alfa	beta	alfa	t	1	0.69999999	0.80000001	6370
9214	es	vinicoimbra@hotmail.com		vinicius	vini	vinicius	t	1	0.69999999	0.80000001	4212
20089	es	ana@ulbra.br	276b6c4692e78d4799c12ada515bc3e4	ana	ana	ana	t	1	0.69999999	0.80000001	6370
1804	es	elbecher@bol.com.br	72727b3f3c6600275c1f0274e532341b	aluno1	aluno1	aluno1	t	1	0.69999999	0.80000001	40
1805	es	elbecher@bol.com.br	a9c609ceb9442c9b3921c93d6ed8e202	aluno2	aluno2	aluno2	t	1	0.69999999	0.80000001	40
2273	es	elbecher@bol.com.br	57d5815c795599cd01fb69b3a4e5f230	aluno3	aluno3	aluno3	t	1	0.69999999	0.80000001	40
22685	es	sm1@hotmail.com	bc462bcb287e6c3b66d5c1e885f7c84f	sm1	sm1	sm1	t	1	0.69999999	0.80000001	4212
22721	es	sm5@hotmail.com	c2e285cb33cecdbeb83d2189e983a8c0	sm5	sm5	sm5	t	1	0.69999999	0.80000001	4212
23758	es	ulbra1@hotmail.com	bc462bcb287e6c3b66d5c1e885f7c84f	ulbra1	ulbra1	ulbra1	t	1	0.69999999	0.80000001	4212
23767	es	ulbra2@hotmail.com	3f157cd303b21671711f109da8d32542	ulbra2	ulbra2	ulbra2	t	1	0.69999999	0.80000001	4212
23777	es	ulbra3@hotmail.com	c2dd7c6c86998fe1153f1fa6d6dff00d	ulbra3	ulbra3	ulbra3	t	1	0.69999999	0.80000001	4212
2466	es	elbecher@bol.com.br	556122b33d46ff1302f0d9fd20632e26	aluno9	aluno9	aluno9	t	1	0.69999999	0.80000001	40
3088	es	elbecher@bol.com.br	5e21056c4a49705ee5644a7d6c7f0e1a	aluno10	aluno10	aluno10	t	1	0.69999999	0.80000001	40
3098	es	elbecher@bol.com.br	1076be7000be67823fe673bd28674f07	aluno11	aluno11	aluno11	t	1	0.69999999	0.80000001	40
3108	es	elbecher@bol.com.br	7fd8852b8be4ca274343893832266a02	aluno12	aluno12	aluno12	t	1	0.69999999	0.80000001	40
23786	es	ulbra4@hotmail.com	90e21a7cdc2a5a7168749714e1803f88	ulbra4	ulbra4	ulbra4	t	1	0.69999999	0.80000001	4212
25220	es	pat@ulbra.br	6c84cbd30cf9350a990bad2bcc1bec5f	pat	zoch	pat	t	1	0.69999999	0.80000001	20
26350	es	brunogabriel.santos@hotmail.com	e3928a3bc4be46516aa33a79bbdfdb08	santos	santos	santos	t	1	0.69999999	0.80000001	4212
26407	es	yorhan.colorado@hotmail.com	dc599a9972fde3045dab59dbd1ae170b	yorhan	yorhan	trindade	t	1	0.69999999	0.80000001	4212
26997	es	ulbra5@hotmail.com	c2e285cb33cecdbeb83d2189e983a8c0	ulbra5	ulbra5	ulbra5	t	1	0.69999999	0.80000001	4212
27015	es	ulbra7@hotmail.com	63827ae693c3e6667245263c192e7d0b	ulbra7	ulbra7	ulbra7	t	1	0.69999999	0.80000001	4212
27024	es	ulbra8@hotmail.com	1d028378e12ca6bdafa3b8b21bc5a9ea	ulbra8	ulbra8	ulbra8	t	1	0.69999999	0.80000001	4212
28164	es	ulbra9@hotmail.com	e42b6a82864b7060c447ecebd62518a3	ulbra9	ulbra9	ulbra9	t	1	0.69999999	0.80000001	4212
28173	es	ulbra10@hotmail.com	f6a47a638824180d57f0a561fd5843c6	ulbra10	ulbra10	ulbra10	t	1	0.69999999	0.80000001	4212
28182	es	ulbra11@hotmail.com	91582721be524e4c58484983c73120c9	ulbra11	ulbra11	ulbra11	t	1	0.69999999	0.80000001	4212
28191	es	ulbra12@hotmail.com	b3a076241698f988761fa618286df384	ulbra12	ulbra12	ulbra12	t	1	0.69999999	0.80000001	4212
27006	es	ulbra6@hotmail.con	338c23e8eafc19ec9236404deac0bef4	ulbra6	ulbra6	ulbra6	t	1	0.69999999	0.80000001	4212
28843	es	cris@hotmail.com	7bb0bb352ffb2f5245f25149889a0c76	cristian	cristian	cristian	t	1	0.69999999	0.80000001	4350
28844	es	prof@yahoo.com.br	2b9ff3efc4a999ecfacd18c4bbc57a2e	claudia	clau	claudiag	t	1	0.69999999	0.80000001	4350
28749	es	prof@yahoo.com.br	c6b5486e1588a609ea9a8014bfa4d871	cristian	poeta	cris2	t	1	0.69999999	0.80000001	4350
\.


--
-- Data for Name: work; Type: TABLE DATA; Schema: public; Owner: root
--

COPY work (id, name, creatorid, type) FROM stdin;
4046	pr	72	0
4294	trab4	4210	0
81	prueba	72	0
5965	Duria Gráficos Dinámicos	5890	0
6352	resolução de problemas	20	1
6448	Teide	6420	0
7159	nalu	6272	0
13420	nuevo	6272	0
13485	Test_ccd_01	6272	0
13501	Test_ccd_02	6272	0
13502	Test_ccd_03	6272	0
13503	Test_ccd_04	6272	0
13504	Test_ccd_05	6272	0
13564	teste	40	0
14904	test1biología	6272	0
14922	test2biología	6272	0
14947	test3biología	6272	0
15401	5_serie	40	0
15402	6_serie	40	0
16582	7_serie	40	0
16583	8_serie	40	0
16722	Teste	4212	0
21518	arquitectura	17259	0
22994	test1	6272	1
23014	test2	6272	1
24331	nodo1	6272	0
25263	p5	20	1
25280	pp	20	1
25320	ppp	20	1
25405	pppp	20	1
25498	pe	20	1
25534	pee	20	1
25867	Pensamentos	6370	1
28724	teste2	4212	0
28743	teste	4350	0
28764	pr24	6272	1
28884	teste2	4350	0
28895	teste 3	4350	0
\.


--
-- Data for Name: workgroups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY workgroups (workid, contentgrouppropertyid, groupid) FROM stdin;
4046	2	17
\.


--
-- Data for Name: worknodesinitial; Type: TABLE DATA; Schema: public; Owner: root
--

COPY worknodesinitial (workid, nodeid, workindexcol) FROM stdin;
81	78	0
16722	7821	0
16583	16910	0
4294	4282	0
21518	21517	0
6448	6424	0
24331	6284	0
7159	6285	0
25263	25261	0
25280	25278	0
25320	25314	0
25405	25399	0
25498	25496	0
25534	25496	0
25867	25865	0
28724	7821	0
13420	13222	0
13485	13210	0
13501	13205	0
13501	13204	1
13502	13229	0
13502	13222	1
13503	13200	0
13504	13234	0
13564	13563	0
14904	14607	0
14922	14606	0
14947	14605	0
15401	13563	0
15402	15397	0
16582	16520	0
28764	6286	0
28743	28796	0
28884	28796	0
28895	28797	0
\.


--
-- Data for Name: worknodesobjective; Type: TABLE DATA; Schema: public; Owner: root
--

COPY worknodesobjective (workid, nodeid, workindexcol) FROM stdin;
81	80	0
13485	13202	0
13501	13225	0
4046	4167	0
4294	4290	0
13502	13219	0
13503	13203	0
4046	4159	1
13504	13217	0
6448	6429	0
13564	13557	0
14904	14608	0
14922	14606	0
14947	14600	0
14947	14603	1
14947	14609	2
7159	6287	0
15401	13557	0
15402	15398	0
16582	16519	0
16722	7824	0
16583	16906	0
21518	21512	0
22994	6286	0
23014	6285	0
24331	6286	0
25263	25255	0
25280	25273	0
25320	25309	0
25405	25394	0
25498	25495	0
6352	3583	0
6352	3610	1
25534	25523	0
25867	25860	0
28724	7822	0
13420	13219	0
28764	6284	0
28743	28793	0
28884	28789	0
28895	28789	0
\.


--
-- Name: additionalapplet_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY additionalapplet
    ADD CONSTRAINT additionalapplet_pkey PRIMARY KEY (id);


--
-- Name: conceptmap_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY conceptmap
    ADD CONSTRAINT conceptmap_pkey PRIMARY KEY (id);


--
-- Name: conceptmapgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY conceptmapgroups
    ADD CONSTRAINT conceptmapgroups_pkey PRIMARY KEY (conceptmapid, groupid);


--
-- Name: contentgroupproperties_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY contentgroupproperties
    ADD CONSTRAINT contentgroupproperties_pkey PRIMARY KEY (id);


--
-- Name: courseinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY courseinfo
    ADD CONSTRAINT courseinfo_pkey PRIMARY KEY (courseid);


--
-- Name: courseinfogroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY courseinfogroups
    ADD CONSTRAINT courseinfogroups_pkey PRIMARY KEY (courseinfoid, groupid);


--
-- Name: coursestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY coursestatus
    ADD CONSTRAINT coursestatus_pkey PRIMARY KEY (courseid, learnerid);


--
-- Name: coursestatusgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY coursestatusgroups
    ADD CONSTRAINT coursestatusgroups_pkey PRIMARY KEY (coursestatususerid, coursestatuscourseinfoid, groupid);


--
-- Name: edge_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY edge
    ADD CONSTRAINT edge_pkey PRIMARY KEY (destnodeid, srcnodeid);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: iteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY iteminfo
    ADD CONSTRAINT iteminfo_pkey PRIMARY KEY (activityid);


--
-- Name: iteminfogroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY iteminfogroups
    ADD CONSTRAINT iteminfogroups_pkey PRIMARY KEY (iteminfoid, groupid);


--
-- Name: label_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: manager_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- Name: manualfilegroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY manualfilegroups
    ADD CONSTRAINT manualfilegroups_pkey PRIMARY KEY (manualfileid, groupid);


--
-- Name: manualfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY manualfiles
    ADD CONSTRAINT manualfiles_pkey PRIMARY KEY (id);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: nodequestionrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY nodequestionrelation
    ADD CONSTRAINT nodequestionrelation_pkey PRIMARY KEY (id);


--
-- Name: questiongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY questiongroups
    ADD CONSTRAINT questiongroups_pkey PRIMARY KEY (questionid, groupid);


--
-- Name: questionresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY questionresponse
    ADD CONSTRAINT questionresponse_pkey PRIMARY KEY (id);


--
-- Name: relatedcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY relatedcontent
    ADD CONSTRAINT relatedcontent_pkey PRIMARY KEY (id);


--
-- Name: relatedcontentgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY relatedcontentgroups
    ADD CONSTRAINT relatedcontentgroups_pkey PRIMARY KEY (relatedcontentid, groupid);


--
-- Name: relatedcontentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY relatedcontentinfo
    ADD CONSTRAINT relatedcontentinfo_pkey PRIMARY KEY (id);


--
-- Name: responserelatedcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: graph; Tablespace: 
--

ALTER TABLE ONLY responserelatedcontent
    ADD CONSTRAINT responserelatedcontent_pkey PRIMARY KEY (id);


--
-- Name: respvar_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY respvar
    ADD CONSTRAINT respvar_pkey PRIMARY KEY (id);


--
-- Name: scocommentgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY scocommentgroups
    ADD CONSTRAINT scocommentgroups_pkey PRIMARY KEY (scocommentid, groupid);


--
-- Name: scocomments_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY scocomments
    ADD CONSTRAINT scocomments_pkey PRIMARY KEY (commentid);


--
-- Name: test_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: testgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY testgroup
    ADD CONSTRAINT testgroup_pkey PRIMARY KEY (id);


--
-- Name: testquestionresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY testquestionresponse
    ADD CONSTRAINT testquestionresponse_pkey PRIMARY KEY (testid, testindexcol);


--
-- Name: testquestionresponse_questionresponseid_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY testquestionresponse
    ADD CONSTRAINT testquestionresponse_questionresponseid_key UNIQUE (questionresponseid);


--
-- Name: testusersgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY testusersgroups
    ADD CONSTRAINT testusersgroups_pkey PRIMARY KEY (testuserid, groupid);


--
-- Name: userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (userid);


--
-- Name: work_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY work
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- Name: workgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY workgroups
    ADD CONSTRAINT workgroups_pkey PRIMARY KEY (workid, groupid);


--
-- Name: worknodesinitial_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY worknodesinitial
    ADD CONSTRAINT worknodesinitial_pkey PRIMARY KEY (workid, workindexcol);


--
-- Name: worknodesobjective_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY worknodesobjective
    ADD CONSTRAINT worknodesobjective_pkey PRIMARY KEY (workid, workindexcol);


--
-- Name: fk10fc146f532436dc; Type: FK CONSTRAINT; Schema: public; Owner: graph
--

ALTER TABLE ONLY responserelatedcontent
    ADD CONSTRAINT fk10fc146f532436dc FOREIGN KEY (relatedcontentid) REFERENCES relatedcontent(id);


--
-- Name: fk10fc146f699225fa; Type: FK CONSTRAINT; Schema: public; Owner: graph
--

ALTER TABLE ONLY responserelatedcontent
    ADD CONSTRAINT fk10fc146f699225fa FOREIGN KEY (testuserid) REFERENCES userinfo(userid);


--
-- Name: fk14910224249dd709; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY nodequestionrelation
    ADD CONSTRAINT fk14910224249dd709 FOREIGN KEY (groupownerid) REFERENCES groups(id);


--
-- Name: fk149102243cb53464; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY nodequestionrelation
    ADD CONSTRAINT fk149102243cb53464 FOREIGN KEY (nodeid) REFERENCES node(id);


--
-- Name: fk1bcd3c2127ed80d7; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coursestatusgroups
    ADD CONSTRAINT fk1bcd3c2127ed80d7 FOREIGN KEY (coursestatususerid, coursestatuscourseinfoid) REFERENCES coursestatus(courseid, learnerid);


--
-- Name: fk1bcd3c213fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coursestatusgroups
    ADD CONSTRAINT fk1bcd3c213fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fk1bcd3c21ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coursestatusgroups
    ADD CONSTRAINT fk1bcd3c21ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fk2f6dbd8ec1f748; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY edge
    ADD CONSTRAINT fk2f6dbd8ec1f748 FOREIGN KEY (srcnodeid) REFERENCES node(id);


--
-- Name: fk2f6dbdcadf3186; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY edge
    ADD CONSTRAINT fk2f6dbdcadf3186 FOREIGN KEY (destnodeid) REFERENCES node(id);


--
-- Name: fk2f6dbdd80252de; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY edge
    ADD CONSTRAINT fk2f6dbdd80252de FOREIGN KEY (labelid) REFERENCES label(id);


--
-- Name: fk32ca9ef93cb53464; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY worknodesobjective
    ADD CONSTRAINT fk32ca9ef93cb53464 FOREIGN KEY (nodeid) REFERENCES node(id);


--
-- Name: fk32ca9ef94c1b5ec2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY worknodesobjective
    ADD CONSTRAINT fk32ca9ef94c1b5ec2 FOREIGN KEY (workid) REFERENCES work(id);


--
-- Name: fk33ae021c97e7e8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY node
    ADD CONSTRAINT fk33ae021c97e7e8 FOREIGN KEY (conceptmapid) REFERENCES conceptmap(id);


--
-- Name: fk364492249dd709; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY test
    ADD CONSTRAINT fk364492249dd709 FOREIGN KEY (groupownerid) REFERENCES groups(id);


--
-- Name: fk364492e22f4f70; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY test
    ADD CONSTRAINT fk364492e22f4f70 FOREIGN KEY (testgroupid) REFERENCES testgroup(id);


--
-- Name: fk37c7115e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY work
    ADD CONSTRAINT fk37c7115e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fk4a04f6811f08eda5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY iteminfo
    ADD CONSTRAINT fk4a04f6811f08eda5 FOREIGN KEY (courseid) REFERENCES courseinfo(courseid);


--
-- Name: fk4a04f6815e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY iteminfo
    ADD CONSTRAINT fk4a04f6815e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fk57544b953443d2c3; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY iteminfogroups
    ADD CONSTRAINT fk57544b953443d2c3 FOREIGN KEY (iteminfoid) REFERENCES iteminfo(activityid);


--
-- Name: fk57544b953fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY iteminfogroups
    ADD CONSTRAINT fk57544b953fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fk57544b95ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY iteminfogroups
    ADD CONSTRAINT fk57544b95ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fk5be1300d1f08eda5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coursestatus
    ADD CONSTRAINT fk5be1300d1f08eda5 FOREIGN KEY (courseid) REFERENCES courseinfo(courseid);


--
-- Name: fk5be1300d255e138e; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coursestatus
    ADD CONSTRAINT fk5be1300d255e138e FOREIGN KEY (learnerid) REFERENCES userinfo(userid);


--
-- Name: fk5be1300d5e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coursestatus
    ADD CONSTRAINT fk5be1300d5e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fk6725fd5a3fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY questiongroups
    ADD CONSTRAINT fk6725fd5a3fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fk6725fd5aed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY questiongroups
    ADD CONSTRAINT fk6725fd5aed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fk6af3ad043cb53464; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY worknodesinitial
    ADD CONSTRAINT fk6af3ad043cb53464 FOREIGN KEY (nodeid) REFERENCES node(id);


--
-- Name: fk6af3ad044c1b5ec2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY worknodesinitial
    ADD CONSTRAINT fk6af3ad044c1b5ec2 FOREIGN KEY (workid) REFERENCES work(id);


--
-- Name: fk6d1069d3fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY courseinfogroups
    ADD CONSTRAINT fk6d1069d3fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fk6d1069dac4bb953; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY courseinfogroups
    ADD CONSTRAINT fk6d1069dac4bb953 FOREIGN KEY (courseinfoid) REFERENCES courseinfo(courseid);


--
-- Name: fk6d1069ded058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY courseinfogroups
    ADD CONSTRAINT fk6d1069ded058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fk85b1c5b41f08eda5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY usercourseinfo
    ADD CONSTRAINT fk85b1c5b41f08eda5 FOREIGN KEY (courseid) REFERENCES courseinfo(courseid);


--
-- Name: fk85b1c5b496d116e8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY usercourseinfo
    ADD CONSTRAINT fk85b1c5b496d116e8 FOREIGN KEY (userid) REFERENCES userinfo(userid);


--
-- Name: fk8c96b9d45e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY conceptmap
    ADD CONSTRAINT fk8c96b9d45e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fk91f2c7da1e3a5f50; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY managersgroups
    ADD CONSTRAINT fk91f2c7da1e3a5f50 FOREIGN KEY (managerid) REFERENCES manager(id);


--
-- Name: fk91f2c7daed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY managersgroups
    ADD CONSTRAINT fk91f2c7daed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fka689e20a3fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testusersgroups
    ADD CONSTRAINT fka689e20a3fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fka689e20a699225fa; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testusersgroups
    ADD CONSTRAINT fka689e20a699225fa FOREIGN KEY (testuserid) REFERENCES userinfo(userid);


--
-- Name: fka689e20aed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testusersgroups
    ADD CONSTRAINT fka689e20aed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fkaed5f2d63fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY manualfilegroups
    ADD CONSTRAINT fkaed5f2d63fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fkaed5f2d646d1a944; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY manualfilegroups
    ADD CONSTRAINT fkaed5f2d646d1a944 FOREIGN KEY (manualfileid) REFERENCES manualfiles(id);


--
-- Name: fkaed5f2d6ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY manualfilegroups
    ADD CONSTRAINT fkaed5f2d6ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fkb412ed423fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY relatedcontentgroups
    ADD CONSTRAINT fkb412ed423fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fkb412ed42532436dc; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY relatedcontentgroups
    ADD CONSTRAINT fkb412ed42532436dc FOREIGN KEY (relatedcontentid) REFERENCES relatedcontent(id);


--
-- Name: fkb412ed42ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY relatedcontentgroups
    ADD CONSTRAINT fkb412ed42ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fkb440f895e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY courseinfo
    ADD CONSTRAINT fkb440f895e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fkb5f33c453fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY workgroups
    ADD CONSTRAINT fkb5f33c453fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fkb5f33c454c1b5ec2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY workgroups
    ADD CONSTRAINT fkb5f33c454c1b5ec2 FOREIGN KEY (workid) REFERENCES work(id);


--
-- Name: fkb5f33c45ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY workgroups
    ADD CONSTRAINT fkb5f33c45ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fkb83b39ce3cb53464; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY relatedcontent
    ADD CONSTRAINT fkb83b39ce3cb53464 FOREIGN KEY (nodeid) REFERENCES node(id);


--
-- Name: fkb83b39ce5e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY relatedcontent
    ADD CONSTRAINT fkb83b39ce5e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fkb855cd0d3cb53464; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testgroup
    ADD CONSTRAINT fkb855cd0d3cb53464 FOREIGN KEY (nodeid) REFERENCES node(id);


--
-- Name: fkb855cd0d4c1b5ec2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testgroup
    ADD CONSTRAINT fkb855cd0d4c1b5ec2 FOREIGN KEY (workid) REFERENCES work(id);


--
-- Name: fkb855cd0d699225fa; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testgroup
    ADD CONSTRAINT fkb855cd0d699225fa FOREIGN KEY (testuserid) REFERENCES userinfo(userid);


--
-- Name: fkba823be65e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fkba823be65e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fkba823be65e4ebfc2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fkba823be65e4ebfc2 FOREIGN KEY (additionalappletid) REFERENCES additionalapplet(id);


--
-- Name: fkc4f792f9466efd84; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testquestionresponse
    ADD CONSTRAINT fkc4f792f9466efd84 FOREIGN KEY (testid) REFERENCES test(id);


--
-- Name: fkc4f792f9ee9d5c0e; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY testquestionresponse
    ADD CONSTRAINT fkc4f792f9ee9d5c0e FOREIGN KEY (questionresponseid) REFERENCES questionresponse(id);


--
-- Name: fkc8388f343fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY scocommentgroups
    ADD CONSTRAINT fkc8388f343fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fkc8388f3471c7fb81; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY scocommentgroups
    ADD CONSTRAINT fkc8388f3471c7fb81 FOREIGN KEY (scocommentid) REFERENCES scocomments(commentid);


--
-- Name: fkc8388f34ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY scocommentgroups
    ADD CONSTRAINT fkc8388f34ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fkd66f131311f4ac11; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY scocomments
    ADD CONSTRAINT fkd66f131311f4ac11 FOREIGN KEY (activityid) REFERENCES iteminfo(activityid);


--
-- Name: fkd66f13135e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY scocomments
    ADD CONSTRAINT fkd66f13135e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fkec18ce515e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY manualfiles
    ADD CONSTRAINT fkec18ce515e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: fkf333d0c81c97e7e8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY conceptmapgroups
    ADD CONSTRAINT fkf333d0c81c97e7e8 FOREIGN KEY (conceptmapid) REFERENCES conceptmap(id);


--
-- Name: fkf333d0c83fde4316; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY conceptmapgroups
    ADD CONSTRAINT fkf333d0c83fde4316 FOREIGN KEY (contentgrouppropertyid) REFERENCES contentgroupproperties(id);


--
-- Name: fkf333d0c8ed058b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY conceptmapgroups
    ADD CONSTRAINT fkf333d0c8ed058b34 FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fkf3f34b395e25ac0f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT fkf3f34b395e25ac0f FOREIGN KEY (creatorid) REFERENCES manager(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

