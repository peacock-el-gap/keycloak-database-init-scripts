# Run Keycloak with database initialised using SQL scripts

## Overview
1) Phase 1 - generate SQL scripts
   1) Start PostgreSQL (user & schema for keycloak initialized, but no tables)
   2) Start Keycloak (from image configured to generate SQL scripts)
   3) Stop Keycloak
   4) Stop PostgreSQL
   5) Remove docker volume used by PostgreSQL (to ensure, that we will initialise database using SQL scripts on empty database)
2) Phase 2 - initialise database and run Keycloak
   1) Start PostgreSQL (user, schema & tables for keycloak initialized)
   2) Start Keycloak (no special configuration, from original Keycloak image)
   3) Done :-), we can use Keycloak
   4) Stop Keycloak
   5) Stop PostgreSQL
3) We can rerun Phase 2 - Keycloak will run using still the same database
<hr/>

## Phase 1
### Start PostgreSQL (Phase 1)
```shell
# This script has to be executed in project root
docker-compose -f ./postgres-1/docker-compose.yaml up -d
```
### Start Keycloak (Phase 1) - to generate SQL scripts
```shell
# This script has to be executed in project root
docker-compose -f ./keycloak-1/docker-compose.yaml up
```
This will generate file `20_keycloak_15.0.2.sql` and place it in [/postgres-2/init](./postgres-2/init) directory.

Note, that this file is already there - this step is executed only to show how to generate this SQL script.

Check if file has been really generated:
```shell
# This script has to be executed in project root
ls -la ./postgres-2/init/20_keycloak_15.0.2.sql
```
Note file date!


Reference:
* https://www.keycloak.org/docs/latest/server_installation/#database-configuration
* https://keycloak.discourse.group/t/keycloak-database-creation-keycloak-database-update-sql/5543/2

### Stop Keycloak (Phase 1)
```shell
# This script has to be executed in project root
docker-compose -f ./keycloak-1/docker-compose.yaml down
```

### Stop PostgreSQL (Phase 1)

Get id of docker volume used by PostgreSQL
```shell
export POSTGRES_VOLUME_TO_BE_REMOVED=$(docker inspect \
  -f '{{range .Mounts }}{{- if eq .Type "volume" }}{{- .Name -}}{{end}} {{- end -}}' \
  postgres-1-postgres-1 \
)
```
Then stop PostgreSQL
```shell
# This script has to be executed in project root
docker-compose -f ./postgres-1/docker-compose.yaml down
```

### Remove PostgreSQL docker volume (Phase 1)
```shell
docker volume rm $POSTGRES_VOLUME_TO_BE_REMOVED
```
<hr/>

## Phase 2

### Start PostgreSQL (Phase 2)
```shell
# This script has to be executed in project root
docker-compose -f ./postgres-2/docker-compose.yaml up -d
```

### Start Keycloak (Phase 2) - should run with already configured database
```shell
# This script has to be executed in project root
docker-compose -f ./keycloak-2/docker-compose.yaml up -d
```

### Use Keycloak :-) (Phase 2)
http://localhost:8080

:-)

### Stop Keycloak (Phase 2)
```shell
# This script has to be executed in project root
docker-compose -f ./keycloak-2/docker-compose.yaml down
```

### Stop PostgreSQL (Phase 2)
```shell
# This script has to be executed in project root
docker-compose -f ./postgres-2/docker-compose.yaml down
```
<hr/>
<hr style="border: double"/>
