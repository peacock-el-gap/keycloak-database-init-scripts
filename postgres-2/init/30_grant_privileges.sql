-- Here are minimal privileges that are necessary for keycloak_user
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA keycloak_schema
TO keycloak_user;

-- Note, that this user is not granted CREATE privilege