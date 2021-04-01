--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-01 11:42:56 -03

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
-- TOC entry 200 (class 1259 OID 16385)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- TOC entry 201 (class 1259 OID 16391)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- TOC entry 202 (class 1259 OID 16394)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- TOC entry 203 (class 1259 OID 16398)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- TOC entry 204 (class 1259 OID 16407)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- TOC entry 205 (class 1259 OID 16410)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- TOC entry 206 (class 1259 OID 16416)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- TOC entry 207 (class 1259 OID 16422)
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- TOC entry 208 (class 1259 OID 16441)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- TOC entry 209 (class 1259 OID 16447)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- TOC entry 210 (class 1259 OID 16450)
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- TOC entry 211 (class 1259 OID 16453)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- TOC entry 212 (class 1259 OID 16456)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- TOC entry 213 (class 1259 OID 16459)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- TOC entry 214 (class 1259 OID 16465)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- TOC entry 215 (class 1259 OID 16471)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- TOC entry 216 (class 1259 OID 16475)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- TOC entry 217 (class 1259 OID 16478)
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- TOC entry 218 (class 1259 OID 16484)
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- TOC entry 219 (class 1259 OID 16487)
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- TOC entry 220 (class 1259 OID 16493)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- TOC entry 221 (class 1259 OID 16496)
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- TOC entry 222 (class 1259 OID 16499)
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- TOC entry 223 (class 1259 OID 16505)
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- TOC entry 224 (class 1259 OID 16511)
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- TOC entry 225 (class 1259 OID 16517)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- TOC entry 226 (class 1259 OID 16520)
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- TOC entry 227 (class 1259 OID 16526)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- TOC entry 228 (class 1259 OID 16532)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- TOC entry 229 (class 1259 OID 16535)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- TOC entry 230 (class 1259 OID 16539)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- TOC entry 231 (class 1259 OID 16545)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- TOC entry 232 (class 1259 OID 16551)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- TOC entry 233 (class 1259 OID 16557)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- TOC entry 234 (class 1259 OID 16560)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- TOC entry 235 (class 1259 OID 16566)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- TOC entry 236 (class 1259 OID 16569)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- TOC entry 237 (class 1259 OID 16576)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- TOC entry 238 (class 1259 OID 16579)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- TOC entry 239 (class 1259 OID 16585)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- TOC entry 240 (class 1259 OID 16591)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- TOC entry 241 (class 1259 OID 16598)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- TOC entry 242 (class 1259 OID 16601)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- TOC entry 243 (class 1259 OID 16613)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- TOC entry 244 (class 1259 OID 16619)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- TOC entry 245 (class 1259 OID 16625)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- TOC entry 246 (class 1259 OID 16631)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- TOC entry 247 (class 1259 OID 16634)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- TOC entry 248 (class 1259 OID 16641)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- TOC entry 249 (class 1259 OID 16645)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- TOC entry 250 (class 1259 OID 16653)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- TOC entry 251 (class 1259 OID 16660)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- TOC entry 252 (class 1259 OID 16666)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- TOC entry 253 (class 1259 OID 16672)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- TOC entry 254 (class 1259 OID 16678)
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- TOC entry 255 (class 1259 OID 16712)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- TOC entry 256 (class 1259 OID 16718)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- TOC entry 257 (class 1259 OID 16721)
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- TOC entry 258 (class 1259 OID 16724)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- TOC entry 259 (class 1259 OID 16727)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- TOC entry 260 (class 1259 OID 16730)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- TOC entry 261 (class 1259 OID 16736)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- TOC entry 262 (class 1259 OID 16744)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- TOC entry 263 (class 1259 OID 16750)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- TOC entry 264 (class 1259 OID 16753)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- TOC entry 265 (class 1259 OID 16756)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- TOC entry 266 (class 1259 OID 16762)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- TOC entry 267 (class 1259 OID 16770)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- TOC entry 268 (class 1259 OID 16777)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- TOC entry 269 (class 1259 OID 16780)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- TOC entry 270 (class 1259 OID 16783)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- TOC entry 271 (class 1259 OID 16788)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- TOC entry 272 (class 1259 OID 16794)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- TOC entry 273 (class 1259 OID 16800)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- TOC entry 274 (class 1259 OID 16807)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- TOC entry 275 (class 1259 OID 16813)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- TOC entry 276 (class 1259 OID 16816)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- TOC entry 277 (class 1259 OID 16822)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- TOC entry 278 (class 1259 OID 16825)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- TOC entry 279 (class 1259 OID 16828)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- TOC entry 280 (class 1259 OID 16835)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- TOC entry 281 (class 1259 OID 16841)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- TOC entry 282 (class 1259 OID 16844)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- TOC entry 283 (class 1259 OID 16853)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- TOC entry 284 (class 1259 OID 16859)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- TOC entry 285 (class 1259 OID 16865)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- TOC entry 286 (class 1259 OID 16871)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- TOC entry 287 (class 1259 OID 16877)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- TOC entry 288 (class 1259 OID 16880)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- TOC entry 289 (class 1259 OID 16884)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- TOC entry 290 (class 1259 OID 16887)
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- TOC entry 291 (class 1259 OID 16894)
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- TOC entry 292 (class 1259 OID 16900)
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- TOC entry 293 (class 1259 OID 16906)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- TOC entry 3810 (class 0 OID 16385)
-- Dependencies: 200
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- TOC entry 3811 (class 0 OID 16391)
-- Dependencies: 201
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 3812 (class 0 OID 16394)
-- Dependencies: 202
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
1cc9049a-eff0-4223-8ecd-771c4a7a8350	\N	auth-cookie	master	23253ffd-4f87-4f2a-8541-adcca50a7bac	2	10	f	\N	\N
b70e4872-16ee-4210-90bd-4774caf79b36	\N	auth-spnego	master	23253ffd-4f87-4f2a-8541-adcca50a7bac	3	20	f	\N	\N
195f7bff-fb22-461c-bb9a-1fe353804082	\N	identity-provider-redirector	master	23253ffd-4f87-4f2a-8541-adcca50a7bac	2	25	f	\N	\N
53885303-7563-46ce-b403-daa00fe50ef4	\N	\N	master	23253ffd-4f87-4f2a-8541-adcca50a7bac	2	30	t	d5e3443c-01a6-42d4-8eb0-bf945ee97e98	\N
ea2e8099-ca9a-46ca-8b12-351342074560	\N	auth-username-password-form	master	d5e3443c-01a6-42d4-8eb0-bf945ee97e98	0	10	f	\N	\N
fb115a64-c8c9-494d-bcf0-e7b7da44bef4	\N	\N	master	d5e3443c-01a6-42d4-8eb0-bf945ee97e98	1	20	t	6aba6c94-c2d8-4630-a347-dc276970cf00	\N
383e80fa-ba85-47c9-95ca-b19941f7f00c	\N	conditional-user-configured	master	6aba6c94-c2d8-4630-a347-dc276970cf00	0	10	f	\N	\N
ae9373d9-a8b0-4104-8ab4-26722dfe062b	\N	auth-otp-form	master	6aba6c94-c2d8-4630-a347-dc276970cf00	0	20	f	\N	\N
68939409-b58e-4063-afae-2e93ee23f0a2	\N	direct-grant-validate-username	master	d33156b9-3d6d-4e17-95a3-90137b745f88	0	10	f	\N	\N
7a747e3b-730d-4c9e-bf0a-267b7f6ce1d3	\N	direct-grant-validate-password	master	d33156b9-3d6d-4e17-95a3-90137b745f88	0	20	f	\N	\N
400c6a42-f0b9-471b-a9fd-30e6d9a60c61	\N	\N	master	d33156b9-3d6d-4e17-95a3-90137b745f88	1	30	t	778635db-a26f-4431-885f-c860ce01c096	\N
72b6b9cd-deb9-4c2f-800c-c32efcd7891e	\N	conditional-user-configured	master	778635db-a26f-4431-885f-c860ce01c096	0	10	f	\N	\N
157d118b-755b-41cf-8ae2-0ae6e332c2c3	\N	direct-grant-validate-otp	master	778635db-a26f-4431-885f-c860ce01c096	0	20	f	\N	\N
e5ae85a3-a6e0-4b9c-82bf-4ec5239829b2	\N	registration-page-form	master	ea59d6e8-a0ff-4ca6-81f6-c8d85936ec7f	0	10	t	4bc0294c-438e-42b7-8aee-e8420f4c7643	\N
12c612e7-b066-41be-8c13-ef66cebf47ac	\N	registration-user-creation	master	4bc0294c-438e-42b7-8aee-e8420f4c7643	0	20	f	\N	\N
e5bd7fed-030b-4c00-9424-c1227671500b	\N	registration-profile-action	master	4bc0294c-438e-42b7-8aee-e8420f4c7643	0	40	f	\N	\N
283b8647-839c-422e-b601-aaa549056733	\N	registration-password-action	master	4bc0294c-438e-42b7-8aee-e8420f4c7643	0	50	f	\N	\N
6d64a42a-f66f-4f55-93f3-6b32d46301ff	\N	registration-recaptcha-action	master	4bc0294c-438e-42b7-8aee-e8420f4c7643	3	60	f	\N	\N
e93599b9-4b12-4106-bf09-b3ced8fd5a96	\N	reset-credentials-choose-user	master	7a85660e-eb05-4158-86a8-32221a370406	0	10	f	\N	\N
ed421d95-d049-49ba-8cb6-521eb8425423	\N	reset-credential-email	master	7a85660e-eb05-4158-86a8-32221a370406	0	20	f	\N	\N
224a7f9c-ab75-47c4-b611-999fdaa6e17e	\N	reset-password	master	7a85660e-eb05-4158-86a8-32221a370406	0	30	f	\N	\N
5a2a9751-80d3-4e45-83f7-90d5c7fcca15	\N	\N	master	7a85660e-eb05-4158-86a8-32221a370406	1	40	t	d5233827-0421-4f04-bb9f-c18e02234b71	\N
92af63c6-cba0-450a-9c0f-27e51d322f1e	\N	conditional-user-configured	master	d5233827-0421-4f04-bb9f-c18e02234b71	0	10	f	\N	\N
c7bcfa0f-7094-4969-afe8-f64fe7c33406	\N	reset-otp	master	d5233827-0421-4f04-bb9f-c18e02234b71	0	20	f	\N	\N
08b443f3-9af5-4e36-ab15-06e48e75fa7b	\N	client-secret	master	c4376f84-2e52-4c98-801e-2bb4c3c00f79	2	10	f	\N	\N
006108cc-4524-4c3f-a9e6-b115713b2776	\N	client-jwt	master	c4376f84-2e52-4c98-801e-2bb4c3c00f79	2	20	f	\N	\N
5ff823b2-b513-4d8f-8776-1cf4be090c68	\N	client-secret-jwt	master	c4376f84-2e52-4c98-801e-2bb4c3c00f79	2	30	f	\N	\N
e1a6d1d4-5991-4961-a4e4-06486cb0d59a	\N	client-x509	master	c4376f84-2e52-4c98-801e-2bb4c3c00f79	2	40	f	\N	\N
a6451486-392f-4b80-83e6-5741a74c50a0	\N	idp-review-profile	master	b03768c3-3aee-47d2-b7f8-8ba7e6261ecb	0	10	f	\N	59e025c9-c0c8-4aa7-a615-437549ef3782
d81dff42-09a3-46cf-a418-e1e8830348bc	\N	\N	master	b03768c3-3aee-47d2-b7f8-8ba7e6261ecb	0	20	t	95f99f59-839e-4873-b895-706e40e54178	\N
696de799-4797-4307-896b-d958ac8c6ba0	\N	idp-create-user-if-unique	master	95f99f59-839e-4873-b895-706e40e54178	2	10	f	\N	333ca689-6f66-416d-bf43-ae354af66480
aeeed266-e3c5-46a9-8a4a-6e4279bd14db	\N	\N	master	95f99f59-839e-4873-b895-706e40e54178	2	20	t	540460eb-26e8-497d-8a04-cc4da0d379bb	\N
31187652-8d30-4904-93d2-35db4de706bc	\N	idp-confirm-link	master	540460eb-26e8-497d-8a04-cc4da0d379bb	0	10	f	\N	\N
0415c4b2-023b-4eb0-93f8-348aeec04b04	\N	\N	master	540460eb-26e8-497d-8a04-cc4da0d379bb	0	20	t	b4205305-58c8-4fb9-b1d6-57bb92a4257d	\N
5079ffbd-773a-45e3-824a-21dc2003d455	\N	idp-email-verification	master	b4205305-58c8-4fb9-b1d6-57bb92a4257d	2	10	f	\N	\N
accd6eb2-4bbe-42a3-9d8c-1f88b2b5e289	\N	\N	master	b4205305-58c8-4fb9-b1d6-57bb92a4257d	2	20	t	7da02a74-a749-4dcd-b338-5c2fd521aefa	\N
5b0fd29a-0754-4c6e-9829-26695b05fdcb	\N	idp-username-password-form	master	7da02a74-a749-4dcd-b338-5c2fd521aefa	0	10	f	\N	\N
4dae609f-4509-458f-a341-c6dba33f3625	\N	\N	master	7da02a74-a749-4dcd-b338-5c2fd521aefa	1	20	t	fa0ee8cc-1c3a-46c7-acf6-8449fec6834e	\N
3d68c2ea-1110-49ba-87ab-4d3e08ae5403	\N	conditional-user-configured	master	fa0ee8cc-1c3a-46c7-acf6-8449fec6834e	0	10	f	\N	\N
df4a2085-d484-480c-9647-8158f3c4f57e	\N	auth-otp-form	master	fa0ee8cc-1c3a-46c7-acf6-8449fec6834e	0	20	f	\N	\N
63416030-4cfd-46b6-bdb1-67836ff511c0	\N	http-basic-authenticator	master	3af4f5fe-5802-4e9d-a50a-0623dd54f208	0	10	f	\N	\N
6333539e-29ff-419b-aaec-775605a0af8b	\N	docker-http-basic-authenticator	master	2bc74371-7d84-4891-8b11-5463515637cf	0	10	f	\N	\N
7709d6c4-6bce-4831-9358-2e2c2435434a	\N	no-cookie-redirect	master	7d335017-4023-4e06-a6d8-493c59a21523	0	10	f	\N	\N
93a46e7d-047f-4295-a269-a2a3c2d9de4b	\N	\N	master	7d335017-4023-4e06-a6d8-493c59a21523	0	20	t	29b81c43-ff73-4a11-81aa-b1d0eff6a34e	\N
7aa1da60-b830-4937-bb54-42e01cb2519e	\N	basic-auth	master	29b81c43-ff73-4a11-81aa-b1d0eff6a34e	0	10	f	\N	\N
402f3be2-5941-420a-8d19-fa0ab559d1a1	\N	basic-auth-otp	master	29b81c43-ff73-4a11-81aa-b1d0eff6a34e	3	20	f	\N	\N
c28fb4e6-3bcc-4c45-91cb-6fc44f79f3c9	\N	auth-spnego	master	29b81c43-ff73-4a11-81aa-b1d0eff6a34e	3	30	f	\N	\N
fe59cc8f-684c-4716-85ec-cea61fef38f7	\N	idp-email-verification	BoaVistaOpenBanking	ea75b421-d283-4ae7-b582-854bb7e18e06	2	10	f	\N	\N
93ccf68e-7016-442f-af44-d8c8bb7b6eeb	\N	\N	BoaVistaOpenBanking	ea75b421-d283-4ae7-b582-854bb7e18e06	2	20	t	c45629ca-182c-4597-a35f-5125564d66a7	\N
4cdcb8fb-53bf-4765-bb63-0e43d8ae5f44	\N	basic-auth	BoaVistaOpenBanking	8fce4ea4-c7aa-4fa9-92ad-e4d9023aaba2	0	10	f	\N	\N
96495442-63e1-4013-98c7-9b64370a7e6c	\N	basic-auth-otp	BoaVistaOpenBanking	8fce4ea4-c7aa-4fa9-92ad-e4d9023aaba2	3	20	f	\N	\N
8287a976-b712-4e74-b3ad-0b4c7cea78f2	\N	auth-spnego	BoaVistaOpenBanking	8fce4ea4-c7aa-4fa9-92ad-e4d9023aaba2	3	30	f	\N	\N
f8595cbe-3bbc-4a8c-a9b2-7f5d9f7475dd	\N	conditional-user-configured	BoaVistaOpenBanking	4466893f-b44e-4a1e-ade8-3b3acdf25b42	0	10	f	\N	\N
79c36291-dc2b-41b9-bf67-22731111dcce	\N	auth-otp-form	BoaVistaOpenBanking	4466893f-b44e-4a1e-ade8-3b3acdf25b42	0	20	f	\N	\N
dbd050ae-3f5c-46aa-a54f-77d5f5c601d1	\N	conditional-user-configured	BoaVistaOpenBanking	4bc9425e-2bd1-4473-ab46-6ea446621044	0	10	f	\N	\N
92443fb1-2d58-4934-9b1c-403085019536	\N	direct-grant-validate-otp	BoaVistaOpenBanking	4bc9425e-2bd1-4473-ab46-6ea446621044	0	20	f	\N	\N
9e8a688a-397e-4672-b79f-9709c21b28d3	\N	conditional-user-configured	BoaVistaOpenBanking	cfae96ea-4fe3-46b5-af63-8d36cac3e216	0	10	f	\N	\N
960dee16-3a60-47f0-8f74-f6577444efbf	\N	auth-otp-form	BoaVistaOpenBanking	cfae96ea-4fe3-46b5-af63-8d36cac3e216	0	20	f	\N	\N
05f21307-6210-4280-b2c8-0be5c4149af1	\N	idp-confirm-link	BoaVistaOpenBanking	be5c4cf4-e492-4f25-a2da-a3c16e40d22f	0	10	f	\N	\N
040f72fb-42e2-4372-9aac-1cd2548db105	\N	\N	BoaVistaOpenBanking	be5c4cf4-e492-4f25-a2da-a3c16e40d22f	0	20	t	ea75b421-d283-4ae7-b582-854bb7e18e06	\N
52ac67ef-e9bd-42b8-b99b-e21efb83783c	\N	conditional-user-configured	BoaVistaOpenBanking	355537b0-27fa-43ee-8057-9183d8fda474	0	10	f	\N	\N
bd4cca59-8d61-40d8-978f-47787d94757c	\N	reset-otp	BoaVistaOpenBanking	355537b0-27fa-43ee-8057-9183d8fda474	0	20	f	\N	\N
22c925dd-deb1-46e7-af3e-b2f2ddbc8d36	\N	idp-create-user-if-unique	BoaVistaOpenBanking	454adc07-685b-48b8-9f0b-649e7268c150	2	10	f	\N	51c653b4-830c-42f5-ba8c-0de23c5fc4de
97ee1770-f08e-41fb-b6d1-fc11f9165651	\N	\N	BoaVistaOpenBanking	454adc07-685b-48b8-9f0b-649e7268c150	2	20	t	be5c4cf4-e492-4f25-a2da-a3c16e40d22f	\N
c561c66a-47ce-4946-9e10-e88b73f7cc62	\N	idp-username-password-form	BoaVistaOpenBanking	c45629ca-182c-4597-a35f-5125564d66a7	0	10	f	\N	\N
5656fff4-9f10-42cd-8882-8cc97ff95b86	\N	\N	BoaVistaOpenBanking	c45629ca-182c-4597-a35f-5125564d66a7	1	20	t	cfae96ea-4fe3-46b5-af63-8d36cac3e216	\N
a0e88f4c-4138-4871-ab9f-02983d83a6e5	\N	auth-cookie	BoaVistaOpenBanking	59add4ae-022c-45bf-824b-e3125760ea2a	2	10	f	\N	\N
8784c1af-3b60-445e-b563-a3832f4f4833	\N	auth-spnego	BoaVistaOpenBanking	59add4ae-022c-45bf-824b-e3125760ea2a	3	20	f	\N	\N
a02cf2b8-01ec-4399-95e1-0aba4f37d065	\N	identity-provider-redirector	BoaVistaOpenBanking	59add4ae-022c-45bf-824b-e3125760ea2a	2	25	f	\N	\N
0320216e-6eba-4eee-a990-8a18956c91e5	\N	\N	BoaVistaOpenBanking	59add4ae-022c-45bf-824b-e3125760ea2a	2	30	t	5b82b0a2-fc82-438a-88b7-a2ce00f7b836	\N
b0db08e4-f0c4-44a7-a3b5-a68e456e2a01	\N	client-secret	BoaVistaOpenBanking	d3a8174a-2f00-4b41-bab8-e7969787a068	2	10	f	\N	\N
3ce331c9-abcb-4dd4-8d58-2c78457253c8	\N	client-jwt	BoaVistaOpenBanking	d3a8174a-2f00-4b41-bab8-e7969787a068	2	20	f	\N	\N
f55910ad-bbce-4e33-bf40-81ae1c9023b8	\N	client-secret-jwt	BoaVistaOpenBanking	d3a8174a-2f00-4b41-bab8-e7969787a068	2	30	f	\N	\N
61321cbf-0e32-4ab2-a69b-fe45c6984ea8	\N	client-x509	BoaVistaOpenBanking	d3a8174a-2f00-4b41-bab8-e7969787a068	2	40	f	\N	\N
b8b14fcf-42a6-42e2-b11f-779a517b20c7	\N	direct-grant-validate-username	BoaVistaOpenBanking	76dc3c52-b92d-467c-a82a-079c718b248d	0	10	f	\N	\N
c832b9ab-36d6-40e9-ae67-cf058bf6ae99	\N	direct-grant-validate-password	BoaVistaOpenBanking	76dc3c52-b92d-467c-a82a-079c718b248d	0	20	f	\N	\N
7bb6adb0-733b-4b16-bcd7-8e7523a2b232	\N	\N	BoaVistaOpenBanking	76dc3c52-b92d-467c-a82a-079c718b248d	1	30	t	4bc9425e-2bd1-4473-ab46-6ea446621044	\N
c822c419-0c6e-4ba7-8709-1327fd02da69	\N	docker-http-basic-authenticator	BoaVistaOpenBanking	65fea813-66e6-4b42-a7c6-260d2d53a03e	0	10	f	\N	\N
3ae0fd36-675a-4c70-b2c3-0dc3234a5db7	\N	idp-review-profile	BoaVistaOpenBanking	8bbb9c87-5ba9-48d2-9e7a-a3ff2ff0ccc8	0	10	f	\N	1561b487-e697-46cb-9863-a29e14c20dbc
a9ef10a1-b828-4a0d-8bda-115e0ca723b5	\N	\N	BoaVistaOpenBanking	8bbb9c87-5ba9-48d2-9e7a-a3ff2ff0ccc8	0	20	t	454adc07-685b-48b8-9f0b-649e7268c150	\N
e539408d-6462-4145-8473-ac49bd25d51a	\N	auth-username-password-form	BoaVistaOpenBanking	5b82b0a2-fc82-438a-88b7-a2ce00f7b836	0	10	f	\N	\N
0168fd17-6e76-42df-b8b2-d412eed06cd1	\N	\N	BoaVistaOpenBanking	5b82b0a2-fc82-438a-88b7-a2ce00f7b836	1	20	t	4466893f-b44e-4a1e-ade8-3b3acdf25b42	\N
fc4d4f24-c31d-4f9b-8100-366bd58ee5b8	\N	no-cookie-redirect	BoaVistaOpenBanking	b1f740c9-0438-4a17-a5d6-5e697582fa4b	0	10	f	\N	\N
96afb02e-2db3-45a4-92b4-22e6136f14e9	\N	\N	BoaVistaOpenBanking	b1f740c9-0438-4a17-a5d6-5e697582fa4b	0	20	t	8fce4ea4-c7aa-4fa9-92ad-e4d9023aaba2	\N
b3e9a8d2-0afc-4f3c-8f94-8ce5ab40b1e1	\N	registration-page-form	BoaVistaOpenBanking	43c2b952-0816-4541-b08e-9e35b826700b	0	10	t	a05a54c6-d53b-4460-adbb-e2b2f80a864b	\N
24daf44a-f29f-4348-a55e-95229a2932ce	\N	registration-user-creation	BoaVistaOpenBanking	a05a54c6-d53b-4460-adbb-e2b2f80a864b	0	20	f	\N	\N
c8fd22cd-1b45-4d96-981b-f99f1862757d	\N	registration-profile-action	BoaVistaOpenBanking	a05a54c6-d53b-4460-adbb-e2b2f80a864b	0	40	f	\N	\N
2e6dc57c-7e4a-4069-b7a0-f217b58c182f	\N	registration-password-action	BoaVistaOpenBanking	a05a54c6-d53b-4460-adbb-e2b2f80a864b	0	50	f	\N	\N
2010f9c6-f0e2-43c1-9203-1c3ea7975da7	\N	registration-recaptcha-action	BoaVistaOpenBanking	a05a54c6-d53b-4460-adbb-e2b2f80a864b	3	60	f	\N	\N
f1be33a6-14ce-461a-af5c-8fe0740e9fec	\N	reset-credentials-choose-user	BoaVistaOpenBanking	68c629d2-e121-4bfa-afac-0715c1a08198	0	10	f	\N	\N
309763d7-c602-4836-ad6e-474b1544978b	\N	reset-credential-email	BoaVistaOpenBanking	68c629d2-e121-4bfa-afac-0715c1a08198	0	20	f	\N	\N
6a818251-acd4-4913-a8a1-35efa13936a5	\N	reset-password	BoaVistaOpenBanking	68c629d2-e121-4bfa-afac-0715c1a08198	0	30	f	\N	\N
64f7a0b1-df47-4ca6-8a7e-4fcc01fc4732	\N	\N	BoaVistaOpenBanking	68c629d2-e121-4bfa-afac-0715c1a08198	1	40	t	355537b0-27fa-43ee-8057-9183d8fda474	\N
4823ac00-b39b-4b3f-9ab8-7fb3bc881111	\N	http-basic-authenticator	BoaVistaOpenBanking	865e4cd9-f97f-4b9a-bb8a-73f30598cd8e	0	10	f	\N	\N
\.


