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
environment	development	2024-09-01 03:45:09.645883	2024-09-01 03:45:09.645885
schema_sha1	f2e98d318322cce7af7d935e2d86308f8c496284	2024-09-01 03:45:09.652472	2024-09-01 03:45:09.652473
\.


--
-- Data for Name: artist_urls; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.artist_urls (id, artist_id, url, normalized_url, created_at, updated_at, is_active) FROM stdin;
\.


--
-- Data for Name: artist_versions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.artist_versions (id, artist_id, name, updater_id, updater_ip_addr, is_active, group_name, created_at, updated_at, other_names, urls, notes_changed) FROM stdin;
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.artists (id, name, creator_id, is_active, group_name, created_at, updated_at, other_names, linked_user_id, is_locked) FROM stdin;
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
1	1	Hexerade 3	53a014c46528923fc4baf2192af926bd	png	#012e57	https://furaffinity.net/user/chizi	chizi	t	2024-09-01 03:45:33.8679	2024-09-01 03:45:33.8679	{e621}
\.


--
-- Data for Name: mod_actions; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.mod_actions (id, creator_id, created_at, updated_at, action, "values") FROM stdin;
1	1	2024-09-01 03:45:33.936921	2024-09-01 03:45:33.936921	upload_whitelist_create	{"pattern":"https://static1.e621.net/*","note":null,"hidden":false}
2	1	2024-09-01 03:45:33.942036	2024-09-01 03:45:33.942036	upload_whitelist_update	{"pattern":"https://static1.e621.net/*","note":null,"old_pattern":null,"hidden":false}
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
1	https://static1.e621.net/*	\N	\N	t	f	2024-09-01 03:45:33.92007	2024-09-01 03:45:33.92007
\.


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.uploads (id, source, rating, uploader_id, uploader_ip_addr, tag_string, status, backtrace, post_id, md5_confirmation, created_at, updated_at, parent_id, md5, file_ext, file_size, image_width, image_height, description) FROM stdin;
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
1	2024-09-01 03:45:21.340617	2024-09-01 03:45:21.340617	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	2024-09-01 03:45:29.183188	2024-09-01 03:45:29.183188	2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: e621
--

COPY public.users (id, created_at, updated_at, name, password_hash, email, email_verification_key, level, base_upload_limit, last_logged_in_at, last_forum_read_at, recent_tags, comment_threshold, default_image_size, favorite_tags, blacklisted_tags, time_zone, bcrypt_password_hash, per_page, custom_style, bit_prefs, last_ip_addr, unread_dmail_count, profile_about, profile_artinfo, avatar_id) FROM stdin;
1	2024-08-18 03:45:13.402387	2024-09-01 03:45:21.125306	admin		admin@e621.local	\N	50	10	\N	\N	\N	-10	large	\N		Eastern Time (US & Canada)	$2a$12$YkafQPVd2i.6iJk8CqKNN.sZ6YBDGX4C58t4wo909uam4ZKSNuJsi	75	\N	111680	\N	0			\N
2	2024-09-01 03:45:29.000556	2024-09-01 03:45:29.000556	auto_moderator		system@e621.local	\N	35	10	\N	\N	\N	-10	large	\N		Eastern Time (US & Canada)	$2a$12$sqhtYBvkjYwWk.BcgLra6Oy.CMfYY2SXaVW9ohh1te1WyKBUBg/sq	75	\N	111680	\N	0			\N
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

SELECT pg_catalog.setval('public.artist_urls_id_seq', 1, false);


--
-- Name: artist_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.artist_versions_id_seq', 1, false);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.artists_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.bulk_update_requests_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.mod_actions_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.post_versions_id_seq', 1, false);


--
-- Name: post_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.post_votes_id_seq', 1, false);


--
-- Name: posts_change_seq_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.posts_change_seq_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e621
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.tag_implications_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.uploads_id_seq', 1, false);


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

