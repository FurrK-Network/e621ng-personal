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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: posts_trigger_change_seq(); Type: FUNCTION; Schema: public; Owner: e621
--

CREATE FUNCTION public.posts_trigger_change_seq() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.tag_string != OLD.tag_string OR NEW.parent_id != OLD.parent_id OR NEW.source != OLD.source OR NEW.approver_id != OLD.approver_id OR NEW.rating != OLD.rating OR NEW.description != OLD.description OR NEW.md5 != OLD.md5 OR NEW.is_deleted != OLD.is_deleted OR NEW.is_pending != OLD.is_pending OR NEW.is_flagged != OLD.is_flagged OR NEW.is_rating_locked != OLD.is_rating_locked OR NEW.is_status_locked != OLD.is_status_locked OR NEW.is_note_locked != OLD.is_note_locked OR NEW.bit_flags != OLD.bit_flags OR NEW.has_active_children != OLD.has_active_children OR NEW.last_noted_at != OLD.last_noted_at
  THEN
     NEW.change_seq = nextval('public.posts_change_seq_seq');
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.posts_trigger_change_seq() OWNER TO e621;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.api_keys (
    id integer NOT NULL,
    user_id integer NOT NULL,
    key character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.api_keys OWNER TO e621;

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.api_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_keys_id_seq OWNER TO e621;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.api_keys_id_seq OWNED BY public.api_keys.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO e621;

--
-- Name: artist_urls; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.artist_urls (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    url text NOT NULL,
    normalized_url text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.artist_urls OWNER TO e621;

--
-- Name: artist_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.artist_urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artist_urls_id_seq OWNER TO e621;

--
-- Name: artist_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.artist_urls_id_seq OWNED BY public.artist_urls.id;


--
-- Name: artist_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.artist_versions (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    name character varying NOT NULL,
    updater_id integer NOT NULL,
    updater_ip_addr inet NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    group_name character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    other_names text[] DEFAULT '{}'::text[] NOT NULL,
    urls text[] DEFAULT '{}'::text[] NOT NULL,
    notes_changed boolean DEFAULT false
);


ALTER TABLE public.artist_versions OWNER TO e621;

--
-- Name: artist_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.artist_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artist_versions_id_seq OWNER TO e621;

--
-- Name: artist_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.artist_versions_id_seq OWNED BY public.artist_versions.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying NOT NULL,
    creator_id integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    group_name character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    other_names text[] DEFAULT '{}'::text[] NOT NULL,
    linked_user_id integer,
    is_locked boolean DEFAULT false
);


ALTER TABLE public.artists OWNER TO e621;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO e621;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: avoid_posting_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.avoid_posting_versions (
    id bigint NOT NULL,
    updater_id bigint NOT NULL,
    avoid_posting_id bigint NOT NULL,
    updater_ip_addr inet NOT NULL,
    details character varying DEFAULT ''::character varying NOT NULL,
    staff_notes character varying DEFAULT ''::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.avoid_posting_versions OWNER TO e621;

--
-- Name: avoid_posting_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.avoid_posting_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avoid_posting_versions_id_seq OWNER TO e621;

--
-- Name: avoid_posting_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.avoid_posting_versions_id_seq OWNED BY public.avoid_posting_versions.id;


--
-- Name: avoid_postings; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.avoid_postings (
    id bigint NOT NULL,
    creator_id bigint NOT NULL,
    updater_id bigint NOT NULL,
    artist_id bigint NOT NULL,
    creator_ip_addr inet NOT NULL,
    updater_ip_addr inet NOT NULL,
    details character varying DEFAULT ''::character varying NOT NULL,
    staff_notes character varying DEFAULT ''::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.avoid_postings OWNER TO e621;

--
-- Name: avoid_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.avoid_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avoid_postings_id_seq OWNER TO e621;

--
-- Name: avoid_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.avoid_postings_id_seq OWNED BY public.avoid_postings.id;


--
-- Name: bans; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.bans (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reason text NOT NULL,
    banner_id integer NOT NULL,
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bans OWNER TO e621;

--
-- Name: bans_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.bans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bans_id_seq OWNER TO e621;

--
-- Name: bans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.bans_id_seq OWNED BY public.bans.id;


--
-- Name: blips; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.blips (
    id bigint NOT NULL,
    creator_ip_addr inet NOT NULL,
    creator_id integer NOT NULL,
    body character varying NOT NULL,
    response_to integer,
    is_hidden boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    warning_type integer,
    warning_user_id integer,
    updater_id integer
);


ALTER TABLE public.blips OWNER TO e621;

--
-- Name: blips_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.blips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blips_id_seq OWNER TO e621;

--
-- Name: blips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.blips_id_seq OWNED BY public.blips.id;


--
-- Name: bulk_update_requests; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.bulk_update_requests (
    id integer NOT NULL,
    user_id integer NOT NULL,
    forum_topic_id integer,
    script text NOT NULL,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    approver_id integer,
    forum_post_id integer,
    title text,
    user_ip_addr inet DEFAULT '127.0.0.1'::inet NOT NULL
);


ALTER TABLE public.bulk_update_requests OWNER TO e621;

--
-- Name: bulk_update_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.bulk_update_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bulk_update_requests_id_seq OWNER TO e621;

--
-- Name: bulk_update_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.bulk_update_requests_id_seq OWNED BY public.bulk_update_requests.id;


--
-- Name: comment_votes; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.comment_votes (
    id integer NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL,
    score integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_ip_addr inet
);


ALTER TABLE public.comment_votes OWNER TO e621;

--
-- Name: comment_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.comment_votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_votes_id_seq OWNER TO e621;

--
-- Name: comment_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.comment_votes_id_seq OWNED BY public.comment_votes.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    creator_id integer NOT NULL,
    body text NOT NULL,
    creator_ip_addr inet NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    updater_id integer,
    updater_ip_addr inet,
    do_not_bump_post boolean DEFAULT false NOT NULL,
    is_hidden boolean DEFAULT false NOT NULL,
    is_sticky boolean DEFAULT false NOT NULL,
    warning_type integer,
    warning_user_id integer
);


ALTER TABLE public.comments OWNER TO e621;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO e621;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: destroyed_posts; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.destroyed_posts (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    md5 character varying NOT NULL,
    destroyer_id integer NOT NULL,
    destroyer_ip_addr inet NOT NULL,
    uploader_id integer,
    uploader_ip_addr inet,
    upload_date timestamp without time zone,
    post_data json NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reason character varying DEFAULT ''::character varying NOT NULL,
    notify boolean DEFAULT true NOT NULL
);


ALTER TABLE public.destroyed_posts OWNER TO e621;

--
-- Name: destroyed_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.destroyed_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destroyed_posts_id_seq OWNER TO e621;

--
-- Name: destroyed_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.destroyed_posts_id_seq OWNED BY public.destroyed_posts.id;


--
-- Name: dmail_filters; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.dmail_filters (
    id integer NOT NULL,
    user_id integer NOT NULL,
    words text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dmail_filters OWNER TO e621;

--
-- Name: dmail_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.dmail_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmail_filters_id_seq OWNER TO e621;

--
-- Name: dmail_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.dmail_filters_id_seq OWNED BY public.dmail_filters.id;


--
-- Name: dmails; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.dmails (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    from_id integer NOT NULL,
    to_id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    creator_ip_addr inet NOT NULL
);


ALTER TABLE public.dmails OWNER TO e621;

--
-- Name: dmails_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.dmails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmails_id_seq OWNER TO e621;

--
-- Name: dmails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.dmails_id_seq OWNED BY public.dmails.id;


--
-- Name: edit_histories; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.edit_histories (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body text NOT NULL,
    subject text,
    versionable_type character varying(100) NOT NULL,
    versionable_id integer NOT NULL,
    version integer NOT NULL,
    ip_addr inet NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.edit_histories OWNER TO e621;

--
-- Name: edit_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.edit_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edit_histories_id_seq OWNER TO e621;

--
-- Name: edit_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.edit_histories_id_seq OWNED BY public.edit_histories.id;


--
-- Name: email_blacklists; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.email_blacklists (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    domain character varying NOT NULL,
    creator_id integer NOT NULL,
    reason character varying NOT NULL
);


ALTER TABLE public.email_blacklists OWNER TO e621;

--
-- Name: email_blacklists_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.email_blacklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_blacklists_id_seq OWNER TO e621;

--
-- Name: email_blacklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.email_blacklists_id_seq OWNED BY public.email_blacklists.id;


--
-- Name: exception_logs; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.exception_logs (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    class_name character varying NOT NULL,
    ip_addr inet NOT NULL,
    version character varying NOT NULL,
    extra_params text,
    message text NOT NULL,
    trace text NOT NULL,
    code uuid NOT NULL,
    user_id integer
);


ALTER TABLE public.exception_logs OWNER TO e621;

--
-- Name: exception_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.exception_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_logs_id_seq OWNER TO e621;

--
-- Name: exception_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.exception_logs_id_seq OWNED BY public.exception_logs.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.favorites OWNER TO e621;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO e621;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: forum_categories; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.forum_categories (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    cat_order integer,
    can_view integer DEFAULT 20 NOT NULL,
    can_create integer DEFAULT 20 NOT NULL,
    can_reply integer DEFAULT 20 NOT NULL
);


ALTER TABLE public.forum_categories OWNER TO e621;

--
-- Name: forum_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.forum_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_categories_id_seq OWNER TO e621;

--
-- Name: forum_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.forum_categories_id_seq OWNED BY public.forum_categories.id;


--
-- Name: forum_post_votes; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.forum_post_votes (
    id bigint NOT NULL,
    forum_post_id integer NOT NULL,
    creator_id integer NOT NULL,
    score integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.forum_post_votes OWNER TO e621;

--
-- Name: forum_post_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.forum_post_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_post_votes_id_seq OWNER TO e621;

--
-- Name: forum_post_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.forum_post_votes_id_seq OWNED BY public.forum_post_votes.id;


--
-- Name: forum_posts; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.forum_posts (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    creator_id integer NOT NULL,
    updater_id integer NOT NULL,
    body text NOT NULL,
    is_hidden boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    creator_ip_addr inet,
    warning_type integer,
    warning_user_id integer
);


ALTER TABLE public.forum_posts OWNER TO e621;

--
-- Name: forum_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.forum_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_posts_id_seq OWNER TO e621;

--
-- Name: forum_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.forum_posts_id_seq OWNED BY public.forum_posts.id;


--
-- Name: forum_subscriptions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.forum_subscriptions (
    id integer NOT NULL,
    user_id integer,
    forum_topic_id integer,
    last_read_at timestamp without time zone,
    delete_key character varying
);


ALTER TABLE public.forum_subscriptions OWNER TO e621;

--
-- Name: forum_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.forum_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_subscriptions_id_seq OWNER TO e621;

--
-- Name: forum_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.forum_subscriptions_id_seq OWNED BY public.forum_subscriptions.id;


--
-- Name: forum_topic_visits; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.forum_topic_visits (
    id integer NOT NULL,
    user_id integer,
    forum_topic_id integer,
    last_read_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.forum_topic_visits OWNER TO e621;

--
-- Name: forum_topic_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.forum_topic_visits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_topic_visits_id_seq OWNER TO e621;

--
-- Name: forum_topic_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.forum_topic_visits_id_seq OWNED BY public.forum_topic_visits.id;


--
-- Name: forum_topics; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.forum_topics (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    updater_id integer NOT NULL,
    title character varying NOT NULL,
    response_count integer DEFAULT 0 NOT NULL,
    is_sticky boolean DEFAULT false NOT NULL,
    is_locked boolean DEFAULT false NOT NULL,
    is_hidden boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    creator_ip_addr inet NOT NULL
);


ALTER TABLE public.forum_topics OWNER TO e621;

--
-- Name: forum_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.forum_topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_topics_id_seq OWNER TO e621;

--
-- Name: forum_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.forum_topics_id_seq OWNED BY public.forum_topics.id;


--
-- Name: help_pages; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.help_pages (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying NOT NULL,
    wiki_page character varying NOT NULL,
    related character varying DEFAULT ''::character varying NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.help_pages OWNER TO e621;

--
-- Name: help_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.help_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.help_pages_id_seq OWNER TO e621;

--
-- Name: help_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.help_pages_id_seq OWNED BY public.help_pages.id;


--
-- Name: ip_bans; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.ip_bans (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    ip_addr inet NOT NULL,
    reason text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ip_bans OWNER TO e621;

--
-- Name: ip_bans_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.ip_bans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ip_bans_id_seq OWNER TO e621;

--
-- Name: ip_bans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.ip_bans_id_seq OWNED BY public.ip_bans.id;


--
-- Name: mascots; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.mascots (
    id bigint NOT NULL,
    creator_id bigint NOT NULL,
    display_name character varying NOT NULL,
    md5 character varying NOT NULL,
    file_ext character varying NOT NULL,
    background_color character varying NOT NULL,
    artist_url character varying NOT NULL,
    artist_name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    available_on character varying[] DEFAULT '{}'::character varying[] NOT NULL
);


ALTER TABLE public.mascots OWNER TO e621;

--
-- Name: mascots_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.mascots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mascots_id_seq OWNER TO e621;

--
-- Name: mascots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.mascots_id_seq OWNED BY public.mascots.id;


--
-- Name: mod_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.mod_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mod_actions_id_seq OWNER TO e621;

--
-- Name: mod_actions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.mod_actions (
    id integer DEFAULT nextval('public.mod_actions_id_seq'::regclass) NOT NULL,
    creator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    action text,
    "values" json
);


ALTER TABLE public.mod_actions OWNER TO e621;

--
-- Name: news_updates; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.news_updates (
    id integer NOT NULL,
    message text NOT NULL,
    creator_id integer NOT NULL,
    updater_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.news_updates OWNER TO e621;

--
-- Name: news_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.news_updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_updates_id_seq OWNER TO e621;

--
-- Name: news_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.news_updates_id_seq OWNED BY public.news_updates.id;


--
-- Name: note_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.note_versions (
    id integer NOT NULL,
    note_id integer NOT NULL,
    post_id integer NOT NULL,
    updater_id integer NOT NULL,
    updater_ip_addr inet NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.note_versions OWNER TO e621;

--
-- Name: note_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.note_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_versions_id_seq OWNER TO e621;

--
-- Name: note_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.note_versions_id_seq OWNED BY public.note_versions.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    post_id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.notes OWNER TO e621;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO e621;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: pool_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.pool_versions (
    id bigint NOT NULL,
    pool_id integer NOT NULL,
    post_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    added_post_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    removed_post_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    updater_id integer,
    updater_ip_addr inet,
    description text,
    description_changed boolean DEFAULT false NOT NULL,
    name text,
    name_changed boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    category character varying,
    version integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.pool_versions OWNER TO e621;

--
-- Name: pool_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.pool_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pool_versions_id_seq OWNER TO e621;

--
-- Name: pool_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.pool_versions_id_seq OWNED BY public.pool_versions.id;


--
-- Name: pools; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.pools (
    id integer NOT NULL,
    name character varying NOT NULL,
    creator_id integer NOT NULL,
    description text,
    is_active boolean DEFAULT true NOT NULL,
    post_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category character varying DEFAULT 'series'::character varying NOT NULL
);


ALTER TABLE public.pools OWNER TO e621;

--
-- Name: pools_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.pools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pools_id_seq OWNER TO e621;

--
-- Name: pools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.pools_id_seq OWNED BY public.pools.id;


--
-- Name: post_approvals; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_approvals (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.post_approvals OWNER TO e621;

--
-- Name: post_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_approvals_id_seq OWNER TO e621;

--
-- Name: post_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_approvals_id_seq OWNED BY public.post_approvals.id;


--
-- Name: post_disapprovals; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_disapprovals (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    reason character varying DEFAULT 'legacy'::character varying,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.post_disapprovals OWNER TO e621;

--
-- Name: post_disapprovals_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_disapprovals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_disapprovals_id_seq OWNER TO e621;

--
-- Name: post_disapprovals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_disapprovals_id_seq OWNED BY public.post_disapprovals.id;


--
-- Name: post_events; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_events (
    id bigint NOT NULL,
    creator_id bigint NOT NULL,
    post_id bigint NOT NULL,
    action integer NOT NULL,
    extra_data jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.post_events OWNER TO e621;

--
-- Name: post_events_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_events_id_seq OWNER TO e621;

--
-- Name: post_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_events_id_seq OWNED BY public.post_events.id;


--
-- Name: post_flags; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_flags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet NOT NULL,
    reason text,
    is_resolved boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deletion boolean DEFAULT false NOT NULL
);


ALTER TABLE public.post_flags OWNER TO e621;

--
-- Name: post_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_flags_id_seq OWNER TO e621;

--
-- Name: post_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_flags_id_seq OWNED BY public.post_flags.id;


--
-- Name: post_replacements2; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_replacements2 (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    post_id integer NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet NOT NULL,
    approver_id integer,
    file_ext character varying NOT NULL,
    file_size integer NOT NULL,
    image_height integer NOT NULL,
    image_width integer NOT NULL,
    md5 character varying NOT NULL,
    source character varying,
    file_name character varying,
    storage_id character varying NOT NULL,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    reason character varying NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    uploader_id_on_approve integer,
    penalize_uploader_on_approve boolean
);


ALTER TABLE public.post_replacements2 OWNER TO e621;

--
-- Name: post_replacements2_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_replacements2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_replacements2_id_seq OWNER TO e621;

--
-- Name: post_replacements2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_replacements2_id_seq OWNED BY public.post_replacements2.id;


--
-- Name: post_report_reasons; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_report_reasons (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reason character varying NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet,
    description character varying NOT NULL
);


ALTER TABLE public.post_report_reasons OWNER TO e621;

--
-- Name: post_report_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_report_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_report_reasons_id_seq OWNER TO e621;

--
-- Name: post_report_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_report_reasons_id_seq OWNED BY public.post_report_reasons.id;


--
-- Name: post_set_maintainers; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_set_maintainers (
    id bigint NOT NULL,
    post_set_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.post_set_maintainers OWNER TO e621;

--
-- Name: post_set_maintainers_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_set_maintainers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_set_maintainers_id_seq OWNER TO e621;

--
-- Name: post_set_maintainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_set_maintainers_id_seq OWNED BY public.post_set_maintainers.id;


--
-- Name: post_sets; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_sets (
    id bigint NOT NULL,
    name character varying NOT NULL,
    shortname character varying NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    transfer_on_delete boolean DEFAULT false NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet,
    post_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    post_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.post_sets OWNER TO e621;

--
-- Name: post_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_sets_id_seq OWNER TO e621;

--
-- Name: post_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_sets_id_seq OWNED BY public.post_sets.id;


--
-- Name: post_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_versions (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    tags text NOT NULL,
    added_tags text[] DEFAULT '{}'::text[] NOT NULL,
    removed_tags text[] DEFAULT '{}'::text[] NOT NULL,
    locked_tags text,
    added_locked_tags text[] DEFAULT '{}'::text[] NOT NULL,
    removed_locked_tags text[] DEFAULT '{}'::text[] NOT NULL,
    updater_id integer,
    updater_ip_addr inet NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rating character varying(1),
    rating_changed boolean DEFAULT false NOT NULL,
    parent_id integer,
    parent_changed boolean DEFAULT false NOT NULL,
    source text,
    source_changed boolean DEFAULT false NOT NULL,
    description text,
    description_changed boolean DEFAULT false NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    reason character varying
);


ALTER TABLE public.post_versions OWNER TO e621;

--
-- Name: post_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_versions_id_seq OWNER TO e621;

--
-- Name: post_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_versions_id_seq OWNED BY public.post_versions.id;


--
-- Name: post_votes; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.post_votes (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    score integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_ip_addr inet
);


ALTER TABLE public.post_votes OWNER TO e621;

--
-- Name: post_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.post_votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_votes_id_seq OWNER TO e621;

--
-- Name: post_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.post_votes_id_seq OWNED BY public.post_votes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    up_score integer DEFAULT 0 NOT NULL,
    down_score integer DEFAULT 0 NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    source character varying NOT NULL,
    md5 character varying NOT NULL,
    rating character(1) DEFAULT 'q'::bpchar NOT NULL,
    is_note_locked boolean DEFAULT false NOT NULL,
    is_rating_locked boolean DEFAULT false NOT NULL,
    is_status_locked boolean DEFAULT false NOT NULL,
    is_pending boolean DEFAULT false NOT NULL,
    is_flagged boolean DEFAULT false NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    uploader_id integer NOT NULL,
    uploader_ip_addr inet NOT NULL,
    approver_id integer,
    fav_string text DEFAULT ''::text NOT NULL,
    pool_string text DEFAULT ''::text NOT NULL,
    last_noted_at timestamp without time zone,
    last_comment_bumped_at timestamp without time zone,
    fav_count integer DEFAULT 0 NOT NULL,
    tag_string text DEFAULT ''::text NOT NULL,
    tag_count integer DEFAULT 0 NOT NULL,
    tag_count_general integer DEFAULT 0 NOT NULL,
    tag_count_artist integer DEFAULT 0 NOT NULL,
    tag_count_character integer DEFAULT 0 NOT NULL,
    tag_count_copyright integer DEFAULT 0 NOT NULL,
    file_ext character varying NOT NULL,
    file_size integer NOT NULL,
    image_width integer NOT NULL,
    image_height integer NOT NULL,
    parent_id integer,
    has_children boolean DEFAULT false NOT NULL,
    last_commented_at timestamp without time zone,
    has_active_children boolean DEFAULT false NOT NULL,
    bit_flags bigint DEFAULT 0 NOT NULL,
    tag_count_meta integer DEFAULT 0 NOT NULL,
    locked_tags text,
    tag_count_species integer DEFAULT 0 NOT NULL,
    tag_count_invalid integer DEFAULT 0 NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    comment_count integer DEFAULT 0 NOT NULL,
    change_seq bigint NOT NULL,
    tag_count_lore integer DEFAULT 0 NOT NULL,
    bg_color character varying,
    generated_samples character varying[],
    duration numeric,
    is_comment_disabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.posts OWNER TO e621;

--
-- Name: posts_change_seq_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.posts_change_seq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_change_seq_seq OWNER TO e621;

--
-- Name: posts_change_seq_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.posts_change_seq_seq OWNED BY public.posts.change_seq;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO e621;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO e621;

--
-- Name: staff_audit_logs; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.staff_audit_logs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL,
    action character varying DEFAULT 'unknown_action'::character varying NOT NULL,
    "values" json
);


ALTER TABLE public.staff_audit_logs OWNER TO e621;

--
-- Name: staff_audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.staff_audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_audit_logs_id_seq OWNER TO e621;

--
-- Name: staff_audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.staff_audit_logs_id_seq OWNED BY public.staff_audit_logs.id;


--
-- Name: staff_notes; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.staff_notes (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL,
    creator_id integer NOT NULL,
    body character varying,
    resolved boolean DEFAULT false NOT NULL
);


ALTER TABLE public.staff_notes OWNER TO e621;

--
-- Name: staff_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.staff_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_notes_id_seq OWNER TO e621;

--
-- Name: staff_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.staff_notes_id_seq OWNED BY public.staff_notes.id;


--
-- Name: tag_aliases; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.tag_aliases (
    id integer NOT NULL,
    antecedent_name character varying NOT NULL,
    consequent_name character varying NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet NOT NULL,
    forum_topic_id integer,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    post_count integer DEFAULT 0 NOT NULL,
    approver_id integer,
    forum_post_id integer,
    reason text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.tag_aliases OWNER TO e621;

--
-- Name: tag_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.tag_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_aliases_id_seq OWNER TO e621;

--
-- Name: tag_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.tag_aliases_id_seq OWNED BY public.tag_aliases.id;


--
-- Name: tag_implications; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.tag_implications (
    id integer NOT NULL,
    antecedent_name character varying NOT NULL,
    consequent_name character varying NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet NOT NULL,
    forum_topic_id integer,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    approver_id integer,
    forum_post_id integer,
    descendant_names text[] DEFAULT '{}'::text[],
    reason text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.tag_implications OWNER TO e621;

--
-- Name: tag_implications_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.tag_implications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_implications_id_seq OWNER TO e621;

--
-- Name: tag_implications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.tag_implications_id_seq OWNED BY public.tag_implications.id;


--
-- Name: tag_rel_undos; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.tag_rel_undos (
    id bigint NOT NULL,
    tag_rel_type character varying,
    tag_rel_id bigint,
    undo_data json,
    applied boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tag_rel_undos OWNER TO e621;

--
-- Name: tag_rel_undos_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.tag_rel_undos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_rel_undos_id_seq OWNER TO e621;

--
-- Name: tag_rel_undos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.tag_rel_undos_id_seq OWNED BY public.tag_rel_undos.id;


--
-- Name: tag_type_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.tag_type_versions (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    old_type integer NOT NULL,
    new_type integer NOT NULL,
    is_locked boolean NOT NULL,
    tag_id integer NOT NULL,
    creator_id integer NOT NULL
);


ALTER TABLE public.tag_type_versions OWNER TO e621;

--
-- Name: tag_type_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.tag_type_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_type_versions_id_seq OWNER TO e621;

--
-- Name: tag_type_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.tag_type_versions_id_seq OWNED BY public.tag_type_versions.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying NOT NULL,
    post_count integer DEFAULT 0 NOT NULL,
    category smallint DEFAULT 0 NOT NULL,
    related_tags text,
    related_tags_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_locked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tags OWNER TO e621;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO e621;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: takedowns; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.takedowns (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    creator_id integer,
    creator_ip_addr inet NOT NULL,
    approver_id integer,
    status character varying DEFAULT 'pending'::character varying,
    vericode character varying NOT NULL,
    source character varying,
    email character varying,
    reason text,
    reason_hidden boolean DEFAULT false NOT NULL,
    notes text DEFAULT 'none'::text NOT NULL,
    instructions text,
    post_ids text DEFAULT ''::text,
    del_post_ids text DEFAULT ''::text,
    post_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.takedowns OWNER TO e621;

--
-- Name: takedowns_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.takedowns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.takedowns_id_seq OWNER TO e621;

--
-- Name: takedowns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.takedowns_id_seq OWNED BY public.takedowns.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    creator_id integer NOT NULL,
    creator_ip_addr inet NOT NULL,
    disp_id integer NOT NULL,
    qtype character varying NOT NULL,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    reason character varying,
    report_reason character varying,
    response character varying DEFAULT ''::character varying NOT NULL,
    handler_id integer DEFAULT 0 NOT NULL,
    claimant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    accused_id integer
);


ALTER TABLE public.tickets OWNER TO e621;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO e621;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: upload_whitelists; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.upload_whitelists (
    id bigint NOT NULL,
    pattern character varying NOT NULL,
    note character varying,
    reason character varying,
    allowed boolean DEFAULT true NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.upload_whitelists OWNER TO e621;

--
-- Name: upload_whitelists_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.upload_whitelists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_whitelists_id_seq OWNER TO e621;

--
-- Name: upload_whitelists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.upload_whitelists_id_seq OWNED BY public.upload_whitelists.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.uploads (
    id integer NOT NULL,
    source text,
    rating character(1) NOT NULL,
    uploader_id integer NOT NULL,
    uploader_ip_addr inet NOT NULL,
    tag_string text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    backtrace text,
    post_id integer,
    md5_confirmation character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_id integer,
    md5 character varying,
    file_ext character varying,
    file_size integer,
    image_width integer,
    image_height integer,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.uploads OWNER TO e621;

--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.uploads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploads_id_seq OWNER TO e621;

--
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.uploads_id_seq OWNED BY public.uploads.id;


--
-- Name: user_feedback; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.user_feedback (
    id integer NOT NULL,
    user_id integer NOT NULL,
    creator_id integer NOT NULL,
    category character varying NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    creator_ip_addr inet,
    updater_id integer,
    is_deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.user_feedback OWNER TO e621;

--
-- Name: user_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.user_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_feedback_id_seq OWNER TO e621;

--
-- Name: user_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.user_feedback_id_seq OWNED BY public.user_feedback.id;


--
-- Name: user_name_change_requests; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.user_name_change_requests (
    id integer NOT NULL,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    user_id integer NOT NULL,
    approver_id integer,
    original_name character varying,
    desired_name character varying,
    change_reason text,
    rejection_reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_name_change_requests OWNER TO e621;

--
-- Name: user_name_change_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.user_name_change_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_name_change_requests_id_seq OWNER TO e621;

--
-- Name: user_name_change_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.user_name_change_requests_id_seq OWNED BY public.user_name_change_requests.id;


--
-- Name: user_password_reset_nonces; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.user_password_reset_nonces (
    id integer NOT NULL,
    key character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_password_reset_nonces OWNER TO e621;

--
-- Name: user_password_reset_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.user_password_reset_nonces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_password_reset_nonces_id_seq OWNER TO e621;

--
-- Name: user_password_reset_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.user_password_reset_nonces_id_seq OWNED BY public.user_password_reset_nonces.id;


--
-- Name: user_statuses; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.user_statuses (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    post_count integer DEFAULT 0 NOT NULL,
    post_deleted_count integer DEFAULT 0 NOT NULL,
    post_update_count integer DEFAULT 0 NOT NULL,
    post_flag_count integer DEFAULT 0 NOT NULL,
    favorite_count integer DEFAULT 0 NOT NULL,
    wiki_edit_count integer DEFAULT 0 NOT NULL,
    note_count integer DEFAULT 0 NOT NULL,
    forum_post_count integer DEFAULT 0 NOT NULL,
    comment_count integer DEFAULT 0 NOT NULL,
    pool_edit_count integer DEFAULT 0 NOT NULL,
    blip_count integer DEFAULT 0 NOT NULL,
    set_count integer DEFAULT 0 NOT NULL,
    artist_edit_count integer DEFAULT 0 NOT NULL,
    own_post_replaced_count integer DEFAULT 0,
    own_post_replaced_penalize_count integer DEFAULT 0,
    post_replacement_rejected_count integer DEFAULT 0,
    ticket_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_statuses OWNER TO e621;

--
-- Name: user_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.user_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_statuses_id_seq OWNER TO e621;

--
-- Name: user_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.user_statuses_id_seq OWNED BY public.user_statuses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    name character varying NOT NULL,
    password_hash character varying NOT NULL,
    email character varying,
    email_verification_key character varying,
    level integer DEFAULT 20 NOT NULL,
    base_upload_limit integer DEFAULT 10 NOT NULL,
    last_logged_in_at timestamp without time zone,
    last_forum_read_at timestamp without time zone,
    recent_tags text,
    comment_threshold integer DEFAULT '-2'::integer NOT NULL,
    default_image_size character varying DEFAULT 'large'::character varying NOT NULL,
    favorite_tags text,
    blacklisted_tags text DEFAULT 'spoilers
guro
scat
furry -rating:s'::text,
    time_zone character varying DEFAULT 'Eastern Time (US & Canada)'::character varying NOT NULL,
    bcrypt_password_hash text,
    per_page integer DEFAULT 75 NOT NULL,
    custom_style text,
    bit_prefs bigint DEFAULT 0 NOT NULL,
    last_ip_addr inet,
    unread_dmail_count integer DEFAULT 0 NOT NULL,
    profile_about text DEFAULT ''::text NOT NULL,
    profile_artinfo text DEFAULT ''::text NOT NULL,
    avatar_id integer
);


ALTER TABLE public.users OWNER TO e621;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO e621;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wiki_page_versions; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.wiki_page_versions (
    id integer NOT NULL,
    wiki_page_id integer NOT NULL,
    updater_id integer NOT NULL,
    updater_ip_addr inet NOT NULL,
    title character varying NOT NULL,
    body text NOT NULL,
    is_locked boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    other_names text[] DEFAULT '{}'::text[] NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    reason character varying,
    parent character varying
);


ALTER TABLE public.wiki_page_versions OWNER TO e621;

--
-- Name: wiki_page_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.wiki_page_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_page_versions_id_seq OWNER TO e621;

--
-- Name: wiki_page_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.wiki_page_versions_id_seq OWNED BY public.wiki_page_versions.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: e621
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    title character varying NOT NULL,
    body text NOT NULL,
    is_locked boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    updater_id integer,
    other_names text[] DEFAULT '{}'::text[] NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    parent character varying
);


ALTER TABLE public.wiki_pages OWNER TO e621;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: e621
--

CREATE SEQUENCE public.wiki_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO e621;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e621
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- Name: api_keys id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.api_keys ALTER COLUMN id SET DEFAULT nextval('public.api_keys_id_seq'::regclass);


--
-- Name: artist_urls id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.artist_urls ALTER COLUMN id SET DEFAULT nextval('public.artist_urls_id_seq'::regclass);


--
-- Name: artist_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.artist_versions ALTER COLUMN id SET DEFAULT nextval('public.artist_versions_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: avoid_posting_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_posting_versions ALTER COLUMN id SET DEFAULT nextval('public.avoid_posting_versions_id_seq'::regclass);


--
-- Name: avoid_postings id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_postings ALTER COLUMN id SET DEFAULT nextval('public.avoid_postings_id_seq'::regclass);


--
-- Name: bans id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.bans ALTER COLUMN id SET DEFAULT nextval('public.bans_id_seq'::regclass);


--
-- Name: blips id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.blips ALTER COLUMN id SET DEFAULT nextval('public.blips_id_seq'::regclass);


--
-- Name: bulk_update_requests id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.bulk_update_requests ALTER COLUMN id SET DEFAULT nextval('public.bulk_update_requests_id_seq'::regclass);


--
-- Name: comment_votes id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.comment_votes ALTER COLUMN id SET DEFAULT nextval('public.comment_votes_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: destroyed_posts id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.destroyed_posts ALTER COLUMN id SET DEFAULT nextval('public.destroyed_posts_id_seq'::regclass);


--
-- Name: dmail_filters id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.dmail_filters ALTER COLUMN id SET DEFAULT nextval('public.dmail_filters_id_seq'::regclass);


--
-- Name: dmails id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.dmails ALTER COLUMN id SET DEFAULT nextval('public.dmails_id_seq'::regclass);


--
-- Name: edit_histories id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.edit_histories ALTER COLUMN id SET DEFAULT nextval('public.edit_histories_id_seq'::regclass);


--
-- Name: email_blacklists id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.email_blacklists ALTER COLUMN id SET DEFAULT nextval('public.email_blacklists_id_seq'::regclass);


--
-- Name: exception_logs id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.exception_logs ALTER COLUMN id SET DEFAULT nextval('public.exception_logs_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: forum_categories id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_categories ALTER COLUMN id SET DEFAULT nextval('public.forum_categories_id_seq'::regclass);


--
-- Name: forum_post_votes id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_post_votes ALTER COLUMN id SET DEFAULT nextval('public.forum_post_votes_id_seq'::regclass);


--
-- Name: forum_posts id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_posts ALTER COLUMN id SET DEFAULT nextval('public.forum_posts_id_seq'::regclass);


--
-- Name: forum_subscriptions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.forum_subscriptions_id_seq'::regclass);


--
-- Name: forum_topic_visits id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_topic_visits ALTER COLUMN id SET DEFAULT nextval('public.forum_topic_visits_id_seq'::regclass);


--
-- Name: forum_topics id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_topics ALTER COLUMN id SET DEFAULT nextval('public.forum_topics_id_seq'::regclass);


--
-- Name: help_pages id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.help_pages ALTER COLUMN id SET DEFAULT nextval('public.help_pages_id_seq'::regclass);


--
-- Name: ip_bans id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.ip_bans ALTER COLUMN id SET DEFAULT nextval('public.ip_bans_id_seq'::regclass);


--
-- Name: mascots id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.mascots ALTER COLUMN id SET DEFAULT nextval('public.mascots_id_seq'::regclass);


--
-- Name: news_updates id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.news_updates ALTER COLUMN id SET DEFAULT nextval('public.news_updates_id_seq'::regclass);


--
-- Name: note_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.note_versions ALTER COLUMN id SET DEFAULT nextval('public.note_versions_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: pool_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.pool_versions ALTER COLUMN id SET DEFAULT nextval('public.pool_versions_id_seq'::regclass);


--
-- Name: pools id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.pools ALTER COLUMN id SET DEFAULT nextval('public.pools_id_seq'::regclass);


--
-- Name: post_approvals id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_approvals ALTER COLUMN id SET DEFAULT nextval('public.post_approvals_id_seq'::regclass);


--
-- Name: post_disapprovals id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_disapprovals ALTER COLUMN id SET DEFAULT nextval('public.post_disapprovals_id_seq'::regclass);


--
-- Name: post_events id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_events ALTER COLUMN id SET DEFAULT nextval('public.post_events_id_seq'::regclass);


--
-- Name: post_flags id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_flags ALTER COLUMN id SET DEFAULT nextval('public.post_flags_id_seq'::regclass);


--
-- Name: post_replacements2 id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_replacements2 ALTER COLUMN id SET DEFAULT nextval('public.post_replacements2_id_seq'::regclass);


--
-- Name: post_report_reasons id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_report_reasons ALTER COLUMN id SET DEFAULT nextval('public.post_report_reasons_id_seq'::regclass);


--
-- Name: post_set_maintainers id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_set_maintainers ALTER COLUMN id SET DEFAULT nextval('public.post_set_maintainers_id_seq'::regclass);


--
-- Name: post_sets id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_sets ALTER COLUMN id SET DEFAULT nextval('public.post_sets_id_seq'::regclass);


--
-- Name: post_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_versions ALTER COLUMN id SET DEFAULT nextval('public.post_versions_id_seq'::regclass);


--
-- Name: post_votes id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_votes ALTER COLUMN id SET DEFAULT nextval('public.post_votes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts change_seq; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.posts ALTER COLUMN change_seq SET DEFAULT nextval('public.posts_change_seq_seq'::regclass);


--
-- Name: staff_audit_logs id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.staff_audit_logs ALTER COLUMN id SET DEFAULT nextval('public.staff_audit_logs_id_seq'::regclass);


--
-- Name: staff_notes id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.staff_notes ALTER COLUMN id SET DEFAULT nextval('public.staff_notes_id_seq'::regclass);


--
-- Name: tag_aliases id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_aliases ALTER COLUMN id SET DEFAULT nextval('public.tag_aliases_id_seq'::regclass);


--
-- Name: tag_implications id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_implications ALTER COLUMN id SET DEFAULT nextval('public.tag_implications_id_seq'::regclass);


--
-- Name: tag_rel_undos id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_rel_undos ALTER COLUMN id SET DEFAULT nextval('public.tag_rel_undos_id_seq'::regclass);


--
-- Name: tag_type_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_type_versions ALTER COLUMN id SET DEFAULT nextval('public.tag_type_versions_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: takedowns id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.takedowns ALTER COLUMN id SET DEFAULT nextval('public.takedowns_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: upload_whitelists id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.upload_whitelists ALTER COLUMN id SET DEFAULT nextval('public.upload_whitelists_id_seq'::regclass);


--
-- Name: uploads id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.uploads ALTER COLUMN id SET DEFAULT nextval('public.uploads_id_seq'::regclass);


--
-- Name: user_feedback id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_feedback ALTER COLUMN id SET DEFAULT nextval('public.user_feedback_id_seq'::regclass);


--
-- Name: user_name_change_requests id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_name_change_requests ALTER COLUMN id SET DEFAULT nextval('public.user_name_change_requests_id_seq'::regclass);


--
-- Name: user_password_reset_nonces id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_password_reset_nonces ALTER COLUMN id SET DEFAULT nextval('public.user_password_reset_nonces_id_seq'::regclass);


--
-- Name: user_statuses id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_statuses ALTER COLUMN id SET DEFAULT nextval('public.user_statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wiki_page_versions id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.wiki_page_versions ALTER COLUMN id SET DEFAULT nextval('public.wiki_page_versions_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.api_keys (id, user_id, key, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-09-01 04:04:57.277154	2024-09-01 04:04:57.277156
schema_sha1	f2e98d318322cce7af7d935e2d86308f8c496284	2024-09-01 04:04:57.282481	2024-09-01 04:04:57.282483
\.


--
-- Data for Name: artist_urls; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.artist_urls (id, artist_id, url, normalized_url, created_at, updated_at, is_active) FROM stdin;
1	1	https://t.me/Starselle	http://t.me/Starselle/	2024-09-01 04:14:23.858062	2024-09-01 04:14:23.858062	t
2	1	https://t.me/Starsellensfw	http://t.me/Starsellensfw/	2024-09-01 04:14:23.862031	2024-09-01 04:14:23.862031	t
3	1	https://t.me/Starsie	http://t.me/Starsie/	2024-09-01 04:14:23.864768	2024-09-01 04:14:23.864768	t
4	1	https://x.com/Starsielle	http://x.com/Starsielle/	2024-09-01 04:14:23.86682	2024-09-01 04:14:23.86682	t
\.


--
-- Data for Name: artist_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.artist_versions (id, artist_id, name, updater_id, updater_ip_addr, is_active, group_name, created_at, updated_at, other_names, urls, notes_changed) FROM stdin;
1	1	starselle	1	172.19.0.1	t		2024-09-01 04:14:23.903532	2024-09-01 04:14:23.903532	{starsie}	{https://t.me/Starselle,https://t.me/Starsellensfw,https://t.me/Starsie,https://x.com/Starsielle}	f
2	2	starsie	1	172.19.0.1	t		2024-09-01 04:14:31.227654	2024-09-01 04:14:31.227654	{starselle}	{}	f
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.artists (id, name, creator_id, is_active, group_name, created_at, updated_at, other_names, linked_user_id, is_locked) FROM stdin;
1	starselle	1	t		2024-09-01 04:14:23.847719	2024-09-01 04:14:23.867971	{starsie}	\N	f
2	starsie	1	t		2024-09-01 04:14:31.219634	2024-09-01 04:14:31.219634	{starselle}	\N	f
\.


--
-- Data for Name: avoid_posting_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.avoid_posting_versions (id, updater_id, avoid_posting_id, updater_ip_addr, details, staff_notes, is_active, updated_at) FROM stdin;
\.


--
-- Data for Name: avoid_postings; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.avoid_postings (id, creator_id, updater_id, artist_id, creator_ip_addr, updater_ip_addr, details, staff_notes, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bans; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.bans (id, user_id, reason, banner_id, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: blips; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.blips (id, creator_ip_addr, creator_id, body, response_to, is_hidden, created_at, updated_at, warning_type, warning_user_id, updater_id) FROM stdin;
\.


--
-- Data for Name: bulk_update_requests; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.bulk_update_requests (id, user_id, forum_topic_id, script, status, created_at, updated_at, approver_id, forum_post_id, title, user_ip_addr) FROM stdin;
1	1	\N	implicate basil -> bird\nimplicate basil -> avian\nimplicate basil -> corvid\nimplicate basil -> corvus_(genus)\nimplicate basil -> crow\nimplicate basil -> oscine\nimplicate basil -> passerine\nimplicate basil -> anthro\nimplicate basil -> white_feathers	approved	2024-09-01 04:10:03.512359	2024-09-01 04:10:06.347219	1	\N	Basil	127.0.0.1
2	1	\N	implicate zuri -> felid\nimplicate zuri -> cheetah\nimplicate zuri -> feline\nimplicate zuri -> felis\nimplicate zuri -> mammal\nimplicate zuri -> anthro\nimplicate zuri -> black_body\nimplicate zuri -> black_fur\nimplicate zuri -> blonde_highlights\nimplicate zuri -> cheek_tuft\nimplicate zuri -> chest_ruft\nimplicate zuri -> ear_piercing\nimplicate zuri -> facial_tuft\nimplicate zuri -> fur\nimplicate zuri -> hair\nimplicate zuri -> highlights_(coloring)\nimplicate zuri -> industrial_piercing\nimplicate zuri -> industrial_piercing_ladder\nimplicate zuri -> inner_ear_fluff\nimplicate zuri -> male\nimplicate zuri -> markings\nimplicate zuri -> piercing\nimplicate zuri -> spots\nimplicate zuri -> spotted_body\nimplicate zuri -> spotted_fur\nimplicate zuri -> tail\nimplicate zuri -> tongue\nimplicate zuri -> tongue_out\nimplicate zuri -> tuft\nimplicate zuri -> white_body\nimplicate zuri -> white_fur\nimplicate serene_form -> blue_eyes	approved	2024-09-01 04:13:16.808832	2024-09-01 04:13:20.139274	1	\N	Zuri	127.0.0.1
\.


--
-- Data for Name: comment_votes; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.comment_votes (id, comment_id, user_id, score, created_at, updated_at, user_ip_addr) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.comments (id, post_id, creator_id, body, creator_ip_addr, score, created_at, updated_at, updater_id, updater_ip_addr, do_not_bump_post, is_hidden, is_sticky, warning_type, warning_user_id) FROM stdin;
\.


--
-- Data for Name: destroyed_posts; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.destroyed_posts (id, post_id, md5, destroyer_id, destroyer_ip_addr, uploader_id, uploader_ip_addr, upload_date, post_data, created_at, updated_at, reason, notify) FROM stdin;
\.


--
-- Data for Name: dmail_filters; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.dmail_filters (id, user_id, words, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dmails; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.dmails (id, owner_id, from_id, to_id, title, body, is_read, is_deleted, created_at, updated_at, creator_ip_addr) FROM stdin;
\.


--
-- Data for Name: edit_histories; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.edit_histories (id, created_at, updated_at, body, subject, versionable_type, versionable_id, version, ip_addr, user_id) FROM stdin;
\.


--
-- Data for Name: email_blacklists; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.email_blacklists (id, created_at, updated_at, domain, creator_id, reason) FROM stdin;
\.


--
-- Data for Name: exception_logs; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.exception_logs (id, created_at, updated_at, class_name, ip_addr, version, extra_params, message, trace, code, user_id) FROM stdin;
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.favorites (id, user_id, post_id, created_at) FROM stdin;
\.


--
-- Data for Name: forum_categories; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.forum_categories (id, name, description, cat_order, can_view, can_create, can_reply) FROM stdin;
1	Tag Alias and Implication Suggestions	\N	\N	0	20	20
\.


--
-- Data for Name: forum_post_votes; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.forum_post_votes (id, forum_post_id, creator_id, score, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: forum_posts; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.forum_posts (id, topic_id, creator_id, updater_id, body, is_hidden, created_at, updated_at, creator_ip_addr, warning_type, warning_user_id) FROM stdin;
\.


--
-- Data for Name: forum_subscriptions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.forum_subscriptions (id, user_id, forum_topic_id, last_read_at, delete_key) FROM stdin;
\.


--
-- Data for Name: forum_topic_visits; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.forum_topic_visits (id, user_id, forum_topic_id, last_read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: forum_topics; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.forum_topics (id, creator_id, updater_id, title, response_count, is_sticky, is_locked, is_hidden, created_at, updated_at, category_id, creator_ip_addr) FROM stdin;
\.


--
-- Data for Name: help_pages; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.help_pages (id, created_at, updated_at, name, wiki_page, related, title) FROM stdin;
\.


--
-- Data for Name: ip_bans; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.ip_bans (id, creator_id, ip_addr, reason, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mascots; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.mascots (id, creator_id, display_name, md5, file_ext, background_color, artist_url, artist_name, active, created_at, updated_at, available_on) FROM stdin;
1	1	Hexerade 3	53a014c46528923fc4baf2192af926bd	png	#012e57	https://furaffinity.net/user/chizi	chizi	t	2024-09-01 04:05:18.509779	2024-09-01 04:05:18.509779	{e621}
\.


--
-- Data for Name: mod_actions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.mod_actions (id, creator_id, created_at, updated_at, action, "values") FROM stdin;
1	1	2024-09-01 04:05:18.566537	2024-09-01 04:05:18.566537	upload_whitelist_create	{"pattern":"https://static1.e621.net/*","note":null,"hidden":false}
2	1	2024-09-01 04:05:18.571858	2024-09-01 04:05:18.571858	upload_whitelist_update	{"pattern":"https://static1.e621.net/*","note":null,"old_pattern":null,"hidden":false}
3	1	2024-09-01 04:10:05.944042	2024-09-01 04:10:05.944042	tag_implication_update	{"implication_id":1,"implication_desc":"\\"tag implication #1\\":[/tag_implications/1]: [[basil]] -\\u003e [[bird]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
4	1	2024-09-01 04:10:06.043492	2024-09-01 04:10:06.043492	tag_implication_update	{"implication_id":2,"implication_desc":"\\"tag implication #2\\":[/tag_implications/2]: [[basil]] -\\u003e [[avian]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
5	1	2024-09-01 04:10:06.091751	2024-09-01 04:10:06.091751	tag_implication_update	{"implication_id":3,"implication_desc":"\\"tag implication #3\\":[/tag_implications/3]: [[basil]] -\\u003e [[corvid]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
6	1	2024-09-01 04:10:06.13115	2024-09-01 04:10:06.13115	tag_implication_update	{"implication_id":4,"implication_desc":"\\"tag implication #4\\":[/tag_implications/4]: [[basil]] -\\u003e [[corvus_(genus)]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
7	1	2024-09-01 04:10:06.175268	2024-09-01 04:10:06.175268	tag_implication_update	{"implication_id":5,"implication_desc":"\\"tag implication #5\\":[/tag_implications/5]: [[basil]] -\\u003e [[crow]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
8	1	2024-09-01 04:10:06.213735	2024-09-01 04:10:06.213735	tag_implication_update	{"implication_id":6,"implication_desc":"\\"tag implication #6\\":[/tag_implications/6]: [[basil]] -\\u003e [[oscine]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
9	1	2024-09-01 04:10:06.247474	2024-09-01 04:10:06.247474	tag_implication_update	{"implication_id":7,"implication_desc":"\\"tag implication #7\\":[/tag_implications/7]: [[basil]] -\\u003e [[passerine]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
10	1	2024-09-01 04:10:06.28895	2024-09-01 04:10:06.28895	tag_implication_update	{"implication_id":8,"implication_desc":"\\"tag implication #8\\":[/tag_implications/8]: [[basil]] -\\u003e [[anthro]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
11	1	2024-09-01 04:10:06.330554	2024-09-01 04:10:06.330554	tag_implication_update	{"implication_id":9,"implication_desc":"\\"tag implication #9\\":[/tag_implications/9]: [[basil]] -\\u003e [[white_feathers]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
12	1	2024-09-01 04:10:06.917391	2024-09-01 04:10:06.917391	tag_implication_update	{"implication_id":5,"implication_desc":"\\"tag implication #5\\":[/tag_implications/5]: [[basil]] -\\u003e [[crow]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
13	1	2024-09-01 04:10:06.92488	2024-09-01 04:10:06.92488	tag_implication_update	{"implication_id":2,"implication_desc":"\\"tag implication #2\\":[/tag_implications/2]: [[basil]] -\\u003e [[avian]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
14	1	2024-09-01 04:10:06.931451	2024-09-01 04:10:06.931451	tag_implication_update	{"implication_id":4,"implication_desc":"\\"tag implication #4\\":[/tag_implications/4]: [[basil]] -\\u003e [[corvus_(genus)]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
15	1	2024-09-01 04:10:06.937694	2024-09-01 04:10:06.937694	tag_implication_update	{"implication_id":3,"implication_desc":"\\"tag implication #3\\":[/tag_implications/3]: [[basil]] -\\u003e [[corvid]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
16	1	2024-09-01 04:10:06.959263	2024-09-01 04:10:06.959263	tag_implication_update	{"implication_id":1,"implication_desc":"\\"tag implication #1\\":[/tag_implications/1]: [[basil]] -\\u003e [[bird]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
17	1	2024-09-01 04:10:07.043256	2024-09-01 04:10:07.043256	tag_implication_update	{"implication_id":5,"implication_desc":"\\"tag implication #5\\":[/tag_implications/5]: [[basil]] -\\u003e [[crow]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
18	1	2024-09-01 04:10:07.054642	2024-09-01 04:10:07.054642	tag_implication_update	{"implication_id":4,"implication_desc":"\\"tag implication #4\\":[/tag_implications/4]: [[basil]] -\\u003e [[corvus_(genus)]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
19	1	2024-09-01 04:10:07.055942	2024-09-01 04:10:07.055942	tag_implication_update	{"implication_id":2,"implication_desc":"\\"tag implication #2\\":[/tag_implications/2]: [[basil]] -\\u003e [[avian]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
20	1	2024-09-01 04:10:07.057066	2024-09-01 04:10:07.057066	tag_implication_update	{"implication_id":3,"implication_desc":"\\"tag implication #3\\":[/tag_implications/3]: [[basil]] -\\u003e [[corvid]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
21	1	2024-09-01 04:10:07.092854	2024-09-01 04:10:07.092854	tag_implication_update	{"implication_id":1,"implication_desc":"\\"tag implication #1\\":[/tag_implications/1]: [[basil]] -\\u003e [[bird]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
22	1	2024-09-01 04:10:07.27538	2024-09-01 04:10:07.27538	tag_implication_update	{"implication_id":6,"implication_desc":"\\"tag implication #6\\":[/tag_implications/6]: [[basil]] -\\u003e [[oscine]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
23	1	2024-09-01 04:10:07.306113	2024-09-01 04:10:07.306113	tag_implication_update	{"implication_id":7,"implication_desc":"\\"tag implication #7\\":[/tag_implications/7]: [[basil]] -\\u003e [[passerine]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
24	1	2024-09-01 04:10:07.312042	2024-09-01 04:10:07.312042	tag_implication_update	{"implication_id":9,"implication_desc":"\\"tag implication #9\\":[/tag_implications/9]: [[basil]] -\\u003e [[white_feathers]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
25	1	2024-09-01 04:10:07.328477	2024-09-01 04:10:07.328477	tag_implication_update	{"implication_id":8,"implication_desc":"\\"tag implication #8\\":[/tag_implications/8]: [[basil]] -\\u003e [[anthro]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
26	1	2024-09-01 04:10:07.362446	2024-09-01 04:10:07.362446	tag_implication_update	{"implication_id":6,"implication_desc":"\\"tag implication #6\\":[/tag_implications/6]: [[basil]] -\\u003e [[oscine]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
27	1	2024-09-01 04:10:07.384613	2024-09-01 04:10:07.384613	tag_implication_update	{"implication_id":9,"implication_desc":"\\"tag implication #9\\":[/tag_implications/9]: [[basil]] -\\u003e [[white_feathers]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
28	1	2024-09-01 04:10:07.386611	2024-09-01 04:10:07.386611	tag_implication_update	{"implication_id":7,"implication_desc":"\\"tag implication #7\\":[/tag_implications/7]: [[basil]] -\\u003e [[passerine]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
29	1	2024-09-01 04:10:07.405121	2024-09-01 04:10:07.405121	tag_implication_update	{"implication_id":8,"implication_desc":"\\"tag implication #8\\":[/tag_implications/8]: [[basil]] -\\u003e [[anthro]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
30	1	2024-09-01 04:13:19.072363	2024-09-01 04:13:19.072363	tag_implication_update	{"implication_id":10,"implication_desc":"\\"tag implication #10\\":[/tag_implications/10]: [[zuri]] -\\u003e [[felid]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
31	1	2024-09-01 04:13:19.160083	2024-09-01 04:13:19.160083	tag_implication_update	{"implication_id":11,"implication_desc":"\\"tag implication #11\\":[/tag_implications/11]: [[zuri]] -\\u003e [[cheetah]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
32	1	2024-09-01 04:13:19.189996	2024-09-01 04:13:19.189996	tag_implication_update	{"implication_id":12,"implication_desc":"\\"tag implication #12\\":[/tag_implications/12]: [[zuri]] -\\u003e [[feline]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
33	1	2024-09-01 04:13:19.218411	2024-09-01 04:13:19.218411	tag_implication_update	{"implication_id":13,"implication_desc":"\\"tag implication #13\\":[/tag_implications/13]: [[zuri]] -\\u003e [[felis]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
34	1	2024-09-01 04:13:19.247914	2024-09-01 04:13:19.247914	tag_implication_update	{"implication_id":14,"implication_desc":"\\"tag implication #14\\":[/tag_implications/14]: [[zuri]] -\\u003e [[mammal]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
35	1	2024-09-01 04:13:19.279347	2024-09-01 04:13:19.279347	tag_implication_update	{"implication_id":15,"implication_desc":"\\"tag implication #15\\":[/tag_implications/15]: [[zuri]] -\\u003e [[anthro]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
36	1	2024-09-01 04:13:19.309019	2024-09-01 04:13:19.309019	tag_implication_update	{"implication_id":16,"implication_desc":"\\"tag implication #16\\":[/tag_implications/16]: [[zuri]] -\\u003e [[black_body]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
37	1	2024-09-01 04:13:19.346442	2024-09-01 04:13:19.346442	tag_implication_update	{"implication_id":17,"implication_desc":"\\"tag implication #17\\":[/tag_implications/17]: [[zuri]] -\\u003e [[black_fur]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
38	1	2024-09-01 04:13:19.377074	2024-09-01 04:13:19.377074	tag_implication_update	{"implication_id":18,"implication_desc":"\\"tag implication #18\\":[/tag_implications/18]: [[zuri]] -\\u003e [[blonde_highlights]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
39	1	2024-09-01 04:13:19.405578	2024-09-01 04:13:19.405578	tag_implication_update	{"implication_id":19,"implication_desc":"\\"tag implication #19\\":[/tag_implications/19]: [[zuri]] -\\u003e [[cheek_tuft]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
40	1	2024-09-01 04:13:19.43381	2024-09-01 04:13:19.43381	tag_implication_update	{"implication_id":20,"implication_desc":"\\"tag implication #20\\":[/tag_implications/20]: [[zuri]] -\\u003e [[chest_ruft]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
41	1	2024-09-01 04:13:19.46226	2024-09-01 04:13:19.46226	tag_implication_update	{"implication_id":21,"implication_desc":"\\"tag implication #21\\":[/tag_implications/21]: [[zuri]] -\\u003e [[ear_piercing]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
42	1	2024-09-01 04:13:19.492598	2024-09-01 04:13:19.492598	tag_implication_update	{"implication_id":22,"implication_desc":"\\"tag implication #22\\":[/tag_implications/22]: [[zuri]] -\\u003e [[facial_tuft]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
43	1	2024-09-01 04:13:19.527439	2024-09-01 04:13:19.527439	tag_implication_update	{"implication_id":23,"implication_desc":"\\"tag implication #23\\":[/tag_implications/23]: [[zuri]] -\\u003e [[fur]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
44	1	2024-09-01 04:13:19.553523	2024-09-01 04:13:19.553523	tag_implication_update	{"implication_id":24,"implication_desc":"\\"tag implication #24\\":[/tag_implications/24]: [[zuri]] -\\u003e [[hair]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
45	1	2024-09-01 04:13:19.584983	2024-09-01 04:13:19.584983	tag_implication_update	{"implication_id":25,"implication_desc":"\\"tag implication #25\\":[/tag_implications/25]: [[zuri]] -\\u003e [[highlights_(coloring)]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
46	1	2024-09-01 04:13:19.612745	2024-09-01 04:13:19.612745	tag_implication_update	{"implication_id":26,"implication_desc":"\\"tag implication #26\\":[/tag_implications/26]: [[zuri]] -\\u003e [[industrial_piercing]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
47	1	2024-09-01 04:13:19.643057	2024-09-01 04:13:19.643057	tag_implication_update	{"implication_id":27,"implication_desc":"\\"tag implication #27\\":[/tag_implications/27]: [[zuri]] -\\u003e [[industrial_piercing_ladder]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
48	1	2024-09-01 04:13:19.675969	2024-09-01 04:13:19.675969	tag_implication_update	{"implication_id":28,"implication_desc":"\\"tag implication #28\\":[/tag_implications/28]: [[zuri]] -\\u003e [[inner_ear_fluff]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
49	1	2024-09-01 04:13:19.733353	2024-09-01 04:13:19.733353	tag_implication_update	{"implication_id":29,"implication_desc":"\\"tag implication #29\\":[/tag_implications/29]: [[zuri]] -\\u003e [[male]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
50	1	2024-09-01 04:13:19.810552	2024-09-01 04:13:19.810552	tag_implication_update	{"implication_id":30,"implication_desc":"\\"tag implication #30\\":[/tag_implications/30]: [[zuri]] -\\u003e [[markings]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
51	1	2024-09-01 04:13:19.840744	2024-09-01 04:13:19.840744	tag_implication_update	{"implication_id":31,"implication_desc":"\\"tag implication #31\\":[/tag_implications/31]: [[zuri]] -\\u003e [[piercing]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
52	1	2024-09-01 04:13:19.868976	2024-09-01 04:13:19.868976	tag_implication_update	{"implication_id":32,"implication_desc":"\\"tag implication #32\\":[/tag_implications/32]: [[zuri]] -\\u003e [[spots]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
53	1	2024-09-01 04:13:19.897736	2024-09-01 04:13:19.897736	tag_implication_update	{"implication_id":33,"implication_desc":"\\"tag implication #33\\":[/tag_implications/33]: [[zuri]] -\\u003e [[spotted_body]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
54	1	2024-09-01 04:13:19.925822	2024-09-01 04:13:19.925822	tag_implication_update	{"implication_id":34,"implication_desc":"\\"tag implication #34\\":[/tag_implications/34]: [[zuri]] -\\u003e [[spotted_fur]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
55	1	2024-09-01 04:13:19.951056	2024-09-01 04:13:19.951056	tag_implication_update	{"implication_id":35,"implication_desc":"\\"tag implication #35\\":[/tag_implications/35]: [[zuri]] -\\u003e [[tail]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
56	1	2024-09-01 04:13:19.978851	2024-09-01 04:13:19.978851	tag_implication_update	{"implication_id":36,"implication_desc":"\\"tag implication #36\\":[/tag_implications/36]: [[zuri]] -\\u003e [[tongue]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
57	1	2024-09-01 04:13:20.004943	2024-09-01 04:13:20.004943	tag_implication_update	{"implication_id":37,"implication_desc":"\\"tag implication #37\\":[/tag_implications/37]: [[zuri]] -\\u003e [[tongue_out]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
58	1	2024-09-01 04:13:20.038765	2024-09-01 04:13:20.038765	tag_implication_update	{"implication_id":38,"implication_desc":"\\"tag implication #38\\":[/tag_implications/38]: [[zuri]] -\\u003e [[tuft]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
59	1	2024-09-01 04:13:20.065269	2024-09-01 04:13:20.065269	tag_implication_update	{"implication_id":39,"implication_desc":"\\"tag implication #39\\":[/tag_implications/39]: [[zuri]] -\\u003e [[white_body]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
60	1	2024-09-01 04:13:20.090671	2024-09-01 04:13:20.090671	tag_implication_update	{"implication_id":40,"implication_desc":"\\"tag implication #40\\":[/tag_implications/40]: [[zuri]] -\\u003e [[white_fur]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
61	1	2024-09-01 04:13:20.116698	2024-09-01 04:13:20.116698	tag_implication_update	{"implication_id":41,"implication_desc":"\\"tag implication #41\\":[/tag_implications/41]: [[serene_form]] -\\u003e [[blue_eyes]]","change_desc":"changed status from \\"pending\\" to \\"queued\\", set approver_id to \\"1\\""}
62	1	2024-09-01 04:13:36.186985	2024-09-01 04:13:36.186985	tag_implication_update	{"implication_id":26,"implication_desc":"\\"tag implication #26\\":[/tag_implications/26]: [[zuri]] -\\u003e [[industrial_piercing]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
67	1	2024-09-01 04:13:36.237277	2024-09-01 04:13:36.237277	tag_implication_update	{"implication_id":26,"implication_desc":"\\"tag implication #26\\":[/tag_implications/26]: [[zuri]] -\\u003e [[industrial_piercing]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
82	1	2024-09-01 04:13:41.813674	2024-09-01 04:13:41.813674	tag_implication_update	{"implication_id":30,"implication_desc":"\\"tag implication #30\\":[/tag_implications/30]: [[zuri]] -\\u003e [[markings]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
87	1	2024-09-01 04:13:41.874319	2024-09-01 04:13:41.874319	tag_implication_update	{"implication_id":30,"implication_desc":"\\"tag implication #30\\":[/tag_implications/30]: [[zuri]] -\\u003e [[markings]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
88	1	2024-09-01 04:13:42.036469	2024-09-01 04:13:42.036469	tag_implication_update	{"implication_id":23,"implication_desc":"\\"tag implication #23\\":[/tag_implications/23]: [[zuri]] -\\u003e [[fur]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
93	1	2024-09-01 04:13:42.081876	2024-09-01 04:13:42.081876	tag_implication_update	{"implication_id":23,"implication_desc":"\\"tag implication #23\\":[/tag_implications/23]: [[zuri]] -\\u003e [[fur]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
100	1	2024-09-01 04:13:42.326398	2024-09-01 04:13:42.326398	tag_implication_update	{"implication_id":18,"implication_desc":"\\"tag implication #18\\":[/tag_implications/18]: [[zuri]] -\\u003e [[blonde_highlights]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
106	1	2024-09-01 04:13:42.389436	2024-09-01 04:13:42.389436	tag_implication_update	{"implication_id":18,"implication_desc":"\\"tag implication #18\\":[/tag_implications/18]: [[zuri]] -\\u003e [[blonde_highlights]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
109	1	2024-09-01 04:13:42.517404	2024-09-01 04:13:42.517404	tag_implication_update	{"implication_id":14,"implication_desc":"\\"tag implication #14\\":[/tag_implications/14]: [[zuri]] -\\u003e [[mammal]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
112	1	2024-09-01 04:13:42.538451	2024-09-01 04:13:42.538451	tag_implication_update	{"implication_id":14,"implication_desc":"\\"tag implication #14\\":[/tag_implications/14]: [[zuri]] -\\u003e [[mammal]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
117	1	2024-09-01 04:13:46.510971	2024-09-01 04:13:46.510971	tag_implication_update	{"implication_id":12,"implication_desc":"\\"tag implication #12\\":[/tag_implications/12]: [[zuri]] -\\u003e [[feline]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
123	1	2024-09-01 04:13:46.565306	2024-09-01 04:13:46.565306	tag_implication_update	{"implication_id":12,"implication_desc":"\\"tag implication #12\\":[/tag_implications/12]: [[zuri]] -\\u003e [[feline]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
124	1	2024-09-01 04:13:46.588314	2024-09-01 04:13:46.588314	tag_implication_update	{"implication_id":13,"implication_desc":"\\"tag implication #13\\":[/tag_implications/13]: [[zuri]] -\\u003e [[felis]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
125	1	2024-09-01 04:13:46.599681	2024-09-01 04:13:46.599681	tag_implication_update	{"implication_id":13,"implication_desc":"\\"tag implication #13\\":[/tag_implications/13]: [[zuri]] -\\u003e [[felis]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
63	1	2024-09-01 04:13:36.193622	2024-09-01 04:13:36.193622	tag_implication_update	{"implication_id":27,"implication_desc":"\\"tag implication #27\\":[/tag_implications/27]: [[zuri]] -\\u003e [[industrial_piercing_ladder]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
69	1	2024-09-01 04:13:36.254973	2024-09-01 04:13:36.254973	tag_implication_update	{"implication_id":27,"implication_desc":"\\"tag implication #27\\":[/tag_implications/27]: [[zuri]] -\\u003e [[industrial_piercing_ladder]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
74	1	2024-09-01 04:13:36.388825	2024-09-01 04:13:36.388825	tag_implication_update	{"implication_id":31,"implication_desc":"\\"tag implication #31\\":[/tag_implications/31]: [[zuri]] -\\u003e [[piercing]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
77	1	2024-09-01 04:13:36.416019	2024-09-01 04:13:36.416019	tag_implication_update	{"implication_id":31,"implication_desc":"\\"tag implication #31\\":[/tag_implications/31]: [[zuri]] -\\u003e [[piercing]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
78	1	2024-09-01 04:13:41.776422	2024-09-01 04:13:41.776422	tag_implication_update	{"implication_id":41,"implication_desc":"\\"tag implication #41\\":[/tag_implications/41]: [[serene_form]] -\\u003e [[blue_eyes]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
84	1	2024-09-01 04:13:41.841309	2024-09-01 04:13:41.841309	tag_implication_update	{"implication_id":41,"implication_desc":"\\"tag implication #41\\":[/tag_implications/41]: [[serene_form]] -\\u003e [[blue_eyes]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
92	1	2024-09-01 04:13:42.075188	2024-09-01 04:13:42.075188	tag_implication_update	{"implication_id":17,"implication_desc":"\\"tag implication #17\\":[/tag_implications/17]: [[zuri]] -\\u003e [[black_fur]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
97	1	2024-09-01 04:13:42.131435	2024-09-01 04:13:42.131435	tag_implication_update	{"implication_id":17,"implication_desc":"\\"tag implication #17\\":[/tag_implications/17]: [[zuri]] -\\u003e [[black_fur]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
98	1	2024-09-01 04:13:42.280684	2024-09-01 04:13:42.280684	tag_implication_update	{"implication_id":21,"implication_desc":"\\"tag implication #21\\":[/tag_implications/21]: [[zuri]] -\\u003e [[ear_piercing]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
102	1	2024-09-01 04:13:42.342763	2024-09-01 04:13:42.342763	tag_implication_update	{"implication_id":21,"implication_desc":"\\"tag implication #21\\":[/tag_implications/21]: [[zuri]] -\\u003e [[ear_piercing]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
118	1	2024-09-01 04:13:46.513431	2024-09-01 04:13:46.513431	tag_implication_update	{"implication_id":36,"implication_desc":"\\"tag implication #36\\":[/tag_implications/36]: [[zuri]] -\\u003e [[tongue]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
122	1	2024-09-01 04:13:46.564111	2024-09-01 04:13:46.564111	tag_implication_update	{"implication_id":36,"implication_desc":"\\"tag implication #36\\":[/tag_implications/36]: [[zuri]] -\\u003e [[tongue]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
64	1	2024-09-01 04:13:36.200054	2024-09-01 04:13:36.200054	tag_implication_update	{"implication_id":37,"implication_desc":"\\"tag implication #37\\":[/tag_implications/37]: [[zuri]] -\\u003e [[tongue_out]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
68	1	2024-09-01 04:13:36.246069	2024-09-01 04:13:36.246069	tag_implication_update	{"implication_id":37,"implication_desc":"\\"tag implication #37\\":[/tag_implications/37]: [[zuri]] -\\u003e [[tongue_out]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
80	1	2024-09-01 04:13:41.806557	2024-09-01 04:13:41.806557	tag_implication_update	{"implication_id":24,"implication_desc":"\\"tag implication #24\\":[/tag_implications/24]: [[zuri]] -\\u003e [[hair]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
85	1	2024-09-01 04:13:41.852418	2024-09-01 04:13:41.852418	tag_implication_update	{"implication_id":24,"implication_desc":"\\"tag implication #24\\":[/tag_implications/24]: [[zuri]] -\\u003e [[hair]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
90	1	2024-09-01 04:13:42.056945	2024-09-01 04:13:42.056945	tag_implication_update	{"implication_id":10,"implication_desc":"\\"tag implication #10\\":[/tag_implications/10]: [[zuri]] -\\u003e [[felid]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
94	1	2024-09-01 04:13:42.104299	2024-09-01 04:13:42.104299	tag_implication_update	{"implication_id":10,"implication_desc":"\\"tag implication #10\\":[/tag_implications/10]: [[zuri]] -\\u003e [[felid]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
101	1	2024-09-01 04:13:42.330961	2024-09-01 04:13:42.330961	tag_implication_update	{"implication_id":38,"implication_desc":"\\"tag implication #38\\":[/tag_implications/38]: [[zuri]] -\\u003e [[tuft]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
105	1	2024-09-01 04:13:42.388334	2024-09-01 04:13:42.388334	tag_implication_update	{"implication_id":38,"implication_desc":"\\"tag implication #38\\":[/tag_implications/38]: [[zuri]] -\\u003e [[tuft]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
110	1	2024-09-01 04:13:42.5191	2024-09-01 04:13:42.5191	tag_implication_update	{"implication_id":15,"implication_desc":"\\"tag implication #15\\":[/tag_implications/15]: [[zuri]] -\\u003e [[anthro]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
113	1	2024-09-01 04:13:42.54053	2024-09-01 04:13:42.54053	tag_implication_update	{"implication_id":15,"implication_desc":"\\"tag implication #15\\":[/tag_implications/15]: [[zuri]] -\\u003e [[anthro]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
114	1	2024-09-01 04:13:46.487641	2024-09-01 04:13:46.487641	tag_implication_update	{"implication_id":34,"implication_desc":"\\"tag implication #34\\":[/tag_implications/34]: [[zuri]] -\\u003e [[spotted_fur]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
119	1	2024-09-01 04:13:46.541738	2024-09-01 04:13:46.541738	tag_implication_update	{"implication_id":34,"implication_desc":"\\"tag implication #34\\":[/tag_implications/34]: [[zuri]] -\\u003e [[spotted_fur]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
65	1	2024-09-01 04:13:36.215553	2024-09-01 04:13:36.215553	tag_implication_update	{"implication_id":32,"implication_desc":"\\"tag implication #32\\":[/tag_implications/32]: [[zuri]] -\\u003e [[spots]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
71	1	2024-09-01 04:13:36.285813	2024-09-01 04:13:36.285813	tag_implication_update	{"implication_id":32,"implication_desc":"\\"tag implication #32\\":[/tag_implications/32]: [[zuri]] -\\u003e [[spots]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
72	1	2024-09-01 04:13:36.381856	2024-09-01 04:13:36.381856	tag_implication_update	{"implication_id":39,"implication_desc":"\\"tag implication #39\\":[/tag_implications/39]: [[zuri]] -\\u003e [[white_body]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
75	1	2024-09-01 04:13:36.409275	2024-09-01 04:13:36.409275	tag_implication_update	{"implication_id":39,"implication_desc":"\\"tag implication #39\\":[/tag_implications/39]: [[zuri]] -\\u003e [[white_body]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
79	1	2024-09-01 04:13:41.784595	2024-09-01 04:13:41.784595	tag_implication_update	{"implication_id":19,"implication_desc":"\\"tag implication #19\\":[/tag_implications/19]: [[zuri]] -\\u003e [[cheek_tuft]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
83	1	2024-09-01 04:13:41.837774	2024-09-01 04:13:41.837774	tag_implication_update	{"implication_id":19,"implication_desc":"\\"tag implication #19\\":[/tag_implications/19]: [[zuri]] -\\u003e [[cheek_tuft]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
91	1	2024-09-01 04:13:42.066337	2024-09-01 04:13:42.066337	tag_implication_update	{"implication_id":11,"implication_desc":"\\"tag implication #11\\":[/tag_implications/11]: [[zuri]] -\\u003e [[cheetah]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
96	1	2024-09-01 04:13:42.122945	2024-09-01 04:13:42.122945	tag_implication_update	{"implication_id":11,"implication_desc":"\\"tag implication #11\\":[/tag_implications/11]: [[zuri]] -\\u003e [[cheetah]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
103	1	2024-09-01 04:13:42.344773	2024-09-01 04:13:42.344773	tag_implication_update	{"implication_id":29,"implication_desc":"\\"tag implication #29\\":[/tag_implications/29]: [[zuri]] -\\u003e [[male]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
107	1	2024-09-01 04:13:42.403824	2024-09-01 04:13:42.403824	tag_implication_update	{"implication_id":29,"implication_desc":"\\"tag implication #29\\":[/tag_implications/29]: [[zuri]] -\\u003e [[male]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
108	1	2024-09-01 04:13:42.493451	2024-09-01 04:13:42.493451	tag_implication_update	{"implication_id":20,"implication_desc":"\\"tag implication #20\\":[/tag_implications/20]: [[zuri]] -\\u003e [[chest_ruft]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
111	1	2024-09-01 04:13:42.522897	2024-09-01 04:13:42.522897	tag_implication_update	{"implication_id":20,"implication_desc":"\\"tag implication #20\\":[/tag_implications/20]: [[zuri]] -\\u003e [[chest_ruft]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
116	1	2024-09-01 04:13:46.499837	2024-09-01 04:13:46.499837	tag_implication_update	{"implication_id":22,"implication_desc":"\\"tag implication #22\\":[/tag_implications/22]: [[zuri]] -\\u003e [[facial_tuft]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
120	1	2024-09-01 04:13:46.543454	2024-09-01 04:13:46.543454	tag_implication_update	{"implication_id":22,"implication_desc":"\\"tag implication #22\\":[/tag_implications/22]: [[zuri]] -\\u003e [[facial_tuft]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
66	1	2024-09-01 04:13:36.218389	2024-09-01 04:13:36.218389	tag_implication_update	{"implication_id":35,"implication_desc":"\\"tag implication #35\\":[/tag_implications/35]: [[zuri]] -\\u003e [[tail]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
70	1	2024-09-01 04:13:36.270862	2024-09-01 04:13:36.270862	tag_implication_update	{"implication_id":35,"implication_desc":"\\"tag implication #35\\":[/tag_implications/35]: [[zuri]] -\\u003e [[tail]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
73	1	2024-09-01 04:13:36.38591	2024-09-01 04:13:36.38591	tag_implication_update	{"implication_id":40,"implication_desc":"\\"tag implication #40\\":[/tag_implications/40]: [[zuri]] -\\u003e [[white_fur]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
76	1	2024-09-01 04:13:36.413233	2024-09-01 04:13:36.413233	tag_implication_update	{"implication_id":40,"implication_desc":"\\"tag implication #40\\":[/tag_implications/40]: [[zuri]] -\\u003e [[white_fur]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
81	1	2024-09-01 04:13:41.807678	2024-09-01 04:13:41.807678	tag_implication_update	{"implication_id":16,"implication_desc":"\\"tag implication #16\\":[/tag_implications/16]: [[zuri]] -\\u003e [[black_body]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
86	1	2024-09-01 04:13:41.865634	2024-09-01 04:13:41.865634	tag_implication_update	{"implication_id":16,"implication_desc":"\\"tag implication #16\\":[/tag_implications/16]: [[zuri]] -\\u003e [[black_body]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
89	1	2024-09-01 04:13:42.046064	2024-09-01 04:13:42.046064	tag_implication_update	{"implication_id":25,"implication_desc":"\\"tag implication #25\\":[/tag_implications/25]: [[zuri]] -\\u003e [[highlights_(coloring)]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
95	1	2024-09-01 04:13:42.121583	2024-09-01 04:13:42.121583	tag_implication_update	{"implication_id":25,"implication_desc":"\\"tag implication #25\\":[/tag_implications/25]: [[zuri]] -\\u003e [[highlights_(coloring)]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
99	1	2024-09-01 04:13:42.317372	2024-09-01 04:13:42.317372	tag_implication_update	{"implication_id":33,"implication_desc":"\\"tag implication #33\\":[/tag_implications/33]: [[zuri]] -\\u003e [[spotted_body]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
104	1	2024-09-01 04:13:42.386368	2024-09-01 04:13:42.386368	tag_implication_update	{"implication_id":33,"implication_desc":"\\"tag implication #33\\":[/tag_implications/33]: [[zuri]] -\\u003e [[spotted_body]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
115	1	2024-09-01 04:13:46.491497	2024-09-01 04:13:46.491497	tag_implication_update	{"implication_id":28,"implication_desc":"\\"tag implication #28\\":[/tag_implications/28]: [[zuri]] -\\u003e [[inner_ear_fluff]]","change_desc":"changed status from \\"queued\\" to \\"processing\\""}
121	1	2024-09-01 04:13:46.550294	2024-09-01 04:13:46.550294	tag_implication_update	{"implication_id":28,"implication_desc":"\\"tag implication #28\\":[/tag_implications/28]: [[zuri]] -\\u003e [[inner_ear_fluff]]","change_desc":"changed status from \\"processing\\" to \\"active\\""}
\.


--
-- Data for Name: news_updates; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.news_updates (id, message, creator_id, updater_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: note_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.note_versions (id, note_id, post_id, updater_id, updater_ip_addr, x, y, width, height, is_active, body, created_at, updated_at, version) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.notes (id, creator_id, post_id, x, y, width, height, is_active, body, created_at, updated_at, version) FROM stdin;
\.


--
-- Data for Name: pool_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.pool_versions (id, pool_id, post_ids, added_post_ids, removed_post_ids, updater_id, updater_ip_addr, description, description_changed, name, name_changed, created_at, updated_at, is_active, category, version) FROM stdin;
\.


--
-- Data for Name: pools; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.pools (id, name, creator_id, description, is_active, post_ids, created_at, updated_at, category) FROM stdin;
\.


--
-- Data for Name: post_approvals; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_approvals (id, user_id, post_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_disapprovals; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_disapprovals (id, user_id, post_id, reason, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_events; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_events (id, creator_id, post_id, action, extra_data, created_at) FROM stdin;
\.


--
-- Data for Name: post_flags; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_flags (id, post_id, creator_id, creator_ip_addr, reason, is_resolved, created_at, updated_at, is_deletion) FROM stdin;
\.


--
-- Data for Name: post_replacements2; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_replacements2 (id, created_at, updated_at, post_id, creator_id, creator_ip_addr, approver_id, file_ext, file_size, image_height, image_width, md5, source, file_name, storage_id, status, reason, protected, uploader_id_on_approve, penalize_uploader_on_approve) FROM stdin;
\.


--
-- Data for Name: post_report_reasons; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_report_reasons (id, created_at, updated_at, reason, creator_id, creator_ip_addr, description) FROM stdin;
\.


--
-- Data for Name: post_set_maintainers; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_set_maintainers (id, post_set_id, user_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_sets; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_sets (id, name, shortname, description, is_public, transfer_on_delete, creator_id, creator_ip_addr, post_ids, post_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_versions (id, post_id, tags, added_tags, removed_tags, locked_tags, added_locked_tags, removed_locked_tags, updater_id, updater_ip_addr, updated_at, rating, rating_changed, parent_id, parent_changed, source, source_changed, description, description_changed, version, reason) FROM stdin;
1	1	anthro avian basil bird black_body black_fur blonde_highlights blue_eyes blushing chair_position cheek_tuft cheetah chest_ruft corvid corvus_(genus) crow dominant_bottom duo ear_piercing facial_tuft felid feline felis fur hair hi_res highlights_(coloring) industrial_piercing industrial_piercing_ladder inner_ear_fluff male male/male mammal markings oscine passerine penetration piercing serene_form spots spotted_body spotted_fur starselle tail tongue tongue_out tuft white_body white_feathers white_fur zuri	{anthro,avian,basil,bird,black_body,black_fur,blonde_highlights,blue_eyes,blushing,chair_position,cheek_tuft,cheetah,chest_ruft,corvid,corvus_(genus),crow,dominant_bottom,duo,ear_piercing,facial_tuft,felid,feline,felis,fur,hair,hi_res,highlights_(coloring),industrial_piercing,industrial_piercing_ladder,inner_ear_fluff,male,male/male,mammal,markings,oscine,passerine,penetration,piercing,serene_form,spots,spotted_body,spotted_fur,starselle,tail,tongue,tongue_out,tuft,white_body,white_feathers,white_fur,zuri}	{}	\N	{}	{}	1	172.19.0.1	2024-09-01 04:15:54.050054	e	t	\N	t		t		t	1	\N
\.


--
-- Data for Name: post_votes; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.post_votes (id, post_id, user_id, score, created_at, updated_at, user_ip_addr) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.posts (id, created_at, updated_at, up_score, down_score, score, source, md5, rating, is_note_locked, is_rating_locked, is_status_locked, is_pending, is_flagged, is_deleted, uploader_id, uploader_ip_addr, approver_id, fav_string, pool_string, last_noted_at, last_comment_bumped_at, fav_count, tag_string, tag_count, tag_count_general, tag_count_artist, tag_count_character, tag_count_copyright, file_ext, file_size, image_width, image_height, parent_id, has_children, last_commented_at, has_active_children, bit_flags, tag_count_meta, locked_tags, tag_count_species, tag_count_invalid, description, comment_count, change_seq, tag_count_lore, bg_color, generated_samples, duration, is_comment_disabled) FROM stdin;
1	2024-09-01 04:15:54.024047	2024-09-01 04:15:54.024047	0	0	0		93dabc87fc19755e89e8510a35e4dfc6	e	f	f	f	f	f	f	1	172.19.0.1	\N			\N	\N	0	anthro avian basil bird black_body black_fur blonde_highlights blue_eyes blushing chair_position cheek_tuft cheetah chest_ruft corvid corvus_(genus) crow dominant_bottom duo ear_piercing facial_tuft felid feline felis fur hair hi_res highlights_(coloring) industrial_piercing industrial_piercing_ladder inner_ear_fluff male male/male mammal markings oscine passerine penetration piercing serene_form spots spotted_body spotted_fur starselle tail tongue tongue_out tuft white_body white_feathers white_fur zuri	51	50	1	0	0	png	2186647	1900	1500	\N	f	\N	f	2	0	\N	0	0		0	1	0	\N	\N	\N	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.schema_migrations (version) FROM stdin;
20240726170041
20240709134926
20240706061122
20240103002049
20240103002040
20240101042716
20230531080817
20230518182034
20230517155547
20230513074838
20230506161827
20230316084945
20230314170352
20230312103728
20230226152600
20230221153458
20230221145226
20230219115601
20230210092829
20230204141325
20230203162010
20221014085948
20220810131625
20220710133556
20220516103329
20220316162257
20220219202441
20220203154846
20220106081415
20210718172512
20210625155528
20210506235640
20210430201028
20210426025625
20210425020131
20210405040522
20210117173030
20201220190335
20201220172926
20201113073842
20200910015420
20200806101238
20200713053034
20200420032714
20200113022639
20191231162515
20191116032230
20191013233447
20191006143246
20191006073950
20191003070653
20190924233432
20190919213915
20190916204908
20190905111159
20190829044313
20190827233008
20190827223818
20190815131908
20190810064211
20190804010156
20190801210547
20190718201354
20190717205018
20190714122705
20190623070654
20190613025850
20190604125828
20190602115848
20190510184245
20190510184237
20190430120155
20190428132152
20190427181805
20190427163107
20190418093745
20190413055451
20190410022203
20190409195837
20190403174011
20190331193644
20190324111703
20190317024446
20190313221440
20190305165101
20190228144206
20190222082952
20190220041928
20190220025517
20190214090126
20190214040324
20190209212716
20190206023508
20190202155518
20190129012253
20190109210822
20181202172145
20181130004740
20181114202744
20181114185032
20181114180205
20181113174914
20181108205842
20181108162204
20180916002448
20180913184128
20180912185624
20180816230604
20180804203201
20180518175154
20180517190048
20180516222413
20180425194016
20180413224239
20180403231351
20180116001101
20180113211343
20171230220225
20171219001521
20171218213037
20171127195124
20171106075030
20170914200122
20170709190409
20170613200356
20170608043651
20170526183928
20170519204506
20170515235205
20170512221200
20170428220448
20170416224142
20170414233617
20170414233426
20170414005856
20170413000209
20170330230231
20170329185605
20170319000519
20170316224630
20170314235626
20170302014435
20170218104710
20170117233040
20170112060921
20170112021922
20170106012138
20161229001201
20161227003428
20161221225849
20161101003139
20161024220345
20161018221128
20160919234407
20160822230752
20160820003534
20160526174848
20160222211328
20160219172840
20160219010854
20160219004022
20151217213321
20150805010245
20150728170433
20150721214646
20150705014135
20150629235905
20150623191904
20150613010904
20150403224949
20150128005954
20150120005624
20150119191042
20141120045943
20141017231608
20141009231234
20140725003232
20140722225753
20140701224800
20140613004559
20140604002414
20140603225334
20140505000956
20140428015134
20140221213349
20140204233337
20140111191413
20131225002748
20131217025233
20131209181023
20131130190411
20131118153503
20131117150705
20131006193238
20130914175431
20130712162600
20130620215658
20130618230158
20130606224559
20130506154136
20130424121410
20130417221643
20130409191950
20130401013601
20130331182719
20130331180246
20130328092739
20130326035904
20130323160259
20130322173859
20130322173202
20130322162059
20130320070700
20130318231740
20130318030619
20130318012517
20130318002652
20130308204213
20130307225324
20130305005138
20130302214500
20130221214811
20130221035518
20130221032344
20130219184743
20130219171111
20130114154400
20130106210658
20111101212358
20110815233456
20110722211855
20110717010705
20110607194023
20110328215701
20110328215652
20100826232512
20100318213503
20100309211553
20100307073438
20100224172146
20100224171915
20100223001012
20100221005812
20100221003655
20100219230537
20100215230642
20100215225710
20100215224635
20100215224629
20100215223541
20100215213756
20100215182234
20100214080605
20100214080557
20100214080549
20100213183712
20100213181847
20100211191716
20100211191709
20100211181944
20100211025616
20100205224030
20100205163027
20100205162521
20100204214746
20100204211522
\.


--
-- Data for Name: staff_audit_logs; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.staff_audit_logs (id, created_at, updated_at, user_id, action, "values") FROM stdin;
\.


--
-- Data for Name: staff_notes; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.staff_notes (id, created_at, updated_at, user_id, creator_id, body, resolved) FROM stdin;
\.


--
-- Data for Name: tag_aliases; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.tag_aliases (id, antecedent_name, consequent_name, creator_id, creator_ip_addr, forum_topic_id, status, created_at, updated_at, post_count, approver_id, forum_post_id, reason) FROM stdin;
\.


--
-- Data for Name: tag_implications; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.tag_implications (id, antecedent_name, consequent_name, creator_id, creator_ip_addr, forum_topic_id, status, created_at, updated_at, approver_id, forum_post_id, descendant_names, reason) FROM stdin;
20	zuri	chest_ruft	1	127.0.0.1	\N	active	2024-09-01 04:13:19.420338	2024-09-01 04:13:42.520389	1	\N	{chest_ruft}	
14	zuri	mammal	1	127.0.0.1	\N	active	2024-09-01 04:13:19.232243	2024-09-01 04:13:42.535464	1	\N	{mammal}	
5	basil	crow	1	127.0.0.1	\N	active	2024-09-01 04:10:06.150482	2024-09-01 04:10:07.029524	1	\N	{crow}	
3	basil	corvid	1	127.0.0.1	\N	active	2024-09-01 04:10:06.072733	2024-09-01 04:10:07.041801	1	\N	{corvid}	
4	basil	corvus_(genus)	1	127.0.0.1	\N	active	2024-09-01 04:10:06.116498	2024-09-01 04:10:07.045288	1	\N	{corvus_(genus)}	
2	basil	avian	1	127.0.0.1	\N	active	2024-09-01 04:10:06.025145	2024-09-01 04:10:07.046496	1	\N	{avian}	
1	basil	bird	1	127.0.0.1	\N	active	2024-09-01 04:10:05.882578	2024-09-01 04:10:07.081544	1	\N	{bird}	
15	zuri	anthro	1	127.0.0.1	\N	active	2024-09-01 04:13:19.265843	2024-09-01 04:13:42.537627	1	\N	{anthro}	
23	zuri	fur	1	127.0.0.1	\N	active	2024-09-01 04:13:19.515905	2024-09-01 04:13:42.074271	1	\N	{fur}	
6	basil	oscine	1	127.0.0.1	\N	active	2024-09-01 04:10:06.198778	2024-09-01 04:10:07.356373	1	\N	{oscine}	
9	basil	white_feathers	1	127.0.0.1	\N	active	2024-09-01 04:10:06.311677	2024-09-01 04:10:07.364248	1	\N	{white_feathers}	
7	basil	passerine	1	127.0.0.1	\N	active	2024-09-01 04:10:06.234022	2024-09-01 04:10:07.376456	1	\N	{passerine}	
8	basil	anthro	1	127.0.0.1	\N	active	2024-09-01 04:10:06.267108	2024-09-01 04:10:07.390082	1	\N	{anthro}	
10	zuri	felid	1	127.0.0.1	\N	active	2024-09-01 04:13:19.02232	2024-09-01 04:13:42.094413	1	\N	{felid}	
22	zuri	facial_tuft	1	127.0.0.1	\N	active	2024-09-01 04:13:19.479639	2024-09-01 04:13:46.536527	1	\N	{facial_tuft}	
28	zuri	inner_ear_fluff	1	127.0.0.1	\N	active	2024-09-01 04:13:19.663439	2024-09-01 04:13:46.542513	1	\N	{inner_ear_fluff}	
11	zuri	cheetah	1	127.0.0.1	\N	active	2024-09-01 04:13:19.146534	2024-09-01 04:13:42.110336	1	\N	{cheetah}	
25	zuri	highlights_(coloring)	1	127.0.0.1	\N	active	2024-09-01 04:13:19.569759	2024-09-01 04:13:42.111279	1	\N	{highlights_(coloring)}	
17	zuri	black_fur	1	127.0.0.1	\N	active	2024-09-01 04:13:19.327935	2024-09-01 04:13:42.123983	1	\N	{black_fur}	
12	zuri	feline	1	127.0.0.1	\N	active	2024-09-01 04:13:19.178117	2024-09-01 04:13:46.559444	1	\N	{feline}	
13	zuri	felis	1	127.0.0.1	\N	active	2024-09-01 04:13:19.206854	2024-09-01 04:13:46.597863	1	\N	{felis}	
26	zuri	industrial_piercing	1	127.0.0.1	\N	active	2024-09-01 04:13:19.601529	2024-09-01 04:13:36.230175	1	\N	{industrial_piercing}	
27	zuri	industrial_piercing_ladder	1	127.0.0.1	\N	active	2024-09-01 04:13:19.632188	2024-09-01 04:13:36.240801	1	\N	{industrial_piercing_ladder}	
32	zuri	spots	1	127.0.0.1	\N	active	2024-09-01 04:13:19.856577	2024-09-01 04:13:36.281058	1	\N	{spots}	
21	zuri	ear_piercing	1	127.0.0.1	\N	active	2024-09-01 04:13:19.451001	2024-09-01 04:13:42.322091	1	\N	{ear_piercing}	
31	zuri	piercing	1	127.0.0.1	\N	active	2024-09-01 04:13:19.8285	2024-09-01 04:13:36.41111	1	\N	{piercing}	
33	zuri	spotted_body	1	127.0.0.1	\N	active	2024-09-01 04:13:19.884606	2024-09-01 04:13:42.37633	1	\N	{spotted_body}	
18	zuri	blonde_highlights	1	127.0.0.1	\N	active	2024-09-01 04:13:19.363398	2024-09-01 04:13:42.379263	1	\N	{blonde_highlights}	
29	zuri	male	1	127.0.0.1	\N	active	2024-09-01 04:13:19.691462	2024-09-01 04:13:42.391516	1	\N	{male}	
19	zuri	cheek_tuft	1	127.0.0.1	\N	active	2024-09-01 04:13:19.39509	2024-09-01 04:13:41.827969	1	\N	{cheek_tuft}	
24	zuri	hair	1	127.0.0.1	\N	active	2024-09-01 04:13:19.542177	2024-09-01 04:13:41.844391	1	\N	{hair}	
16	zuri	black_body	1	127.0.0.1	\N	active	2024-09-01 04:13:19.295333	2024-09-01 04:13:41.857706	1	\N	{black_body}	
30	zuri	markings	1	127.0.0.1	\N	active	2024-09-01 04:13:19.797564	2024-09-01 04:13:41.8677	1	\N	{markings}	
37	zuri	tongue_out	1	127.0.0.1	\N	active	2024-09-01 04:13:19.994504	2024-09-01 04:13:36.240059	1	\N	{tongue_out}	
35	zuri	tail	1	127.0.0.1	\N	active	2024-09-01 04:13:19.940462	2024-09-01 04:13:36.261879	1	\N	{tail}	
39	zuri	white_body	1	127.0.0.1	\N	active	2024-09-01 04:13:20.053537	2024-09-01 04:13:36.404459	1	\N	{white_body}	
40	zuri	white_fur	1	127.0.0.1	\N	active	2024-09-01 04:13:20.079946	2024-09-01 04:13:36.407594	1	\N	{white_fur}	
41	serene_form	blue_eyes	1	127.0.0.1	\N	active	2024-09-01 04:13:20.106242	2024-09-01 04:13:41.829561	1	\N	{blue_eyes}	
38	zuri	tuft	1	127.0.0.1	\N	active	2024-09-01 04:13:20.02431	2024-09-01 04:13:42.378404	1	\N	{tuft}	
34	zuri	spotted_fur	1	127.0.0.1	\N	active	2024-09-01 04:13:19.914249	2024-09-01 04:13:46.533876	1	\N	{spotted_fur}	
36	zuri	tongue	1	127.0.0.1	\N	active	2024-09-01 04:13:19.964647	2024-09-01 04:13:46.558371	1	\N	{tongue}	
\.


--
-- Data for Name: tag_rel_undos; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.tag_rel_undos (id, tag_rel_type, tag_rel_id, undo_data, applied, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tag_type_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.tag_type_versions (id, created_at, updated_at, old_type, new_type, is_locked, tag_id, creator_id) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.tags (id, name, post_count, category, related_tags, related_tags_updated_at, created_at, updated_at, is_locked) FROM stdin;
45	starsie	0	1	\N	\N	2024-09-01 04:14:31.233527	2024-09-01 04:14:31.233527	f
1	basil	1	0	\N	\N	2024-09-01 04:10:03.246774	2024-09-01 04:10:03.246774	f
2	bird	1	0	\N	\N	2024-09-01 04:10:03.255948	2024-09-01 04:10:03.255948	f
3	avian	1	0	\N	\N	2024-09-01 04:10:03.305934	2024-09-01 04:10:03.305934	f
4	corvid	1	0	\N	\N	2024-09-01 04:10:03.335303	2024-09-01 04:10:03.335303	f
5	corvus_(genus)	1	0	\N	\N	2024-09-01 04:10:03.372608	2024-09-01 04:10:03.372608	f
6	crow	1	0	\N	\N	2024-09-01 04:10:03.40164	2024-09-01 04:10:03.40164	f
7	oscine	1	0	\N	\N	2024-09-01 04:10:03.42197	2024-09-01 04:10:03.42197	f
8	passerine	1	0	\N	\N	2024-09-01 04:10:03.442101	2024-09-01 04:10:03.442101	f
9	anthro	1	0	\N	\N	2024-09-01 04:10:03.464472	2024-09-01 04:10:03.464472	f
10	white_feathers	1	0	\N	\N	2024-09-01 04:10:03.500635	2024-09-01 04:10:03.500635	f
11	zuri	1	0	\N	\N	2024-09-01 04:13:16.410676	2024-09-01 04:13:16.410676	f
12	felid	1	0	\N	\N	2024-09-01 04:13:16.415795	2024-09-01 04:13:16.415795	f
13	cheetah	1	0	\N	\N	2024-09-01 04:13:16.428936	2024-09-01 04:13:16.428936	f
14	feline	1	0	\N	\N	2024-09-01 04:13:16.441388	2024-09-01 04:13:16.441388	f
15	felis	1	0	\N	\N	2024-09-01 04:13:16.453479	2024-09-01 04:13:16.453479	f
16	mammal	1	0	\N	\N	2024-09-01 04:13:16.46498	2024-09-01 04:13:16.46498	f
17	black_body	1	0	\N	\N	2024-09-01 04:13:16.490501	2024-09-01 04:13:16.490501	f
18	black_fur	1	0	\N	\N	2024-09-01 04:13:16.502694	2024-09-01 04:13:16.502694	f
19	blonde_highlights	1	0	\N	\N	2024-09-01 04:13:16.514106	2024-09-01 04:13:16.514106	f
20	cheek_tuft	1	0	\N	\N	2024-09-01 04:13:16.527097	2024-09-01 04:13:16.527097	f
21	chest_ruft	1	0	\N	\N	2024-09-01 04:13:16.54014	2024-09-01 04:13:16.54014	f
22	ear_piercing	1	0	\N	\N	2024-09-01 04:13:16.551403	2024-09-01 04:13:16.551403	f
23	facial_tuft	1	0	\N	\N	2024-09-01 04:13:16.563235	2024-09-01 04:13:16.563235	f
24	fur	1	0	\N	\N	2024-09-01 04:13:16.58192	2024-09-01 04:13:16.58192	f
25	hair	1	0	\N	\N	2024-09-01 04:13:16.594606	2024-09-01 04:13:16.594606	f
26	highlights_(coloring)	1	0	\N	\N	2024-09-01 04:13:16.605708	2024-09-01 04:13:16.605708	f
27	industrial_piercing	1	0	\N	\N	2024-09-01 04:13:16.616974	2024-09-01 04:13:16.616974	f
28	industrial_piercing_ladder	1	0	\N	\N	2024-09-01 04:13:16.628625	2024-09-01 04:13:16.628625	f
29	inner_ear_fluff	1	0	\N	\N	2024-09-01 04:13:16.640991	2024-09-01 04:13:16.640991	f
30	male	1	0	\N	\N	2024-09-01 04:13:16.655835	2024-09-01 04:13:16.655835	f
31	markings	1	0	\N	\N	2024-09-01 04:13:16.672714	2024-09-01 04:13:16.672714	f
32	piercing	1	0	\N	\N	2024-09-01 04:13:16.685807	2024-09-01 04:13:16.685807	f
33	spots	1	0	\N	\N	2024-09-01 04:13:16.69779	2024-09-01 04:13:16.69779	f
34	spotted_body	1	0	\N	\N	2024-09-01 04:13:16.708482	2024-09-01 04:13:16.708482	f
35	spotted_fur	1	0	\N	\N	2024-09-01 04:13:16.720239	2024-09-01 04:13:16.720239	f
36	tail	1	0	\N	\N	2024-09-01 04:13:16.730176	2024-09-01 04:13:16.730176	f
37	tongue	1	0	\N	\N	2024-09-01 04:13:16.739602	2024-09-01 04:13:16.739602	f
38	tongue_out	1	0	\N	\N	2024-09-01 04:13:16.751359	2024-09-01 04:13:16.751359	f
39	tuft	1	0	\N	\N	2024-09-01 04:13:16.762596	2024-09-01 04:13:16.762596	f
40	white_body	1	0	\N	\N	2024-09-01 04:13:16.775128	2024-09-01 04:13:16.775128	f
41	white_fur	1	0	\N	\N	2024-09-01 04:13:16.7874	2024-09-01 04:13:16.7874	f
42	serene_form	1	0	\N	\N	2024-09-01 04:13:16.799026	2024-09-01 04:13:16.799026	f
43	blue_eyes	1	0	\N	\N	2024-09-01 04:13:16.802333	2024-09-01 04:13:16.802333	f
44	starselle	1	1	\N	\N	2024-09-01 04:14:23.914524	2024-09-01 04:14:23.914524	f
46	chair_position	1	0	\N	\N	2024-09-01 04:15:53.979974	2024-09-01 04:15:53.979974	f
47	duo	1	0	\N	\N	2024-09-01 04:15:53.987904	2024-09-01 04:15:53.987904	f
48	male/male	1	0	\N	\N	2024-09-01 04:15:53.989977	2024-09-01 04:15:53.989977	f
49	penetration	1	0	\N	\N	2024-09-01 04:15:53.992044	2024-09-01 04:15:53.992044	f
50	dominant_bottom	1	0	\N	\N	2024-09-01 04:15:53.994002	2024-09-01 04:15:53.994002	f
51	blushing	1	0	\N	\N	2024-09-01 04:15:53.996135	2024-09-01 04:15:53.996135	f
52	hi_res	1	0	\N	\N	2024-09-01 04:15:53.99804	2024-09-01 04:15:53.99804	f
\.


--
-- Data for Name: takedowns; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.takedowns (id, created_at, updated_at, creator_id, creator_ip_addr, approver_id, status, vericode, source, email, reason, reason_hidden, notes, instructions, post_ids, del_post_ids, post_count) FROM stdin;
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.tickets (id, creator_id, creator_ip_addr, disp_id, qtype, status, reason, report_reason, response, handler_id, claimant_id, created_at, updated_at, accused_id) FROM stdin;
\.


--
-- Data for Name: upload_whitelists; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.upload_whitelists (id, pattern, note, reason, allowed, hidden, created_at, updated_at) FROM stdin;
1	https://static1.e621.net/*	\N	\N	t	f	2024-09-01 04:05:18.55095	2024-09-01 04:05:18.55095
\.


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.uploads (id, source, rating, uploader_id, uploader_ip_addr, tag_string, status, backtrace, post_id, md5_confirmation, created_at, updated_at, parent_id, md5, file_ext, file_size, image_width, image_height, description) FROM stdin;
1		e	1	172.19.0.1	male duo male/male anthro penetration chair_position dominant_bottom blushing starselle zuri serene_form basil 	completed	\N	1	\N	2024-09-01 04:15:53.560501	2024-09-01 04:15:54.055169	\N	93dabc87fc19755e89e8510a35e4dfc6	png	2186647	1900	1500	
\.


--
-- Data for Name: user_feedback; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.user_feedback (id, user_id, creator_id, category, body, created_at, updated_at, creator_ip_addr, updater_id, is_deleted) FROM stdin;
\.


--
-- Data for Name: user_name_change_requests; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.user_name_change_requests (id, status, user_id, approver_id, original_name, desired_name, change_reason, rejection_reason, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_password_reset_nonces; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.user_password_reset_nonces (id, key, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: user_statuses; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.user_statuses (id, created_at, updated_at, user_id, post_count, post_deleted_count, post_update_count, post_flag_count, favorite_count, wiki_edit_count, note_count, forum_post_count, comment_count, pool_edit_count, blip_count, set_count, artist_edit_count, own_post_replaced_count, own_post_replaced_penalize_count, post_replacement_rejected_count, ticket_count) FROM stdin;
2	2024-09-01 04:05:16.871192	2024-09-01 04:05:16.871192	2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	2024-09-01 04:05:09.031214	2024-09-01 04:05:09.031214	1	1	0	1	0	0	0	0	0	0	0	0	0	2	0	0	0	0
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.users (id, created_at, updated_at, name, password_hash, email, email_verification_key, level, base_upload_limit, last_logged_in_at, last_forum_read_at, recent_tags, comment_threshold, default_image_size, favorite_tags, blacklisted_tags, time_zone, bcrypt_password_hash, per_page, custom_style, bit_prefs, last_ip_addr, unread_dmail_count, profile_about, profile_artinfo, avatar_id) FROM stdin;
2	2024-09-01 04:05:16.689184	2024-09-01 04:05:16.689184	auto_moderator		system@e621.local	\N	35	10	\N	\N	\N	-10	large	\N		Eastern Time (US & Canada)	$2a$12$MrdOR4CWLtBH763DKcJQbuyhAy8zFapU6ebss47CWj10ERYnzJTOO	75	\N	111680	\N	0			\N
1	2024-08-18 04:05:00.986122	2024-09-01 04:09:46.823403	admin		admin@e621.local	\N	50	10	2024-09-01 04:09:46.822532	\N	\N	-10	large	\N		Eastern Time (US & Canada)	$2a$12$.AJHur8m2hywoKsR9X8TAuKx9QelUyWauL4BLMcxLh72bvlB579je	75	\N	111680	172.19.0.1	0			\N
\.


--
-- Data for Name: wiki_page_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.wiki_page_versions (id, wiki_page_id, updater_id, updater_ip_addr, title, body, is_locked, created_at, updated_at, other_names, is_deleted, reason, parent) FROM stdin;
\.


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.wiki_pages (id, creator_id, title, body, is_locked, created_at, updated_at, updater_id, other_names, is_deleted, parent) FROM stdin;
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.api_keys_id_seq', 1, false);


--
-- Name: artist_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.artist_urls_id_seq', 4, true);


--
-- Name: artist_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.artist_versions_id_seq', 2, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.artists_id_seq', 2, true);


--
-- Name: avoid_posting_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.avoid_posting_versions_id_seq', 1, false);


--
-- Name: avoid_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.avoid_postings_id_seq', 1, false);


--
-- Name: bans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.bans_id_seq', 1, false);


--
-- Name: blips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.blips_id_seq', 1, false);


--
-- Name: bulk_update_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.bulk_update_requests_id_seq', 2, true);


--
-- Name: comment_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.comment_votes_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: destroyed_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.destroyed_posts_id_seq', 1, false);


--
-- Name: dmail_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.dmail_filters_id_seq', 1, false);


--
-- Name: dmails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.dmails_id_seq', 1, false);


--
-- Name: edit_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.edit_histories_id_seq', 1, false);


--
-- Name: email_blacklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.email_blacklists_id_seq', 1, false);


--
-- Name: exception_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.exception_logs_id_seq', 1, false);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- Name: forum_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.forum_categories_id_seq', 1, true);


--
-- Name: forum_post_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.forum_post_votes_id_seq', 1, false);


--
-- Name: forum_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.forum_posts_id_seq', 1, false);


--
-- Name: forum_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.forum_subscriptions_id_seq', 1, false);


--
-- Name: forum_topic_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.forum_topic_visits_id_seq', 1, false);


--
-- Name: forum_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.forum_topics_id_seq', 1, false);


--
-- Name: help_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.help_pages_id_seq', 1, false);


--
-- Name: ip_bans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.ip_bans_id_seq', 1, false);


--
-- Name: mascots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.mascots_id_seq', 1, true);


--
-- Name: mod_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.mod_actions_id_seq', 125, true);


--
-- Name: news_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.news_updates_id_seq', 1, false);


--
-- Name: note_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.note_versions_id_seq', 1, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- Name: pool_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.pool_versions_id_seq', 1, false);


--
-- Name: pools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.pools_id_seq', 1, false);


--
-- Name: post_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_approvals_id_seq', 1, false);


--
-- Name: post_disapprovals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_disapprovals_id_seq', 1, false);


--
-- Name: post_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_events_id_seq', 1, false);


--
-- Name: post_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_flags_id_seq', 1, false);


--
-- Name: post_replacements2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_replacements2_id_seq', 1, false);


--
-- Name: post_report_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_report_reasons_id_seq', 1, false);


--
-- Name: post_set_maintainers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_set_maintainers_id_seq', 1, false);


--
-- Name: post_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_sets_id_seq', 1, false);


--
-- Name: post_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_versions_id_seq', 1, true);


--
-- Name: post_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_votes_id_seq', 1, false);


--
-- Name: posts_change_seq_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.posts_change_seq_seq', 1, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, true);


--
-- Name: staff_audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.staff_audit_logs_id_seq', 1, false);


--
-- Name: staff_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.staff_notes_id_seq', 1, false);


--
-- Name: tag_aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.tag_aliases_id_seq', 1, false);


--
-- Name: tag_implications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.tag_implications_id_seq', 41, true);


--
-- Name: tag_rel_undos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.tag_rel_undos_id_seq', 1, false);


--
-- Name: tag_type_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.tag_type_versions_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.tags_id_seq', 52, true);


--
-- Name: takedowns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.takedowns_id_seq', 1, false);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- Name: upload_whitelists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.upload_whitelists_id_seq', 1, true);


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.uploads_id_seq', 1, true);


--
-- Name: user_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.user_feedback_id_seq', 1, false);


--
-- Name: user_name_change_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.user_name_change_requests_id_seq', 1, false);


--
-- Name: user_password_reset_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.user_password_reset_nonces_id_seq', 1, false);


--
-- Name: user_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.user_statuses_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: wiki_page_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.wiki_page_versions_id_seq', 1, false);


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 1, false);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artist_urls artist_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.artist_urls
    ADD CONSTRAINT artist_urls_pkey PRIMARY KEY (id);


--
-- Name: artist_versions artist_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.artist_versions
    ADD CONSTRAINT artist_versions_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: avoid_posting_versions avoid_posting_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_posting_versions
    ADD CONSTRAINT avoid_posting_versions_pkey PRIMARY KEY (id);


--
-- Name: avoid_postings avoid_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_postings
    ADD CONSTRAINT avoid_postings_pkey PRIMARY KEY (id);


--
-- Name: bans bans_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.bans
    ADD CONSTRAINT bans_pkey PRIMARY KEY (id);


--
-- Name: blips blips_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.blips
    ADD CONSTRAINT blips_pkey PRIMARY KEY (id);


--
-- Name: bulk_update_requests bulk_update_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.bulk_update_requests
    ADD CONSTRAINT bulk_update_requests_pkey PRIMARY KEY (id);


--
-- Name: comment_votes comment_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.comment_votes
    ADD CONSTRAINT comment_votes_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: destroyed_posts destroyed_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.destroyed_posts
    ADD CONSTRAINT destroyed_posts_pkey PRIMARY KEY (id);


--
-- Name: dmail_filters dmail_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.dmail_filters
    ADD CONSTRAINT dmail_filters_pkey PRIMARY KEY (id);


--
-- Name: dmails dmails_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.dmails
    ADD CONSTRAINT dmails_pkey PRIMARY KEY (id);


--
-- Name: edit_histories edit_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.edit_histories
    ADD CONSTRAINT edit_histories_pkey PRIMARY KEY (id);


--
-- Name: email_blacklists email_blacklists_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.email_blacklists
    ADD CONSTRAINT email_blacklists_pkey PRIMARY KEY (id);


--
-- Name: exception_logs exception_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.exception_logs
    ADD CONSTRAINT exception_logs_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: forum_categories forum_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_categories
    ADD CONSTRAINT forum_categories_pkey PRIMARY KEY (id);


--
-- Name: forum_post_votes forum_post_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_post_votes
    ADD CONSTRAINT forum_post_votes_pkey PRIMARY KEY (id);


--
-- Name: forum_posts forum_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_posts
    ADD CONSTRAINT forum_posts_pkey PRIMARY KEY (id);


--
-- Name: forum_subscriptions forum_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_subscriptions
    ADD CONSTRAINT forum_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: forum_topic_visits forum_topic_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_topic_visits
    ADD CONSTRAINT forum_topic_visits_pkey PRIMARY KEY (id);


--
-- Name: forum_topics forum_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.forum_topics
    ADD CONSTRAINT forum_topics_pkey PRIMARY KEY (id);


--
-- Name: help_pages help_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.help_pages
    ADD CONSTRAINT help_pages_pkey PRIMARY KEY (id);


--
-- Name: ip_bans ip_bans_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.ip_bans
    ADD CONSTRAINT ip_bans_pkey PRIMARY KEY (id);


--
-- Name: mascots mascots_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.mascots
    ADD CONSTRAINT mascots_pkey PRIMARY KEY (id);


--
-- Name: mod_actions mod_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.mod_actions
    ADD CONSTRAINT mod_actions_pkey PRIMARY KEY (id);


--
-- Name: news_updates news_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.news_updates
    ADD CONSTRAINT news_updates_pkey PRIMARY KEY (id);


--
-- Name: note_versions note_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.note_versions
    ADD CONSTRAINT note_versions_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: pool_versions pool_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.pool_versions
    ADD CONSTRAINT pool_versions_pkey PRIMARY KEY (id);


--
-- Name: pools pools_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.pools
    ADD CONSTRAINT pools_pkey PRIMARY KEY (id);


--
-- Name: post_approvals post_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_approvals
    ADD CONSTRAINT post_approvals_pkey PRIMARY KEY (id);


--
-- Name: post_disapprovals post_disapprovals_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_disapprovals
    ADD CONSTRAINT post_disapprovals_pkey PRIMARY KEY (id);


--
-- Name: post_events post_events_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_events
    ADD CONSTRAINT post_events_pkey PRIMARY KEY (id);


--
-- Name: post_flags post_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_flags
    ADD CONSTRAINT post_flags_pkey PRIMARY KEY (id);


--
-- Name: post_replacements2 post_replacements2_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_replacements2
    ADD CONSTRAINT post_replacements2_pkey PRIMARY KEY (id);


--
-- Name: post_report_reasons post_report_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_report_reasons
    ADD CONSTRAINT post_report_reasons_pkey PRIMARY KEY (id);


--
-- Name: post_set_maintainers post_set_maintainers_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_set_maintainers
    ADD CONSTRAINT post_set_maintainers_pkey PRIMARY KEY (id);


--
-- Name: post_sets post_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_sets
    ADD CONSTRAINT post_sets_pkey PRIMARY KEY (id);


--
-- Name: post_versions post_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_versions
    ADD CONSTRAINT post_versions_pkey PRIMARY KEY (id);

ALTER TABLE public.post_versions CLUSTER ON post_versions_pkey;


--
-- Name: post_votes post_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_votes
    ADD CONSTRAINT post_votes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: staff_audit_logs staff_audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.staff_audit_logs
    ADD CONSTRAINT staff_audit_logs_pkey PRIMARY KEY (id);


--
-- Name: staff_notes staff_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.staff_notes
    ADD CONSTRAINT staff_notes_pkey PRIMARY KEY (id);


--
-- Name: tag_aliases tag_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_aliases
    ADD CONSTRAINT tag_aliases_pkey PRIMARY KEY (id);


--
-- Name: tag_implications tag_implications_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_implications
    ADD CONSTRAINT tag_implications_pkey PRIMARY KEY (id);


--
-- Name: tag_rel_undos tag_rel_undos_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_rel_undos
    ADD CONSTRAINT tag_rel_undos_pkey PRIMARY KEY (id);


--
-- Name: tag_type_versions tag_type_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tag_type_versions
    ADD CONSTRAINT tag_type_versions_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: takedowns takedowns_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.takedowns
    ADD CONSTRAINT takedowns_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: upload_whitelists upload_whitelists_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.upload_whitelists
    ADD CONSTRAINT upload_whitelists_pkey PRIMARY KEY (id);


--
-- Name: uploads uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: user_feedback user_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT user_feedback_pkey PRIMARY KEY (id);


--
-- Name: user_name_change_requests user_name_change_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_name_change_requests
    ADD CONSTRAINT user_name_change_requests_pkey PRIMARY KEY (id);


--
-- Name: user_password_reset_nonces user_password_reset_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_password_reset_nonces
    ADD CONSTRAINT user_password_reset_nonces_pkey PRIMARY KEY (id);


--
-- Name: user_statuses user_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_statuses
    ADD CONSTRAINT user_statuses_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wiki_page_versions wiki_page_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.wiki_page_versions
    ADD CONSTRAINT wiki_page_versions_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: index_api_keys_on_key; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_api_keys_on_key ON public.api_keys USING btree (key);


--
-- Name: index_api_keys_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_api_keys_on_user_id ON public.api_keys USING btree (user_id);


--
-- Name: index_artist_urls_on_artist_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_urls_on_artist_id ON public.artist_urls USING btree (artist_id);


--
-- Name: index_artist_urls_on_normalized_url_pattern; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_urls_on_normalized_url_pattern ON public.artist_urls USING btree (normalized_url text_pattern_ops);


--
-- Name: index_artist_urls_on_normalized_url_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_urls_on_normalized_url_trgm ON public.artist_urls USING gin (normalized_url public.gin_trgm_ops);


--
-- Name: index_artist_urls_on_url_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_urls_on_url_trgm ON public.artist_urls USING gin (url public.gin_trgm_ops);


--
-- Name: index_artist_versions_on_artist_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_versions_on_artist_id ON public.artist_versions USING btree (artist_id);


--
-- Name: index_artist_versions_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_versions_on_created_at ON public.artist_versions USING btree (created_at);


--
-- Name: index_artist_versions_on_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_versions_on_name ON public.artist_versions USING btree (name);


--
-- Name: index_artist_versions_on_updater_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_versions_on_updater_id ON public.artist_versions USING btree (updater_id);


--
-- Name: index_artist_versions_on_updater_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artist_versions_on_updater_ip_addr ON public.artist_versions USING btree (updater_ip_addr);


--
-- Name: index_artists_on_group_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artists_on_group_name ON public.artists USING btree (group_name);


--
-- Name: index_artists_on_group_name_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artists_on_group_name_trgm ON public.artists USING gin (group_name public.gin_trgm_ops);


--
-- Name: index_artists_on_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_artists_on_name ON public.artists USING btree (name);


--
-- Name: index_artists_on_name_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artists_on_name_trgm ON public.artists USING gin (name public.gin_trgm_ops);


--
-- Name: index_artists_on_other_names; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_artists_on_other_names ON public.artists USING gin (other_names);


--
-- Name: index_avoid_posting_versions_on_avoid_posting_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_avoid_posting_versions_on_avoid_posting_id ON public.avoid_posting_versions USING btree (avoid_posting_id);


--
-- Name: index_avoid_posting_versions_on_updater_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_avoid_posting_versions_on_updater_id ON public.avoid_posting_versions USING btree (updater_id);


--
-- Name: index_avoid_postings_on_artist_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_avoid_postings_on_artist_id ON public.avoid_postings USING btree (artist_id);


--
-- Name: index_avoid_postings_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_avoid_postings_on_creator_id ON public.avoid_postings USING btree (creator_id);


--
-- Name: index_avoid_postings_on_updater_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_avoid_postings_on_updater_id ON public.avoid_postings USING btree (updater_id);


--
-- Name: index_bans_on_banner_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_bans_on_banner_id ON public.bans USING btree (banner_id);


--
-- Name: index_bans_on_expires_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_bans_on_expires_at ON public.bans USING btree (expires_at);


--
-- Name: index_bans_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_bans_on_user_id ON public.bans USING btree (user_id);


--
-- Name: index_blips_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_blips_on_lower_body_trgm ON public.blips USING gin (lower((body)::text) public.gin_trgm_ops);


--
-- Name: index_blips_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_blips_on_to_tsvector_english_body ON public.blips USING gin (to_tsvector('english'::regconfig, (body)::text));


--
-- Name: index_bulk_update_requests_on_forum_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_bulk_update_requests_on_forum_post_id ON public.bulk_update_requests USING btree (forum_post_id);


--
-- Name: index_comment_votes_on_comment_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comment_votes_on_comment_id ON public.comment_votes USING btree (comment_id);


--
-- Name: index_comment_votes_on_comment_id_and_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_comment_votes_on_comment_id_and_user_id ON public.comment_votes USING btree (comment_id, user_id);


--
-- Name: index_comment_votes_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comment_votes_on_created_at ON public.comment_votes USING btree (created_at);


--
-- Name: index_comment_votes_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comment_votes_on_user_id ON public.comment_votes USING btree (user_id);


--
-- Name: index_comments_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comments_on_creator_id ON public.comments USING btree (creator_id);


--
-- Name: index_comments_on_creator_id_and_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comments_on_creator_id_and_post_id ON public.comments USING btree (creator_id, post_id);


--
-- Name: index_comments_on_creator_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comments_on_creator_ip_addr ON public.comments USING btree (creator_ip_addr);


--
-- Name: index_comments_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comments_on_lower_body_trgm ON public.comments USING gin (lower(body) public.gin_trgm_ops);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comments_on_post_id ON public.comments USING btree (post_id);


--
-- Name: index_comments_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_comments_on_to_tsvector_english_body ON public.comments USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_dmail_filters_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_dmail_filters_on_user_id ON public.dmail_filters USING btree (user_id);


--
-- Name: index_dmails_on_creator_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_dmails_on_creator_ip_addr ON public.dmails USING btree (creator_ip_addr);


--
-- Name: index_dmails_on_is_deleted; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_dmails_on_is_deleted ON public.dmails USING btree (is_deleted);


--
-- Name: index_dmails_on_is_read; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_dmails_on_is_read ON public.dmails USING btree (is_read);


--
-- Name: index_dmails_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_dmails_on_lower_body_trgm ON public.dmails USING gin (lower(body) public.gin_trgm_ops);


--
-- Name: index_dmails_on_owner_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_dmails_on_owner_id ON public.dmails USING btree (owner_id);


--
-- Name: index_dmails_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_dmails_on_to_tsvector_english_body ON public.dmails USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_edit_histories_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_edit_histories_on_user_id ON public.edit_histories USING btree (user_id);


--
-- Name: index_edit_histories_on_versionable_id_and_versionable_type; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_edit_histories_on_versionable_id_and_versionable_type ON public.edit_histories USING btree (versionable_id, versionable_type);


--
-- Name: index_favorites_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_favorites_on_post_id ON public.favorites USING btree (post_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_favorites_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_favorites_on_user_id_and_post_id ON public.favorites USING btree (user_id, post_id);


--
-- Name: index_forum_post_votes_on_forum_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_post_votes_on_forum_post_id ON public.forum_post_votes USING btree (forum_post_id);


--
-- Name: index_forum_post_votes_on_forum_post_id_and_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_forum_post_votes_on_forum_post_id_and_creator_id ON public.forum_post_votes USING btree (forum_post_id, creator_id);


--
-- Name: index_forum_posts_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_posts_on_creator_id ON public.forum_posts USING btree (creator_id);


--
-- Name: index_forum_posts_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_posts_on_lower_body_trgm ON public.forum_posts USING gin (lower(body) public.gin_trgm_ops);


--
-- Name: index_forum_posts_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_posts_on_to_tsvector_english_body ON public.forum_posts USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_forum_posts_on_topic_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_posts_on_topic_id ON public.forum_posts USING btree (topic_id);


--
-- Name: index_forum_subscriptions_on_forum_topic_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_subscriptions_on_forum_topic_id ON public.forum_subscriptions USING btree (forum_topic_id);


--
-- Name: index_forum_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_subscriptions_on_user_id ON public.forum_subscriptions USING btree (user_id);


--
-- Name: index_forum_topic_visits_on_forum_topic_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topic_visits_on_forum_topic_id ON public.forum_topic_visits USING btree (forum_topic_id);


--
-- Name: index_forum_topic_visits_on_last_read_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topic_visits_on_last_read_at ON public.forum_topic_visits USING btree (last_read_at);


--
-- Name: index_forum_topic_visits_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topic_visits_on_user_id ON public.forum_topic_visits USING btree (user_id);


--
-- Name: index_forum_topics_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topics_on_creator_id ON public.forum_topics USING btree (creator_id);


--
-- Name: index_forum_topics_on_is_sticky_and_updated_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topics_on_is_sticky_and_updated_at ON public.forum_topics USING btree (is_sticky, updated_at);


--
-- Name: index_forum_topics_on_lower_title_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topics_on_lower_title_trgm ON public.forum_topics USING gin (lower((title)::text) public.gin_trgm_ops);


--
-- Name: index_forum_topics_on_to_tsvector_english_title; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topics_on_to_tsvector_english_title ON public.forum_topics USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: index_forum_topics_on_updated_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_forum_topics_on_updated_at ON public.forum_topics USING btree (updated_at);


--
-- Name: index_ip_bans_on_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_ip_bans_on_ip_addr ON public.ip_bans USING btree (ip_addr);


--
-- Name: index_mascots_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_mascots_on_creator_id ON public.mascots USING btree (creator_id);


--
-- Name: index_mascots_on_md5; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_mascots_on_md5 ON public.mascots USING btree (md5);


--
-- Name: index_mod_actions_on_action; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_mod_actions_on_action ON public.mod_actions USING btree (action);


--
-- Name: index_news_updates_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_news_updates_on_created_at ON public.news_updates USING btree (created_at);


--
-- Name: index_note_versions_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_note_versions_on_created_at ON public.note_versions USING btree (created_at);


--
-- Name: index_note_versions_on_note_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_note_versions_on_note_id ON public.note_versions USING btree (note_id);


--
-- Name: index_note_versions_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_note_versions_on_post_id ON public.note_versions USING btree (post_id);


--
-- Name: index_note_versions_on_updater_id_and_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_note_versions_on_updater_id_and_post_id ON public.note_versions USING btree (updater_id, post_id);


--
-- Name: index_note_versions_on_updater_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_note_versions_on_updater_ip_addr ON public.note_versions USING btree (updater_ip_addr);


--
-- Name: index_notes_on_creator_id_and_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_notes_on_creator_id_and_post_id ON public.notes USING btree (creator_id, post_id);


--
-- Name: index_notes_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_notes_on_lower_body_trgm ON public.notes USING gin (lower(body) public.gin_trgm_ops);


--
-- Name: index_notes_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_notes_on_post_id ON public.notes USING btree (post_id);


--
-- Name: index_notes_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_notes_on_to_tsvector_english_body ON public.notes USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_pool_versions_on_pool_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pool_versions_on_pool_id ON public.pool_versions USING btree (pool_id);


--
-- Name: index_pool_versions_on_updater_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pool_versions_on_updater_id ON public.pool_versions USING btree (updater_id);


--
-- Name: index_pool_versions_on_updater_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pool_versions_on_updater_ip_addr ON public.pool_versions USING btree (updater_ip_addr);


--
-- Name: index_pools_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pools_on_creator_id ON public.pools USING btree (creator_id);


--
-- Name: index_pools_on_lower_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pools_on_lower_name ON public.pools USING btree (lower((name)::text));


--
-- Name: index_pools_on_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pools_on_name ON public.pools USING btree (name);


--
-- Name: index_pools_on_name_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pools_on_name_trgm ON public.pools USING gin (lower((name)::text) public.gin_trgm_ops);


--
-- Name: index_pools_on_updated_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_pools_on_updated_at ON public.pools USING btree (updated_at);


--
-- Name: index_post_approvals_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_approvals_on_post_id ON public.post_approvals USING btree (post_id);


--
-- Name: index_post_approvals_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_approvals_on_user_id ON public.post_approvals USING btree (user_id);


--
-- Name: index_post_disapprovals_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_disapprovals_on_post_id ON public.post_disapprovals USING btree (post_id);


--
-- Name: index_post_disapprovals_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_disapprovals_on_user_id ON public.post_disapprovals USING btree (user_id);


--
-- Name: index_post_events_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_events_on_creator_id ON public.post_events USING btree (creator_id);


--
-- Name: index_post_events_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_events_on_post_id ON public.post_events USING btree (post_id);


--
-- Name: index_post_flags_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_flags_on_creator_id ON public.post_flags USING btree (creator_id);


--
-- Name: index_post_flags_on_creator_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_flags_on_creator_ip_addr ON public.post_flags USING btree (creator_ip_addr);


--
-- Name: index_post_flags_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_flags_on_post_id ON public.post_flags USING btree (post_id);


--
-- Name: index_post_flags_on_reason_tsvector; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_flags_on_reason_tsvector ON public.post_flags USING gin (to_tsvector('english'::regconfig, reason));


--
-- Name: index_post_replacements2_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_replacements2_on_creator_id ON public.post_replacements2 USING btree (creator_id);


--
-- Name: index_post_replacements2_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_replacements2_on_post_id ON public.post_replacements2 USING btree (post_id);


--
-- Name: index_post_sets_on_post_ids; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_sets_on_post_ids ON public.post_sets USING gin (post_ids);


--
-- Name: index_post_versions_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_versions_on_post_id ON public.post_versions USING btree (post_id);


--
-- Name: index_post_versions_on_updated_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_versions_on_updated_at ON public.post_versions USING btree (updated_at);


--
-- Name: index_post_versions_on_updater_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_versions_on_updater_id ON public.post_versions USING btree (updater_id);


--
-- Name: index_post_versions_on_updater_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_versions_on_updater_ip_addr ON public.post_versions USING btree (updater_ip_addr);


--
-- Name: index_post_votes_on_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_votes_on_post_id ON public.post_votes USING btree (post_id);


--
-- Name: index_post_votes_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_post_votes_on_user_id ON public.post_votes USING btree (user_id);


--
-- Name: index_post_votes_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_post_votes_on_user_id_and_post_id ON public.post_votes USING btree (user_id, post_id);


--
-- Name: index_posts_on_change_seq; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_posts_on_change_seq ON public.posts USING btree (change_seq);


--
-- Name: index_posts_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_created_at ON public.posts USING btree (created_at);


--
-- Name: index_posts_on_is_flagged; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_is_flagged ON public.posts USING btree (is_flagged) WHERE (is_flagged = true);


--
-- Name: index_posts_on_is_pending; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_is_pending ON public.posts USING btree (is_pending) WHERE (is_pending = true);


--
-- Name: index_posts_on_md5; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_posts_on_md5 ON public.posts USING btree (md5);


--
-- Name: index_posts_on_parent_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_parent_id ON public.posts USING btree (parent_id);


--
-- Name: index_posts_on_string_to_array_tag_string; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_string_to_array_tag_string ON public.posts USING gin (string_to_array(tag_string, ' '::text));
ALTER INDEX public.index_posts_on_string_to_array_tag_string ALTER COLUMN 1 SET STATISTICS 3000;


--
-- Name: index_posts_on_uploader_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_uploader_id ON public.posts USING btree (uploader_id);


--
-- Name: index_posts_on_uploader_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_posts_on_uploader_ip_addr ON public.posts USING btree (uploader_ip_addr);


--
-- Name: index_staff_audit_logs_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_staff_audit_logs_on_user_id ON public.staff_audit_logs USING btree (user_id);


--
-- Name: index_staff_notes_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_staff_notes_on_creator_id ON public.staff_notes USING btree (creator_id);


--
-- Name: index_staff_notes_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_staff_notes_on_user_id ON public.staff_notes USING btree (user_id);


--
-- Name: index_tag_aliases_on_antecedent_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_aliases_on_antecedent_name ON public.tag_aliases USING btree (antecedent_name);


--
-- Name: index_tag_aliases_on_antecedent_name_pattern; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_aliases_on_antecedent_name_pattern ON public.tag_aliases USING btree (antecedent_name text_pattern_ops);


--
-- Name: index_tag_aliases_on_consequent_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_aliases_on_consequent_name ON public.tag_aliases USING btree (consequent_name);


--
-- Name: index_tag_aliases_on_forum_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_aliases_on_forum_post_id ON public.tag_aliases USING btree (forum_post_id);


--
-- Name: index_tag_aliases_on_post_count; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_aliases_on_post_count ON public.tag_aliases USING btree (post_count);


--
-- Name: index_tag_implications_on_antecedent_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_implications_on_antecedent_name ON public.tag_implications USING btree (antecedent_name);


--
-- Name: index_tag_implications_on_consequent_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_implications_on_consequent_name ON public.tag_implications USING btree (consequent_name);


--
-- Name: index_tag_implications_on_forum_post_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_implications_on_forum_post_id ON public.tag_implications USING btree (forum_post_id);


--
-- Name: index_tag_rel_undos_on_tag_rel_type_and_tag_rel_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_rel_undos_on_tag_rel_type_and_tag_rel_id ON public.tag_rel_undos USING btree (tag_rel_type, tag_rel_id);


--
-- Name: index_tag_type_versions_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_type_versions_on_creator_id ON public.tag_type_versions USING btree (creator_id);


--
-- Name: index_tag_type_versions_on_tag_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tag_type_versions_on_tag_id ON public.tag_type_versions USING btree (tag_id);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_tags_on_name_pattern; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tags_on_name_pattern ON public.tags USING btree (name text_pattern_ops);


--
-- Name: index_tags_on_name_prefix; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tags_on_name_prefix ON public.tags USING gin (regexp_replace((name)::text, '([a-z0-9])[a-z0-9'']*($|[^a-z0-9'']+)'::text, '\1'::text, 'g'::text) public.gin_trgm_ops);


--
-- Name: index_tags_on_name_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_tags_on_name_trgm ON public.tags USING gin (name public.gin_trgm_ops);


--
-- Name: index_uploads_on_source; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_uploads_on_source ON public.uploads USING btree (source);


--
-- Name: index_uploads_on_uploader_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_uploads_on_uploader_id ON public.uploads USING btree (uploader_id);


--
-- Name: index_uploads_on_uploader_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_uploads_on_uploader_ip_addr ON public.uploads USING btree (uploader_ip_addr);


--
-- Name: index_user_feedback_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_feedback_on_created_at ON public.user_feedback USING btree (created_at);


--
-- Name: index_user_feedback_on_creator_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_feedback_on_creator_id ON public.user_feedback USING btree (creator_id);


--
-- Name: index_user_feedback_on_creator_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_feedback_on_creator_ip_addr ON public.user_feedback USING btree (creator_ip_addr);


--
-- Name: index_user_feedback_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_feedback_on_lower_body_trgm ON public.user_feedback USING gin (lower(body) public.gin_trgm_ops);


--
-- Name: index_user_feedback_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_feedback_on_to_tsvector_english_body ON public.user_feedback USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_user_feedback_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_feedback_on_user_id ON public.user_feedback USING btree (user_id);


--
-- Name: index_user_lower_email; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_lower_email ON public.users USING btree (lower((email)::text));


--
-- Name: index_user_name_change_requests_on_original_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_name_change_requests_on_original_name ON public.user_name_change_requests USING btree (original_name);


--
-- Name: index_user_name_change_requests_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_user_name_change_requests_on_user_id ON public.user_name_change_requests USING btree (user_id);


--
-- Name: index_user_statuses_on_user_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_user_statuses_on_user_id ON public.user_statuses USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_last_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_users_on_last_ip_addr ON public.users USING btree (last_ip_addr) WHERE (last_ip_addr IS NOT NULL);


--
-- Name: index_users_on_lower_profile_about_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_users_on_lower_profile_about_trgm ON public.users USING gin (lower(profile_about) public.gin_trgm_ops);


--
-- Name: index_users_on_lower_profile_artinfo_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_users_on_lower_profile_artinfo_trgm ON public.users USING gin (lower(profile_artinfo) public.gin_trgm_ops);


--
-- Name: index_users_on_name; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_users_on_name ON public.users USING btree (lower((name)::text));


--
-- Name: index_users_on_to_tsvector_english_profile_about; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_users_on_to_tsvector_english_profile_about ON public.users USING gin (to_tsvector('english'::regconfig, profile_about));


--
-- Name: index_users_on_to_tsvector_english_profile_artinfo; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_users_on_to_tsvector_english_profile_artinfo ON public.users USING gin (to_tsvector('english'::regconfig, profile_artinfo));


--
-- Name: index_wiki_page_versions_on_created_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_page_versions_on_created_at ON public.wiki_page_versions USING btree (created_at);


--
-- Name: index_wiki_page_versions_on_updater_ip_addr; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_page_versions_on_updater_ip_addr ON public.wiki_page_versions USING btree (updater_ip_addr);


--
-- Name: index_wiki_page_versions_on_wiki_page_id; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_page_versions_on_wiki_page_id ON public.wiki_page_versions USING btree (wiki_page_id);


--
-- Name: index_wiki_pages_on_lower_body_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_pages_on_lower_body_trgm ON public.wiki_pages USING gin (lower(body) public.gin_trgm_ops);


--
-- Name: index_wiki_pages_on_lower_title_trgm; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_pages_on_lower_title_trgm ON public.wiki_pages USING gin (lower((title)::text) public.gin_trgm_ops);


--
-- Name: index_wiki_pages_on_other_names; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_pages_on_other_names ON public.wiki_pages USING gin (other_names);


--
-- Name: index_wiki_pages_on_title; Type: INDEX; Schema: public; Owner: e621
--

CREATE UNIQUE INDEX index_wiki_pages_on_title ON public.wiki_pages USING btree (title);


--
-- Name: index_wiki_pages_on_title_pattern; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_pages_on_title_pattern ON public.wiki_pages USING btree (title text_pattern_ops);


--
-- Name: index_wiki_pages_on_to_tsvector_english_body; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_pages_on_to_tsvector_english_body ON public.wiki_pages USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_wiki_pages_on_updated_at; Type: INDEX; Schema: public; Owner: e621
--

CREATE INDEX index_wiki_pages_on_updated_at ON public.wiki_pages USING btree (updated_at);


--
-- Name: posts posts_update_change_seq; Type: TRIGGER; Schema: public; Owner: e621
--

CREATE TRIGGER posts_update_change_seq BEFORE UPDATE ON public.posts FOR EACH ROW EXECUTE FUNCTION public.posts_trigger_change_seq();


--
-- Name: staff_audit_logs fk_rails_02329e5ef9; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.staff_audit_logs
    ADD CONSTRAINT fk_rails_02329e5ef9 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: avoid_posting_versions fk_rails_1d1f54e17a; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_posting_versions
    ADD CONSTRAINT fk_rails_1d1f54e17a FOREIGN KEY (updater_id) REFERENCES public.users(id);


--
-- Name: blips fk_rails_23e7479aac; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.blips
    ADD CONSTRAINT fk_rails_23e7479aac FOREIGN KEY (updater_id) REFERENCES public.users(id);


--
-- Name: tickets fk_rails_45cd696dba; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_rails_45cd696dba FOREIGN KEY (accused_id) REFERENCES public.users(id);


--
-- Name: avoid_posting_versions fk_rails_4c48affea5; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_posting_versions
    ADD CONSTRAINT fk_rails_4c48affea5 FOREIGN KEY (avoid_posting_id) REFERENCES public.avoid_postings(id);


--
-- Name: user_feedback fk_rails_9329a36823; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT fk_rails_9329a36823 FOREIGN KEY (updater_id) REFERENCES public.users(id);


--
-- Name: mascots fk_rails_9901e810fa; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.mascots
    ADD CONSTRAINT fk_rails_9901e810fa FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: favorites fk_rails_a7668ef613; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_a7668ef613 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: avoid_postings fk_rails_b2ebf2bc30; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_postings
    ADD CONSTRAINT fk_rails_b2ebf2bc30 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: staff_notes fk_rails_bab7e2d92a; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.staff_notes
    ADD CONSTRAINT fk_rails_bab7e2d92a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: post_events fk_rails_bd327ccee6; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.post_events
    ADD CONSTRAINT fk_rails_bd327ccee6 FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: avoid_postings fk_rails_cccc6419c8; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_postings
    ADD CONSTRAINT fk_rails_cccc6419c8 FOREIGN KEY (updater_id) REFERENCES public.users(id);


--
-- Name: favorites fk_rails_d20e53bb68; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d20e53bb68 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: avoid_postings fk_rails_d45cc0f1a1; Type: FK CONSTRAINT; Schema: public; Owner: e621
--

ALTER TABLE ONLY public.avoid_postings
    ADD CONSTRAINT fk_rails_d45cc0f1a1 FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