--
-- TOC entry 3813 (class 0 OID 16398)
-- Dependencies: 203
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
23253ffd-4f87-4f2a-8541-adcca50a7bac	browser	browser based authentication	master	basic-flow	t	t
d5e3443c-01a6-42d4-8eb0-bf945ee97e98	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
6aba6c94-c2d8-4630-a347-dc276970cf00	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
d33156b9-3d6d-4e17-95a3-90137b745f88	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
778635db-a26f-4431-885f-c860ce01c096	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
ea59d6e8-a0ff-4ca6-81f6-c8d85936ec7f	registration	registration flow	master	basic-flow	t	t
4bc0294c-438e-42b7-8aee-e8420f4c7643	registration form	registration form	master	form-flow	f	t
7a85660e-eb05-4158-86a8-32221a370406	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
d5233827-0421-4f04-bb9f-c18e02234b71	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
c4376f84-2e52-4c98-801e-2bb4c3c00f79	clients	Base authentication for clients	master	client-flow	t	t
b03768c3-3aee-47d2-b7f8-8ba7e6261ecb	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
95f99f59-839e-4873-b895-706e40e54178	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
540460eb-26e8-497d-8a04-cc4da0d379bb	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
b4205305-58c8-4fb9-b1d6-57bb92a4257d	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
7da02a74-a749-4dcd-b338-5c2fd521aefa	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
fa0ee8cc-1c3a-46c7-acf6-8449fec6834e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
3af4f5fe-5802-4e9d-a50a-0623dd54f208	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
2bc74371-7d84-4891-8b11-5463515637cf	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
7d335017-4023-4e06-a6d8-493c59a21523	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
29b81c43-ff73-4a11-81aa-b1d0eff6a34e	Authentication Options	Authentication options.	master	basic-flow	f	t
ea75b421-d283-4ae7-b582-854bb7e18e06	Account verification options	Method with which to verity the existing account	BoaVistaOpenBanking	basic-flow	f	t
8fce4ea4-c7aa-4fa9-92ad-e4d9023aaba2	Authentication Options	Authentication options.	BoaVistaOpenBanking	basic-flow	f	t
4466893f-b44e-4a1e-ade8-3b3acdf25b42	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	BoaVistaOpenBanking	basic-flow	f	t
4bc9425e-2bd1-4473-ab46-6ea446621044	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	BoaVistaOpenBanking	basic-flow	f	t
cfae96ea-4fe3-46b5-af63-8d36cac3e216	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	BoaVistaOpenBanking	basic-flow	f	t
be5c4cf4-e492-4f25-a2da-a3c16e40d22f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	BoaVistaOpenBanking	basic-flow	f	t
355537b0-27fa-43ee-8057-9183d8fda474	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	BoaVistaOpenBanking	basic-flow	f	t
454adc07-685b-48b8-9f0b-649e7268c150	User creation or linking	Flow for the existing/non-existing user alternatives	BoaVistaOpenBanking	basic-flow	f	t
c45629ca-182c-4597-a35f-5125564d66a7	Verify Existing Account by Re-authentication	Reauthentication of existing account	BoaVistaOpenBanking	basic-flow	f	t
59add4ae-022c-45bf-824b-e3125760ea2a	browser	browser based authentication	BoaVistaOpenBanking	basic-flow	t	t
d3a8174a-2f00-4b41-bab8-e7969787a068	clients	Base authentication for clients	BoaVistaOpenBanking	client-flow	t	t
76dc3c52-b92d-467c-a82a-079c718b248d	direct grant	OpenID Connect Resource Owner Grant	BoaVistaOpenBanking	basic-flow	t	t
65fea813-66e6-4b42-a7c6-260d2d53a03e	docker auth	Used by Docker clients to authenticate against the IDP	BoaVistaOpenBanking	basic-flow	t	t
8bbb9c87-5ba9-48d2-9e7a-a3ff2ff0ccc8	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	BoaVistaOpenBanking	basic-flow	t	t
5b82b0a2-fc82-438a-88b7-a2ce00f7b836	forms	Username, password, otp and other auth forms.	BoaVistaOpenBanking	basic-flow	f	t
b1f740c9-0438-4a17-a5d6-5e697582fa4b	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	BoaVistaOpenBanking	basic-flow	t	t
43c2b952-0816-4541-b08e-9e35b826700b	registration	registration flow	BoaVistaOpenBanking	basic-flow	t	t
a05a54c6-d53b-4460-adbb-e2b2f80a864b	registration form	registration form	BoaVistaOpenBanking	form-flow	f	t
68c629d2-e121-4bfa-afac-0715c1a08198	reset credentials	Reset credentials for a user if they forgot their password or something	BoaVistaOpenBanking	basic-flow	t	t
865e4cd9-f97f-4b9a-bb8a-73f30598cd8e	saml ecp	SAML ECP Profile Authentication Flow	BoaVistaOpenBanking	basic-flow	t	t
\.


--
-- TOC entry 3814 (class 0 OID 16407)
-- Dependencies: 204
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
59e025c9-c0c8-4aa7-a615-437549ef3782	review profile config	master
333ca689-6f66-416d-bf43-ae354af66480	create unique user config	master
51c653b4-830c-42f5-ba8c-0de23c5fc4de	create unique user config	BoaVistaOpenBanking
1561b487-e697-46cb-9863-a29e14c20dbc	review profile config	BoaVistaOpenBanking
\.


--
-- TOC entry 3815 (class 0 OID 16410)
-- Dependencies: 205
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
59e025c9-c0c8-4aa7-a615-437549ef3782	missing	update.profile.on.first.login
333ca689-6f66-416d-bf43-ae354af66480	false	require.password.update.after.registration
51c653b4-830c-42f5-ba8c-0de23c5fc4de	false	require.password.update.after.registration
1561b487-e697-46cb-9863-a29e14c20dbc	missing	update.profile.on.first.login
\.


--
-- TOC entry 3816 (class 0 OID 16416)
-- Dependencies: 206
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 3817 (class 0 OID 16422)
-- Dependencies: 207
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
68e0f89b-058c-47ce-babf-150654146ee3	t	t	master-realm	0	f	24c27747-edf1-4fc3-9587-2024bb621c9b	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
90713a4f-114e-426d-976f-1166acb8dd92	t	f	account	0	f	128a28ed-f023-45bf-9869-9e8bd8de8907	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
429379c0-f4c2-47c0-abf0-20abaaaf7116	t	f	account-console	0	t	fca09bbc-8d46-45a9-a38c-38662d760103	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	t	f	broker	0	f	195b6106-2c56-4a81-ac47-f75f7fba880b	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
0a7c13ea-adda-4f53-b892-427176229a4f	t	f	security-admin-console	0	t	4f056193-8988-4178-8625-fc05145c7e06	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
98588a3b-fb07-434f-bad2-4718f3d20e96	t	f	admin-cli	0	t	cd32c3cf-7482-4efc-8f15-068d48370b69	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	t	BoaVistaOpenBanking-realm	0	f	a07ffe56-f58d-43e1-b809-9564395c2ffe	\N	t	\N	f	master	\N	0	f	f	BoaVistaOpenBanking Realm	f	client-secret	\N	\N	\N	t	f	f	f
65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	f	account	0	f	**********	/realms/BoaVistaOpenBanking/account/	f	\N	f	BoaVistaOpenBanking	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f2e03981-2f27-452c-83a2-3cd82c2889b0	t	f	account-console	0	t	**********	/realms/BoaVistaOpenBanking/account/	f	\N	f	BoaVistaOpenBanking	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	t	f	admin-cli	0	t	**********	\N	f	\N	f	BoaVistaOpenBanking	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
4428a966-7eac-49df-b9c6-a984988a10ea	t	f	broker	0	f	**********	\N	f	\N	f	BoaVistaOpenBanking	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	f	realm-management	0	f	**********	\N	t	\N	f	BoaVistaOpenBanking	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
f18c46df-f2e5-4cd0-af01-0e9c6865b749	t	f	security-admin-console	0	t	**********	/admin/BoaVistaOpenBanking/console/	f	\N	f	BoaVistaOpenBanking	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
69f890ee-8261-43c5-8f9c-efee0753b279	t	t	boavistaopenbanking	0	f	81ba0b2a-31a4-424a-a618-65f67d54f09b	\N	f	\N	f	BoaVistaOpenBanking	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	t	t	f
\.


--
-- TOC entry 3818 (class 0 OID 16441)
-- Dependencies: 208
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
429379c0-f4c2-47c0-abf0-20abaaaf7116	S256	pkce.code.challenge.method
0a7c13ea-adda-4f53-b892-427176229a4f	S256	pkce.code.challenge.method
f2e03981-2f27-452c-83a2-3cd82c2889b0	S256	pkce.code.challenge.method
69f890ee-8261-43c5-8f9c-efee0753b279	true	backchannel.logout.session.required
69f890ee-8261-43c5-8f9c-efee0753b279	false	backchannel.logout.revoke.offline.tokens
f18c46df-f2e5-4cd0-af01-0e9c6865b749	S256	pkce.code.challenge.method
69f890ee-8261-43c5-8f9c-efee0753b279	\N	request.uris
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.server.signature
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.server.signature.keyinfo.ext
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.assertion.signature
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.client.signature
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.encrypt
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.authnstatement
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.onetimeuse.condition
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml_force_name_id_format
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.multivalued.roles
69f890ee-8261-43c5-8f9c-efee0753b279	false	saml.force.post.binding
69f890ee-8261-43c5-8f9c-efee0753b279	false	exclude.session.state.from.auth.response
69f890ee-8261-43c5-8f9c-efee0753b279	false	tls.client.certificate.bound.access.tokens
69f890ee-8261-43c5-8f9c-efee0753b279	false	client_credentials.use_refresh_token
69f890ee-8261-43c5-8f9c-efee0753b279	false	display.on.consent.screen
\.


--
-- TOC entry 3819 (class 0 OID 16447)
-- Dependencies: 209
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 3820 (class 0 OID 16450)
-- Dependencies: 210
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
90713a4f-114e-426d-976f-1166acb8dd92	b9c43a52-95ab-49e0-84dd-4d64a5e6bddd
90713a4f-114e-426d-976f-1166acb8dd92	715ce0c2-28a6-4718-8455-25ab5a9664e3
65eb4904-f8fc-4f47-8e79-b617c18ead3c	b6364630-373c-4932-8eba-ed4a38a404d1
65eb4904-f8fc-4f47-8e79-b617c18ead3c	067196d0-d4c2-499d-806c-1443405ba35a
\.


--
-- TOC entry 3821 (class 0 OID 16453)
-- Dependencies: 211
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 3822 (class 0 OID 16456)
-- Dependencies: 212
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 3823 (class 0 OID 16459)
-- Dependencies: 213
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
49d54ea7-e844-448c-8228-3b9ca2ba0405	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
10d7be8a-3dd4-475c-b0fe-220dd94293bb	role_list	master	SAML role list	saml
e65e131d-477d-484c-b7c1-687c79379699	profile	master	OpenID Connect built-in scope: profile	openid-connect
85ccb83a-4464-4d87-b0cd-a70856ea7b87	email	master	OpenID Connect built-in scope: email	openid-connect
849d9f4c-58d3-44ed-acd2-d531d02a22aa	address	master	OpenID Connect built-in scope: address	openid-connect
26ae889f-e8a9-40e9-bb37-d2a11d20a655	phone	master	OpenID Connect built-in scope: phone	openid-connect
da7d897f-2f41-47a5-bca3-b74503b2defa	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
2ac7536c-caa0-42b7-b780-7e5a450ab85f	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
df49dc9e-2282-4900-b583-597170e59b4a	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
b0ba3b0a-624c-4775-90fa-683b60ede686	address	BoaVistaOpenBanking	OpenID Connect built-in scope: address	openid-connect
611cc940-bb57-4bcc-a395-b245fceaf50a	email	BoaVistaOpenBanking	OpenID Connect built-in scope: email	openid-connect
f93939f9-a5b4-47d0-8dc9-644e8ab5b743	microprofile-jwt	BoaVistaOpenBanking	Microprofile - JWT built-in scope	openid-connect
61f275ae-7099-4ed6-bc03-70f3b9dd09ee	offline_access	BoaVistaOpenBanking	OpenID Connect built-in scope: offline_access	openid-connect
e95aed41-e8c8-41f4-b033-426f456dc7eb	phone	BoaVistaOpenBanking	OpenID Connect built-in scope: phone	openid-connect
f81c05d2-6d9c-43a0-b155-e254b02cc36c	profile	BoaVistaOpenBanking	OpenID Connect built-in scope: profile	openid-connect
0f212589-71e3-41ca-9cc8-055b8f95c2d0	role_list	BoaVistaOpenBanking	SAML role list	saml
9224ad64-eda6-443e-8f25-7eca7b969082	roles	BoaVistaOpenBanking	OpenID Connect scope for add user roles to the access token	openid-connect
eaf41ddc-34e5-4469-885f-47b72535e329	web-origins	BoaVistaOpenBanking	OpenID Connect scope for add allowed web origins to the access token	openid-connect
\.


