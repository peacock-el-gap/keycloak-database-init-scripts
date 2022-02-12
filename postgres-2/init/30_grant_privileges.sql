-- Here are minimal privileges that are necessary for keycloak_user
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA keycloak_schema
TO keycloak_user;

GRANT CREATE
ON SCHEMA keycloak_schema
TO keycloak_user;