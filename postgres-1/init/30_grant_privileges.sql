-- Here are minimal privileges that are necessary for keycloak_user
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA keycloak_schema
TO keycloak_user;

-- This user is granted CREATE privilege - only for Phase 1
GRANT CREATE
ON SCHEMA keycloak_schema
TO keycloak_user;