--
-- TOC entry 3824 (class 0 OID 16465)
-- Dependencies: 214
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
49d54ea7-e844-448c-8228-3b9ca2ba0405	true	display.on.consent.screen
49d54ea7-e844-448c-8228-3b9ca2ba0405	${offlineAccessScopeConsentText}	consent.screen.text
10d7be8a-3dd4-475c-b0fe-220dd94293bb	true	display.on.consent.screen
10d7be8a-3dd4-475c-b0fe-220dd94293bb	${samlRoleListScopeConsentText}	consent.screen.text
e65e131d-477d-484c-b7c1-687c79379699	true	display.on.consent.screen
e65e131d-477d-484c-b7c1-687c79379699	${profileScopeConsentText}	consent.screen.text
e65e131d-477d-484c-b7c1-687c79379699	true	include.in.token.scope
85ccb83a-4464-4d87-b0cd-a70856ea7b87	true	display.on.consent.screen
85ccb83a-4464-4d87-b0cd-a70856ea7b87	${emailScopeConsentText}	consent.screen.text
85ccb83a-4464-4d87-b0cd-a70856ea7b87	true	include.in.token.scope
849d9f4c-58d3-44ed-acd2-d531d02a22aa	true	display.on.consent.screen
849d9f4c-58d3-44ed-acd2-d531d02a22aa	${addressScopeConsentText}	consent.screen.text
849d9f4c-58d3-44ed-acd2-d531d02a22aa	true	include.in.token.scope
26ae889f-e8a9-40e9-bb37-d2a11d20a655	true	display.on.consent.screen
26ae889f-e8a9-40e9-bb37-d2a11d20a655	${phoneScopeConsentText}	consent.screen.text
26ae889f-e8a9-40e9-bb37-d2a11d20a655	true	include.in.token.scope
da7d897f-2f41-47a5-bca3-b74503b2defa	true	display.on.consent.screen
da7d897f-2f41-47a5-bca3-b74503b2defa	${rolesScopeConsentText}	consent.screen.text
da7d897f-2f41-47a5-bca3-b74503b2defa	false	include.in.token.scope
2ac7536c-caa0-42b7-b780-7e5a450ab85f	false	display.on.consent.screen
2ac7536c-caa0-42b7-b780-7e5a450ab85f		consent.screen.text
2ac7536c-caa0-42b7-b780-7e5a450ab85f	false	include.in.token.scope
df49dc9e-2282-4900-b583-597170e59b4a	false	display.on.consent.screen
df49dc9e-2282-4900-b583-597170e59b4a	true	include.in.token.scope
b0ba3b0a-624c-4775-90fa-683b60ede686	true	include.in.token.scope
b0ba3b0a-624c-4775-90fa-683b60ede686	true	display.on.consent.screen
b0ba3b0a-624c-4775-90fa-683b60ede686	${addressScopeConsentText}	consent.screen.text
611cc940-bb57-4bcc-a395-b245fceaf50a	true	include.in.token.scope
611cc940-bb57-4bcc-a395-b245fceaf50a	true	display.on.consent.screen
611cc940-bb57-4bcc-a395-b245fceaf50a	${emailScopeConsentText}	consent.screen.text
f93939f9-a5b4-47d0-8dc9-644e8ab5b743	true	include.in.token.scope
f93939f9-a5b4-47d0-8dc9-644e8ab5b743	false	display.on.consent.screen
61f275ae-7099-4ed6-bc03-70f3b9dd09ee	${offlineAccessScopeConsentText}	consent.screen.text
61f275ae-7099-4ed6-bc03-70f3b9dd09ee	true	display.on.consent.screen
e95aed41-e8c8-41f4-b033-426f456dc7eb	true	include.in.token.scope
e95aed41-e8c8-41f4-b033-426f456dc7eb	true	display.on.consent.screen
e95aed41-e8c8-41f4-b033-426f456dc7eb	${phoneScopeConsentText}	consent.screen.text
f81c05d2-6d9c-43a0-b155-e254b02cc36c	true	include.in.token.scope
f81c05d2-6d9c-43a0-b155-e254b02cc36c	true	display.on.consent.screen
f81c05d2-6d9c-43a0-b155-e254b02cc36c	${profileScopeConsentText}	consent.screen.text
0f212589-71e3-41ca-9cc8-055b8f95c2d0	${samlRoleListScopeConsentText}	consent.screen.text
0f212589-71e3-41ca-9cc8-055b8f95c2d0	true	display.on.consent.screen
9224ad64-eda6-443e-8f25-7eca7b969082	false	include.in.token.scope
9224ad64-eda6-443e-8f25-7eca7b969082	true	display.on.consent.screen
9224ad64-eda6-443e-8f25-7eca7b969082	${rolesScopeConsentText}	consent.screen.text
eaf41ddc-34e5-4469-885f-47b72535e329	false	include.in.token.scope
eaf41ddc-34e5-4469-885f-47b72535e329	false	display.on.consent.screen
eaf41ddc-34e5-4469-885f-47b72535e329		consent.screen.text
\.


--
-- TOC entry 3825 (class 0 OID 16471)
-- Dependencies: 215
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
90713a4f-114e-426d-976f-1166acb8dd92	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
429379c0-f4c2-47c0-abf0-20abaaaf7116	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
98588a3b-fb07-434f-bad2-4718f3d20e96	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
68e0f89b-058c-47ce-babf-150654146ee3	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
0a7c13ea-adda-4f53-b892-427176229a4f	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
90713a4f-114e-426d-976f-1166acb8dd92	da7d897f-2f41-47a5-bca3-b74503b2defa	t
90713a4f-114e-426d-976f-1166acb8dd92	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
90713a4f-114e-426d-976f-1166acb8dd92	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
90713a4f-114e-426d-976f-1166acb8dd92	e65e131d-477d-484c-b7c1-687c79379699	t
90713a4f-114e-426d-976f-1166acb8dd92	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
90713a4f-114e-426d-976f-1166acb8dd92	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
90713a4f-114e-426d-976f-1166acb8dd92	df49dc9e-2282-4900-b583-597170e59b4a	f
90713a4f-114e-426d-976f-1166acb8dd92	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
429379c0-f4c2-47c0-abf0-20abaaaf7116	da7d897f-2f41-47a5-bca3-b74503b2defa	t
429379c0-f4c2-47c0-abf0-20abaaaf7116	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
429379c0-f4c2-47c0-abf0-20abaaaf7116	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
429379c0-f4c2-47c0-abf0-20abaaaf7116	e65e131d-477d-484c-b7c1-687c79379699	t
429379c0-f4c2-47c0-abf0-20abaaaf7116	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
429379c0-f4c2-47c0-abf0-20abaaaf7116	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
429379c0-f4c2-47c0-abf0-20abaaaf7116	df49dc9e-2282-4900-b583-597170e59b4a	f
429379c0-f4c2-47c0-abf0-20abaaaf7116	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
98588a3b-fb07-434f-bad2-4718f3d20e96	da7d897f-2f41-47a5-bca3-b74503b2defa	t
98588a3b-fb07-434f-bad2-4718f3d20e96	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
98588a3b-fb07-434f-bad2-4718f3d20e96	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
98588a3b-fb07-434f-bad2-4718f3d20e96	e65e131d-477d-484c-b7c1-687c79379699	t
98588a3b-fb07-434f-bad2-4718f3d20e96	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
98588a3b-fb07-434f-bad2-4718f3d20e96	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
98588a3b-fb07-434f-bad2-4718f3d20e96	df49dc9e-2282-4900-b583-597170e59b4a	f
98588a3b-fb07-434f-bad2-4718f3d20e96	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	da7d897f-2f41-47a5-bca3-b74503b2defa	t
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	e65e131d-477d-484c-b7c1-687c79379699	t
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	df49dc9e-2282-4900-b583-597170e59b4a	f
cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
68e0f89b-058c-47ce-babf-150654146ee3	da7d897f-2f41-47a5-bca3-b74503b2defa	t
68e0f89b-058c-47ce-babf-150654146ee3	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
68e0f89b-058c-47ce-babf-150654146ee3	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
68e0f89b-058c-47ce-babf-150654146ee3	e65e131d-477d-484c-b7c1-687c79379699	t
68e0f89b-058c-47ce-babf-150654146ee3	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
68e0f89b-058c-47ce-babf-150654146ee3	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
68e0f89b-058c-47ce-babf-150654146ee3	df49dc9e-2282-4900-b583-597170e59b4a	f
68e0f89b-058c-47ce-babf-150654146ee3	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
0a7c13ea-adda-4f53-b892-427176229a4f	da7d897f-2f41-47a5-bca3-b74503b2defa	t
0a7c13ea-adda-4f53-b892-427176229a4f	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
0a7c13ea-adda-4f53-b892-427176229a4f	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
0a7c13ea-adda-4f53-b892-427176229a4f	e65e131d-477d-484c-b7c1-687c79379699	t
0a7c13ea-adda-4f53-b892-427176229a4f	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
0a7c13ea-adda-4f53-b892-427176229a4f	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
0a7c13ea-adda-4f53-b892-427176229a4f	df49dc9e-2282-4900-b583-597170e59b4a	f
0a7c13ea-adda-4f53-b892-427176229a4f	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	da7d897f-2f41-47a5-bca3-b74503b2defa	t
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	e65e131d-477d-484c-b7c1-687c79379699	t
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	df49dc9e-2282-4900-b583-597170e59b4a	f
02112e74-42ef-41cb-bc87-b1dd2c1a01b9	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
65eb4904-f8fc-4f47-8e79-b617c18ead3c	eaf41ddc-34e5-4469-885f-47b72535e329	t
65eb4904-f8fc-4f47-8e79-b617c18ead3c	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
65eb4904-f8fc-4f47-8e79-b617c18ead3c	9224ad64-eda6-443e-8f25-7eca7b969082	t
65eb4904-f8fc-4f47-8e79-b617c18ead3c	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
65eb4904-f8fc-4f47-8e79-b617c18ead3c	611cc940-bb57-4bcc-a395-b245fceaf50a	t
65eb4904-f8fc-4f47-8e79-b617c18ead3c	b0ba3b0a-624c-4775-90fa-683b60ede686	f
65eb4904-f8fc-4f47-8e79-b617c18ead3c	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
65eb4904-f8fc-4f47-8e79-b617c18ead3c	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
65eb4904-f8fc-4f47-8e79-b617c18ead3c	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
f2e03981-2f27-452c-83a2-3cd82c2889b0	eaf41ddc-34e5-4469-885f-47b72535e329	t
f2e03981-2f27-452c-83a2-3cd82c2889b0	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
f2e03981-2f27-452c-83a2-3cd82c2889b0	9224ad64-eda6-443e-8f25-7eca7b969082	t
f2e03981-2f27-452c-83a2-3cd82c2889b0	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
f2e03981-2f27-452c-83a2-3cd82c2889b0	611cc940-bb57-4bcc-a395-b245fceaf50a	t
f2e03981-2f27-452c-83a2-3cd82c2889b0	b0ba3b0a-624c-4775-90fa-683b60ede686	f
f2e03981-2f27-452c-83a2-3cd82c2889b0	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
f2e03981-2f27-452c-83a2-3cd82c2889b0	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
f2e03981-2f27-452c-83a2-3cd82c2889b0	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	eaf41ddc-34e5-4469-885f-47b72535e329	t
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	9224ad64-eda6-443e-8f25-7eca7b969082	t
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	611cc940-bb57-4bcc-a395-b245fceaf50a	t
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	b0ba3b0a-624c-4775-90fa-683b60ede686	f
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
a3a1a86a-4510-42c9-b0e1-4d70453dca2f	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
4428a966-7eac-49df-b9c6-a984988a10ea	eaf41ddc-34e5-4469-885f-47b72535e329	t
4428a966-7eac-49df-b9c6-a984988a10ea	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
4428a966-7eac-49df-b9c6-a984988a10ea	9224ad64-eda6-443e-8f25-7eca7b969082	t
4428a966-7eac-49df-b9c6-a984988a10ea	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
4428a966-7eac-49df-b9c6-a984988a10ea	611cc940-bb57-4bcc-a395-b245fceaf50a	t
4428a966-7eac-49df-b9c6-a984988a10ea	b0ba3b0a-624c-4775-90fa-683b60ede686	f
4428a966-7eac-49df-b9c6-a984988a10ea	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
4428a966-7eac-49df-b9c6-a984988a10ea	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
4428a966-7eac-49df-b9c6-a984988a10ea	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
69f890ee-8261-43c5-8f9c-efee0753b279	eaf41ddc-34e5-4469-885f-47b72535e329	t
69f890ee-8261-43c5-8f9c-efee0753b279	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
69f890ee-8261-43c5-8f9c-efee0753b279	9224ad64-eda6-443e-8f25-7eca7b969082	t
69f890ee-8261-43c5-8f9c-efee0753b279	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
69f890ee-8261-43c5-8f9c-efee0753b279	611cc940-bb57-4bcc-a395-b245fceaf50a	t
69f890ee-8261-43c5-8f9c-efee0753b279	b0ba3b0a-624c-4775-90fa-683b60ede686	f
69f890ee-8261-43c5-8f9c-efee0753b279	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
69f890ee-8261-43c5-8f9c-efee0753b279	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
69f890ee-8261-43c5-8f9c-efee0753b279	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	eaf41ddc-34e5-4469-885f-47b72535e329	t
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	9224ad64-eda6-443e-8f25-7eca7b969082	t
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	611cc940-bb57-4bcc-a395-b245fceaf50a	t
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	b0ba3b0a-624c-4775-90fa-683b60ede686	f
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
f18c46df-f2e5-4cd0-af01-0e9c6865b749	eaf41ddc-34e5-4469-885f-47b72535e329	t
f18c46df-f2e5-4cd0-af01-0e9c6865b749	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
f18c46df-f2e5-4cd0-af01-0e9c6865b749	9224ad64-eda6-443e-8f25-7eca7b969082	t
f18c46df-f2e5-4cd0-af01-0e9c6865b749	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
f18c46df-f2e5-4cd0-af01-0e9c6865b749	611cc940-bb57-4bcc-a395-b245fceaf50a	t
f18c46df-f2e5-4cd0-af01-0e9c6865b749	b0ba3b0a-624c-4775-90fa-683b60ede686	f
f18c46df-f2e5-4cd0-af01-0e9c6865b749	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
f18c46df-f2e5-4cd0-af01-0e9c6865b749	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
f18c46df-f2e5-4cd0-af01-0e9c6865b749	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
\.


--
-- TOC entry 3826 (class 0 OID 16475)
-- Dependencies: 216
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
49d54ea7-e844-448c-8228-3b9ca2ba0405	01ba0074-366b-404f-a02e-d7766e834d07
61f275ae-7099-4ed6-bc03-70f3b9dd09ee	13125a75-fd77-4983-9b28-637fc09c86fe
\.


--
-- TOC entry 3827 (class 0 OID 16478)
-- Dependencies: 217
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- TOC entry 3828 (class 0 OID 16484)
-- Dependencies: 218
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- TOC entry 3829 (class 0 OID 16487)
-- Dependencies: 219
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 3830 (class 0 OID 16493)
-- Dependencies: 220
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- TOC entry 3831 (class 0 OID 16496)
-- Dependencies: 221
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- TOC entry 3832 (class 0 OID 16499)
-- Dependencies: 222
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 3833 (class 0 OID 16505)
-- Dependencies: 223
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
de6698ec-7ad0-4c3a-a940-55c788716270	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
345c9063-8f9d-49fb-be17-41d6ed112a8c	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
d3dd7f7f-8cdd-4fc4-8244-2e019c3445e6	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
2fda5ea3-e46b-4c9c-a12a-702b4da71c1c	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
f71d90f4-71fc-4939-8fef-e4f428c1b650	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
21d3eb03-41f3-471e-907e-6d47f5ad16e6	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
a32ead5e-37e1-4497-86fc-ba8023ef982b	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
b2907f70-f18b-404d-96d5-ba75a5d596c5	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
52aab1ce-52bc-4f57-943c-a353ad59a539	Consent Required	BoaVistaOpenBanking	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	anonymous
d5ada4ba-e787-49cc-ba45-3268035e5195	Full Scope Disabled	BoaVistaOpenBanking	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	anonymous
4847b671-0189-4851-a241-01abcc1b0594	Allowed Protocol Mapper Types	BoaVistaOpenBanking	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	anonymous
ef77a6df-2b33-4104-ba12-705dd8232e60	Allowed Client Scopes	BoaVistaOpenBanking	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	authenticated
14dca129-7861-4ec1-8287-f6ebdf3e669c	Max Clients Limit	BoaVistaOpenBanking	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	anonymous
f17fbc4b-98b5-4fec-8118-c5fa25c184ac	Trusted Hosts	BoaVistaOpenBanking	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	anonymous
e4494b52-bb7f-4ae6-abfb-2fe850b085a7	Allowed Protocol Mapper Types	BoaVistaOpenBanking	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	authenticated
d182e8b8-2d5c-48d9-bb29-0eefee68fe10	Allowed Client Scopes	BoaVistaOpenBanking	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	BoaVistaOpenBanking	anonymous
231c2b1d-88d2-428f-98f9-6ee6c674ace0	rsa-generated	BoaVistaOpenBanking	rsa-generated	org.keycloak.keys.KeyProvider	BoaVistaOpenBanking	\N
3158967c-6fd8-4006-9415-51eaedd4ba0e	hmac-generated	BoaVistaOpenBanking	hmac-generated	org.keycloak.keys.KeyProvider	BoaVistaOpenBanking	\N
e8b425ea-0c8d-4836-9cc4-acb3c1778637	aes-generated	BoaVistaOpenBanking	aes-generated	org.keycloak.keys.KeyProvider	BoaVistaOpenBanking	\N
1486e6f8-8ffc-4c68-a2fa-88f12401facd	fallback-HS256	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
6d30897f-529e-4227-9fd0-e45046c053f3	fallback-RS256	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
\.


