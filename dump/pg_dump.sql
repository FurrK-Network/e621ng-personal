--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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

--
-- Data for Name: artist_urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.artist_urls VALUES (1, 1, 'https://t.me/Starselle', 'http://t.me/Starselle/', '2024-09-01 04:14:23.858062', '2024-09-01 04:14:23.858062', true);
INSERT INTO public.artist_urls VALUES (2, 1, 'https://t.me/Starsellensfw', 'http://t.me/Starsellensfw/', '2024-09-01 04:14:23.862031', '2024-09-01 04:14:23.862031', true);
INSERT INTO public.artist_urls VALUES (3, 1, 'https://t.me/Starsie', 'http://t.me/Starsie/', '2024-09-01 04:14:23.864768', '2024-09-01 04:14:23.864768', true);
INSERT INTO public.artist_urls VALUES (4, 1, 'https://x.com/Starsielle', 'http://x.com/Starsielle/', '2024-09-01 04:14:23.86682', '2024-09-01 04:14:23.86682', true);
INSERT INTO public.artist_urls VALUES (5, 3, 'https://www.furaffinity.net/user/keavemind/', 'http://www.furaffinity.net/user/keavemind/', '2024-09-06 00:37:13.556533', '2024-09-06 00:37:13.556533', true);
INSERT INTO public.artist_urls VALUES (6, 3, 'https://x.com/keavemind?lang=en', 'http://x.com/keavemind?lang=en/', '2024-09-06 00:37:13.562414', '2024-09-06 00:37:13.562414', true);
INSERT INTO public.artist_urls VALUES (7, 3, 'https://www.patreon.com/keavemind', 'http://www.patreon.com/keavemind/', '2024-09-06 00:37:13.563597', '2024-09-06 00:37:13.563597', true);
INSERT INTO public.artist_urls VALUES (8, 3, 'https://www.deviantart.com/keavemind', 'http://www.deviantart.com/keavemind/', '2024-09-06 00:37:13.564759', '2024-09-06 00:37:13.564759', true);


