docker-compose stop
docker container rm boavista_keycloak_database
docker container rm boavista_keycloak_server
docker volume rm open-banking-poc_keycloak-data
docker volume rm open-banking-poc_postgres-data

