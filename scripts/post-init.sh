#!/bin/bash

PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER \
  -v node_name="$NODE_NAME" \
  -v db_host="$DB_HOST" \
  -v db_port="$DB_PORT" \
  -v db_name="$DB_NAME" \
  -v replication_user="$REPLICATION_USER" \
  -v replication_pass="$REPLICATION_PASS" \
  -f /init.sql
