#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER "${DTOCEAN_USER_NAME}" WITH PASSWORD '${DTOCEAN_PASSWORD}';
    CREATE DATABASE "${DTOCEAN_DB_NAME}" TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE "${DTOCEAN_DB_NAME}" TO "${DTOCEAN_USER_NAME}";
EOSQL