--
-- TOC entry 3834 (class 0 OID 16511)
-- Dependencies: 224
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
7c9dc9a3-b4ad-43c9-9910-782795b6b4eb	de6698ec-7ad0-4c3a-a940-55c788716270	client-uris-must-match	true
d575185b-2aef-40db-882e-3b88ea820bed	de6698ec-7ad0-4c3a-a940-55c788716270	host-sending-registration-request-must-match	true
af5bf8f2-7585-4796-b58f-6c920288f1ad	2fda5ea3-e46b-4c9c-a12a-702b4da71c1c	max-clients	200
2fe5280f-a508-4559-b2dc-e2dfedfc0747	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b12a3abf-7edc-44d9-a906-ca191cc99ae5	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	oidc-full-name-mapper
92bf3056-0408-45b2-8d5b-68c337b920c6	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	saml-user-attribute-mapper
42599d15-5466-4231-91bf-658ac6b8221e	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	saml-user-property-mapper
ee08360f-af1a-4d36-9538-efeea6ec3678	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	saml-role-list-mapper
215e3ba7-23af-4efb-935f-a4a6a6bad97d	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b53248bd-43bb-4252-b41b-e2c1a299c7be	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	oidc-address-mapper
edbe3f5a-26ee-42ad-aeb4-76280d48434e	f71d90f4-71fc-4939-8fef-e4f428c1b650	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2822c23e-2635-449f-91ce-6f9e01a36e86	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	oidc-address-mapper
c0cbc825-bcca-40f0-9843-fdea1dddc431	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
a4aa2aa6-8a4b-45e0-b066-04343dab91e6	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
45059d60-f030-47a8-a509-1bfadf25f878	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4c1bba4e-793c-4834-849c-f92fd7848ddc	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	oidc-full-name-mapper
07a687b3-b205-4ef6-8020-ba21be9949aa	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	saml-role-list-mapper
06fcca33-a755-4d97-aa44-988b73eb6c38	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	saml-user-attribute-mapper
53cc384f-4c83-4dec-abb2-382f84c7d35f	a32ead5e-37e1-4497-86fc-ba8023ef982b	allowed-protocol-mapper-types	saml-user-property-mapper
10fd01cc-fb0f-4b05-9444-aa76dff45f64	b2907f70-f18b-404d-96d5-ba75a5d596c5	allow-default-scopes	true
f0836e41-6921-4b9c-bb21-733e286947c4	21d3eb03-41f3-471e-907e-6d47f5ad16e6	allow-default-scopes	true
5adc136a-a18f-4abe-9f60-455dd00cd1bd	231c2b1d-88d2-428f-98f9-6ee6c674ace0	certificate	MIICtTCCAZ0CBgF4exInaTANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNCb2FWaXN0YU9wZW5CYW5raW5nMB4XDTIxMDMyODIyNTk1MFoXDTMxMDMyODIzMDEzMFowHjEcMBoGA1UEAwwTQm9hVmlzdGFPcGVuQmFua2luZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIp7goK3U4hK9tC63cE6Gv2oC+zzjTF1l2fuCBEAK1KALmDu1THPSfwUqRbiSDAl6uCkmTODe3m+eB0gBnt8NfIQLzGdKV44wpUYFBbsdMQrcqvc0K+AKk8gydqoNq3dVS9l5XwI9WXgR6j7N3bhlHaYtG9QZj5uvtw5JlKws0u3z9DUwqZu/OXAZzMwdbE4ff0qjlVxXNM43QbzRAZPaeeBAlTPLJnYqFjO763gPRV9qpffXEuyuR73mdTu2cbOArfcR4pa/IIUiIV61UNlGx4wcW7/SOMACvhmFuspw+M1qTZe+/kJV7jcQHsVquFqqGQMhQrCS2Ldw0vOp5zeHIkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAUdtld42nC09L7axhnpGXCvIvLaht6tH1wRAxOGRk992msVbnDgzyh8JbHlmzBKwhQyQkJwozff32oKbtnY/Sti7BiLisg9QHuDuhP5BRomPDm5BpEOlQxo1arjHutjZitingP/RhC5oi/xL9644AtMB8LaswGfpj4kwkkt9VBYwr/MGhJKbu+vjvZMU5rQnVFn5CYowwWLyRtqlFCrH6+ftXsxHtq0+rFRJCb8vixDsMwtEtMY0cTOH7y7XcAQ3ytldx/20DhhAPn+ftcWB9c571iAVRHVCT8ytih6CFEi+i5pggY0NYna30oLjjB4sLs3xjgnjLxOzMmqoFgS3vow==
ad4e1e99-f100-4c56-96a8-41f77c88b8ac	231c2b1d-88d2-428f-98f9-6ee6c674ace0	priority	100
58da8dc7-7144-4df7-b7d6-5deae198f498	231c2b1d-88d2-428f-98f9-6ee6c674ace0	privateKey	MIIEogIBAAKCAQEAinuCgrdTiEr20LrdwToa/agL7PONMXWXZ+4IEQArUoAuYO7VMc9J/BSpFuJIMCXq4KSZM4N7eb54HSAGe3w18hAvMZ0pXjjClRgUFux0xCtyq9zQr4AqTyDJ2qg2rd1VL2XlfAj1ZeBHqPs3duGUdpi0b1BmPm6+3DkmUrCzS7fP0NTCpm785cBnMzB1sTh9/SqOVXFc0zjdBvNEBk9p54ECVM8smdioWM7vreA9FX2ql99cS7K5HveZ1O7Zxs4Ct9xHilr8ghSIhXrVQ2UbHjBxbv9I4wAK+GYW6ynD4zWpNl77+QlXuNxAexWq4WqoZAyFCsJLYt3DS86nnN4ciQIDAQABAoH/OMxvuy12FXCpyvLaAWbTqzZBre42+xJAB2CZ7l8jZbMtUpSi3MsojTvsHnaxJQ5oR7s7GuXSvxxgJ5H7FqrbdW0t7iuHzB17sasukjhprAwl/FeVQGZQ9CN+pzBXPPiK9+XTOgxymlZjDev708ayHfKEDyPqy7Cgl7LZBRF0eJlNxJHvfVyaaZlhc6fISLG/stloI0C6Z4ZGjQZ931v8Ell+a0tH19oqjb9JmGaXB8Tn2YOlcoADaVhSXtARdqgj0zFk3bV3CtnZkuVTmBm//7Xv7spIuEAKEmqw3VxJZrdVSDb4qL4IK8vVQ8Cc1EysB7AMqOQ40/nugDY7HekBAoGBAOhGqJdwT6bPNhxH+WYgdnj1GsYhtgz9wt00pj3q0V1A1/cOev52ytobRl1YqxJC8SS19RPxBBKRCTR9rr18P7rcashovfstt4CC2IQvUAGQ5DRuF1r2tUTw6IBm3j2qpg3XlVyacqQkEI4Wx0Gzkhmti7j1+Fx/7tWuFl+HL5TpAoGBAJigbEhSp6SoVSipTG7MjE03XYtIEPjl6V65L6m1dKUzQUPqMsdm/yd10hoH8uMREFYMxvCtOH/CshgEBvcL1fPJkKhvYa8Kczyc2qLHdcjaMZM0xURzheAQIYTDj2v7mgHGSjlG5+luNIZbkInk6tcNZcjLyji2kG2r/6PuVAahAoGBAIXoJk2X6/OIxfMr8zXTRTmaZGMREDkRGoQYVDah5y1Rsq+1Y2bL6UowKzKpaYZPnWHCnJVwfx6NCrd+NXz74mnBpLYA3HWv93hY9qXN+NvOQiGPzlscm4gxMnjD1R/L/4s/W9ZVG/5Q5FJmA113PqUbDdAFzbbV8kSx5igQcXfxAoGAWU4M7eiHNT5Vzdv54B8JvSi3MIczfx+wBH/hFrEZFoy+FIoVuj1W8PTswdSC10AlyePiB/OjSoZWhNzeYnFneCUp4pSBmNVJhl7VQ0focGTTeyn2f04FOIzXwAJZijqG66Dlz0vg6OJWE4PCOB1dGAY711j+815HdhSdGYObYOECgYEAviRyoh8L0hAkegmcRiJexC7rH3pcje7WP65JdOchkUMrMyccW9eEMZ6thxvf69MDf4sVcHOEp9DrmXMKPuWhaqIwmDaFaNITJyEBLS+aaXRzgpXD/xy7zoVvomM6a7iTkU10MQ2FbkY4S8GDvOnHqqMIiRY39wKva6a8Bh8/S/c=
f7724b74-629d-4dc0-b300-507ab57d4877	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	oidc-full-name-mapper
a3d0cffa-53c4-4413-9b8f-54dce346121a	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	saml-user-property-mapper
5f078353-88eb-4a18-a355-2b5f1fbb3df2	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	oidc-address-mapper
671cf7c3-9e5c-4080-80b2-ef50cb73db8c	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	saml-role-list-mapper
6e03f449-e723-40d2-ac35-4de32f72bdf6	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	saml-user-attribute-mapper
d810292c-afa5-4b54-bca3-1fe4bed79edc	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b4fd7ffc-a49e-4514-8c09-6ada737776ac	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
09cdff70-ebe9-48d4-b97b-a241edde61b3	4847b671-0189-4851-a241-01abcc1b0594	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
18486d80-2022-4eb4-8722-72a6a0469f10	ef77a6df-2b33-4104-ba12-705dd8232e60	allow-default-scopes	true
3ab1076a-64a2-47c1-b0ad-ef10b4ddd8c6	14dca129-7861-4ec1-8287-f6ebdf3e669c	max-clients	200
bfce08e1-fdce-4ed8-9626-395df8e7d1b5	3158967c-6fd8-4006-9415-51eaedd4ba0e	priority	100
6f733962-af2c-4e06-a64c-300d3e5c73e6	3158967c-6fd8-4006-9415-51eaedd4ba0e	algorithm	HS256
450737ab-d46a-4eb9-a541-29e227d8d252	3158967c-6fd8-4006-9415-51eaedd4ba0e	secret	tDp9V5NeM_2ZPC7bJPzFhbH8yL1RoD9bZMrA80XA_75pdnnlv7SqL4-HiWe3H7yK3yXahdDmgH-LPtAkIja7fA
c49c948c-76ef-438e-84fc-7089e491bb49	3158967c-6fd8-4006-9415-51eaedd4ba0e	kid	b15a6156-6bed-490a-a676-35e979b2a02c
e0d5b3e6-c149-4771-8dee-de1bb24e1e5b	f17fbc4b-98b5-4fec-8118-c5fa25c184ac	client-uris-must-match	true
bf7f0824-a45e-4bd3-b0e6-79501a157ad5	f17fbc4b-98b5-4fec-8118-c5fa25c184ac	host-sending-registration-request-must-match	true
d56976ce-51cb-42ac-8a56-b16ad25e47d2	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
54a9d6a9-86d8-4187-bdc8-572bf5497135	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	oidc-full-name-mapper
40ffd1b0-b107-474a-badc-c85fdfed20d8	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	oidc-address-mapper
f8ceb74f-fba4-4082-a825-96211029736a	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	saml-role-list-mapper
f439e86d-2646-48f4-862a-2292e2aaa604	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	saml-user-property-mapper
53cef245-7c98-44e7-b757-ebed553baa04	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d564c23c-f030-48ca-8ab6-6f95e7ea7dce	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
41811fe9-3cdf-44bb-ab6c-56e48fb9a5c9	e4494b52-bb7f-4ae6-abfb-2fe850b085a7	allowed-protocol-mapper-types	saml-user-attribute-mapper
82b9139e-ad1d-4e4e-9d67-f41d2e79af1e	d182e8b8-2d5c-48d9-bb29-0eefee68fe10	allow-default-scopes	true
e0cb8dd3-3240-4a03-b9e5-3f2d6054f587	e8b425ea-0c8d-4836-9cc4-acb3c1778637	kid	61a1a5f9-0c87-46df-9d3e-aa2fbb402082
45782692-7877-4dcd-ab3d-ae8d02001d80	e8b425ea-0c8d-4836-9cc4-acb3c1778637	secret	aohf4tkfd93tu7cnnOkY8Q
c5c8a898-c57a-432c-88b4-e64d3565a545	e8b425ea-0c8d-4836-9cc4-acb3c1778637	priority	100
9c789a4f-6383-42af-9967-19f834291082	1486e6f8-8ffc-4c68-a2fa-88f12401facd	algorithm	HS256
19a891a0-0ebd-424e-82dc-3d693bf83d6d	1486e6f8-8ffc-4c68-a2fa-88f12401facd	secret	JFlKJycd2CVzxYzrOjy18IPu2l2_dzSKJYG6zM_VWHpmg6VyAiXgXgXR-dwP7WpmOJZtxDHJXhuaCeGIAbzsLQ
19c682b5-8ba8-4809-b6de-ccb678f011c3	1486e6f8-8ffc-4c68-a2fa-88f12401facd	kid	ad50d2da-9e7e-48ea-a4c7-f0405d72a168
94feb1fa-b46c-4dd5-b196-97d47cf4f292	1486e6f8-8ffc-4c68-a2fa-88f12401facd	priority	-100
2a23a320-682a-4a60-b396-b06e9a68a734	6d30897f-529e-4227-9fd0-e45046c053f3	algorithm	RS256
9087bb40-e396-4a31-ab16-907f728143b9	6d30897f-529e-4227-9fd0-e45046c053f3	certificate	MIICmzCCAYMCBgF4exKHWTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwMzI4MjMwMDE1WhcNMzEwMzI4MjMwMTU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDIhOjtaTKCc5e9kQzDUzuVdJ+jSgP+AOFSYXa7tKGI4pJ0VhEwMofhh+xYbpEN0JHZX3t+oDqceofgYYAo+loiJVe0lNmdT8YMAYp1iL/QioKGY5Relwp53c550meYzuuW4Mt9TPWFNyrwqMB9yQDY1v0xEC27nbK3pX/45le3CGwuSzegJGGF/5iD3cD6iJHg/5juo5SWwur0crw0S3wTyTtresPwYFVvWCOQsTceARSFrfTMXJ1wZUs87kUPm4VQzo5UJUoyQEmqNG7sojR8QMSAWWmM6LP/wguRDN00FYBEeqaa0Cl3mP9A5Sw0SmT4W/4xS2bu6eyUa9u1wn9NAgMBAAEwDQYJKoZIhvcNAQELBQADggEBALBGjMAGd1u9rQy4JnHa583ugkgy22gGhZH18InecCahz6GWxCxbd3HXO2k79rfKEFuuGyrTGsdvfpaiFpFgBPdeAtG6K+STdiilqWFerOAmy4V8DSa7Pj4zhWzrfVRfWJEV3n0Kpev/YRds4caZ5iYH0ZOpZqfD3TTw6ViYLMMn5S15rkG/X6pkNdKk8Zt4m6GXiY1WFaR7lWf3txIV3oD54BXYqVyf74MuIVKWPdOgV3rIYz76y+cFE5B0+hygrBZ4FbN3bsfVVHIl6mXqXjUvL157pPnpvg25byhSw6BT3zuslzMkujhDmL0hxgOahuuySIzmAf4ZseP6g+N8r54=
736e0fab-8e4b-47ad-b78a-01764648dc14	6d30897f-529e-4227-9fd0-e45046c053f3	privateKey	MIIEpAIBAAKCAQEAyITo7WkygnOXvZEMw1M7lXSfo0oD/gDhUmF2u7ShiOKSdFYRMDKH4YfsWG6RDdCR2V97fqA6nHqH4GGAKPpaIiVXtJTZnU/GDAGKdYi/0IqChmOUXpcKed3OedJnmM7rluDLfUz1hTcq8KjAfckA2Nb9MRAtu52yt6V/+OZXtwhsLks3oCRhhf+Yg93A+oiR4P+Y7qOUlsLq9HK8NEt8E8k7a3rD8GBVb1gjkLE3HgEUha30zFydcGVLPO5FD5uFUM6OVCVKMkBJqjRu7KI0fEDEgFlpjOiz/8ILkQzdNBWARHqmmtApd5j/QOUsNEpk+Fv+MUtm7unslGvbtcJ/TQIDAQABAoIBAQCv9aIJI/VE8HbJzQ1sIg/5WPv1aLAUJ2WSyyBMG3hdDKYEHLq8lrsSuBo4h94WR16VZ+qQ9b45LnUp+6VhUD/kEuzh9HT6TNS4GGoONdBNCh78G0pJrzVsN65GzNJID9xA7EblT7FsEztFMHCqcMajghVxBod7SilYaozgOBHk9JtodHMTsllkc2xWKRkd7L1rXBerDpQnnbxj8iv/El8m5OQlUzcKgd7UZR3t5QDuGW2tEpBoW4KwmkrG4nOige7tIGIk6zd1Otaw/OpZJrdDy4dFjgLATByBE5Q/Nr8HGtouFam4Oqg8jLOlBZgSgnL5d/p9u/Rj6OeEzXW4vXnBAoGBAOgVTjCD44/COQsjCMYyhFU9Hha0ynRHVv0dRlXySVqbAvTCrcJfVopsBPd8/OrJROazdIviEgdMBvOjmDmV8ejJVOY0s5pfetjdQyeMDUS+Iixuqn+w8ZjtPF8PdhSjlZboqZSPVROtHZzcM+pZR3GxXj17cWhPX5+kvT7G3XhpAoGBAN0u5hijqtaGMPkKqg20QMLSnSX/Ky/TsytTHZ79ZtaVroTKgnhiciMEFzyxqZosEwtrJYX1/7fbQR33ReJJYCy9rbSrg8IAN/5I3MB9m+xgB/wtHbCPOCMbNf8u14qVdYQqTxTipFj3UjnQyyjWk1sjQpJT+ygw4/aSTh9E71NFAoGBAKFvaIMgyuMN1AYmKY1MSHbOW6apvYYitaS9f1Z7gYDwAJ9m590j2hvRRactnvRmanIbdD91UtsWjGNfcZzk62/k1BSJpkEEl3xQdM0Gg5hEtZq4pArMd1HL+8mYBKgYng5p6sP269QTAF1DYy1pSuQP36DexCUtyTNQMX+Abz+5AoGAHZyXxZiz2ICisdTRq4AEY5Da5SliWMbY5+X6wzxdtkDX2oNaME/NxA5aJhALCs73xcGUhnjGwZCjCSX/vynfrF3Akb2cqC5rUKnklAi9BUpeB07q+KZT968+7WkSBkW4M/eOGte09Qw3f/IKIO+JTtxLn1eK+niBLJOtzdXmzJkCgYAYHmCGhyoN4dDf85XrQtNl/uSwqXqLzivDN1NzNnNZk28JjwB4K+YWLlnK2WuSwdg3nzxq5QyB3J2vP1orpa0oK/FhVk9Osttp3lvUyDs/nHCI6zygS06MV7yzxmVfDu1fYCeLqShMasDs/QkeGmy4T8G2p720rDhjcYjbKrmt8A==
27807090-a236-488c-b59b-e2ee2fcbda7d	6d30897f-529e-4227-9fd0-e45046c053f3	priority	-100
\.