--
-- Data for Name: artist_versions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.artist_versions VALUES (1, 1, 'starselle', 1, '172.19.0.1', true, '', '2024-09-01 04:14:23.903532', '2024-09-01 04:14:23.903532', '{starsie}', '{https://t.me/Starselle,https://t.me/Starsellensfw,https://t.me/Starsie,https://x.com/Starsielle}', false);
INSERT INTO public.artist_versions VALUES (2, 2, 'starsie', 1, '172.19.0.1', true, '', '2024-09-01 04:14:31.227654', '2024-09-01 04:14:31.227654', '{starselle}', '{}', false);
INSERT INTO public.artist_versions VALUES (3, 3, 'keavemind', 1, '172.18.0.1', true, '', '2024-09-06 00:37:13.586447', '2024-09-06 00:37:13.586447', '{}', '{https://www.deviantart.com/keavemind,https://www.furaffinity.net/user/keavemind/,https://www.patreon.com/keavemind,https://x.com/keavemind?lang=en}', false);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.artists VALUES (1, 'starselle', 1, true, '', '2024-09-01 04:14:23.847719', '2024-09-01 04:14:23.867971', '{starsie}', NULL, false);
INSERT INTO public.artists VALUES (2, 'starsie', 1, true, '', '2024-09-01 04:14:31.219634', '2024-09-01 04:14:31.219634', '{starselle}', NULL, false);
INSERT INTO public.artists VALUES (3, 'keavemind', 1, true, '', '2024-09-06 00:37:13.551178', '2024-09-06 00:37:13.566472', '{}', NULL, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (2, '2024-09-05 21:49:00.569443', '2024-09-05 21:49:00.569443', 'auto_moderator', '', 'system@e621.local', NULL, 35, 10, NULL, NULL, NULL, -10, 'large', NULL, '', 'Eastern Time (US & Canada)', '$2a$12$TnblEJ/EHLUr5AW7TcKPhuEcCWs9FEkkKSVRUby7IPnTJtpjNnqDW', 75, NULL, 111680, NULL, 0, '', '', NULL);
INSERT INTO public.users VALUES (1, '2024-08-22 21:48:48.645209', '2024-09-05 22:58:41.57315', 'zuri', '', 'admin@e621.local', NULL, 50, 10, '2024-09-05 22:58:41.572308', NULL, NULL, -10, 'large', NULL, '', 'Eastern Time (US & Canada)', '$2a$12$OI3GPNJtDWR0MjxNfum53e9IBuvtQH4hWHKUtEhMHWhxPeQbKd2cK', 75, NULL, 111680, '172.18.0.1', 0, '', '', NULL);


--
-- Data for Name: avoid_postings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: avoid_posting_versions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: bulk_update_requests; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bulk_update_requests VALUES (1, 1, NULL, 'implicate basil -> bird
implicate basil -> avian
implicate basil -> corvid
implicate basil -> corvus_(genus)
implicate basil -> crow
implicate basil -> oscine
implicate basil -> passerine
implicate basil -> anthro
implicate basil -> white_feathers', 'approved', '2024-09-01 04:10:03.512359', '2024-09-01 04:10:06.347219', 1, NULL, 'Basil', '127.0.0.1');
INSERT INTO public.bulk_update_requests VALUES (2, 1, NULL, 'implicate zuri -> felid
implicate zuri -> cheetah
implicate zuri -> feline
implicate zuri -> felis
implicate zuri -> mammal
implicate zuri -> anthro
implicate zuri -> black_body
implicate zuri -> black_fur
implicate zuri -> blonde_highlights
implicate zuri -> cheek_tuft
implicate zuri -> chest_ruft
implicate zuri -> ear_piercing
implicate zuri -> facial_tuft
implicate zuri -> fur
implicate zuri -> hair
implicate zuri -> highlights_(coloring)
implicate zuri -> industrial_piercing
implicate zuri -> industrial_piercing_ladder
implicate zuri -> inner_ear_fluff
implicate zuri -> male
implicate zuri -> markings
implicate zuri -> piercing
implicate zuri -> spots
implicate zuri -> spotted_body
implicate zuri -> spotted_fur
implicate zuri -> tail
implicate zuri -> tongue
implicate zuri -> tongue_out
implicate zuri -> tuft
implicate zuri -> white_body
implicate zuri -> white_fur
implicate serene_form -> blue_eyes', 'approved', '2024-09-01 04:13:16.808832', '2024-09-01 04:13:20.139274', 1, NULL, 'Zuri', '127.0.0.1');


--
-- Data for Name: comment_votes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: destroyed_posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.destroyed_posts VALUES (1, 1, '93dabc87fc19755e89e8510a35e4dfc6', 1, '172.18.0.1', 1, '172.19.0.1', '2024-09-01 04:15:54.024047', '{"id":1,"description":"","md5":"93dabc87fc19755e89e8510a35e4dfc6","tags":"anthro avian basil bird black_body black_fur blonde_highlights blue_eyes blushing chair_position cheek_tuft cheetah chest_ruft corvid corvus_(genus) crow dominant_bottom duo ear_piercing facial_tuft felid feline felis fur hair hi_res highlights_(coloring) industrial_piercing industrial_piercing_ladder inner_ear_fluff male male/male mammal markings oscine passerine penetration piercing serene_form spots spotted_body spotted_fur starselle tail tongue tongue_out tuft white_body white_feathers white_fur zuri","height":1500,"width":1900,"file_size":2186647,"sources":"","approver_id":null,"locked_tags":null,"rating":"e","parent_id":null,"change_seq":1,"is_deleted":false,"is_pending":false,"duration":null,"fav_count":0,"comment_count":0}', '2024-09-06 00:40:48.434945', '2024-09-06 00:40:48.434945', '', true);


--
-- Data for Name: dmails; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: edit_histories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (2, '2024-09-06 00:27:41.40842', '2024-09-06 00:27:41.40842', 0, 0, 0, '', '13866433806034495e2e8bc78656047e', 's', false, false, false, false, false, false, 1, '172.18.0.1', NULL, '', '', NULL, NULL, 0, 'anthro black_body black_fur blonde_highlights cheek_tuft cheetah chest_ruft duo ear_piercing facial_tuft felid feline felis fur hair highlights_(coloring) industrial_piercing industrial_piercing_ladder inner_ear_fluff keavemind male male/male mammal markings maxwell_speedmew piercing spots spotted_body spotted_fur sticker tail tongue tongue_out tuft white_body white_fur zuri', 37, 28, 1, 2, 0, 'png', 204196, 512, 512, NULL, false, NULL, false, 2, 1, NULL, 5, 0, '', 0, 2, 0, NULL, NULL, NULL, false);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: help_pages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: mascots; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mascots VALUES (2, 1, 'Zuri_Maxy', '13866433806034495e2e8bc78656047e', 'png', '#012e57', 'https://furaffinity.net/user/chizi', 'Keave', true, '2024-09-05 21:49:03.143899', '2024-09-05 21:49:03.143899', '{e621}');


--
-- Data for Name: mod_actions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mod_actions VALUES (1, 1, '2024-09-05 21:49:03.209321', '2024-09-05 21:49:03.209321', 'upload_whitelist_create', '{"pattern":"https://static1.e621.net/*","note":null,"hidden":false}');
INSERT INTO public.mod_actions VALUES (2, 1, '2024-09-05 21:49:03.214375', '2024-09-05 21:49:03.214375', 'upload_whitelist_update', '{"pattern":"https://static1.e621.net/*","note":null,"old_pattern":null,"hidden":false}');
INSERT INTO public.mod_actions VALUES (3, 1, '2024-09-01 04:10:05.944042', '2024-09-01 04:10:05.944042', 'tag_implication_update', '{"implication_id":1,"implication_desc":"\"tag implication #1\":[/tag_implications/1]: [[basil]] -\u003e [[bird]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (4, 1, '2024-09-01 04:10:06.043492', '2024-09-01 04:10:06.043492', 'tag_implication_update', '{"implication_id":2,"implication_desc":"\"tag implication #2\":[/tag_implications/2]: [[basil]] -\u003e [[avian]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (5, 1, '2024-09-01 04:10:06.091751', '2024-09-01 04:10:06.091751', 'tag_implication_update', '{"implication_id":3,"implication_desc":"\"tag implication #3\":[/tag_implications/3]: [[basil]] -\u003e [[corvid]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (6, 1, '2024-09-01 04:10:06.13115', '2024-09-01 04:10:06.13115', 'tag_implication_update', '{"implication_id":4,"implication_desc":"\"tag implication #4\":[/tag_implications/4]: [[basil]] -\u003e [[corvus_(genus)]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (7, 1, '2024-09-01 04:10:06.175268', '2024-09-01 04:10:06.175268', 'tag_implication_update', '{"implication_id":5,"implication_desc":"\"tag implication #5\":[/tag_implications/5]: [[basil]] -\u003e [[crow]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (8, 1, '2024-09-01 04:10:06.213735', '2024-09-01 04:10:06.213735', 'tag_implication_update', '{"implication_id":6,"implication_desc":"\"tag implication #6\":[/tag_implications/6]: [[basil]] -\u003e [[oscine]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (9, 1, '2024-09-01 04:10:06.247474', '2024-09-01 04:10:06.247474', 'tag_implication_update', '{"implication_id":7,"implication_desc":"\"tag implication #7\":[/tag_implications/7]: [[basil]] -\u003e [[passerine]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (10, 1, '2024-09-01 04:10:06.28895', '2024-09-01 04:10:06.28895', 'tag_implication_update', '{"implication_id":8,"implication_desc":"\"tag implication #8\":[/tag_implications/8]: [[basil]] -\u003e [[anthro]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (11, 1, '2024-09-01 04:10:06.330554', '2024-09-01 04:10:06.330554', 'tag_implication_update', '{"implication_id":9,"implication_desc":"\"tag implication #9\":[/tag_implications/9]: [[basil]] -\u003e [[white_feathers]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (12, 1, '2024-09-01 04:10:06.917391', '2024-09-01 04:10:06.917391', 'tag_implication_update', '{"implication_id":5,"implication_desc":"\"tag implication #5\":[/tag_implications/5]: [[basil]] -\u003e [[crow]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (13, 1, '2024-09-01 04:10:06.92488', '2024-09-01 04:10:06.92488', 'tag_implication_update', '{"implication_id":2,"implication_desc":"\"tag implication #2\":[/tag_implications/2]: [[basil]] -\u003e [[avian]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (14, 1, '2024-09-01 04:10:06.931451', '2024-09-01 04:10:06.931451', 'tag_implication_update', '{"implication_id":4,"implication_desc":"\"tag implication #4\":[/tag_implications/4]: [[basil]] -\u003e [[corvus_(genus)]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (15, 1, '2024-09-01 04:10:06.937694', '2024-09-01 04:10:06.937694', 'tag_implication_update', '{"implication_id":3,"implication_desc":"\"tag implication #3\":[/tag_implications/3]: [[basil]] -\u003e [[corvid]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (16, 1, '2024-09-01 04:10:06.959263', '2024-09-01 04:10:06.959263', 'tag_implication_update', '{"implication_id":1,"implication_desc":"\"tag implication #1\":[/tag_implications/1]: [[basil]] -\u003e [[bird]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (17, 1, '2024-09-01 04:10:07.043256', '2024-09-01 04:10:07.043256', 'tag_implication_update', '{"implication_id":5,"implication_desc":"\"tag implication #5\":[/tag_implications/5]: [[basil]] -\u003e [[crow]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (18, 1, '2024-09-01 04:10:07.054642', '2024-09-01 04:10:07.054642', 'tag_implication_update', '{"implication_id":4,"implication_desc":"\"tag implication #4\":[/tag_implications/4]: [[basil]] -\u003e [[corvus_(genus)]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (19, 1, '2024-09-01 04:10:07.055942', '2024-09-01 04:10:07.055942', 'tag_implication_update', '{"implication_id":2,"implication_desc":"\"tag implication #2\":[/tag_implications/2]: [[basil]] -\u003e [[avian]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (20, 1, '2024-09-01 04:10:07.057066', '2024-09-01 04:10:07.057066', 'tag_implication_update', '{"implication_id":3,"implication_desc":"\"tag implication #3\":[/tag_implications/3]: [[basil]] -\u003e [[corvid]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (21, 1, '2024-09-01 04:10:07.092854', '2024-09-01 04:10:07.092854', 'tag_implication_update', '{"implication_id":1,"implication_desc":"\"tag implication #1\":[/tag_implications/1]: [[basil]] -\u003e [[bird]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (22, 1, '2024-09-01 04:10:07.27538', '2024-09-01 04:10:07.27538', 'tag_implication_update', '{"implication_id":6,"implication_desc":"\"tag implication #6\":[/tag_implications/6]: [[basil]] -\u003e [[oscine]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (23, 1, '2024-09-01 04:10:07.306113', '2024-09-01 04:10:07.306113', 'tag_implication_update', '{"implication_id":7,"implication_desc":"\"tag implication #7\":[/tag_implications/7]: [[basil]] -\u003e [[passerine]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (24, 1, '2024-09-01 04:10:07.312042', '2024-09-01 04:10:07.312042', 'tag_implication_update', '{"implication_id":9,"implication_desc":"\"tag implication #9\":[/tag_implications/9]: [[basil]] -\u003e [[white_feathers]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (25, 1, '2024-09-01 04:10:07.328477', '2024-09-01 04:10:07.328477', 'tag_implication_update', '{"implication_id":8,"implication_desc":"\"tag implication #8\":[/tag_implications/8]: [[basil]] -\u003e [[anthro]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (26, 1, '2024-09-01 04:10:07.362446', '2024-09-01 04:10:07.362446', 'tag_implication_update', '{"implication_id":6,"implication_desc":"\"tag implication #6\":[/tag_implications/6]: [[basil]] -\u003e [[oscine]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (27, 1, '2024-09-01 04:10:07.384613', '2024-09-01 04:10:07.384613', 'tag_implication_update', '{"implication_id":9,"implication_desc":"\"tag implication #9\":[/tag_implications/9]: [[basil]] -\u003e [[white_feathers]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (28, 1, '2024-09-01 04:10:07.386611', '2024-09-01 04:10:07.386611', 'tag_implication_update', '{"implication_id":7,"implication_desc":"\"tag implication #7\":[/tag_implications/7]: [[basil]] -\u003e [[passerine]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (29, 1, '2024-09-01 04:10:07.405121', '2024-09-01 04:10:07.405121', 'tag_implication_update', '{"implication_id":8,"implication_desc":"\"tag implication #8\":[/tag_implications/8]: [[basil]] -\u003e [[anthro]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (30, 1, '2024-09-01 04:13:19.072363', '2024-09-01 04:13:19.072363', 'tag_implication_update', '{"implication_id":10,"implication_desc":"\"tag implication #10\":[/tag_implications/10]: [[zuri]] -\u003e [[felid]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (31, 1, '2024-09-01 04:13:19.160083', '2024-09-01 04:13:19.160083', 'tag_implication_update', '{"implication_id":11,"implication_desc":"\"tag implication #11\":[/tag_implications/11]: [[zuri]] -\u003e [[cheetah]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (32, 1, '2024-09-01 04:13:19.189996', '2024-09-01 04:13:19.189996', 'tag_implication_update', '{"implication_id":12,"implication_desc":"\"tag implication #12\":[/tag_implications/12]: [[zuri]] -\u003e [[feline]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (33, 1, '2024-09-01 04:13:19.218411', '2024-09-01 04:13:19.218411', 'tag_implication_update', '{"implication_id":13,"implication_desc":"\"tag implication #13\":[/tag_implications/13]: [[zuri]] -\u003e [[felis]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (34, 1, '2024-09-01 04:13:19.247914', '2024-09-01 04:13:19.247914', 'tag_implication_update', '{"implication_id":14,"implication_desc":"\"tag implication #14\":[/tag_implications/14]: [[zuri]] -\u003e [[mammal]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (35, 1, '2024-09-01 04:13:19.279347', '2024-09-01 04:13:19.279347', 'tag_implication_update', '{"implication_id":15,"implication_desc":"\"tag implication #15\":[/tag_implications/15]: [[zuri]] -\u003e [[anthro]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (36, 1, '2024-09-01 04:13:19.309019', '2024-09-01 04:13:19.309019', 'tag_implication_update', '{"implication_id":16,"implication_desc":"\"tag implication #16\":[/tag_implications/16]: [[zuri]] -\u003e [[black_body]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (37, 1, '2024-09-01 04:13:19.346442', '2024-09-01 04:13:19.346442', 'tag_implication_update', '{"implication_id":17,"implication_desc":"\"tag implication #17\":[/tag_implications/17]: [[zuri]] -\u003e [[black_fur]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (38, 1, '2024-09-01 04:13:19.377074', '2024-09-01 04:13:19.377074', 'tag_implication_update', '{"implication_id":18,"implication_desc":"\"tag implication #18\":[/tag_implications/18]: [[zuri]] -\u003e [[blonde_highlights]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (39, 1, '2024-09-01 04:13:19.405578', '2024-09-01 04:13:19.405578', 'tag_implication_update', '{"implication_id":19,"implication_desc":"\"tag implication #19\":[/tag_implications/19]: [[zuri]] -\u003e [[cheek_tuft]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (40, 1, '2024-09-01 04:13:19.43381', '2024-09-01 04:13:19.43381', 'tag_implication_update', '{"implication_id":20,"implication_desc":"\"tag implication #20\":[/tag_implications/20]: [[zuri]] -\u003e [[chest_ruft]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (41, 1, '2024-09-01 04:13:19.46226', '2024-09-01 04:13:19.46226', 'tag_implication_update', '{"implication_id":21,"implication_desc":"\"tag implication #21\":[/tag_implications/21]: [[zuri]] -\u003e [[ear_piercing]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (42, 1, '2024-09-01 04:13:19.492598', '2024-09-01 04:13:19.492598', 'tag_implication_update', '{"implication_id":22,"implication_desc":"\"tag implication #22\":[/tag_implications/22]: [[zuri]] -\u003e [[facial_tuft]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (43, 1, '2024-09-01 04:13:19.527439', '2024-09-01 04:13:19.527439', 'tag_implication_update', '{"implication_id":23,"implication_desc":"\"tag implication #23\":[/tag_implications/23]: [[zuri]] -\u003e [[fur]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (44, 1, '2024-09-01 04:13:19.553523', '2024-09-01 04:13:19.553523', 'tag_implication_update', '{"implication_id":24,"implication_desc":"\"tag implication #24\":[/tag_implications/24]: [[zuri]] -\u003e [[hair]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (45, 1, '2024-09-01 04:13:19.584983', '2024-09-01 04:13:19.584983', 'tag_implication_update', '{"implication_id":25,"implication_desc":"\"tag implication #25\":[/tag_implications/25]: [[zuri]] -\u003e [[highlights_(coloring)]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (46, 1, '2024-09-01 04:13:19.612745', '2024-09-01 04:13:19.612745', 'tag_implication_update', '{"implication_id":26,"implication_desc":"\"tag implication #26\":[/tag_implications/26]: [[zuri]] -\u003e [[industrial_piercing]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (47, 1, '2024-09-01 04:13:19.643057', '2024-09-01 04:13:19.643057', 'tag_implication_update', '{"implication_id":27,"implication_desc":"\"tag implication #27\":[/tag_implications/27]: [[zuri]] -\u003e [[industrial_piercing_ladder]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (48, 1, '2024-09-01 04:13:19.675969', '2024-09-01 04:13:19.675969', 'tag_implication_update', '{"implication_id":28,"implication_desc":"\"tag implication #28\":[/tag_implications/28]: [[zuri]] -\u003e [[inner_ear_fluff]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (49, 1, '2024-09-01 04:13:19.733353', '2024-09-01 04:13:19.733353', 'tag_implication_update', '{"implication_id":29,"implication_desc":"\"tag implication #29\":[/tag_implications/29]: [[zuri]] -\u003e [[male]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (50, 1, '2024-09-01 04:13:19.810552', '2024-09-01 04:13:19.810552', 'tag_implication_update', '{"implication_id":30,"implication_desc":"\"tag implication #30\":[/tag_implications/30]: [[zuri]] -\u003e [[markings]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (51, 1, '2024-09-01 04:13:19.840744', '2024-09-01 04:13:19.840744', 'tag_implication_update', '{"implication_id":31,"implication_desc":"\"tag implication #31\":[/tag_implications/31]: [[zuri]] -\u003e [[piercing]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (52, 1, '2024-09-01 04:13:19.868976', '2024-09-01 04:13:19.868976', 'tag_implication_update', '{"implication_id":32,"implication_desc":"\"tag implication #32\":[/tag_implications/32]: [[zuri]] -\u003e [[spots]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (53, 1, '2024-09-01 04:13:19.897736', '2024-09-01 04:13:19.897736', 'tag_implication_update', '{"implication_id":33,"implication_desc":"\"tag implication #33\":[/tag_implications/33]: [[zuri]] -\u003e [[spotted_body]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (54, 1, '2024-09-01 04:13:19.925822', '2024-09-01 04:13:19.925822', 'tag_implication_update', '{"implication_id":34,"implication_desc":"\"tag implication #34\":[/tag_implications/34]: [[zuri]] -\u003e [[spotted_fur]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (55, 1, '2024-09-01 04:13:19.951056', '2024-09-01 04:13:19.951056', 'tag_implication_update', '{"implication_id":35,"implication_desc":"\"tag implication #35\":[/tag_implications/35]: [[zuri]] -\u003e [[tail]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (56, 1, '2024-09-01 04:13:19.978851', '2024-09-01 04:13:19.978851', 'tag_implication_update', '{"implication_id":36,"implication_desc":"\"tag implication #36\":[/tag_implications/36]: [[zuri]] -\u003e [[tongue]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (57, 1, '2024-09-01 04:13:20.004943', '2024-09-01 04:13:20.004943', 'tag_implication_update', '{"implication_id":37,"implication_desc":"\"tag implication #37\":[/tag_implications/37]: [[zuri]] -\u003e [[tongue_out]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (58, 1, '2024-09-01 04:13:20.038765', '2024-09-01 04:13:20.038765', 'tag_implication_update', '{"implication_id":38,"implication_desc":"\"tag implication #38\":[/tag_implications/38]: [[zuri]] -\u003e [[tuft]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (59, 1, '2024-09-01 04:13:20.065269', '2024-09-01 04:13:20.065269', 'tag_implication_update', '{"implication_id":39,"implication_desc":"\"tag implication #39\":[/tag_implications/39]: [[zuri]] -\u003e [[white_body]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (60, 1, '2024-09-01 04:13:20.090671', '2024-09-01 04:13:20.090671', 'tag_implication_update', '{"implication_id":40,"implication_desc":"\"tag implication #40\":[/tag_implications/40]: [[zuri]] -\u003e [[white_fur]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (61, 1, '2024-09-01 04:13:20.116698', '2024-09-01 04:13:20.116698', 'tag_implication_update', '{"implication_id":41,"implication_desc":"\"tag implication #41\":[/tag_implications/41]: [[serene_form]] -\u003e [[blue_eyes]]","change_desc":"changed status from \"pending\" to \"queued\", set approver_id to \"1\""}');
INSERT INTO public.mod_actions VALUES (62, 1, '2024-09-01 04:13:36.186985', '2024-09-01 04:13:36.186985', 'tag_implication_update', '{"implication_id":26,"implication_desc":"\"tag implication #26\":[/tag_implications/26]: [[zuri]] -\u003e [[industrial_piercing]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (67, 1, '2024-09-01 04:13:36.237277', '2024-09-01 04:13:36.237277', 'tag_implication_update', '{"implication_id":26,"implication_desc":"\"tag implication #26\":[/tag_implications/26]: [[zuri]] -\u003e [[industrial_piercing]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (82, 1, '2024-09-01 04:13:41.813674', '2024-09-01 04:13:41.813674', 'tag_implication_update', '{"implication_id":30,"implication_desc":"\"tag implication #30\":[/tag_implications/30]: [[zuri]] -\u003e [[markings]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (87, 1, '2024-09-01 04:13:41.874319', '2024-09-01 04:13:41.874319', 'tag_implication_update', '{"implication_id":30,"implication_desc":"\"tag implication #30\":[/tag_implications/30]: [[zuri]] -\u003e [[markings]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (88, 1, '2024-09-01 04:13:42.036469', '2024-09-01 04:13:42.036469', 'tag_implication_update', '{"implication_id":23,"implication_desc":"\"tag implication #23\":[/tag_implications/23]: [[zuri]] -\u003e [[fur]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (93, 1, '2024-09-01 04:13:42.081876', '2024-09-01 04:13:42.081876', 'tag_implication_update', '{"implication_id":23,"implication_desc":"\"tag implication #23\":[/tag_implications/23]: [[zuri]] -\u003e [[fur]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (100, 1, '2024-09-01 04:13:42.326398', '2024-09-01 04:13:42.326398', 'tag_implication_update', '{"implication_id":18,"implication_desc":"\"tag implication #18\":[/tag_implications/18]: [[zuri]] -\u003e [[blonde_highlights]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (106, 1, '2024-09-01 04:13:42.389436', '2024-09-01 04:13:42.389436', 'tag_implication_update', '{"implication_id":18,"implication_desc":"\"tag implication #18\":[/tag_implications/18]: [[zuri]] -\u003e [[blonde_highlights]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (109, 1, '2024-09-01 04:13:42.517404', '2024-09-01 04:13:42.517404', 'tag_implication_update', '{"implication_id":14,"implication_desc":"\"tag implication #14\":[/tag_implications/14]: [[zuri]] -\u003e [[mammal]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (112, 1, '2024-09-01 04:13:42.538451', '2024-09-01 04:13:42.538451', 'tag_implication_update', '{"implication_id":14,"implication_desc":"\"tag implication #14\":[/tag_implications/14]: [[zuri]] -\u003e [[mammal]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (117, 1, '2024-09-01 04:13:46.510971', '2024-09-01 04:13:46.510971', 'tag_implication_update', '{"implication_id":12,"implication_desc":"\"tag implication #12\":[/tag_implications/12]: [[zuri]] -\u003e [[feline]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (123, 1, '2024-09-01 04:13:46.565306', '2024-09-01 04:13:46.565306', 'tag_implication_update', '{"implication_id":12,"implication_desc":"\"tag implication #12\":[/tag_implications/12]: [[zuri]] -\u003e [[feline]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (124, 1, '2024-09-01 04:13:46.588314', '2024-09-01 04:13:46.588314', 'tag_implication_update', '{"implication_id":13,"implication_desc":"\"tag implication #13\":[/tag_implications/13]: [[zuri]] -\u003e [[felis]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (125, 1, '2024-09-01 04:13:46.599681', '2024-09-01 04:13:46.599681', 'tag_implication_update', '{"implication_id":13,"implication_desc":"\"tag implication #13\":[/tag_implications/13]: [[zuri]] -\u003e [[felis]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (63, 1, '2024-09-01 04:13:36.193622', '2024-09-01 04:13:36.193622', 'tag_implication_update', '{"implication_id":27,"implication_desc":"\"tag implication #27\":[/tag_implications/27]: [[zuri]] -\u003e [[industrial_piercing_ladder]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (69, 1, '2024-09-01 04:13:36.254973', '2024-09-01 04:13:36.254973', 'tag_implication_update', '{"implication_id":27,"implication_desc":"\"tag implication #27\":[/tag_implications/27]: [[zuri]] -\u003e [[industrial_piercing_ladder]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (74, 1, '2024-09-01 04:13:36.388825', '2024-09-01 04:13:36.388825', 'tag_implication_update', '{"implication_id":31,"implication_desc":"\"tag implication #31\":[/tag_implications/31]: [[zuri]] -\u003e [[piercing]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (77, 1, '2024-09-01 04:13:36.416019', '2024-09-01 04:13:36.416019', 'tag_implication_update', '{"implication_id":31,"implication_desc":"\"tag implication #31\":[/tag_implications/31]: [[zuri]] -\u003e [[piercing]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (78, 1, '2024-09-01 04:13:41.776422', '2024-09-01 04:13:41.776422', 'tag_implication_update', '{"implication_id":41,"implication_desc":"\"tag implication #41\":[/tag_implications/41]: [[serene_form]] -\u003e [[blue_eyes]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (84, 1, '2024-09-01 04:13:41.841309', '2024-09-01 04:13:41.841309', 'tag_implication_update', '{"implication_id":41,"implication_desc":"\"tag implication #41\":[/tag_implications/41]: [[serene_form]] -\u003e [[blue_eyes]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (92, 1, '2024-09-01 04:13:42.075188', '2024-09-01 04:13:42.075188', 'tag_implication_update', '{"implication_id":17,"implication_desc":"\"tag implication #17\":[/tag_implications/17]: [[zuri]] -\u003e [[black_fur]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (97, 1, '2024-09-01 04:13:42.131435', '2024-09-01 04:13:42.131435', 'tag_implication_update', '{"implication_id":17,"implication_desc":"\"tag implication #17\":[/tag_implications/17]: [[zuri]] -\u003e [[black_fur]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (98, 1, '2024-09-01 04:13:42.280684', '2024-09-01 04:13:42.280684', 'tag_implication_update', '{"implication_id":21,"implication_desc":"\"tag implication #21\":[/tag_implications/21]: [[zuri]] -\u003e [[ear_piercing]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (102, 1, '2024-09-01 04:13:42.342763', '2024-09-01 04:13:42.342763', 'tag_implication_update', '{"implication_id":21,"implication_desc":"\"tag implication #21\":[/tag_implications/21]: [[zuri]] -\u003e [[ear_piercing]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (118, 1, '2024-09-01 04:13:46.513431', '2024-09-01 04:13:46.513431', 'tag_implication_update', '{"implication_id":36,"implication_desc":"\"tag implication #36\":[/tag_implications/36]: [[zuri]] -\u003e [[tongue]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (122, 1, '2024-09-01 04:13:46.564111', '2024-09-01 04:13:46.564111', 'tag_implication_update', '{"implication_id":36,"implication_desc":"\"tag implication #36\":[/tag_implications/36]: [[zuri]] -\u003e [[tongue]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (64, 1, '2024-09-01 04:13:36.200054', '2024-09-01 04:13:36.200054', 'tag_implication_update', '{"implication_id":37,"implication_desc":"\"tag implication #37\":[/tag_implications/37]: [[zuri]] -\u003e [[tongue_out]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (68, 1, '2024-09-01 04:13:36.246069', '2024-09-01 04:13:36.246069', 'tag_implication_update', '{"implication_id":37,"implication_desc":"\"tag implication #37\":[/tag_implications/37]: [[zuri]] -\u003e [[tongue_out]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (80, 1, '2024-09-01 04:13:41.806557', '2024-09-01 04:13:41.806557', 'tag_implication_update', '{"implication_id":24,"implication_desc":"\"tag implication #24\":[/tag_implications/24]: [[zuri]] -\u003e [[hair]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (85, 1, '2024-09-01 04:13:41.852418', '2024-09-01 04:13:41.852418', 'tag_implication_update', '{"implication_id":24,"implication_desc":"\"tag implication #24\":[/tag_implications/24]: [[zuri]] -\u003e [[hair]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (90, 1, '2024-09-01 04:13:42.056945', '2024-09-01 04:13:42.056945', 'tag_implication_update', '{"implication_id":10,"implication_desc":"\"tag implication #10\":[/tag_implications/10]: [[zuri]] -\u003e [[felid]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (94, 1, '2024-09-01 04:13:42.104299', '2024-09-01 04:13:42.104299', 'tag_implication_update', '{"implication_id":10,"implication_desc":"\"tag implication #10\":[/tag_implications/10]: [[zuri]] -\u003e [[felid]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (101, 1, '2024-09-01 04:13:42.330961', '2024-09-01 04:13:42.330961', 'tag_implication_update', '{"implication_id":38,"implication_desc":"\"tag implication #38\":[/tag_implications/38]: [[zuri]] -\u003e [[tuft]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (105, 1, '2024-09-01 04:13:42.388334', '2024-09-01 04:13:42.388334', 'tag_implication_update', '{"implication_id":38,"implication_desc":"\"tag implication #38\":[/tag_implications/38]: [[zuri]] -\u003e [[tuft]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (110, 1, '2024-09-01 04:13:42.5191', '2024-09-01 04:13:42.5191', 'tag_implication_update', '{"implication_id":15,"implication_desc":"\"tag implication #15\":[/tag_implications/15]: [[zuri]] -\u003e [[anthro]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (113, 1, '2024-09-01 04:13:42.54053', '2024-09-01 04:13:42.54053', 'tag_implication_update', '{"implication_id":15,"implication_desc":"\"tag implication #15\":[/tag_implications/15]: [[zuri]] -\u003e [[anthro]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (114, 1, '2024-09-01 04:13:46.487641', '2024-09-01 04:13:46.487641', 'tag_implication_update', '{"implication_id":34,"implication_desc":"\"tag implication #34\":[/tag_implications/34]: [[zuri]] -\u003e [[spotted_fur]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (119, 1, '2024-09-01 04:13:46.541738', '2024-09-01 04:13:46.541738', 'tag_implication_update', '{"implication_id":34,"implication_desc":"\"tag implication #34\":[/tag_implications/34]: [[zuri]] -\u003e [[spotted_fur]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (65, 1, '2024-09-01 04:13:36.215553', '2024-09-01 04:13:36.215553', 'tag_implication_update', '{"implication_id":32,"implication_desc":"\"tag implication #32\":[/tag_implications/32]: [[zuri]] -\u003e [[spots]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (71, 1, '2024-09-01 04:13:36.285813', '2024-09-01 04:13:36.285813', 'tag_implication_update', '{"implication_id":32,"implication_desc":"\"tag implication #32\":[/tag_implications/32]: [[zuri]] -\u003e [[spots]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (72, 1, '2024-09-01 04:13:36.381856', '2024-09-01 04:13:36.381856', 'tag_implication_update', '{"implication_id":39,"implication_desc":"\"tag implication #39\":[/tag_implications/39]: [[zuri]] -\u003e [[white_body]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (75, 1, '2024-09-01 04:13:36.409275', '2024-09-01 04:13:36.409275', 'tag_implication_update', '{"implication_id":39,"implication_desc":"\"tag implication #39\":[/tag_implications/39]: [[zuri]] -\u003e [[white_body]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (79, 1, '2024-09-01 04:13:41.784595', '2024-09-01 04:13:41.784595', 'tag_implication_update', '{"implication_id":19,"implication_desc":"\"tag implication #19\":[/tag_implications/19]: [[zuri]] -\u003e [[cheek_tuft]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (83, 1, '2024-09-01 04:13:41.837774', '2024-09-01 04:13:41.837774', 'tag_implication_update', '{"implication_id":19,"implication_desc":"\"tag implication #19\":[/tag_implications/19]: [[zuri]] -\u003e [[cheek_tuft]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (91, 1, '2024-09-01 04:13:42.066337', '2024-09-01 04:13:42.066337', 'tag_implication_update', '{"implication_id":11,"implication_desc":"\"tag implication #11\":[/tag_implications/11]: [[zuri]] -\u003e [[cheetah]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (96, 1, '2024-09-01 04:13:42.122945', '2024-09-01 04:13:42.122945', 'tag_implication_update', '{"implication_id":11,"implication_desc":"\"tag implication #11\":[/tag_implications/11]: [[zuri]] -\u003e [[cheetah]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (103, 1, '2024-09-01 04:13:42.344773', '2024-09-01 04:13:42.344773', 'tag_implication_update', '{"implication_id":29,"implication_desc":"\"tag implication #29\":[/tag_implications/29]: [[zuri]] -\u003e [[male]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (107, 1, '2024-09-01 04:13:42.403824', '2024-09-01 04:13:42.403824', 'tag_implication_update', '{"implication_id":29,"implication_desc":"\"tag implication #29\":[/tag_implications/29]: [[zuri]] -\u003e [[male]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (108, 1, '2024-09-01 04:13:42.493451', '2024-09-01 04:13:42.493451', 'tag_implication_update', '{"implication_id":20,"implication_desc":"\"tag implication #20\":[/tag_implications/20]: [[zuri]] -\u003e [[chest_ruft]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (111, 1, '2024-09-01 04:13:42.522897', '2024-09-01 04:13:42.522897', 'tag_implication_update', '{"implication_id":20,"implication_desc":"\"tag implication #20\":[/tag_implications/20]: [[zuri]] -\u003e [[chest_ruft]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (116, 1, '2024-09-01 04:13:46.499837', '2024-09-01 04:13:46.499837', 'tag_implication_update', '{"implication_id":22,"implication_desc":"\"tag implication #22\":[/tag_implications/22]: [[zuri]] -\u003e [[facial_tuft]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (120, 1, '2024-09-01 04:13:46.543454', '2024-09-01 04:13:46.543454', 'tag_implication_update', '{"implication_id":22,"implication_desc":"\"tag implication #22\":[/tag_implications/22]: [[zuri]] -\u003e [[facial_tuft]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (66, 1, '2024-09-01 04:13:36.218389', '2024-09-01 04:13:36.218389', 'tag_implication_update', '{"implication_id":35,"implication_desc":"\"tag implication #35\":[/tag_implications/35]: [[zuri]] -\u003e [[tail]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (70, 1, '2024-09-01 04:13:36.270862', '2024-09-01 04:13:36.270862', 'tag_implication_update', '{"implication_id":35,"implication_desc":"\"tag implication #35\":[/tag_implications/35]: [[zuri]] -\u003e [[tail]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (73, 1, '2024-09-01 04:13:36.38591', '2024-09-01 04:13:36.38591', 'tag_implication_update', '{"implication_id":40,"implication_desc":"\"tag implication #40\":[/tag_implications/40]: [[zuri]] -\u003e [[white_fur]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (76, 1, '2024-09-01 04:13:36.413233', '2024-09-01 04:13:36.413233', 'tag_implication_update', '{"implication_id":40,"implication_desc":"\"tag implication #40\":[/tag_implications/40]: [[zuri]] -\u003e [[white_fur]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (81, 1, '2024-09-01 04:13:41.807678', '2024-09-01 04:13:41.807678', 'tag_implication_update', '{"implication_id":16,"implication_desc":"\"tag implication #16\":[/tag_implications/16]: [[zuri]] -\u003e [[black_body]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (86, 1, '2024-09-01 04:13:41.865634', '2024-09-01 04:13:41.865634', 'tag_implication_update', '{"implication_id":16,"implication_desc":"\"tag implication #16\":[/tag_implications/16]: [[zuri]] -\u003e [[black_body]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (89, 1, '2024-09-01 04:13:42.046064', '2024-09-01 04:13:42.046064', 'tag_implication_update', '{"implication_id":25,"implication_desc":"\"tag implication #25\":[/tag_implications/25]: [[zuri]] -\u003e [[highlights_(coloring)]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (95, 1, '2024-09-01 04:13:42.121583', '2024-09-01 04:13:42.121583', 'tag_implication_update', '{"implication_id":25,"implication_desc":"\"tag implication #25\":[/tag_implications/25]: [[zuri]] -\u003e [[highlights_(coloring)]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (99, 1, '2024-09-01 04:13:42.317372', '2024-09-01 04:13:42.317372', 'tag_implication_update', '{"implication_id":33,"implication_desc":"\"tag implication #33\":[/tag_implications/33]: [[zuri]] -\u003e [[spotted_body]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (104, 1, '2024-09-01 04:13:42.386368', '2024-09-01 04:13:42.386368', 'tag_implication_update', '{"implication_id":33,"implication_desc":"\"tag implication #33\":[/tag_implications/33]: [[zuri]] -\u003e [[spotted_body]]","change_desc":"changed status from \"processing\" to \"active\""}');
INSERT INTO public.mod_actions VALUES (115, 1, '2024-09-01 04:13:46.491497', '2024-09-01 04:13:46.491497', 'tag_implication_update', '{"implication_id":28,"implication_desc":"\"tag implication #28\":[/tag_implications/28]: [[zuri]] -\u003e [[inner_ear_fluff]]","change_desc":"changed status from \"queued\" to \"processing\""}');
INSERT INTO public.mod_actions VALUES (121, 1, '2024-09-01 04:13:46.550294', '2024-09-01 04:13:46.550294', 'tag_implication_update', '{"implication_id":28,"implication_desc":"\"tag implication #28\":[/tag_implications/28]: [[zuri]] -\u003e [[inner_ear_fluff]]","change_desc":"changed status from \"processing\" to \"active\""}');


--
-- Data for Name: note_versions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pool_versions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pools; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_approvals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_disapprovals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_events; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.post_events VALUES (1, 1, 1, 17, '{}', '2024-09-06 00:40:48.454841');


--
-- Data for Name: post_flags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_replacements2; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_set_maintainers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_sets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_versions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.post_versions VALUES (2, 2, 'anthro black_body black_fur blonde_highlights cheek_tuft cheetah chest_ruft duo ear_piercing facial_tuft felid feline felis fur hair highlights_(coloring) industrial_piercing industrial_piercing_ladder inner_ear_fluff keavemind male male/male mammal markings maxwell_speedmew piercing spots spotted_body spotted_fur sticker tail tongue tongue_out tuft white_body white_fur zuri', '{anthro,black_body,black_fur,blonde_highlights,cheek_tuft,cheetah,chest_ruft,duo,ear_piercing,facial_tuft,felid,feline,felis,fur,hair,highlights_(coloring),industrial_piercing,industrial_piercing_ladder,inner_ear_fluff,keavemind,male,male/male,mammal,markings,maxwell_speedmew,piercing,spots,spotted_body,spotted_fur,sticker,tail,tongue,tongue_out,tuft,white_body,white_fur,zuri}', '{}', NULL, '{}', '{}', 1, '172.18.0.1', '2024-09-06 00:27:41.447072', 's', true, NULL, true, '', true, '', true, 1, NULL);


--
-- Data for Name: post_votes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: staff_audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: staff_notes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tag_aliases; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tag_implications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tag_implications VALUES (20, 'zuri', 'chest_ruft', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.420338', '2024-09-01 04:13:42.520389', 1, NULL, '{chest_ruft}', '');
INSERT INTO public.tag_implications VALUES (14, 'zuri', 'mammal', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.232243', '2024-09-01 04:13:42.535464', 1, NULL, '{mammal}', '');
INSERT INTO public.tag_implications VALUES (5, 'basil', 'crow', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.150482', '2024-09-01 04:10:07.029524', 1, NULL, '{crow}', '');
INSERT INTO public.tag_implications VALUES (3, 'basil', 'corvid', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.072733', '2024-09-01 04:10:07.041801', 1, NULL, '{corvid}', '');
INSERT INTO public.tag_implications VALUES (4, 'basil', 'corvus_(genus)', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.116498', '2024-09-01 04:10:07.045288', 1, NULL, '{corvus_(genus)}', '');
INSERT INTO public.tag_implications VALUES (2, 'basil', 'avian', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.025145', '2024-09-01 04:10:07.046496', 1, NULL, '{avian}', '');
INSERT INTO public.tag_implications VALUES (1, 'basil', 'bird', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:05.882578', '2024-09-01 04:10:07.081544', 1, NULL, '{bird}', '');
INSERT INTO public.tag_implications VALUES (15, 'zuri', 'anthro', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.265843', '2024-09-01 04:13:42.537627', 1, NULL, '{anthro}', '');
INSERT INTO public.tag_implications VALUES (23, 'zuri', 'fur', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.515905', '2024-09-01 04:13:42.074271', 1, NULL, '{fur}', '');
INSERT INTO public.tag_implications VALUES (6, 'basil', 'oscine', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.198778', '2024-09-01 04:10:07.356373', 1, NULL, '{oscine}', '');
INSERT INTO public.tag_implications VALUES (9, 'basil', 'white_feathers', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.311677', '2024-09-01 04:10:07.364248', 1, NULL, '{white_feathers}', '');
INSERT INTO public.tag_implications VALUES (7, 'basil', 'passerine', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.234022', '2024-09-01 04:10:07.376456', 1, NULL, '{passerine}', '');
INSERT INTO public.tag_implications VALUES (8, 'basil', 'anthro', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:10:06.267108', '2024-09-01 04:10:07.390082', 1, NULL, '{anthro}', '');
INSERT INTO public.tag_implications VALUES (10, 'zuri', 'felid', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.02232', '2024-09-01 04:13:42.094413', 1, NULL, '{felid}', '');
INSERT INTO public.tag_implications VALUES (22, 'zuri', 'facial_tuft', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.479639', '2024-09-01 04:13:46.536527', 1, NULL, '{facial_tuft}', '');
INSERT INTO public.tag_implications VALUES (28, 'zuri', 'inner_ear_fluff', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.663439', '2024-09-01 04:13:46.542513', 1, NULL, '{inner_ear_fluff}', '');
INSERT INTO public.tag_implications VALUES (11, 'zuri', 'cheetah', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.146534', '2024-09-01 04:13:42.110336', 1, NULL, '{cheetah}', '');
INSERT INTO public.tag_implications VALUES (25, 'zuri', 'highlights_(coloring)', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.569759', '2024-09-01 04:13:42.111279', 1, NULL, '{highlights_(coloring)}', '');
INSERT INTO public.tag_implications VALUES (17, 'zuri', 'black_fur', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.327935', '2024-09-01 04:13:42.123983', 1, NULL, '{black_fur}', '');
INSERT INTO public.tag_implications VALUES (12, 'zuri', 'feline', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.178117', '2024-09-01 04:13:46.559444', 1, NULL, '{feline}', '');
INSERT INTO public.tag_implications VALUES (13, 'zuri', 'felis', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.206854', '2024-09-01 04:13:46.597863', 1, NULL, '{felis}', '');
INSERT INTO public.tag_implications VALUES (26, 'zuri', 'industrial_piercing', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.601529', '2024-09-01 04:13:36.230175', 1, NULL, '{industrial_piercing}', '');
INSERT INTO public.tag_implications VALUES (27, 'zuri', 'industrial_piercing_ladder', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.632188', '2024-09-01 04:13:36.240801', 1, NULL, '{industrial_piercing_ladder}', '');
INSERT INTO public.tag_implications VALUES (32, 'zuri', 'spots', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.856577', '2024-09-01 04:13:36.281058', 1, NULL, '{spots}', '');
INSERT INTO public.tag_implications VALUES (21, 'zuri', 'ear_piercing', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.451001', '2024-09-01 04:13:42.322091', 1, NULL, '{ear_piercing}', '');
INSERT INTO public.tag_implications VALUES (31, 'zuri', 'piercing', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.8285', '2024-09-01 04:13:36.41111', 1, NULL, '{piercing}', '');
INSERT INTO public.tag_implications VALUES (33, 'zuri', 'spotted_body', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.884606', '2024-09-01 04:13:42.37633', 1, NULL, '{spotted_body}', '');
INSERT INTO public.tag_implications VALUES (18, 'zuri', 'blonde_highlights', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.363398', '2024-09-01 04:13:42.379263', 1, NULL, '{blonde_highlights}', '');
INSERT INTO public.tag_implications VALUES (29, 'zuri', 'male', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.691462', '2024-09-01 04:13:42.391516', 1, NULL, '{male}', '');
INSERT INTO public.tag_implications VALUES (19, 'zuri', 'cheek_tuft', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.39509', '2024-09-01 04:13:41.827969', 1, NULL, '{cheek_tuft}', '');
INSERT INTO public.tag_implications VALUES (24, 'zuri', 'hair', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.542177', '2024-09-01 04:13:41.844391', 1, NULL, '{hair}', '');
INSERT INTO public.tag_implications VALUES (16, 'zuri', 'black_body', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.295333', '2024-09-01 04:13:41.857706', 1, NULL, '{black_body}', '');
INSERT INTO public.tag_implications VALUES (30, 'zuri', 'markings', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.797564', '2024-09-01 04:13:41.8677', 1, NULL, '{markings}', '');
INSERT INTO public.tag_implications VALUES (37, 'zuri', 'tongue_out', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.994504', '2024-09-01 04:13:36.240059', 1, NULL, '{tongue_out}', '');
INSERT INTO public.tag_implications VALUES (35, 'zuri', 'tail', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.940462', '2024-09-01 04:13:36.261879', 1, NULL, '{tail}', '');
INSERT INTO public.tag_implications VALUES (39, 'zuri', 'white_body', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:20.053537', '2024-09-01 04:13:36.404459', 1, NULL, '{white_body}', '');
INSERT INTO public.tag_implications VALUES (40, 'zuri', 'white_fur', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:20.079946', '2024-09-01 04:13:36.407594', 1, NULL, '{white_fur}', '');
INSERT INTO public.tag_implications VALUES (41, 'serene_form', 'blue_eyes', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:20.106242', '2024-09-01 04:13:41.829561', 1, NULL, '{blue_eyes}', '');
INSERT INTO public.tag_implications VALUES (38, 'zuri', 'tuft', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:20.02431', '2024-09-01 04:13:42.378404', 1, NULL, '{tuft}', '');
INSERT INTO public.tag_implications VALUES (34, 'zuri', 'spotted_fur', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.914249', '2024-09-01 04:13:46.533876', 1, NULL, '{spotted_fur}', '');
INSERT INTO public.tag_implications VALUES (36, 'zuri', 'tongue', 1, '127.0.0.1', NULL, 'active', '2024-09-01 04:13:19.964647', '2024-09-01 04:13:46.558371', 1, NULL, '{tongue}', '');


--
-- Data for Name: tag_rel_undos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tag_type_versions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tag_type_versions VALUES (1, '2024-09-06 00:37:13.611044', '2024-09-06 00:37:13.611044', 0, 1, false, 54, 1);
INSERT INTO public.tag_type_versions VALUES (2, '2024-09-06 00:39:13.446094', '2024-09-06 00:39:13.446094', 0, 5, false, 2, 1);
INSERT INTO public.tag_type_versions VALUES (3, '2024-09-06 00:39:14.5979', '2024-09-06 00:39:14.5979', 0, 5, false, 3, 1);
INSERT INTO public.tag_type_versions VALUES (4, '2024-09-06 00:39:15.27302', '2024-09-06 00:39:15.27302', 0, 5, false, 4, 1);
INSERT INTO public.tag_type_versions VALUES (5, '2024-09-06 00:39:15.985226', '2024-09-06 00:39:15.985226', 0, 5, false, 5, 1);
INSERT INTO public.tag_type_versions VALUES (6, '2024-09-06 00:39:16.714223', '2024-09-06 00:39:16.714223', 0, 5, false, 6, 1);
INSERT INTO public.tag_type_versions VALUES (7, '2024-09-06 00:39:17.482602', '2024-09-06 00:39:17.482602', 0, 5, false, 7, 1);
INSERT INTO public.tag_type_versions VALUES (8, '2024-09-06 00:39:18.172234', '2024-09-06 00:39:18.172234', 0, 5, false, 8, 1);
INSERT INTO public.tag_type_versions VALUES (9, '2024-09-06 00:39:18.85665', '2024-09-06 00:39:18.85665', 0, 5, false, 9, 1);
INSERT INTO public.tag_type_versions VALUES (10, '2024-09-06 00:39:19.526289', '2024-09-06 00:39:19.526289', 0, 4, false, 11, 1);
INSERT INTO public.tag_type_versions VALUES (11, '2024-09-06 00:39:20.149748', '2024-09-06 00:39:20.149748', 0, 5, false, 12, 1);
INSERT INTO public.tag_type_versions VALUES (12, '2024-09-06 00:39:20.856093', '2024-09-06 00:39:20.856093', 0, 5, false, 13, 1);
INSERT INTO public.tag_type_versions VALUES (13, '2024-09-06 00:39:21.546945', '2024-09-06 00:39:21.546945', 0, 5, false, 14, 1);
INSERT INTO public.tag_type_versions VALUES (14, '2024-09-06 00:39:22.186261', '2024-09-06 00:39:22.186261', 0, 5, false, 15, 1);
INSERT INTO public.tag_type_versions VALUES (15, '2024-09-06 00:39:22.821196', '2024-09-06 00:39:22.821196', 0, 4, false, 1, 1);
INSERT INTO public.tag_type_versions VALUES (16, '2024-09-06 00:39:24.11052', '2024-09-06 00:39:24.11052', 0, 7, false, 52, 1);
INSERT INTO public.tag_type_versions VALUES (17, '2024-09-06 00:39:24.740085', '2024-09-06 00:39:24.740085', 0, 7, false, 53, 1);
INSERT INTO public.tag_type_versions VALUES (18, '2024-09-06 00:39:25.437293', '2024-09-06 00:39:25.437293', 0, 4, false, 55, 1);
INSERT INTO public.tag_type_versions VALUES (19, '2024-09-06 00:40:16.342858', '2024-09-06 00:40:16.342858', 0, 4, false, 42, 1);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tags VALUES (45, 'starsie', 0, 1, NULL, NULL, '2024-09-01 04:14:31.233527', '2024-09-01 04:14:31.233527', false);
INSERT INTO public.tags VALUES (2, 'bird', 0, 5, NULL, NULL, '2024-09-01 04:10:03.255948', '2024-09-06 00:39:13.450153', false);
INSERT INTO public.tags VALUES (10, 'white_feathers', 0, 0, NULL, NULL, '2024-09-01 04:10:03.500635', '2024-09-01 04:10:03.500635', false);
INSERT INTO public.tags VALUES (3, 'avian', 0, 5, NULL, NULL, '2024-09-01 04:10:03.305934', '2024-09-06 00:39:14.602', false);
INSERT INTO public.tags VALUES (4, 'corvid', 0, 5, NULL, NULL, '2024-09-01 04:10:03.335303', '2024-09-06 00:39:15.276799', false);
INSERT INTO public.tags VALUES (43, 'blue_eyes', 0, 0, NULL, NULL, '2024-09-01 04:13:16.802333', '2024-09-01 04:13:16.802333', false);
INSERT INTO public.tags VALUES (44, 'starselle', 0, 1, NULL, NULL, '2024-09-01 04:14:23.914524', '2024-09-01 04:14:23.914524', false);
INSERT INTO public.tags VALUES (46, 'chair_position', 0, 0, NULL, NULL, '2024-09-01 04:15:53.979974', '2024-09-01 04:15:53.979974', false);
INSERT INTO public.tags VALUES (5, 'corvus_(genus)', 0, 5, NULL, NULL, '2024-09-01 04:10:03.372608', '2024-09-06 00:39:15.989291', false);
INSERT INTO public.tags VALUES (6, 'crow', 0, 5, NULL, NULL, '2024-09-01 04:10:03.40164', '2024-09-06 00:39:16.719452', false);
INSERT INTO public.tags VALUES (49, 'penetration', 0, 0, NULL, NULL, '2024-09-01 04:15:53.992044', '2024-09-01 04:15:53.992044', false);
INSERT INTO public.tags VALUES (50, 'dominant_bottom', 0, 0, NULL, NULL, '2024-09-01 04:15:53.994002', '2024-09-01 04:15:53.994002', false);
INSERT INTO public.tags VALUES (51, 'blushing', 0, 0, NULL, NULL, '2024-09-01 04:15:53.996135', '2024-09-01 04:15:53.996135', false);
INSERT INTO public.tags VALUES (7, 'oscine', 0, 5, NULL, NULL, '2024-09-01 04:10:03.42197', '2024-09-06 00:39:17.486502', false);
INSERT INTO public.tags VALUES (8, 'passerine', 0, 5, NULL, NULL, '2024-09-01 04:10:03.442101', '2024-09-06 00:39:18.176805', false);
INSERT INTO public.tags VALUES (12, 'felid', 1, 5, NULL, NULL, '2024-09-01 04:13:16.415795', '2024-09-06 00:39:20.154368', false);
INSERT INTO public.tags VALUES (13, 'cheetah', 1, 5, NULL, NULL, '2024-09-01 04:13:16.428936', '2024-09-06 00:39:20.859682', false);
INSERT INTO public.tags VALUES (14, 'feline', 1, 5, NULL, NULL, '2024-09-01 04:13:16.441388', '2024-09-06 00:39:21.550432', false);
INSERT INTO public.tags VALUES (15, 'felis', 1, 5, NULL, NULL, '2024-09-01 04:13:16.453479', '2024-09-06 00:39:22.190237', false);
INSERT INTO public.tags VALUES (1, 'basil', 0, 4, NULL, NULL, '2024-09-01 04:10:03.246774', '2024-09-06 00:39:22.827788', false);
INSERT INTO public.tags VALUES (52, 'hi_res', 0, 7, NULL, NULL, '2024-09-01 04:15:53.99804', '2024-09-06 00:39:24.114902', false);
INSERT INTO public.tags VALUES (42, 'serene_form', 0, 4, NULL, NULL, '2024-09-01 04:13:16.799026', '2024-09-06 00:40:16.346488', false);
INSERT INTO public.tags VALUES (16, 'mammal', 1, 0, NULL, NULL, '2024-09-01 04:13:16.46498', '2024-09-01 04:13:16.46498', false);
INSERT INTO public.tags VALUES (17, 'black_body', 1, 0, NULL, NULL, '2024-09-01 04:13:16.490501', '2024-09-01 04:13:16.490501', false);
INSERT INTO public.tags VALUES (18, 'black_fur', 1, 0, NULL, NULL, '2024-09-01 04:13:16.502694', '2024-09-01 04:13:16.502694', false);
INSERT INTO public.tags VALUES (19, 'blonde_highlights', 1, 0, NULL, NULL, '2024-09-01 04:13:16.514106', '2024-09-01 04:13:16.514106', false);
INSERT INTO public.tags VALUES (20, 'cheek_tuft', 1, 0, NULL, NULL, '2024-09-01 04:13:16.527097', '2024-09-01 04:13:16.527097', false);
INSERT INTO public.tags VALUES (21, 'chest_ruft', 1, 0, NULL, NULL, '2024-09-01 04:13:16.54014', '2024-09-01 04:13:16.54014', false);
INSERT INTO public.tags VALUES (22, 'ear_piercing', 1, 0, NULL, NULL, '2024-09-01 04:13:16.551403', '2024-09-01 04:13:16.551403', false);
INSERT INTO public.tags VALUES (23, 'facial_tuft', 1, 0, NULL, NULL, '2024-09-01 04:13:16.563235', '2024-09-01 04:13:16.563235', false);
INSERT INTO public.tags VALUES (24, 'fur', 1, 0, NULL, NULL, '2024-09-01 04:13:16.58192', '2024-09-01 04:13:16.58192', false);
INSERT INTO public.tags VALUES (25, 'hair', 1, 0, NULL, NULL, '2024-09-01 04:13:16.594606', '2024-09-01 04:13:16.594606', false);
INSERT INTO public.tags VALUES (26, 'highlights_(coloring)', 1, 0, NULL, NULL, '2024-09-01 04:13:16.605708', '2024-09-01 04:13:16.605708', false);
INSERT INTO public.tags VALUES (54, 'keavemind', 1, 1, NULL, NULL, '2024-09-06 00:27:41.378646', '2024-09-06 00:37:13.626836', false);
INSERT INTO public.tags VALUES (53, 'sticker', 1, 7, NULL, NULL, '2024-09-06 00:27:41.365965', '2024-09-06 00:39:24.746397', false);
INSERT INTO public.tags VALUES (55, 'maxwell_speedmew', 1, 4, NULL, NULL, '2024-09-06 00:27:41.381464', '2024-09-06 00:39:25.44084', false);
INSERT INTO public.tags VALUES (27, 'industrial_piercing', 1, 0, NULL, NULL, '2024-09-01 04:13:16.616974', '2024-09-01 04:13:16.616974', false);
INSERT INTO public.tags VALUES (28, 'industrial_piercing_ladder', 1, 0, NULL, NULL, '2024-09-01 04:13:16.628625', '2024-09-01 04:13:16.628625', false);
INSERT INTO public.tags VALUES (29, 'inner_ear_fluff', 1, 0, NULL, NULL, '2024-09-01 04:13:16.640991', '2024-09-01 04:13:16.640991', false);
INSERT INTO public.tags VALUES (31, 'markings', 1, 0, NULL, NULL, '2024-09-01 04:13:16.672714', '2024-09-01 04:13:16.672714', false);
INSERT INTO public.tags VALUES (32, 'piercing', 1, 0, NULL, NULL, '2024-09-01 04:13:16.685807', '2024-09-01 04:13:16.685807', false);
INSERT INTO public.tags VALUES (33, 'spots', 1, 0, NULL, NULL, '2024-09-01 04:13:16.69779', '2024-09-01 04:13:16.69779', false);
INSERT INTO public.tags VALUES (34, 'spotted_body', 1, 0, NULL, NULL, '2024-09-01 04:13:16.708482', '2024-09-01 04:13:16.708482', false);
INSERT INTO public.tags VALUES (35, 'spotted_fur', 1, 0, NULL, NULL, '2024-09-01 04:13:16.720239', '2024-09-01 04:13:16.720239', false);
INSERT INTO public.tags VALUES (36, 'tail', 1, 0, NULL, NULL, '2024-09-01 04:13:16.730176', '2024-09-01 04:13:16.730176', false);
INSERT INTO public.tags VALUES (37, 'tongue', 1, 0, NULL, NULL, '2024-09-01 04:13:16.739602', '2024-09-01 04:13:16.739602', false);
INSERT INTO public.tags VALUES (38, 'tongue_out', 1, 0, NULL, NULL, '2024-09-01 04:13:16.751359', '2024-09-01 04:13:16.751359', false);
INSERT INTO public.tags VALUES (39, 'tuft', 1, 0, NULL, NULL, '2024-09-01 04:13:16.762596', '2024-09-01 04:13:16.762596', false);
INSERT INTO public.tags VALUES (40, 'white_body', 1, 0, NULL, NULL, '2024-09-01 04:13:16.775128', '2024-09-01 04:13:16.775128', false);
INSERT INTO public.tags VALUES (41, 'white_fur', 1, 0, NULL, NULL, '2024-09-01 04:13:16.7874', '2024-09-01 04:13:16.7874', false);
INSERT INTO public.tags VALUES (9, 'anthro', 1, 5, '', '2024-09-06 00:27:21.729611', '2024-09-01 04:10:03.464472', '2024-09-06 00:39:18.862681', false);
INSERT INTO public.tags VALUES (11, 'zuri', 1, 4, '', '2024-09-06 00:27:21.731565', '2024-09-01 04:13:16.410676', '2024-09-06 00:39:19.530088', false);
INSERT INTO public.tags VALUES (48, 'male/male', 1, 0, '', '2024-09-06 00:27:21.722252', '2024-09-01 04:15:53.989977', '2024-09-06 00:27:21.725315', false);
INSERT INTO public.tags VALUES (47, 'duo', 1, 0, '', '2024-09-06 00:27:21.733254', '2024-09-01 04:15:53.987904', '2024-09-06 00:27:21.733987', false);
INSERT INTO public.tags VALUES (30, 'male', 1, 0, '', '2024-09-06 00:27:21.735591', '2024-09-01 04:13:16.655835', '2024-09-06 00:27:21.736115', false);


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.uploads VALUES (2, '', 's', 1, '172.18.0.1', 'male duo male/male anthro sticker keavemind maxwell_speedmew zuri ', 'completed', NULL, 2, NULL, '2024-09-06 00:27:41.190681', '2024-09-06 00:27:41.459018', NULL, '13866433806034495e2e8bc78656047e', 'png', 204196, 512, 512, '');


--
-- Data for Name: wiki_page_versions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.api_keys_id_seq', 1, false);


--
-- Name: artist_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_urls_id_seq', 8, true);


--
-- Name: artist_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_versions_id_seq', 3, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artists_id_seq', 3, true);


--
-- Name: avoid_posting_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.avoid_posting_versions_id_seq', 1, false);


--
-- Name: avoid_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.avoid_postings_id_seq', 1, false);


--
-- Name: bans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bans_id_seq', 1, false);


--
-- Name: blips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blips_id_seq', 1, false);


--
-- Name: bulk_update_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bulk_update_requests_id_seq', 2, true);


--
-- Name: comment_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comment_votes_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: destroyed_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.destroyed_posts_id_seq', 1, true);


--
-- Name: dmail_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dmail_filters_id_seq', 1, false);


--
-- Name: dmails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dmails_id_seq', 1, false);


--
-- Name: edit_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.edit_histories_id_seq', 1, false);


--
-- Name: email_blacklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.email_blacklists_id_seq', 1, false);


--
-- Name: exception_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exception_logs_id_seq', 1, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- Name: forum_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forum_categories_id_seq', 1, true);


--
-- Name: forum_post_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forum_post_votes_id_seq', 1, false);


--
-- Name: forum_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forum_posts_id_seq', 1, false);


--
-- Name: forum_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forum_subscriptions_id_seq', 1, false);


--
-- Name: forum_topic_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forum_topic_visits_id_seq', 1, false);


--
-- Name: forum_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forum_topics_id_seq', 1, false);


--
-- Name: help_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.help_pages_id_seq', 1, false);


--
-- Name: ip_bans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ip_bans_id_seq', 1, false);


--
-- Name: mascots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mascots_id_seq', 1, true);


--
-- Name: mod_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mod_actions_id_seq', 125, true);


--
-- Name: news_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_updates_id_seq', 1, false);


--
-- Name: note_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.note_versions_id_seq', 1, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- Name: pool_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pool_versions_id_seq', 1, false);


--
-- Name: pools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pools_id_seq', 1, false);


--
-- Name: post_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_approvals_id_seq', 1, false);


--
-- Name: post_disapprovals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_disapprovals_id_seq', 1, false);


--
-- Name: post_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_events_id_seq', 1, true);


--
-- Name: post_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_flags_id_seq', 1, false);


--
-- Name: post_replacements2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_replacements2_id_seq', 1, false);


--
-- Name: post_report_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_report_reasons_id_seq', 1, false);


--
-- Name: post_set_maintainers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_set_maintainers_id_seq', 1, false);


--
-- Name: post_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_sets_id_seq', 1, false);


--
-- Name: post_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_versions_id_seq', 2, true);


--
-- Name: post_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_votes_id_seq', 1, false);


--
-- Name: posts_change_seq_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_change_seq_seq', 2, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 2, true);


--
-- Name: staff_audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.staff_audit_logs_id_seq', 1, false);


--
-- Name: staff_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.staff_notes_id_seq', 1, false);


--
-- Name: tag_aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_aliases_id_seq', 1, false);


--
-- Name: tag_implications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_implications_id_seq', 41, true);


--
-- Name: tag_rel_undos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_rel_undos_id_seq', 1, false);


--
-- Name: tag_type_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_type_versions_id_seq', 19, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 55, true);


--
-- Name: takedowns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.takedowns_id_seq', 1, false);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- Name: upload_whitelists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_whitelists_id_seq', 1, true);


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.uploads_id_seq', 2, true);


--
-- Name: user_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_feedback_id_seq', 1, false);


--
-- Name: user_name_change_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_name_change_requests_id_seq', 1, false);


--
-- Name: user_password_reset_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_password_reset_nonces_id_seq', 1, false);


--
-- Name: user_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_statuses_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: wiki_page_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wiki_page_versions_id_seq', 1, false);


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

