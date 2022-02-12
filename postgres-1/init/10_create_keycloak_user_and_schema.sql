-- This command should be customized
-- We are going to run Keycloak using keycloak_user and keycloak_schema

CREATE ROLE keycloak_user WITH
    LOGIN
    PASSWORD 'keycloak_user_password'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    CONNECTION LIMIT -1;

CREATE SCHEMA IF NOT EXISTS keycloak_schema
    AUTHORIZATION keycloak_user;