--
-- TOC entry 3835 (class 0 OID 16517)
-- Dependencies: 225
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
18314001-2e6f-420a-8bc0-3af623aab9a4	3fdead8c-b083-4d8d-ad6d-7b445bb4c934
18314001-2e6f-420a-8bc0-3af623aab9a4	8a320342-3882-4158-bb6d-003b348ffbc7
18314001-2e6f-420a-8bc0-3af623aab9a4	af4ec897-1947-4c11-9937-cffdd56e0a6b
18314001-2e6f-420a-8bc0-3af623aab9a4	3d41d13b-4407-4013-a6a1-1ba094b55ff7
18314001-2e6f-420a-8bc0-3af623aab9a4	7cb422c6-d894-43a7-9550-d8ba1979d6c1
18314001-2e6f-420a-8bc0-3af623aab9a4	84b7afe2-0894-465c-83d3-d97d3896baa4
18314001-2e6f-420a-8bc0-3af623aab9a4	6f66fe25-3b0d-4f3a-8f6f-08322beb0d2d
18314001-2e6f-420a-8bc0-3af623aab9a4	92c309d9-b5ab-40ce-b650-f9dffc83ab4a
18314001-2e6f-420a-8bc0-3af623aab9a4	ebd88616-73b9-4ca5-a898-e6bab3c67481
18314001-2e6f-420a-8bc0-3af623aab9a4	ec108017-8297-491e-a008-d82e41ed65a7
18314001-2e6f-420a-8bc0-3af623aab9a4	c0cf5cf8-4840-4690-897a-f736696d1569
18314001-2e6f-420a-8bc0-3af623aab9a4	bb903d7a-2dc9-4183-b7ec-e7356678dbc0
18314001-2e6f-420a-8bc0-3af623aab9a4	f68c615b-c44c-4934-943b-ec3f9df1e8b2
18314001-2e6f-420a-8bc0-3af623aab9a4	a0667e35-aa66-4db7-8aae-5d15117617dc
18314001-2e6f-420a-8bc0-3af623aab9a4	bbbfecbc-061e-4981-9423-9dc85c37300c
18314001-2e6f-420a-8bc0-3af623aab9a4	2b90f523-d056-4fe2-ba7a-2961bc6279ed
18314001-2e6f-420a-8bc0-3af623aab9a4	caf39d7b-2b3d-4af1-b556-8ae4b2da1890
18314001-2e6f-420a-8bc0-3af623aab9a4	7ed7dd9a-2ca0-4a0c-87cd-7763ccdcbde2
7cb422c6-d894-43a7-9550-d8ba1979d6c1	2b90f523-d056-4fe2-ba7a-2961bc6279ed
3d41d13b-4407-4013-a6a1-1ba094b55ff7	bbbfecbc-061e-4981-9423-9dc85c37300c
3d41d13b-4407-4013-a6a1-1ba094b55ff7	7ed7dd9a-2ca0-4a0c-87cd-7763ccdcbde2
715ce0c2-28a6-4718-8455-25ab5a9664e3	bf4a5d38-4bfb-44d1-991d-1cf824deab55
636fb4e2-b2b8-4641-a36f-b11e695b6ca9	78e2d79f-f1f6-4f27-b67e-64fd6cd55182
18314001-2e6f-420a-8bc0-3af623aab9a4	7a8b69cd-ed86-47c1-89c1-65f4ddf1368f
18314001-2e6f-420a-8bc0-3af623aab9a4	a8a6aa3a-a606-4477-aafe-4970e443bc1e
18314001-2e6f-420a-8bc0-3af623aab9a4	b6d1e1f6-8fa7-4b61-9f05-1e9d64111caf
18314001-2e6f-420a-8bc0-3af623aab9a4	67a22cde-14bf-4cd4-8e6c-26b560fdf432
18314001-2e6f-420a-8bc0-3af623aab9a4	8d81b6c5-cdd4-4176-9a73-8ea65c745e7d
18314001-2e6f-420a-8bc0-3af623aab9a4	53e622ba-6e2d-44e4-9517-3038ccf37aa4
18314001-2e6f-420a-8bc0-3af623aab9a4	8bb7752a-1e01-4a95-a816-2a73dec4a344
18314001-2e6f-420a-8bc0-3af623aab9a4	eeecd1d5-4535-48cd-8ca4-ca8f6570e3c4
18314001-2e6f-420a-8bc0-3af623aab9a4	4be8fbf6-5e15-44ee-8a00-8c4341b68e2e
18314001-2e6f-420a-8bc0-3af623aab9a4	70c8418b-f400-46ed-8069-ef661fcd852e
18314001-2e6f-420a-8bc0-3af623aab9a4	5bf53e85-7c68-4fef-8bbf-e9839b85f96c
18314001-2e6f-420a-8bc0-3af623aab9a4	8e5ef1e1-37e4-437a-bdd5-af78179057de
18314001-2e6f-420a-8bc0-3af623aab9a4	84d36063-61cf-4429-afe7-2fd4c1683d1a
18314001-2e6f-420a-8bc0-3af623aab9a4	1c7578bf-7520-46b2-acdf-504d5cb3f339
18314001-2e6f-420a-8bc0-3af623aab9a4	de438468-22ff-4572-8123-fad841aede8f
18314001-2e6f-420a-8bc0-3af623aab9a4	126c65d9-3cfe-49a6-990a-32d4b1c774d1
18314001-2e6f-420a-8bc0-3af623aab9a4	61982f3c-5221-4ad0-bdb6-f8fea4511dda
18314001-2e6f-420a-8bc0-3af623aab9a4	12f8de5d-6a75-42db-85da-d04e9368c976
8d81b6c5-cdd4-4176-9a73-8ea65c745e7d	126c65d9-3cfe-49a6-990a-32d4b1c774d1
67a22cde-14bf-4cd4-8e6c-26b560fdf432	de438468-22ff-4572-8123-fad841aede8f
67a22cde-14bf-4cd4-8e6c-26b560fdf432	12f8de5d-6a75-42db-85da-d04e9368c976
c1d664ea-2488-418a-815b-5a0dd592c219	802f072c-bbb2-43ea-8929-76babe28f590
c1d664ea-2488-418a-815b-5a0dd592c219	0de5f202-dbdb-46dc-97e5-b6b5c2fbe3a6
c1d664ea-2488-418a-815b-5a0dd592c219	12a4f391-3122-4aa1-a363-4f66e3e2df94
c1d664ea-2488-418a-815b-5a0dd592c219	dd4f7f74-2aa7-4490-aede-386be72d2bbc
c1d664ea-2488-418a-815b-5a0dd592c219	021aff41-d286-48a8-a609-3f9d71236ace
c1d664ea-2488-418a-815b-5a0dd592c219	26916143-4c7d-485f-806f-dbc82dd146d3
c1d664ea-2488-418a-815b-5a0dd592c219	3ec1a692-1c22-43d8-afd8-67f61d3211a6
c1d664ea-2488-418a-815b-5a0dd592c219	cb49c8d8-cc4f-4ce1-9871-a4d9f606cfb9
c1d664ea-2488-418a-815b-5a0dd592c219	c02ec436-e8fc-438c-95bc-0a3053623d36
c1d664ea-2488-418a-815b-5a0dd592c219	de1f0e4e-faa1-4a9b-a4a2-1432c4f13c5f
c1d664ea-2488-418a-815b-5a0dd592c219	02bde262-ba14-407c-81b9-5eb41e6738f9
c1d664ea-2488-418a-815b-5a0dd592c219	9495d70b-2e4f-41d6-a841-7133c2a10c52
c1d664ea-2488-418a-815b-5a0dd592c219	2ccbdd92-5d4c-40ad-84e6-3d5d0d37f163
c1d664ea-2488-418a-815b-5a0dd592c219	25afa333-7154-4427-9853-76b5cf2e56cb
c1d664ea-2488-418a-815b-5a0dd592c219	85522e5d-ee95-4db9-870f-0fb27df1470f
c1d664ea-2488-418a-815b-5a0dd592c219	00a4059c-b2d0-445e-b2c2-35ac03b6b302
c1d664ea-2488-418a-815b-5a0dd592c219	a0dab892-e94d-41e5-94e6-f4787c36685b
c1d664ea-2488-418a-815b-5a0dd592c219	d0bd850e-5d2c-4285-bf9c-85a24160d11e
c02ec436-e8fc-438c-95bc-0a3053623d36	cb49c8d8-cc4f-4ce1-9871-a4d9f606cfb9
a0dab892-e94d-41e5-94e6-f4787c36685b	021aff41-d286-48a8-a609-3f9d71236ace
a0dab892-e94d-41e5-94e6-f4787c36685b	9495d70b-2e4f-41d6-a841-7133c2a10c52
b6364630-373c-4932-8eba-ed4a38a404d1	f49682a1-d4fc-45c1-b413-0462aec201e3
a643c634-f432-4970-9508-cb62abc26221	e3a808a1-705c-4102-ba30-5887242255fe
18314001-2e6f-420a-8bc0-3af623aab9a4	fa037826-7df2-4e57-8eb0-7c30c3c7bf46
3c0e2018-7b09-450f-9ca2-e67ee1b437c5	b23d4043-ebed-4bc2-876d-303aa12d82d1
\.


--
-- TOC entry 3836 (class 0 OID 16520)
-- Dependencies: 226
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
6f25fdd7-bdae-4bf4-b8c5-c407b04656fd	\N	password	e1fbb611-de3c-4dc3-a923-c6aca02017f2	1616972490859	\N	{"value":"3e0z+E/5VKCMozELiqY1BoZu//O7X38QTlgzyWn3XFDX1QgwT5IbnSolVBu+u/PkL65Ty1t1CBHoq9kgbAPVdg==","salt":"20vneHu2MUTpLI72f88C3Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
24412799-f94c-4ecf-a014-67e27e8d3994	\N	password	4d6e51bd-7643-4873-af52-0e939fc22b0e	1616972607661	\N	{"value":"GM5NQ0/pzrmrTEYPF5iRjlJ5nnVKDZqBC2JRJvDm+ptnQdO09F0e+q5vXkHxtjswsTW1Qnn1MEVzA9JHCr9KYQ==","salt":"uGkaBLrxIuNP8QY77+r4pA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- TOC entry 3837 (class 0 OID 16526)
-- Dependencies: 227
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2021-03-28 23:01:26.66472	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	6972486525
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2021-03-28 23:01:26.671449	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	6972486525
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2021-03-28 23:01:26.689139	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	6972486525
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2021-03-28 23:01:26.691439	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	6972486525
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2021-03-28 23:01:26.730625	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	6972486525
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2021-03-28 23:01:26.732945	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	6972486525
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2021-03-28 23:01:26.767558	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	6972486525
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2021-03-28 23:01:26.773117	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	6972486525
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2021-03-28 23:01:26.77593	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	6972486525
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2021-03-28 23:01:26.819372	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	6972486525
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2021-03-28 23:01:26.857234	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	6972486525
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2021-03-28 23:01:26.859416	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	6972486525
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2021-03-28 23:01:26.871336	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	6972486525
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-28 23:01:26.880841	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	6972486525
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-28 23:01:26.882033	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	6972486525
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-28 23:01:26.883386	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	6972486525
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-28 23:01:26.88446	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	6972486525
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2021-03-28 23:01:26.905388	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	6972486525
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2021-03-28 23:01:26.924183	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	6972486525
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2021-03-28 23:01:26.926906	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	6972486525
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-28 23:01:27.120624	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	6972486525
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2021-03-28 23:01:26.928358	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	6972486525
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2021-03-28 23:01:26.929897	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	6972486525
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2021-03-28 23:01:26.940715	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	6972486525
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2021-03-28 23:01:26.943924	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	6972486525
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2021-03-28 23:01:26.945187	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	6972486525
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2021-03-28 23:01:26.959107	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	6972486525
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2021-03-28 23:01:26.994193	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	6972486525
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2021-03-28 23:01:26.996887	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	6972486525
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2021-03-28 23:01:27.022909	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	6972486525
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2021-03-28 23:01:27.029549	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	6972486525
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2021-03-28 23:01:27.036471	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	6972486525
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2021-03-28 23:01:27.038629	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	6972486525
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-28 23:01:27.041122	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	6972486525
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-28 23:01:27.042285	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	6972486525
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-28 23:01:27.052722	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	6972486525
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2021-03-28 23:01:27.055088	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	6972486525
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-28 23:01:27.057664	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	6972486525
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2021-03-28 23:01:27.05938	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	6972486525
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2021-03-28 23:01:27.061002	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	6972486525
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-03-28 23:01:27.061968	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	6972486525
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-03-28 23:01:27.062993	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	6972486525
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2021-03-28 23:01:27.065321	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	6972486525
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-03-28 23:01:27.116403	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	6972486525
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2021-03-28 23:01:27.118694	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	6972486525
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-28 23:01:27.122971	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	6972486525
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-28 23:01:27.123987	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	6972486525
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-28 23:01:27.138915	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	6972486525
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-28 23:01:27.141032	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	6972486525
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2021-03-28 23:01:27.158736	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	6972486525
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2021-03-28 23:01:27.172092	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	6972486525
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2021-03-28 23:01:27.173969	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	6972486525
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2021-03-28 23:01:27.175352	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	6972486525
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2021-03-28 23:01:27.176651	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	6972486525
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-28 23:01:27.179466	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	6972486525
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-28 23:01:27.181848	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	6972486525
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-28 23:01:27.190456	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	6972486525
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-28 23:01:27.227731	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	6972486525
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2021-03-28 23:01:27.241336	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	6972486525
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2021-03-28 23:01:27.244003	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	6972486525
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-03-28 23:01:27.24773	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	6972486525
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-03-28 23:01:27.250363	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	6972486525
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2021-03-28 23:01:27.252013	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	6972486525
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2021-03-28 23:01:27.253321	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	6972486525
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2021-03-28 23:01:27.254582	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	6972486525
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2021-03-28 23:01:27.260115	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	6972486525
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2021-03-28 23:01:27.262636	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	6972486525
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2021-03-28 23:01:27.264671	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	6972486525
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2021-03-28 23:01:27.269051	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	6972486525
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2021-03-28 23:01:27.271351	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	6972486525
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2021-03-28 23:01:27.273141	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	6972486525
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-28 23:01:27.275748	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	6972486525
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-28 23:01:27.278275	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	6972486525
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-28 23:01:27.279259	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	6972486525
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-28 23:01:27.285836	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	6972486525
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-28 23:01:27.288633	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	6972486525
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-28 23:01:27.290326	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	6972486525
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-28 23:01:27.291306	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	6972486525
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-28 23:01:27.298677	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	6972486525
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-28 23:01:27.299847	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	6972486525
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-28 23:01:27.302362	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	6972486525
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-28 23:01:27.303312	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	6972486525
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-28 23:01:27.305096	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	6972486525
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-28 23:01:27.305982	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	6972486525
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-28 23:01:27.308408	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	6972486525
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2021-03-28 23:01:27.310634	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	6972486525
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2021-03-28 23:01:27.313673	87	EXECUTED	7:578d0b92077eaf2ab95ad0ec087aa903	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	3.5.4	\N	\N	6972486525
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2021-03-28 23:01:27.317404	88	EXECUTED	7:c95abe90d962c57a09ecaee57972835d	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	3.5.4	\N	\N	6972486525
\.


--
-- TOC entry 3838 (class 0 OID 16532)
-- Dependencies: 228
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- TOC entry 3839 (class 0 OID 16535)
-- Dependencies: 229
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	49d54ea7-e844-448c-8228-3b9ca2ba0405	f
master	10d7be8a-3dd4-475c-b0fe-220dd94293bb	t
master	e65e131d-477d-484c-b7c1-687c79379699	t
master	85ccb83a-4464-4d87-b0cd-a70856ea7b87	t
master	849d9f4c-58d3-44ed-acd2-d531d02a22aa	f
master	26ae889f-e8a9-40e9-bb37-d2a11d20a655	f
master	da7d897f-2f41-47a5-bca3-b74503b2defa	t
master	2ac7536c-caa0-42b7-b780-7e5a450ab85f	t
master	df49dc9e-2282-4900-b583-597170e59b4a	f
BoaVistaOpenBanking	0f212589-71e3-41ca-9cc8-055b8f95c2d0	t
BoaVistaOpenBanking	611cc940-bb57-4bcc-a395-b245fceaf50a	t
BoaVistaOpenBanking	9224ad64-eda6-443e-8f25-7eca7b969082	t
BoaVistaOpenBanking	eaf41ddc-34e5-4469-885f-47b72535e329	t
BoaVistaOpenBanking	f81c05d2-6d9c-43a0-b155-e254b02cc36c	t
BoaVistaOpenBanking	61f275ae-7099-4ed6-bc03-70f3b9dd09ee	f
BoaVistaOpenBanking	b0ba3b0a-624c-4775-90fa-683b60ede686	f
BoaVistaOpenBanking	e95aed41-e8c8-41f4-b033-426f456dc7eb	f
BoaVistaOpenBanking	f93939f9-a5b4-47d0-8dc9-644e8ab5b743	f
\.


--
-- TOC entry 3840 (class 0 OID 16539)
-- Dependencies: 230
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- TOC entry 3841 (class 0 OID 16545)
-- Dependencies: 231
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- TOC entry 3842 (class 0 OID 16551)
-- Dependencies: 232
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 3843 (class 0 OID 16557)
-- Dependencies: 233
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 3844 (class 0 OID 16560)
-- Dependencies: 234
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 3845 (class 0 OID 16566)
-- Dependencies: 235
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 3846 (class 0 OID 16569)
-- Dependencies: 236
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 3847 (class 0 OID 16576)
-- Dependencies: 237
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 3848 (class 0 OID 16579)
-- Dependencies: 238
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 3849 (class 0 OID 16585)
-- Dependencies: 239
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 3850 (class 0 OID 16591)
-- Dependencies: 240
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 3851 (class 0 OID 16598)
-- Dependencies: 241
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 3852 (class 0 OID 16601)
-- Dependencies: 242
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- TOC entry 3853 (class 0 OID 16613)
-- Dependencies: 243
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 3854 (class 0 OID 16619)
-- Dependencies: 244
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 3855 (class 0 OID 16625)
-- Dependencies: 245
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 3856 (class 0 OID 16631)
-- Dependencies: 246
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- TOC entry 3857 (class 0 OID 16634)
-- Dependencies: 247
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
18314001-2e6f-420a-8bc0-3af623aab9a4	master	f	${role_admin}	admin	master	\N	master
3fdead8c-b083-4d8d-ad6d-7b445bb4c934	master	f	${role_create-realm}	create-realm	master	\N	master
8a320342-3882-4158-bb6d-003b348ffbc7	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_create-client}	create-client	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
af4ec897-1947-4c11-9937-cffdd56e0a6b	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_view-realm}	view-realm	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
3d41d13b-4407-4013-a6a1-1ba094b55ff7	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_view-users}	view-users	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
7cb422c6-d894-43a7-9550-d8ba1979d6c1	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_view-clients}	view-clients	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
84b7afe2-0894-465c-83d3-d97d3896baa4	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_view-events}	view-events	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
6f66fe25-3b0d-4f3a-8f6f-08322beb0d2d	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_view-identity-providers}	view-identity-providers	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
92c309d9-b5ab-40ce-b650-f9dffc83ab4a	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_view-authorization}	view-authorization	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
ebd88616-73b9-4ca5-a898-e6bab3c67481	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_manage-realm}	manage-realm	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
ec108017-8297-491e-a008-d82e41ed65a7	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_manage-users}	manage-users	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
c0cf5cf8-4840-4690-897a-f736696d1569	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_manage-clients}	manage-clients	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
bb903d7a-2dc9-4183-b7ec-e7356678dbc0	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_manage-events}	manage-events	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
f68c615b-c44c-4934-943b-ec3f9df1e8b2	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_manage-identity-providers}	manage-identity-providers	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
a0667e35-aa66-4db7-8aae-5d15117617dc	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_manage-authorization}	manage-authorization	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
bbbfecbc-061e-4981-9423-9dc85c37300c	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_query-users}	query-users	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
2b90f523-d056-4fe2-ba7a-2961bc6279ed	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_query-clients}	query-clients	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
caf39d7b-2b3d-4af1-b556-8ae4b2da1890	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_query-realms}	query-realms	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
7ed7dd9a-2ca0-4a0c-87cd-7763ccdcbde2	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_query-groups}	query-groups	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
b9c43a52-95ab-49e0-84dd-4d64a5e6bddd	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_view-profile}	view-profile	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
715ce0c2-28a6-4718-8455-25ab5a9664e3	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_manage-account}	manage-account	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
bf4a5d38-4bfb-44d1-991d-1cf824deab55	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_manage-account-links}	manage-account-links	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
047bacd0-cb93-4c75-9b56-ed9c5b07bc28	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_view-applications}	view-applications	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
78e2d79f-f1f6-4f27-b67e-64fd6cd55182	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_view-consent}	view-consent	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
636fb4e2-b2b8-4641-a36f-b11e695b6ca9	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_manage-consent}	manage-consent	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
004a1e27-28ef-4434-8840-7b6a54e025b2	90713a4f-114e-426d-976f-1166acb8dd92	t	${role_delete-account}	delete-account	master	90713a4f-114e-426d-976f-1166acb8dd92	\N
d6ec8693-aa0d-48f7-8972-71ad7662df3a	cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	t	${role_read-token}	read-token	master	cd8c3df3-9ec8-404d-ae64-16c51ab33cb6	\N
7a8b69cd-ed86-47c1-89c1-65f4ddf1368f	68e0f89b-058c-47ce-babf-150654146ee3	t	${role_impersonation}	impersonation	master	68e0f89b-058c-47ce-babf-150654146ee3	\N
01ba0074-366b-404f-a02e-d7766e834d07	master	f	${role_offline-access}	offline_access	master	\N	master
41dff926-9a8f-4a21-aeb6-eaf6070c9af1	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
a8a6aa3a-a606-4477-aafe-4970e443bc1e	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_create-client}	create-client	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
b6d1e1f6-8fa7-4b61-9f05-1e9d64111caf	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_view-realm}	view-realm	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
67a22cde-14bf-4cd4-8e6c-26b560fdf432	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_view-users}	view-users	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
8d81b6c5-cdd4-4176-9a73-8ea65c745e7d	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_view-clients}	view-clients	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
53e622ba-6e2d-44e4-9517-3038ccf37aa4	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_view-events}	view-events	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
8bb7752a-1e01-4a95-a816-2a73dec4a344	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_view-identity-providers}	view-identity-providers	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
eeecd1d5-4535-48cd-8ca4-ca8f6570e3c4	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_view-authorization}	view-authorization	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
4be8fbf6-5e15-44ee-8a00-8c4341b68e2e	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_manage-realm}	manage-realm	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
70c8418b-f400-46ed-8069-ef661fcd852e	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_manage-users}	manage-users	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
5bf53e85-7c68-4fef-8bbf-e9839b85f96c	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_manage-clients}	manage-clients	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
8e5ef1e1-37e4-437a-bdd5-af78179057de	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_manage-events}	manage-events	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
84d36063-61cf-4429-afe7-2fd4c1683d1a	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_manage-identity-providers}	manage-identity-providers	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
1c7578bf-7520-46b2-acdf-504d5cb3f339	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_manage-authorization}	manage-authorization	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
de438468-22ff-4572-8123-fad841aede8f	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_query-users}	query-users	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
126c65d9-3cfe-49a6-990a-32d4b1c774d1	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_query-clients}	query-clients	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
61982f3c-5221-4ad0-bdb6-f8fea4511dda	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_query-realms}	query-realms	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
12f8de5d-6a75-42db-85da-d04e9368c976	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_query-groups}	query-groups	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
da93f7b0-275f-49d7-bcf4-f877a7dcc1c7	BoaVistaOpenBanking	f	${role_uma_authorization}	uma_authorization	BoaVistaOpenBanking	\N	BoaVistaOpenBanking
3c0e2018-7b09-450f-9ca2-e67ee1b437c5	BoaVistaOpenBanking	f	Common User	user	BoaVistaOpenBanking	\N	BoaVistaOpenBanking
13125a75-fd77-4983-9b28-637fc09c86fe	BoaVistaOpenBanking	f	${role_offline-access}	offline_access	BoaVistaOpenBanking	\N	BoaVistaOpenBanking
802f072c-bbb2-43ea-8929-76babe28f590	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_create-client}	create-client	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
12a4f391-3122-4aa1-a363-4f66e3e2df94	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_manage-realm}	manage-realm	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
0de5f202-dbdb-46dc-97e5-b6b5c2fbe3a6	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_view-authorization}	view-authorization	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
dd4f7f74-2aa7-4490-aede-386be72d2bbc	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_manage-events}	manage-events	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
021aff41-d286-48a8-a609-3f9d71236ace	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_query-users}	query-users	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
26916143-4c7d-485f-806f-dbc82dd146d3	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_manage-users}	manage-users	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
c1d664ea-2488-418a-815b-5a0dd592c219	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_realm-admin}	realm-admin	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
3ec1a692-1c22-43d8-afd8-67f61d3211a6	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_impersonation}	impersonation	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
cb49c8d8-cc4f-4ce1-9871-a4d9f606cfb9	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_query-clients}	query-clients	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
de1f0e4e-faa1-4a9b-a4a2-1432c4f13c5f	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_query-realms}	query-realms	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
c02ec436-e8fc-438c-95bc-0a3053623d36	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_view-clients}	view-clients	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
9495d70b-2e4f-41d6-a841-7133c2a10c52	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_query-groups}	query-groups	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
02bde262-ba14-407c-81b9-5eb41e6738f9	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_view-events}	view-events	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
2ccbdd92-5d4c-40ad-84e6-3d5d0d37f163	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_manage-identity-providers}	manage-identity-providers	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
85522e5d-ee95-4db9-870f-0fb27df1470f	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_manage-clients}	manage-clients	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
25afa333-7154-4427-9853-76b5cf2e56cb	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_view-realm}	view-realm	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
d0bd850e-5d2c-4285-bf9c-85a24160d11e	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_manage-authorization}	manage-authorization	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
00a4059c-b2d0-445e-b2c2-35ac03b6b302	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_view-identity-providers}	view-identity-providers	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
a0dab892-e94d-41e5-94e6-f4787c36685b	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	t	${role_view-users}	view-users	BoaVistaOpenBanking	582fe8a6-b1c1-413f-8eb3-19cc452b6a2e	\N
896083fd-2cf7-47fa-b70d-f7fcbfd5922d	4428a966-7eac-49df-b9c6-a984988a10ea	t	${role_read-token}	read-token	BoaVistaOpenBanking	4428a966-7eac-49df-b9c6-a984988a10ea	\N
b6364630-373c-4932-8eba-ed4a38a404d1	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_manage-account}	manage-account	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
e209798c-438e-4ef4-8ddf-5fbda56ffa6b	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_delete-account}	delete-account	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
4f43c03a-d43c-49cc-a239-360a5d75cd31	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_view-applications}	view-applications	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
f49682a1-d4fc-45c1-b413-0462aec201e3	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_manage-account-links}	manage-account-links	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
e3a808a1-705c-4102-ba30-5887242255fe	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_view-consent}	view-consent	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
a643c634-f432-4970-9508-cb62abc26221	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_manage-consent}	manage-consent	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
067196d0-d4c2-499d-806c-1443405ba35a	65eb4904-f8fc-4f47-8e79-b617c18ead3c	t	${role_view-profile}	view-profile	BoaVistaOpenBanking	65eb4904-f8fc-4f47-8e79-b617c18ead3c	\N
fa037826-7df2-4e57-8eb0-7c30c3c7bf46	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	t	${role_impersonation}	impersonation	master	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	\N
b23d4043-ebed-4bc2-876d-303aa12d82d1	69f890ee-8261-43c5-8f9c-efee0753b279	t	\N	boavistaopenbanking_user	BoaVistaOpenBanking	69f890ee-8261-43c5-8f9c-efee0753b279	\N
\.


