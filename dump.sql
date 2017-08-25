--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: following; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE following (
    following_id integer NOT NULL,
    follower integer NOT NULL,
    followee integer NOT NULL,
    following_since timestamp without time zone NOT NULL
);


ALTER TABLE following OWNER TO vagrant;

--
-- Name: following_following_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE following_following_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE following_following_id_seq OWNER TO vagrant;

--
-- Name: following_following_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE following_following_id_seq OWNED BY following.following_id;


--
-- Name: gamegenres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE gamegenres (
    gamegenre_id integer NOT NULL,
    game_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE gamegenres OWNER TO vagrant;

--
-- Name: gamegenres_gamegenre_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE gamegenres_gamegenre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gamegenres_gamegenre_id_seq OWNER TO vagrant;

--
-- Name: gamegenres_gamegenre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE gamegenres_gamegenre_id_seq OWNED BY gamegenres.gamegenre_id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE games (
    game_id integer NOT NULL,
    name character varying(100) NOT NULL,
    storyline character varying(10000),
    summary character varying(10000),
    cover character varying(10000)
);


ALTER TABLE games OWNER TO vagrant;

--
-- Name: gamesystems; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE gamesystems (
    gamesystem_id integer NOT NULL,
    game_id integer NOT NULL,
    system_id integer NOT NULL
);


ALTER TABLE gamesystems OWNER TO vagrant;

--
-- Name: gamesystems_gamesystem_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE gamesystems_gamesystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gamesystems_gamesystem_id_seq OWNER TO vagrant;

--
-- Name: gamesystems_gamesystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE gamesystems_gamesystem_id_seq OWNED BY gamesystems.gamesystem_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE genres OWNER TO vagrant;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE ratings (
    rating_id integer NOT NULL,
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE ratings OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_rating_id_seq OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE ratings_rating_id_seq OWNED BY ratings.rating_id;


--
-- Name: screenshots; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE screenshots (
    screenshot_id integer NOT NULL,
    screenshot_url character varying(100) NOT NULL,
    screenshot_width integer NOT NULL,
    screenshot_height integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE screenshots OWNER TO vagrant;

--
-- Name: screenshots_screenshot_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE screenshots_screenshot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE screenshots_screenshot_id_seq OWNER TO vagrant;

--
-- Name: screenshots_screenshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE screenshots_screenshot_id_seq OWNED BY screenshots.screenshot_id;


--
-- Name: systems; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE systems (
    system_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE systems OWNER TO vagrant;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(20) NOT NULL,
    account_created timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: usersystems; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE usersystems (
    usersystem_id integer NOT NULL,
    user_id integer NOT NULL,
    system_id integer NOT NULL
);


ALTER TABLE usersystems OWNER TO vagrant;

--
-- Name: usersystems_usersystem_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE usersystems_usersystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usersystems_usersystem_id_seq OWNER TO vagrant;

--
-- Name: usersystems_usersystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE usersystems_usersystem_id_seq OWNED BY usersystems.usersystem_id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE videos (
    video_id integer NOT NULL,
    game_id integer NOT NULL,
    video_url character varying(100) NOT NULL,
    video_name character varying(100) NOT NULL
);


ALTER TABLE videos OWNER TO vagrant;

--
-- Name: videos_video_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE videos_video_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE videos_video_id_seq OWNER TO vagrant;

--
-- Name: videos_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE videos_video_id_seq OWNED BY videos.video_id;


--
-- Name: following_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY following ALTER COLUMN following_id SET DEFAULT nextval('following_following_id_seq'::regclass);


--
-- Name: gamegenre_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamegenres ALTER COLUMN gamegenre_id SET DEFAULT nextval('gamegenres_gamegenre_id_seq'::regclass);


--
-- Name: gamesystem_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamesystems ALTER COLUMN gamesystem_id SET DEFAULT nextval('gamesystems_gamesystem_id_seq'::regclass);


--
-- Name: rating_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings ALTER COLUMN rating_id SET DEFAULT nextval('ratings_rating_id_seq'::regclass);


--
-- Name: screenshot_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY screenshots ALTER COLUMN screenshot_id SET DEFAULT nextval('screenshots_screenshot_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: usersystem_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY usersystems ALTER COLUMN usersystem_id SET DEFAULT nextval('usersystems_usersystem_id_seq'::regclass);


--
-- Name: video_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY videos ALTER COLUMN video_id SET DEFAULT nextval('videos_video_id_seq'::regclass);


--
-- Data for Name: following; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY following (following_id, follower, followee, following_since) FROM stdin;
\.


--
-- Name: following_following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('following_following_id_seq', 1, false);


--
-- Data for Name: gamegenres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY gamegenres (gamegenre_id, game_id, genre_id) FROM stdin;
1	38983	32
2	10232	2
3	10232	31
4	10232	32
5	885	8
6	885	31
7	885	32
8	11529	15
9	11529	26
10	11529	32
11	19081	7
12	19081	15
13	19081	26
14	19081	32
15	19175	32
16	29525	9
17	29525	31
18	29525	32
19	36846	8
20	36846	31
21	36846	32
22	27081	14
23	21063	8
24	21063	31
25	11667	12
26	11667	31
27	17000	12
28	17000	13
29	17000	32
30	7346	12
31	7346	31
32	26764	10
33	19550	7
34	19554	14
35	26765	12
36	26766	12
37	26766	31
38	13197	10
39	26771	12
40	26771	25
41	26771	31
42	26775	12
43	24703	15
44	24703	16
45	24703	32
46	19457	12
47	19457	31
48	13163	2
49	13163	9
50	13163	31
51	25599	8
52	25599	31
53	26761	5
54	8618	8
55	8618	31
56	26831	8
57	26845	12
58	26845	16
59	26848	8
60	26848	31
61	26848	32
62	26872	12
63	26872	31
64	8617	8
65	8617	31
66	8617	32
67	26300	31
68	26300	32
69	14298	25
70	14298	31
71	14298	32
72	26890	8
73	26890	9
74	18861	12
75	18861	31
76	27037	8
77	27037	9
78	27037	15
79	27037	31
80	27037	32
81	6866	9
82	6866	15
83	53790	5
84	26364	5
85	14593	8
86	14593	25
87	14593	31
88	14593	32
89	19220	8
90	19220	9
91	19220	13
92	19220	31
93	19220	32
94	18158	8
95	18158	31
96	18158	32
97	27240	8
98	27240	31
99	27240	32
100	27241	8
101	27241	31
102	27241	32
103	27242	4
104	27242	8
105	27242	32
106	26768	12
107	26768	16
108	36794	4
109	19278	8
110	19278	31
111	19278	32
112	27367	31
113	27367	32
114	27367	33
115	27376	8
116	27376	31
117	27376	32
118	27376	33
119	27377	32
120	2177	31
121	27407	14
122	27407	33
123	17069	5
124	17069	8
125	17069	32
126	27397	7
127	27433	8
128	27433	31
129	27433	32
130	27434	8
131	27434	9
132	27434	32
133	27435	8
134	27435	31
135	27435	32
136	27436	32
137	27438	5
138	27438	8
139	27438	31
140	26363	8
141	26363	32
142	27441	16
143	27443	12
144	27443	32
145	23689	8
146	23689	12
147	23689	31
148	23689	32
149	11247	5
150	11247	8
151	11247	32
152	9567	4
153	9567	8
154	9567	32
155	20392	12
156	20392	31
157	20392	32
158	27378	10
159	11598	9
160	11598	12
161	11598	31
162	11598	32
163	25653	9
164	25653	12
165	25653	13
166	25653	15
167	25653	31
168	25653	32
169	27447	8
170	27447	32
171	25658	7
172	25658	8
173	25658	32
174	27526	5
175	11122	31
176	11122	32
177	27527	33
178	27529	8
179	27529	31
180	27529	32
181	1879	12
182	1879	15
183	1879	31
184	1879	32
185	27532	8
186	27532	9
187	27532	32
188	40968	5
189	40968	12
190	40968	31
191	40968	32
192	27519	5
193	27519	31
194	24440	8
195	24440	31
196	24440	32
197	26760	33
198	8959	8
199	8959	32
200	27534	4
201	27534	32
202	26774	9
203	19576	8
204	19576	31
205	23910	8
206	23910	31
207	23910	32
208	26816	10
209	9484	5
210	9484	10
211	9484	32
212	11070	31
213	11070	32
214	14694	5
215	14694	31
216	10760	8
217	10760	12
218	26780	13
219	26833	5
220	26833	8
221	18975	12
222	18975	31
223	18975	32
224	12875	7
225	27872	31
226	978	31
227	41825	12
228	41825	31
229	41893	9
230	41893	32
231	36856	5
232	36856	8
233	36856	31
234	41812	9
235	41812	31
236	41812	32
237	41826	12
238	41826	31
239	41829	12
240	41829	31
241	27916	12
242	27916	31
243	14545	9
244	14545	32
245	942	9
246	942	32
247	1363	9
248	1363	31
249	1363	32
250	26226	8
251	26226	31
252	26226	32
253	19799	4
254	19799	25
255	20123	31
256	20123	32
257	27505	9
258	44101	12
259	28075	10
260	44078	12
261	44078	31
262	43363	8
263	43363	31
264	43363	32
265	36534	12
266	36534	31
267	10031	8
268	10031	31
269	10031	32
270	28067	31
271	28067	32
272	19729	31
273	19729	32
274	26763	12
275	26763	15
276	26763	31
277	26763	32
278	26857	5
279	26857	32
280	26857	33
281	26759	4
282	28015	31
283	13681	5
284	13681	33
285	26773	4
286	26773	33
287	19452	8
288	19452	31
289	19452	32
290	14393	2
291	14393	31
292	14393	32
293	15429	4
294	1408	5
295	1408	8
296	28412	5
297	28412	33
298	31558	13
299	31558	14
300	28409	5
301	28409	33
302	28416	4
303	28416	33
304	28418	4
305	28418	33
306	2058	5
307	2058	12
308	2058	24
309	28081	14
310	28081	33
311	26870	2
312	26870	32
313	28451	14
314	28452	5
315	28452	33
316	28466	9
317	15426	4
318	26818	13
319	28500	10
320	28500	33
321	28507	4
322	19082	15
323	19082	26
324	19082	32
325	27051	31
326	27051	32
327	121	31
328	121	32
329	19449	4
330	19449	31
331	16932	12
332	16932	31
333	16932	32
334	19002	5
335	19002	8
336	19002	32
337	51407	9
338	51407	12
339	51409	15
340	51408	7
341	28843	13
342	26772	14
343	51518	9
344	51518	25
345	8339	31
346	53655	13
347	37066	5
348	37066	31
349	29143	5
350	29143	8
351	29143	32
352	29529	5
353	29529	8
354	31561	13
355	31561	14
356	31561	15
357	31561	32
358	52190	5
359	52190	25
360	52190	31
361	52191	14
362	28414	12
363	28414	24
364	28414	31
365	26758	8
366	26758	31
367	26769	12
368	26769	24
369	26769	25
370	30206	12
371	51540	14
372	11198	10
373	11198	14
374	11198	32
375	28445	33
376	51998	13
377	51998	15
378	26503	31
379	10910	31
380	51541	10
381	51541	33
382	28069	8
383	28069	31
384	28069	32
385	22783	9
386	22783	31
387	22783	32
388	15276	10
389	15276	31
390	15276	32
391	37137	8
392	37137	31
393	37135	8
394	37135	31
395	37067	7
396	25623	12
397	25623	25
398	35626	12
399	35626	14
400	35626	32
401	1821	12
402	5605	8
403	5605	10
404	5605	31
405	5605	32
406	11078	8
407	11078	31
408	11078	32
409	27261	4
410	27261	5
411	36597	12
412	36597	31
413	36597	32
414	18734	2
415	18734	9
416	18734	31
417	18734	32
418	21062	8
419	21062	31
420	45026	12
421	24474	12
422	24474	24
423	24474	32
424	13555	8
425	13555	12
426	13555	32
427	12511	12
428	12511	31
429	12511	32
430	51950	14
431	51950	33
432	28652	12
433	28652	15
434	28652	31
435	28113	32
436	7621	9
437	7621	31
438	39300	5
439	39300	33
440	54529	9
441	54529	31
442	10960	7
443	10960	10
444	10960	32
445	10960	33
446	23581	5
447	23581	12
448	23581	32
449	32856	32
450	27714	12
451	27714	25
452	27714	31
453	27714	32
454	27239	8
455	11349	9
456	11349	12
457	11349	15
458	11349	16
459	11349	32
460	6066	12
461	6066	25
462	6066	31
463	6066	32
464	8652	31
465	8652	32
466	54565	5
467	54565	33
468	36814	12
469	36814	31
470	54566	14
471	54567	14
472	27419	4
473	27419	32
474	51535	12
475	51535	13
476	51535	31
477	51535	32
478	28493	9
479	9732	31
480	9732	32
481	16992	9
482	16992	31
483	16992	32
484	25795	25
485	16693	31
486	37032	4
487	36777	13
488	42932	10
489	23352	9
490	23352	31
491	23352	32
492	54724	8
493	54724	9
\.


--
-- Name: gamegenres_gamegenre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('gamegenres_gamegenre_id_seq', 493, true);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY games (game_id, name, storyline, summary, cover) FROM stdin;
38983	Promethium	\N	Inspired by classic Commodore 64 and arcade games, Promethium is a hard-as-nails retro inspired side-scrolling shoot-em-up that takes place over numerous of levels that get harder and harder. If you’re after a nice calm casual game this isn’t it!	\N
10232	Thimbleweed Park	\N	Lost along a dusty stretch of highway, the town of Thimbleweed Park once boasted an opulent hotel, a vibrant business district and the state’s largest pillow factory, but now it teeters on the edge of oblivion and continues to exist for no real reason. It’s a town that makes you itch and your skin crawl. It’s a place no one ever looks for, but everyone seems to find.  \n  \nThimbleweed Park is the curious story of two washed up detectives investigating a dead body found in the river just outside of town. It’s a game where you switch between five playable characters while uncovering the dark, satirical and bizarre world of Thimbleweed Park.	//images.igdb.com/igdb/image/upload/t_thumb/jobhkgkrvermtuz9belt.jpg
885	Super Meat Boy	\N	Super Meat Boy is a tough as nails platformer where you play as an animated cube of meat who's trying to save his girlfriend (who happens to be made of bandages) from an evil fetus in a jar wearing a tux.	//images.igdb.com/igdb/image/upload/t_thumb/yvx1hzow339vkpzicsmi.jpg
11529	The Jackbox Party Pack	\N	This collection includes five same-room multiplayer party games. \nA trivia game YOU DON’T KNOW JACK 2015 (1-4 players). \nA bluffing game Fibbage XL (2-8 players), with over 50% more questions added to the original hit game Fibbage. \nA drawing game Drawful (3-8 players). \nWord Spud (2-8 players).  \nLie Swatter (1-100 players). \nPlayers play using their phones, tablets, or computers as controllers.	//images.igdb.com/igdb/image/upload/t_thumb/cyqvrdyujxlycpqytgnf.jpg
19081	The Jackbox Party Pack 2	\N	The sequel to the party game The Jackbox Party Pack, featuring 5 new party games! Phones or tablets can be used as controllers. For up to 8 players plus an Audience of up to 10,000. \nGames included: \nEarwax \nFibbage 2 \nBidiots \nQuiplash XL \nBomb Corp.	//images.igdb.com/igdb/image/upload/t_thumb/km5noitt7lu5etjpduzb.jpg
19175	Rocket Fist	\N	Rocket Fist is an arena game with crazy robots in chaotic rocket fist battles. Aim against your frenemies and prove your dexterity by killing each other with rocket propelled fists in this frenetic mix of dodgeball and billiards! \n \nYou can hold one Rocket Fist at a time and you only get one shot to throw your punch before having to run, hide and dodge to pick it back up! Just like in dodgeball, but with way more rockets! When you’re running away you can ninja dash around the arena, and if you’re feeling lucky you can try dash-bumping your friends in their faces to steal their rocket! \n \nEasy to learn, hard to master, Rocket Fist’s quick rounds will keep you coming back for more. It’s the perfect game to bring out when your friends are over and in need of some explosive action!	//images.igdb.com/igdb/image/upload/t_thumb/brq81hxim7zesjmwg7wa.jpg
29525	Hollow	\N	“I didn't care about this ship… facility… whatever… Had to… Something, deep in my brain, deep in my flesh, boiled inside to remember…” \n \n"In “Hollow,” you are one of the pilots that transports precious resource cargo from the mining ship Shakhter-One down to Earth. One day you wake up in an emergency capsule drifting near the facility. You don’t remember who you are, or how you got out there… All you can remember is an autopilot docking code for capsule dock NR 6. \n \nWhen you dock with Shakhter-One, it is clear that something has gone horribly wrong. The crew is missing and the entire facility is dealing with catastrophic power issues. As you start to uncover the ship’s terrifying secrets, Shakhter-One threatens to take your identity, your sanity, and – ultimately – your life. \n \nThe worst evil is the one that knows us better than we know ourselves. \nThe worst nightmare is the one borne in our past, emotions, fears, and pain."	//images.igdb.com/igdb/image/upload/t_thumb/povccctncr33okrsun6r.jpg
36846	The End Is Nigh	\N	"The End Is Nigh is a sprawling adventure platformer where the player takes control over Ash, one of few “things” that have “survived” the “end of the world”. \n \nFollow Ash as he flops his way through a future of pain and suffering. Feel his stress levels rise as you throw him into an endless swarm of decaying, mutant animal-like creatures and help aid his final epic quest… to simply make a friend (out of pieces of people he finds along his journey). \n \nOh, also you collect video game cartridges and tumors! if that does anything for ya. \n \nFeatures: \n- 600+ levels! \n- 12+ explorable chapters! \n- 20+ collectible and fully playable mini game cartridges! (each with their own tiny achievements!) \n- 80+ achievements that will make you feel good about yourself \n- 100s of collectible little squishy tumors! \n- loads of hidden extras and endings that you will probably see someone else find before you do! \n- and stress!"	//images.igdb.com/igdb/image/upload/t_thumb/fz8ggy5kvjierbg5m01g.jpg
27081	FIFA 18	\N	Powered by Frostbite™, EA SPORTS™ FIFA 18 blurs the line between the virtual and real worlds, bringing to life the players, teams, and atmospheres that immerse you in the emotion of The World’s Game. The biggest step in gameplay innovation in franchise history, FIFA 18 introduces Real Player Motion Technology, an all-new animation system which unlocks a new level of responsiveness, and player personality – now Cristiano Ronaldo and other top players feel and move exactly like they do on the real pitch. Player Control combined with new Team Styles and Positioning give you the tools to deliver Dramatic Moments that ignite Immersive Atmospheres around the world. The World’s Game also takes you on a global journey as Alex Hunter Returns along with a star-studded cast of characters, including Cristiano Ronaldo and other European football stars. And in FIFA Ultimate Team™, FUT ICONS, featuring Ronaldo Nazário and other football legends, are coming to FIFA 18 on PlayStation 4, Xbox One, and PC when the game launches on September 29, 2017.	//images.igdb.com/igdb/image/upload/t_thumb/sdvrxyue8h4vg3ojihfb.jpg
21063	Sonic Forces	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/x1kfyx5ehwnufchjxr7e.jpg
11667	Dragon Quest XI: Echoes of an Elusive Age	A young man who lives in the calm village of Ishi. The protagonist, who began a coming-of-age ceremony when he turned 16, learns an astonishing truth. He is the reincarnation of the “hero” that once saved the world, someone who carries the burden of a major mission… \n \nIn order to confirm his fate with his own eyes, the protagonist leaves his hometown and steps forward to the vast world.	Dragon Quest XI continues the gameplay of previous games in the series, in which players explore worlds and fight against various monsters, including the ability to explore high areas. The Nintendo 3DS version features a different style than the PlayStation 4 version, showcasing 3D graphics on the top screen and 16-bit styled sprites on the bottom screen. Before entering battle, players can also toggle between the 3D and 2D graphical styles. The game features the series' traditional turn-based battle system.	//images.igdb.com/igdb/image/upload/t_thumb/nymavzk8wozligrfgdgk.jpg
13163	Syberia 3	\N	Syberia 3 takes you inside an enchanting, mysterious universe full of life for you to explore in 3D. Plunged into the heart of a world inhabited by a cast of interesting characters, you'll discover and experience a fabulous tale as imagined by Benoit Sokal.	//images.igdb.com/igdb/image/upload/t_thumb/ompmxyihopdrv5syn3rv.jpg
17000	Stardew Valley	You’ve inherited your grandfather’s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home? It won’t be easy. Ever since Joja Corporation came to town, the old ways of life have all but disappeared. The community center, once the town’s most vibrant hub of activity, now lies in shambles. But the valley seems full of opportunity. With a little dedication, you might just be the one to restore Stardew Valley to greatness!	Stardew Valley is an open-ended country-life RPG! You’ve inherited your grandfather’s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home? It won’t be easy. Ever since Joja Corporation came to town, the old ways of life have all but disappeared. The community center, once the town’s most vibrant hub of activity, now lies in shambles. But the valley seems full of opportunity. With a little dedication, you might just be the one to restore Stardew Valley to greatness!	//images.igdb.com/igdb/image/upload/t_thumb/xrpmydnu9rpxvxfjkiu7.jpg
7346	The Legend of Zelda: Breath of the Wild	Link awakes in a mysterious chamber after 100 years of slumber to find that Calamity Ganon has taken over Hyrule Castle and left Hyrule to decay and be taken over by nature.	Step into a world of discovery, exploration and adventure in The Legend of Zelda: Breath of the Wild, a boundary-breaking new game in the acclaimed series. Travel across fields, through forests and to mountain peaks as you discover what has become of the ruined kingdom of Hyrule in this stunning open-air adventure.	//images.igdb.com/igdb/image/upload/t_thumb/jk9el4ksl4c7qwaex2y5.jpg
26764	Mario Kart 8 Deluxe	\N	"Hit the road with the definitive version of Mario Kart 8 and play anytime, anywhere! Race your friends or battle them in a revised battle mode on new and returning battle courses. Play locally in up to 4-player multiplayer in 1080p while playing in TV Mode. Every track from the Wii U version, including DLC, makes a glorious return. Plus, the Inklings appear as all-new guest characters, along with returning favorites, such as King Boo, Dry Bones, and Bowser Jr.! "	//images.igdb.com/igdb/image/upload/t_thumb/ofpojlma3eib4bozxu4e.jpg
19550	Just Dance 2017	\N	Grab your friends and family: it’s time to dance! Just Dance is back with over 40 new tracks, 6 games modes, and ever more songs through Just Dance Unlimited subscription service! Featuring the ultimate tracklist including Cheap Thrills by Sia Ft. Sean Paul, Sorry by Justin Bieber and many more!	//images.igdb.com/igdb/image/upload/t_thumb/zcysnxvf8dmqs3idnqu9.jpg
19554	Steep	\N	Ride a massive open world of the Alps and Alaska, where the powder is always fresh and the run never ends.Defy and master the world’s most epic mountains on skis, wingsuit, snowboard, and in paraglide. Go solo or drop in side by side with other players. Record and share the most insane stunts ever captured, then challenge the world to beat your best tricks, ride your custom lines, and relive your most epic wipeouts.	//images.igdb.com/igdb/image/upload/t_thumb/hwan8wag6ype4xpiu1gv.jpg
26765	Project OCTOPATH TRAVELER	\N	\N	\N
26766	Xenoblade Chronicles 2	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/vtjntaqkvbcsyp6dji1m.jpg
13197	Redout	\N	2560 AD: Humanity moved to Mars and some of Titan’s moons. The most followed and expensive sport is a high-speed racing class employing magnetic hoverships, the fastest humanity has ever engineered: a sport named RED:OUT. \n \nThe art style goes for something we called futuretro. Low-poly meshed and landscapes blend in with the latest state-of-the-art shading and lighting effects, creating a beautiful mixture. From dirty suburban environments to eerie frozen landscapes, to vast desert plains, this style applies equally well. Red:Out is developed in Unreal 4. Controlling a nuclear-powered ship hovering about two meters from the ground going over 400 km/h is no piece of cake Now, imagine doing the same in a vicious curve upside down, or in a double loop-the-loop. Your ship will never race on rails. Each input will apply a physical force!	//images.igdb.com/igdb/image/upload/t_thumb/gur29oelgdc8uq0fiuhm.jpg
26771	Dragon Quest Heroes I•II	\N	Dragon Quest Heroes 1 and 2 will be packaged together and include all the extra content released for the PS3, PS4, and PS Vita versions of the game.	//images.igdb.com/igdb/image/upload/t_thumb/pfvivqbo5kadg8edpbyu.jpg
26775	Shin Megami Tensei HD Project	\N	Unnamed Shin Megami Tensei game teased for the Nintendo Switch.	\N
24703	Dungeon of Zaar	On the edge of a magical world, awaits the Dungeon of Zaar, home of the great, eponymous Archmage. Over a century has passed since his last appearance, and now all eyes are on the Dungeon, eager to claim a share of the spoils within.  \n  \nYou are an Explorer, leading a team of mercenaries (Knights, sorcerers, and monsters of all kinds) to plunder whatever treasures are hidden in the depths of the Dungeon. But beware! You are not the only one who has had the same idea…	Dungeon of Zaar is a turn-based strategy game taking place in an ancient and magical castle where Explorers fight for treasures! For PC/MAC/Linux at launch. \n \nDungeon of Zaar is inspired by classic tactical games such as Final Fantasy Tactics, Advance Wars and by great strategy games such as Warhammer, Pokémon and Magic the Gathering. Nevertheless, the game is different from your standard tactical-RPG, we want it to be focused only on strategic decisions and have a huge emphasis on combat.   \n \nPlayers will create their own Dungeon Explorer and take part in intense battles in the Dungeon either on single player mode or PvP online or local hot seat mode with their friends around one computer. \n \nExplorers don't come alone into the Dungeon. They are the brains, but not the brawn! They are escorted by a squad of Mercenaries recruited from around the Kingdom to protect them and help them forge onward.	//images.igdb.com/igdb/image/upload/t_thumb/xtefy272qwb62qzqosbu.jpg
19457	The Elder Scrolls V: Skyrim Special Edition	\N	Skyrim special edition is a remaster of the classic from 2011. Now with upgraded visuals along with Xbox One and PS4 Releases. \n \nSkyrim reimagines and revolutionises the open-world fantasy epic, bringing to life a complete virtual world open for you to explore any way you choose. \n \nLIVE ANOTHER LIFE, IN ANOTHER WORLD \nPlay any type of character you can imagine, and do whatever you want; the legendary freedom of choice, storytelling, and adventure of The Elder Scrolls is realised like never before. \n \nALL NEW GRAPHICS AND GAMEPLAY ENGINE \nSkyrim’s new game engine brings to life a complete virtual world with rolling clouds, rugged mountains, bustling cities, lush fields, and ancient dungeons. \n \nYOU ARE WHAT YOU PLAY \nChoose from hundreds of weapons, spells, and abilities. The new character system allows you to play any way you want and define yourself through your actions. \n \nDRAGON RETURN \nBattle ancient dragons like you’ve never seen. As Dragonborn, learn their secrets and harness their power for yourself.	//images.igdb.com/igdb/image/upload/t_thumb/fbwtoie90jibxgkrf6mx.jpg
25599	Monster Boy and the Cursed Kingdom	\N	"A legendary game series returns with an all-new adventure! Monster Boy is a colourful side-scrolling action adventure created in cooperation with Ryuichi Nishizawa, the creator of the Wonder Boy Monster World series (Trademark of SEGA Corporation Japan).  \n \nMonster Boy is being created to bring back the enjoyment of classic games that shine by simplicity. Pure, exciting gameplay; upbeat music and smooth graphics. You'll need to overcome huge bosses, find hidden passages, discover powerful equipment and use all your wits and skills to remove a powerful curse. Monster Boy can transform into 5 different creatures, each with their own skills and abilities. Take advantage of all the unique powers to open new paths and advance in an epic story. Monster Boy is a love letter to gaming from the 80's and 90's - will you join us and celebrate together with us?"	//images.igdb.com/igdb/image/upload/t_thumb/wxeylqigs1zote2p1azt.jpg
26761	Splatoon 2	\N	Splatoon 2 is a multiplayer third-person shooter in which players control characters known as Inklings and use colored ink to attack opponents and clear goals. Inklings can alternate between humanoid form, during which they can fire ink with their weapons, and squid form, which allows them to swim through ink of their own color in order to move quickly and replenish ink supplies.	//images.igdb.com/igdb/image/upload/t_thumb/yq4oooogaox1auiccpw1.jpg
8618	2 Fast 4 Gnomz	\N	"In this colorful arcade platform runner you will swoosh, spring, and swoop through over a hundred challenging courses. Think fast, tap faster – avoid devious traps, find the best route, and collect all the magical socks on your way to the finish line. Geki Yaba Runner tells a tale of the speedster gnomes on a quest to collect magic socks, save all the princesses, slay all the dragons, and… Well, that might just be a gnome fairytale, but the socks and the speed part is true, we swear! Answer the challenge of the magical kingdom, conquer the hardest racing tracks, laugh at danger (ha, ha!), and become the supreme gnomish speedster in Geki Yaba Runner, free on App Store and Google Play!"	//images.igdb.com/igdb/image/upload/t_thumb/difm9w4nwammlscznmvu.jpg
26831	Audio Hero	\N	\N	\N
26845	Fire Emblem for Nintendo Switch	\N	Temporary title for the Fire Emblem game being developed for the Nintendo Switch that is planned for release in 2018.	\N
26848	Shovel Knight: Treasure Trove	\N	Shovel Knight: Treasure Trove is the new name for the base Shovel Knight game. It will get all future updates and content for free just like before. \nIt will launch first on the Switch, during the systems launch window, and on all other platforms in April 2017. All owners of the previous version, across all platforms, will be upgraded to the new version of the game for free.	//images.igdb.com/igdb/image/upload/t_thumb/ep9ew6iukeoymlf6nabr.jpg
26872	The Sacred Hero	\N	A project in early development teased for PC and Nintendo Switch.\r\nThe name isn't final and the sword in the teaser is a placeholder.	\N
8617	1001 Spikes	"Jim Hawkins, the world-renowned archaeologist, has gone missing while exploring the frozen reaches of Antarctica. \n \nBefore his disappearance, he entrusted his daughter Tina with a map to the long forgotten ruins of Ukampa Temple in South America, along with a letter warning that death waits behind its every corner. \n \nIn that letter, he posed a challenge to his estranged son, Aban Hawkins: to venture forth into the deadly ruins in search of a legendary treasure rumored to lie behind the Golden Door of Poko-Mum. \n \nCan Aban survive the endless traps of Ukampa and surpass his famous father once and for all?"	Aban Hawkins & the 1000 Spikes is an 8-bit retro style "Hardest Extremest Craziest Platform Action Puzzle Adventure." Simple & intuitive rules. Elaborate level design. Various fierce traps, traps, traps! Return to the Golden Years of Video Game. No one can BEAT this game ... except you.	//images.igdb.com/igdb/image/upload/t_thumb/qhmhm41p4tce9xzsxjvs.jpg
26300	Seasons of Heaven	\N	\N	\N
14298	Zombie Vikings	Loki just snatched Odin's last magic eye right out of his eye-socket and hastly gangled off with it. Thor and the gods are too busy partying, so blind as a bat, Odin makes a desperate move. He raises four of the most fearsome Zombie Vikings out of Norse soil - Gunborg, Seagurd, Hedgy and Caw-kaa! A putrid posse sent on a mission through the most epicness of worlds to retrieve The Eye and make peace with their rotten pasts.	From the creators of indie smash hit Stick It to The Man! comes a new one to four-player co-op stab-you-in-the-gut-a-thon. Embark on a dead funny adventure with the Zombie Vikings. A putrid posse sent on a mission through the most epic of worlds to retrieve Odin’s lost eye. \n \nPlay as the most fearsome Vikings ever raised from Norse soil – Gunborg, Seagurd, Hedgy and Caw-kaa. Hack through the gingerbread swamps of Molgaga! Cruise through the intestines of the Midgaard Serpent! Fight giant poultry!	//images.igdb.com/igdb/image/upload/t_thumb/rhewlpv40jmxgpuadvyz.jpg
26890	The Unlikely Legend Rusty Pup	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/uq388hvhypxirkc62kcq.jpg
18861	I Am Setsuna	"The island had a custom. \nTo maintain peace, once a decade, a sacrifice was offered to a fiend on the island. However, one year, the fiend grew violent before the next sacrifice was due. Those living on the island were afraid and tried to calm the fiend by offering a sacrifice; Setsuna, chosen because of her powers of enchantment. Setsuna must leave with her safeguards for the farthest land, where the ceremony of sacrifice will be held."	I Am Setsuna introduces the authentic JRPG style of yesteryear to PlayStation®4 and Steam! Journey with Setsuna as she prepares to make the ultimate sacrifice and save the people of her land. A powerfully nostalgic experience, blending a classic style of story-telling, battle system and gameplay.	//images.igdb.com/igdb/image/upload/t_thumb/qwrv3hpaivxj9rz1akyv.jpg
27037	Puzzle Box	\N	Puzzle Box is painting with creative gameplay! Create fantastic pixel art images, by dropping your colour paint blocks in the correct place across the levels.	//images.igdb.com/igdb/image/upload/t_thumb/fru1ojxtey9lc3kevp5y.jpg
6866	Puyo Puyo Tetris	\N	"Two puzzle game juggernauts collide as Tetris, one of the largest-selling and recognized brands in gaming history, and Puyo Puyo from SEGA have combined to create a fun-to-play, fast-paced, competitive party game like no other! The game has tons of different styles of gameplay – from the single-player Adventure and Challenge modes to the ferocious competition of the up-to-four player Arcade modes. There's plenty of Tetris/Puyo variety, even an in-game Shop where players can unlock new characters, new skins for Puyos and Tetriminos, new backgrounds and more."	//images.igdb.com/igdb/image/upload/t_thumb/wetzrgzw2ehzaannvvgz.jpg
53790	Resident Evil Revelations Collection	\N	\N	\N
26364	The Binding of Isaac: Afterbirth+	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/ucnjgihy2jthtspbkwrh.jpg
43363	Slime-san: Blackbird's Kraken	\N	A free expansion to the game Slime-san that is also available as a standalone game. \n \n"The notorious Blackbird's kracked, I mean, cracked! He believes Slime-san stole his treasure and unleashed his giant Kraken upon him! Sound familiar? It is now up to Slime-san to escape the giant squid's jaws back out to freedom!"	//images.igdb.com/igdb/image/upload/t_thumb/kd6uhzkcb8dofa86rnlk.jpg
14593	Hollow Knight	\N	"Currently under development, Hollow Knight is the first game by Team Cherry, an indie games team comprised of 3 people based in South Australia.  \n  \nHollow Knight is a challenging, beautiful action adventure game set in the vast, inter-connected underground kingdom of Hallownest. A 2D action game with an emphasis on skill and exploration, Hollow Knight has you fighting a fearsome host of deadly creatures, avoiding intricate traps and solving ancient mysteries as you make your own way through fungal wastes, forests of bone, and ruined underground cities.  \n  \nThe atmosphere is eerie and sometimes unnerving, but there is a good-hearted core of humour and levity in there too, especially when conversing with all of the weird and wonderful NPCs you’ll find along the way. Hollow Knight has beautiful traditional art, fluid and responsive action, challenging but fair gameplay, and an incredible, bizarre insect world begging to be explored and conquered.  \nFeatures  \n  \n  - A beautiful, eerie world of insects and heroes.  \n  - Traditional 2D animation brings creatures and characters to life.  \n  - Challenging gameplay that can be difficult but always fair.  \n  - Fluid and responsive action allows you to flow through combat like water.  \n  - A collection of challenging “feats” the most skilled players can strive for.  \n  - Find powerful new abilities and spells on your adventure to grow stronger and open new paths.  \n  - Speak with a weird, intriguing cast of characters.  \n  - Explore a vast, connected underground world.  \n  - Scour the world for hidden secrets – powerful artifacts, piles of riches, and surprising encounters.  \n  - Go Dream Diving! Venture into the minds of friends and enemies and discover the strange worlds that await within.  \n  - Head to town to seek advice, purchase new items, and chat with quirky townsfolk.  \n  - Hidden areas full of the toughest challenges and battles, for expert players.  \n  - Ancient mysteries hidden about the world waiting to be solved by the most observant investigators."	//images.igdb.com/igdb/image/upload/t_thumb/llhtucsjtyev2ilhtogq.jpg
19220	Snake Pass	\N	Welcome to Snake Pass; a physical action-puzzle game that sees the player slither, curl and climb their way through increasingly challenging worlds filled with evermore intricate obstacles and fiendishly mind-bending objectives!   \n   \nSnake Pass is the wriggling brain-child of Seb Liese, who originally came to Sumo from Holland to work on the LittleBigPlanet team. His prototype of ‘real snake physics’ captured the entire studio’s imagination and we’re really proud of the results so far!	//images.igdb.com/igdb/image/upload/t_thumb/cpf5tiv6ykwjfxjgtvwv.jpg
18158	Ultimate Chicken Horse	\N	Ultimate Chicken Horse is a party platformer that flips between strategic level building and intense platforming. \n \nBuild the level by placing blocks, projectiles, traps, and hazards, then try to reach the flag. If you can make it but your friends can’t, you get points! Repeat the process as you place more platforms to make the level crazier and more dangerous, and try to screw your friends over without screwing yourself. The result of this unique game flow is that every player becomes a designer and a player at once, responsible for creating dastardly levels without ever feeling like they're really going into "level editor" mode. \n \nYou score points for reaching the end of the level (as long as at least one other person fails), for getting there first, for placing traps that stopped other players, for being the only one to reach the end, or for picking up coins placed by players and bringing them to the end of the level.	//images.igdb.com/igdb/image/upload/t_thumb/rqwxhildfrdvqpygxmp8.jpg
27240	Shovel Knight: Shovel of Hope	\N	The standalone version of the original Shovel Knight campaign.	//images.igdb.com/igdb/image/upload/t_thumb/jdngholamhwkcwpda9f9.jpg
27241	Shovel Knight: King knight's Campaign	\N	This game is the final planned free campaign included in the main game, Shovel Knight, and its updated title, Shovel Knight: Treasure Trove. The game will also be available as a standalone title on PC, PS4, Xbox One, and Nintendo Switch.	\N
27242	Shovel Knight: Battle Mode	\N	\N	\N
26768	Disgaea 5 Complete	"In a galaxy, darker than the pitch blackness of the universe, countless Netherworlds exist. In each Netherworld, there is an Overlord who reigns over its hot-blooded demons, and maintains the balance of the Netherworlds by keeping each other in check. But the sudden appearance of Demon Emperor Void Dark and his army, Lost, has ravaged many Netherworlds, forcing them to surrender. \n \nAt the same time, there's been a young demon that stands alone against the growing powers of Lost. His name is Killia. He is an unknown demon that swore to take revenge on Demon Emperor Void Dark, and defeat the Lost that's been destroying various Netherworlds. Unexpectedly, he happened to save Princess Overlord Seraphina. Killia, accepted by Seraphina as a capable servant, has begrudgingly agreed to accompany her to overthrow Void Dark..."	Full story of the original with 8 new scenarios, 4 fan favorite characters, and 3 character classes from the Disgaea series.	//images.igdb.com/igdb/image/upload/t_thumb/slwwcczkkht0ecpu6kzs.jpg
36794	Pokkén Tournament DX	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/nl7kyvmrqhxffxkqrq3h.jpg
19278	Poi	\N	Poi is a 3D adventure platformer throwback to the 90s era of classic platforming games. Explore big worlds, compete in challenge levels, meet quirky characters and pull off classic platforming feats on a journey to become a Master Explorer.	//images.igdb.com/igdb/image/upload/t_thumb/nkhwhiv57puvjzysp2v2.jpg
27367	Yoku's Island Express	\N	Yoku’s Island Express is an open world/metroidvania-style pinball adventure, Seamlessly blending platform navigation with pinball mechanics across a large open world. Yoku the dung beetle sets foot on the beach of Mokumana Island, ready to take on the duties as the new postman. But the ancient island God is trapped in a restless sleep and the islanders are plagued by quakes and storms brought forth by its nightmares. Yoku's Island Express is a unique and quirky adventure with handcrafted visuals, where you’ll soar through the air, vacuum explosive snails, fight a Screetch, feed starving lemurs, discover the mystery of the Fruit Altar, wake an old god, and hopefully help tiny Yoku rebuild the island post-office.	//images.igdb.com/igdb/image/upload/t_thumb/frergqbaiiaxiq4ipd67.jpg
27376	Battle Princess Madelyn	\N	Battle Princess Madelyn is a game that follows the journey of a young knight in training, Madelyn, and her ghostly pet dog, Fritzy. They set out on a journey to save her kingdom and her family from the clutches of an evil wizard.	\N
27377	Sunu Ikkibu: Din Nahu	\N	A horror game in development.	//images.igdb.com/igdb/image/upload/t_thumb/fodzmivpqb4jhuoahqn9.jpg
2177	LEGO City Undercover	Chase McCain returns to LEGO City after years of being away. The city that once embraced him now in the throes of a massive crime wave the likes of which have never been seen only once before.	As Chase McCain, you'll become an expert at hand-to-hand combat, fighting your foes and wrestling them to the ground until you can slap the cuffs on 'em. The best officers are also pros at free running, jumping, climbing, and traversing the city on special blue and white bricks. Do you have what it takes?	//images.igdb.com/igdb/image/upload/t_thumb/gctqgrslwfyhpgwlvafq.jpg
27407	Old Time Hockey	\N	Aggressive hockey is back! Experience hockey the way it was meant to be played in this old school arcade style hockey game where blood on the ice is just another day at the rink. Big moustaches, no helmets, dirty hits, bench-clearing brawls, goalie fights, and stick fights – that’s Old Time Hockey.	//images.igdb.com/igdb/image/upload/t_thumb/zecckg1syf8eyv2zdenb.jpg
17069	RIVE	"When space scavenger Roughshot gets trapped on a mysterious starship, he has to form a surprising alliance. Don't care about the story? Just shoot the messenger. Literally."	This is a 2D shooter / platformer with old school gaming values in a decidedly new school execution. During the intense 360 degree shooting and platforming action, players learn to alter the behavior of their robotic enemies by collecting and uploading hacks.	//images.igdb.com/igdb/image/upload/t_thumb/i1zqucdyydo7jnlewylp.jpg
27397	VOEZ	\N	VOEZ is played by touching falling notes in time with the music. \n \nSet in a fictional town named Lan Kong Town, which is modelled after Yilan in Taiwan, the story is centred around six high school students who form a band that eventually achieves international fame. \n \nGameplay is simple, requiring players to touch vertically falling notes that have hit a bar on the bottom of the screen. \n \nDepending on the song, the number of lanes for the notes increases and they shift side to side, making the screen look as if it is dancing to the music. \n \nThere are over 100 songs in the library. Three difficulty levels Easy, Hard and Special are available. Players are able to choose difficulty levels according to their skill so they may enjoy all pieces.	//images.igdb.com/igdb/image/upload/t_thumb/gtysvdmk348wgw44q1nl.jpg
27433	SteamWorld Dig 2	"In search of her lost friend, a lone steambot and her unlikely companion must dig deep, gain riches and explore an underworld riddled with danger. But time is running short…"	SteamWorld Dig 2 hits Steam in 2017! Dig deep, gain riches and unearth the terrors of the underworld in this platform mining adventure forged in Metroidvania flames. Wishlist today!	//images.igdb.com/igdb/image/upload/t_thumb/y1s2ma7mudyhpxytholb.jpg
27434	Flipping Death	\N	Help the ghosts with their curious problems while also solving the mystery surrounding your own demise in this new puzzling adventure from Zoink Games.	//images.igdb.com/igdb/image/upload/t_thumb/od2szgivbhfpty9yurzo.jpg
27435	Dandara	\N	\N	\N
27436	Kingdom: Two Crowns	\N	In Kingdom: Two Crowns, attend to your domain, border to border, or venture into the wild to discover its wonders and threats.	\N
27438	Blaster Master Zero	"One day, a young man named Jason Frudnick, known for being a genius in the field of robotic engineering, discovered a strange creature that he has never seen before. \nNo records of this mysterious creature could be found, so Jason gave it the name "Fred" and took it to his lab to begin closely observing it. \n \nShortly after that, an accident occurred in the lab and Fred managed to escape.Fred jumped into a hole that seemingly appeared out of nowhere.Jason followed, and before he knew it, he found himself in a cave where the battle vehicle “SOPHIA III” awaited him. \n \nWith his curiosity in this incredibly high tech vehicle piqued, Jason hopped abroad SOPHIA III and began his adventure in the vast subterranean world in search of Fred."	\N	//images.igdb.com/igdb/image/upload/t_thumb/x5plv6hstlcvc36szjrc.jpg
26363	Splasher	\N	Splasher is a 2D platformer that offers arcade action. With a powerful and surprising paint canon the player will have to face great challenges and use all his skills to rescue the Splashers. These little fellows are working as peons in a big factory, Inkorp. The Evil ruler of the company, Le Docteur, has insane plans that threatens them all with a terrible fate.  \n  \nAlong his journey, the player will have to master the power of his paint cannon. He will soon find out that each color offers special abilities, from crazy bouncing to sticking to walls, or even tricking encounters and changing their behaviour. The game will offer more than twenty levels, a time attack mode with leaderboards, epic boss fights and many other cool features.	//images.igdb.com/igdb/image/upload/t_thumb/umocg8dhuu8s9g3bmsab.jpg
27441	Wargroove	Wargroove is a modern take on the simple yet deep turn-based tactical gameplay popularised in the 2000s by handheld games such as Advance Wars. As big fans of those games we were disappointed to find that nothing in this genre was available on current generation platforms and set out to fill the gap ourselves. Wargroove aims to recreate the charm and accessibility of the titles that inspired it whilst bringing modern technology into the formula. This modern focus allows for higher resolution pixel art, robust online play and deep modding capability, ultimately creating the most complete experience for Advance Wars and TBS fans.	Wargroove is a turn-based strategy game for up to 4 players, in which each player takes control of an army and its commander unit to wage war on their enemies! Wargroove is extremely easy to pickup, with accessibility at the forefront of its design, and very difficult to master, with deep gameplay mechanics that complement strategic play.	//images.igdb.com/igdb/image/upload/t_thumb/c7mz0xbo65jogd2wuerc.jpg
27443	Away: Journey to the Unexpected	\N	AWAY: Journey to the Unexpected is a colorful first person adventure game that combines action, negotiation and rogue-lite elements \n \nProgress through the levels and the story, choose your path, but above all, recruit allies. All the strange characters you meet in game can be played in first person, and it’s up to you to find the right answers to get them to join your team! \n \nIdiotic workmen, mysteries from outer space, oddball friends, and fast combat await!	//images.igdb.com/igdb/image/upload/t_thumb/qgfbje6fzplueh9dotxn.jpg
23689	Battle Chef Brigade	"If memory serves me right, it was starving northern protectors who discovered how to safely consume monster meat. \nThe warriors gained renown for using their fighting skills to create the wildest dishes the people had ever tasted. \nThose elite hunters formed the Battle Chef Brigade, promising to protect the lands and feed the people."	"Battle Chef Brigade features fantasy chefs, including Orcs, Elves, and Humans, who need to hunt dangerous monsters for ingredients. With those ingredients, before the critical eye of the judges, the chefs create culinary masterpieces in an intense tournament. Battle Chef Brigade pairs one part combo-based action hunting and one part puzzle-based cooking, all as the round clock ticks down."	//images.igdb.com/igdb/image/upload/t_thumb/vl80lld6xi64lyixasx9.jpg
11247	Duck Game	\N	Enter the futuristic year of 1984, an age where ducks run wild in a frantic battle for glory!	//images.igdb.com/igdb/image/upload/t_thumb/exfxxkxnq7lx5v2lrcuq.jpg
9567	Towerfall Ascension	\N	Enter the land of TowerFall with your friends and engage in the noble and brutal tradition of bow-and-arrow combat. TowerFall is an archery combat platformer for 1-4 players, with an arcade co-op mode and hilarious, intense versus matches. The core mechanics are simple and accessible, but combat is fast and fierce. The focus is on player mastery and friendly rivalry.	//images.igdb.com/igdb/image/upload/t_thumb/dinoki4ts8kw1wwzaob7.jpg
16693	Tiny Barbarian DX	\N	Tiny Barbarian DX is an action-packed sword 'em up inspired by fantasy pulp fiction. Like those short stories, the game is split into four distinct episodes, each with a new setting, new enemies, and new music! Best of all, when you buy the game, you will get all other episodes as they become available! Episode 1 is available now, with more coming soon! What are you waiting for? It's Time to Get Tiny!	//images.igdb.com/igdb/image/upload/t_thumb/c2uezfzcj2s1s7k22isq.jpg
20392	Portal Knights	Travel between randomly generated 3D sandbox worlds — each one with unique environments, creatures, and resources for crafting. Explore caves, mineshafts, and dungeons filled with surprises. \n \nIn order to travel to different worlds, the player will need to collect Portal Shards, which can then be crafted into Portal Stones. By placing the Portal Stones in Portal Structures, the player will then be able to access a new world. \n \nThere are currently 44 different islands to visit.	Leave the familiar world behind and step into the fantastic unknown with Portal Knights! Play with your friends in this action-packed crafting adventure across dozens of sandbox islands connected by ancient portals. \nNo one can remember how long it’s been since the peaceful world was torn apart by The Fracture, plummeting it into darkness. Is there any soul brave enough to reunite the shattered realm? Craft your adventure. Forge your hero. Become the ultimate Portal Knight!	//images.igdb.com/igdb/image/upload/t_thumb/c3gamebmgvlzdqcghvzp.jpg
27378	RISE: Race The Future	\N	A racing game with futuristic cars, by automotive designer Anthony Jannarelly, using next-gen technologies.	\N
11598	Ittle Dew 2	\N	"Float ashore on a strange island \nIttle and Tippsie crash onto yet another island filled with loot, puzzles and mysterious inhabitants! With the help of a magical map, they set out to steal eight pieces of a raft from increasingly improbable locations including beaches, prairies, an art exhibit and some dude's basement. \n \nWield magical weapons \nDiscover four weapons that double as puzzle solving items, and upgrade them by finding additional copies. Secret artifacts abound in the island's many hidden caves, all of which can be found and solved with your starting equipment! \n \nAdventure your own way \nWho needs a map, anyway? Tackle the first seven dungeons in any order, and use your items to open various shortcuts within. The craftiest of adventurers have more than one way to open a locked door."	//images.igdb.com/igdb/image/upload/t_thumb/wtvgudvymgzcx8qteqz4.jpg
25653	The Escapists 2	\N	The Escapists 2 is the forthcoming sequel to the multi-million selling, award-winning sandbox prison-escape game which will include, in a first for the series, drop in/drop out play for up to four players in both local and online play. \n \nEscaping won't be easy though. You'll have to work around the strict prison schedule and avoid the unwanted attention of guards. Craft weapons and tools found (or stolen) from within the prison, but beware of cell shakedowns. Get a job or perform “favours" for your fellow inmates to purchase vital supplies, all while scouting escape routes.	//images.igdb.com/igdb/image/upload/t_thumb/ciec8jb54s8udpqfqffl.jpg
27447	Treasurenauts	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/bo56lbsmxg7cu14kxtqe.jpg
25658	Runner 3	\N	Runner3 continues the joyous adventures of CommanderVideo from BIT.TRIP RUNNER and Runner2. Players will encounter quests, branching paths, new character moves, new Retro Challenges, and a roster of characters that somehow manages to rival the strangeness of Runner2.	\N
27526	Space Dave!	\N	\N	\N
11122	ToeJam & Earl: Back in the Groove	\N	Toejam & Earl: Back in the Groove is the 4th entry in the Toejam & Earl series, entirely funded by Kickstarter support and meant to be a return to the root of the original title from Sega Megadrive/Genesis. \n \nIt will feature up to 4 player cooperative gameplay split screen and online	//images.igdb.com/igdb/image/upload/t_thumb/npqkpemaem0ur4qpjqx5.jpg
27527	Vroom in the night sky	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/wdyfjsazbmqo5waamuqm.jpg
27529	Unbox: Newbies Adventure	\N	An updated version of the game Unbox.	//images.igdb.com/igdb/image/upload/t_thumb/ft3ziybzc0filum918dk.jpg
1879	Terraria	\N	Dig, fight, explore, build! Nothing is impossible in this action-packed adventure game. The world is your canvas and the ground itself is your paint. \n \nGrab your tools and go! Make weapons to fight off a variety of enemies in numerous biomes. Dig deep underground to find accessories, money, and other useful things. Gather resources to create everything you need to make the world your own. Build a house, a fort, or even a castle. People will move in to live there and perhaps even sell you different wares to assist you on your journey. \n \nBut beware, there are even more challenges awaiting you... Are you up to the task?	//images.igdb.com/igdb/image/upload/t_thumb/ry7nrqg61chchemfakc2.jpg
27532	sU and the Quest for meaning	\N	sU is an endless platformer where the score is a puzzle.	\N
40968	Original Journey	\N	Join the forces of the Ato as they set off on a journey across the universe to save their planet from a slow death. Find out how far one species is willing to go to save itself in this gorgeous hand drawn action adventure from Bonfire Entertainment.	\N
27519	Rogue Trooper: Redux	\N	Rogue has been completely remade from the ground up using current-gen quality materials and higher resolution geometry. He sports a new look, based on the classic style of the original 2000 AD Rogue Trooper comics.	//images.igdb.com/igdb/image/upload/t_thumb/upvvcsznquhscog02w7n.jpg
24440	Pankapu	\N	Pankapu is a 2D platform/action game, narrative and episodic: \n \nIn a world full of Dreams and Nightmares, a tiny warrior has to fight for the safety of his homeland. However, the real purpose of his his quest, beyond the struggle of good and evil, is the mental health of a traumatized child. \n \nTold in the manner of a fable read to a child, the game has two levels of reading: the story of Pankapu, epic and naive, and the second one, about Djaha’rell life, the one to whom the tale is told, dark and tragic.	//images.igdb.com/igdb/image/upload/t_thumb/mx4miptkkfvgexdl48ea.jpg
26760	Super Bomberman R	\N	"Since its release in 1985, Bomberman has been a familiar party-battle game for many years. Now, Bomberman is coming back as "SUPER BOMBERMAN R" to Nintento Switch. \n \nIn SUPER BOMBERMAN R, the simple rule remains the same: operate the main character (Bomberman), place bombs, and battle with enemies and rivals, but it's coming back in a modern style with 3D stages and photo-real graphics. You can enjoy battles with rivals from all over the world. \n \nThere is "Battle" mode for maximum of 8 players, and single play "Story" mode (cooperative play for 2 players is possible as well) where players clear each stage one by one, with a big volume of 50 stages. Also, there is a new rule where the condition to clear the stage is not just by wiping out all the enemies. This simple but strategic game with new rules and 3D stages is fun for everyone, from children to adults."	//images.igdb.com/igdb/image/upload/t_thumb/tstydayub9johjbcqkxu.jpg
26762	1-2-Switch	\N	Throw an impromptu party anywhere with anyone thanks to a new play style in which players look at each other—not the screen! Bring the action and fun into the real world as you face off in wild-west duels, cow-milking competitions, a copycat dance-off, and more. Each game takes advantage of the Joy-Con controller features of the Nintendo Switch system in different ways. While the action unfolds off- screen, the audience watches the players themselves instead of the screen. That makes it as hilarious to watch as it is to play – an instant party amplifier!	//images.igdb.com/igdb/image/upload/t_thumb/zmvwjt3fzl2vzpzvdlbp.jpg
37032	Blade Strangers	\N	"Blade Strangers, a crossover fighting game developed by Studio Saizensen featuring characters from Cave Story, Code of Princess, and Umihara Kawase."	\N
8959	Mutant Mudds Deluxe	\N	Love pixels? Fond of platformers? Is there a special place in your heart for the 8-bit and 16-bit era? Want to have fun? Yes!? Well, you’ve come to the right place, my friend. Mutant Mudds Deluxe is a “12-bit” action platformer full of pixels and platforming fun!\n \nOur hero, Max, may be just a 2D sprite, but he can leap into the third dimension by jetting between the background and the foreground playfields with his trusty jetpack in this unique dimensionally-woven experience.\n \nArmed with a heavy-duty water cannon, Max has what he needs to vanquish his long-term nemesis: the Mutant Mudds. Max must blast and hover his way across the soiled landscape to seek out mysterious Water Sprites. Legend says collecting all of the mysterious Water Sprites will wash the filthy Mutant Mudds away for good!Key Features\n 80 hard-as-steel levels spanning across 5 pixelated worlds and 9 neo-retro art themes!\n Jet between three 2D playfields and enjoy lovely depth-of-field blur effects – an eyeball treat.\n Obtain power-ups from Grannie's Attic to gain access to secret level doorways!\n 20 ghoulish ghost levels where the rules are turned upside down + spectral power-up.\n Unlock Grannie and other playable characters to harness the tri-power of all power-ups!\n Steam leader boards show the best level completion times from around the world.\n Includes 20 lip-smacking delicious ‘Grannie’ levels, specifically designed for veteran players!\n Steam achievements earn you pride and bragging rights, while sharpening your skills.\n Dozens of foot-stomping and booty-groovin’ chip-tune music tracks to snap your fingers to!	//images.igdb.com/igdb/image/upload/t_thumb/abdiomhfsv5kgjoxvoxb.jpg
27534	Pocket Rumble	\N	Pocket Rumble is a streamlined, beginner-friendly 2-button fighting game that retains all the gameplay elements that make traditional 2D fighters great, but reduces the level of execution and memorization necessary to the bare minimum.	//images.igdb.com/igdb/image/upload/t_thumb/pkuiiyiayunry1rwep8r.jpg
26774	Snipperclips - Cut it out, together!	\N	Cut paper characters into new shapes to solve dynamic puzzles and play activities in a wonderfully creative and imaginative world!	//images.igdb.com/igdb/image/upload/t_thumb/zegukb0xuibcf3qh6yut.jpg
19576	Skylanders: Imaginators	Kaos has discovered the ancient power of Mind Magic and is using it to create an unstoppable army of Doomlanders! Eon is calling upon all Portal Masters and Skylands' greatest mystic warriors, the Senseis to stop Kaos and his minions. Now, you must use the power of your imagination to create your own Skylanders to battle in the ultimate adventure alongside the almighty Senseis to save Skylands.	Kaos has discovered the ancient power of Mind Magic and is using it to create an unstoppable army of Doomlanders! Eon is calling upon all Portal Masters and Skylands' greatest mystic warriors, the Senseis, to stop Kaos and his minions. Now, you must use the power of your imagination to create your own Skylanders to battle in the ultimate adventure alongside the almighty Senseis to save Skylands. \n \nNow with Skylanders Imaginators on the Nintendo Switch™, Embark on an Epic New Adventure on-the-go \nUse the Digital Library for easy on-the-go access to your Skylanders toy collection \nUse the Imaginite Creation Crystals to Create Your Own Skylanders \nSensei Skylanders are the Ultimate Masters of the Almighty Sky-Chi Powers \nBattle to Save Skylands with the Sensei and Imaginator Skylanders \nUse 10 Different Battle Class Types to Defeat Kaos and his Minions \nConquer All-New Side quests & Mini-games	//images.igdb.com/igdb/image/upload/t_thumb/xcgvkoyuce9iwmhztfn4.jpg
23910	Shovel Knight: Specter of Torment	\N	This game is a free expansion included in the main game, Shovel Knight, and its updated title, Shovel Knight: Treasure Trove. The game will also be available as a standalone title on PC, PS4, Xbox One, and Nintendo Switch.	//images.igdb.com/igdb/image/upload/t_thumb/mftyqrzqnjmq6tddowtd.jpg
26816	Fast RMX	\N	The Nintendo Switch version of Fast Racing NEO. \n \n"Race through a futuristic sci-fi world at incredible speeds in FAST RMX. \n \nJump into the driver’s seat of your anti-gravity vehicle and put your skills to the test in high octane competitions. Challenge your friends to local split-screen competitions or take part in online races against players from all around the world."	//images.igdb.com/igdb/image/upload/t_thumb/qby05dbsbmdtly3ttc54.jpg
9484	The Next Penelope	\N	Set in a futuristic Odyssey, "The Next Penelope" is a fast paced action racing game with loud colors, an original story and a challenging risk-reward system. \n \n Weapons can be mixed and used at any time, but all these abilities cost vital energy, so the player is very powerful and close to death at the same time! \n \nAs Penelope is looking for Ulysses through the galaxy, the player is free to explore the planets in any order. Each world features unique situations, races, even bosses, and new permanent abilities to enhance the Penelope's spaceship. \n \nThis early-access release features the full single player game.  New modes like local multiplayer, speedrun challenges or score-based events will be added shortly in the next updates.	//images.igdb.com/igdb/image/upload/t_thumb/snqugpjwkre7elzsxvok.jpg
11070	Perception	"Perception is a first-person narrative horror adventure that tells the story of Cassie, a blind heroine who uses her extraordinary hearing and razor-sharp wits to unravel the mysteries of an abandoned estate that haunts her dreams.   \n   \nAfter months of research, she discovers an abandoned mansion in Gloucester, MA. Once there, Cassie finds that Echo Bluff is worse than her nightmares. A ghastly Presence has tormented its inhabitants over generations, and it now hunts Cassie. She must solve the estate's mysteries or become one of its victims."	Perception is a first-person narrative horror adventure that tells the story of Cassie, a blind heroine who uses her extraordinary hearing and razor-sharp wits to unravel the mysteries of an abandoned estate that haunts her dreams.	//images.igdb.com/igdb/image/upload/t_thumb/nmy04bilf2gxtf90sxsd.jpg
14694	Shakedown Hawaii	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/qabvnifwntwgj05f6d74.jpg
10760	Bloodstained: Ritual of the Night	Bloodstained follows the protagonist Miriam, an orphan who is afflicted by an alchemist's curse, which is slowly turning her skin into crystal. To stop the curse, Miriam must explore a demon-filled castle and locate its summoner, Gebel, who has suffered from the curse for a long time.	Bloodstained: Ritual of the Night is an upcoming metroidvania video game developed by Inti Creates and published by 505 Games. The game is led by former Castlevania series producer Koji Igarashi, and is considered a spiritual successor to the series. Bloodstained is expected to be released in 2018 for Microsoft Windows, OS X, Linux, PlayStation 4, PlayStation Vita, Wii U, and Xbox One. The Wii U and Vita versions are being developed by Armature Studio.	//images.igdb.com/igdb/image/upload/t_thumb/jt5ypn4a00wf4bmqrhre.jpg
26780	Constructor HD	\N	Constructor sets players as budding property tycoons, who must take on their rivals in the creation of a successful city. This doesn’t just involve the speedy building of homes and businesses, however; players must negotiate the tangled web of Undesirables, a motley collection of reprobates that can be used against them – and by them, against others.	//images.igdb.com/igdb/image/upload/t_thumb/is8rpxi1vm1uplujhuww.jpg
26833	Entertainment Hero	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/rjwksbfcec3gv83g5v2v.jpg
18975	Oceanhorn: Monster of Uncharted Seas	\N	A remasterd version of Oceanhorn from iOS. \n \n"You wake up and find a letter from your father. He is gone… The only lead is his old notebook and a mysterious necklace. What happened?  \n  \nOceanhorn: Monster of Uncharted Seas combines captivating storytelling, breathtaking 3D visuals and exciting gameplay into one epic action-adventure experience. In the game you explore the islands of Uncharted Seas, a world filled with many dangers, puzzles and secrets. You must fight monsters, learn to use magic and discover ancient treasures, which will help you on your quest. Use all of your wits and skill to unravel the mysteries of the ancient kingdom of Arcadia and the sea monster, Oceanhorn."	//images.igdb.com/igdb/image/upload/t_thumb/tevieaod1lnuuhwinnnw.jpg
12875	SUPERBEAT: XONiC	\N	SUPERBEAT: XONiC is an upcoming rhythm game developed by Nurijoy, a company formed by former employees of Pentavision. It is considered a spiritual successor to the DJMax music game series and its gameplay is based on the 2014 arcade game Beatcraft Cyclon, also made by Nurijoy. The gameplay of SUPERBEAT: XONiC consists of tapping notes to the beat of a song, either with the PlayStation Vita's face buttons or touchscreen. Modes, in order of difficulty, include 4 TRAX mode, 6 TRAX, and 6 TRAX FX. When selecting any mode, 3 tracks are played in succession and the player's performance is evaluated at the end. Local scores can be uploaded to a global online leaderboard if connected to the internet. SUPERBEAT will feature over 50 different tracks from a variety of genres, including soulful house, RnB, indie pop, progressive metal, and big beat and many more, and will include a collection of original music from producers such as 3rd Coast, ND Lee, Tsukasa and others.	//images.igdb.com/igdb/image/upload/t_thumb/wxb60gte28ew8f7s7zfn.jpg
27872	Sunu Ikkibu: Din Nahu	\N	Travels alongside Serena to Martin Garcia Island, to discover what happened to his disappeared inhabitants, including her mother. Discover the mystery surrounding the island by translating texts in Sumerian scattered throughout the place. Solve difficult Puzzles and fight puzzles with "They". \n \nExperience horror in the purest Survival Horror Classic style. The scenarios are based on the real island, completely 3D. And enjoy the 1st / 3rd person mode, where there will be times when the game's camera is changed for greater immersion. \n \nThe game is still under development and is planned to launch for Nintendo Switch and PC in late 2018.	//images.igdb.com/igdb/image/upload/t_thumb/phkfox1akx31n4p5xeif.jpg
978	Resident Evil: Revelations	\N	The critically acclaimed survival horror title takes players back to the events that took place between Resident Evil 4 and Resident Evil 5, revealing the truth about the T-Abyss virus. Resident Evil Revelations features series favorites Jill Valentine and Chris Redfield, plus their respective BSAA partners - Parker Luciani and Jessica Sherawat. The action begins on board a supposedly abandoned cruise ship, the ‘Queen Zenobia’, where horrors lurk around every corner, before players head for the mainland and the devastated city of Terragrigia. With limited ammo and weapons available, the race is on to survive the horror of Resident Evil Revelations.	//images.igdb.com/igdb/image/upload/t_thumb/jifobpwyvtqmlxyywajv.jpg
25636	Nights of Azure 2: Bride of the New Moon	\N	Nights of Azure 2: Bride of the New Moon takes place in a fictional, demon-ridden Western European city towards the end of the 19th century. The story focuses on a knight protector named Alushe and her two childhood friends – Liliana, a kind-hearted priestess, and Ruhenheid, a holy knight of the Lourdes Order. While guarding Liliana, Alushe is ambushed and killed only to later awaken as an artificial half-demon at the hands of the New Curia, a religious organization with dark ties. In the company of a variety of unlikely allies with their own pasts and agendas, Alushe’s strong desire to save Liliana gives her the strength to scatter the shadows shrouding the world and motivation to uncover the shocking truth behind the mysterious Queen of the Moon.	//images.igdb.com/igdb/image/upload/t_thumb/apmt1u39kvadaewlr7kg.jpg
41825	The Legend of Zelda: Breath of the Wild - The Master Trials	\N	DLC pack 1 cannot be purchased outside of the expansion pass.	//images.igdb.com/igdb/image/upload/t_thumb/cesgeqfzjuxe01iwjprs.jpg
41893	Shephy	\N	Enjoy playing game at your own pace? \nEnjoy playing single player games? \nEnjoy solving challenging puzzles? \nDo you love sheep? \n \nIf yes, "Shephy" is the perfect game for you!	\N
36856	The Mummy: Demastered	\N	\N	\N
41812	The Long Reach	\N	At its heart The Long Reach is an adventure game. Closer inspection also reveals it’s a thrilling horror story, flavoured with sci-fi ideology, psychological context and a skeptical view on the human psyche.	\N
41826	The Legend of Zelda: Breath of the Wild - The Champions' Ballad	\N	DLC pack 2 cannot be purchased outside of the expansion pass.	\N
41829	The Legend of Zelda: Breath of the Wild - Expansion Pass	\N	The expansion pass is the only way to purchase the DLC packs for the game.  \n  \nThe pass became available for purchase as of March 3rd 2017 but the 2 DLC packs included are to be released during the summer and winter of 2017.	//images.igdb.com/igdb/image/upload/t_thumb/fv5kxlrz58noqfy3hao2.jpg
27916	Seiken Densetsu Collection	\N	A collection of the first 3 Seiken Densetsu games, known as the Mana seires internationally, with a quick save feature added and all 3 soundtracks.  \nThe games included are Seiken Densetsu (Final Fantasy Adventure), Seiken Densetsu 2 (Secret of Mana), and Seiken Densetsu 3 which was not released outside of Japan.  \nThe collection has only been announced for release in Japan on the Nintendo Switch.	//images.igdb.com/igdb/image/upload/t_thumb/ivwhauawrllvawaz87ae.jpg
14545	Human Resource Machine	\N	"Human Resource Machine is a puzzle game. In each level, your boss gives you a job. Automate it by programming your little office worker! If you succeed, you'll be promoted up to the next level for another year of work in the vast office building. Congratulations! \n \nDon't worry if you've never programmed before - programming is just puzzle solving. If you strip away all the 1's and 0's and scary squiggly brackets, programming is actually simple, logical, beautiful, and something that anyone can understand and have fun with!"	//images.igdb.com/igdb/image/upload/t_thumb/jqhfalmxexxmge6rhit6.jpg
36534	Lost Sphear	"As an ominous power threatens the fabric of reality, a young man chosen by destiny must arise to face a phenomenon never seen before. Enter Kanata, as he awakens from a devastating dream leading him to find his home, erased from existence. Awaken the power of Memory to restore the Lost and rebuild the world!"	"The next evolution in this new golden age of JRPG’s arrives with LOST SPHEAR, bringing a fresh take on classic RPG gameplay! A young man, who suffered a phenomenon that he had never seen, faces an ominous power that threatens the fabric of reality. Awaken the power of Memory to restore what was lost! Muster different Memory and craft the world around you in a journey to save the world."	//images.igdb.com/igdb/image/upload/t_thumb/rgxz637m1rac8ao7g3pi.jpg
36777	Farming Simulator: Nintendo Switch Edition	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/juluzylmwelcs9cfk0ex.jpg
942	World of Goo	Initially, pipes appear throughout the land, waking up many sleeping Goo Balls who have gone undisturbed until this, as they are filled with a childlike sense of curiosity and naivety they build themselves towards the pipes. Upon reaching the pipe entrance, the Goo Balls are sucked by the pipe system into the "World of Goo Corporation" main building where they are processed into many products, for example an energy drink. The excess Goo Balls are left outside the Corporation headquarters where they together begin to build a giant tower. At the end of the first chapter, some Goo Balls escape from a Corporation building by attaching themselves to eyeballs which have the ability to fly. The chapter ends with the Goo Balls "seeing far away new lands".	World of Goo is a multiple award winning physics based puzzle / construction game made entirely by two guys. Drag and drop living, squirming, talking, globs of goo to build structures, bridges, cannonballs, zeppelins, and giant tongues. The millions of Goo Balls that live in the beautiful World of Goo are curious to explore - but they don't know that they are in a game, or that they are extremely delicious. Congratulations, and good luck!	//images.igdb.com/igdb/image/upload/t_thumb/ypdelkcw1aegdxrxgjkg.jpg
1363	Little Inferno	\N	Congratulations on your new Little Inferno Entertainment Fireplace! Throw your toys into your fire, and play with them as they burn. Stay warm in there. It's getting cold outside! Burn flaming logs, screaming robots, credit cards, batteries, exploding fish, unstable nuclear devices, and tiny galaxies. An adventure that takes place almost entirely in front of a fireplace - about looking up up up out of the chimney, and the cold world just on the other side of the wall.	//images.igdb.com/igdb/image/upload/t_thumb/ejbq4r0x3udvmxnx7o6s.jpg
26226	Celeste	\N	A single-player platformer about climbing a mountain. Battle your inner demons and climb through more than 250 devious stages to reach the summit. It won't be easy.	//images.igdb.com/igdb/image/upload/t_thumb/trrfeghalxwnydohab8j.jpg
19799	Fate/Extella: The Umbral Star	\N	Fate/Extella is an upcoming action video game in the Fate/stay night series. The game is a single-player action game in which the player takes the role of a "master", who works together with spirits known as servants, who fight large numbers of enemies. The player can name the master, and can decide if they should be male or female. There are sixteen playable servants in the game, divided into eight classes: Saber, Archer, Lancer, Caster, Assassin, Rider, Berserker, and Extra Class. Different servants have different fighting styles: the Saber swordswoman Nero Claudius has powerful sword skills and balanced abilities; the Caster magus Tamamo no Mae can use magic skills; and the Saber swordswoman Attila uses a violent battle style.	//images.igdb.com/igdb/image/upload/t_thumb/pvury9hpepqgsow7tlel.jpg
20123	State of Mind	You are Richard Nolan, a father and journalist from Berlin who discovers that he and his wife and son have been subjects to mind uploads. Richard’s upload, however, has gone wrong. As a result, he is still living in real-life reality, but an incomplete second version of his self also exists in a secret Virtual Reality project.  \n  \nUpon realizing that he is literally a torn man, Richard sets out on a dramatic and dangerous search for salvation. He aims to reunite with his family, as well as with his own split self. On his way, he soon realizes that this journey isn’t only about him, but about the future of mankind.	State of Mind is a futuristic thriller game delving into transhumanism. The game explores themes of separation, disjuncture and reunification, in a world that is torn between a dystopian material reality and a utopian virtual future.	//images.igdb.com/igdb/image/upload/t_thumb/njqvahqywx97sllrtaxt.jpg
27505	Flip Wars	\N	"This tense multiplayer action game will have you stomping to flip over panels—and unwitting opponents! To win, flip the most panels to your color in local battles, online*, or single-player. The more you flip, the faster you’ll move in a mad dash to nab power ups. Increase your flip range, turn invincible, and more across 3 modes and 12 arenas! \n \nCompete alone or against up to 3 players to see who’s best at each mode: flip the most panels before time runs up in Panel Battle, knock out the most opponents in Time Battle, or outlast your rivals in Life Battle. All 12 arenas have 4 layouts to choose from, some containing hazards like panel-flipping buttons, beam cannons, and waves so beautiful they truly stun competitors. Learn the art of the flip with tutorials and try your hand at achievements. When you’re ready to compete, jump into an online* battle or a private room with friends via local wireless. No matter how you play, it’s time to think fast and pull off the ultimate color scheme!"	//images.igdb.com/igdb/image/upload/t_thumb/rycifrazni5lo9gwv6wu.jpg
26009	Penny-Punching Princess	\N	"In a world ruled by capitalism, cash is king! \n \nUse the money you gather to bribe enemies to fight for you, activate deadly traps with your dough, and when all else fails, smash all that stand against you with your fists! Fight your way from nothing and amass treasures to take on the mighty Dragoloan Family and reclaim your kingdom!"	//images.igdb.com/igdb/image/upload/t_thumb/ufah95kmmdy1nbxgg76v.jpg
44101	Dragon Quest X - All In One Package	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/bpxocirsaasqjbvabqdh.jpg
28075	Cars 3: Driven to Win	\N	Cars 3: Driven to Win is a game that empowers players to master their driving skills for the ultimate competitive racing experience. With six thrilling modes for gamers to learn and advance their abilities, players can progress their character through training and tests of racing proficiency that unlock new modes, tracks, characters and more. Players can hone a wide variety of skills and abilities including Drifting, Turbo, Two-wheel Driving, Driving Backwards and Side-Bash. Each unique mode and ability allows players to explore the deeper gameplay mechanics and earn rewards for their expertise. Cars 3: Driven to Win provides an exhilarating, action-packed experience where training and skill give players an edge in a racing experience that anyone can win.  \n  \nAdditionally, players will be able to experience Cars 3: Driven to Win with their friends or on their own to perfect the various racing styles and modes available to them. Available for pre-order now, the game will include local split-screen cooperative play, allowing players to compete or team up and play at home together, making it easy for friends and family members to join the race – and the fun – at any time.	//images.igdb.com/igdb/image/upload/t_thumb/n4ccqpmy5xb1gqcj3b2u.jpg
44078	The Longest Five Minutes	"Our hero faces the origin of all evil, the Demon King himself, but suddenly loses all memories of his adventure. \n \nHis finishing moves, the name of his hometown, and even the reason he's trying to defeat the Demon King in the first place, all gone. Our hero feels as though he's letting his allies down... \n \nIn the midst of battle, his ally's words and the Demon King's taunting triggers flashbacks, bringing his memories back piece by piece. \n \nOur hero tries to regain his priceless memories before it's too late, but the Demon King stands before him, his power unyielding! \n \nWhat can happen in The Longest Five Minutes!?"	Our hero faces the origin of all evil, the Overlord himself, but suddenly loses all memories of his adventure.	\N
10031	Yooka-Laylee	\N	Yooka-Laylee is an all-new 3D platformer from the creative talent behind the Banjo-Kazooie and Donkey Kong Country games. We’ve come together to form Playtonic Games and create a spiritual successor to our most cherished work from the past! \n \nOur new heroes, Yooka (the green one) and Laylee (the wisecracking bat with big nose) were conceptualised from the ground up for stellar platforming gameplay, created by the same character artist behind the rebooted Donkey Kong family and legendary N64 heroes Banjo and Kazooie. \n \nUsing an arsenal of special moves like Yooka’s tongue grapple and Laylee’s tactical sonar blast, players will explore – and expand – gorgeous 3D worlds drawn up by esteemed environment artist Steven Hurst (Banjo-Kazooie series, Viva Pinata) and discover the plethora of delicious collectibles hidden within.	//images.igdb.com/igdb/image/upload/t_thumb/yep7eiuvroc52esgwonz.jpg
28067	The Fall Part 2: Unbound	\N	Continue ARID's journey of self discovery as she's thrust into a challenging and bizarre adventure that will test your wits as a player. The Fall Part 2: Unbound will put you in perspectives that you haven't seen before in a game.	//images.igdb.com/igdb/image/upload/t_thumb/vf35mmma9yacvvlfsuoc.jpg
19729	Mr. Shifty	\N	Quit creeping through shadows, stop surveilling security patterns, and ditch the fancy toys. An expert thief and master of infiltration, Mr. Shifty can get inside any place he wants with just the power of his fists…okay, teleporting helps.  \n  \nA speed-stealth, kung-fu brawler about a teleporting thief, Mr. Shifty combines fast top-down gameplay with the ferocity of '90s Hong Kong action cinema, coming to PC (Win/Mac), PS4, and Xbox One in 2017.  \n  \nPummel your way through 75 levels of heists, rescue missions, boss battles, and down-'n'-dirty brawls. Outsmart your opponents by luring them into traps and tricking them into shooting each other. Activate slow-motion to dodge when the gunfire gets too thick, and watch your back, because it only takes one bullet to bring you down.  \n  \nNewly announced from indie publisher tinyBuild GAMES, Mr. Shifty is the debut title from Team Shifty; a close-knit group of four developers from Brisbane, Australia, who previously worked as a team at Halfbrick for over five years and have collectively shipped 21 games for consoles and handheld.	//images.igdb.com/igdb/image/upload/t_thumb/avvr0sz0kvykjc1fnz85.jpg
26763	Has-Been Heroes	\N	"Has-Been Heroes is a challenging, rogue-like game of strategy and action, featuring a band of heroes on a quest to escort the King's twin princesses to the Princess Academy.  \n  \nThe player controls three characters and must focus on combining hundreds of different spells to create devastating combo effects that can be used against enemies along the way. The rewarding, strategy game features irreverent humor, expanding world maps and increasing levels of difficulty. Players will stay focused and engaged in the gameplay as the quantity and randomness of spells and items allow for thousands of new experiences and will force the player to change their game style each time, while the specter of permadeath could cause the player to lose everything!"	//images.igdb.com/igdb/image/upload/t_thumb/qvme40ujmtjekqgkd5hb.jpg
26857	Graceful Explosion Machine	\N	"Skillfully pilot the advanced Graceful Explosion Machine (GEM) fighter while blasting swarms of crystalline enemies with your ludicrously overpowered quad-weapon array! \n \nLost in deep space, you'll shoot, dash and combo your way through jewel-hued alien worlds, fighting to find a way home."	//images.igdb.com/igdb/image/upload/t_thumb/r0xlawoxocfskehsxvyi.jpg
26759	ARMS	\N	ARMS, a mix of boxing and shooting where you use extendable arms to battle your friends both locally and online! Take a Joy-Con in each hand and punch forward, twisting your fists to bend your attacks.   \n   \n"Choose a fighting champion from around the world, equip your own combination of extendable arms, and then use a mix of button presses and quick hand motions to really take the fight to your opponent. Throw punches and guide them midflight to hit agile fighters, avoid incoming attacks with dashes, or trampoline high into the air to rain down fists from above. Power-up your punches to deal extra damage or curve your fists around obstacles to hit skittish opponents. Fill up your special gauge to dish out devastating combinations and finish them off. Unleash your inner fighter in this unbelievable sporting event! "	//images.igdb.com/igdb/image/upload/t_thumb/swxsdvvkhk0mhmi2prlg.jpg
28129	Shinobi Refle: Senran Kagura	\N	\N	\N
28015	Kamiko	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/nxy93o7xwjffktrq6hej.jpg
13681	Alpha Mission II	\N	Alpha Mission II is a 2D vertical scrolling shooter with a great deal of depth for two players moving vertically up the screen boards shooting anything that moves. Equip up to three pieces of armor, which also serve as weapons, for a variety of attacks such as the laser and flamethrower. Use them to defeat the evil “Fulvar” and save mankind!	//images.igdb.com/igdb/image/upload/t_thumb/qnh5onr9mfgs0xrp21e7.jpg
26773	Ultra Street Fighter II: The Final Challengers	\N	The newest iteration of SFII in nearly 10 years, Ultra Street Fighter II features all of the classic characters, a host of new single player and multiplayer features, as well as two new fighters: Evil Ryu and Violent Ken! Nintendo Switch TV, Tabletop and Handheld modes allow you to play Ultra Street Fighter II at home or on-the-go!	//images.igdb.com/igdb/image/upload/t_thumb/cyzfjkqsh8ni0ao3rrgo.jpg
19452	Wonder Boy: The Dragon's Trap	"Cursed into a half-human, half-lizard monstrosity by the Meka-Dragon, a lonesome adventurer is facing the challenge of a lifetime! In search for a cure, our mutated anti-hero will explore the many traps of Monster Land... and defeat many stuff-throwing, curse-wielding dragons."	"A modern version of cult classic Wonder Boy: The Dragon's Trap! A close collaboration between Lizardcube, DotEmu and legendary series creator Ryuichi Nishizawa, based on Westone Bit Entertainment's original masterpiece.  \n  \nHow many more transformations can one hopeful body survive as it turns into a Lizard, a Mouse, a Piranha, a Lion, and a Hawk... The six different forms of our shape-shifting hero make up the cast of this non-stop action-adventure platformer!"	//images.igdb.com/igdb/image/upload/t_thumb/jgi4qdpseipsowaxgs5j.jpg
28174	Monopoly for Nintendo Switch	\N	\N	\N
14393	Bulb Boy	One gloomy night, Bulb Boy wakes suddenly from a frightening nightmare to discover that evil has overshadowed the Bulbhouse. His family has disappeared and there are horrid monsters lurking in the shadows.	One gloomy night, Bulb Boy wakes suddenly from a frightening nightmare to discover that evil has overshadowed the Bulbhouse. His family has disappeared and there are horrid monsters lurking in the shadows. Gather the courage and use his glass head to save everything he loves.	//images.igdb.com/igdb/image/upload/t_thumb/whtd2vymxobyrwvbm7fr.jpg
15429	The King of Fighters '98	\N	The All-Star dream battle is here at last: It's King of Fighters '98! Here come 38 of your favorite characters from the King of Fighters series. Your favorite characters and teams are back! Filled with new surprises like the Roulette Team Edit and Advantage System, King '98 will pop your cork with unrelenting excitement!	//images.igdb.com/igdb/image/upload/t_thumb/wv6w4vtxgaw9gd190o9m.jpg
1408	Metal Slug 3	\N	“METAL SLUG 3”, the masterpiece in SNK’s emblematic 2D run & gun action shooting game series, still continues to fascinate millions of fans worldwide to this day for its intricate dot-pixel graphics, and simple and intuitive game controls! The most highly praised title in the series among Metal Slug fans for its refined balance and game volume, heads out to the Steam gaming platform! MAIN FEATURES・ARCADE MODE (MAIN MISSION): \nPlay the arcade version of “METAL SLUG 3” from the beginning, and explore 5 immense challenging stages featuring multiple branching paths to explore exciting new areas! Make your way through the deluge of fire and fight off gigantic boss characters!\n\n・MISSION MODE (STAGE SELECT):\nPlay your favorite stages at will and train alone or with a brother-in-arms on the missions you have unlocked so far!\n\n・ONLINE MISSION (ONLINE MULTIPLAYER):\nConnect to Steam and clear missions with friends far away via Online Co-Op Play.\nFind a fellow countryman or foreign ally and let the mission begin!\n\n・SETTINGS:\nConfigure display, control, and language settings.\n\n・GALLERY:\nView original illustrations of the game that you've unlocked.\n\n・LEADERBOARDS\nCheck your current rank and score in“METAL SLUG 3” at any time,\nand compete with other players to become the world's No. 1 soldier!\n\n** WILL NOT RUN ON XP **	//images.igdb.com/igdb/image/upload/t_thumb/n94aylowxepr3ktkn4kn.jpg
28412	ACA NEOGEO SHOCK TROOPERS	\N	"SHOCK TROOPERS is an action game released by SNK in 1997. \nPlayers take part in a rescue operation for Dr. George and his granddaughter who have been kidnapped by the evil organization Bloody Scorpion. The game features the ability for players to choose which route to progress, adding even more replayablity to the title."	//images.igdb.com/igdb/image/upload/t_thumb/sij7vzf3c1tnruagksdk.jpg
31558	WWE 2K18	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/qhlafqriozciovqu1hrl.jpg
28409	ACA NEOGEO NAM-1975	\N	"NAM-1975 is an action game released by SNK in 1990. \nIt was one of the first ever games released on NEOGEO! \nPlayers will take on the role of U.S. Special Forces soldiers braving a harsh battlefield as they try to survive a series of deadly firefights.Players will need to use collectible power-ups and other abilities such as their evasive roll to complete their mission!"	//images.igdb.com/igdb/image/upload/t_thumb/ivjlaj4mplqd8jdr6g7b.jpg
28416	ACA NEOGEO WAKU WAKU 7	\N	" "WAKU WAKU 7" is a fighting game released by SUNSOFT in 1996. \nPlayers will control characters who have one of 7 WAKU WAKU balls that grant wishes, and gather the remaining balls. \nLet's gather power in exciting gauge, and attack all over with a personality-rich technique of each characters!"	//images.igdb.com/igdb/image/upload/t_thumb/t3kfhhf0rj9bfpm95m4d.jpg
28418	ACA NEOGEO WORLD HEROES PERFECT	\N	" "WORLD HEROES PERFECT is a fighting game released by SNK in 1995. \n16 characters based on historical figures battle it out to decide who is the strongest. New elements such as hero gauge, extra attack, and guard attacks have been added to this version, leading to more exciting matches! \n \nThe "ACA NEOGEO" series has faithfully reproduced many classic NEOGEO masterpieces. \nPlayers can change various game settings such as game difficulty, and also reproduce the atmosphere of arcade display settings at that time. Players can also compete against each other from all over the world with their high scores."	//images.igdb.com/igdb/image/upload/t_thumb/kkwsntdv5km4kjuwom1n.jpg
2058	Payday 2	\N	Payday 2 is an action-packed, four-player co-op shooter that once again lets gamers don the masks of the original PAYDAY crew - Dallas, Hoxton, Wolf and Chains - as they descend on Washington D.C. for an epic crime spree.	//images.igdb.com/igdb/image/upload/t_thumb/jqf5grb9iguovizn9wr7.jpg
28081	NBA Playgrounds	\N	"Classic NBA arcade action is back! Take your “A” game to the playground and beat the best in high-flying 2-on-2 basketball action. Practice your skills offline, play with up to three others, or take your talents online to posterize your opponents with acrobatic jams and ridiculous displays of skill."	//images.igdb.com/igdb/image/upload/t_thumb/fkblsncqprgi4rjwmydg.jpg
26870	Necrobarista	\N	"In a magical Melbourne cafe, the dead return for one last night. \n \nNECROBARISTA is an original visual novel combining a supernatural suspense story with a stylised cinematic presentation influenced by anime aesthetics."	\N
28451	ACA NEOGEO NEO TURF MASTERS	\N	"NEO TURF MASTERS is a golf game released by SNK in 1996. \nPlayers can choose from a total of six golfers with different abilities and play on courses located around the world such as Australia or Germany. \nPlayers can test out their golf game skills against friends with game modes such as "STROKE PLAY" and "MATCH PLAY (2P battle only)"."	//images.igdb.com/igdb/image/upload/t_thumb/hh5egc1rjlqhjd88tsnf.jpg
28452	ACA NEOGEO METAL SLUG	\N	"'METAL SLUG' is the original entry in one of the most famous action game series ever released. It was originally released by SNK in 1996. \nPlayers control Marco and Tarma who belong to the Special Forces team known as the 'Peregrine Falcon Squad'. They fight to defeat General Donald Morden, in an effort to take back their stolen weapon known as the 'METAL SLUG'. Players can utilize various weapons and vehicles such as the METAL SLUG to sway the fight in their favor."	//images.igdb.com/igdb/image/upload/t_thumb/lnyepderdlrzqpvirgic.jpg
28466	Othello	\N	GAME DETAILS \nWherever, whenever, whoever! Classic boardgame "Othello"! \n \nThe well-acclaimed boardgame for all ages, "Othello" is now on Nintendo Switch! \n \nPlay in the comfort of your home or outside, and play in a style that suits you best! \n \nA total of 16 levels of computer AI difficulty are available for Single Player Modes! \n \nHints on where the stones can be placed, and displays to show which tiles will be flipped in this move are also available to help new players understand the game better! \n \nTwo-player mode is also available! \nBoth players can play together on 1 Nintendo Switch by simply sharing the Joy-con, or simply operate directly on the Touch Screen! \nDo play with your family and friends!	//images.igdb.com/igdb/image/upload/t_thumb/pvamzwgwuzct0xadcae9.jpg
51409	Physical Contact: SPEED	\N	GAME DETAILS \nIt is a game series where two people can play against one device. \nIf you play with your body in close contact, the match will be more fun. \nAny two partners, including parents, friends, lover, etc, are suitable. \nBecause it is simple and rules that everyone knows, you can start the game immediately on the spot.	\N
51408	Old School Musical	\N	Old School Musical is a retro rhythm game that will make you fall back in your childhood. Tib and Rob are the heroes of an epic and completely crazy adventure that will make them cross numerous worlds searching for the source of all bugs. With more than 20 original levels, a story mode, some hidden minigames and much more, Old School Musical offers a richer experience than most rhythm games.	\N
15426	The King of Fighters '94	\N	Rugal Bernstein is an incredibly rich and notorious arms and drug trafficker, as well as an incredibly skilled and ruthless fighter. Having become bored with the lack of competition, Rugal decides to host a new King of Fighters tournament. Rugal has his secretary travel to eight destinations around the world and invite fighters to his new tournament. Unlike the previous KOF tournaments depicted in the Fatal Fury series, the new King of Fighters is a team tournament, with eight teams of three, each representing a different nationality, participating this time. Most characters come from other SNK games, such as Team Italy, which is composed of three heroes from the original Fatal Fury: Terry Bogard, Andy Bogard and Joe Higashi. The two heroes from Art of Fighting (Ryo Sakazaki and Robert Garcia) are featured along with their mentor and Ryo's father (Takuma Sakazaki) make up Team Mexico. Team Korea features Kim Kaphwan from Fatal Fury 2 as the leader of two convicts he's trying to reform Chang Koehan and Choi Bounge, while Team England is a mix of female fighters from Fatal Fury 2 (Mai Shiranui) and the Art of Fighting series (Yuri Sakazaki, King). The two heroes from Psycho Soldier (Athena Asamiya and Sie Kensou) form Team China along with their mentor, Chin Gentsai. Similarly, Team Brazil features the heroes from Ikari Warriors (Ralf and Clark) along with their commanding officer Heidern. Additionally, the game features two teams composed entirely of original characters: Team Japan featuring Kyo Kusanagi, Benimaru Nikaido and Goro Daimon, and Team USA composed of Heavy D!, Lucky Glauber and Brian Battler.	//images.igdb.com/igdb/image/upload/t_thumb/gk6amb6lggh7fedcvzsq.jpg
26818	New Frontier days: Frontier Pioneer	\N	New Frontier Days ~Founding Pioneers~ is a town-building simulation game, where you command your pioneers to colonize a new land. The pioneers are capable of "Logging", "Mining", "Hunting", "Fishing" and many others. Command them accordingly, and build your own town efficiently.	//images.igdb.com/igdb/image/upload/t_thumb/qczsgpmdxrrckgpjcytl.jpg
28500	ACA NEOGEO Over Top	\N	The ultimate NEOGEO Racing Game! The game features branching paths and a variety of car models for maximum replayability! \n \n"OVER TO"P is a racing game released by SNK in 1996. \n \nPlayers will participate in breathtaking races through urban areas, mountainous regions, and snowy roads. The courses also feature weather variations to add more variety to the game. \n \nIn addition to the various vehicles with different performance factors which players can use, they can also enjoy the thrill of drifting their way through corners to clear courses. \n \nThe "ACA NEOGEO" series has faithfully reproduced many classic NEOGEO masterpieces. \n \nPlayers can change various game settings such as game difficulty, and also reproduce the atmosphere of arcade display settings at that time. Players can also compete against each other from all over the world with their high scores. \n \nPlease enjoy the masterpiece that built a generation for video games.	//images.igdb.com/igdb/image/upload/t_thumb/b3v69qpw3limims0bjtr.jpg
28507	ACA NEOGEO FATAL FURY	\N	GAME DETAILS \nThe original NEOGEO fighting game! Experience how the legend started! \n \n"FATAL FURY" is a fighting game released by SNK in 1991. \n \nPlayers take part in brutal street fights in a variety of locations, with the goal of toppling the infamous crime lord Geese Howard. \n \nThe game includes very unique features when compared to other fighting games available at the time, including a special Line Battle system that allows players to traverse between the foreground and background and 2-player co-op functionality. \n \nThe "ACA NEOGEO" series has faithfully reproduced many classic NEOGEO masterpieces. \n \nPlayers can change various game settings such as game difficulty, and also reproduce the atmosphere of arcade display settings at that time. Players can also compete against each other from all over the world with their high scores. \n \nPlease enjoy the masterpiece that built a generation for video games.	//images.igdb.com/igdb/image/upload/t_thumb/sazhjjz3vr9pavrbkdut.jpg
19082	The Jackbox Party Pack 3	\N	The threequel to the party game phenomenon features the deadly quiz show Trivia Murder Party, the say-anything sequel Quiplash 2, the surprising survey game Guesspionage, the t-shirt slugfest Tee K.O., and the sneaky trickster game Fakin’ It.	//images.igdb.com/igdb/image/upload/t_thumb/id9yktchkvyqpklbt52v.jpg
27051	TumbleSeed	\N	TumbleSeed is a deceptively deep roguelike about balancing a seed up a dangerous and ever-changing mountain.	//images.igdb.com/igdb/image/upload/t_thumb/doqygvfvnknfuzcdojeg.jpg
121	Minecraft	\N	Minecraft is an open world game that has no specific goals for the player to accomplish, allowing players a large amount of freedom in choosing how to play the game however, there is an achievement system. The gameplay by default is first person, but players have the option to play in third person mode. The core gameplay revolves around breaking and placing blocks. The game world is essentially composed of rough 3D objects—mainly cubes—that are arranged in a fixed grid pattern and represent different materials, such as dirt, stone, various ores, water, and tree trunks. While players can move freely across the world, objects and items can only be placed at fixed locations relative to the grid. Players can gather these material blocks and place them elsewhere, thus allowing for various constructions.	//images.igdb.com/igdb/image/upload/t_thumb/ew1zwceoeho7lipjxi1n.jpg
19449	Dragon Ball: Xenoverse 2	\N	DRAGON BALL XENOVERSE 2 builds upon the highly popular DRAGON BALL XENOVERSE with enhanced graphics that will further immerse players into the largest and most detailed Dragon Ball world ever developed. \n \nDRAGON BALL XENOVERSE 2 will deliver a new hub city and the most character customization choices to date among a multitude of new features and special upgrades.	//images.igdb.com/igdb/image/upload/t_thumb/oss9bgnecqtgn2fvoae2.jpg
16932	Quest of Dungeons	\N	By playing as either a Warrior, a Wizard, a Assassin or a Shaman you have to traverse dungeons, defeat enemies and loot everything you can in order to survive. You can learn new skills in Tomes you find along the way and buy/sell items at shops. \nThe entire game is procedural so you won't find items/enemies in the same place each time you play.	//images.igdb.com/igdb/image/upload/t_thumb/kdkguqrdq8qhzvupd2au.jpg
19002	GoNNER	\N	"GoNNER is a tough as hell procedurally-generated 2D platformer with roguelike elements, following the largely misunderstood and altruistic Ikk on a journey to cheer up his only friend in this world—a giant landbound whale named Sally—by searching for just the right trinket in the deep and dark places nearby. \n \nWith Death as his mentor, supplying both a multitude of abilities and arsenal for Ikk to use, Ikk traverses an ever-changing land full of unwieldy creatures who don’t appreciate his trespassing or his friend Sally. Several different environments, arduous bosses, hidden secrets, multiple endings, and more await Ikk on his journey to make one person happy even if it kills him—which it certainly will."	//images.igdb.com/igdb/image/upload/t_thumb/tuvtjgqw4ankep0l0ptt.jpg
51407	Levels+: Addictive Puzzle Game	\N	The rule is simple. Slide and match panels with the same color and number to level up! \nIt looks simple but you need to use your brain.	\N
28815	Lego Marvel Super Heroes 2	\N	Marvel Super Heroes 2 is an all-new, original adventure and sequel to the smash hit, Lego Marvel Super Heroes. Bringing together iconic Marvel Super Heroes and Super Villains from different eras and realities, along with signature LEGO humor, the latest adventure transports players into a cosmic battle across a myriad of Marvel locations ripped from time and space into the incredible open hub world of Chronopolis. \n \nPlayers will go head-to-head with the time-traveling Kang the Conqueror in an epic battle across Chronopolis, from Ancient Egypt and The Old West to Sakaar and New York City in 2099. Along the way, gamers will be able to take control of a host of iconic characters, from Cowboy Captain America from the past to Spider-Man 2099 from the future along with Thor, Hulk, the Guardians of the Galaxy, Black Panther, Captain Marvel, Doctor Strange, Green Goblin, and dozens of other Marvel Super Heroes and Super Villains.	//images.igdb.com/igdb/image/upload/t_thumb/gmmqpzjfvluyqgv2yvr9.jpg
28843	Harvest Moon: Light of Hope	\N	The third Harvest Moon game created by Natsume without the original developers of the series.  \n  \nThe game will be revealed and playable at E3 2017.	//images.igdb.com/igdb/image/upload/t_thumb/s0esmbkntgq6tjpukuup.jpg
26772	NBA 2K18	\N	The highest rated annual sports title of this generation returns with NBA 2K18, featuring unparalleled authenticity and improvements on the court.	//images.igdb.com/igdb/image/upload/t_thumb/e1mdxjain9zvgrpxvipi.jpg
37078	Steep: Road to the Olympics	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/pvvbnxlmsfbdxfginbuh.jpg
51518	Boost Beast	"The sudden appearance of a virus-carrying meteorite \ninfected the entire human race, and turned everyone into zombies. \nThe hero who rose up to face this crisis is Alec, the king of dogs. \nWill he be able to save the devastated world and reclaim peace..?"	"BOOST BEAST" is a defense puzzle game where players defeat the invading horde of zombies by clearing blocks and summoning animals. \n \nThe controls are simple! \nMatch 3 animal blocks of the same color to summon your cute animal friends and defeat the incoming waves of zombies! \nThere are many gimmicks that stand in your way during your quest to save the world. \nThere are cages that trap your animal friends, rocks that block your path, and the grim reaper who will turn your allies into zombies. \nMake use of bombs and chain combos to pave a path to victory! \n \nJoin forces with your cute animal army and clear all 204 stages! \nLets go animal army! Until the day where peace is restored!	//images.igdb.com/igdb/image/upload/t_thumb/vcxo53agczpfgkf9upjg.jpg
8339	Minecraft: Story Mode	\N	Minecraft: Story Mode will be an all-new narrative-driven game series developed by Telltale in collaboration with Mojang. Set in the world of Minecraft, the series will feature an original story, driven by player choice. It will not be an add-on for Minecraft, but rather a separate stand-alone product that will premiere in 2015 on consoles, computers and mobile devices.	//images.igdb.com/igdb/image/upload/t_thumb/qyixliied162mhrdmokw.jpg
54521	Peach Ball: Senran Kagura	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/cca7nz7gqexdtyhk62za.jpg
53655	Shinobi Refle: Senran Kagura	\N	A Senran Kagura game that focuses on interacting with characters using the HD Rumble feature of the Joy-con controllers.	//images.igdb.com/igdb/image/upload/t_thumb/gtv0fyk2z8axcggz89sq.jpg
37066	Starlink: Battle for Atlas	You choose your pilot, hull, wings and weapons, combine them to build a custom starship and lock it into place atop your game controller. As you pilot your way to a nearby planet within the Atlas Star System, you sense you’re not alone. Suddenly, three enemy ships emerge from a nearby astreroid field and it becomes very clear you are not welcome. You try to fight them off, but realize your current loadout isn’t working in this situation. You make a lightning-fast decision, swap out your wings and weapons on the fly and re-engage, as another epic battle begins to save the galaxy from Grax and the Forgotten Legion.	Starlink: Battle for Atlas is an all-new action-adventure game developed by Ubisoft Toronto. This deep, open-world space saga features Smart Building Technology empowering players to assemble and customize real-world physical starships. Each part attached to the starship appears instantly in-game and players can experiment with different pilot abilities, weapon types, and status effects and unleash devastating combos upon their enemies.	//images.igdb.com/igdb/image/upload/t_thumb/yqe9p7okpwac3aewyh4c.jpg
29143	Mighty Gunvolt Burst	Gunvolt:  \n"While on a mission to try to get back Joule's powers, Gunvolt was swallowed up by a mysterious light. Next thing they knew, they were in an unknown new world where they had a chance meeting with a robot boy named Beck. It was at that point Beck forcibly entered Gunvolt into a competition called the Super Mighty Battle Showdown. Will Gunvolt and Joule be able to escape this world and discover the source of the mysterious light that brought them here?"  \n  \nBeck:  \n"Beck has successfully returned his 8 robot siblings who were rampaging all thoughout the nation back to normal. Hoping to be better prepared for such situations in the future, Dr. White expedited the completion of an advanced weapon system that he had been researching for a while. Beck was training while deep inside a virtual world made by Dr. White, but when he completed his session, he wasn't able to leave. That is when he met a young man named Gunvolt, who by his own power, trapped Beck inside this virtual space. Will Beck be able to escape this virtual world and reveal Gunvolt's intentions."	"The Mighty Gunvolt series is back with Might Gunvolt Burst!  \n  \nThe game systems have been completely revamped and powered up with lots of new additions, including a deep character customiztion system that lets you mold and shape your character into the ultimate hero that works best for you!  \n  \nThe classic pixel style graphics have also been completely redone to blur the line between 8-bit and 16-bit and take you back to the golden age of 2d action games!  \n  \nGunvolt from Azrue Striker Gunvolt 2 and Beck from Mighty No.9 make their return as playable characters!  \nFind out what happens when their home worlds intertwine int the realm of virtual reality!"	//images.igdb.com/igdb/image/upload/t_thumb/ghc3g3aeq5bb1g0cftbj.jpg
29529	Azure Striker GUNVOLT: STRIKER PACK	\N	The game contains both Azure Striker GUNVOLT and Azure Striker GUNVOLT 2 packaged together with all the first games DLC and a new song. \n \nThe Switch version runs at 60 fps, has a new UI, has all previous dlc for both games from the 3DS, has a new theme song, and game play improvements like re-balancing difficulty and changing the Kudos system from the first game to the one used in the second.	//images.igdb.com/igdb/image/upload/t_thumb/lz0jwbcfkyapyo9nqg6i.jpg
31561	Chess Ultra	\N	Introducing Chess Ultra; the most breathtaking chess game ever made. Experience stunning 4K visuals, seamless online multiplayer, Grandmaster approved AI and full VR compatibility.	//images.igdb.com/igdb/image/upload/t_thumb/km3torjdzvkwzu7vhvw4.jpg
52022	Penguin Wars Remake	\N	\N	\N
52190	LEGO Ninjago Movie Video Game	\N	Find your inner ninja with the all-new LEGO Ninjago Movie Video Game! Play as your favorite ninjas, Lloyd, Jay, Kai, Cole, Zane, Nya and Master Wu to defend Ninjago City from the evil Lord Garmadon and his Shark Army. Master the art of Ninja-gility by wall-running, high-jumping and battling the foes of Ninjago to rank up and upgrade the ninja’s combat skills. Only in the LEGO Ninjago Movie Video Game will you experience the film across 8 action packed locations each with its own unique Challenge Dojo. And with the Battle Maps, play against friends and family in competitions for up to four players!	//images.igdb.com/igdb/image/upload/t_thumb/uyswlin92ug9gk8gxyvy.jpg
52191	Super Sidekicks	\N	Published in 1993, the original Super Sidekicks (known as Tokuten Ou, "Goal-Scoring King" in Japan) was SNK's first soccer video game. It features 12 teams divided into two groups which compete for the "SNK Cup" (the main differences between teams is their formations on the field): \n \nGroup A: Germany, Italy, Spain, England, Mexico, Japan \nGroup B: Argentina, Holland, Brazil, France, United States, South Korea \n \nThe players' team plays against all the others in their group, then it goes into an elimination tournament's semifinals and then the final to win the cup. There was also a hidden feature in the game, which wasn't documented, and affects a single player game. During a free kick for the CPU if the player has tapped button A for player two, the CPU performs a short-shot, while pressing the button A performs a longer kick.	\N
28414	Mario + Rabbids: Kingdom Battle	The Mushroom Kingdom has been torn apart by a mysterious vortex, transporting the chaotic Rabbids into this once peaceful land. To restore order, Mario, Luigi, Princess Peach and Yoshi must team up with a whole new crew: four Rabbids heroes! Together, they will battle with weapons through four worlds filled with combat, puzzles, and unpredictable enemies.	This is the story of an unexpected encounter between Mario and the irreverent Rabbids. The Mushroom Kingdom has been torn apart by a mysterious vortex, transporting the Rabbids into the once-peaceful area, splintering this beloved land. To bring order back to the Kingdom, Mario, Luigi, Princess Peach, and Yoshi team up with Rabbids heroes in a journey through four different worlds.	//images.igdb.com/igdb/image/upload/t_thumb/fdfedir0ruao8xm9qcgq.jpg
26758	Super Mario Odyssey	\N	The game has Mario leaving the Mushroom Kingdom to reach an unknown open world-like setting, like Super Mario 64 and Super Mario Sunshine.	//images.igdb.com/igdb/image/upload/t_thumb/kjfbrxvlqgvkcv4uwvif.jpg
26769	Fire Emblem Warriors	That day, the country of Aitriss was covered in uttermost darkness. There was no warning when the “Gates of the Other World” suddenly appeared in the royal castle. Then, powerful monsters gushed out one after the other, trampling the castle garrison.   \n   \n—The royal castle quickly fell. And slowly but surely, darkness ate into the country.   \n   \nHowever, there is still hope. The two shadows who escaped the royal castle covered in flames were Shion and Liane, the children of the late king. And then, the thread of fate spun by the legendary heroes began to spin…   \n   \nCarrying the “Fire Shield” given to them by their mother, the two heroes’ journey to confront the powerful darkness begins here.	"Clash with legions of soldiers and fierce monsters as Marth, Xander, Corrin, and other Fire Emblem heroes unleashing over-the-top-powerful Dynasty Warriors-style moves. Take direct control of known and original Fire Emblem characters, issue them strategic commands in the midst of battle, pair up heroes to unleash stunning attacks, and more. Unlock new playable heroes, each with their own unique moves, special attacks, weapon types, and voiced dialogue in this large-scale action game from the Hyrule Warriors team."	//images.igdb.com/igdb/image/upload/t_thumb/mjz3mqelhvvalnusbq53.jpg
30206	YIIK: A Postmodern RPG	\N	The game is a colourful 3D Japanese-Style RPG. It is set in the 1990s and is based around a mystery in a small town. There are eight characters who are message board friends. They work together to investigate the mystery around a missing viral video star called Sammy Pack, who goes missing in a supernatural event. The player can control the characters in turn based battle where normal everyday objects are used as weapons. The combat consists of turn based moves with timing based actions which can increase the damage of an attack. There are six dungeons to explore which include battles, puzzles which have to be solved and traps that have to be avoided. There are approximately twenty five hours of gameplay.	//images.igdb.com/igdb/image/upload/t_thumb/rqij02i58t9qkzr4gaek.jpg
51540	R.B.I. Baseball 17	\N	\N	\N
11198	Rocket League	\N	Soccer meets racing once again in our long-awaited, MP-focused sequel to Supersonic Acrobatic Rocket-Powered Battle-Cars! \n \nA futuristic Sports-Action game, Rocket League, equips players with booster-rigged vehicles that can be crashed into balls for incredible goals or epic saves across multiple, highly-detailed arenas. Using an advanced physics system to simulate realistic interactions, Rocket League relies on mass and momentum to give players a complete sense of intuitive control in this unbelievable, high-octane re-imagining of association football.	//images.igdb.com/igdb/image/upload/t_thumb/edkpgyqgfsxyiby9pyj5.jpg
28445	Namco Museum	\N	An archive of some of Namco's most popular retro games -- all on one disk.	//images.igdb.com/igdb/image/upload/t_thumb/hpxlr9ejpiewlazz92lo.jpg
51998	Overcooked: Special Edition	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/hphec0rm4bmgtigkdgae.jpg
26503	Troll and I	\N	Deep in the Nordic wilderness, a teenage boy named Otto is forced to flee his home after a band of brutal hunters rip through his village in search of a mythical creature rumored to inhabit the forest. Now on the run for his life, Otto inadvertently finds and befriends the elusive creature being sought by the hunters. Thus begins the perilous adventure of Troll and Otto. \n \nTogether, the unlikely friends embark on a journey through treacherous territory plagued with rivals. Natives to the forest, Troll and Otto must use their inherent skills to sneak, strategize, and battle their way back home. The forest is filled with unknowns, and teamwork is pivotal to staying alive. \n \nA Mythical Adventure: Befriend the fabled Troll and embark on a journey through the Nordic wilderness as two outcasts struggling to survive.  \n \nCooperative Split-Screen Multiplayer: Play through the story campaign locally with a friend. \n \nSeamlessly Switch Characters: Swap between Otto and the Troll on the fly. Play as contrasting characters, each with a unique presence and gameplay functionality. \n \nDiversified Combat: Choose your combat style based on the situation. Become the Troll and stomp hunters with your massive feet, or smash them with your giant fists. Switch to Otto for quick, nimble attacks and fast traversing. \n \nTerrain-Based Weapons and Crafting: Gather materials and craft deadly weapons that you’ll need to survive your journey.	//images.igdb.com/igdb/image/upload/t_thumb/cwmu56awspagzp3wnlfe.jpg
10910	LEGO Worlds	\N	LEGO Worlds is an open environment of procedurally-generated Worlds made entirely of LEGO bricks which you can freely manipulate and dynamically populate with LEGO models. Create anything you can imagine one brick at a time, or use large-scale landscaping tools to create vast mountain ranges and dot your world with tropical islands. Drop in prefabricated structures to build and customize any world to your liking. Explore using helicopters, dragons, motorbikes or even gorillas and unlock treasures that enhance your gameplay. Watch your creations come to life through characters and creatures that interact with you and each other in unexpected ways. In LEGO Worlds, anything is possible!	//images.igdb.com/igdb/image/upload/t_thumb/krz3siliqervujjbioxs.jpg
27314	Morphite	\N	\N	\N
51541	'90s Super GP	\N	\N	\N
28069	Slime-san	\N	Slime-san was minding his own business, sliming around in a peaceful forest when suddenly…A giant worm appeared and gobbled him up!  Now deep within the worm’s belly, Slime-san has to face a decision: Be digested by the incoming wall of stomach acid... Or jump, slide and slime his way through the worms intestines and back out its mouth!	//images.igdb.com/igdb/image/upload/t_thumb/msysvnk3yibafpw6dpxy.jpg
22783	The Sexy Brutale	“The Sexy Brutale” is the Marquis’ renowned grand casino and residence. He is well known for his highly anticipated annual masked ball and his eccentric taste in friends. But something truly evil has found its way into the heart of The Sexy Brutale during this year’s party, turning the ball into a nightmare where the guests are being murdered with no hope for escape.  \n  \nAs the story unfolds in real-time, the player must find answers to every enigma and end the loop, saving all the guests’ lives.	The Sexy Brutale is an adventure, puzzle video game developed by Cavalier Game Studios and Tequila Works. The game was released for PlayStation 4, Windows, and Xbox One in April 2017. \n \nThe player is tasked with exploring a mansion that is stuck in a time loop as its inhabitants are being killed off.	//images.igdb.com/igdb/image/upload/t_thumb/f4k81hfda9eukzlm0vca.jpg
15276	Retro City Rampage DX	\N	Open-world carjacking goes back to the '80s in this 8-BIT nostalgic throwback. \nRun missions! Outrun the law! Rampage the city with weapons, power-ups and vehicles. \n \nThis send-up to '80s and '90s video games and pop-culture includes both a full Story Mode of open-world adventure as well as an Arcade Mode for quick pick-up-and-play action. If that's not enough, it also packs an interactive city full of shops, minigames, customizations, collectibles, special guest stars, and more.	//images.igdb.com/igdb/image/upload/t_thumb/o7mysgzfsueznyb4jih0.jpg
37137	Kirby for Nintendo Switch	\N	Kirby is back in this new title coming to the Nintendo Switch console in HD. Recruit enemies as helpers, use Kirby copy abilities such as Sword, Fire and Water, and join forces with up to three friends for a different kind of team-up action.	//images.igdb.com/igdb/image/upload/t_thumb/txuq2fzocc4dnigskekn.jpg
37135	Yoshi for Nintendo Switch	\N	Yoshi heads on a new adventure in this new action platforming game coming to Nintendo Switch. Explore a great big world decorated like a miniature diorama, look for items throughout the stages and team up with a friend in a new art style for the franchise. \n \n"Lead Yoshi on a brand new adventure that will turn everything you’ve come to expect from side-scrolling games upside down! Explore a great, big world decorated like a miniature diorama in a new art style for the franchise, where each side-scrolling stage has the traditional front side as well as a flip side with different views and surprises. Look for items throughout the stage as Yoshi makes his way to the goal. You can even join up with a friend!"	//images.igdb.com/igdb/image/upload/t_thumb/x9djwckqwzadmyargixg.jpg
37067	Just Dance 2018	\N	No matter where you come from, how old you are, if you are a panda or a carrot: turn up the volume and get ready to unleash your inner dancer, because Just Dance 2018 brings out the dancer in everyone! The biggest music video game franchise of all time*, with over 63 million units sold** is coming back this fall. Whether you are a party starter, a young dancer in the making or a pro dancer looking for new challenges, it’s never been so easy to Just Dance!	//images.igdb.com/igdb/image/upload/t_thumb/r0oruirzwilzojnjqvjo.jpg
25623	Monster Hunter XX	\N	An enhanced version of Monster Hunter X, known as Monster Hunter Generations internationally. It features new monsters, hunting styles, and the more challenging G-Rank quests. \n \nGame data from Monster Hunter X can be carried over, with a one way transfer, to Monster Hunter XX or the newly announced Nintendo Switch version. Game data can also be moved between the 3DS and the Switch version of the game. \n \nThere has been no announcement of a western release.	//images.igdb.com/igdb/image/upload/t_thumb/jvxcmcm0q0zqnkvdiwna.jpg
27666	Sine Mora EX	\N	Sine Mora EX is a side-scrolling shoot'em up that provides a unique challenge, where time is the ultimate factor. Mixing classic shooter sensibilities with contemporary presentation, Sine Mora is a gorgeous shoot'em up offering both a Story Mode that weaves an over-the-top tale and an Arcade Mode that provides deep, satisfying gameplay to challenge fans of the genre. The story mode can be also played in local co-op mode.	//images.igdb.com/igdb/image/upload/t_thumb/jiv7bgz4huuwtalgr15s.jpg
35626	Golf Story	\N	Play the story of a golfer, forced to give up all that he holds dear for one final shot at accomplishing his dream.  \n  \nBut all is not so simple in the world of golf. To best today's players you have to be able to keep up with them not just on the course, but also off it.	//images.igdb.com/igdb/image/upload/t_thumb/sjjomr0yyhlsgtoadm7h.jpg
1821	Dragon Quest X	\N	Dragon Quest X is a subscription based MMORPG, originally released for the Wii, in the Dragon Quest universe. It has had 2 expansions since release. \n \nThe games was later released on Windows, Wii U, 3DS, Android and iOS. It is also planned to be released on PlayStation 4 and the Nintendo Switch. \n \nThe game has only been released in Japan.	//images.igdb.com/igdb/image/upload/t_thumb/xhz4muakv5ovxvzypni1.jpg
5605	Hover: Revolt of Gamers	\N	After their first game "The Secret of Space Octopuses", and after winning the first prize of the 32 hours during Retro Game Jam 2013 of Montpellier (France) with their "Super Commodore Holy Tank Soccer Deluxe", the 3 indies of Fusty Game are back with "Hover: Revolt of Gamers", a futuristic parkour game. Currently in development since november 2013 and based on new technologies like the "Oculus Rift", it takes place in a 3D futuristic open world. The new Mayor of Hover-City is prohibiting video games and all sorts of entertainment. Anyone catched in such a act would be send to hard labour. You play the "Gamers". They created the Resistance to help citizen to get back their consoles, create a diversion among the Cops while others are hacking the Mayor propaganda . In front of Non Playing Characters and other players in multiplayer you have to show your skills (speed race, triks, agility, speed hacking, diversions...). Other Gamers will join you during the adventure. Try to become the leader of the Resistance!	//images.igdb.com/igdb/image/upload/t_thumb/vtj4o4uknl0633aosbp8.jpg
11078	Shantae: Half-Genie Hero	"Shantae is roused from a deep sleep, suddenly alert. She plunges into the moonlit forest in search of answers. In nearby Scuttle Town she discovers a mysterious trapdoor, and beyond that, a luminous subterranean cavern. A familiar voice calls out, drawing Shantae to a beautiful fountain. Touching its waters she is immediately spirited away to the fabled Genie Realm. At her feet a magical seal swells as some powerful evil seeks escape. The chamber trembles with a deep, bellowing roar and everything goes white. Shantae sits upright, back in her bed. Was it just a dream? Or a vision of things to come?"	Shantae embarks on her first full HD adventure! After three highly successful outings with Shantae, Shantae: Risky's Revenge, and Shantae and the Pirate's Curse, Shantae and her friends finally get a full HD console-based sequel! Boasting vivid, detailed high-definition graphics that retain the 2D hand-drawn sprites the series is known for, this newest entry in the Shantae series almost looks like a playable TV show! Presented as a stage-based 2.5D platformer with heavy exploration elements, Shantae uses her trademark Hair-Whip Attack to dispatch enemies, then takes advantage of her Belly Dance Magic to transform into 8 different forms that each have their own unique abilities and move sets. As new forms are mastered, old stages can be re-explored to unearth new items and secrets, ensuring there's plenty of content on offer for novices and platforming gurus alike. Topple the villainous Baron behind each criminal caper afflicting Sequin Land, and prepare for the ultimate showdown against Shantae's arch-nemesis: that bodacious buccaneer, Risky Boots!	//images.igdb.com/igdb/image/upload/t_thumb/nl0xylkr12ta44sufduv.jpg
27261	Touhou Kobuto V: Burst Battle	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/d3cayn7bezwsteqqpb4k.jpg
36597	Cat Quest	\N	Cat Quest is a 2D open world RPG with the exploration of Skyrim, but set in the visual style of an overworld. This is a fantasy world that asks the question of how different it would be if cats lived in it instead of humans!  \nGo to places like the Catpital where the Lion King rules, or experience delicacies like the catnip pie! Talk to the locals, some already on their 7th or 8th lives(what? not all cats have nine lives y'know), and go on a catventure through a world you've never seen before!	//images.igdb.com/igdb/image/upload/t_thumb/utzxi9hpbc0kn3v25dyn.jpg
18734	Violett	\N	Dragged by her par­ents, a young and rebel­lious teenage girl – Vio­lett, moves to an old spooky house in the mid­dle of nowhere. Forced away from her friends and life in the city; she imag­ines how bor­ing life in coun­try­side will be: spend­ing day after day, bored in her room with absolutely noth­ing to do. But what she can­not imag­ine, is that in just few moments, she’ll have the adven­ture of her life.	//images.igdb.com/igdb/image/upload/t_thumb/tpld6kqa1krluppntthr.jpg
21062	Sonic Mania	\N	"It's the ultimate Sonic celebration! Sonic returns in a new 2D platforming high speed adventure, and he's not alone! \n \nDeveloped in collaboration between SEGA, Christian Whitehead, Headcannon, and PagodaWest Games, experience new zones and remixed classic levels with Sonic, Tails, and Knuckles!"	//images.igdb.com/igdb/image/upload/t_thumb/inqvcpnwc8debp3g8c6b.jpg
45026	Next Up Hero	\N	So you think can slay all the monsters and win eternal glory, is that it? Bad news, hero. In the Spiral Shards, we can only send in one hero at a time to fight the Ceaseless Dirge. At some point, a flaming blue fireball, mech mortar rocket, or giant spike of doom is going to hit you in the face, and you’re going to die. That’s when the fun begins. \n \nWhen you die, you’ll leave behind an Echo of your hero on the battlefield. The next hero in line will be able to resurrect your Echo as an AI battle companion. Take turns continuing each other’s games, fighting and dying with friends until you have an entire army of Echoes by your side. Everyone dies. Heroes continue. \n \nNext Up Hero is a 2D action adventure driven by Community Continue. Next Up Hero is inspired by friends taking turns at the arcade to beat unfairly difficult games, and designed so beating a session is a shared victory and more fun than playing on your own. \n \nChoose from nine heroes with an assortment of weapons and abilities to suit your playstyle, from swords and rocket launchers to laser turrets, bongo drums, and boomerangs. Coming this fall, Heroes who complete feats of greatness will gain entry into the Champions Trials, a monthly contest in which Digital Continue throws the hardest monsters they have at you. \n \nDeveloped with community feedback, beginning with an exclusive closed beta at RTX this summer and moving to Steam Early Access in the fall, Digital Continue will incorporate community ideas to improve characters, gameplay, weapons, attacks, and enemy types for the final game. \n \nNext Up Hero is the first game from Digital Continue, founded by Joe Tringali, the co-founder of 5TH Cell, creators of Scribblenauts, Lock’s Quest and Drawn to Life. \n \nFeatures \n \nChampions Trial (Early Access only) - Collect and spend Grand Tokens to gain access to the Champions Trial. These connected adventures will be unique each month. Each Grand Token earns you a single play, so choose your character wisely, and work together with the community to solve puzzles, defeat challenging enemies, and unlock new rewards! \n \nJournal System - Customize and track your own accomplishments stylized like Mad Libs to earn Grand Tokens! \n \nSpotlight Sessions and Leaderboards - Compete with the Community via Daily, Weekly and Monthly Leaderboards! Participate in a Session with your favorite Streamer or Celebrity in VIP Sessions! \n \nAsynchronous Co-Op - Engage in a cutting edge style of cooperative play, Community Continue, where beating community sessions is a shared achievement, and more fun than playing on your own. \n \nCharacter Customization - Defeat enemies to acquire their abilities to combine with your character of choice for thousands of potential deadly loadouts! \n \nAbility-based Progression - Hunt and defeat dozens of monsters to master their abilities on your way to eternal glory!	//images.igdb.com/igdb/image/upload/t_thumb/pq0ymeehfcqnywcfbvqq.jpg
24474	Masquerada: Songs and Shadows	\N	Navigate the masked deceptions and deadly magic of a vividly Venetian city in this fully voiced pause-for-tactics RPG	//images.igdb.com/igdb/image/upload/t_thumb/bzx4vo5n1savwx3q3ubj.jpg
13555	Indivisible	\N	Indivisible is a side-scrolling RPG in the vein of Valkyrie Profile, spanning a huge fantasy world inspired by our own world’s various cultures and mythologies.  \n  \nPlayers will navigate beautiful environments using a variety of different traversal abilities, and engage monsters in fast-paced combat.	//images.igdb.com/igdb/image/upload/t_thumb/euav5wwmmvetjkjfwqoa.jpg
12511	Battle Chasers: Nightwar	\N	Battle Chasers: Nightwar is an RPG inspired by the classic console greats, featuring deep dungeon diving, turn-based combat presented in a classic JRPG format, and tons of secrets, story and randomly-generated replay goodness. The game is being created by ex-Vigil Games veterans, including two of Vigil's co-founders, Joe Madureira and Ryan Stefanelli. \n \nupdated Timeframe: \nAlpha: 4th Quarter 2016 (Targeting end of November) \nBeta: 1st Quarter 2017 (Targeting January) \nFull Launch: Mid-2017	//images.igdb.com/igdb/image/upload/t_thumb/a3dooek0fjczvvia50xi.jpg
51950	Ultra Hyperball	\N	Climb the ranks in the game's single player story mode. Play as Jay, an unlikely hero, battling against the odds to join the Hyperball league!	\N
28652	Prodigy	\N	Prodigy is a head to head tactical role playing game with mixed turn based and real time multiplayer action, pitting your heroes against those of your friends or online opponent with match-making and ranked play. A deep tactical game system makes the game complex and interesting at its core because of several possibilities and combinations between characters and their powers, yet easy to learn and understand.	\N
28113	Use Your Words	\N	"Grab a few friends and get ready to laugh. Use Your Words is the party game for funny people and their unfunny friends! \n \nUse Your Words is a game that invites players to respond to a variety of mini-games and prompts with the funniest answers they can think of! Players play using their phones and tablets as controllers, making game-play seamless and quick to pick up. Players who get stumped can use one of the hidden "House Answers" to lay a trap for their fellow players once it's time for everyone to vote for their favorite. \n \nWhether you're a total novice or a world-famous comedian, we guarantee hours of non-stop hilarity. So, grab a few friends and get ready to laugh along with Use Your Words!"	//images.igdb.com/igdb/image/upload/t_thumb/fkssv3urlnqwcyj0lfpu.jpg
7621	Rime	The game's back story involves a boy who needs to escape an island and a curse.	A land of discovery stretches out before you. Explore the beautiful yet rugged world of RiME, a single-player puzzle adventure. In RiME, you play as a young boy who has awakened on a mysterious island after a torrential storm. You see wild animals, long-forgotten ruins and a massive tower that beckons you to come closer. Armed with your wits and a will to overcome—and the guidance of a helpful fox—you must explore the enigmatic island, reach the tower's peak, and unlock its closely guarded secrets.	//images.igdb.com/igdb/image/upload/t_thumb/zzzwcxke7bzbtl0jbtuu.jpg
39300	Strikers 1945	\N	In 1945, the second world war ended. Soon, there was peace, but an organization of high-ranking military officers from all over the world form a global army known as CANY. Their mission was to conquer the world. CANY activity was found in areas like the Soviet Union, America, Japan, and even Germany. It is revealed that CANY had weapons never seen before from rockets to mechanical walkers. The world quickly formed a group of pilots and planes called the Strikers whose mission is to rid of CANY from the world.	//images.igdb.com/igdb/image/upload/t_thumb/mdivzcvkc77c190x1bj1.jpg
54529	Puzzle Adventure Blockle	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/es4ndomnczxguoefwnqg.jpg
10960	Thumper	\N	Thumper is a rhythm violence game. It combines classic rhythm-action with breakneck speed and brutal physicality. \n \nThumper strips rhythm gaming down to its core. Classic rhythm-action is combined with breakneck speed and brutal physicality. With one analog stick and one button, you control a space beetle while hurtling through stunning and treacherous worlds. Each rhythmic hit, crash, and impact is interwoven with an original soundtrack by Brian Gibson of the acclaimed noise-rock band Lightning Bolt. \n \nThere’s no blood or gore, but you’ll feel the violence. \n \nThe basic move set of thumping, sliding, and turning is easy to learn. But as you careen onward, you’ll need to master new moves and survive adrenalizing boss encounters. To reach synesthetic bliss, you must go through rhythm hell. \n \nAnd nothing can prepare you for the ultimate confrontation with an insane giant head from the future: CRAKHED.	//images.igdb.com/igdb/image/upload/t_thumb/izwdsekdpxtwizv044sz.jpg
23581	NeuroVoider	\N	NeuroVoider is a twin-stick shooter RPG set in a cyber futuristic world about brains shooting around evil robots with nuclear rocket launchers. Battle through the horde of vigilant robots, boost your character with the smoking remains of your victims, and defeat the master NeuroVoider to end this eternal war. Play it coop with up to 4 friends, or go alone in an adventure of hack'n'slash rampage, with a pinch of rogue-lite, and some permadeath.	//images.igdb.com/igdb/image/upload/t_thumb/rjtankdrphn1nj96atpj.jpg
32856	League of Evil	\N	League of Evil is an action game where you, as a bionic super agent take on the mission to defeat the League of Evil. Use your acrobatic skills to punch your way through levels filled with deadly traps and defeat your enemies. The world is counting on you!	//images.igdb.com/igdb/image/upload/t_thumb/j6f9arrx1qigyfiywyyd.jpg
28244	Nobunaga’s Ambition: Taishi	\N	\N	\N
54548	Dragon Quest Builders 2	\N	\N	\N
27714	Phantom Trigger	\N	Phantom Trigger is a Hardcore Neon Slasher with RPG and Roguelike elements. Figure out what's real as you follow the story of Stan on a journey through surreal and twisted worlds.	//images.igdb.com/igdb/image/upload/t_thumb/ycvrzucqzpotmzpezrbi.jpg
27239	Rayman Legends: Definitive Edition	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/szfdeoxgeluuthvslasn.jpg
11349	Ironcast	\N	Puzzlequest meets FTL in this Steampunk Victorian era roguelite.	//images.igdb.com/igdb/image/upload/t_thumb/fh70lo6xt5yanuq0aavm.jpg
6066	Severed	\N	Severed Is a first-person dungeon crawler that uses touch based combat mechanics. It has a loot and crafting system based on severing enemy body parts to create and upgrade armor.	//images.igdb.com/igdb/image/upload/t_thumb/ihk9p25vgtjjpmeyelo6.jpg
8652	Axiom Verge	\N	A failed scientist dies in an accident, only to awaken in a mysterious, alien world. \nWhere is he? How did he get here? And why do the fundamental laws of reality appear broken? \nLife. Afterlife. Real. Virtual. Dream. Nightmare. It's a thin line. \nIt's Axiom Verge.	//images.igdb.com/igdb/image/upload/t_thumb/xaptm5lnwcofeidsceba.jpg
54565	Tempest 4000	\N	"In Tempest 4000, players are once again in control of the Claw, a powerful spacecraft equipped to destroy deadly creatures and other obstructions with rapid-fire shots on vibrant geometric prisms. With three game modes to choose from and 100 levels to conquer, players must eliminate all enemies as quickly as possible to survive and achieve that coveted spot at the top of the leaderboards."	\N
36814	Atelier Lydie & Soeur: Alchemists of the Mysterious Painting	\N	The newest game in the Atelier franchise and third game in the Mysterious series. \n \nThe game features two main characters and is reported as being different than the last two Atelier: Mysterious games but details on it are to be released at a later date.	//images.igdb.com/igdb/image/upload/t_thumb/e2tj8xk2joswa1iijt6i.jpg
54566	Winning post 8 2017	\N	\N	\N
54567	Champion Jockey: Special	\N	\N	//images.igdb.com/igdb/image/upload/t_thumb/fybx8shdugojm8uzkd4k.jpg
27419	Brawlout	\N	Brawlout is the competitive platform fighter, designed for couch play, online ranked matches and competitive tournaments.	//images.igdb.com/igdb/image/upload/t_thumb/iaalkeiurvgen6es5h22.jpg
51535	Re:Legend	\N	"Washed ashore on Vokka Island without memories, you must start a new life and find ways to recover your lost memories. \n \nIn order to do so, you must first learn how to survive on the island by cultivating the land, befriending villagers, expanding the village and raising your very own magical creature known as "Magnus". \n \nVenture around the land of Ethia where vokka island resides to reclaim your memories is no easy task as the world is filled with dangerous Magnus and threatening challenges. \n \nWill you be able to survive and rebuild your own Legend in your new life? Your fate is in your hand!"	//images.igdb.com/igdb/image/upload/t_thumb/bt5pwjbzd6hspttfujib.jpg
54590	INVERSUS Deluxe	\N	\N	\N
28493	Piczle Lines DX	\N	\N	\N
9732	The Flame in the Flood	\N	A rogue-lite river journey through the backwaters of a forgotten post-societal America. Forage, craft, evade predators. \n \nTravel by foot and by raft down a procedurally-generated river as you scrounge for resources, craft tools, remedy afflictions, evade the vicious wildlife, and most importantly, stay ahead of the coming rains.	//images.igdb.com/igdb/image/upload/t_thumb/y3vpwb9yvne9xjgaisnd.jpg
16992	Human: Fall Flat	\N	Human: Fall Flat is an open-ended physics based puzzle game in which you take control of builder Bob helping him resolve the mysteries behind his recurring dreams of falling. Your goal is to escape those dreams full of puzzles, dangers and surprises using everything you find in the levels. The world of Bob dreams is built on his daily experiences, hopes, fears and memories interweaved in a net so sticky and hard to escape. All this mess is actually a carefully crafted work of… wait! You are the one to find it out! Bob is a human. Just a human. No hero. Zero superpowers. Period. \n \nWith open-ended simulator at its core “Human: Fall Flat” allows you to relive Bobs story your own way. Every shortcut can be taken, every solution is welcome! The game requires creativity and imagination. These often surreal environments do obey very real laws of the physics, if you think an object could be moved then rest assured it can. Replay value is limited only by your imagination.	//images.igdb.com/igdb/image/upload/t_thumb/qklq5kphfmds3jwx9dtr.jpg
25795	Cartoon Network: Battle Crashers	\N	"When Uncle Grandpa accidentally drives the UG-RV through multiple dimensions, he picks up some surprise passengers in the form of Gumball, Steven Universe, Finn, Mordecai and Clarence! Now they'll have to band together to defeat the evil shard creatures and set things right. Use each character's unique attacks and special moves to conquer the elements, fight your way through all the levels and beat some brutal boss battles. Replay maps with special modifiers to switch up the fun, and unlock bonus rooms along the way. Take on the single-player challenge in this crazy interdimensional adventure." \n \n(3DS Version does not have multiplayer)	//images.igdb.com/igdb/image/upload/t_thumb/vbpbint1nqdlutoq0nnx.jpg
42932	Monster Jam: Crush It	\N	Monster Jam: Crush It! features a massive variety of game modes with online and offline leaderboards and a colossal emphasis on stadium events, big stunts and destruction. The game offers classic, competitive stadium racing and freestyle, and gives gamers the ability to perform gravity-defying stunts for huge rewards throughout over 96 different challenges in survivor, stunt and hill climb race modes. Out-of-stadium experiences include action in polar, desert, harbor and forest environments, powered by Unreal Engine 4, with main music produced by Somatone Interactive. There are 24 fully licensed and playable trucks to choose from in Monster Jam: Crush It!, including real-life legends like Grave Digger®, Monster Mutt®, Blue Thunder® and ZombieTM. The game captures a cinematic, live-event feel across six genuine Monster Jam arenas.	\N
23352	Pan-Pan	\N	Pan-Pan is an open plain adventure that expands on the concept of environmental narrative storytelling with puzzle solving and exploration elements at its core.	//images.igdb.com/igdb/image/upload/t_thumb/juycdat4k3lbwiewaurn.jpg
54724	Eat All The Things	Eat All The Things You play as Bronut, a little guy who loves food so much he's dressed himself up as a donut. His love for food means he just can't help himself, whether the food belongs to him or not. \n \nNavigate many vibrant levels and help Bronut eat all the things! It's not all smooth eating though - beware of the watcher and the evil host! They're not really evil of course, after all it's their food... but anything that gets between Bronut and his treats is the enemy! \n \nThe watcher keeps watch on the stage with a spotlight, avoid it at all costs! Otherwise, the evil host will be alerted of your location and you will have to run and hide! Don't get caught! Be sure to make use of terrain and objects to hide from the spotlight. \n \nAs it goes, Bronut doesn't count his macros... he puts on weight with each snack, making him larger and slower. But putting on the weight can work out in your favour! You can weigh down big switches, reach higher places, resist high-speed winds, and much more! Be sure to visit your local TABLET station to "unload" when you need to! \n \nAs you progress through the game you will encounter new and interesting foods, such as colder than cold ice creams and the sweetest of sweet doughnuts. These may give you side-effects such as brain freeze (enabling you to walk on lava), and a sugar rush (increased run speed and jump height).	Eat All The Thing is a 3D platformer with a stealth element. Eat all the things without getting caught! Targetting Nintendo Switch, PC, Mac, Linux, and Android.	//images.igdb.com/igdb/image/upload/t_thumb/yehiptwqjaf6ha2jotfn.jpg
\.


--
-- Data for Name: gamesystems; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY gamesystems (gamesystem_id, game_id, system_id) FROM stdin;
1	38983	130
2	10232	130
3	885	130
4	11529	130
5	19081	130
6	19175	130
7	29525	130
8	36846	130
9	27081	130
10	21063	130
11	11667	130
12	17000	130
13	7346	130
14	26764	130
15	19550	130
16	19554	130
17	26765	130
18	26766	130
19	13197	130
20	26771	130
21	26775	130
22	24703	130
23	19457	130
24	13163	130
25	25599	130
26	26761	130
27	8618	130
28	26831	130
29	26845	130
30	26848	130
31	26872	130
32	8617	130
33	26300	130
34	14298	130
35	26890	130
36	18861	130
37	27037	130
38	6866	130
39	53790	130
40	26364	130
41	14593	130
42	19220	130
43	18158	130
44	27240	130
45	27241	130
46	27242	130
47	26768	130
48	36794	130
49	19278	130
50	27367	130
51	27376	130
52	27377	130
53	2177	130
54	27407	130
55	17069	130
56	27397	130
57	27433	130
58	27434	130
59	27435	130
60	27436	130
61	27438	130
62	26363	130
63	27441	130
64	27443	130
65	23689	130
66	11247	130
67	9567	130
68	20392	130
69	27378	130
70	11598	130
71	25653	130
72	27447	130
73	25658	130
74	27526	130
75	11122	130
76	27527	130
77	27529	130
78	1879	130
79	27532	130
80	40968	130
81	27519	130
82	24440	130
83	26760	130
84	26762	130
85	8959	130
86	27534	130
87	26774	130
88	19576	130
89	23910	130
90	26816	130
91	9484	130
92	11070	130
93	14694	130
94	10760	130
95	26780	130
96	26833	130
97	18975	130
98	12875	130
99	27872	130
100	978	130
101	25636	130
102	41825	130
103	41893	130
104	36856	130
105	41812	130
106	41826	130
107	41829	130
108	27916	130
109	14545	130
110	942	130
111	1363	130
112	26226	130
113	19799	130
114	20123	130
115	27505	130
116	26009	130
117	44101	130
118	28075	130
119	44078	130
120	43363	130
121	36534	130
122	10031	130
123	28067	130
124	19729	130
125	26763	130
126	26857	130
127	26759	130
128	28129	130
129	28015	130
130	13681	130
131	26773	130
132	19452	130
133	28174	130
134	14393	130
135	15429	130
136	1408	130
137	28412	130
138	31558	130
139	28409	130
140	28416	130
141	28418	130
142	2058	130
143	28081	130
144	26870	130
145	28451	130
146	28452	130
147	28466	130
148	15426	130
149	26818	130
150	28500	130
151	28507	130
152	19082	130
153	27051	130
154	121	130
155	19449	130
156	16932	130
157	19002	130
158	51407	130
159	51409	130
160	51408	130
161	28815	130
162	28843	130
163	26772	130
164	37078	130
165	51518	130
166	8339	130
167	54521	130
168	53655	130
169	37066	130
170	29143	130
171	29529	130
172	31561	130
173	52022	130
174	52190	130
175	52191	130
176	28414	130
177	26758	130
178	26769	130
179	30206	130
180	51540	130
181	11198	130
182	28445	130
183	51998	130
184	26503	130
185	10910	130
186	27314	130
187	51541	130
188	28069	130
189	22783	130
190	15276	130
191	37137	130
192	37135	130
193	37067	130
194	25623	130
195	27666	130
196	35626	130
197	1821	130
198	5605	130
199	11078	130
200	27261	130
201	36597	130
202	18734	130
203	21062	130
204	45026	130
205	24474	130
206	13555	130
207	12511	130
208	51950	130
209	28652	130
210	28113	130
211	7621	130
212	39300	130
213	54529	130
214	10960	130
215	23581	130
216	32856	130
217	28244	130
218	54548	130
219	27714	130
220	27239	130
221	11349	130
222	6066	130
223	8652	130
224	54565	130
225	36814	130
226	54566	130
227	54567	130
228	27419	130
229	51535	130
230	54590	130
231	28493	130
232	9732	130
233	16992	130
234	25795	130
235	16693	130
236	37032	130
237	36777	130
238	42932	130
239	23352	130
240	54724	130
\.


--
-- Name: gamesystems_gamesystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('gamesystems_gamesystem_id_seq', 240, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY genres (genre_id, name) FROM stdin;
7	Music
8	Platform
9	Puzzle
10	Racing
11	Real Time Strategy (RTS)
12	Role-playing (RPG)
13	Simulator
14	Sport
15	Strategy
16	Turn-based strategy (TBS)
24	Tactical
25	Hack and slash/Beat 'em up
26	Quiz/Trivia
30	Pinball
31	Adventure
32	Indie
33	Arcade
2	Point-and-click
4	Fighting
5	Shooter
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY ratings (rating_id, user_id, game_id, score) FROM stdin;
1	1	38983	1
2	1	10232	1
3	1	885	5
4	1	11529	5
5	1	19081	2
6	1	19175	1
7	1	29525	3
8	1	36846	2
9	1	27081	4
10	1	21063	3
11	1	11667	4
12	1	13163	1
13	1	17000	4
14	1	7346	4
15	1	26764	2
16	1	19550	4
17	1	19554	2
18	1	26765	5
19	1	26766	1
20	1	13197	3
21	1	26771	4
22	1	26775	2
23	1	24703	5
24	1	19457	2
25	1	25599	5
26	1	26761	4
27	1	8618	5
28	1	26831	4
29	1	26845	3
30	1	26848	4
31	1	26872	3
32	1	8617	4
33	1	26300	2
34	1	14298	2
35	1	26890	2
36	1	18861	1
37	1	27037	5
38	1	6866	5
39	1	53790	1
40	1	26364	3
41	1	43363	3
42	1	14593	2
43	1	19220	2
44	1	18158	3
45	1	27240	1
46	1	27241	5
47	1	27242	3
48	1	26768	3
49	1	36794	5
50	1	19278	1
51	1	27367	3
52	1	27376	1
53	1	27377	2
54	1	2177	3
55	1	27407	2
56	1	17069	2
57	1	27397	2
58	1	27433	1
59	1	27434	4
60	1	27435	5
61	1	27436	3
62	1	27438	2
63	1	26363	1
64	1	27441	3
65	1	27443	2
66	1	23689	4
67	1	11247	2
68	1	9567	3
69	1	16693	3
70	1	20392	1
71	1	27378	3
72	1	11598	1
73	1	25653	3
74	1	27447	1
75	1	25658	1
76	1	27526	3
77	1	11122	4
78	1	27527	3
79	1	27529	5
80	1	1879	1
81	1	27532	5
82	1	40968	2
83	1	27519	4
84	1	24440	1
85	1	26760	1
86	1	26762	2
87	1	37032	5
88	1	8959	3
89	1	27534	3
90	1	26774	3
91	1	19576	3
92	1	23910	1
93	1	26816	4
94	1	9484	1
95	1	11070	1
96	1	14694	2
97	1	10760	5
98	1	26780	2
99	1	26833	5
100	1	18975	2
101	1	12875	1
102	1	27872	4
103	1	978	4
104	1	25636	5
105	1	41825	2
106	1	41893	3
107	1	36856	2
108	1	41812	1
109	1	41826	5
110	1	41829	2
111	1	27916	5
112	1	14545	5
113	1	36534	5
114	1	36777	3
115	1	942	5
116	1	1363	5
117	1	26226	1
118	1	19799	1
119	1	20123	3
120	1	27505	4
121	1	26009	4
122	1	44101	1
123	1	28075	5
124	1	44078	1
125	1	10031	1
126	1	28067	1
127	1	19729	4
128	1	26763	4
129	1	26857	4
130	1	26759	2
131	1	28129	5
132	1	28015	4
133	1	13681	5
134	1	26773	5
135	1	19452	2
136	1	28174	2
137	1	14393	2
138	1	15429	4
139	1	1408	1
140	1	28412	2
141	1	31558	1
142	1	28409	3
143	1	28416	3
144	1	28418	5
145	1	2058	1
146	1	28081	5
147	1	26870	5
148	1	28451	2
149	1	28452	2
150	1	28466	2
151	1	51409	5
152	1	51408	1
153	1	15426	3
154	1	26818	3
155	1	28500	2
156	1	28507	4
157	1	19082	5
158	1	27051	5
159	1	121	2
160	1	19449	3
161	1	16932	4
162	1	19002	1
163	1	51407	4
164	1	28815	4
165	1	28843	4
166	1	26772	5
167	1	37078	1
168	1	51518	3
169	1	8339	2
170	1	54521	4
171	1	53655	1
172	1	37066	1
173	1	29143	5
174	1	29529	2
175	1	31561	5
176	1	52022	1
177	1	52190	2
178	1	52191	1
179	1	28414	4
180	1	26758	4
181	1	26769	3
182	1	30206	3
183	1	51540	5
184	1	11198	1
185	1	28445	4
186	1	51998	3
187	1	26503	5
188	1	10910	1
189	1	27314	2
190	1	51541	1
191	1	28069	5
192	1	22783	3
193	1	15276	3
194	1	37137	4
195	1	37135	1
196	1	37067	5
197	1	25623	1
198	1	27666	1
199	1	35626	3
200	1	1821	2
201	1	5605	2
202	1	11078	3
203	1	27261	3
204	1	36597	1
205	1	18734	5
206	1	21062	3
207	1	45026	2
208	1	24474	3
209	1	13555	3
210	1	12511	1
211	1	51950	3
212	1	28652	4
213	1	28113	4
214	1	7621	1
215	1	39300	3
216	1	54529	4
217	1	10960	1
218	1	23581	4
219	1	32856	5
220	1	28244	5
221	1	54548	3
222	1	27714	4
223	1	27239	3
224	1	11349	1
225	1	6066	2
226	1	8652	5
227	1	54565	5
228	1	36814	1
229	1	54566	3
230	1	54567	4
231	1	27419	4
232	1	51535	1
233	1	54590	3
234	1	28493	5
235	1	9732	1
236	1	16992	5
237	1	25795	2
238	1	42932	2
239	1	23352	1
240	1	54724	3
241	2	38983	5
242	2	10232	3
243	2	885	1
244	2	11529	1
245	2	19081	1
246	2	19175	4
247	2	29525	2
248	2	36846	5
249	2	27081	3
250	2	21063	4
251	2	11667	3
252	2	13163	5
253	2	17000	3
254	2	7346	1
255	2	26764	4
256	2	19550	5
257	2	19554	2
258	2	26765	3
259	2	26766	3
260	2	13197	5
261	2	26771	2
262	2	26775	1
263	2	24703	4
264	2	19457	2
265	2	25599	1
266	2	26761	5
267	2	8618	3
268	2	26831	3
269	2	26845	2
270	2	26848	3
271	2	26872	3
272	2	8617	4
273	2	26300	4
274	2	14298	5
275	2	26890	3
276	2	18861	4
277	2	27037	2
278	2	6866	5
279	2	53790	2
280	2	26364	5
281	2	43363	5
282	2	14593	3
283	2	19220	3
284	2	18158	5
285	2	27240	2
286	2	27241	2
287	2	27242	5
288	2	26768	2
289	2	36794	2
290	2	19278	2
291	2	27367	5
292	2	27376	1
293	2	27377	3
294	2	2177	2
295	2	27407	1
296	2	17069	5
297	2	27397	2
298	2	27433	4
299	2	27434	5
300	2	27435	5
301	2	27436	2
302	2	27438	4
303	2	26363	5
304	2	27441	2
305	2	27443	4
306	2	23689	3
307	2	11247	1
308	2	9567	1
309	2	16693	5
310	2	20392	2
311	2	27378	1
312	2	11598	4
313	2	25653	3
314	2	27447	3
315	2	25658	2
316	2	27526	5
317	2	11122	5
318	2	27527	2
319	2	27529	3
320	2	1879	1
321	2	27532	2
322	2	40968	3
323	2	27519	4
324	2	24440	2
325	2	26760	1
326	2	26762	1
327	2	37032	2
328	2	8959	5
329	2	27534	1
330	2	26774	3
331	2	19576	5
332	2	23910	5
333	2	26816	3
334	2	9484	5
335	2	11070	5
336	2	14694	1
337	2	10760	1
338	2	26780	4
339	2	26833	1
340	2	18975	4
341	2	12875	1
342	2	27872	4
343	2	978	3
344	2	25636	2
345	2	41825	4
346	2	41893	2
347	2	36856	4
348	2	41812	4
349	2	41826	3
350	2	41829	5
351	2	27916	2
352	2	14545	3
353	2	36534	2
354	2	36777	1
355	2	942	2
356	2	1363	5
357	2	26226	2
358	2	19799	3
359	2	20123	5
360	2	27505	2
361	2	26009	1
362	2	44101	2
363	2	28075	5
364	2	44078	2
365	2	10031	1
366	2	28067	2
367	2	19729	1
368	2	26763	4
369	2	26857	3
370	2	26759	2
371	2	28129	2
372	2	28015	1
373	2	13681	2
374	2	26773	3
375	2	19452	3
376	2	28174	2
377	2	14393	3
378	2	15429	2
379	2	1408	2
380	2	28412	3
381	2	31558	2
382	2	28409	1
383	2	28416	2
384	2	28418	1
385	2	2058	2
386	2	28081	1
387	2	26870	1
388	2	28451	1
389	2	28452	3
390	2	28466	4
391	2	51409	3
392	2	51408	1
393	2	15426	2
394	2	26818	3
395	2	28500	1
396	2	28507	3
397	2	19082	1
398	2	27051	3
399	2	121	2
400	2	19449	2
401	2	16932	1
402	2	19002	1
403	2	51407	1
404	2	28815	4
405	2	28843	2
406	2	26772	4
407	2	37078	5
408	2	51518	4
409	2	8339	5
410	2	54521	3
411	2	53655	2
412	2	37066	3
413	2	29143	5
414	2	29529	4
415	2	31561	1
416	2	52022	1
417	2	52190	1
418	2	52191	5
419	2	28414	2
420	2	26758	3
421	2	26769	5
422	2	30206	4
423	2	51540	5
424	2	11198	3
425	2	28445	3
426	2	51998	3
427	2	26503	2
428	2	10910	1
429	2	27314	3
430	2	51541	1
431	2	28069	5
432	2	22783	1
433	2	15276	4
434	2	37137	4
435	2	37135	2
436	2	37067	1
437	2	25623	2
438	2	27666	5
439	2	35626	4
440	2	1821	2
441	2	5605	2
442	2	11078	2
443	2	27261	4
444	2	36597	2
445	2	18734	4
446	2	21062	3
447	2	45026	5
448	2	24474	5
449	2	13555	4
450	2	12511	2
451	2	51950	2
452	2	28652	1
453	2	28113	5
454	2	7621	2
455	2	39300	2
456	2	54529	2
457	2	10960	1
458	2	23581	2
459	2	32856	2
460	2	28244	4
461	2	54548	3
462	2	27714	4
463	2	27239	5
464	2	11349	1
465	2	6066	5
466	2	8652	1
467	2	54565	1
468	2	36814	5
469	2	54566	4
470	2	54567	4
471	2	27419	4
472	2	51535	1
473	2	54590	3
474	2	28493	5
475	2	9732	4
476	2	16992	4
477	2	25795	3
478	2	42932	3
479	2	23352	3
480	2	54724	5
481	3	38983	5
482	3	10232	1
483	3	885	5
484	3	11529	3
485	3	19081	1
486	3	19175	2
487	3	29525	2
488	3	36846	1
489	3	27081	5
490	3	21063	3
491	3	11667	4
492	3	13163	4
493	3	17000	5
494	3	7346	1
495	3	26764	4
496	3	19550	3
497	3	19554	4
498	3	26765	1
499	3	26766	5
500	3	13197	1
501	3	26771	3
502	3	26775	3
503	3	24703	2
504	3	19457	2
505	3	25599	2
506	3	26761	2
507	3	8618	5
508	3	26831	5
509	3	26845	4
510	3	26848	3
511	3	26872	1
512	3	8617	2
513	3	26300	4
514	3	14298	4
515	3	26890	2
516	3	18861	1
517	3	27037	4
518	3	6866	2
519	3	53790	1
520	3	26364	1
521	3	43363	5
522	3	14593	3
523	3	19220	5
524	3	18158	4
525	3	27240	5
526	3	27241	5
527	3	27242	1
528	3	26768	2
529	3	36794	4
530	3	19278	4
531	3	27367	1
532	3	27376	4
533	3	27377	2
534	3	2177	4
535	3	27407	3
536	3	17069	2
537	3	27397	2
538	3	27433	2
539	3	27434	5
540	3	27435	1
541	3	27436	5
542	3	27438	2
543	3	26363	2
544	3	27441	5
545	3	27443	1
546	3	23689	3
547	3	11247	4
548	3	9567	4
549	3	16693	3
550	3	20392	1
551	3	27378	3
552	3	11598	5
553	3	25653	1
554	3	27447	5
555	3	25658	5
556	3	27526	2
557	3	11122	2
558	3	27527	5
559	3	27529	2
560	3	1879	2
561	3	27532	4
562	3	40968	5
563	3	27519	2
564	3	24440	3
565	3	26760	2
566	3	26762	3
567	3	37032	3
568	3	8959	4
569	3	27534	1
570	3	26774	3
571	3	19576	3
572	3	23910	4
573	3	26816	4
574	3	9484	1
575	3	11070	3
576	3	14694	5
577	3	10760	3
578	3	26780	3
579	3	26833	5
580	3	18975	2
581	3	12875	1
582	3	27872	3
583	3	978	1
584	3	25636	2
585	3	41825	3
586	3	41893	3
587	3	36856	2
588	3	41812	5
589	3	41826	4
590	3	41829	2
591	3	27916	2
592	3	14545	4
593	3	36534	1
594	3	36777	2
595	3	942	5
596	3	1363	1
597	3	26226	4
598	3	19799	4
599	3	20123	1
600	3	27505	1
601	3	26009	2
602	3	44101	3
603	3	28075	4
604	3	44078	3
605	3	10031	1
606	3	28067	5
607	3	19729	4
608	3	26763	4
609	3	26857	4
610	3	26759	2
611	3	28129	5
612	3	28015	1
613	3	13681	1
614	3	26773	4
615	3	19452	4
616	3	28174	1
617	3	14393	2
618	3	15429	2
619	3	1408	3
620	3	28412	5
621	3	31558	5
622	3	28409	2
623	3	28416	1
624	3	28418	2
625	3	2058	5
626	3	28081	5
627	3	26870	1
628	3	28451	2
629	3	28452	1
630	3	28466	2
631	3	51409	1
632	3	51408	3
633	3	15426	4
634	3	26818	5
635	3	28500	1
636	3	28507	5
637	3	19082	4
638	3	27051	1
639	3	121	1
640	3	19449	5
641	3	16932	5
642	3	19002	1
643	3	51407	1
644	3	28815	4
645	3	28843	4
646	3	26772	5
647	3	37078	5
648	3	51518	2
649	3	8339	2
650	3	54521	1
651	3	53655	3
652	3	37066	5
653	3	29143	2
654	3	29529	5
655	3	31561	4
656	3	52022	3
657	3	52190	3
658	3	52191	1
659	3	28414	1
660	3	26758	4
661	3	26769	3
662	3	30206	1
663	3	51540	2
664	3	11198	3
665	3	28445	2
666	3	51998	4
667	3	26503	2
668	3	10910	2
669	3	27314	1
670	3	51541	5
671	3	28069	4
672	3	22783	1
673	3	15276	2
674	3	37137	5
675	3	37135	1
676	3	37067	4
677	3	25623	3
678	3	27666	3
679	3	35626	2
680	3	1821	4
681	3	5605	5
682	3	11078	4
683	3	27261	3
684	3	36597	3
685	3	18734	3
686	3	21062	2
687	3	45026	2
688	3	24474	5
689	3	13555	5
690	3	12511	5
691	3	51950	2
692	3	28652	5
693	3	28113	2
694	3	7621	4
695	3	39300	3
696	3	54529	3
697	3	10960	5
698	3	23581	3
699	3	32856	5
700	3	28244	4
701	3	54548	1
702	3	27714	4
703	3	27239	5
704	3	11349	1
705	3	6066	2
706	3	8652	4
707	3	54565	2
708	3	36814	5
709	3	54566	4
710	3	54567	5
711	3	27419	4
712	3	51535	5
713	3	54590	4
714	3	28493	5
715	3	9732	5
716	3	16992	5
717	3	25795	2
718	3	42932	2
719	3	23352	4
720	3	54724	1
721	4	38983	3
722	4	10232	5
723	4	885	5
724	4	11529	5
725	4	19081	2
726	4	19175	3
727	4	29525	2
728	4	36846	1
729	4	27081	1
730	4	21063	3
731	4	11667	5
732	4	13163	5
733	4	17000	5
734	4	7346	1
735	4	26764	4
736	4	19550	1
737	4	19554	1
738	4	26765	2
739	4	26766	3
740	4	13197	3
741	4	26771	4
742	4	26775	4
743	4	24703	2
744	4	19457	1
745	4	25599	2
746	4	26761	3
747	4	8618	3
748	4	26831	4
749	4	26845	5
750	4	26848	1
751	4	26872	2
752	4	8617	4
753	4	26300	5
754	4	14298	3
755	4	26890	5
756	4	18861	2
757	4	27037	5
758	4	6866	2
759	4	53790	1
760	4	26364	3
761	4	43363	1
762	4	14593	5
763	4	19220	4
764	4	18158	3
765	4	27240	5
766	4	27241	1
767	4	27242	5
768	4	26768	2
769	4	36794	4
770	4	19278	4
771	4	27367	4
772	4	27376	5
773	4	27377	5
774	4	2177	1
775	4	27407	1
776	4	17069	2
777	4	27397	1
778	4	27433	1
779	4	27434	2
780	4	27435	1
781	4	27436	4
782	4	27438	2
783	4	26363	3
784	4	27441	3
785	4	27443	3
786	4	23689	2
787	4	11247	2
788	4	9567	2
789	4	16693	3
790	4	20392	5
791	4	27378	3
792	4	11598	1
793	4	25653	2
794	4	27447	5
795	4	25658	2
796	4	27526	1
797	4	11122	2
798	4	27527	4
799	4	27529	5
800	4	1879	4
801	4	27532	4
802	4	40968	1
803	4	27519	5
804	4	24440	5
805	4	26760	1
806	4	26762	2
807	4	37032	3
808	4	8959	2
809	4	27534	3
810	4	26774	5
811	4	19576	1
812	4	23910	5
813	4	26816	5
814	4	9484	3
815	4	11070	1
816	4	14694	5
817	4	10760	5
818	4	26780	3
819	4	26833	2
820	4	18975	5
821	4	12875	2
822	4	27872	5
823	4	978	5
824	4	25636	4
825	4	41825	1
826	4	41893	1
827	4	36856	1
828	4	41812	4
829	4	41826	5
830	4	41829	3
831	4	27916	5
832	4	14545	4
833	4	36534	5
834	4	36777	4
835	4	942	2
836	4	1363	1
837	4	26226	4
838	4	19799	5
839	4	20123	1
840	4	27505	2
841	4	26009	1
842	4	44101	4
843	4	28075	2
844	4	44078	2
845	4	10031	5
846	4	28067	4
847	4	19729	2
848	4	26763	5
849	4	26857	5
850	4	26759	1
851	4	28129	2
852	4	28015	5
853	4	13681	1
854	4	26773	2
855	4	19452	3
856	4	28174	2
857	4	14393	3
858	4	15429	4
859	4	1408	5
860	4	28412	1
861	4	31558	2
862	4	28409	1
863	4	28416	5
864	4	28418	5
865	4	2058	4
866	4	28081	5
867	4	26870	3
868	4	28451	1
869	4	28452	3
870	4	28466	3
871	4	51409	1
872	4	51408	2
873	4	15426	4
874	4	26818	5
875	4	28500	3
876	4	28507	3
877	4	19082	4
878	4	27051	1
879	4	121	2
880	4	19449	1
881	4	16932	3
882	4	19002	5
883	4	51407	1
884	4	28815	3
885	4	28843	4
886	4	26772	4
887	4	37078	3
888	4	51518	1
889	4	8339	4
890	4	54521	2
891	4	53655	4
892	4	37066	2
893	4	29143	4
894	4	29529	2
895	4	31561	3
896	4	52022	2
897	4	52190	5
898	4	52191	5
899	4	28414	1
900	4	26758	5
901	4	26769	2
902	4	30206	5
903	4	51540	4
904	4	11198	5
905	4	28445	2
906	4	51998	2
907	4	26503	1
908	4	10910	2
909	4	27314	1
910	4	51541	1
911	4	28069	3
912	4	22783	4
913	4	15276	1
914	4	37137	3
915	4	37135	4
916	4	37067	1
917	4	25623	3
918	4	27666	1
919	4	35626	4
920	4	1821	3
921	4	5605	5
922	4	11078	3
923	4	27261	3
924	4	36597	4
925	4	18734	5
926	4	21062	5
927	4	45026	1
928	4	24474	1
929	4	13555	5
930	4	12511	1
931	4	51950	1
932	4	28652	1
933	4	28113	4
934	4	7621	4
935	4	39300	2
936	4	54529	5
937	4	10960	3
938	4	23581	2
939	4	32856	4
940	4	28244	4
941	4	54548	5
942	4	27714	2
943	4	27239	2
944	4	11349	4
945	4	6066	1
946	4	8652	4
947	4	54565	4
948	4	36814	1
949	4	54566	5
950	4	54567	4
951	4	27419	4
952	4	51535	3
953	4	54590	3
954	4	28493	2
955	4	9732	3
956	4	16992	5
957	4	25795	3
958	4	42932	1
959	4	23352	3
960	4	54724	1
961	5	38983	2
962	5	10232	1
963	5	885	1
964	5	11529	5
965	5	19081	1
966	5	19175	2
967	5	29525	5
968	5	36846	1
969	5	27081	5
970	5	21063	3
971	5	11667	1
972	5	13163	2
973	5	17000	2
974	5	7346	5
975	5	26764	2
976	5	19550	3
977	5	19554	4
978	5	26765	5
979	5	26766	3
980	5	13197	2
981	5	26771	5
982	5	26775	3
983	5	24703	1
984	5	19457	2
985	5	25599	4
986	5	26761	5
987	5	8618	1
988	5	26831	2
989	5	26845	1
990	5	26848	2
991	5	26872	5
992	5	8617	4
993	5	26300	4
994	5	14298	2
995	5	26890	2
996	5	18861	2
997	5	27037	4
998	5	6866	4
999	5	53790	3
1000	5	26364	1
1001	5	43363	3
1002	5	14593	1
1003	5	19220	1
1004	5	18158	4
1005	5	27240	2
1006	5	27241	1
1007	5	27242	3
1008	5	26768	2
1009	5	36794	2
1010	5	19278	4
1011	5	27367	4
1012	5	27376	1
1013	5	27377	1
1014	5	2177	4
1015	5	27407	1
1016	5	17069	5
1017	5	27397	5
1018	5	27433	3
1019	5	27434	1
1020	5	27435	5
1021	5	27436	2
1022	5	27438	1
1023	5	26363	2
1024	5	27441	2
1025	5	27443	5
1026	5	23689	1
1027	5	11247	2
1028	5	9567	5
1029	5	16693	1
1030	5	20392	4
1031	5	27378	5
1032	5	11598	3
1033	5	25653	4
1034	5	27447	5
1035	5	25658	4
1036	5	27526	4
1037	5	11122	2
1038	5	27527	4
1039	5	27529	5
1040	5	1879	1
1041	5	27532	2
1042	5	40968	3
1043	5	27519	1
1044	5	24440	1
1045	5	26760	3
1046	5	26762	4
1047	5	37032	4
1048	5	8959	4
1049	5	27534	1
1050	5	26774	3
1051	5	19576	5
1052	5	23910	5
1053	5	26816	1
1054	5	9484	4
1055	5	11070	2
1056	5	14694	4
1057	5	10760	2
1058	5	26780	4
1059	5	26833	5
1060	5	18975	5
1061	5	12875	2
1062	5	27872	1
1063	5	978	5
1064	5	25636	3
1065	5	41825	2
1066	5	41893	5
1067	5	36856	5
1068	5	41812	1
1069	5	41826	5
1070	5	41829	5
1071	5	27916	4
1072	5	14545	5
1073	5	36534	2
1074	5	36777	1
1075	5	942	5
1076	5	1363	3
1077	5	26226	4
1078	5	19799	3
1079	5	20123	2
1080	5	27505	4
1081	5	26009	2
1082	5	44101	4
1083	5	28075	3
1084	5	44078	4
1085	5	10031	1
1086	5	28067	5
1087	5	19729	1
1088	5	26763	5
1089	5	26857	2
1090	5	26759	3
1091	5	28129	5
1092	5	28015	5
1093	5	13681	3
1094	5	26773	2
1095	5	19452	1
1096	5	28174	2
1097	5	14393	5
1098	5	15429	5
1099	5	1408	2
1100	5	28412	3
1101	5	31558	2
1102	5	28409	4
1103	5	28416	1
1104	5	28418	5
1105	5	2058	3
1106	5	28081	4
1107	5	26870	4
1108	5	28451	5
1109	5	28452	3
1110	5	28466	4
1111	5	51409	4
1112	5	51408	2
1113	5	15426	4
1114	5	26818	1
1115	5	28500	5
1116	5	28507	4
1117	5	19082	3
1118	5	27051	2
1119	5	121	2
1120	5	19449	2
1121	5	16932	2
1122	5	19002	5
1123	5	51407	4
1124	5	28815	5
1125	5	28843	4
1126	5	26772	5
1127	5	37078	3
1128	5	51518	5
1129	5	8339	5
1130	5	54521	2
1131	5	53655	1
1132	5	37066	1
1133	5	29143	3
1134	5	29529	5
1135	5	31561	2
1136	5	52022	3
1137	5	52190	4
1138	5	52191	2
1139	5	28414	4
1140	5	26758	3
1141	5	26769	4
1142	5	30206	3
1143	5	51540	4
1144	5	11198	5
1145	5	28445	4
1146	5	51998	3
1147	5	26503	3
1148	5	10910	3
1149	5	27314	3
1150	5	51541	3
1151	5	28069	3
1152	5	22783	1
1153	5	15276	5
1154	5	37137	5
1155	5	37135	2
1156	5	37067	5
1157	5	25623	1
1158	5	27666	3
1159	5	35626	3
1160	5	1821	2
1161	5	5605	1
1162	5	11078	5
1163	5	27261	3
1164	5	36597	5
1165	5	18734	5
1166	5	21062	1
1167	5	45026	3
1168	5	24474	3
1169	5	13555	5
1170	5	12511	5
1171	5	51950	4
1172	5	28652	3
1173	5	28113	3
1174	5	7621	4
1175	5	39300	3
1176	5	54529	5
1177	5	10960	1
1178	5	23581	1
1179	5	32856	3
1180	5	28244	4
1181	5	54548	5
1182	5	27714	1
1183	5	27239	4
1184	5	11349	1
1185	5	6066	4
1186	5	8652	1
1187	5	54565	1
1188	5	36814	2
1189	5	54566	1
1190	5	54567	4
1191	5	27419	4
1192	5	51535	4
1193	5	54590	4
1194	5	28493	3
1195	5	9732	4
1196	5	16992	4
1197	5	25795	2
1198	5	42932	1
1199	5	23352	2
1200	5	54724	4
1201	6	38983	3
1202	6	10232	4
1203	6	885	3
1204	6	11529	2
1205	6	19081	1
1206	6	19175	2
1207	6	29525	3
1208	6	36846	5
1209	6	27081	4
1210	6	21063	3
1211	6	11667	1
1212	6	13163	2
1213	6	17000	3
1214	6	7346	2
1215	6	26764	1
1216	6	19550	4
1217	6	19554	3
1218	6	26765	4
1219	6	26766	5
1220	6	13197	1
1221	6	26771	1
1222	6	26775	5
1223	6	24703	4
1224	6	19457	3
1225	6	25599	4
1226	6	26761	1
1227	6	8618	3
1228	6	26831	1
1229	6	26845	5
1230	6	26848	2
1231	6	26872	2
1232	6	8617	1
1233	6	26300	3
1234	6	14298	3
1235	6	26890	5
1236	6	18861	5
1237	6	27037	3
1238	6	6866	3
1239	6	53790	4
1240	6	26364	5
1241	6	43363	3
1242	6	14593	3
1243	6	19220	4
1244	6	18158	1
1245	6	27240	2
1246	6	27241	1
1247	6	27242	4
1248	6	26768	2
1249	6	36794	3
1250	6	19278	2
1251	6	27367	5
1252	6	27376	4
1253	6	27377	3
1254	6	2177	5
1255	6	27407	5
1256	6	17069	5
1257	6	27397	4
1258	6	27433	3
1259	6	27434	5
1260	6	27435	3
1261	6	27436	4
1262	6	27438	3
1263	6	26363	5
1264	6	27441	3
1265	6	27443	1
1266	6	23689	3
1267	6	11247	4
1268	6	9567	1
1269	6	16693	4
1270	6	20392	3
1271	6	27378	1
1272	6	11598	5
1273	6	25653	3
1274	6	27447	3
1275	6	25658	2
1276	6	27526	3
1277	6	11122	3
1278	6	27527	4
1279	6	27529	2
1280	6	1879	1
1281	6	27532	1
1282	6	40968	2
1283	6	27519	5
1284	6	24440	3
1285	6	26760	5
1286	6	26762	2
1287	6	37032	5
1288	6	8959	3
1289	6	27534	5
1290	6	26774	4
1291	6	19576	2
1292	6	23910	1
1293	6	26816	4
1294	6	9484	2
1295	6	11070	1
1296	6	14694	4
1297	6	10760	2
1298	6	26780	5
1299	6	26833	5
1300	6	18975	5
1301	6	12875	1
1302	6	27872	2
1303	6	978	1
1304	6	25636	5
1305	6	41825	3
1306	6	41893	2
1307	6	36856	2
1308	6	41812	2
1309	6	41826	4
1310	6	41829	2
1311	6	27916	3
1312	6	14545	1
1313	6	36534	5
1314	6	36777	1
1315	6	942	1
1316	6	1363	1
1317	6	26226	4
1318	6	19799	5
1319	6	20123	2
1320	6	27505	1
1321	6	26009	4
1322	6	44101	5
1323	6	28075	5
1324	6	44078	3
1325	6	10031	5
1326	6	28067	1
1327	6	19729	5
1328	6	26763	5
1329	6	26857	5
1330	6	26759	4
1331	6	28129	1
1332	6	28015	1
1333	6	13681	5
1334	6	26773	4
1335	6	19452	1
1336	6	28174	1
1337	6	14393	4
1338	6	15429	2
1339	6	1408	5
1340	6	28412	1
1341	6	31558	5
1342	6	28409	5
1343	6	28416	5
1344	6	28418	4
1345	6	2058	1
1346	6	28081	3
1347	6	26870	2
1348	6	28451	3
1349	6	28452	5
1350	6	28466	4
1351	6	51409	3
1352	6	51408	5
1353	6	15426	1
1354	6	26818	1
1355	6	28500	3
1356	6	28507	5
1357	6	19082	5
1358	6	27051	4
1359	6	121	1
1360	6	19449	2
1361	6	16932	5
1362	6	19002	3
1363	6	51407	4
1364	6	28815	4
1365	6	28843	5
1366	6	26772	2
1367	6	37078	3
1368	6	51518	1
1369	6	8339	5
1370	6	54521	2
1371	6	53655	4
1372	6	37066	2
1373	6	29143	1
1374	6	29529	1
1375	6	31561	4
1376	6	52022	4
1377	6	52190	1
1378	6	52191	4
1379	6	28414	4
1380	6	26758	1
1381	6	26769	5
1382	6	30206	5
1383	6	51540	5
1384	6	11198	2
1385	6	28445	5
1386	6	51998	2
1387	6	26503	5
1388	6	10910	2
1389	6	27314	1
1390	6	51541	5
1391	6	28069	1
1392	6	22783	1
1393	6	15276	2
1394	6	37137	5
1395	6	37135	1
1396	6	37067	1
1397	6	25623	5
1398	6	27666	3
1399	6	35626	1
1400	6	1821	5
1401	6	5605	3
1402	6	11078	3
1403	6	27261	1
1404	6	36597	2
1405	6	18734	2
1406	6	21062	1
1407	6	45026	1
1408	6	24474	2
1409	6	13555	2
1410	6	12511	1
1411	6	51950	2
1412	6	28652	5
1413	6	28113	4
1414	6	7621	1
1415	6	39300	2
1416	6	54529	1
1417	6	10960	5
1418	6	23581	5
1419	6	32856	3
1420	6	28244	2
1421	6	54548	1
1422	6	27714	1
1423	6	27239	4
1424	6	11349	2
1425	6	6066	3
1426	6	8652	5
1427	6	54565	4
1428	6	36814	5
1429	6	54566	4
1430	6	54567	4
1431	6	27419	3
1432	6	51535	2
1433	6	54590	1
1434	6	28493	2
1435	6	9732	3
1436	6	16992	3
1437	6	25795	5
1438	6	42932	2
1439	6	23352	4
1440	6	54724	4
1441	7	38983	4
1442	7	10232	3
1443	7	885	3
1444	7	11529	5
1445	7	19081	5
1446	7	19175	2
1447	7	29525	5
1448	7	36846	1
1449	7	27081	2
1450	7	21063	2
1451	7	11667	1
1452	7	13163	3
1453	7	17000	4
1454	7	7346	1
1455	7	26764	1
1456	7	19550	2
1457	7	19554	1
1458	7	26765	4
1459	7	26766	5
1460	7	13197	3
1461	7	26771	5
1462	7	26775	4
1463	7	24703	3
1464	7	19457	2
1465	7	25599	4
1466	7	26761	5
1467	7	8618	1
1468	7	26831	3
1469	7	26845	2
1470	7	26848	3
1471	7	26872	1
1472	7	8617	1
1473	7	26300	1
1474	7	14298	1
1475	7	26890	1
1476	7	18861	2
1477	7	27037	5
1478	7	6866	1
1479	7	53790	5
1480	7	26364	3
1481	7	43363	1
1482	7	14593	3
1483	7	19220	1
1484	7	18158	5
1485	7	27240	4
1486	7	27241	2
1487	7	27242	5
1488	7	26768	1
1489	7	36794	2
1490	7	19278	1
1491	7	27367	1
1492	7	27376	2
1493	7	27377	5
1494	7	2177	5
1495	7	27407	4
1496	7	17069	3
1497	7	27397	5
1498	7	27433	3
1499	7	27434	1
1500	7	27435	2
1501	7	27436	1
1502	7	27438	5
1503	7	26363	2
1504	7	27441	2
1505	7	27443	3
1506	7	23689	2
1507	7	11247	5
1508	7	9567	1
1509	7	16693	5
1510	7	20392	5
1511	7	27378	2
1512	7	11598	3
1513	7	25653	1
1514	7	27447	3
1515	7	25658	2
1516	7	27526	1
1517	7	11122	5
1518	7	27527	4
1519	7	27529	4
1520	7	1879	4
1521	7	27532	2
1522	7	40968	2
1523	7	27519	4
1524	7	24440	2
1525	7	26760	5
1526	7	26762	3
1527	7	37032	1
1528	7	8959	1
1529	7	27534	5
1530	7	26774	1
1531	7	19576	1
1532	7	23910	5
1533	7	26816	4
1534	7	9484	2
1535	7	11070	2
1536	7	14694	2
1537	7	10760	1
1538	7	26780	4
1539	7	26833	1
1540	7	18975	2
1541	7	12875	1
1542	7	27872	1
1543	7	978	4
1544	7	25636	2
1545	7	41825	3
1546	7	41893	4
1547	7	36856	1
1548	7	41812	2
1549	7	41826	4
1550	7	41829	2
1551	7	27916	5
1552	7	14545	4
1553	7	36534	3
1554	7	36777	5
1555	7	942	2
1556	7	1363	3
1557	7	26226	4
1558	7	19799	2
1559	7	20123	3
1560	7	27505	5
1561	7	26009	2
1562	7	44101	5
1563	7	28075	1
1564	7	44078	5
1565	7	10031	3
1566	7	28067	5
1567	7	19729	4
1568	7	26763	4
1569	7	26857	4
1570	7	26759	4
1571	7	28129	3
1572	7	28015	1
1573	7	13681	5
1574	7	26773	2
1575	7	19452	5
1576	7	28174	4
1577	7	14393	4
1578	7	15429	2
1579	7	1408	1
1580	7	28412	2
1581	7	31558	5
1582	7	28409	1
1583	7	28416	1
1584	7	28418	5
1585	7	2058	4
1586	7	28081	5
1587	7	26870	3
1588	7	28451	5
1589	7	28452	5
1590	7	28466	5
1591	7	51409	1
1592	7	51408	1
1593	7	15426	5
1594	7	26818	2
1595	7	28500	4
1596	7	28507	5
1597	7	19082	1
1598	7	27051	4
1599	7	121	2
1600	7	19449	1
1601	7	16932	4
1602	7	19002	1
1603	7	51407	2
1604	7	28815	2
1605	7	28843	4
1606	7	26772	3
1607	7	37078	5
1608	7	51518	1
1609	7	8339	3
1610	7	54521	4
1611	7	53655	2
1612	7	37066	5
1613	7	29143	4
1614	7	29529	5
1615	7	31561	1
1616	7	52022	4
1617	7	52190	3
1618	7	52191	3
1619	7	28414	5
1620	7	26758	2
1621	7	26769	1
1622	7	30206	2
1623	7	51540	5
1624	7	11198	5
1625	7	28445	1
1626	7	51998	3
1627	7	26503	2
1628	7	10910	2
1629	7	27314	1
1630	7	51541	1
1631	7	28069	3
1632	7	22783	4
1633	7	15276	1
1634	7	37137	5
1635	7	37135	4
1636	7	37067	1
1637	7	25623	3
1638	7	27666	2
1639	7	35626	1
1640	7	1821	2
1641	7	5605	5
1642	7	11078	5
1643	7	27261	1
1644	7	36597	4
1645	7	18734	1
1646	7	21062	3
1647	7	45026	2
1648	7	24474	2
1649	7	13555	3
1650	7	12511	1
1651	7	51950	2
1652	7	28652	2
1653	7	28113	4
1654	7	7621	5
1655	7	39300	2
1656	7	54529	4
1657	7	10960	4
1658	7	23581	3
1659	7	32856	5
1660	7	28244	2
1661	7	54548	1
1662	7	27714	3
1663	7	27239	5
1664	7	11349	4
1665	7	6066	5
1666	7	8652	3
1667	7	54565	2
1668	7	36814	5
1669	7	54566	3
1670	7	54567	5
1671	7	27419	2
1672	7	51535	5
1673	7	54590	4
1674	7	28493	1
1675	7	9732	3
1676	7	16992	3
1677	7	25795	1
1678	7	42932	3
1679	7	23352	4
1680	7	54724	5
1681	8	38983	3
1682	8	10232	3
1683	8	885	3
1684	8	11529	4
1685	8	19081	1
1686	8	19175	2
1687	8	29525	1
1688	8	36846	3
1689	8	27081	3
1690	8	21063	2
1691	8	11667	2
1692	8	13163	5
1693	8	17000	4
1694	8	7346	5
1695	8	26764	5
1696	8	19550	3
1697	8	19554	1
1698	8	26765	5
1699	8	26766	3
1700	8	13197	4
1701	8	26771	3
1702	8	26775	4
1703	8	24703	4
1704	8	19457	1
1705	8	25599	1
1706	8	26761	1
1707	8	8618	1
1708	8	26831	4
1709	8	26845	5
1710	8	26848	2
1711	8	26872	3
1712	8	8617	5
1713	8	26300	4
1714	8	14298	5
1715	8	26890	3
1716	8	18861	1
1717	8	27037	3
1718	8	6866	5
1719	8	53790	5
1720	8	26364	3
1721	8	43363	4
1722	8	14593	4
1723	8	19220	2
1724	8	18158	1
1725	8	27240	2
1726	8	27241	2
1727	8	27242	2
1728	8	26768	4
1729	8	36794	3
1730	8	19278	1
1731	8	27367	3
1732	8	27376	4
1733	8	27377	1
1734	8	2177	5
1735	8	27407	4
1736	8	17069	3
1737	8	27397	1
1738	8	27433	4
1739	8	27434	4
1740	8	27435	1
1741	8	27436	4
1742	8	27438	1
1743	8	26363	1
1744	8	27441	4
1745	8	27443	2
1746	8	23689	5
1747	8	11247	1
1748	8	9567	1
1749	8	16693	2
1750	8	20392	1
1751	8	27378	4
1752	8	11598	1
1753	8	25653	3
1754	8	27447	5
1755	8	25658	1
1756	8	27526	3
1757	8	11122	4
1758	8	27527	1
1759	8	27529	3
1760	8	1879	4
1761	8	27532	2
1762	8	40968	3
1763	8	27519	1
1764	8	24440	5
1765	8	26760	5
1766	8	26762	2
1767	8	37032	2
1768	8	8959	3
1769	8	27534	5
1770	8	26774	3
1771	8	19576	5
1772	8	23910	4
1773	8	26816	5
1774	8	9484	3
1775	8	11070	5
1776	8	14694	2
1777	8	10760	4
1778	8	26780	1
1779	8	26833	1
1780	8	18975	5
1781	8	12875	1
1782	8	27872	4
1783	8	978	5
1784	8	25636	4
1785	8	41825	1
1786	8	41893	5
1787	8	36856	3
1788	8	41812	5
1789	8	41826	4
1790	8	41829	4
1791	8	27916	5
1792	8	14545	1
1793	8	36534	4
1794	8	36777	4
1795	8	942	2
1796	8	1363	5
1797	8	26226	3
1798	8	19799	1
1799	8	20123	2
1800	8	27505	4
1801	8	26009	3
1802	8	44101	4
1803	8	28075	3
1804	8	44078	4
1805	8	10031	3
1806	8	28067	4
1807	8	19729	3
1808	8	26763	4
1809	8	26857	3
1810	8	26759	3
1811	8	28129	5
1812	8	28015	2
1813	8	13681	1
1814	8	26773	2
1815	8	19452	4
1816	8	28174	1
1817	8	14393	2
1818	8	15429	4
1819	8	1408	3
1820	8	28412	2
1821	8	31558	2
1822	8	28409	5
1823	8	28416	1
1824	8	28418	1
1825	8	2058	1
1826	8	28081	2
1827	8	26870	4
1828	8	28451	4
1829	8	28452	3
1830	8	28466	5
1831	8	51409	5
1832	8	51408	5
1833	8	15426	3
1834	8	26818	1
1835	8	28500	3
1836	8	28507	4
1837	8	19082	3
1838	8	27051	4
1839	8	121	3
1840	8	19449	1
1841	8	16932	4
1842	8	19002	5
1843	8	51407	1
1844	8	28815	3
1845	8	28843	4
1846	8	26772	5
1847	8	37078	4
1848	8	51518	5
1849	8	8339	2
1850	8	54521	1
1851	8	53655	5
1852	8	37066	5
1853	8	29143	4
1854	8	29529	3
1855	8	31561	4
1856	8	52022	5
1857	8	52190	5
1858	8	52191	4
1859	8	28414	1
1860	8	26758	1
1861	8	26769	3
1862	8	30206	1
1863	8	51540	1
1864	8	11198	5
1865	8	28445	2
1866	8	51998	1
1867	8	26503	5
1868	8	10910	5
1869	8	27314	3
1870	8	51541	3
1871	8	28069	1
1872	8	22783	3
1873	8	15276	1
1874	8	37137	4
1875	8	37135	3
1876	8	37067	5
1877	8	25623	4
1878	8	27666	5
1879	8	35626	1
1880	8	1821	1
1881	8	5605	4
1882	8	11078	5
1883	8	27261	4
1884	8	36597	1
1885	8	18734	2
1886	8	21062	3
1887	8	45026	5
1888	8	24474	3
1889	8	13555	5
1890	8	12511	4
1891	8	51950	5
1892	8	28652	5
1893	8	28113	5
1894	8	7621	2
1895	8	39300	4
1896	8	54529	2
1897	8	10960	1
1898	8	23581	2
1899	8	32856	2
1900	8	28244	5
1901	8	54548	1
1902	8	27714	4
1903	8	27239	2
1904	8	11349	4
1905	8	6066	5
1906	8	8652	1
1907	8	54565	1
1908	8	36814	2
1909	8	54566	4
1910	8	54567	2
1911	8	27419	5
1912	8	51535	3
1913	8	54590	4
1914	8	28493	5
1915	8	9732	5
1916	8	16992	3
1917	8	25795	4
1918	8	42932	5
1919	8	23352	4
1920	8	54724	1
1921	9	38983	1
1922	9	10232	5
1923	9	885	5
1924	9	11529	2
1925	9	19081	5
1926	9	19175	1
1927	9	29525	4
1928	9	36846	5
1929	9	27081	1
1930	9	21063	1
1931	9	11667	2
1932	9	13163	1
1933	9	17000	4
1934	9	7346	3
1935	9	26764	4
1936	9	19550	3
1937	9	19554	2
1938	9	26765	5
1939	9	26766	1
1940	9	13197	2
1941	9	26771	5
1942	9	26775	2
1943	9	24703	1
1944	9	19457	5
1945	9	25599	3
1946	9	26761	4
1947	9	8618	3
1948	9	26831	3
1949	9	26845	3
1950	9	26848	3
1951	9	26872	4
1952	9	8617	4
1953	9	26300	1
1954	9	14298	2
1955	9	26890	2
1956	9	18861	2
1957	9	27037	1
1958	9	6866	3
1959	9	53790	2
1960	9	26364	3
1961	9	43363	4
1962	9	14593	3
1963	9	19220	1
1964	9	18158	5
1965	9	27240	1
1966	9	27241	5
1967	9	27242	1
1968	9	26768	1
1969	9	36794	2
1970	9	19278	3
1971	9	27367	3
1972	9	27376	4
1973	9	27377	4
1974	9	2177	5
1975	9	27407	2
1976	9	17069	4
1977	9	27397	1
1978	9	27433	4
1979	9	27434	3
1980	9	27435	5
1981	9	27436	3
1982	9	27438	5
1983	9	26363	4
1984	9	27441	3
1985	9	27443	1
1986	9	23689	1
1987	9	11247	2
1988	9	9567	3
1989	9	16693	2
1990	9	20392	4
1991	9	27378	1
1992	9	11598	4
1993	9	25653	5
1994	9	27447	5
1995	9	25658	4
1996	9	27526	3
1997	9	11122	3
1998	9	27527	1
1999	9	27529	4
2000	9	1879	1
2001	9	27532	4
2002	9	40968	1
2003	9	27519	4
2004	9	24440	2
2005	9	26760	1
2006	9	26762	2
2007	9	37032	2
2008	9	8959	3
2009	9	27534	5
2010	9	26774	5
2011	9	19576	3
2012	9	23910	5
2013	9	26816	3
2014	9	9484	5
2015	9	11070	2
2016	9	14694	5
2017	9	10760	5
2018	9	26780	4
2019	9	26833	3
2020	9	18975	5
2021	9	12875	4
2022	9	27872	3
2023	9	978	5
2024	9	25636	2
2025	9	41825	3
2026	9	41893	4
2027	9	36856	2
2028	9	41812	4
2029	9	41826	4
2030	9	41829	4
2031	9	27916	3
2032	9	14545	3
2033	9	36534	4
2034	9	36777	4
2035	9	942	3
2036	9	1363	3
2037	9	26226	5
2038	9	19799	3
2039	9	20123	4
2040	9	27505	3
2041	9	26009	1
2042	9	44101	2
2043	9	28075	3
2044	9	44078	2
2045	9	10031	3
2046	9	28067	5
2047	9	19729	3
2048	9	26763	3
2049	9	26857	3
2050	9	26759	1
2051	9	28129	1
2052	9	28015	2
2053	9	13681	5
2054	9	26773	5
2055	9	19452	2
2056	9	28174	3
2057	9	14393	4
2058	9	15429	4
2059	9	1408	3
2060	9	28412	3
2061	9	31558	3
2062	9	28409	4
2063	9	28416	2
2064	9	28418	5
2065	9	2058	5
2066	9	28081	4
2067	9	26870	1
2068	9	28451	1
2069	9	28452	5
2070	9	28466	3
2071	9	51409	1
2072	9	51408	3
2073	9	15426	2
2074	9	26818	5
2075	9	28500	1
2076	9	28507	1
2077	9	19082	1
2078	9	27051	5
2079	9	121	3
2080	9	19449	1
2081	9	16932	4
2082	9	19002	2
2083	9	51407	3
2084	9	28815	1
2085	9	28843	2
2086	9	26772	4
2087	9	37078	4
2088	9	51518	2
2089	9	8339	1
2090	9	54521	3
2091	9	53655	4
2092	9	37066	3
2093	9	29143	4
2094	9	29529	5
2095	9	31561	2
2096	9	52022	1
2097	9	52190	2
2098	9	52191	2
2099	9	28414	3
2100	9	26758	4
2101	9	26769	2
2102	9	30206	4
2103	9	51540	1
2104	9	11198	5
2105	9	28445	5
2106	9	51998	5
2107	9	26503	5
2108	9	10910	2
2109	9	27314	4
2110	9	51541	2
2111	9	28069	3
2112	9	22783	3
2113	9	15276	5
2114	9	37137	1
2115	9	37135	1
2116	9	37067	2
2117	9	25623	2
2118	9	27666	5
2119	9	35626	2
2120	9	1821	4
2121	9	5605	4
2122	9	11078	2
2123	9	27261	3
2124	9	36597	5
2125	9	18734	2
2126	9	21062	5
2127	9	45026	4
2128	9	24474	2
2129	9	13555	5
2130	9	12511	5
2131	9	51950	5
2132	9	28652	3
2133	9	28113	3
2134	9	7621	4
2135	9	39300	1
2136	9	54529	5
2137	9	10960	2
2138	9	23581	3
2139	9	32856	3
2140	9	28244	5
2141	9	54548	2
2142	9	27714	2
2143	9	27239	3
2144	9	11349	2
2145	9	6066	4
2146	9	8652	2
2147	9	54565	3
2148	9	36814	5
2149	9	54566	1
2150	9	54567	1
2151	9	27419	2
2152	9	51535	3
2153	9	54590	2
2154	9	28493	2
2155	9	9732	4
2156	9	16992	5
2157	9	25795	5
2158	9	42932	4
2159	9	23352	3
2160	9	54724	4
2161	10	38983	2
2162	10	10232	1
2163	10	885	5
2164	10	11529	5
2165	10	19081	2
2166	10	19175	5
2167	10	29525	2
2168	10	36846	2
2169	10	27081	5
2170	10	21063	3
2171	10	11667	3
2172	10	13163	4
2173	10	17000	4
2174	10	7346	1
2175	10	26764	3
2176	10	19550	4
2177	10	19554	3
2178	10	26765	1
2179	10	26766	2
2180	10	13197	3
2181	10	26771	5
2182	10	26775	5
2183	10	24703	5
2184	10	19457	2
2185	10	25599	1
2186	10	26761	1
2187	10	8618	5
2188	10	26831	5
2189	10	26845	4
2190	10	26848	5
2191	10	26872	2
2192	10	8617	3
2193	10	26300	1
2194	10	14298	2
2195	10	26890	4
2196	10	18861	1
2197	10	27037	3
2198	10	6866	5
2199	10	53790	1
2200	10	26364	2
2201	10	43363	4
2202	10	14593	5
2203	10	19220	5
2204	10	18158	2
2205	10	27240	4
2206	10	27241	3
2207	10	27242	4
2208	10	26768	3
2209	10	36794	5
2210	10	19278	1
2211	10	27367	2
2212	10	27376	3
2213	10	27377	4
2214	10	2177	3
2215	10	27407	2
2216	10	17069	5
2217	10	27397	2
2218	10	27433	2
2219	10	27434	5
2220	10	27435	4
2221	10	27436	1
2222	10	27438	1
2223	10	26363	4
2224	10	27441	5
2225	10	27443	3
2226	10	23689	3
2227	10	11247	4
2228	10	9567	5
2229	10	16693	1
2230	10	20392	5
2231	10	27378	4
2232	10	11598	4
2233	10	25653	2
2234	10	27447	2
2235	10	25658	1
2236	10	27526	4
2237	10	11122	3
2238	10	27527	4
2239	10	27529	2
2240	10	1879	3
2241	10	27532	4
2242	10	40968	2
2243	10	27519	1
2244	10	24440	2
2245	10	26760	2
2246	10	26762	4
2247	10	37032	4
2248	10	8959	1
2249	10	27534	2
2250	10	26774	2
2251	10	19576	2
2252	10	23910	5
2253	10	26816	4
2254	10	9484	4
2255	10	11070	4
2256	10	14694	1
2257	10	10760	4
2258	10	26780	4
2259	10	26833	4
2260	10	18975	1
2261	10	12875	2
2262	10	27872	5
2263	10	978	1
2264	10	25636	5
2265	10	41825	1
2266	10	41893	2
2267	10	36856	1
2268	10	41812	3
2269	10	41826	1
2270	10	41829	1
2271	10	27916	4
2272	10	14545	2
2273	10	36534	2
2274	10	36777	5
2275	10	942	3
2276	10	1363	3
2277	10	26226	2
2278	10	19799	4
2279	10	20123	1
2280	10	27505	3
2281	10	26009	3
2282	10	44101	3
2283	10	28075	5
2284	10	44078	2
2285	10	10031	1
2286	10	28067	5
2287	10	19729	2
2288	10	26763	4
2289	10	26857	3
2290	10	26759	3
2291	10	28129	3
2292	10	28015	4
2293	10	13681	1
2294	10	26773	5
2295	10	19452	1
2296	10	28174	3
2297	10	14393	2
2298	10	15429	1
2299	10	1408	3
2300	10	28412	3
2301	10	31558	3
2302	10	28409	1
2303	10	28416	4
2304	10	28418	5
2305	10	2058	5
2306	10	28081	1
2307	10	26870	4
2308	10	28451	2
2309	10	28452	2
2310	10	28466	3
2311	10	51409	2
2312	10	51408	1
2313	10	15426	3
2314	10	26818	5
2315	10	28500	4
2316	10	28507	5
2317	10	19082	4
2318	10	27051	2
2319	10	121	5
2320	10	19449	1
2321	10	16932	4
2322	10	19002	4
2323	10	51407	2
2324	10	28815	5
2325	10	28843	4
2326	10	26772	3
2327	10	37078	4
2328	10	51518	1
2329	10	8339	3
2330	10	54521	4
2331	10	53655	5
2332	10	37066	2
2333	10	29143	4
2334	10	29529	2
2335	10	31561	3
2336	10	52022	2
2337	10	52190	3
2338	10	52191	5
2339	10	28414	4
2340	10	26758	3
2341	10	26769	3
2342	10	30206	3
2343	10	51540	1
2344	10	11198	1
2345	10	28445	3
2346	10	51998	3
2347	10	26503	2
2348	10	10910	3
2349	10	27314	3
2350	10	51541	5
2351	10	28069	5
2352	10	22783	5
2353	10	15276	4
2354	10	37137	3
2355	10	37135	5
2356	10	37067	5
2357	10	25623	2
2358	10	27666	1
2359	10	35626	5
2360	10	1821	4
2361	10	5605	1
2362	10	11078	2
2363	10	27261	1
2364	10	36597	3
2365	10	18734	5
2366	10	21062	1
2367	10	45026	2
2368	10	24474	1
2369	10	13555	2
2370	10	12511	1
2371	10	51950	1
2372	10	28652	5
2373	10	28113	2
2374	10	7621	1
2375	10	39300	2
2376	10	54529	5
2377	10	10960	5
2378	10	23581	2
2379	10	32856	4
2380	10	28244	2
2381	10	54548	2
2382	10	27714	4
2383	10	27239	5
2384	10	11349	4
2385	10	6066	3
2386	10	8652	4
2387	10	54565	4
2388	10	36814	1
2389	10	54566	4
2390	10	54567	3
2391	10	27419	3
2392	10	51535	3
2393	10	54590	2
2394	10	28493	2
2395	10	9732	5
2396	10	16992	4
2397	10	25795	4
2398	10	42932	2
2399	10	23352	3
2400	10	54724	5
\.


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('ratings_rating_id_seq', 2400, true);


--
-- Data for Name: screenshots; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY screenshots (screenshot_id, screenshot_url, screenshot_width, screenshot_height, game_id) FROM stdin;
1	//images.igdb.com/igdb/image/upload/t_thumb/zvp1fuzqud1wzau5l83f.jpg	1920	1080	38983
2	//images.igdb.com/igdb/image/upload/t_thumb/bu7vrh6usq6ejkemvpnr.jpg	1920	1080	38983
3	//images.igdb.com/igdb/image/upload/t_thumb/frev3mfrjwcigsd9nmpd.jpg	1920	1080	38983
4	//images.igdb.com/igdb/image/upload/t_thumb/w6vhko3jf3aqqjo3b5ol.jpg	1920	1080	38983
5	//images.igdb.com/igdb/image/upload/t_thumb/jzjikjyin45i2yldyj0x.jpg	1920	1080	38983
6	//images.igdb.com/igdb/image/upload/t_thumb/hfzdpgwjajwx0uilxt7u.jpg	1920	1080	10232
7	//images.igdb.com/igdb/image/upload/t_thumb/iqsy3mcrrmqsr6xavrve.jpg	1920	1080	10232
8	//images.igdb.com/igdb/image/upload/t_thumb/vjdzaubi264zqq7teavg.jpg	1920	1080	10232
9	//images.igdb.com/igdb/image/upload/t_thumb/v8loic34mgzdfnwpu7cz.jpg	1920	1080	10232
10	//images.igdb.com/igdb/image/upload/t_thumb/ou0qhwyiog2xnrnodzmo.jpg	1920	1080	10232
11	//images.igdb.com/igdb/image/upload/t_thumb/bt4z8ujs6cccabs7sjyf.jpg	1280	720	885
12	//images.igdb.com/igdb/image/upload/t_thumb/awbgkxutchrptvs2d4ee.jpg	1280	720	885
13	//images.igdb.com/igdb/image/upload/t_thumb/c8g7g29d2n7iwf0mecwl.jpg	1280	720	885
14	//images.igdb.com/igdb/image/upload/t_thumb/hs0vtcqw6h2owf3m3in0.jpg	1280	720	885
15	//images.igdb.com/igdb/image/upload/t_thumb/agatqhsdwnr1oz5ghqdt.jpg	1280	720	885
16	//images.igdb.com/igdb/image/upload/t_thumb/uiluht83yashumqmlgu0.jpg	1920	1080	11529
17	//images.igdb.com/igdb/image/upload/t_thumb/tby4jzfiof9i6durdukn.jpg	1920	1080	11529
18	//images.igdb.com/igdb/image/upload/t_thumb/yzwim9yukfqm1k72ophm.jpg	1920	1080	11529
19	//images.igdb.com/igdb/image/upload/t_thumb/fazkroet8pxirs4jego0.jpg	1920	1080	11529
20	//images.igdb.com/igdb/image/upload/t_thumb/oxgnanc3wqitgav4umvh.jpg	620	349	11529
21	//images.igdb.com/igdb/image/upload/t_thumb/tj8lerwhqfa8e6ishmiu.jpg	1920	1080	19081
22	//images.igdb.com/igdb/image/upload/t_thumb/ecdzxi9rl8gualdlfhhj.jpg	1920	1080	19081
23	//images.igdb.com/igdb/image/upload/t_thumb/guut1ama4qjzixmwsodo.jpg	1920	1080	19081
24	//images.igdb.com/igdb/image/upload/t_thumb/hcvkcktsdxtehihpb7wp.jpg	1920	1080	19081
25	//images.igdb.com/igdb/image/upload/t_thumb/ubn7wn0xkfn3u2qvvguu.jpg	1920	1080	19081
26	//images.igdb.com/igdb/image/upload/t_thumb/voiqfrnkc0edjbnll7gz.jpg	1920	1080	19175
27	//images.igdb.com/igdb/image/upload/t_thumb/f8dhwiq6gahaz1galaxi.jpg	1920	1080	19175
28	//images.igdb.com/igdb/image/upload/t_thumb/g4onz52tctiadzxxdboo.jpg	1920	1080	19175
29	//images.igdb.com/igdb/image/upload/t_thumb/de6sbr5umocofg03tm6r.jpg	1920	1080	19175
30	//images.igdb.com/igdb/image/upload/t_thumb/pir7ezoxgi73mv1vdos7.jpg	1920	1080	19175
31	//images.igdb.com/igdb/image/upload/t_thumb/nccwvkffzwtd8bpgvoqo.jpg	1917	1032	29525
32	//images.igdb.com/igdb/image/upload/t_thumb/txx0awlwujyyiqt6pp2t.jpg	1400	721	29525
33	//images.igdb.com/igdb/image/upload/t_thumb/qwsdagpfgixww8xxzpqi.jpg	1920	1080	29525
34	//images.igdb.com/igdb/image/upload/t_thumb/ogwrxsqrfjtchrxgckmp.jpg	1400	721	29525
35	//images.igdb.com/igdb/image/upload/t_thumb/pu3sv79z9z5lcxfrkbfr.jpg	1920	1080	29525
36	//images.igdb.com/igdb/image/upload/t_thumb/grdxi4bodyrij3cwiscf.jpg	1920	1080	36846
37	//images.igdb.com/igdb/image/upload/t_thumb/ysxiwu7qw8xsqy54yooj.jpg	1920	1080	36846
38	//images.igdb.com/igdb/image/upload/t_thumb/kaivwibbl1nu32or4rje.jpg	1920	1080	36846
39	//images.igdb.com/igdb/image/upload/t_thumb/puh4zn4wqkupmijm34ot.jpg	1920	1080	36846
40	//images.igdb.com/igdb/image/upload/t_thumb/x1dwmzc7xynaozkpa1av.jpg	1920	1080	36846
41	//images.igdb.com/igdb/image/upload/t_thumb/itcqu52hmcb9nrzmy4kl.jpg	1024	576	27081
42	//images.igdb.com/igdb/image/upload/t_thumb/smlr8qcw90ltwf42hox4.jpg	1024	576	27081
43	//images.igdb.com/igdb/image/upload/t_thumb/vvr9jxar3y5kqpwcnnau.jpg	1024	576	27081
44	//images.igdb.com/igdb/image/upload/t_thumb/lsrtnfaseo8knmhpvshh.jpg	5120	2880	21063
45	//images.igdb.com/igdb/image/upload/t_thumb/ewn7lwwuvt5rb0a5iefb.jpg	5120	2880	21063
46	//images.igdb.com/igdb/image/upload/t_thumb/tiqdiztcifz2u8lqabun.jpg	5120	2880	21063
47	//images.igdb.com/igdb/image/upload/t_thumb/bdqlyrtxslkhirwrnfpc.jpg	5120	2880	21063
48	//images.igdb.com/igdb/image/upload/t_thumb/kbkvkhjqpxj8o7160zep.jpg	5120	2880	21063
49	//images.igdb.com/igdb/image/upload/t_thumb/of67jvtvsqjukv1kwopq.jpg	1280	720	11667
50	//images.igdb.com/igdb/image/upload/t_thumb/ijz5upwt8byoeqqz9oe6.jpg	1280	720	11667
51	//images.igdb.com/igdb/image/upload/t_thumb/laudrwpbnewynrwfvecp.jpg	1280	720	11667
52	//images.igdb.com/igdb/image/upload/t_thumb/rhxs1x9w5hf5kde2osf5.jpg	1739	997	17000
53	//images.igdb.com/igdb/image/upload/t_thumb/sw7rtba7p1xs77klsime.jpg	1920	1132	17000
54	//images.igdb.com/igdb/image/upload/t_thumb/iwswpvxa9ytrpk8yjcyx.jpg	1920	1133	17000
55	//images.igdb.com/igdb/image/upload/t_thumb/ak7zmag7zztpqha1jjde.jpg	1707	1132	17000
56	//images.igdb.com/igdb/image/upload/t_thumb/g1aakqbkp2quq0krqeky.jpg	1920	1132	17000
57	//images.igdb.com/igdb/image/upload/t_thumb/mepn5qujlccdlkhfkwr8.jpg	1920	1080	7346
58	//images.igdb.com/igdb/image/upload/t_thumb/tjlglyti9pi4cowyiact.jpg	1591	893	7346
59	//images.igdb.com/igdb/image/upload/t_thumb/vbs1btl6ts17zeos4g5v.jpg	1593	893	7346
60	//images.igdb.com/igdb/image/upload/t_thumb/djytg7kqip9d5dgekfew.jpg	1585	887	7346
61	//images.igdb.com/igdb/image/upload/t_thumb/ngyp9tw3elpfdngwc00i.jpg	1593	891	7346
62	//images.igdb.com/igdb/image/upload/t_thumb/xdzg7620kqx6i4zkm4tp.jpg	300	180	26764
63	//images.igdb.com/igdb/image/upload/t_thumb/lohlm43lqsj42tqz1i58.jpg	1920	1080	19550
64	//images.igdb.com/igdb/image/upload/t_thumb/r9dkah09oqbyygiizjch.jpg	1920	1080	19550
65	//images.igdb.com/igdb/image/upload/t_thumb/qpita3kyjhgrck4w0yyf.jpg	1920	1080	19550
66	//images.igdb.com/igdb/image/upload/t_thumb/ldznuufiqeyjscnzu8ho.jpg	1920	1080	19550
67	//images.igdb.com/igdb/image/upload/t_thumb/zhisewwtngn3insf3o63.jpg	1920	1080	19550
68	//images.igdb.com/igdb/image/upload/t_thumb/djgdscdlgkou6tsqudxv.jpg	3840	2160	19554
69	//images.igdb.com/igdb/image/upload/t_thumb/ielg6xlbvhvdlseodgqj.jpg	3840	2160	19554
70	//images.igdb.com/igdb/image/upload/t_thumb/mi77uvzlhmqt6a4omk8o.jpg	3840	2160	19554
71	//images.igdb.com/igdb/image/upload/t_thumb/z9yfgly6m74ojxyhcgsv.jpg	3840	2160	19554
72	//images.igdb.com/igdb/image/upload/t_thumb/grniirmcig2qagrvkaz7.jpg	3840	2160	19554
73	//images.igdb.com/igdb/image/upload/t_thumb/sj98v0eoqxxzgalf9mn4.jpg	1280	720	26766
74	//images.igdb.com/igdb/image/upload/t_thumb/syug9kgrtmuqynmu7uqg.jpg	1280	720	26766
75	//images.igdb.com/igdb/image/upload/t_thumb/fgk6jtffidxsn8ovtbqu.jpg	1280	720	26766
76	//images.igdb.com/igdb/image/upload/t_thumb/bctz4zjros0pizflz4ha.jpg	1280	720	26766
77	//images.igdb.com/igdb/image/upload/t_thumb/dh1tkaotkbtyh978mtag.jpg	1280	720	26766
78	//images.igdb.com/igdb/image/upload/t_thumb/jqicr7irwb0qabcaskbc.jpg	1920	1080	13197
79	//images.igdb.com/igdb/image/upload/t_thumb/dms3ok904rc6e2g0x0vu.jpg	1920	1080	13197
80	//images.igdb.com/igdb/image/upload/t_thumb/icdxipz8ujwuilxbrijr.jpg	1920	1080	26771
81	//images.igdb.com/igdb/image/upload/t_thumb/fxxfkcyfk02nklk6mjzm.jpg	1920	1080	26771
82	//images.igdb.com/igdb/image/upload/t_thumb/kntaps62oixkuxzhoaqu.jpg	1280	720	26771
83	//images.igdb.com/igdb/image/upload/t_thumb/yy6nitjnicthcnndjkp8.jpg	1280	720	26771
84	//images.igdb.com/igdb/image/upload/t_thumb/a78n5xxd3opkifdihcqh.jpg	1280	720	26771
85	//images.igdb.com/igdb/image/upload/t_thumb/vztuiov7hiyk840rpgpe.jpg	1152	648	24703
86	//images.igdb.com/igdb/image/upload/t_thumb/ieg2bahh5gvf0ksqu8i7.jpg	1920	1080	24703
87	//images.igdb.com/igdb/image/upload/t_thumb/anmabq9h2cruhdu22nvw.jpg	1152	648	24703
88	//images.igdb.com/igdb/image/upload/t_thumb/sjqvfxdjqqon00lylqla.jpg	1920	1080	24703
89	//images.igdb.com/igdb/image/upload/t_thumb/thjspctnv8wzjiseylqu.jpg	1152	648	24703
90	//images.igdb.com/igdb/image/upload/t_thumb/f3fc6zqdew83zu4dgwdf.jpg	1280	720	19457
91	//images.igdb.com/igdb/image/upload/t_thumb/cfb4kvjf2ygttbreazar.jpg	1280	720	19457
92	//images.igdb.com/igdb/image/upload/t_thumb/oornljaohheldfdli4tx.jpg	1280	720	19457
93	//images.igdb.com/igdb/image/upload/t_thumb/e9wm1jbpfbaflmvvldio.jpg	1280	720	19457
94	//images.igdb.com/igdb/image/upload/t_thumb/jonqwskjocnykh9s6gug.jpg	1280	720	19457
95	//images.igdb.com/igdb/image/upload/t_thumb/uwum3iranymfhz7dhi9y.jpg	4096	2160	13163
96	//images.igdb.com/igdb/image/upload/t_thumb/tyjkpg1pavfvecvgmwv0.jpg	4096	2160	13163
97	//images.igdb.com/igdb/image/upload/t_thumb/xmxqoliaxo0qhpzt5hmw.jpg	4096	2160	13163
98	//images.igdb.com/igdb/image/upload/t_thumb/jlvmjeialss0bom1vxvv.jpg	1920	1080	13163
99	//images.igdb.com/igdb/image/upload/t_thumb/xjocieoaon1p9ixlxehz.jpg	1899	1080	13163
100	//images.igdb.com/igdb/image/upload/t_thumb/z8sqiv6yo5ou9eczeg6e.jpg	1280	720	26761
101	//images.igdb.com/igdb/image/upload/t_thumb/yilzspbtoximnbllsaty.jpg	1280	720	26761
102	//images.igdb.com/igdb/image/upload/t_thumb/ayog4a6zchqicu7teody.jpg	1280	720	26761
103	//images.igdb.com/igdb/image/upload/t_thumb/nocoksbi7t8loc5m6hgg.jpg	520	293	8618
104	//images.igdb.com/igdb/image/upload/t_thumb/aasqjqibkvqmkrpg1dvy.jpg	520	293	8618
105	//images.igdb.com/igdb/image/upload/t_thumb/hsorzapatxcya8d33io4.jpg	520	293	8618
106	//images.igdb.com/igdb/image/upload/t_thumb/xzweg7zetuvapqijudya.jpg	520	293	8618
107	//images.igdb.com/igdb/image/upload/t_thumb/bydd618jarqmqvomsetw.jpg	520	293	8618
108	//images.igdb.com/igdb/image/upload/t_thumb/oajza3wigx4qzkpcg0jm.jpg	1920	1080	26848
109	//images.igdb.com/igdb/image/upload/t_thumb/qqsztyc17edusjlettyj.jpg	1920	1080	26848
110	//images.igdb.com/igdb/image/upload/t_thumb/y5eh4nhm1cupespqbg6t.jpg	1920	1080	26848
111	//images.igdb.com/igdb/image/upload/t_thumb/ve37el2bqqsbmpc19g0o.jpg	1920	1080	26848
112	//images.igdb.com/igdb/image/upload/t_thumb/pghwc6t0omeetrzrtb5j.jpg	1280	720	26848
113	//images.igdb.com/igdb/image/upload/t_thumb/xmmbk9d4bcvequkarzzh.jpg	1280	720	8617
114	//images.igdb.com/igdb/image/upload/t_thumb/ax8yp6rxdtx9bwgflsta.jpg	1920	1080	8617
115	//images.igdb.com/igdb/image/upload/t_thumb/alt3ojjf861f6vyvfqce.jpg	1920	1080	8617
116	//images.igdb.com/igdb/image/upload/t_thumb/klsv1gez789idk2e8ina.jpg	1280	720	8617
117	//images.igdb.com/igdb/image/upload/t_thumb/zadaupvyodxbrdvcy5dl.jpg	1920	1080	8617
118	//images.igdb.com/igdb/image/upload/t_thumb/caucgpnkj3cfqg0wrx79.jpg	803	452	14298
119	//images.igdb.com/igdb/image/upload/t_thumb/rgpafvnzlozipo3q4jdv.jpg	803	452	14298
120	//images.igdb.com/igdb/image/upload/t_thumb/b5a0axeejkcbyiygyfyi.jpg	803	452	14298
121	//images.igdb.com/igdb/image/upload/t_thumb/oq1qpzgnymwatqog7htw.jpg	803	452	14298
122	//images.igdb.com/igdb/image/upload/t_thumb/tascz9gi6bugdgixs4i8.jpg	803	452	14298
123	//images.igdb.com/igdb/image/upload/t_thumb/gi9nspc7mdgf5ml5syv6.jpg	1920	1080	18861
124	//images.igdb.com/igdb/image/upload/t_thumb/qmlebcgfhzmlqo62jjsq.jpg	1920	1080	18861
125	//images.igdb.com/igdb/image/upload/t_thumb/bpjw9lwacshladda5qzk.jpg	1920	1080	18861
126	//images.igdb.com/igdb/image/upload/t_thumb/ur3wfk27pn22xkztfsv3.jpg	1920	1080	18861
127	//images.igdb.com/igdb/image/upload/t_thumb/pe1elagllkflnpx5w6br.jpg	1920	1080	18861
128	//images.igdb.com/igdb/image/upload/t_thumb/rs3gmettp3xbtkc26mdp.jpg	1920	1080	27037
129	//images.igdb.com/igdb/image/upload/t_thumb/o3onicmmwarzke1mbhki.jpg	1280	720	27037
130	//images.igdb.com/igdb/image/upload/t_thumb/te06n6irylhscwraj41i.jpg	1280	720	27037
131	//images.igdb.com/igdb/image/upload/t_thumb/bzp3ngamoeic9ruuu0dv.jpg	1280	720	27037
132	//images.igdb.com/igdb/image/upload/t_thumb/gtvjwpbebcmn6etxxwal.jpg	1280	720	27037
133	//images.igdb.com/igdb/image/upload/t_thumb/uu4txuu8qzc2djgg8jfz.jpg	620	349	6866
134	//images.igdb.com/igdb/image/upload/t_thumb/w3yeizl71qdtzw0estzo.jpg	620	313	26364
135	//images.igdb.com/igdb/image/upload/t_thumb/q634ullxbvipm6q6mcq9.jpg	1920	1080	14593
136	//images.igdb.com/igdb/image/upload/t_thumb/a3f72xprqkfuqdmha5ks.jpg	1920	1080	14593
137	//images.igdb.com/igdb/image/upload/t_thumb/ityinxmtkakwbokpcwws.jpg	1920	1080	14593
138	//images.igdb.com/igdb/image/upload/t_thumb/bkgxmg2m4h8wf5g9tblh.jpg	1920	1080	14593
139	//images.igdb.com/igdb/image/upload/t_thumb/p3svrq6ewzxnn7p1a3v9.jpg	1920	1080	14593
140	//images.igdb.com/igdb/image/upload/t_thumb/lyq0bi0po3tdp7qlbpxv.jpg	765	445	19220
141	//images.igdb.com/igdb/image/upload/t_thumb/snmhznqguejp2a0wvuea.jpg	740	444	19220
142	//images.igdb.com/igdb/image/upload/t_thumb/sdjx4nkpwdkx1t0krbb6.jpg	740	444	19220
143	//images.igdb.com/igdb/image/upload/t_thumb/mzftj8pxtqmy4abp84qe.jpg	747	432	19220
144	//images.igdb.com/igdb/image/upload/t_thumb/fzmu75zw3hb7rb5ly0px.jpg	773	411	19220
145	//images.igdb.com/igdb/image/upload/t_thumb/jalblp6btx4oa7lze1sy.jpg	1000	563	18158
146	//images.igdb.com/igdb/image/upload/t_thumb/g0sq67x9zoau25zfzjxv.jpg	1000	563	18158
147	//images.igdb.com/igdb/image/upload/t_thumb/tuoptb8u06mhgtcvighv.jpg	1000	563	18158
148	//images.igdb.com/igdb/image/upload/t_thumb/vx4ritypg0isebrq1kk5.jpg	1000	563	18158
149	//images.igdb.com/igdb/image/upload/t_thumb/gamzoasrepvwj4iar9ay.jpg	1000	563	18158
150	//images.igdb.com/igdb/image/upload/t_thumb/zw5q3tkfnhpufspugmd4.jpg	670	377	26768
151	//images.igdb.com/igdb/image/upload/t_thumb/ltgct106xbz9kyygpzcs.jpg	1920	1080	19278
152	//images.igdb.com/igdb/image/upload/t_thumb/caza29hrhlbpxwtdbqw3.jpg	1920	1080	19278
153	//images.igdb.com/igdb/image/upload/t_thumb/xo67rmhqtpydp6ksplvu.jpg	1920	1080	19278
154	//images.igdb.com/igdb/image/upload/t_thumb/jqshaha99jgrad7urieo.jpg	1920	1080	19278
155	//images.igdb.com/igdb/image/upload/t_thumb/pnapzewideaaypy9cdtw.jpg	1920	1080	19278
156	//images.igdb.com/igdb/image/upload/t_thumb/f3mknkohqjdxkjxkom7a.jpg	1920	1080	27367
157	//images.igdb.com/igdb/image/upload/t_thumb/lsqo9z6vvuik2z830ibg.jpg	1920	1080	27367
158	//images.igdb.com/igdb/image/upload/t_thumb/l0y84utoyrg0cgir6ejz.jpg	3072	1728	27367
159	//images.igdb.com/igdb/image/upload/t_thumb/tjjhywz2s8p6m1piqwff.jpg	3072	1728	27367
160	//images.igdb.com/igdb/image/upload/t_thumb/gdqbfqorhyyuavpi1bog.jpg	3072	1728	27367
161	//images.igdb.com/igdb/image/upload/t_thumb/dx7s3jgutwavdfgsafls.jpg	1278	719	27376
162	//images.igdb.com/igdb/image/upload/t_thumb/gh7glhn56loccfx2icfg.jpg	1280	720	27376
163	//images.igdb.com/igdb/image/upload/t_thumb/rm5fctothywfhqcuwgwj.jpg	1280	720	27376
164	//images.igdb.com/igdb/image/upload/t_thumb/nvu32u4sgb9rtedgbgti.jpg	1280	720	27376
165	//images.igdb.com/igdb/image/upload/t_thumb/ip1ptuzpm00vkurjsrdg.jpg	1280	720	27376
166	//images.igdb.com/igdb/image/upload/t_thumb/a1ssubjbxjfrn02on9ns.jpg	1280	720	2177
167	//images.igdb.com/igdb/image/upload/t_thumb/g8vhh54ckzruth4akvrr.jpg	1280	720	2177
168	//images.igdb.com/igdb/image/upload/t_thumb/f7j1fh4bl2k5t6uipook.jpg	1280	720	2177
169	//images.igdb.com/igdb/image/upload/t_thumb/ur6b3qamcfrm4zlw7dam.jpg	1280	720	2177
170	//images.igdb.com/igdb/image/upload/t_thumb/diucdsyvdh6lj1yashob.jpg	1280	720	2177
171	//images.igdb.com/igdb/image/upload/t_thumb/fudpuwop5cvxp5u5yrsy.jpg	1920	1080	27407
172	//images.igdb.com/igdb/image/upload/t_thumb/iwggjlascxnkm4xzqzmk.jpg	1920	1080	27407
173	//images.igdb.com/igdb/image/upload/t_thumb/qkmegjzduh0iytzkhtcz.jpg	1920	1080	27407
174	//images.igdb.com/igdb/image/upload/t_thumb/ogt0fxh7dslvlsxsjfz4.jpg	1920	1080	27407
175	//images.igdb.com/igdb/image/upload/t_thumb/ma6vaspwflqwnhg6dtiz.jpg	670	362	27407
176	//images.igdb.com/igdb/image/upload/t_thumb/ojpilyewnofwd2ljumib.jpg	1920	1080	17069
177	//images.igdb.com/igdb/image/upload/t_thumb/fvd5yi0t01jhp6qb7owf.jpg	1920	1080	17069
178	//images.igdb.com/igdb/image/upload/t_thumb/snfbdz7vi8vxscdhttnk.jpg	1920	1080	17069
179	//images.igdb.com/igdb/image/upload/t_thumb/oe0j89ybzg6vxsudpxoz.jpg	1920	1080	17069
180	//images.igdb.com/igdb/image/upload/t_thumb/j8lbsnwbaao6kd3suyii.jpg	1920	1080	17069
181	//images.igdb.com/igdb/image/upload/t_thumb/mrmcvz4c5e9xrwcd9nrz.jpg	1280	720	27397
182	//images.igdb.com/igdb/image/upload/t_thumb/ywp2nqkdzxqa2ftukezb.jpg	1920	1080	27433
183	//images.igdb.com/igdb/image/upload/t_thumb/c7uyp6wdl4d70enjfwwp.jpg	1920	1080	27433
184	//images.igdb.com/igdb/image/upload/t_thumb/o6agkukb9xo7edaqpm5q.jpg	1920	1080	27433
185	//images.igdb.com/igdb/image/upload/t_thumb/c8lgtznfdcxm867xxyyv.jpg	1920	1080	27433
186	//images.igdb.com/igdb/image/upload/t_thumb/t8ulqfbirdn2ye5dsyzu.jpg	1920	1080	27433
187	//images.igdb.com/igdb/image/upload/t_thumb/zaiqktx23pzrszzdjiub.jpg	1030	579	27434
188	//images.igdb.com/igdb/image/upload/t_thumb/tikatfcxhbjca4e7uysi.jpg	1030	579	27434
189	//images.igdb.com/igdb/image/upload/t_thumb/yljqtx9d074dzfrnukr6.jpg	1030	579	27434
190	//images.igdb.com/igdb/image/upload/t_thumb/kfzomuoqcudplowqcwlg.jpg	1920	1080	27434
191	//images.igdb.com/igdb/image/upload/t_thumb/vytnduahjkekowpgwo1b.jpg	1920	1080	27434
192	//images.igdb.com/igdb/image/upload/t_thumb/lja7380vw9wtg69m5sn6.jpg	1200	769	27438
193	//images.igdb.com/igdb/image/upload/t_thumb/vl7xpjj6l9a8jahd5wxd.jpg	1920	1080	26363
194	//images.igdb.com/igdb/image/upload/t_thumb/c5eltzpp9io3inphiaxi.jpg	1920	1080	26363
195	//images.igdb.com/igdb/image/upload/t_thumb/o6fbng0gmpucc0nyigxl.jpg	1920	1080	26363
196	//images.igdb.com/igdb/image/upload/t_thumb/tfdpxti6xm3uzg7rpexh.jpg	1920	1080	26363
197	//images.igdb.com/igdb/image/upload/t_thumb/uap3wgwq3scu1pnkmnrj.jpg	620	300	26363
198	//images.igdb.com/igdb/image/upload/t_thumb/dlz1ps95xzwdkwb47rdn.jpg	1920	1080	27441
199	//images.igdb.com/igdb/image/upload/t_thumb/zoswlfyxxgbtm6cneqcm.jpg	1920	1080	27441
200	//images.igdb.com/igdb/image/upload/t_thumb/jbxffdqnfkblntfsh9bv.jpg	1920	1080	27441
201	//images.igdb.com/igdb/image/upload/t_thumb/hwjekqmwswpggogbqk3h.jpg	1920	1080	27443
202	//images.igdb.com/igdb/image/upload/t_thumb/fpjbmtcgcyffz1befrhx.jpg	1920	1080	27443
203	//images.igdb.com/igdb/image/upload/t_thumb/hvb8izqtrxkg9ldtsfe0.jpg	1920	1080	27443
204	//images.igdb.com/igdb/image/upload/t_thumb/kvj4o7delye5b29sxs7x.jpg	1920	1080	27443
205	//images.igdb.com/igdb/image/upload/t_thumb/xvhkhuchdrf6ydsdvljs.jpg	1920	1079	23689
206	//images.igdb.com/igdb/image/upload/t_thumb/chjrfpnjpisv0hrjbrj6.jpg	1920	1079	23689
207	//images.igdb.com/igdb/image/upload/t_thumb/xsqpqccffykia783lsim.jpg	1920	1079	23689
208	//images.igdb.com/igdb/image/upload/t_thumb/xwa7s30nrkv7urpep107.jpg	1920	1079	23689
209	//images.igdb.com/igdb/image/upload/t_thumb/umetofpvym7krzabip8x.jpg	1920	1079	23689
210	//images.igdb.com/igdb/image/upload/t_thumb/ihtk0qxfcddhodp8ljb4.jpg	1280	720	11247
211	//images.igdb.com/igdb/image/upload/t_thumb/aooh1n6ihuzvhg6dwptu.jpg	1280	720	11247
212	//images.igdb.com/igdb/image/upload/t_thumb/woukjse6spktaifkpaft.jpg	1280	720	11247
213	//images.igdb.com/igdb/image/upload/t_thumb/rnjipponrrqs0w4qcp1m.jpg	600	337	11247
214	//images.igdb.com/igdb/image/upload/t_thumb/txyy7ku72vu6s2c0slh0.jpg	600	337	11247
215	//images.igdb.com/igdb/image/upload/t_thumb/zuwmvklkafqv9pipeaup.jpg	1920	1080	9567
216	//images.igdb.com/igdb/image/upload/t_thumb/oopdzru6qygv6nxxeicf.jpg	1920	1080	9567
217	//images.igdb.com/igdb/image/upload/t_thumb/ujqxtapbeh7ar1gzbchg.jpg	1920	1080	9567
218	//images.igdb.com/igdb/image/upload/t_thumb/bungrxci4cy6l0tbula4.jpg	1920	1080	9567
219	//images.igdb.com/igdb/image/upload/t_thumb/id9dcspsy0syvsyeihhh.jpg	1920	1080	9567
220	//images.igdb.com/igdb/image/upload/t_thumb/bzx7vfxfdbihj84z6igz.jpg	390	219	20392
221	//images.igdb.com/igdb/image/upload/t_thumb/al4qkfsbcqtlfg4yapvk.jpg	390	219	20392
222	//images.igdb.com/igdb/image/upload/t_thumb/kn3yla4ypqegap7ddxde.jpg	390	219	20392
223	//images.igdb.com/igdb/image/upload/t_thumb/lsbhgijfalstfs39cyyj.jpg	390	219	20392
224	//images.igdb.com/igdb/image/upload/t_thumb/c72tnedpmjlcog9xopqn.jpg	390	219	20392
225	//images.igdb.com/igdb/image/upload/t_thumb/k2baw1diezy7hwfz888j.jpg	1280	720	11598
226	//images.igdb.com/igdb/image/upload/t_thumb/ygbucyvia8p8i7lerxhl.jpg	1280	720	11598
227	//images.igdb.com/igdb/image/upload/t_thumb/ghy2wybm5rgvrpphqxse.jpg	1280	720	11598
228	//images.igdb.com/igdb/image/upload/t_thumb/kfae6n4w084dkqpxz2x5.jpg	1280	720	11598
229	//images.igdb.com/igdb/image/upload/t_thumb/ideab5wjbnygh2kuqjqv.jpg	1280	720	11598
230	//images.igdb.com/igdb/image/upload/t_thumb/ays27x48oi2o2hamvla0.jpg	1920	1062	25653
231	//images.igdb.com/igdb/image/upload/t_thumb/dczenunc39m1eomjbtip.jpg	1920	1062	25653
232	//images.igdb.com/igdb/image/upload/t_thumb/mk0u70izt4bwwtljynaa.jpg	1920	1080	25653
233	//images.igdb.com/igdb/image/upload/t_thumb/qgw4gbsyffqjzo8izlm9.jpg	1920	1080	25653
234	//images.igdb.com/igdb/image/upload/t_thumb/ysuhc3zxxxj1lw1ratcn.jpg	1920	1080	25653
235	//images.igdb.com/igdb/image/upload/t_thumb/rjndmfvfzic2o9ysqsfw.jpg	1677	1040	11122
236	//images.igdb.com/igdb/image/upload/t_thumb/w346d28c8qhusyukarax.jpg	1675	1048	11122
237	//images.igdb.com/igdb/image/upload/t_thumb/php6od3wzxksrfd3jvqg.jpg	1672	1042	11122
238	//images.igdb.com/igdb/image/upload/t_thumb/lxjuqatwul541hixd7yu.jpg	1672	1048	11122
239	//images.igdb.com/igdb/image/upload/t_thumb/tnoyqula1pbld1fagb2a.jpg	644	363	11122
240	//images.igdb.com/igdb/image/upload/t_thumb/tn7xzii5jfn9ogfhkejm.jpg	620	349	27527
241	//images.igdb.com/igdb/image/upload/t_thumb/w1rxdz26rpxylfe1r1vi.jpg	902	507	27529
242	//images.igdb.com/igdb/image/upload/t_thumb/gsqomyqfsqqq31yhw0tt.jpg	640	360	1879
243	//images.igdb.com/igdb/image/upload/t_thumb/cdg8nmyqbjogspa5wzvf.jpg	640	360	1879
244	//images.igdb.com/igdb/image/upload/t_thumb/ljasptd7zt2qjlnlor2u.jpg	640	360	1879
245	//images.igdb.com/igdb/image/upload/t_thumb/m2kmaxcmw15wzco2sdep.jpg	640	360	1879
246	//images.igdb.com/igdb/image/upload/t_thumb/t6s7giog1jauigcvyxo0.jpg	640	360	1879
247	//images.igdb.com/igdb/image/upload/t_thumb/lwibmrdgqdgueymek22x.jpg	1280	720	27532
248	//images.igdb.com/igdb/image/upload/t_thumb/x3bf0p6hhtknpqpeme2r.jpg	1280	720	27532
249	//images.igdb.com/igdb/image/upload/t_thumb/w4vqvuggwientqajgtb6.jpg	1280	720	27532
250	//images.igdb.com/igdb/image/upload/t_thumb/tvnrs95tcr5waqlvrndv.jpg	1280	720	27532
251	//images.igdb.com/igdb/image/upload/t_thumb/mrzcibzdri0zonlyb8sm.jpg	1280	720	27532
252	//images.igdb.com/igdb/image/upload/t_thumb/btie3pta6bvwcdwbzikz.jpg	1920	1080	40968
253	//images.igdb.com/igdb/image/upload/t_thumb/zkpfexoqx4qp7f0geenk.jpg	1918	1078	40968
254	//images.igdb.com/igdb/image/upload/t_thumb/qiixnb2dcdz6quodre8q.jpg	1920	1080	40968
255	//images.igdb.com/igdb/image/upload/t_thumb/rwt4qjc0we7nhyxqujhr.jpg	1920	1080	40968
256	//images.igdb.com/igdb/image/upload/t_thumb/taizio7cr4whkjaa8crn.jpg	1920	1080	40968
257	//images.igdb.com/igdb/image/upload/t_thumb/izlpqfpedj7v8augou4g.jpg	1920	1080	27519
258	//images.igdb.com/igdb/image/upload/t_thumb/vj39mskwynzoqmc0axni.jpg	1920	1080	27519
259	//images.igdb.com/igdb/image/upload/t_thumb/iypdqzs8k7lmatfnu41l.jpg	1920	1080	27519
260	//images.igdb.com/igdb/image/upload/t_thumb/dzxheami0a0hrxixgmm1.jpg	1920	1080	27519
261	//images.igdb.com/igdb/image/upload/t_thumb/j0kwy3msdoxxh0j6f9uu.jpg	1920	1080	27519
262	//images.igdb.com/igdb/image/upload/t_thumb/ij4il0e9k76emri8qw8b.jpg	1920	1080	24440
263	//images.igdb.com/igdb/image/upload/t_thumb/jn5o7pqthz4l1gvtrez7.jpg	1920	1080	24440
264	//images.igdb.com/igdb/image/upload/t_thumb/ewda1njbjfljf5kyfiey.jpg	1920	1080	24440
265	//images.igdb.com/igdb/image/upload/t_thumb/aayxkpj9skw5oluhh7nd.jpg	1920	1080	24440
266	//images.igdb.com/igdb/image/upload/t_thumb/a6jxeze33tqnassb3qmw.jpg	1920	1080	24440
267	//images.igdb.com/igdb/image/upload/t_thumb/k7qemwjwn9qorbadm7zp.jpg	738	419	26760
268	//images.igdb.com/igdb/image/upload/t_thumb/i1kocmvc6ntgynzyqrar.jpg	738	419	26760
269	//images.igdb.com/igdb/image/upload/t_thumb/cxdkmlhwoxne1jkkmnao.jpg	1280	720	26762
270	//images.igdb.com/igdb/image/upload/t_thumb/ko7enqdlo0ynyh580gbq.jpg	1280	720	8959
271	//images.igdb.com/igdb/image/upload/t_thumb/drlhyfauqx372acc9wtt.jpg	1280	720	8959
272	//images.igdb.com/igdb/image/upload/t_thumb/phbvyg7lsy3f742lki86.jpg	1280	720	8959
273	//images.igdb.com/igdb/image/upload/t_thumb/cuz3urs0n1epxcizio19.jpg	1280	720	8959
274	//images.igdb.com/igdb/image/upload/t_thumb/lqitdfpjow3ohszxmchq.jpg	1280	720	8959
275	//images.igdb.com/igdb/image/upload/t_thumb/lewzk3ci94nuwt9ptuqt.jpg	1920	1080	27534
276	//images.igdb.com/igdb/image/upload/t_thumb/l2t0vph8o05cxmn9t7zw.jpg	1920	1080	27534
277	//images.igdb.com/igdb/image/upload/t_thumb/qc2uwxvoyvzbda4kmsjh.jpg	1920	1080	27534
278	//images.igdb.com/igdb/image/upload/t_thumb/mzmdg5xbay63qleugftc.jpg	1920	1080	27534
279	//images.igdb.com/igdb/image/upload/t_thumb/idfphna7usvdctrxbi4q.jpg	1920	1080	27534
280	//images.igdb.com/igdb/image/upload/t_thumb/mkrsktj9pcc0lzsztnxj.jpg	600	338	26774
281	//images.igdb.com/igdb/image/upload/t_thumb/ny7o63whlrkyit0y9x6u.jpg	1500	844	19576
282	//images.igdb.com/igdb/image/upload/t_thumb/fwznxw0tw3c1wuczlnaz.jpg	1500	844	19576
283	//images.igdb.com/igdb/image/upload/t_thumb/op5jgw085rxysrtq2h1e.jpg	1500	844	19576
284	//images.igdb.com/igdb/image/upload/t_thumb/ybk0ju3ce2qludv6hu4g.jpg	1500	844	19576
285	//images.igdb.com/igdb/image/upload/t_thumb/r0dggpilicgwmytrv3pl.jpg	1200	675	19576
286	//images.igdb.com/igdb/image/upload/t_thumb/o913mxttms5jfneceueb.jpg	1920	1080	23910
287	//images.igdb.com/igdb/image/upload/t_thumb/n3ptkxiu2rrkhyi13krg.jpg	1920	1080	23910
288	//images.igdb.com/igdb/image/upload/t_thumb/nlypquqgwtraohbjnx40.jpg	1920	1080	23910
289	//images.igdb.com/igdb/image/upload/t_thumb/pydpu3k5lv8bjkobh1au.jpg	1920	1080	23910
290	//images.igdb.com/igdb/image/upload/t_thumb/nmz9yb9lkd2ddfallvpj.jpg	1920	1080	23910
291	//images.igdb.com/igdb/image/upload/t_thumb/wdfkntzlbjmgk49frnbd.jpg	620	349	26816
292	//images.igdb.com/igdb/image/upload/t_thumb/gtn5nnlwfbpcpakpco2d.jpg	1495	841	9484
293	//images.igdb.com/igdb/image/upload/t_thumb/ojbhs9sfywcgcoiajpi1.jpg	1600	900	9484
294	//images.igdb.com/igdb/image/upload/t_thumb/uc3mkxlomlftzd0hi00i.jpg	1600	900	9484
295	//images.igdb.com/igdb/image/upload/t_thumb/i9ylcov1vq3qfr4j8lrw.jpg	1600	900	9484
296	//images.igdb.com/igdb/image/upload/t_thumb/vayrw7frgbexnx1xjfpm.jpg	1600	900	9484
297	//images.igdb.com/igdb/image/upload/t_thumb/c6mlvq2ulr56ibbb3tva.jpg	1920	1080	11070
298	//images.igdb.com/igdb/image/upload/t_thumb/u6titrlnmprvuanf2grp.jpg	1920	1080	11070
299	//images.igdb.com/igdb/image/upload/t_thumb/y8vwhw8coea5nqiq9pjl.jpg	1920	1080	11070
300	//images.igdb.com/igdb/image/upload/t_thumb/snzh5m6cfk5fwjhswunr.jpg	1920	1080	11070
301	//images.igdb.com/igdb/image/upload/t_thumb/ofwr4kpaijqktoiezko8.jpg	1920	1080	11070
302	//images.igdb.com/igdb/image/upload/t_thumb/fs1iyx4glbgnplvsjcct.jpg	1280	720	14694
303	//images.igdb.com/igdb/image/upload/t_thumb/lcbjtpzng4nkeifj0dnd.jpg	1280	720	14694
304	//images.igdb.com/igdb/image/upload/t_thumb/fhwf6xnyvfqvk1bcuyo8.jpg	1280	720	14694
305	//images.igdb.com/igdb/image/upload/t_thumb/mwmrw9ysvic7btm4hhpd.jpg	7680	4320	10760
306	//images.igdb.com/igdb/image/upload/t_thumb/nfjsb9mcpmx6u9wm75zu.jpg	7680	4320	10760
307	//images.igdb.com/igdb/image/upload/t_thumb/liovkpwhdzcae6dazgrh.jpg	7680	4320	10760
308	//images.igdb.com/igdb/image/upload/t_thumb/wkyizzyxr3c0tiqrvty0.jpg	7680	4320	10760
309	//images.igdb.com/igdb/image/upload/t_thumb/gdwdpejbkfajukfbyaf4.jpg	7680	4320	10760
310	//images.igdb.com/igdb/image/upload/t_thumb/m3kzqwhu5lheqhtoc4nd.jpg	1920	1080	18975
311	//images.igdb.com/igdb/image/upload/t_thumb/kmc18ok5ttmkpcl3slii.jpg	1920	1080	18975
312	//images.igdb.com/igdb/image/upload/t_thumb/jcr8rwf4wanzkfiofsdo.jpg	1920	1080	18975
313	//images.igdb.com/igdb/image/upload/t_thumb/guftf6o2ov8inepjfivw.jpg	1920	1080	18975
314	//images.igdb.com/igdb/image/upload/t_thumb/tkhfqgfus9m6dtaqqjgl.jpg	1920	1080	18975
315	//images.igdb.com/igdb/image/upload/t_thumb/prfsobc5wmkzd920nhsm.jpg	1500	844	12875
316	//images.igdb.com/igdb/image/upload/t_thumb/jnn7pmyzdi7g604nf21i.jpg	1500	844	12875
317	//images.igdb.com/igdb/image/upload/t_thumb/lpo72oagecjfg1mo2ywa.jpg	1500	844	12875
318	//images.igdb.com/igdb/image/upload/t_thumb/tlxhj4aluguswe4sfywl.jpg	960	544	12875
319	//images.igdb.com/igdb/image/upload/t_thumb/rrfsx1kh2v0nnyyxzy7b.jpg	960	544	12875
320	//images.igdb.com/igdb/image/upload/t_thumb/p8czjqa9at68epemp7tr.jpg	1920	897	27872
321	//images.igdb.com/igdb/image/upload/t_thumb/dxysfqjs3baimgf3aaq9.jpg	1920	1080	27872
322	//images.igdb.com/igdb/image/upload/t_thumb/coluavdz02wh9ggmb05h.jpg	1449	816	27872
323	//images.igdb.com/igdb/image/upload/t_thumb/vh4sm2ywpua1x06ycf70.jpg	1024	1024	978
324	//images.igdb.com/igdb/image/upload/t_thumb/wtkd9ntctzw82mlkgkgl.jpg	1280	720	978
325	//images.igdb.com/igdb/image/upload/t_thumb/tno8n9ecfmrn2fgtkxzj.jpg	1800	1080	978
326	//images.igdb.com/igdb/image/upload/t_thumb/xykgskwjtk8k73ch9c4q.jpg	1920	1080	978
327	//images.igdb.com/igdb/image/upload/t_thumb/yhdnhhzmnvreyd9cldhl.jpg	1920	1080	978
328	//images.igdb.com/igdb/image/upload/t_thumb/ixpcj4uxhuckw8zkmttu.jpg	3840	2160	25636
329	//images.igdb.com/igdb/image/upload/t_thumb/fa0yg1fbmi28iqp7psid.jpg	1920	1080	25636
330	//images.igdb.com/igdb/image/upload/t_thumb/winee18ksbncypdv1hfg.jpg	3840	2160	25636
331	//images.igdb.com/igdb/image/upload/t_thumb/u38glk4c4aqzdy8tuxuo.jpg	3840	2160	25636
332	//images.igdb.com/igdb/image/upload/t_thumb/bfcnvnw3bhidrqguayaa.jpg	1920	1080	25636
333	//images.igdb.com/igdb/image/upload/t_thumb/cqozfhn78mvp5zkkopg0.jpg	1969	981	41825
334	//images.igdb.com/igdb/image/upload/t_thumb/sygbyojrhvyktvqhs34p.jpg	1280	721	41893
335	//images.igdb.com/igdb/image/upload/t_thumb/xj6aps0arulqvuyftxur.jpg	640	360	41893
336	//images.igdb.com/igdb/image/upload/t_thumb/pqahesrhhazstqeowvv0.jpg	1920	1080	41893
337	//images.igdb.com/igdb/image/upload/t_thumb/falulmgigchmpjogfnt4.jpg	1920	1080	41893
338	//images.igdb.com/igdb/image/upload/t_thumb/v48ygqbez0t0c1iqso36.jpg	1920	1080	41893
339	//images.igdb.com/igdb/image/upload/t_thumb/v2loqdddbbj1l72ow46m.jpg	1920	1080	36856
340	//images.igdb.com/igdb/image/upload/t_thumb/vwkga18zqahatmfuii4t.jpg	1920	1080	41812
341	//images.igdb.com/igdb/image/upload/t_thumb/gszeosk2hgvwuc17f74r.jpg	1920	1080	41812
342	//images.igdb.com/igdb/image/upload/t_thumb/rnezsnptu94lg8qn86q6.jpg	1920	1080	41812
343	//images.igdb.com/igdb/image/upload/t_thumb/eje7vc7rcukssgii78vk.jpg	1920	1080	41812
344	//images.igdb.com/igdb/image/upload/t_thumb/wxxrhz4hicobgetck7zh.jpg	1920	1080	41812
345	//images.igdb.com/igdb/image/upload/t_thumb/ymvi7wgymamhpojduqiu.jpg	1920	1080	14545
346	//images.igdb.com/igdb/image/upload/t_thumb/z2ukwsdycewzbeeogxjx.jpg	1920	1080	14545
347	//images.igdb.com/igdb/image/upload/t_thumb/jh5o7qqjm5fr5ouunywi.jpg	1920	1080	14545
348	//images.igdb.com/igdb/image/upload/t_thumb/vu1mhjwh2qd0yafxujhz.jpg	1920	1080	14545
349	//images.igdb.com/igdb/image/upload/t_thumb/wxewbirk35qn8k8t0sp2.jpg	600	337	14545
350	//images.igdb.com/igdb/image/upload/t_thumb/cuu6u3m3iw2jiehsecnp.jpg	683	384	942
351	//images.igdb.com/igdb/image/upload/t_thumb/dtne1q6owscdwa4ueux4.jpg	797	448	942
352	//images.igdb.com/igdb/image/upload/t_thumb/arf9u3bwn804gb0nwgvr.jpg	794	447	942
353	//images.igdb.com/igdb/image/upload/t_thumb/nt1x7lvbhtbopa63awps.jpg	704	396	942
354	//images.igdb.com/igdb/image/upload/t_thumb/yc7qssyvyl7uicnez3hr.jpg	670	377	942
355	//images.igdb.com/igdb/image/upload/t_thumb/yxdtepli1duvxfyrauqi.jpg	1920	1080	1363
356	//images.igdb.com/igdb/image/upload/t_thumb/qpitp1r6j45asla2ivcy.jpg	1920	1080	1363
357	//images.igdb.com/igdb/image/upload/t_thumb/ri3gymfndc0tqpodc2os.jpg	1920	1080	1363
358	//images.igdb.com/igdb/image/upload/t_thumb/x9rugkd0dhbkgvv1zrnf.jpg	1920	1080	1363
359	//images.igdb.com/igdb/image/upload/t_thumb/hiwomwo4hw2es0ol2eia.jpg	600	350	1363
360	//images.igdb.com/igdb/image/upload/t_thumb/vahss8soe3tginavzmzp.jpg	1920	1080	26226
361	//images.igdb.com/igdb/image/upload/t_thumb/hisxvydbpgrg9thupnlg.jpg	1920	1080	26226
362	//images.igdb.com/igdb/image/upload/t_thumb/wjw3vnaclj29fqtziwsr.jpg	1920	1080	26226
363	//images.igdb.com/igdb/image/upload/t_thumb/e9lk3alqutkrciksfque.jpg	1920	1080	26226
364	//images.igdb.com/igdb/image/upload/t_thumb/fwjvpiu2ircdq5afkm1o.jpg	1920	1080	26226
365	//images.igdb.com/igdb/image/upload/t_thumb/jaaad6elvgi1byk5zxum.jpg	1500	844	19799
366	//images.igdb.com/igdb/image/upload/t_thumb/dnzdznxb4nl9rknqluuy.jpg	1500	844	19799
367	//images.igdb.com/igdb/image/upload/t_thumb/eghd6nvuz3p3bur8fkh0.jpg	1500	844	19799
368	//images.igdb.com/igdb/image/upload/t_thumb/yw7qeqrqzdp2982xigsm.jpg	1500	844	19799
369	//images.igdb.com/igdb/image/upload/t_thumb/lyryu29eofh7g5o4qwem.jpg	1500	844	19799
370	//images.igdb.com/igdb/image/upload/t_thumb/kenrskq9yyneovse9ods.jpg	1920	1080	20123
371	//images.igdb.com/igdb/image/upload/t_thumb/sphnuyg1gr7ddoa7up0x.jpg	1920	1080	20123
372	//images.igdb.com/igdb/image/upload/t_thumb/rbp0nusxle770d5bdtf7.jpg	1920	1080	20123
373	//images.igdb.com/igdb/image/upload/t_thumb/nj8tzrmcu74nc8y8jcac.jpg	1920	1080	20123
374	//images.igdb.com/igdb/image/upload/t_thumb/pwpcljnp3xh4hff1gipa.jpg	1920	1080	20123
375	//images.igdb.com/igdb/image/upload/t_thumb/pexxcdzesutyj8ufxax9.jpg	1000	475	27505
376	//images.igdb.com/igdb/image/upload/t_thumb/zfgqqoseqwwwiwiunifv.jpg	1916	1078	28075
377	//images.igdb.com/igdb/image/upload/t_thumb/g5q6h0oswnicpxxtpzxm.jpg	1916	1175	28075
378	//images.igdb.com/igdb/image/upload/t_thumb/fook07yq2bfyvhvo43ih.jpg	1916	1134	28075
379	//images.igdb.com/igdb/image/upload/t_thumb/hzvywfuj1cv4xndeo6f6.jpg	1916	882	28075
380	//images.igdb.com/igdb/image/upload/t_thumb/edtdnnfghegckgwcwsjb.jpg	1916	1061	28075
381	//images.igdb.com/igdb/image/upload/t_thumb/fzgqovmkbduoz1v7bt19.jpg	1280	720	43363
382	//images.igdb.com/igdb/image/upload/t_thumb/gcyx2i3yfjr1rmteq9nx.jpg	1280	720	43363
383	//images.igdb.com/igdb/image/upload/t_thumb/rhulgxi0gxtbeznw8l64.jpg	1280	720	43363
384	//images.igdb.com/igdb/image/upload/t_thumb/zg80oqc1daghyh1g01qc.jpg	1280	720	43363
385	//images.igdb.com/igdb/image/upload/t_thumb/sfsdlj1cewqhgamkek1z.jpg	1280	720	43363
386	//images.igdb.com/igdb/image/upload/t_thumb/gef4chvvmxwatjlwxcbe.jpg	1920	1080	36534
387	//images.igdb.com/igdb/image/upload/t_thumb/hwr7xzs0iovqlbxa67yz.jpg	1920	1080	36534
388	//images.igdb.com/igdb/image/upload/t_thumb/rd4vug8n2nzt2rvtproc.jpg	1920	1080	36534
389	//images.igdb.com/igdb/image/upload/t_thumb/b0fpicveglrvdejjscfs.jpg	1920	1080	36534
390	//images.igdb.com/igdb/image/upload/t_thumb/esdtltgr8iuievwtgjks.jpg	1920	1080	36534
391	//images.igdb.com/igdb/image/upload/t_thumb/omsn4arae0xikhjlmemf.jpg	1280	720	10031
392	//images.igdb.com/igdb/image/upload/t_thumb/yh6erecyvhn8yfmehu3o.jpg	1920	1080	10031
393	//images.igdb.com/igdb/image/upload/t_thumb/drhwejxg6f9yablgdwff.jpg	1920	1080	10031
394	//images.igdb.com/igdb/image/upload/t_thumb/rlj3zf5yc3wetlalhmia.jpg	1920	1080	10031
395	//images.igdb.com/igdb/image/upload/t_thumb/zihysaqixhh8c8e89cev.jpg	1920	1080	10031
396	//images.igdb.com/igdb/image/upload/t_thumb/jipzfzx3fwv5hxg4qdhx.jpg	1280	720	28067
397	//images.igdb.com/igdb/image/upload/t_thumb/vtdrev0pblsbszkogav6.jpg	1280	720	28067
398	//images.igdb.com/igdb/image/upload/t_thumb/sywo4o0ybxbi0e5p57wk.jpg	1920	1080	28067
399	//images.igdb.com/igdb/image/upload/t_thumb/nolmmsszbq5xztbx82ft.jpg	1920	1080	28067
400	//images.igdb.com/igdb/image/upload/t_thumb/ijbypy5dlcsaxhc1g3lu.jpg	1920	1080	28067
401	//images.igdb.com/igdb/image/upload/t_thumb/qkf8dpawhour9audollp.jpg	1905	1080	19729
402	//images.igdb.com/igdb/image/upload/t_thumb/lxp8zvoojtwtcs6xf1on.jpg	1905	1080	19729
403	//images.igdb.com/igdb/image/upload/t_thumb/wzcllcyfd3ym7ftvqr8f.jpg	1905	1080	19729
404	//images.igdb.com/igdb/image/upload/t_thumb/mrdskrzpdzhrnla1whov.jpg	1905	1080	19729
405	//images.igdb.com/igdb/image/upload/t_thumb/hljknocxxgyoyog86f8e.jpg	1905	1080	19729
406	//images.igdb.com/igdb/image/upload/t_thumb/mlswqii8zegvepeewian.jpg	1920	1080	26763
407	//images.igdb.com/igdb/image/upload/t_thumb/rhkfvxhwa1xixbklqwcd.jpg	1920	1080	26763
408	//images.igdb.com/igdb/image/upload/t_thumb/jixzu0b5gzlc4luou4oo.jpg	1920	1080	26763
409	//images.igdb.com/igdb/image/upload/t_thumb/iu1mwspk5upmlzy0tzit.jpg	1920	1080	26763
410	//images.igdb.com/igdb/image/upload/t_thumb/yhasedugb8fhh9cydn0g.jpg	1920	1080	26763
411	//images.igdb.com/igdb/image/upload/t_thumb/b3mdueoixntnwsi83dzm.jpg	1920	1080	26857
412	//images.igdb.com/igdb/image/upload/t_thumb/np2sadbpdcvr6ergaayp.jpg	1920	1080	26857
413	//images.igdb.com/igdb/image/upload/t_thumb/mt62w2wwxehh44ifgu18.jpg	1920	1080	26857
414	//images.igdb.com/igdb/image/upload/t_thumb/ryjczmuos7ssan3d9mfm.jpg	1920	1080	26857
415	//images.igdb.com/igdb/image/upload/t_thumb/r2vpr5hqugcks6816lyi.jpg	1920	1080	26857
416	//images.igdb.com/igdb/image/upload/t_thumb/pujwbvgzh1sbeunpqwjl.jpg	745	419	26759
417	//images.igdb.com/igdb/image/upload/t_thumb/c9mwcp2wg13yswuy69h6.jpg	745	419	26759
418	//images.igdb.com/igdb/image/upload/t_thumb/ufk2yvgojwy8httag9pf.jpg	745	419	26759
419	//images.igdb.com/igdb/image/upload/t_thumb/huevpwgmnp1ex0szuagn.jpg	745	419	26759
420	//images.igdb.com/igdb/image/upload/t_thumb/jbgjoygasccrxfqrrabm.jpg	1280	720	28015
421	//images.igdb.com/igdb/image/upload/t_thumb/iqghcnfqbq4ee46frbcc.jpg	1280	720	28015
422	//images.igdb.com/igdb/image/upload/t_thumb/ptypfy4acyqvzd9dpjjq.jpg	1280	720	28015
423	//images.igdb.com/igdb/image/upload/t_thumb/qay9clj4h6hjrwi16w5n.jpg	1280	720	28015
424	//images.igdb.com/igdb/image/upload/t_thumb/grhpmntcfnbbzuhn3ie1.jpg	968	300	26773
425	//images.igdb.com/igdb/image/upload/t_thumb/qzsqegoqqf4et7gfdjnk.jpg	1920	1080	19452
426	//images.igdb.com/igdb/image/upload/t_thumb/berfk2duzvwmuzrtqrei.jpg	1920	1080	19452
427	//images.igdb.com/igdb/image/upload/t_thumb/dofldlhuthhyumihwwyt.jpg	1920	1080	19452
428	//images.igdb.com/igdb/image/upload/t_thumb/w1x7fo09ke78kb2xkemd.jpg	1920	1080	19452
429	//images.igdb.com/igdb/image/upload/t_thumb/hz8tsbc8ircaebpunrce.jpg	1279	657	19452
430	//images.igdb.com/igdb/image/upload/t_thumb/qachejgmyqeqoaqfvram.jpg	1920	1080	28174
431	//images.igdb.com/igdb/image/upload/t_thumb/vtaemtya9panhzkpsftn.jpg	1920	1080	28174
432	//images.igdb.com/igdb/image/upload/t_thumb/ex1vz1al90aa0sxkgnnt.jpg	1920	1080	14393
433	//images.igdb.com/igdb/image/upload/t_thumb/p0carx3fppkxbu6mjonr.jpg	1920	1080	14393
434	//images.igdb.com/igdb/image/upload/t_thumb/kuytdcoig23rizg6xfkw.jpg	1920	1080	14393
435	//images.igdb.com/igdb/image/upload/t_thumb/uodt9dykgi7iuwla3mvg.jpg	1438	810	14393
436	//images.igdb.com/igdb/image/upload/t_thumb/ic5fwolcygm2nygc0rha.jpg	600	337	14393
437	//images.igdb.com/igdb/image/upload/t_thumb/ohqdv2qatwnkhqywtiju.jpg	300	180	15429
438	//images.igdb.com/igdb/image/upload/t_thumb/jpxtdpbye8hlhw7zrvfu.jpg	600	450	1408
439	//images.igdb.com/igdb/image/upload/t_thumb/ux7j5o2be0oxm5wpduxi.jpg	600	450	1408
440	//images.igdb.com/igdb/image/upload/t_thumb/ov4yyqvsajzmzeogplay.jpg	600	450	1408
441	//images.igdb.com/igdb/image/upload/t_thumb/dv6kodas2qnol0ehbqvm.jpg	600	450	1408
442	//images.igdb.com/igdb/image/upload/t_thumb/vtqfi8tunxg90yrzriid.jpg	480	270	1408
443	//images.igdb.com/igdb/image/upload/t_thumb/lxgpm4u9vrcd0jv5eyvt.jpg	956	538	28412
444	//images.igdb.com/igdb/image/upload/t_thumb/yfxsoc5czpf0tf2pdy59.jpg	956	538	28412
445	//images.igdb.com/igdb/image/upload/t_thumb/rxt5ybzychcpywskje8i.jpg	956	538	28412
446	//images.igdb.com/igdb/image/upload/t_thumb/ernwwmw5ayhiorq9wjeq.jpg	956	538	28412
447	//images.igdb.com/igdb/image/upload/t_thumb/tl4skzurdii8k3tb59e6.jpg	960	540	28409
448	//images.igdb.com/igdb/image/upload/t_thumb/n7vvdaasdaoi88qx2jch.jpg	960	540	28409
449	//images.igdb.com/igdb/image/upload/t_thumb/qu7tno0rlhj6isacveo9.jpg	960	540	28409
450	//images.igdb.com/igdb/image/upload/t_thumb/jx7mmkrv2k8nnvtzifex.jpg	960	540	28409
451	//images.igdb.com/igdb/image/upload/t_thumb/yazvjwzdlgbqkm0lkcxl.jpg	960	540	28409
452	//images.igdb.com/igdb/image/upload/t_thumb/d3akz1hdmqzvjpxamzdz.jpg	956	538	28416
453	//images.igdb.com/igdb/image/upload/t_thumb/lnpilw1a7hsyv1enekfj.jpg	956	538	28416
454	//images.igdb.com/igdb/image/upload/t_thumb/uniosuqmciuefrjltss9.jpg	956	538	28416
455	//images.igdb.com/igdb/image/upload/t_thumb/olfmccxb4ll9pkojcel4.jpg	956	538	28416
456	//images.igdb.com/igdb/image/upload/t_thumb/okdpuvgv11eg44jpfykh.jpg	956	538	28418
457	//images.igdb.com/igdb/image/upload/t_thumb/s1zfd7q5povd5esgmqmh.jpg	956	538	28418
458	//images.igdb.com/igdb/image/upload/t_thumb/pyvecgqsyxflkqfe6vbr.jpg	956	538	28418
459	//images.igdb.com/igdb/image/upload/t_thumb/rwf55ynqpsupgppxb6am.jpg	956	538	28418
460	//images.igdb.com/igdb/image/upload/t_thumb/prdulygrssawjwgatwpe.jpg	1920	1080	2058
461	//images.igdb.com/igdb/image/upload/t_thumb/wpvruhn3niwnbylsc9xe.jpg	640	360	2058
462	//images.igdb.com/igdb/image/upload/t_thumb/m2gvnx8pf3q5hkn6h51s.jpg	1920	1080	2058
463	//images.igdb.com/igdb/image/upload/t_thumb/qffqinp6ndhcjjuvo4hw.jpg	1920	1080	2058
464	//images.igdb.com/igdb/image/upload/t_thumb/xwtx32oirektiectrp3d.jpg	1920	1080	2058
465	//images.igdb.com/igdb/image/upload/t_thumb/hclzzywlisrqt4qz4jrq.jpg	1920	1080	28081
466	//images.igdb.com/igdb/image/upload/t_thumb/fbnhyexoeg8gphmxdqvf.jpg	1920	1080	28081
467	//images.igdb.com/igdb/image/upload/t_thumb/gmdb4mm1pcelu3g0lfh6.jpg	1920	1080	28081
468	//images.igdb.com/igdb/image/upload/t_thumb/i5m2duwmbx4dn3ijsbv7.jpg	1920	1080	28081
469	//images.igdb.com/igdb/image/upload/t_thumb/fluxleojgqdgnapllfxu.jpg	1920	1080	28081
470	//images.igdb.com/igdb/image/upload/t_thumb/ctoaqzsxb5jg9txltmnr.jpg	960	540	28451
471	//images.igdb.com/igdb/image/upload/t_thumb/ue82pnwko2aehcozpb2f.jpg	960	540	28451
472	//images.igdb.com/igdb/image/upload/t_thumb/hnkanutspvfzuj8gbymx.jpg	960	540	28451
473	//images.igdb.com/igdb/image/upload/t_thumb/xwvevvuz3xx6sarq0pbh.jpg	960	540	28451
474	//images.igdb.com/igdb/image/upload/t_thumb/vjnekwwbrm5rscswh6ge.jpg	960	540	28452
475	//images.igdb.com/igdb/image/upload/t_thumb/tg38ylgbqg26rtlfzvoz.jpg	960	540	28452
476	//images.igdb.com/igdb/image/upload/t_thumb/lxub7q8v1q02z8cpmbx0.jpg	960	540	28452
477	//images.igdb.com/igdb/image/upload/t_thumb/cz4kmhpkzs29dvxj1rk0.jpg	960	540	28452
478	//images.igdb.com/igdb/image/upload/t_thumb/nltetl5m8sxq7deauwrf.jpg	480	360	28466
479	//images.igdb.com/igdb/image/upload/t_thumb/scvugzx5jvcryrymk5oj.jpg	1280	720	15426
480	//images.igdb.com/igdb/image/upload/t_thumb/dyhnodgeak35inzrd5qj.jpg	620	349	26818
481	//images.igdb.com/igdb/image/upload/t_thumb/amcwitgxcnw9xhugo89n.jpg	1920	1080	19082
482	//images.igdb.com/igdb/image/upload/t_thumb/j25cu0ypbxd9ing2vqe5.jpg	1920	1080	19082
483	//images.igdb.com/igdb/image/upload/t_thumb/xhguhyhha2pejhxkjktv.jpg	1920	1080	19082
484	//images.igdb.com/igdb/image/upload/t_thumb/qzdmq0z22iodrdhitfoi.jpg	1920	1080	19082
485	//images.igdb.com/igdb/image/upload/t_thumb/btlzou7vqa6kvxgjb3z2.jpg	1920	1080	19082
486	//images.igdb.com/igdb/image/upload/t_thumb/btc8lzw5dvxtzrpazp1o.jpg	1920	1080	27051
487	//images.igdb.com/igdb/image/upload/t_thumb/jw0g4nuh3pnae6shvzbp.jpg	1920	1080	27051
488	//images.igdb.com/igdb/image/upload/t_thumb/snv7k1qqc4xiq3w9zrds.jpg	1920	1080	27051
489	//images.igdb.com/igdb/image/upload/t_thumb/vgz1cljp32wngjlcsmlj.jpg	1920	1080	27051
490	//images.igdb.com/igdb/image/upload/t_thumb/knnpbo9auvlbmkqqjpgd.jpg	600	338	27051
491	//images.igdb.com/igdb/image/upload/t_thumb/xa7nhmzxiaosg7qoom9g.jpg	1600	838	121
492	//images.igdb.com/igdb/image/upload/t_thumb/cic8hqeq2g9w1u6wodpm.jpg	1600	838	121
493	//images.igdb.com/igdb/image/upload/t_thumb/mzw1sxpwrlfagmoqiunw.jpg	600	348	121
494	//images.igdb.com/igdb/image/upload/t_thumb/kzlvv9jbdvfqhsmvluxd.jpg	1920	1080	19449
495	//images.igdb.com/igdb/image/upload/t_thumb/kmbdbhycc7hzwa7trtbn.jpg	1920	1080	19449
496	//images.igdb.com/igdb/image/upload/t_thumb/nsimoj3vnufyxzvvjz6x.jpg	1920	1080	19449
497	//images.igdb.com/igdb/image/upload/t_thumb/y3kpe3bviixc1nn0in6m.jpg	1920	1080	19449
498	//images.igdb.com/igdb/image/upload/t_thumb/xlwkmhicvnvpx08i9xxu.jpg	1920	1080	19449
499	//images.igdb.com/igdb/image/upload/t_thumb/kil8h6mzcc39lmtqwel8.jpg	1280	800	16932
500	//images.igdb.com/igdb/image/upload/t_thumb/ibxrojd5diugdktlj5hc.jpg	1280	800	16932
501	//images.igdb.com/igdb/image/upload/t_thumb/af9qy1ptvs4scqk4jgxe.jpg	1280	800	16932
502	//images.igdb.com/igdb/image/upload/t_thumb/uhdw6pyt3gn4ttgkefff.jpg	1280	800	16932
503	//images.igdb.com/igdb/image/upload/t_thumb/infoufowjr4we4ydpuye.jpg	1280	800	16932
504	//images.igdb.com/igdb/image/upload/t_thumb/piwxq2mqw6e9ydqkttph.jpg	1920	1080	19002
505	//images.igdb.com/igdb/image/upload/t_thumb/eqhf6ubz3sb5lbupychd.jpg	1920	1080	19002
506	//images.igdb.com/igdb/image/upload/t_thumb/f5leumdw8fz12rcpo2xf.jpg	1920	1080	19002
507	//images.igdb.com/igdb/image/upload/t_thumb/bubdyctzqqcvd0tm3pku.jpg	1920	1080	19002
508	//images.igdb.com/igdb/image/upload/t_thumb/lqep7j6hemf65vsfglww.jpg	1920	1080	19002
509	//images.igdb.com/igdb/image/upload/t_thumb/duswpa0mczfh3lkzhd3n.jpg	1920	1080	28815
510	//images.igdb.com/igdb/image/upload/t_thumb/cfhsp4vsazdrlhasxdqn.jpg	1920	1080	28815
511	//images.igdb.com/igdb/image/upload/t_thumb/rkdmulrsy150wzeikbhq.jpg	1920	1080	28815
512	//images.igdb.com/igdb/image/upload/t_thumb/hgoxpkzrqsfqpvtyakqi.jpg	1920	1080	28815
513	//images.igdb.com/igdb/image/upload/t_thumb/zxjfweccx2cspqjf4oci.jpg	1280	720	28815
514	//images.igdb.com/igdb/image/upload/t_thumb/zs0ao8lrm5qmsmasadoo.jpg	1920	1080	26772
515	//images.igdb.com/igdb/image/upload/t_thumb/bexdjkxqei52jv5gmftl.jpg	1920	1080	26772
516	//images.igdb.com/igdb/image/upload/t_thumb/voonf5ppjypx7kj9jmkl.jpg	1920	1080	26772
517	//images.igdb.com/igdb/image/upload/t_thumb/rfr4tdlqewnv1r2u3yaj.jpg	1920	1080	26772
518	//images.igdb.com/igdb/image/upload/t_thumb/ykuycgajspivfo1j60sr.jpg	6239	3510	37078
519	//images.igdb.com/igdb/image/upload/t_thumb/h6kd5msdshdl3u1mwn79.jpg	1920	1080	8339
520	//images.igdb.com/igdb/image/upload/t_thumb/fa37suowqqlz2pzrbf8w.jpg	1920	1080	8339
521	//images.igdb.com/igdb/image/upload/t_thumb/sy6hnzkl8or91hs0o5x4.jpg	1920	1080	8339
522	//images.igdb.com/igdb/image/upload/t_thumb/qm8f6dzecfy6razlhubu.jpg	1920	1080	8339
523	//images.igdb.com/igdb/image/upload/t_thumb/fyyaiynxnn62kh42rjks.jpg	1920	1080	8339
524	//images.igdb.com/igdb/image/upload/t_thumb/byebjulq8ixqgkiwiafi.jpg	3840	2160	37066
525	//images.igdb.com/igdb/image/upload/t_thumb/ig4yjbra8hhg4qk4ncyz.jpg	3840	2160	37066
526	//images.igdb.com/igdb/image/upload/t_thumb/xviqwgygmvqvd7l3zxew.jpg	3840	2160	37066
527	//images.igdb.com/igdb/image/upload/t_thumb/qdvkxv6psmvqkdmkbt1i.jpg	3840	2160	37066
528	//images.igdb.com/igdb/image/upload/t_thumb/nyymzvqyzpq3b6dj51mx.jpg	3840	2160	37066
529	//images.igdb.com/igdb/image/upload/t_thumb/eposnvxfmcv6sg2ttw6x.jpg	745	419	29143
530	//images.igdb.com/igdb/image/upload/t_thumb/ofulbnm5akzafox58z4l.jpg	1920	1080	31561
531	//images.igdb.com/igdb/image/upload/t_thumb/ty7kephrlotlnoqqux0p.jpg	1920	1080	31561
532	//images.igdb.com/igdb/image/upload/t_thumb/grmxczjjxeoobduysa40.jpg	1920	1080	31561
533	//images.igdb.com/igdb/image/upload/t_thumb/wgdur0ihrii8ynb0svwe.jpg	1920	1080	31561
534	//images.igdb.com/igdb/image/upload/t_thumb/lmb2gnojswbh1hb9a0dd.jpg	1920	1080	31561
535	//images.igdb.com/igdb/image/upload/t_thumb/ndsfwcpghdnr2neyatbz.jpg	1920	1080	28414
536	//images.igdb.com/igdb/image/upload/t_thumb/b7o1yjxedzgxarpt86wd.jpg	1920	1080	28414
537	//images.igdb.com/igdb/image/upload/t_thumb/lq4hh7wo4t0oemugsy7r.jpg	1920	1080	28414
538	//images.igdb.com/igdb/image/upload/t_thumb/cdufu6yj9np4mqe8xiw6.jpg	1920	1080	28414
539	//images.igdb.com/igdb/image/upload/t_thumb/ylecl9k09s5ou1kwwuxc.jpg	1920	1080	28414
540	//images.igdb.com/igdb/image/upload/t_thumb/kmbewcsuuytnsxvemltw.jpg	1280	720	26758
541	//images.igdb.com/igdb/image/upload/t_thumb/q1ydkthtdtozqzw1tr2m.jpg	1280	720	26758
542	//images.igdb.com/igdb/image/upload/t_thumb/tcgnbkmz7f0tgglfol9m.jpg	1280	720	26758
543	//images.igdb.com/igdb/image/upload/t_thumb/kcapvog4g7ko1n21x57t.jpg	1280	720	26758
544	//images.igdb.com/igdb/image/upload/t_thumb/hj3spi7odlvp4pfvnwtv.jpg	1280	720	26758
545	//images.igdb.com/igdb/image/upload/t_thumb/qnrqwdwbokg6lb9ldmjf.jpg	1000	563	26769
546	//images.igdb.com/igdb/image/upload/t_thumb/v8mjfw2ww1kby7kksp7a.jpg	1000	563	26769
547	//images.igdb.com/igdb/image/upload/t_thumb/yi9yaulgd5ploailnifi.jpg	1000	563	26769
548	//images.igdb.com/igdb/image/upload/t_thumb/mu6vql3ujyg7ap0cbgmp.jpg	1000	563	26769
549	//images.igdb.com/igdb/image/upload/t_thumb/rbdzoq9pvxyyo4gsta1i.jpg	1000	563	26769
550	//images.igdb.com/igdb/image/upload/t_thumb/ygepetru87ka9nzqowr6.jpg	800	450	11198
551	//images.igdb.com/igdb/image/upload/t_thumb/w23nbjchdt6ulfxws9nt.jpg	800	450	11198
552	//images.igdb.com/igdb/image/upload/t_thumb/zbk8r9mm9bb56duk5tjp.jpg	800	450	11198
553	//images.igdb.com/igdb/image/upload/t_thumb/ipnuinh71ny8bcblibgq.jpg	1920	1080	11198
554	//images.igdb.com/igdb/image/upload/t_thumb/x2ebxdsn5kfjcnjbo7q2.jpg	1280	720	11198
555	//images.igdb.com/igdb/image/upload/t_thumb/u12g5izhtpobp3qbymdm.jpg	745	419	28445
556	//images.igdb.com/igdb/image/upload/t_thumb/qu7wkzuvr5zbjlx9m5sx.jpg	745	419	28445
557	//images.igdb.com/igdb/image/upload/t_thumb/uungswlm4gpzouez2izz.jpg	745	419	28445
558	//images.igdb.com/igdb/image/upload/t_thumb/j5hkfc91o8v88ppik2ev.jpg	745	419	28445
559	//images.igdb.com/igdb/image/upload/t_thumb/hycmoednbredagizmtmt.jpg	745	419	51998
560	//images.igdb.com/igdb/image/upload/t_thumb/fuvvulgufxjqfwvcnyby.jpg	745	419	51998
561	//images.igdb.com/igdb/image/upload/t_thumb/e5iibibn0tflbrbtevow.jpg	745	419	51998
562	//images.igdb.com/igdb/image/upload/t_thumb/xwsvongx5j005upegiyv.jpg	745	419	51998
563	//images.igdb.com/igdb/image/upload/t_thumb/dommaw1kgsnqhkde9smy.jpg	745	419	51998
564	//images.igdb.com/igdb/image/upload/t_thumb/qrge3x7umrgv0wjoto3l.jpg	1280	720	26503
565	//images.igdb.com/igdb/image/upload/t_thumb/i4z3jsxyccrhxpncwh0q.jpg	1280	720	26503
566	//images.igdb.com/igdb/image/upload/t_thumb/p5sqjrnxnnqpdnk4mvei.jpg	1920	1080	26503
567	//images.igdb.com/igdb/image/upload/t_thumb/s63tucfprxqruismxedl.jpg	1920	1080	26503
568	//images.igdb.com/igdb/image/upload/t_thumb/vb9ppbm98mxpytqdsjtt.jpg	1920	1080	26503
569	//images.igdb.com/igdb/image/upload/t_thumb/rl64122hfdz5b8ykkbkk.jpg	600	337	10910
570	//images.igdb.com/igdb/image/upload/t_thumb/qnx29b3grnh4ypzplrs9.jpg	1920	1080	10910
571	//images.igdb.com/igdb/image/upload/t_thumb/vwe3yzyo8niycoc7dzpr.jpg	1920	1080	10910
572	//images.igdb.com/igdb/image/upload/t_thumb/shaqhwcijucncoawomg2.jpg	1920	1080	10910
573	//images.igdb.com/igdb/image/upload/t_thumb/fkhi8y60ym7w2btm7wsn.jpg	1920	1080	10910
574	//images.igdb.com/igdb/image/upload/t_thumb/tamdu6hh7hsqinvtfshr.jpg	1280	720	51541
575	//images.igdb.com/igdb/image/upload/t_thumb/rcqsmgbkdcvy6fm5flyk.jpg	1280	720	28069
576	//images.igdb.com/igdb/image/upload/t_thumb/q6aj7bedzykasv1ubiht.jpg	1280	720	28069
577	//images.igdb.com/igdb/image/upload/t_thumb/d8t7cp3zkxzbuf4czod3.jpg	1280	720	28069
578	//images.igdb.com/igdb/image/upload/t_thumb/mkgtk1vqqd9xnbkclqdc.jpg	1280	720	28069
579	//images.igdb.com/igdb/image/upload/t_thumb/q1kq0zlmwhucylxmcip0.jpg	1280	720	28069
580	//images.igdb.com/igdb/image/upload/t_thumb/jk6vrwh3feh5iwkh8yfb.jpg	1920	1080	22783
581	//images.igdb.com/igdb/image/upload/t_thumb/mo6m6metq9ek0yacv19f.jpg	1920	1080	22783
582	//images.igdb.com/igdb/image/upload/t_thumb/ki5qauvwkhpizuveslwx.jpg	1920	1080	22783
583	//images.igdb.com/igdb/image/upload/t_thumb/mctwrizpr5z3ozodkzq4.jpg	1920	1080	22783
584	//images.igdb.com/igdb/image/upload/t_thumb/cfggdqgnpexcebwi3nbl.jpg	1920	1080	22783
585	//images.igdb.com/igdb/image/upload/t_thumb/x20cgliy4d7kaddjlok1.jpg	1280	720	15276
586	//images.igdb.com/igdb/image/upload/t_thumb/uctioy5f3kwfykjwwsar.jpg	1280	720	15276
587	//images.igdb.com/igdb/image/upload/t_thumb/dympozqqyuuhzfixrfhs.jpg	1280	720	15276
588	//images.igdb.com/igdb/image/upload/t_thumb/d4eqkhbi6eyve3cnvtdw.jpg	1280	720	15276
589	//images.igdb.com/igdb/image/upload/t_thumb/nclkoegajyktv64xmwsp.jpg	1280	720	15276
590	//images.igdb.com/igdb/image/upload/t_thumb/ab2ke4ar298b3yhrv0t5.jpg	1365	768	37137
591	//images.igdb.com/igdb/image/upload/t_thumb/ekqv7bk4e8sp9u04vnfr.jpg	1365	768	37137
592	//images.igdb.com/igdb/image/upload/t_thumb/ko4xlgoct8zklhxxfmoz.jpg	1365	768	37137
593	//images.igdb.com/igdb/image/upload/t_thumb/bly6zjqiwwrnrvkoczzh.jpg	1365	768	37137
594	//images.igdb.com/igdb/image/upload/t_thumb/amwet1o0eheaxan6kjr5.jpg	1365	768	37137
595	//images.igdb.com/igdb/image/upload/t_thumb/qjpzw8o3pznskacllpex.jpg	1920	1080	37135
596	//images.igdb.com/igdb/image/upload/t_thumb/q3hxjnaqzi5blscykkhu.jpg	1920	1080	37135
597	//images.igdb.com/igdb/image/upload/t_thumb/q4kz88xd1sdkmswecohl.jpg	1920	1080	37067
598	//images.igdb.com/igdb/image/upload/t_thumb/pcypilmnplgv2nh0bc3t.jpg	1920	1080	37067
599	//images.igdb.com/igdb/image/upload/t_thumb/ajntzlopshhjhd8qohf8.jpg	1920	1080	37067
600	//images.igdb.com/igdb/image/upload/t_thumb/tpnkzofmxw5wcmqgyftl.jpg	1920	1080	37067
601	//images.igdb.com/igdb/image/upload/t_thumb/lrcdqtmkpuyqxrfuhjzl.jpg	1920	1080	37067
602	//images.igdb.com/igdb/image/upload/t_thumb/u2f5axejtenu1nrkpzej.jpg	3840	2160	27666
603	//images.igdb.com/igdb/image/upload/t_thumb/sqxbyzv3mduogqdcrmcu.jpg	3840	2160	27666
604	//images.igdb.com/igdb/image/upload/t_thumb/mu9f0ft9smhz8xkleba8.jpg	3840	2160	27666
605	//images.igdb.com/igdb/image/upload/t_thumb/izrykljxsklxr1q3d53u.jpg	3840	2160	27666
606	//images.igdb.com/igdb/image/upload/t_thumb/nq003aoyreskvoxth59t.jpg	3840	2160	27666
607	//images.igdb.com/igdb/image/upload/t_thumb/ouwdur7oxljcckqzgrrl.jpg	1280	720	35626
608	//images.igdb.com/igdb/image/upload/t_thumb/y7yl9buwwm7ur4fmk38i.jpg	1280	720	35626
609	//images.igdb.com/igdb/image/upload/t_thumb/qyex9ymcyhua1efw1u84.jpg	1280	720	35626
610	//images.igdb.com/igdb/image/upload/t_thumb/ws9qu0xxbsx4b4zdpir3.jpg	1280	720	35626
611	//images.igdb.com/igdb/image/upload/t_thumb/ula0963zjd6f1rureosf.jpg	1280	720	35626
612	//images.igdb.com/igdb/image/upload/t_thumb/guhxsn89wa0tthsug6bi.jpg	1920	912	5605
613	//images.igdb.com/igdb/image/upload/t_thumb/jdmpavyvtdimxwnpram2.jpg	1920	912	5605
614	//images.igdb.com/igdb/image/upload/t_thumb/r5psy3bssf6qtz04btsx.jpg	1920	912	5605
615	//images.igdb.com/igdb/image/upload/t_thumb/qrotilqadcxrxujjpdfb.jpg	1920	912	5605
616	//images.igdb.com/igdb/image/upload/t_thumb/oa2tk7c3e5l37v9i3yxv.jpg	1920	912	5605
617	//images.igdb.com/igdb/image/upload/t_thumb/orcfbbmsscqy4mvuq7nm.jpg	1160	672	11078
618	//images.igdb.com/igdb/image/upload/t_thumb/mbvj1nvelpzhghf0nxyg.jpg	1160	672	11078
619	//images.igdb.com/igdb/image/upload/t_thumb/zwiz4xwfswvqoul2hml0.jpg	1160	672	11078
620	//images.igdb.com/igdb/image/upload/t_thumb/o0duy5ceojbnzww0bzpd.jpg	1160	672	11078
621	//images.igdb.com/igdb/image/upload/t_thumb/lpwzr8fhu7nddbk1qhbk.jpg	1160	672	11078
622	//images.igdb.com/igdb/image/upload/t_thumb/mjmvbqkkf2hwjwvreylo.jpg	1280	720	36597
623	//images.igdb.com/igdb/image/upload/t_thumb/rqmwxjhoiqvjzixfa38j.jpg	1280	720	36597
624	//images.igdb.com/igdb/image/upload/t_thumb/v2b1hxxvoohppgdetp7c.jpg	1280	720	36597
625	//images.igdb.com/igdb/image/upload/t_thumb/awoynsevmmpxjhz4dbax.jpg	1280	720	36597
626	//images.igdb.com/igdb/image/upload/t_thumb/etnk3ex6bara8eyv2hvc.jpg	1280	720	36597
627	//images.igdb.com/igdb/image/upload/t_thumb/uosru9afdea4hc5zooru.jpg	1920	1080	18734
628	//images.igdb.com/igdb/image/upload/t_thumb/kgiduzus6y32du0blbxw.jpg	1920	1080	18734
629	//images.igdb.com/igdb/image/upload/t_thumb/rxk8epfo0tlymktkl2ov.jpg	1366	768	18734
630	//images.igdb.com/igdb/image/upload/t_thumb/rqeludau9yrgsq5wb4kw.jpg	1366	768	18734
631	//images.igdb.com/igdb/image/upload/t_thumb/zoruu9m33yvuwtambity.jpg	1366	768	18734
632	//images.igdb.com/igdb/image/upload/t_thumb/bbv6mvi03oauekeknpha.jpg	1920	1080	21062
633	//images.igdb.com/igdb/image/upload/t_thumb/e8xlfiklewhjosqzrlx1.jpg	1920	1080	21062
634	//images.igdb.com/igdb/image/upload/t_thumb/iy88w4ap4k0uonfdf3rr.jpg	1920	1080	21062
635	//images.igdb.com/igdb/image/upload/t_thumb/b9rzjgkddlu22xcrgw1u.jpg	1920	1080	21062
636	//images.igdb.com/igdb/image/upload/t_thumb/kittnvfded0posqedrxo.jpg	848	480	21062
637	//images.igdb.com/igdb/image/upload/t_thumb/d9jngt0qavd2stilui7a.jpg	1920	1080	45026
638	//images.igdb.com/igdb/image/upload/t_thumb/lqxczpidkzgnai2ot5li.jpg	1920	1080	45026
639	//images.igdb.com/igdb/image/upload/t_thumb/xqmqmolhwgucgng1iwap.jpg	1920	1080	45026
640	//images.igdb.com/igdb/image/upload/t_thumb/m8ucb3vi8dvm3piti8sk.jpg	1920	1080	45026
641	//images.igdb.com/igdb/image/upload/t_thumb/qqi6lwepznl92gu4mdfv.jpg	1920	1080	45026
642	//images.igdb.com/igdb/image/upload/t_thumb/kvxqkhvihstogpo5sl9h.jpg	1920	1080	24474
643	//images.igdb.com/igdb/image/upload/t_thumb/hfp9gy2fkhahv6sp7mwr.jpg	1920	1080	24474
644	//images.igdb.com/igdb/image/upload/t_thumb/aiqbhucy3dnox1r3t2og.jpg	1920	1080	24474
645	//images.igdb.com/igdb/image/upload/t_thumb/w11uuhzr5qcpohdirbkp.jpg	1920	1080	24474
646	//images.igdb.com/igdb/image/upload/t_thumb/tqp50o5ofigesfarzsmv.jpg	1920	1080	24474
647	//images.igdb.com/igdb/image/upload/t_thumb/ojjxvfj1a0d9o1dbqneg.jpg	1280	720	13555
648	//images.igdb.com/igdb/image/upload/t_thumb/ookhxac32tqg2b8mhutx.jpg	1280	720	13555
649	//images.igdb.com/igdb/image/upload/t_thumb/krdgkmuqpplvnyqbbiue.jpg	1280	720	13555
650	//images.igdb.com/igdb/image/upload/t_thumb/bgvgywjzbjyzmfgomgjt.jpg	1280	720	13555
651	//images.igdb.com/igdb/image/upload/t_thumb/loeuidxbc0bdsqf9qhyb.jpg	640	360	13555
652	//images.igdb.com/igdb/image/upload/t_thumb/kzt8zpl4pqspuczcrbuk.jpg	1920	1080	12511
653	//images.igdb.com/igdb/image/upload/t_thumb/dkcc1ul1v2e3bymyikt7.jpg	1920	1200	12511
654	//images.igdb.com/igdb/image/upload/t_thumb/thp7uoo7rrb4gb4imygu.jpg	1919	1199	12511
655	//images.igdb.com/igdb/image/upload/t_thumb/c0nr3ah01r9cd9x8pgwn.jpg	1280	720	12511
656	//images.igdb.com/igdb/image/upload/t_thumb/kj9ei0e9ihink4ghjccz.jpg	1920	1080	12511
657	//images.igdb.com/igdb/image/upload/t_thumb/pgi7vligxcqf5eyjfbcu.jpg	1920	1080	28652
658	//images.igdb.com/igdb/image/upload/t_thumb/lszbx4buofgko6fi3j1t.jpg	1920	1080	28652
659	//images.igdb.com/igdb/image/upload/t_thumb/ixfetnuk03fxzmdtjzkw.jpg	1920	1080	28652
660	//images.igdb.com/igdb/image/upload/t_thumb/ngyx222ygvajhfp6borj.jpg	1920	1080	28652
661	//images.igdb.com/igdb/image/upload/t_thumb/wvbf6pabxleakqbevtek.jpg	1920	1080	28652
662	//images.igdb.com/igdb/image/upload/t_thumb/zugw2awquaxyrj3xtvqy.jpg	1277	715	28113
663	//images.igdb.com/igdb/image/upload/t_thumb/eaeh3yiy2l272lmbvs7p.jpg	1277	714	28113
664	//images.igdb.com/igdb/image/upload/t_thumb/gcemq1lstcqdoxcrrwih.jpg	1281	719	28113
665	//images.igdb.com/igdb/image/upload/t_thumb/hksj7kblqvpqiecjx86s.jpg	1277	718	28113
666	//images.igdb.com/igdb/image/upload/t_thumb/xqldoikzxoyobmng9k37.jpg	1278	715	28113
667	//images.igdb.com/igdb/image/upload/t_thumb/nvse7vo5xaj9sebyznzk.jpg	1920	1080	7621
668	//images.igdb.com/igdb/image/upload/t_thumb/tipud37lzjbduhjwohm0.jpg	1920	1080	7621
669	//images.igdb.com/igdb/image/upload/t_thumb/ctg89k33jnmq1w1otu5o.jpg	1920	1080	7621
670	//images.igdb.com/igdb/image/upload/t_thumb/codbgrllrflkpyvbblne.jpg	1920	1080	7621
671	//images.igdb.com/igdb/image/upload/t_thumb/e8zelktjjxxbuewpstad.jpg	1920	1080	7621
672	//images.igdb.com/igdb/image/upload/t_thumb/gjg8eemdsnedguqrczet.jpg	745	419	54529
673	//images.igdb.com/igdb/image/upload/t_thumb/pzgjn3pgu2efb6riougm.jpg	745	419	54529
674	//images.igdb.com/igdb/image/upload/t_thumb/zz5nw9b6vscgbturpzbj.jpg	745	419	54529
675	//images.igdb.com/igdb/image/upload/t_thumb/hbwps34uce6iodvwuvsh.jpg	745	419	54529
676	//images.igdb.com/igdb/image/upload/t_thumb/ohmxtjckhpbgmbjwknkj.jpg	745	419	54529
677	//images.igdb.com/igdb/image/upload/t_thumb/b8o1e56rsq5uslijbsxa.jpg	1920	1080	10960
678	//images.igdb.com/igdb/image/upload/t_thumb/m5sbus0qumos5ve2x5y0.jpg	1000	563	10960
679	//images.igdb.com/igdb/image/upload/t_thumb/qfuajveqchyq4ykptm7j.jpg	1000	563	10960
680	//images.igdb.com/igdb/image/upload/t_thumb/re60yrwm69zal21dkyxu.jpg	1280	720	10960
681	//images.igdb.com/igdb/image/upload/t_thumb/te8rduwlchpygyj6eqph.jpg	1000	563	10960
682	//images.igdb.com/igdb/image/upload/t_thumb/gjvtrjlvdncv3mebxrzd.jpg	1920	1080	23581
683	//images.igdb.com/igdb/image/upload/t_thumb/cewg3mkcegk9m5jckdoe.jpg	1920	1080	23581
684	//images.igdb.com/igdb/image/upload/t_thumb/gqbmzdabvhoaljk2gz5h.jpg	1920	1080	23581
685	//images.igdb.com/igdb/image/upload/t_thumb/iyvevrubq2au6lteins2.jpg	1920	1080	23581
686	//images.igdb.com/igdb/image/upload/t_thumb/jqiu9pjyha45qibkigwz.jpg	1920	1080	23581
687	//images.igdb.com/igdb/image/upload/t_thumb/jcfe7mssuvcolzchlrkt.jpg	1276	720	32856
688	//images.igdb.com/igdb/image/upload/t_thumb/jgp80qomvkzdyse98rdr.jpg	1276	720	32856
689	//images.igdb.com/igdb/image/upload/t_thumb/mh8qn46zq4ice6xlezuu.jpg	1276	720	32856
690	//images.igdb.com/igdb/image/upload/t_thumb/oect3vzoj4cue9n19fv8.jpg	1276	720	32856
691	//images.igdb.com/igdb/image/upload/t_thumb/odheowo0hycf1landadg.jpg	1276	720	32856
692	//images.igdb.com/igdb/image/upload/t_thumb/afpniqxnwemhoum7br3y.jpg	640	360	28244
693	//images.igdb.com/igdb/image/upload/t_thumb/fyicm3afyc0wzzsu1wbd.jpg	640	400	28244
694	//images.igdb.com/igdb/image/upload/t_thumb/adgn8glhyn94tqz2shoq.jpg	640	360	28244
695	//images.igdb.com/igdb/image/upload/t_thumb/ipchscmskog2trgivxrs.jpg	640	360	28244
696	//images.igdb.com/igdb/image/upload/t_thumb/hvpbjcdbp7b7tzrfqvji.jpg	1920	1080	27714
697	//images.igdb.com/igdb/image/upload/t_thumb/h8l2udj1qnlwnzooksem.jpg	1920	995	27714
698	//images.igdb.com/igdb/image/upload/t_thumb/rlvcfbe487pdii1cn7jh.jpg	1920	1080	27714
699	//images.igdb.com/igdb/image/upload/t_thumb/l71pr2e1ttpli6nnp7fw.jpg	1920	1080	27714
700	//images.igdb.com/igdb/image/upload/t_thumb/jcisalptfngmumdxex0d.jpg	1920	1001	27714
701	//images.igdb.com/igdb/image/upload/t_thumb/xzml5ykf7suman6rtnxh.jpg	1920	1080	11349
702	//images.igdb.com/igdb/image/upload/t_thumb/xpclptgo5qqtztbda15q.jpg	1920	1080	11349
703	//images.igdb.com/igdb/image/upload/t_thumb/xifjxnfpxr9wfixjxq2d.jpg	1920	1080	11349
704	//images.igdb.com/igdb/image/upload/t_thumb/saiyhwzxr0mgicrzr36a.jpg	1920	1080	11349
705	//images.igdb.com/igdb/image/upload/t_thumb/wsvqtbgbedey8hpby88e.jpg	1138	640	11349
706	//images.igdb.com/igdb/image/upload/t_thumb/pqrnnyguqkzniwvn5b8n.jpg	1280	640	6066
707	//images.igdb.com/igdb/image/upload/t_thumb/qjtpcqcuq1wfdrsm7qog.jpg	1280	640	6066
708	//images.igdb.com/igdb/image/upload/t_thumb/kbcvtibqynq6rpbiee4n.jpg	1280	717	6066
709	//images.igdb.com/igdb/image/upload/t_thumb/bumgwsmxzufwb3d2p1ff.jpg	1280	640	6066
710	//images.igdb.com/igdb/image/upload/t_thumb/dd7euq9hncdrwt2pblza.jpg	1280	640	6066
711	//images.igdb.com/igdb/image/upload/t_thumb/xwigecgusfxyp1tmakmb.jpg	1920	1080	8652
712	//images.igdb.com/igdb/image/upload/t_thumb/ss0nqs4ykcraewzk7a12.jpg	1920	1080	8652
713	//images.igdb.com/igdb/image/upload/t_thumb/rx4bus2lda44fb3c2rrl.jpg	1920	1080	8652
714	//images.igdb.com/igdb/image/upload/t_thumb/uonrmwcctfs8pimbkbey.jpg	1920	1080	8652
715	//images.igdb.com/igdb/image/upload/t_thumb/ym91qnklxxx1kzxdk1nv.jpg	1920	1080	8652
716	//images.igdb.com/igdb/image/upload/t_thumb/wltmsftj98il2yn26ns9.jpg	1920	1080	27419
717	//images.igdb.com/igdb/image/upload/t_thumb/kfq369uzhgbkduqen9i1.jpg	1920	1080	27419
718	//images.igdb.com/igdb/image/upload/t_thumb/sqvlefrtqh3yze8hco1u.jpg	1920	1080	27419
719	//images.igdb.com/igdb/image/upload/t_thumb/sh35nqjuaqjunrnixngi.jpg	1920	1080	27419
720	//images.igdb.com/igdb/image/upload/t_thumb/cdvpmmqljnj6gcelyf9c.jpg	1920	1080	27419
721	//images.igdb.com/igdb/image/upload/t_thumb/owgbtoqctryfkcjqibc2.jpg	1920	1080	9732
722	//images.igdb.com/igdb/image/upload/t_thumb/pw8yows1pa9s2wrxhj2f.jpg	1920	1080	9732
723	//images.igdb.com/igdb/image/upload/t_thumb/pl9yfxw2gb6xqr28ze3l.jpg	1920	1080	9732
724	//images.igdb.com/igdb/image/upload/t_thumb/feeg0iywe2g64cs5dbhc.jpg	1920	1080	9732
725	//images.igdb.com/igdb/image/upload/t_thumb/kdofv91jcumr89hgbnfn.jpg	1920	1080	9732
726	//images.igdb.com/igdb/image/upload/t_thumb/y8djofabxrwxbzuvgngm.jpg	670	377	16992
727	//images.igdb.com/igdb/image/upload/t_thumb/bh2lvyq5rbsba1wdgnjc.jpg	1920	1080	16992
728	//images.igdb.com/igdb/image/upload/t_thumb/eohsidatfx8wyw5ltzt6.jpg	2560	1440	16992
729	//images.igdb.com/igdb/image/upload/t_thumb/y5eue742z26hdocnd5gk.jpg	2560	1440	16992
730	//images.igdb.com/igdb/image/upload/t_thumb/n9cqwrkkiktp5o7gggtj.jpg	2560	1440	16992
731	//images.igdb.com/igdb/image/upload/t_thumb/jjrnirs33uncqdgnrpni.jpg	1280	720	25795
732	//images.igdb.com/igdb/image/upload/t_thumb/xctzpgsgxb5todxsfgtu.jpg	1920	1080	25795
733	//images.igdb.com/igdb/image/upload/t_thumb/lhnsvgjqtspumd8feb9i.jpg	1920	1080	25795
734	//images.igdb.com/igdb/image/upload/t_thumb/ifbsav60wex0yvdvu2cy.jpg	1268	584	16693
735	//images.igdb.com/igdb/image/upload/t_thumb/y1jnj1xokh9kwaupjdgi.jpg	1274	588	16693
736	//images.igdb.com/igdb/image/upload/t_thumb/ey0emj6gjj8lphcxydqz.jpg	1266	594	16693
737	//images.igdb.com/igdb/image/upload/t_thumb/lq6ttm5grvqfuq8xpn7u.jpg	1270	588	16693
738	//images.igdb.com/igdb/image/upload/t_thumb/jc7rx3aret4xnwj3xzxb.jpg	600	281	16693
739	//images.igdb.com/igdb/image/upload/t_thumb/eo9lnyfhmnontmk6tehy.jpg	1920	1080	42932
740	//images.igdb.com/igdb/image/upload/t_thumb/j5eaq7m3nyqle6pumice.jpg	1920	1079	23352
741	//images.igdb.com/igdb/image/upload/t_thumb/gh58s2ea2bidf19axfls.jpg	1919	1080	23352
742	//images.igdb.com/igdb/image/upload/t_thumb/lfrmn2q58bozobugckjk.jpg	1920	1079	23352
743	//images.igdb.com/igdb/image/upload/t_thumb/p1ykklua2qm182fu7jml.jpg	1919	1080	23352
744	//images.igdb.com/igdb/image/upload/t_thumb/gsox3nwenctj625t1lp0.jpg	1919	1080	23352
745	//images.igdb.com/igdb/image/upload/t_thumb/ohrymrkakouivce2e44t.jpg	400	224	54724
746	//images.igdb.com/igdb/image/upload/t_thumb/xq0ilfhhrvj0ztsyw12o.jpg	400	224	54724
747	//images.igdb.com/igdb/image/upload/t_thumb/d4u6orrubjsgjskviw0l.jpg	400	224	54724
748	//images.igdb.com/igdb/image/upload/t_thumb/xorjlzc21l308kmtk8pm.jpg	400	224	54724
749	//images.igdb.com/igdb/image/upload/t_thumb/jbxrv2hveat7udgx3mr3.jpg	400	224	54724
\.


--
-- Name: screenshots_screenshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('screenshots_screenshot_id_seq', 749, true);


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY systems (system_id, name) FROM stdin;
130	Nintendo Switch
48	PlayStation 4
49	Xbox One
37	Nintendo 3DS
46	PlayStation Vita
41	Wii U
5	Wii
47	Virtual Console (Nintendo)
56	WiiWare
4	Nintendo 64
21	Nintendo GameCube
19	Super Nintendo Entertainment System (SNES)
18	Nintendo Entertainment System (NES)
58	Super Famicom
20	Nintendo DS
22	Game Boy Color
33	Game Boy
24	Game Boy
87	Virtual Boy
7	PlayStation
8	PlayStation 2
9	PlayStation 3
38	PlayStation Portable
45	PlayStation Network
11	Xbox
12	Xbox 360
36	Xbox Live Arcade
92	SteamOS
14	Mac
6	PC (Microsoft Windows)
13	PC DOS
64	Sega Master System
29	Sega Mega Drive/Genesis
35	Sega Game Gear
32	Sega Saturn
23	Dreamcast
34	Android
39	iOS
86	TurboGrafx-16/PC Engine
51	Family Computer Disk System
15	Commodore C64/128
16	Amiga
79	Neo Geo MVS
80	Neo Geo AES
119	Neo Geo Pocket
120	Neo Geo Pocket Color
135	Hyper Neo Geo 64
136	Neo Geo CD
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, username, email, password, account_created) FROM stdin;
1	tlehrian0	hashwin0@t-online.de	vz6vSU2Ltze	2017-07-31 10:01:32
2	tfarrar1	hsutherel1@ameblo.jp	ZOtZw96pqRAs	2017-06-16 15:21:12
3	iyakovlev2	bbezemer2@linkedin.com	SDlCRrPVi6MR	2016-10-02 09:45:04
4	qderobert3	rtruckell3@plala.or.jp	tUvrP74	2017-07-07 07:55:06
5	dcossell4	borro4@bandcamp.com	Iz0BuojOY	2017-06-22 01:35:37
6	rdicty5	krijkeseis5@sina.com.cn	S2fwWmMc0Qg	2017-02-08 20:28:15
7	llusted6	mgalbraith6@t-online.de	d4naUJFCpx	2016-12-07 09:29:41
8	wgillis7	krobertson7@digg.com	In6oNhJwrn0M	2016-12-22 10:35:51
9	sbarke8	bmccourt8@nasa.gov	7rNVDOvvRPQ	2017-02-02 17:45:58
10	kpoulson9	tmcdermid9@scientificamerican.com	nn2a4wWgO	2017-06-01 07:00:36
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 11, true);


--
-- Data for Name: usersystems; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY usersystems (usersystem_id, user_id, system_id) FROM stdin;
1	1	130
2	1	48
3	1	49
4	1	37
5	1	46
6	1	41
7	1	5
8	1	47
9	1	56
10	1	4
11	1	21
12	1	19
13	1	18
14	1	58
15	1	20
16	1	22
17	1	33
18	1	24
19	1	87
20	1	7
21	1	8
22	1	9
23	1	38
24	1	45
25	1	11
26	1	12
27	1	36
28	1	92
29	1	14
30	1	6
31	1	13
32	1	64
33	1	29
34	1	35
35	1	32
36	1	23
37	1	34
38	1	39
39	1	86
40	1	51
41	1	15
42	1	16
43	1	79
44	1	80
45	1	119
46	1	120
47	1	135
48	1	136
49	2	130
50	2	48
51	2	49
52	2	37
53	2	46
54	2	41
55	2	5
56	2	47
57	2	56
58	2	4
59	2	21
60	2	19
61	2	18
62	2	58
63	2	20
64	2	22
65	2	33
66	2	24
67	2	87
68	2	7
69	2	8
70	2	9
71	2	38
72	2	45
73	2	11
74	2	12
75	2	36
76	2	92
77	2	14
78	2	6
79	2	13
80	2	64
81	2	29
82	2	35
83	2	32
84	2	23
85	2	34
86	2	39
87	2	86
88	2	51
89	2	15
90	2	16
91	2	79
92	2	80
93	2	119
94	2	120
95	2	135
96	2	136
97	3	130
98	3	48
99	3	49
100	3	37
101	3	46
102	3	41
103	3	5
104	3	47
105	3	56
106	3	4
107	3	21
108	3	19
109	3	18
110	3	58
111	3	20
112	3	22
113	3	33
114	3	24
115	3	87
116	3	7
117	3	8
118	3	9
119	3	38
120	3	45
121	3	11
122	3	12
123	3	36
124	3	92
125	3	14
126	3	6
127	3	13
128	3	64
129	3	29
130	3	35
131	3	32
132	3	23
133	3	34
134	3	39
135	3	86
136	3	51
137	3	15
138	3	16
139	3	79
140	3	80
141	3	119
142	3	120
143	3	135
144	3	136
145	4	130
146	4	48
147	4	49
148	4	37
149	4	46
150	4	41
151	4	5
152	4	47
153	4	56
154	4	4
155	4	21
156	4	19
157	4	18
158	4	58
159	4	20
160	4	22
161	4	33
162	4	24
163	4	87
164	4	7
165	4	8
166	4	9
167	4	38
168	4	45
169	4	11
170	4	12
171	4	36
172	4	92
173	4	14
174	4	6
175	4	13
176	4	64
177	4	29
178	4	35
179	4	32
180	4	23
181	4	34
182	4	39
183	4	86
184	4	51
185	4	15
186	4	16
187	4	79
188	4	80
189	4	119
190	4	120
191	4	135
192	4	136
193	5	130
194	5	48
195	5	49
196	5	37
197	5	46
198	5	41
199	5	5
200	5	47
201	5	56
202	5	4
203	5	21
204	5	19
205	5	18
206	5	58
207	5	20
208	5	22
209	5	33
210	5	24
211	5	87
212	5	7
213	5	8
214	5	9
215	5	38
216	5	45
217	5	11
218	5	12
219	5	36
220	5	92
221	5	14
222	5	6
223	5	13
224	5	64
225	5	29
226	5	35
227	5	32
228	5	23
229	5	34
230	5	39
231	5	86
232	5	51
233	5	15
234	5	16
235	5	79
236	5	80
237	5	119
238	5	120
239	5	135
240	5	136
241	6	130
242	6	48
243	6	49
244	6	37
245	6	46
246	6	41
247	6	5
248	6	47
249	6	56
250	6	4
251	6	21
252	6	19
253	6	18
254	6	58
255	6	20
256	6	22
257	6	33
258	6	24
259	6	87
260	6	7
261	6	8
262	6	9
263	6	38
264	6	45
265	6	11
266	6	12
267	6	36
268	6	92
269	6	14
270	6	6
271	6	13
272	6	64
273	6	29
274	6	35
275	6	32
276	6	23
277	6	34
278	6	39
279	6	86
280	6	51
281	6	15
282	6	16
283	6	79
284	6	80
285	6	119
286	6	120
287	6	135
288	6	136
289	7	130
290	7	48
291	7	49
292	7	37
293	7	46
294	7	41
295	7	5
296	7	47
297	7	56
298	7	4
299	7	21
300	7	19
301	7	18
302	7	58
303	7	20
304	7	22
305	7	33
306	7	24
307	7	87
308	7	7
309	7	8
310	7	9
311	7	38
312	7	45
313	7	11
314	7	12
315	7	36
316	7	92
317	7	14
318	7	6
319	7	13
320	7	64
321	7	29
322	7	35
323	7	32
324	7	23
325	7	34
326	7	39
327	7	86
328	7	51
329	7	15
330	7	16
331	7	79
332	7	80
333	7	119
334	7	120
335	7	135
336	7	136
337	8	130
338	8	48
339	8	49
340	8	37
341	8	46
342	8	41
343	8	5
344	8	47
345	8	56
346	8	4
347	8	21
348	8	19
349	8	18
350	8	58
351	8	20
352	8	22
353	8	33
354	8	24
355	8	87
356	8	7
357	8	8
358	8	9
359	8	38
360	8	45
361	8	11
362	8	12
363	8	36
364	8	92
365	8	14
366	8	6
367	8	13
368	8	64
369	8	29
370	8	35
371	8	32
372	8	23
373	8	34
374	8	39
375	8	86
376	8	51
377	8	15
378	8	16
379	8	79
380	8	80
381	8	119
382	8	120
383	8	135
384	8	136
385	9	130
386	9	48
387	9	49
388	9	37
389	9	46
390	9	41
391	9	5
392	9	47
393	9	56
394	9	4
395	9	21
396	9	19
397	9	18
398	9	58
399	9	20
400	9	22
401	9	33
402	9	24
403	9	87
404	9	7
405	9	8
406	9	9
407	9	38
408	9	45
409	9	11
410	9	12
411	9	36
412	9	92
413	9	14
414	9	6
415	9	13
416	9	64
417	9	29
418	9	35
419	9	32
420	9	23
421	9	34
422	9	39
423	9	86
424	9	51
425	9	15
426	9	16
427	9	79
428	9	80
429	9	119
430	9	120
431	9	135
432	9	136
433	10	130
434	10	48
435	10	49
436	10	37
437	10	46
438	10	41
439	10	5
440	10	47
441	10	56
442	10	4
443	10	21
444	10	19
445	10	18
446	10	58
447	10	20
448	10	22
449	10	33
450	10	24
451	10	87
452	10	7
453	10	8
454	10	9
455	10	38
456	10	45
457	10	11
458	10	12
459	10	36
460	10	92
461	10	14
462	10	6
463	10	13
464	10	64
465	10	29
466	10	35
467	10	32
468	10	23
469	10	34
470	10	39
471	10	86
472	10	51
473	10	15
474	10	16
475	10	79
476	10	80
477	10	119
478	10	120
479	10	135
480	10	136
\.


--
-- Name: usersystems_usersystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('usersystems_usersystem_id_seq', 480, true);


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY videos (video_id, game_id, video_url, video_name) FROM stdin;
1	10232	swSjr7tD8Ww	Trailer
2	10232	oGAEaRYM5EQ	Trailer
3	10232	HnjqcITQ6wY	Trailer
4	885	ziWj-isMHLA	Trailer
5	19175	BY6gbct0n9s	Trailer
6	36846	KJ71Wz90zt4	Trailer
7	27081	GbK_Xw5BiSw	Interview
8	27081	z_7Gz_RFLnE	E3 2017 Gameplay Trailer
9	27081	l1FJfr_spJQ	Trailer
10	21063	sOI1Y54akRA	Villains E3 2017 Trailer
11	21063	mR57-iNK2og	Custom Character Trailer
12	21063	FzeWMKDGSAA	Debut Trailer
13	21063	xgJyVUyogyk	Modern Sonic Gameplay Trailer
14	11667	1pY5lVpi4U0	Trailer
15	11667	FBaE0mNexTs	Gameplay video
16	11667	WCMRiZx78Jk	Gameplay video
17	11667	KdHYS2OWYW0	Trailer
18	17000	ot7uXNQskhs	Trailer
19	7346	Z6BeAtdoELY	Trailer
20	7346	1rPxiXXxftE	Trailer
21	7346	vDFZIUdo764	Trailer
22	7346	zw47_q9wbBE	Trailer
23	26764	5xUDkHudgbg	Trailer
24	26764	ZKB9FEXhJ68	Trailer
25	26764	tKlRN2YpxRE	Trailer
26	19550	aMC1yYM07ZU	Trailer
27	19550	HNI2qsi6MYE	Just Dance World Cup Trailer
28	19550	C2MoVVFAcr0	Gamescom 2016 Trailer
29	19550	mJ3WtHUKW9U	Launch Trailer
30	19554	g7AlytslvXg	Winterfest Launch Trailer
31	19554	A6YCLeYAyW0	Winter Fest Trailer
32	19554	ctJo1tK9prw	Alaska Trailer
33	19554	OFdJ9qC0QSw	E3 2016 Announcement Trailer
34	19554	5N-eqfqOZbQ	E3 2016 Walkthrough Trailer
35	19554	_BhA1CQsBCE	Open Beta Trailer
36	19554	LZj9L2rllSw	101 Trailer
37	19554	kjSfVN65kdM	Gamescon 2016 Trailer
38	19554	iVEV6PJ5zOA	Ride It Like Louie Vito Trailer
39	19554	97mkXmD3gls	Ride It Like Luke Aikins Trailer
40	19554	3d5CFirwDsU	Launch Trailer
41	26765	97vYf9t3GU8	Trailer
42	26766	Xjpao-nD5YU	Trailer
43	13197	ioGON3iLIJ4	Retail Trailer
44	13197	rhccQAh87IQ	Trailer
45	13197	mr_BQyO6MbI	Trailer
46	13197	MYJCTnjS4u4	Trailer
47	26771	RCzaHm13rFs	Trailer
48	26775	ut9ekAp2drs	Teaser
49	24703	HW1nbjSiQh0	Trailer
50	19457	lTjRZ__-278	Trailer
51	13163	7ARBGvh5cuw	Launch Trailer
52	13163	1neDM19GH04	Trailer
53	13163	bLlb5IYfZsY	Trailer
54	13163	gLkv99F2I0c	Trailer
55	13163	SinSiG8irHM	The Story Continues Dev Diary
56	25599	wQ6DYSf5VNE	Trailer
57	26761	ylBYfndq8fU	Launch Trailer
58	26761	VwD3ggRA4Fc	Gameplay video
59	26761	ufS1Gf9nZVk	Trailer
60	26761	qN4w5D2tzME	Trailer
61	8618	Nr7Bsy3nlg4	Trailer
62	8618	LdvyEUulNwg	Trailer
63	26872	hsl_kOMToZc	Teaser
64	8617	UJUHdANllZs	Trailer
65	26300	3FNy2c1AT0o	Teaser
66	26300	ExCavQVzNrc	Trailer
67	14298	9qcvVr1Z4x8	Trailer
68	18861	5Aeigc_bjFA	Teaser
69	18861	4txT2EicrHE	Trailer
70	27037	4M25MsNUKf0	Trailer
71	6866	7zes476D3lA	Trailer
72	6866	_aTHyxFtdxo	Trailer
73	26364	zCMQT9s2qBA	Trailer
74	14593	UAO2urG23S4	Trailer
75	14593	Y2amTl5lBYM	Trailer
76	14593	BzvlMtvaJ8I	Gameplay video
77	14593	0GXyV9EvB_g	Trailer
78	14593	U8lbFP8i730	Trailer
79	19220	kW9uDgo7nlA	Launch Trailer
80	19220	j_6dqzDvxNY	Trailer
81	19220	PKPeXlbws80	Gameplay video
82	19220	Z8Dc17qqrQs	Gameplay video
83	19220	Im0I_Vmc7nA	Trailer
84	19220	q2YRn8Q3fug	Teaser
85	19220	G4SEbhaGYLI	Gameplay video
86	18158	4KBUHwBx5i4	Trailer
87	26768	vDT8iTFPLeg	Game intro
88	26768	4YQ7iXz_xxs	Trailer
89	36794	ue-CBOrLnb0	Trailer
90	19278	teszHuRI_Go	Teaser
91	19278	6CiOK0Zir0I	Trailer
92	19278	-Pzx86-4GvI	Trailer
93	27367	TqzpKIplOog	Trailer
94	27376	4sqt4uY-xWU	Teaser
95	2177	OWMejUP75FE	Vehicles Trailer
96	2177	REh3m3qbza0	Hero Trailer
97	2177	VW3F1UGmrYw	Trailer
98	2177	Qbg3nF9nExE	Announcement Trailer
99	27407	qzHb0VWij_o	Trailer
100	27407	1f_l5-tUrO4	Teaser
101	17069	wQyPIHAOd98	Trailer
102	17069	DRYcWhhKVLc	Trailer
103	17069	VneN_eKTo_c	Trailer
104	27397	5OhOUAMmiLY	Trailer
105	27397	cInSMLRcvKo	Gameplay video
106	27397	Bh6gQyJHbxI	Teaser
107	27433	eoBtT4djX-k	Trailer
108	27434	ox9JnK-PJlo	Trailer
109	27435	6GIrAeNRupI	Trailer
110	27435	XQLY9YRtOqU	Trailer
111	27436	9ErDe2rCcW8	Trailer
112	27438	xJ1dkjA440U	Trailer
113	26363	JUMaL4kN3pA	Launch Trailer
114	27441	62nqJxq3E-4	Trailer
115	27443	zIuiCGzLS5Q	Trailer
116	23689	StKZvUC5uw8	Teaser
117	11247	DGm7LrocVuA	Trailer
118	9567	dG_vhHWwFSk	Trailer
119	20392	Liq_ASQHEB4	Trailer
120	20392	dxjxK6yBN0Q	Teaser
121	20392	N2jf9xD5OqI	Teaser
122	27378	_35a8GkQono	Trailer
123	11598	2TZm0wwEqIc	Trailer
124	11598	89cBMA4B9rA	Trailer
125	25653	RlaAvzEryC8	Trailer
126	25653	NMTwhVPqr2k	Trailer
127	27447	2QnCuX0Mg0Q	Trailer
128	27447	sMfwjGhyeHw	Trailer
129	25658	4rGggf7Lh6c	Trailer
130	27526	Jj6Yr6bbjq4	Trailer
131	11122	_94A3LPZ8s4	Trailer
132	11122	laMURYkJO1s	Teaser
133	27527	MBmZIIk9VQQ	Trailer
134	27529	Xuy9ujYvvhM	Trailer
135	1879	w7uOhFTrrq0	Trailer
136	1879	E0scnF8pXfU	Trailer
137	27532	NEkF1JmCVrs	Trailer
138	40968	Z6VcgTaKgv8	Trailer
139	27519	pKnkYPPkdN4	Teaser
140	24440	u5ESEoYLS8o	Trailer
141	26760	O2dpxLv-Ft0	Trailer
142	26762	k9itvWmzN-k	Trailer
143	26762	4GpC5PZnSiw	Trailer
144	26762	j7p47TOmicQ	Trailer
145	27534	rKGTDgfN80k	Trailer
146	27534	o7emdQlmcVI	Trailer
147	26774	HSp-4OYElS0	Trailer
148	19576	-hacQxjjr1o	E3 2016 Trailer
149	19576	g_lmAcWPPO8	Trailer
150	19576	7nA3wiJvPyo	Trailer
151	19576	t8irXyQ6rao	Trailer
152	19576	5DwaKg5Ezoc	Trailer
153	19576	ZVh8WuNlFdE	Trailer
154	23910	BRwP0P5j05g	Trailer
155	26816	U8x8hEGSgXU	Trailer
156	9484	LmT1N07oO7Q	Trailer
157	11070	0sOJzw1QTfQ	Launch Trailer
158	11070	hQFkgF8Xrak	Date Announcment Trailer
159	11070	Kp5wMpoqomE	Gameplay Trailer 2
160	11070	YBQMrCdCCYY	Hide and Seek Gameplay Trailer
161	11070	ss9BrKEynKo	Trailer
162	11070	qxFz92lNWqg	Trailer
163	14694	7GhdrJdabpk	Trailer
164	14694	jNmYyb7dCdQ	Trailer
165	10760	kTVYb6xeUcU	Trailer
166	10760	6VKfthxb4t8	Gameplay video
167	26833	qYQTOcEHuu0	Gameplay video
168	26833	5B_17raIJ5M	Trailer
169	18975	YJxpQ8KGRa8	Trailer
170	18975	u5jsVMWA0sM	Trailer
171	12875	0iKxPmbvO3Q	Trailer
172	978	5LDqLEv83Eg	Console Announcement Trailer
173	978	A5QTLtLr844	Resident Evil: Revelations - E3 Trailer (3DS)
174	25636	XLtGAEAiSog	Teaser
175	41825	e93CP5QWNaA	Trailer
176	41893	3UZNdNApnqE	Gameplay video
177	41893	B2D5tD9j5wQ	Trailer
178	41893	dNXpteQKueg	Game intro
179	41812	wvrNZoFCbes	Trailer
180	41829	h1GakpHZFpg	Trailer
181	27916	60tMD5TDQog	Trailer
182	14545	428R_oEjGGI	Trailer
183	942	BzQuTsIKd14	Trailer
184	942	uiCm88Me_3U	Trailer
185	1363	-0TniR3Ghxc	Trailer
186	1363	En8cIVlj2Jc	Trailer
187	26226	I2sxnLe_yTk	Trailer
188	26226	7XKSMt7NW6Q	Gameplay video
189	19799	zAG5qv0PTPE	Trailer
190	19799	e8aRBWO98ME	Gameplay video
191	19799	BJ1ZW5E92qI	Trailer
192	19799	9uN08G9JYDw	Trailer
193	19799	s6ZOw4FGbas	Trailer
194	20123	gBfyfCZwmPk	Announcement Trailer
195	27505	VdE9Km28Rkw	Trailer
196	27505	TIkkicLVgsQ	Trailer
197	27505	ZesfpzArnFs	Teaser
198	26009	oKL_oOZEwW8	Trailer
199	44101	qisOEiT1xGo	Trailer
200	28075	oSmEYtaORaA	Trailer
201	28075	FTGbTKGPYB4	Trailer
202	44078	eIPPG-5lItw	Teaser
203	44078	UK2V58aeexg	Trailer
204	43363	yzPcJovopcQ	Trailer
205	36534	3k-PKdfIAzg	Trailer
206	36534	EnUihngqHkE	Trailer
207	10031	ZycYt8stLUQ	Launch Trailer
208	10031	ac1oZU0nJuc	Trailer
209	10031	4VK2eCZYvlY	Trailer
210	10031	jpCwSE5sANU	Trailer
211	10031	cNt1Kk5Ij-Y	Trailer
212	10031	oqmF8IgxtJ0	Trailer
213	10031	3TZo5Gnxog8	Trailer
214	10031	u5BqQXuzAAQ	Trailer
215	28067	vDR6z73gLZc	Trailer
216	28067	TzPnKOuE3F0	Trailer
217	19729	wtWt3CZM7vM	Launch Trailer
218	19729	PslLAK67vSM	Trailer
219	19729	Q5hh3MJ4FHU	Announcement Trailer
220	26763	cNdQLneWp5M	Launch Trailer
221	26763	SeiWtEmdKuA	Story trailer
222	26763	XPBqgDFgMEU	Trailer
223	26857	iTgRll32M3I	Launch Trailer
224	26857	krbu3tiS36E	Gameplay video
225	26857	VCiMciOjDC0	Trailer
226	26759	GJ4nDA2JoZ4	Gameplay video
227	26759	k7s3UB_8dFM	Trailer
228	28129	zs_qbf4Nnzw	Trailer
229	28015	N-AD92OwByU	Trailer
230	13681	O2Rn3QFx5Kg	Gameplay video
231	26773	k_1D5By-R98	Trailer
232	19452	1wyoy4GTCzU	Launch Trailer
233	19452	97IGf6gGF5w	Wonder Boy and Wonder Girl Trailer
234	19452	APQwJHG6bWo	Retro Feature Trailer
235	19452	G4Be-3Fy34A	Reveal Trailer
236	28174	uvSXm1U6nY8	Trailer
237	14393	fEOI2DMfZb0	Launch Trailer
238	28412	Rzr5Y3kms_E	Trailer
239	28409	qyXsMYPMji8	Trailer
240	28416	HwSeTKT2DU8	Trailer
241	28418	iKZWVvWDH7w	Trailer
242	2058	O90W_yKFqsc	Trailer
243	2058	f8ZMDfO88Xs	Teaser
244	2058	Hmp1da7pXTw	Trailer
245	2058	AsEigjyLKHo	Trailer
246	2058	4uaPImEg13s	Trailer
247	28081	ARNp7e_fqs4	Trailer
248	28081	3jPmY3Zk-80	Launch Trailer
249	28081	-J46iUJ5HWs	Reveal Trailer
250	26870	npt80bWJmlQ	Trailer
251	28451	0eHVufeRcXo	Trailer
252	28452	Mlfh7X1GJCY	Trailer
253	26818	W4fE_k5jkNM	Trailer
254	19082	B_ULE7TezoE	Trailer
255	27051	dFiqGe76bGc	Launch Trailer
256	27051	hEJ3UhQ9c7w	Trailer
257	27051	V81yxHY81mA	Teaser
258	121	FaMTedT6P0I	Trailer
259	121	Ad8IJGkFxuw	Teaser
260	19449	DGh53Ar4OcM	Announcement Trailer
261	19449	_CVdjnzVoSc	Japan Expo Trailer
262	19449	ArPUlyb2fgA	Launch Trailer
263	19449	BNYqqztGhKM	Gamescom 2016 Trailer
264	16932	2PSnXkMcnSA	Trailer
265	19002	VA3saHRW3H8	Trailer
266	51407	WM6951MISJE	Trailer
267	51407	PVhuuAmMnM4	Gameplay video
268	51409	X-iV8_r3IiI	Trailer
269	51408	GLbgcfOdDWM	Teaser
270	28815	iwfiMEZT0ng	Kang Trailer
271	28815	BvYFUn-52fM	E3 2017 Game Demo
272	28815	8Zt43Cj1_ao	Teaser
273	26772	UCC6zNeTfHc	Trailer
274	37078	7ip8OKptfB8	E3 2017 Trailer
275	51518	3nWPOhAaJmc	Trailer
276	8339	Hk4SPRcXXJk	Trailer
277	8339	_XPMzUfOPDE	New Episodes Trailer
278	8339	3q8SGrRhLZA	Episode 6 Launch Trailer
279	37066	iW1WbL_hL1Y	E3 2017 Trailer
280	29143	cLaLNSCxeRI	Trailer
281	29529	jFFtTK_5Svc	Trailer
282	29529	5Q1u70v0_lI	Trailer
283	31561	tsWeJolqTRA	Trailer
284	31561	y3BqsvBHyZg	Trailer
285	52190	l33IYMlyOOA	Trailer
286	52190	NIOYcD7hkgs	Combat Vignette Trailer
287	52191	3XJAP_Uzhwg	Gameplay video
288	52191	1QKB5vnFDXs	Gameplay video
289	28414	Tx8E_c2o87M	Trailer
290	28414	FO4gLLvrJAI	E3 2017 Trailer
291	28414	J__TA1aMUMA	E3 2017 Developer Diary
292	28414	SEn3MZHWOtU	Gameplay video
293	26758	f8cyFpns0IE	Gameplay video
294	26758	_GQGUGe7kDU	Gameplay video
295	26758	wGQHQc_3ycE	Trailer
296	26758	5kcdRBHM7kM	Trailer
297	26769	O8KQp71d5OU	E3 2017 Demonstration video
298	26769	R8Ia_PCKPpY	Trailer
299	30206	Hh5sKE17L3w	Gameplay video
300	30206	IKvDypy1Mrw	Trailer
301	30206	gpFXydY1K8k	Trailer
302	11198	o5YyUA525tI	Trailer
303	11198	r4iT0yZEwk8	Trailer
304	11198	kmZn0NIMVg8	Trailer
305	11198	7iz-dQifR7Q	Trailer
306	28445	9_SGpY47Hwg	Trailer
307	26503	Jd4qSm-nZn8	Trailer
308	26503	BwlDejG4cpU	Story Trailer
309	10910	GDeuc_LKTzg	Console Launch Trailer
310	10910	QaHvIyrzN_M	Trailer
311	10910	0x7TpL1V3bA	Console Announcement Trailer
312	28069	KnNU_FJOmN4	Teaser
313	28069	ideT7StQmGE	Trailer
314	28069	-kHf02eAvn4	Trailer
315	22783	qeMEWBFb24k	Full House Edition Trailer
316	22783	WiZcrIC4XM4	Launch Trailer
317	22783	Q_EC2gBb29c	Willow Blue Trailer
318	22783	fSCoQbA_d8k	Dev Diary 1
319	22783	58e-pgOa4Ek	Dev Diary 2
320	22783	JoLd74WByz0	Staff Trailer
321	22783	vjrwILdZzEA	Trinity Carrington Trailer
322	22783	HUljAXdEvVo	Gameplay Trailer
323	22783	Ex-fI_YJdwg	Sixpence Character Trailer
324	22783	u8boJSa5yJ8	Gamescom 2016 Teaser
325	37137	Cc3PAAije0Y	Trailer
326	37135	sx_C9jJ0AlA	Trailer
327	37067	55VPB9qnhW8	Trailer
328	25623	CvzTD_RYDXs	Trailer
329	25623	MnpNGzNoOY0	Trailer
330	25623	XiOBszkWCp0	Trailer
331	25623	5VV5-opm1TE	Trailer
332	27666	bvrKWInvfNI	Gameplay Trailer
333	35626	YyjTzc7EH4I	Trailer
334	1821	KZFlz2zHLLY	Trailer
335	5605	Zr6KUgYj6-k	Trailer
336	11078	JNckNbeA4AM	Trailer
337	11078	szhhFGQ3rl0	Trailer
338	11078	lHrvcxL5Ol0	Launch Trailer
339	27261	TQ4fvNcqUes	Trailer
340	36597	VUbzC5fX0t4	Trailer
341	36597	7xJW0LiLHMI	Gameplay video
342	18734	3N8tmO5BZuE	Trailer
343	21062	NV84WqoWdJc	Launch Trailer
344	21062	wvD8NZN9Zsg	Trailer
345	21062	KxmtYdEWVzo	Trailer
346	21062	vzosxScKFQ4	Interview
347	45026	z2F-nBYWWTE	Trailer
348	24474	fpapxyXs3lU	Trailer
349	24474	5-hGxCt_7w0	Trailer
350	24474	x4aYvfiwap8	Trailer
351	13555	gE6zS6Z9FGQ	Trailer
352	12511	khtSM7XRga8	Gameplay video
353	12511	Wz2MRHAJiyE	Trailer
354	51950	jEVSlDACWsM	Trailer
355	51950	1lu2DNUNt9M	Trailer
356	28113	q2vxmLMSh-4	Trailer
357	7621	m2fOr4vTfAA	Launch Trailer
358	7621	PU4vY0rlOo8	Trailer
359	7621	05ZTbZ2P5Fs	Developer Diaries: Part III
360	7621	BHKE_jJKiag	Developer Diaries: Part II
361	7621	EQtyKF0zCtA	Teaser
362	7621	GGhNL4uB8uI	Trailer
363	54529	6BRfs10IPp0	Trailer
364	10960	vfOwkFvumuk	Trailer
365	10960	KqDqAIgYlrk	Gameplay video
366	10960	WrgC-SqEF90	Trailer
367	23581	G8WZvqw_8qk	Trailer
368	32856	fOj2YT8P3w4	Trailer
369	27714	XMbMjXPxSZw	Trailer
370	27239	6T2QB40aj5w	Teaser
371	6066	-ygx4zaMhkk	Trailer
372	6066	IjoW6NFY8YE	Trailer
373	6066	JsOLRN8vJa0	Trailer
374	8652	6U04mprotZU	Trailer
375	54566	bBzOtx4MQQs	Trailer
376	54567	_6S4FpslNwA	Trailer
377	27419	1WDbnzFTgX0	Trailer
378	27419	97BDoEMyuks	Trailer
379	27419	vKftQt3sux4	Trailer
380	51535	ioYUWfWpHG0	Trailer
381	54590	Av1VdYP98fo	Trailer
382	28493	eKTuiyr8nxY	Trailer
383	9732	kNm0u_XxHJ4	Trailer
384	9732	OW7wFTBt9tg	Wildlife tips Teaser
385	9732	bNP35r0qwUg	Launch Trailer
386	9732	rH29s7je7rk	Wildlife Tips #2
387	9732	AHCbGoc_B40	Wildlife Tips #3
388	9732	OQLZXnSKY4E	Trailer
389	16992	-Edk59BqSEU	Trailer
390	16992	T_uA48H1-g4	Trailer
391	25795	vdXpFZYbvcE	Trailer
392	23352	CqaR3NXKoPc	Trailer
393	54724	hcgnGJ7YECc	Trailer
394	54724	nCgx1-au9Uc	Teaser
\.


--
-- Name: videos_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('videos_video_id_seq', 394, true);


--
-- Name: following_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY following
    ADD CONSTRAINT following_pkey PRIMARY KEY (following_id);


--
-- Name: gamegenres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamegenres
    ADD CONSTRAINT gamegenres_pkey PRIMARY KEY (gamegenre_id);


--
-- Name: games_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: gamesystems_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamesystems
    ADD CONSTRAINT gamesystems_pkey PRIMARY KEY (gamesystem_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: screenshots_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY screenshots
    ADD CONSTRAINT screenshots_pkey PRIMARY KEY (screenshot_id);


--
-- Name: systems_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (system_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: usersystems_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY usersystems
    ADD CONSTRAINT usersystems_pkey PRIMARY KEY (usersystem_id);


--
-- Name: videos_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (video_id);


--
-- Name: following_followee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY following
    ADD CONSTRAINT following_followee_fkey FOREIGN KEY (followee) REFERENCES users(user_id);


--
-- Name: following_follower_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY following
    ADD CONSTRAINT following_follower_fkey FOREIGN KEY (follower) REFERENCES users(user_id);


--
-- Name: gamegenres_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamegenres
    ADD CONSTRAINT gamegenres_game_id_fkey FOREIGN KEY (game_id) REFERENCES games(game_id);


--
-- Name: gamegenres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamegenres
    ADD CONSTRAINT gamegenres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: gamesystems_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamesystems
    ADD CONSTRAINT gamesystems_game_id_fkey FOREIGN KEY (game_id) REFERENCES games(game_id);


--
-- Name: gamesystems_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gamesystems
    ADD CONSTRAINT gamesystems_system_id_fkey FOREIGN KEY (system_id) REFERENCES systems(system_id);


--
-- Name: ratings_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_game_id_fkey FOREIGN KEY (game_id) REFERENCES games(game_id);


--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: screenshots_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY screenshots
    ADD CONSTRAINT screenshots_game_id_fkey FOREIGN KEY (game_id) REFERENCES games(game_id);


--
-- Name: usersystems_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY usersystems
    ADD CONSTRAINT usersystems_system_id_fkey FOREIGN KEY (system_id) REFERENCES systems(system_id);


--
-- Name: usersystems_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY usersystems
    ADD CONSTRAINT usersystems_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: videos_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT videos_game_id_fkey FOREIGN KEY (game_id) REFERENCES games(game_id);


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

