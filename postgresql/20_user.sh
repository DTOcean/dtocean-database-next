#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER "${DTOCEAN_USER_NAME}" WITH PASSWORD '${DTOCEAN_PASSWORD}';
    CREATE DATABASE "${DTOCEAN_DB_EXAMPLES_NAME}" TEMPLATE template0;
    CREATE DATABASE "${DTOCEAN_DB_TEMPLATE_NAME}" TEMPLATE template0;
    COMMENT ON DATABASE "${DTOCEAN_DB_EXAMPLES_NAME}" IS '{"version": "${DTOCEAN_DB_VERSION}"}';
    COMMENT ON DATABASE "${DTOCEAN_DB_TEMPLATE_NAME}" IS '{"version": "${DTOCEAN_DB_VERSION}"}';
    GRANT ALL PRIVILEGES ON DATABASE "${DTOCEAN_DB_EXAMPLES_NAME}" TO "${DTOCEAN_USER_NAME}";
    GRANT ALL PRIVILEGES ON DATABASE "${DTOCEAN_DB_TEMPLATE_NAME}" TO "${DTOCEAN_USER_NAME}";
EOSQL