--
-- TOC entry 3858 (class 0 OID 16641)
-- Dependencies: 248
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
8tkxo	12.0.4	1616972488
\.


--
-- TOC entry 3859 (class 0 OID 16645)
-- Dependencies: 249
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 3860 (class 0 OID 16653)
-- Dependencies: 250
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- TOC entry 3861 (class 0 OID 16660)
-- Dependencies: 251
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 3862 (class 0 OID 16666)
-- Dependencies: 252
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
3afba2ea-4c40-407d-b6b9-377f09ca4f90	audience resolve	openid-connect	oidc-audience-resolve-mapper	429379c0-f4c2-47c0-abf0-20abaaaf7116	\N
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	locale	openid-connect	oidc-usermodel-attribute-mapper	0a7c13ea-adda-4f53-b892-427176229a4f	\N
a0e5e407-dc9d-4086-ac16-e6f09111f409	role list	saml	saml-role-list-mapper	\N	10d7be8a-3dd4-475c-b0fe-220dd94293bb
3666d2ae-5f3d-43cd-9439-fd4f3443322a	full name	openid-connect	oidc-full-name-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	family name	openid-connect	oidc-usermodel-property-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
1d4081c8-a7db-44c3-a308-56c3dd05b10e	given name	openid-connect	oidc-usermodel-property-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
51145571-bb30-409e-b1e9-edf4327f5662	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
7dac18b7-11f0-4156-99ea-08957d0391e1	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
ce821f8f-e994-41a4-af18-bf795a9dd7af	username	openid-connect	oidc-usermodel-property-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
857306f5-8382-4254-8719-14e3e0f8a5cd	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
60e5ca3a-44ef-410f-bb42-fded356c8275	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
e954d92b-2596-4c35-859d-5272c4897a7d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
899b889c-776a-4fe0-8bf2-6acbfc627a49	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
fd1680c0-09b4-4738-8fb1-b479b3a40252	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
10026182-b435-4f99-92b6-479345ac01ae	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e65e131d-477d-484c-b7c1-687c79379699
8fb41178-8838-4cc3-af29-49ebdc50b4c5	email	openid-connect	oidc-usermodel-property-mapper	\N	85ccb83a-4464-4d87-b0cd-a70856ea7b87
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	email verified	openid-connect	oidc-usermodel-property-mapper	\N	85ccb83a-4464-4d87-b0cd-a70856ea7b87
2d324630-127a-42dd-b1b1-a271d90ac30d	address	openid-connect	oidc-address-mapper	\N	849d9f4c-58d3-44ed-acd2-d531d02a22aa
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	26ae889f-e8a9-40e9-bb37-d2a11d20a655
1f39a64f-f3a4-4be5-9304-f0019940f3ec	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	26ae889f-e8a9-40e9-bb37-d2a11d20a655
abc51f5c-49e8-4850-af01-750fcb6003bf	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	da7d897f-2f41-47a5-bca3-b74503b2defa
6d1b9072-9292-48c5-bbf7-5191f3042188	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	da7d897f-2f41-47a5-bca3-b74503b2defa
3f0e310c-8d16-4afb-8863-46bce8830aaf	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	da7d897f-2f41-47a5-bca3-b74503b2defa
b4a86792-9095-46ba-b209-75c7896cc257	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	2ac7536c-caa0-42b7-b780-7e5a450ab85f
9e80f079-d91f-405c-8c40-9d39061eaf0f	upn	openid-connect	oidc-usermodel-property-mapper	\N	df49dc9e-2282-4900-b583-597170e59b4a
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	df49dc9e-2282-4900-b583-597170e59b4a
388be245-93a4-453c-803c-4bdcabc3a8d6	address	openid-connect	oidc-address-mapper	\N	b0ba3b0a-624c-4775-90fa-683b60ede686
e29601cf-496e-4c6f-9d02-0c5cb8521510	email verified	openid-connect	oidc-usermodel-property-mapper	\N	611cc940-bb57-4bcc-a395-b245fceaf50a
57d46c31-92c0-4ace-8e6d-4e97333959c4	email	openid-connect	oidc-usermodel-property-mapper	\N	611cc940-bb57-4bcc-a395-b245fceaf50a
c0441b8e-43ce-423c-8f0a-7d6233e8004d	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f93939f9-a5b4-47d0-8dc9-644e8ab5b743
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	upn	openid-connect	oidc-usermodel-property-mapper	\N	f93939f9-a5b4-47d0-8dc9-644e8ab5b743
57175c31-c339-40f9-b9b1-afd77360b096	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	e95aed41-e8c8-41f4-b033-426f456dc7eb
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	e95aed41-e8c8-41f4-b033-426f456dc7eb
947380d5-257b-40d1-9022-6d0352750660	family name	openid-connect	oidc-usermodel-property-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
b2fdabc9-d09a-405d-a991-9def1a687559	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
4ac32da8-f930-4f7e-bae4-b995730dee1f	username	openid-connect	oidc-usermodel-property-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
520f47d2-2a3c-4581-a39f-728b33d1bddd	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
086ce5be-3c35-4590-bd5d-d472c5785924	given name	openid-connect	oidc-usermodel-property-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
f05069d7-6bd5-44c7-96af-c83c412cf1a1	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
e512406a-ae95-4df5-9999-567eb39f919e	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
40e022df-e4c2-4dbe-b3be-eb8e692fce36	full name	openid-connect	oidc-full-name-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	website	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
3ea75be9-8973-432d-82ec-2433b0dab33f	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
78a66bda-7abe-4a6d-8928-c0d6209e422a	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
00a61c89-2c35-4a23-9991-382bd5e6e6fe	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	f81c05d2-6d9c-43a0-b155-e254b02cc36c
05b15b8b-7a83-4173-a848-1db7cca29c87	role list	saml	saml-role-list-mapper	\N	0f212589-71e3-41ca-9cc8-055b8f95c2d0
19c7bf71-9cfb-4844-a9e0-0d17aed1b836	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	9224ad64-eda6-443e-8f25-7eca7b969082
b1d38bfd-ed93-453b-9c71-6ac445101e3b	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	9224ad64-eda6-443e-8f25-7eca7b969082
6d271645-48c4-487e-8a47-9564b7591358	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	9224ad64-eda6-443e-8f25-7eca7b969082
cdfacc5a-73f4-438c-a7e7-1af9115cf8ce	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	eaf41ddc-34e5-4469-885f-47b72535e329
fc7675cd-43e0-4d8a-b353-5d8963c78ef7	audience resolve	openid-connect	oidc-audience-resolve-mapper	f2e03981-2f27-452c-83a2-3cd82c2889b0	\N
d55fecbd-a09c-423a-96b3-322eed45c24a	locale	openid-connect	oidc-usermodel-attribute-mapper	f18c46df-f2e5-4cd0-af01-0e9c6865b749	\N
\.


