echo "========================================================================="
echo "PHASE 1 - start"
echo "========================================================================="

docker-compose -f ./postgres-1/docker-compose.yaml up -d
docker-compose -f ./keycloak-1/docker-compose.yaml up

echo "........................................................................."
echo ""
ls -la ./postgres-2/init/20_keycloak_15.0.2.sql
echo ""
echo "........................................................................."

docker-compose -f ./keycloak-1/docker-compose.yaml down
export POSTGRES_VOLUME_TO_BE_REMOVED=$(docker inspect \
  -f '{{range .Mounts }}{{- if eq .Type "volume" }}{{- .Name -}}{{end}} {{- end -}}' \
  postgres-1-postgres-1 \
)
docker-compose -f ./postgres-1/docker-compose.yaml down
docker volume rm $POSTGRES_VOLUME_TO_BE_REMOVED
echo "========================================================================="
echo "PHASE 1 - stop"
echo "========================================================================="

echo ""
echo ""

echo "========================================================================="
echo "PHASE 2 - start"
echo "========================================================================="

docker-compose -f ./postgres-2/docker-compose.yaml up -d
docker-compose -f ./keycloak-2/docker-compose.yaml up -d

echo "................................"
echo "PHASE 2 - Keycloak is running"
echo "................................"
echo ""
echo "Try: http://localhost:8080"
echo ""
echo "========================================================================="
echo "PHASE 2 - stop"
echo "========================================================================="