--
-- TOC entry 3863 (class 0 OID 16672)
-- Dependencies: 253
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	true	userinfo.token.claim
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	locale	user.attribute
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	true	id.token.claim
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	true	access.token.claim
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	locale	claim.name
c9d4d107-a2f1-47f5-826a-12f8fa76dbd4	String	jsonType.label
a0e5e407-dc9d-4086-ac16-e6f09111f409	false	single
a0e5e407-dc9d-4086-ac16-e6f09111f409	Basic	attribute.nameformat
a0e5e407-dc9d-4086-ac16-e6f09111f409	Role	attribute.name
3666d2ae-5f3d-43cd-9439-fd4f3443322a	true	userinfo.token.claim
3666d2ae-5f3d-43cd-9439-fd4f3443322a	true	id.token.claim
3666d2ae-5f3d-43cd-9439-fd4f3443322a	true	access.token.claim
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	true	userinfo.token.claim
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	lastName	user.attribute
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	true	id.token.claim
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	true	access.token.claim
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	family_name	claim.name
1f2c7ebd-7fcb-4585-9f62-d8025500b2e7	String	jsonType.label
1d4081c8-a7db-44c3-a308-56c3dd05b10e	true	userinfo.token.claim
1d4081c8-a7db-44c3-a308-56c3dd05b10e	firstName	user.attribute
1d4081c8-a7db-44c3-a308-56c3dd05b10e	true	id.token.claim
1d4081c8-a7db-44c3-a308-56c3dd05b10e	true	access.token.claim
1d4081c8-a7db-44c3-a308-56c3dd05b10e	given_name	claim.name
1d4081c8-a7db-44c3-a308-56c3dd05b10e	String	jsonType.label
51145571-bb30-409e-b1e9-edf4327f5662	true	userinfo.token.claim
51145571-bb30-409e-b1e9-edf4327f5662	middleName	user.attribute
51145571-bb30-409e-b1e9-edf4327f5662	true	id.token.claim
51145571-bb30-409e-b1e9-edf4327f5662	true	access.token.claim
51145571-bb30-409e-b1e9-edf4327f5662	middle_name	claim.name
51145571-bb30-409e-b1e9-edf4327f5662	String	jsonType.label
7dac18b7-11f0-4156-99ea-08957d0391e1	true	userinfo.token.claim
7dac18b7-11f0-4156-99ea-08957d0391e1	nickname	user.attribute
7dac18b7-11f0-4156-99ea-08957d0391e1	true	id.token.claim
7dac18b7-11f0-4156-99ea-08957d0391e1	true	access.token.claim
7dac18b7-11f0-4156-99ea-08957d0391e1	nickname	claim.name
7dac18b7-11f0-4156-99ea-08957d0391e1	String	jsonType.label
ce821f8f-e994-41a4-af18-bf795a9dd7af	true	userinfo.token.claim
ce821f8f-e994-41a4-af18-bf795a9dd7af	username	user.attribute
ce821f8f-e994-41a4-af18-bf795a9dd7af	true	id.token.claim
ce821f8f-e994-41a4-af18-bf795a9dd7af	true	access.token.claim
ce821f8f-e994-41a4-af18-bf795a9dd7af	preferred_username	claim.name
ce821f8f-e994-41a4-af18-bf795a9dd7af	String	jsonType.label
857306f5-8382-4254-8719-14e3e0f8a5cd	true	userinfo.token.claim
857306f5-8382-4254-8719-14e3e0f8a5cd	profile	user.attribute
857306f5-8382-4254-8719-14e3e0f8a5cd	true	id.token.claim
857306f5-8382-4254-8719-14e3e0f8a5cd	true	access.token.claim
857306f5-8382-4254-8719-14e3e0f8a5cd	profile	claim.name
857306f5-8382-4254-8719-14e3e0f8a5cd	String	jsonType.label
60e5ca3a-44ef-410f-bb42-fded356c8275	true	userinfo.token.claim
60e5ca3a-44ef-410f-bb42-fded356c8275	picture	user.attribute
60e5ca3a-44ef-410f-bb42-fded356c8275	true	id.token.claim
60e5ca3a-44ef-410f-bb42-fded356c8275	true	access.token.claim
60e5ca3a-44ef-410f-bb42-fded356c8275	picture	claim.name
60e5ca3a-44ef-410f-bb42-fded356c8275	String	jsonType.label
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	true	userinfo.token.claim
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	website	user.attribute
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	true	id.token.claim
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	true	access.token.claim
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	website	claim.name
fdd88a70-c1f3-44de-90cd-5c255e0a5fb7	String	jsonType.label
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	true	userinfo.token.claim
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	gender	user.attribute
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	true	id.token.claim
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	true	access.token.claim
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	gender	claim.name
24dee4c1-1558-4c72-81c3-6c5325b0cfe3	String	jsonType.label
e954d92b-2596-4c35-859d-5272c4897a7d	true	userinfo.token.claim
e954d92b-2596-4c35-859d-5272c4897a7d	birthdate	user.attribute
e954d92b-2596-4c35-859d-5272c4897a7d	true	id.token.claim
e954d92b-2596-4c35-859d-5272c4897a7d	true	access.token.claim
e954d92b-2596-4c35-859d-5272c4897a7d	birthdate	claim.name
e954d92b-2596-4c35-859d-5272c4897a7d	String	jsonType.label
899b889c-776a-4fe0-8bf2-6acbfc627a49	true	userinfo.token.claim
899b889c-776a-4fe0-8bf2-6acbfc627a49	zoneinfo	user.attribute
899b889c-776a-4fe0-8bf2-6acbfc627a49	true	id.token.claim
899b889c-776a-4fe0-8bf2-6acbfc627a49	true	access.token.claim
899b889c-776a-4fe0-8bf2-6acbfc627a49	zoneinfo	claim.name
899b889c-776a-4fe0-8bf2-6acbfc627a49	String	jsonType.label
fd1680c0-09b4-4738-8fb1-b479b3a40252	true	userinfo.token.claim
fd1680c0-09b4-4738-8fb1-b479b3a40252	locale	user.attribute
fd1680c0-09b4-4738-8fb1-b479b3a40252	true	id.token.claim
fd1680c0-09b4-4738-8fb1-b479b3a40252	true	access.token.claim
fd1680c0-09b4-4738-8fb1-b479b3a40252	locale	claim.name
fd1680c0-09b4-4738-8fb1-b479b3a40252	String	jsonType.label
10026182-b435-4f99-92b6-479345ac01ae	true	userinfo.token.claim
10026182-b435-4f99-92b6-479345ac01ae	updatedAt	user.attribute
10026182-b435-4f99-92b6-479345ac01ae	true	id.token.claim
10026182-b435-4f99-92b6-479345ac01ae	true	access.token.claim
10026182-b435-4f99-92b6-479345ac01ae	updated_at	claim.name
10026182-b435-4f99-92b6-479345ac01ae	String	jsonType.label
8fb41178-8838-4cc3-af29-49ebdc50b4c5	true	userinfo.token.claim
8fb41178-8838-4cc3-af29-49ebdc50b4c5	email	user.attribute
8fb41178-8838-4cc3-af29-49ebdc50b4c5	true	id.token.claim
8fb41178-8838-4cc3-af29-49ebdc50b4c5	true	access.token.claim
8fb41178-8838-4cc3-af29-49ebdc50b4c5	email	claim.name
8fb41178-8838-4cc3-af29-49ebdc50b4c5	String	jsonType.label
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	true	userinfo.token.claim
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	emailVerified	user.attribute
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	true	id.token.claim
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	true	access.token.claim
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	email_verified	claim.name
eabe3c30-9a4c-4450-a3bc-8bc739c202ec	boolean	jsonType.label
2d324630-127a-42dd-b1b1-a271d90ac30d	formatted	user.attribute.formatted
2d324630-127a-42dd-b1b1-a271d90ac30d	country	user.attribute.country
2d324630-127a-42dd-b1b1-a271d90ac30d	postal_code	user.attribute.postal_code
2d324630-127a-42dd-b1b1-a271d90ac30d	true	userinfo.token.claim
2d324630-127a-42dd-b1b1-a271d90ac30d	street	user.attribute.street
2d324630-127a-42dd-b1b1-a271d90ac30d	true	id.token.claim
2d324630-127a-42dd-b1b1-a271d90ac30d	region	user.attribute.region
2d324630-127a-42dd-b1b1-a271d90ac30d	true	access.token.claim
2d324630-127a-42dd-b1b1-a271d90ac30d	locality	user.attribute.locality
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	true	userinfo.token.claim
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	phoneNumber	user.attribute
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	true	id.token.claim
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	true	access.token.claim
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	phone_number	claim.name
a9cec0a6-6999-4b4c-9abd-2261c8f973d0	String	jsonType.label
1f39a64f-f3a4-4be5-9304-f0019940f3ec	true	userinfo.token.claim
1f39a64f-f3a4-4be5-9304-f0019940f3ec	phoneNumberVerified	user.attribute
1f39a64f-f3a4-4be5-9304-f0019940f3ec	true	id.token.claim
1f39a64f-f3a4-4be5-9304-f0019940f3ec	true	access.token.claim
1f39a64f-f3a4-4be5-9304-f0019940f3ec	phone_number_verified	claim.name
1f39a64f-f3a4-4be5-9304-f0019940f3ec	boolean	jsonType.label
abc51f5c-49e8-4850-af01-750fcb6003bf	true	multivalued
abc51f5c-49e8-4850-af01-750fcb6003bf	foo	user.attribute
abc51f5c-49e8-4850-af01-750fcb6003bf	true	access.token.claim
abc51f5c-49e8-4850-af01-750fcb6003bf	realm_access.roles	claim.name
abc51f5c-49e8-4850-af01-750fcb6003bf	String	jsonType.label
6d1b9072-9292-48c5-bbf7-5191f3042188	true	multivalued
6d1b9072-9292-48c5-bbf7-5191f3042188	foo	user.attribute
6d1b9072-9292-48c5-bbf7-5191f3042188	true	access.token.claim
6d1b9072-9292-48c5-bbf7-5191f3042188	resource_access.${client_id}.roles	claim.name
6d1b9072-9292-48c5-bbf7-5191f3042188	String	jsonType.label
9e80f079-d91f-405c-8c40-9d39061eaf0f	true	userinfo.token.claim
9e80f079-d91f-405c-8c40-9d39061eaf0f	username	user.attribute
9e80f079-d91f-405c-8c40-9d39061eaf0f	true	id.token.claim
9e80f079-d91f-405c-8c40-9d39061eaf0f	true	access.token.claim
9e80f079-d91f-405c-8c40-9d39061eaf0f	upn	claim.name
9e80f079-d91f-405c-8c40-9d39061eaf0f	String	jsonType.label
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	true	multivalued
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	foo	user.attribute
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	true	id.token.claim
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	true	access.token.claim
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	groups	claim.name
f1d4fb01-1ff0-41a6-b5fc-5587aee8e043	String	jsonType.label
388be245-93a4-453c-803c-4bdcabc3a8d6	formatted	user.attribute.formatted
388be245-93a4-453c-803c-4bdcabc3a8d6	country	user.attribute.country
388be245-93a4-453c-803c-4bdcabc3a8d6	postal_code	user.attribute.postal_code
388be245-93a4-453c-803c-4bdcabc3a8d6	true	userinfo.token.claim
388be245-93a4-453c-803c-4bdcabc3a8d6	street	user.attribute.street
388be245-93a4-453c-803c-4bdcabc3a8d6	true	id.token.claim
388be245-93a4-453c-803c-4bdcabc3a8d6	region	user.attribute.region
388be245-93a4-453c-803c-4bdcabc3a8d6	true	access.token.claim
388be245-93a4-453c-803c-4bdcabc3a8d6	locality	user.attribute.locality
e29601cf-496e-4c6f-9d02-0c5cb8521510	true	userinfo.token.claim
e29601cf-496e-4c6f-9d02-0c5cb8521510	emailVerified	user.attribute
e29601cf-496e-4c6f-9d02-0c5cb8521510	true	id.token.claim
e29601cf-496e-4c6f-9d02-0c5cb8521510	true	access.token.claim
e29601cf-496e-4c6f-9d02-0c5cb8521510	email_verified	claim.name
e29601cf-496e-4c6f-9d02-0c5cb8521510	boolean	jsonType.label
57d46c31-92c0-4ace-8e6d-4e97333959c4	true	userinfo.token.claim
57d46c31-92c0-4ace-8e6d-4e97333959c4	email	user.attribute
57d46c31-92c0-4ace-8e6d-4e97333959c4	true	id.token.claim
57d46c31-92c0-4ace-8e6d-4e97333959c4	true	access.token.claim
57d46c31-92c0-4ace-8e6d-4e97333959c4	email	claim.name
57d46c31-92c0-4ace-8e6d-4e97333959c4	String	jsonType.label
c0441b8e-43ce-423c-8f0a-7d6233e8004d	true	multivalued
c0441b8e-43ce-423c-8f0a-7d6233e8004d	true	userinfo.token.claim
c0441b8e-43ce-423c-8f0a-7d6233e8004d	foo	user.attribute
c0441b8e-43ce-423c-8f0a-7d6233e8004d	true	id.token.claim
c0441b8e-43ce-423c-8f0a-7d6233e8004d	true	access.token.claim
c0441b8e-43ce-423c-8f0a-7d6233e8004d	groups	claim.name
c0441b8e-43ce-423c-8f0a-7d6233e8004d	String	jsonType.label
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	true	userinfo.token.claim
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	username	user.attribute
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	true	id.token.claim
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	true	access.token.claim
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	upn	claim.name
1841d4da-8824-4bb0-88f6-04dc60a5d9ff	String	jsonType.label
57175c31-c339-40f9-b9b1-afd77360b096	true	userinfo.token.claim
57175c31-c339-40f9-b9b1-afd77360b096	phoneNumber	user.attribute
57175c31-c339-40f9-b9b1-afd77360b096	true	id.token.claim
57175c31-c339-40f9-b9b1-afd77360b096	true	access.token.claim
57175c31-c339-40f9-b9b1-afd77360b096	phone_number	claim.name
57175c31-c339-40f9-b9b1-afd77360b096	String	jsonType.label
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	true	userinfo.token.claim
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	phoneNumberVerified	user.attribute
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	true	id.token.claim
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	true	access.token.claim
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	phone_number_verified	claim.name
a5ec0da4-bd4b-4dab-8129-c899ef1cbf12	boolean	jsonType.label
947380d5-257b-40d1-9022-6d0352750660	true	userinfo.token.claim
947380d5-257b-40d1-9022-6d0352750660	lastName	user.attribute
947380d5-257b-40d1-9022-6d0352750660	true	id.token.claim
947380d5-257b-40d1-9022-6d0352750660	true	access.token.claim
947380d5-257b-40d1-9022-6d0352750660	family_name	claim.name
947380d5-257b-40d1-9022-6d0352750660	String	jsonType.label
b2fdabc9-d09a-405d-a991-9def1a687559	true	userinfo.token.claim
b2fdabc9-d09a-405d-a991-9def1a687559	updatedAt	user.attribute
b2fdabc9-d09a-405d-a991-9def1a687559	true	id.token.claim
b2fdabc9-d09a-405d-a991-9def1a687559	true	access.token.claim
b2fdabc9-d09a-405d-a991-9def1a687559	updated_at	claim.name
b2fdabc9-d09a-405d-a991-9def1a687559	String	jsonType.label
4ac32da8-f930-4f7e-bae4-b995730dee1f	true	userinfo.token.claim
4ac32da8-f930-4f7e-bae4-b995730dee1f	username	user.attribute
4ac32da8-f930-4f7e-bae4-b995730dee1f	true	id.token.claim
4ac32da8-f930-4f7e-bae4-b995730dee1f	true	access.token.claim
4ac32da8-f930-4f7e-bae4-b995730dee1f	preferred_username	claim.name
4ac32da8-f930-4f7e-bae4-b995730dee1f	String	jsonType.label
520f47d2-2a3c-4581-a39f-728b33d1bddd	true	userinfo.token.claim
520f47d2-2a3c-4581-a39f-728b33d1bddd	birthdate	user.attribute
520f47d2-2a3c-4581-a39f-728b33d1bddd	true	id.token.claim
520f47d2-2a3c-4581-a39f-728b33d1bddd	true	access.token.claim
520f47d2-2a3c-4581-a39f-728b33d1bddd	birthdate	claim.name
520f47d2-2a3c-4581-a39f-728b33d1bddd	String	jsonType.label
086ce5be-3c35-4590-bd5d-d472c5785924	true	userinfo.token.claim
086ce5be-3c35-4590-bd5d-d472c5785924	firstName	user.attribute
086ce5be-3c35-4590-bd5d-d472c5785924	true	id.token.claim
086ce5be-3c35-4590-bd5d-d472c5785924	true	access.token.claim
086ce5be-3c35-4590-bd5d-d472c5785924	given_name	claim.name
086ce5be-3c35-4590-bd5d-d472c5785924	String	jsonType.label
f05069d7-6bd5-44c7-96af-c83c412cf1a1	true	userinfo.token.claim
f05069d7-6bd5-44c7-96af-c83c412cf1a1	locale	user.attribute
f05069d7-6bd5-44c7-96af-c83c412cf1a1	true	id.token.claim
f05069d7-6bd5-44c7-96af-c83c412cf1a1	true	access.token.claim
f05069d7-6bd5-44c7-96af-c83c412cf1a1	locale	claim.name
f05069d7-6bd5-44c7-96af-c83c412cf1a1	String	jsonType.label
e512406a-ae95-4df5-9999-567eb39f919e	true	userinfo.token.claim
e512406a-ae95-4df5-9999-567eb39f919e	zoneinfo	user.attribute
e512406a-ae95-4df5-9999-567eb39f919e	true	id.token.claim
e512406a-ae95-4df5-9999-567eb39f919e	true	access.token.claim
e512406a-ae95-4df5-9999-567eb39f919e	zoneinfo	claim.name
e512406a-ae95-4df5-9999-567eb39f919e	String	jsonType.label
40e022df-e4c2-4dbe-b3be-eb8e692fce36	true	id.token.claim
40e022df-e4c2-4dbe-b3be-eb8e692fce36	true	access.token.claim
40e022df-e4c2-4dbe-b3be-eb8e692fce36	true	userinfo.token.claim
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	true	userinfo.token.claim
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	picture	user.attribute
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	true	id.token.claim
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	true	access.token.claim
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	picture	claim.name
dde2df8e-ae23-4e6e-99da-ccbeb112bb35	String	jsonType.label
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	true	userinfo.token.claim
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	website	user.attribute
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	true	id.token.claim
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	true	access.token.claim
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	website	claim.name
e4a180f5-8bcc-46a9-bc10-f1fa6300a4b8	String	jsonType.label
3ea75be9-8973-432d-82ec-2433b0dab33f	true	userinfo.token.claim
3ea75be9-8973-432d-82ec-2433b0dab33f	gender	user.attribute
3ea75be9-8973-432d-82ec-2433b0dab33f	true	id.token.claim
3ea75be9-8973-432d-82ec-2433b0dab33f	true	access.token.claim
3ea75be9-8973-432d-82ec-2433b0dab33f	gender	claim.name
3ea75be9-8973-432d-82ec-2433b0dab33f	String	jsonType.label
78a66bda-7abe-4a6d-8928-c0d6209e422a	true	userinfo.token.claim
78a66bda-7abe-4a6d-8928-c0d6209e422a	profile	user.attribute
78a66bda-7abe-4a6d-8928-c0d6209e422a	true	id.token.claim
78a66bda-7abe-4a6d-8928-c0d6209e422a	true	access.token.claim
78a66bda-7abe-4a6d-8928-c0d6209e422a	profile	claim.name
78a66bda-7abe-4a6d-8928-c0d6209e422a	String	jsonType.label
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	true	userinfo.token.claim
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	nickname	user.attribute
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	true	id.token.claim
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	true	access.token.claim
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	nickname	claim.name
8ce1e685-5767-49ae-b501-7ac5f85ce2c8	String	jsonType.label
00a61c89-2c35-4a23-9991-382bd5e6e6fe	true	userinfo.token.claim
00a61c89-2c35-4a23-9991-382bd5e6e6fe	middleName	user.attribute
00a61c89-2c35-4a23-9991-382bd5e6e6fe	true	id.token.claim
00a61c89-2c35-4a23-9991-382bd5e6e6fe	true	access.token.claim
00a61c89-2c35-4a23-9991-382bd5e6e6fe	middle_name	claim.name
00a61c89-2c35-4a23-9991-382bd5e6e6fe	String	jsonType.label
05b15b8b-7a83-4173-a848-1db7cca29c87	false	single
05b15b8b-7a83-4173-a848-1db7cca29c87	Basic	attribute.nameformat
05b15b8b-7a83-4173-a848-1db7cca29c87	Role	attribute.name
19c7bf71-9cfb-4844-a9e0-0d17aed1b836	foo	user.attribute
19c7bf71-9cfb-4844-a9e0-0d17aed1b836	true	access.token.claim
19c7bf71-9cfb-4844-a9e0-0d17aed1b836	resource_access.${client_id}.roles	claim.name
19c7bf71-9cfb-4844-a9e0-0d17aed1b836	String	jsonType.label
19c7bf71-9cfb-4844-a9e0-0d17aed1b836	true	multivalued
b1d38bfd-ed93-453b-9c71-6ac445101e3b	foo	user.attribute
b1d38bfd-ed93-453b-9c71-6ac445101e3b	true	access.token.claim
b1d38bfd-ed93-453b-9c71-6ac445101e3b	realm_access.roles	claim.name
b1d38bfd-ed93-453b-9c71-6ac445101e3b	String	jsonType.label
b1d38bfd-ed93-453b-9c71-6ac445101e3b	true	multivalued
d55fecbd-a09c-423a-96b3-322eed45c24a	true	userinfo.token.claim
d55fecbd-a09c-423a-96b3-322eed45c24a	locale	user.attribute
d55fecbd-a09c-423a-96b3-322eed45c24a	true	id.token.claim
d55fecbd-a09c-423a-96b3-322eed45c24a	true	access.token.claim
d55fecbd-a09c-423a-96b3-322eed45c24a	locale	claim.name
d55fecbd-a09c-423a-96b3-322eed45c24a	String	jsonType.label
\.


--
-- TOC entry 3864 (class 0 OID 16678)
-- Dependencies: 254
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	68e0f89b-058c-47ce-babf-150654146ee3	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	23253ffd-4f87-4f2a-8541-adcca50a7bac	ea59d6e8-a0ff-4ca6-81f6-c8d85936ec7f	d33156b9-3d6d-4e17-95a3-90137b745f88	7a85660e-eb05-4158-86a8-32221a370406	c4376f84-2e52-4c98-801e-2bb4c3c00f79	2592000	f	900	t	f	2bc74371-7d84-4891-8b11-5463515637cf	0	f	0	0
BoaVistaOpenBanking	60	300	300	\N	\N	\N	t	f	0	\N	BoaVistaOpenBanking	1617287946	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	02112e74-42ef-41cb-bc87-b1dd2c1a01b9	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	59add4ae-022c-45bf-824b-e3125760ea2a	43c2b952-0816-4541-b08e-9e35b826700b	76dc3c52-b92d-467c-a82a-079c718b248d	68c629d2-e121-4bfa-afac-0715c1a08198	d3a8174a-2f00-4b41-bab8-e7969787a068	2592000	f	900	t	f	65fea813-66e6-4b42-a7c6-260d2d53a03e	0	f	0	0
\.


--
-- TOC entry 3865 (class 0 OID 16712)
-- Dependencies: 255
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		BoaVistaOpenBanking
_browser_header.xContentTypeOptions	nosniff	BoaVistaOpenBanking
_browser_header.xRobotsTag	none	BoaVistaOpenBanking
_browser_header.xFrameOptions	SAMEORIGIN	BoaVistaOpenBanking
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	BoaVistaOpenBanking
_browser_header.xXSSProtection	1; mode=block	BoaVistaOpenBanking
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	BoaVistaOpenBanking
bruteForceProtected	false	BoaVistaOpenBanking
permanentLockout	false	BoaVistaOpenBanking
maxFailureWaitSeconds	900	BoaVistaOpenBanking
minimumQuickLoginWaitSeconds	60	BoaVistaOpenBanking
waitIncrementSeconds	60	BoaVistaOpenBanking
quickLoginCheckMilliSeconds	1000	BoaVistaOpenBanking
maxDeltaTimeSeconds	43200	BoaVistaOpenBanking
failureFactor	30	BoaVistaOpenBanking
offlineSessionMaxLifespanEnabled	false	BoaVistaOpenBanking
offlineSessionMaxLifespan	5184000	BoaVistaOpenBanking
clientSessionIdleTimeout	0	BoaVistaOpenBanking
clientSessionMaxLifespan	0	BoaVistaOpenBanking
clientOfflineSessionIdleTimeout	0	BoaVistaOpenBanking
clientOfflineSessionMaxLifespan	0	BoaVistaOpenBanking
actionTokenGeneratedByAdminLifespan	43200	BoaVistaOpenBanking
actionTokenGeneratedByUserLifespan	300	BoaVistaOpenBanking
webAuthnPolicyRpEntityName	keycloak	BoaVistaOpenBanking
webAuthnPolicySignatureAlgorithms	ES256	BoaVistaOpenBanking
webAuthnPolicyRpId		BoaVistaOpenBanking
webAuthnPolicyAttestationConveyancePreference	not specified	BoaVistaOpenBanking
webAuthnPolicyAuthenticatorAttachment	not specified	BoaVistaOpenBanking
webAuthnPolicyRequireResidentKey	not specified	BoaVistaOpenBanking
webAuthnPolicyUserVerificationRequirement	not specified	BoaVistaOpenBanking
webAuthnPolicyCreateTimeout	0	BoaVistaOpenBanking
webAuthnPolicyAvoidSameAuthenticatorRegister	false	BoaVistaOpenBanking
webAuthnPolicyRpEntityNamePasswordless	keycloak	BoaVistaOpenBanking
webAuthnPolicySignatureAlgorithmsPasswordless	ES256	BoaVistaOpenBanking
webAuthnPolicyRpIdPasswordless		BoaVistaOpenBanking
webAuthnPolicyAttestationConveyancePreferencePasswordless	not specified	BoaVistaOpenBanking
webAuthnPolicyAuthenticatorAttachmentPasswordless	not specified	BoaVistaOpenBanking
webAuthnPolicyRequireResidentKeyPasswordless	not specified	BoaVistaOpenBanking
webAuthnPolicyUserVerificationRequirementPasswordless	not specified	BoaVistaOpenBanking
webAuthnPolicyCreateTimeoutPasswordless	0	BoaVistaOpenBanking
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	false	BoaVistaOpenBanking
\.


--
-- TOC entry 3866 (class 0 OID 16718)
-- Dependencies: 256
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 3867 (class 0 OID 16721)
-- Dependencies: 257
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	01ba0074-366b-404f-a02e-d7766e834d07
master	41dff926-9a8f-4a21-aeb6-eaf6070c9af1
BoaVistaOpenBanking	da93f7b0-275f-49d7-bcf4-f877a7dcc1c7
BoaVistaOpenBanking	13125a75-fd77-4983-9b28-637fc09c86fe
\.


--
-- TOC entry 3868 (class 0 OID 16724)
-- Dependencies: 258
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- TOC entry 3869 (class 0 OID 16727)
-- Dependencies: 259
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
BoaVistaOpenBanking	jboss-logging
\.


--
-- TOC entry 3870 (class 0 OID 16730)
-- Dependencies: 260
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 3871 (class 0 OID 16736)
-- Dependencies: 261
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	BoaVistaOpenBanking
\.


--
-- TOC entry 3872 (class 0 OID 16744)
-- Dependencies: 262
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 3873 (class 0 OID 16750)
-- Dependencies: 263
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 3874 (class 0 OID 16753)
-- Dependencies: 264
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
90713a4f-114e-426d-976f-1166acb8dd92	/realms/master/account/*
429379c0-f4c2-47c0-abf0-20abaaaf7116	/realms/master/account/*
0a7c13ea-adda-4f53-b892-427176229a4f	/admin/master/console/*
65eb4904-f8fc-4f47-8e79-b617c18ead3c	/realms/BoaVistaOpenBanking/account/*
f2e03981-2f27-452c-83a2-3cd82c2889b0	/realms/BoaVistaOpenBanking/account/*
f18c46df-f2e5-4cd0-af01-0e9c6865b749	/admin/BoaVistaOpenBanking/console/*
69f890ee-8261-43c5-8f9c-efee0753b279	http://localhost:8080/*
\.


--
-- TOC entry 3875 (class 0 OID 16756)
-- Dependencies: 265
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 3876 (class 0 OID 16762)
-- Dependencies: 266
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
d945e90d-92ba-4182-870a-5a1030d90909	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
3cbedce9-a61e-4d73-9c1f-3cb14e8721b6	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
452cc95b-f320-4baa-8d7f-176617eef9d3	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
b740cd88-cf00-464b-865f-71fc56a1c685	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
62c3ded5-c0f8-4ecf-ba97-2f3351b26af9	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
90d19601-f051-42ec-8a76-4a99f1e5c3f7	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
11ab0167-c37a-4bd6-b20e-699d847addef	delete_account	Delete Account	master	f	f	delete_account	60
d772474b-f8b2-4a51-b48f-486a0edeff89	CONFIGURE_TOTP	Configure OTP	BoaVistaOpenBanking	t	f	CONFIGURE_TOTP	10
83909646-81b4-4604-823f-556b0e85599a	terms_and_conditions	Terms and Conditions	BoaVistaOpenBanking	f	f	terms_and_conditions	20
1cd4b196-45d0-4971-b93e-503da93d903e	UPDATE_PASSWORD	Update Password	BoaVistaOpenBanking	t	f	UPDATE_PASSWORD	30
951a646e-a887-44c9-8846-d3354c998244	UPDATE_PROFILE	Update Profile	BoaVistaOpenBanking	t	f	UPDATE_PROFILE	40
6ceb528b-c481-4075-9a84-2d4915fee5f8	VERIFY_EMAIL	Verify Email	BoaVistaOpenBanking	t	f	VERIFY_EMAIL	50
9c8264f1-8c90-4ff5-aaf2-0a4611467864	delete_account	Delete Account	BoaVistaOpenBanking	f	f	delete_account	60
9abd41d0-5392-4bf4-ae90-c86aff6a332a	update_user_locale	Update User Locale	BoaVistaOpenBanking	t	f	update_user_locale	1000
\.


--
-- TOC entry 3877 (class 0 OID 16770)
-- Dependencies: 267
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 3878 (class 0 OID 16777)
-- Dependencies: 268
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 3879 (class 0 OID 16780)
-- Dependencies: 269
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 3880 (class 0 OID 16783)
-- Dependencies: 270
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- TOC entry 3881 (class 0 OID 16788)
-- Dependencies: 271
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 3882 (class 0 OID 16794)
-- Dependencies: 272
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 3883 (class 0 OID 16800)
-- Dependencies: 273
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 3884 (class 0 OID 16807)
-- Dependencies: 274
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 3885 (class 0 OID 16813)
-- Dependencies: 275
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 3886 (class 0 OID 16816)
-- Dependencies: 276
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 3887 (class 0 OID 16822)
-- Dependencies: 277
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
429379c0-f4c2-47c0-abf0-20abaaaf7116	715ce0c2-28a6-4718-8455-25ab5a9664e3
f2e03981-2f27-452c-83a2-3cd82c2889b0	b6364630-373c-4932-8eba-ed4a38a404d1
\.


--
-- TOC entry 3888 (class 0 OID 16825)
-- Dependencies: 278
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 3889 (class 0 OID 16828)
-- Dependencies: 279
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- TOC entry 3890 (class 0 OID 16835)
-- Dependencies: 280
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 3891 (class 0 OID 16841)
-- Dependencies: 281
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 3892 (class 0 OID 16844)
-- Dependencies: 282
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
e1fbb611-de3c-4dc3-a923-c6aca02017f2	\N	c946d38c-b848-4494-a05e-56c2f9debc0d	f	t	\N	\N	\N	master	admin	1616972490789	\N	0
4d6e51bd-7643-4873-af52-0e939fc22b0e	\N	45bf4f8a-b579-4ec8-8ce1-6263b6c646dd	t	t	\N	\N	\N	BoaVistaOpenBanking	user_boavista	1616972589658	\N	0
\.


--
-- TOC entry 3893 (class 0 OID 16853)
-- Dependencies: 283
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 3894 (class 0 OID 16859)
-- Dependencies: 284
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 3895 (class 0 OID 16865)
-- Dependencies: 285
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 3896 (class 0 OID 16871)
-- Dependencies: 286
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 3897 (class 0 OID 16877)
-- Dependencies: 287
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- TOC entry 3898 (class 0 OID 16880)
-- Dependencies: 288
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- TOC entry 3899 (class 0 OID 16884)
-- Dependencies: 289
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
41dff926-9a8f-4a21-aeb6-eaf6070c9af1	e1fbb611-de3c-4dc3-a923-c6aca02017f2
01ba0074-366b-404f-a02e-d7766e834d07	e1fbb611-de3c-4dc3-a923-c6aca02017f2
b9c43a52-95ab-49e0-84dd-4d64a5e6bddd	e1fbb611-de3c-4dc3-a923-c6aca02017f2
715ce0c2-28a6-4718-8455-25ab5a9664e3	e1fbb611-de3c-4dc3-a923-c6aca02017f2
18314001-2e6f-420a-8bc0-3af623aab9a4	e1fbb611-de3c-4dc3-a923-c6aca02017f2
da93f7b0-275f-49d7-bcf4-f877a7dcc1c7	4d6e51bd-7643-4873-af52-0e939fc22b0e
13125a75-fd77-4983-9b28-637fc09c86fe	4d6e51bd-7643-4873-af52-0e939fc22b0e
b6364630-373c-4932-8eba-ed4a38a404d1	4d6e51bd-7643-4873-af52-0e939fc22b0e
067196d0-d4c2-499d-806c-1443405ba35a	4d6e51bd-7643-4873-af52-0e939fc22b0e
3c0e2018-7b09-450f-9ca2-e67ee1b437c5	4d6e51bd-7643-4873-af52-0e939fc22b0e
\.


--
-- TOC entry 3900 (class 0 OID 16887)
-- Dependencies: 290
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- TOC entry 3901 (class 0 OID 16894)
-- Dependencies: 291
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- TOC entry 3902 (class 0 OID 16900)
-- Dependencies: 292
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- TOC entry 3903 (class 0 OID 16906)
-- Dependencies: 293
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
0a7c13ea-adda-4f53-b892-427176229a4f	+
f18c46df-f2e5-4cd0-af01-0e9c6865b749	+
\.


--
-- TOC entry 3594 (class 2606 OID 16910)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3448 (class 2606 OID 16912)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3330 (class 2606 OID 16914)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3350 (class 2606 OID 16916)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3337 (class 2606 OID 16918)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 16920)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3321 (class 2606 OID 16922)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3369 (class 2606 OID 16924)
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- TOC entry 3332 (class 2606 OID 16926)
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3375 (class 2606 OID 16928)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 16930)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 16932)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3394 (class 2606 OID 16934)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 16936)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 16938)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 16940)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3416 (class 2606 OID 16942)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3424 (class 2606 OID 16944)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3481 (class 2606 OID 16946)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3489 (class 2606 OID 16948)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3492 (class 2606 OID 16950)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3501 (class 2606 OID 16952)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3432 (class 2606 OID 16954)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3328 (class 2606 OID 16956)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3391 (class 2606 OID 16958)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 16960)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3471 (class 2606 OID 16962)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3367 (class 2606 OID 16964)
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- TOC entry 3590 (class 2606 OID 16966)
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- TOC entry 3578 (class 2606 OID 16968)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 16970)
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- TOC entry 3323 (class 2606 OID 16972)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 16974)
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- TOC entry 3546 (class 2606 OID 16976)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3340 (class 2606 OID 16978)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3476 (class 2606 OID 16980)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3497 (class 2606 OID 16982)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3450 (class 2606 OID 16984)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 16986)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16988)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3309 (class 2606 OID 16990)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 16992)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 16994)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3361 (class 2606 OID 16996)
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 3587 (class 2606 OID 16998)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3378 (class 2606 OID 17000)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3365 (class 2606 OID 17002)
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 3437 (class 2606 OID 17004)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3463 (class 2606 OID 17006)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3499 (class 2606 OID 17008)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3382 (class 2606 OID 17010)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 17012)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3522 (class 2606 OID 17014)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3531 (class 2606 OID 17016)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 17018)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 17020)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3514 (class 2606 OID 17022)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3536 (class 2606 OID 17024)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3517 (class 2606 OID 17026)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3549 (class 2606 OID 17028)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3563 (class 2606 OID 17030)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3576 (class 2606 OID 17032)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3572 (class 2606 OID 17034)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 17036)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3560 (class 2606 OID 17038)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3555 (class 2606 OID 17040)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2606 OID 17042)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 17044)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 17046)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3439 (class 2606 OID 17048)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3442 (class 2606 OID 17050)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3454 (class 2606 OID 17052)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3457 (class 2606 OID 17054)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3460 (class 2606 OID 17056)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3465 (class 2606 OID 17058)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 17060)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3484 (class 2606 OID 17062)
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- TOC entry 3504 (class 2606 OID 17064)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3507 (class 2606 OID 17066)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3509 (class 2606 OID 17068)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 17070)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3541 (class 2606 OID 17072)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3543 (class 2606 OID 17074)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3552 (class 2606 OID 17076)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3581 (class 2606 OID 17078)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3592 (class 2606 OID 17080)
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- TOC entry 3596 (class 2606 OID 17082)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3348 (class 2606 OID 17084)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3343 (class 2606 OID 17086)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 17088)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 3520 (class 2606 OID 17090)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 17092)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3389 (class 2606 OID 17094)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3495 (class 2606 OID 17096)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3512 (class 2606 OID 17098)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3446 (class 2606 OID 17100)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3435 (class 2606 OID 17102)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3335 (class 2606 OID 17104)
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- TOC entry 3326 (class 2606 OID 17106)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3345 (class 2606 OID 17108)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3566 (class 2606 OID 17110)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3534 (class 2606 OID 17112)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3524 (class 2606 OID 17114)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3529 (class 2606 OID 17116)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3539 (class 2606 OID 17118)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3487 (class 2606 OID 17120)
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- TOC entry 3558 (class 2606 OID 17122)
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3474 (class 2606 OID 17124)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3568 (class 2606 OID 17126)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3307 (class 1259 OID 17127)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3317 (class 1259 OID 17128)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3310 (class 1259 OID 17129)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3311 (class 1259 OID 17130)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3314 (class 1259 OID 17131)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3351 (class 1259 OID 17132)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3333 (class 1259 OID 17133)
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- TOC entry 3324 (class 1259 OID 17134)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3338 (class 1259 OID 17135)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3359 (class 1259 OID 17136)
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- TOC entry 3346 (class 1259 OID 17137)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3352 (class 1259 OID 17138)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3466 (class 1259 OID 17139)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3353 (class 1259 OID 17140)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3376 (class 1259 OID 17141)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3372 (class 1259 OID 17142)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3373 (class 1259 OID 17143)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3379 (class 1259 OID 17144)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3380 (class 1259 OID 17145)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3386 (class 1259 OID 17146)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3387 (class 1259 OID 17147)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3392 (class 1259 OID 17148)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3421 (class 1259 OID 17149)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3422 (class 1259 OID 17150)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3395 (class 1259 OID 17151)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3398 (class 1259 OID 17152)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3399 (class 1259 OID 17153)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3400 (class 1259 OID 17154)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3405 (class 1259 OID 17155)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3406 (class 1259 OID 17156)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3409 (class 1259 OID 17157)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3410 (class 1259 OID 17158)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3413 (class 1259 OID 17159)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3414 (class 1259 OID 17160)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3417 (class 1259 OID 17161)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3418 (class 1259 OID 17162)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3427 (class 1259 OID 17163)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3430 (class 1259 OID 17164)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3440 (class 1259 OID 17165)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3433 (class 1259 OID 17166)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3451 (class 1259 OID 17167)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3452 (class 1259 OID 17168)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3461 (class 1259 OID 17169)
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- TOC entry 3467 (class 1259 OID 17170)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3477 (class 1259 OID 17171)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3341 (class 1259 OID 17172)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3482 (class 1259 OID 17173)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3485 (class 1259 OID 17174)
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- TOC entry 3493 (class 1259 OID 17175)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3490 (class 1259 OID 17176)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3472 (class 1259 OID 17177)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3502 (class 1259 OID 17178)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3505 (class 1259 OID 17179)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3510 (class 1259 OID 17180)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3515 (class 1259 OID 17181)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3518 (class 1259 OID 17182)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3527 (class 1259 OID 17183)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3532 (class 1259 OID 17184)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3537 (class 1259 OID 17185)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3544 (class 1259 OID 17186)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3354 (class 1259 OID 17187)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3547 (class 1259 OID 17188)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3550 (class 1259 OID 17189)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3455 (class 1259 OID 17190)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3458 (class 1259 OID 17191)
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- TOC entry 3561 (class 1259 OID 17192)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3553 (class 1259 OID 17193)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3556 (class 1259 OID 17194)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3383 (class 1259 OID 17195)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3564 (class 1259 OID 17196)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3582 (class 1259 OID 17197)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3585 (class 1259 OID 17198)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3588 (class 1259 OID 17199)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3573 (class 1259 OID 17200)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3574 (class 1259 OID 17201)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3579 (class 1259 OID 17202)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3597 (class 1259 OID 17203)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3615 (class 2606 OID 17204)
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3630 (class 2606 OID 17209)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3605 (class 2606 OID 17214)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3627 (class 2606 OID 17219)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3608 (class 2606 OID 17224)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3616 (class 2606 OID 17229)
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3678 (class 2606 OID 17234)
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- TOC entry 3618 (class 2606 OID 17239)
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3648 (class 2606 OID 17244)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3674 (class 2606 OID 17249)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3617 (class 2606 OID 17254)
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3645 (class 2606 OID 17259)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3650 (class 2606 OID 17264)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3667 (class 2606 OID 17269)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3676 (class 2606 OID 17274)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3635 (class 2606 OID 17279)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 3646 (class 2606 OID 17284)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3640 (class 2606 OID 17289)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3622 (class 2606 OID 17294)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3600 (class 2606 OID 17299)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3601 (class 2606 OID 17304)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3602 (class 2606 OID 17309)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3603 (class 2606 OID 17314)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3614 (class 2606 OID 17319)
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- TOC entry 3677 (class 2606 OID 17324)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3611 (class 2606 OID 17329)
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3612 (class 2606 OID 17334)
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3610 (class 2606 OID 17339)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3613 (class 2606 OID 17344)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3619 (class 2606 OID 17349)
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3637 (class 2606 OID 17354)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3607 (class 2606 OID 17359)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3621 (class 2606 OID 17364)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 3620 (class 2606 OID 17369)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3641 (class 2606 OID 17374)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3642 (class 2606 OID 17379)
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3673 (class 2606 OID 17384)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 3671 (class 2606 OID 17389)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3672 (class 2606 OID 17394)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3598 (class 2606 OID 17399)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3665 (class 2606 OID 17404)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3655 (class 2606 OID 17409)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3660 (class 2606 OID 17414)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3656 (class 2606 OID 17419)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3657 (class 2606 OID 17424)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3599 (class 2606 OID 17429)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3666 (class 2606 OID 17434)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3658 (class 2606 OID 17439)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3659 (class 2606 OID 17444)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3653 (class 2606 OID 17449)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3651 (class 2606 OID 17454)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3652 (class 2606 OID 17459)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3654 (class 2606 OID 17464)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3661 (class 2606 OID 17469)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3623 (class 2606 OID 17474)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3669 (class 2606 OID 17479)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 3668 (class 2606 OID 17484)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3628 (class 2606 OID 17489)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3634 (class 2606 OID 17494)
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3629 (class 2606 OID 17499)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3643 (class 2606 OID 17504)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3644 (class 2606 OID 17509)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3632 (class 2606 OID 17514)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3633 (class 2606 OID 17519)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 3679 (class 2606 OID 17524)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3606 (class 2606 OID 17529)
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3664 (class 2606 OID 17534)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3604 (class 2606 OID 17539)
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3638 (class 2606 OID 17544)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3624 (class 2606 OID 17549)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3639 (class 2606 OID 17554)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 3625 (class 2606 OID 17559)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3626 (class 2606 OID 17564)
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3609 (class 2606 OID 17569)
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3649 (class 2606 OID 17574)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3662 (class 2606 OID 17579)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3663 (class 2606 OID 17584)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3647 (class 2606 OID 17589)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3670 (class 2606 OID 17594)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3675 (class 2606 OID 17599)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3636 (class 2606 OID 17604)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3631 (class 2606 OID 17609)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2021-04-01 11:42:57 -03

--
-- PostgreSQL database dump complete
--

