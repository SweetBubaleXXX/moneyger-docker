#!/bin/bash

PGPASSWORD=$POSTGRES_PASSWORD psql -U "$POSTGRES_USER" \
  -v remote_node_name="$REMOTE_NODE_NAME" \
  -v remote_db_host="$REMOTE_DB_HOST" \
  -v remote_db_port="$REMOTE_DB_PORT" \
  -v db_name="$DB_NAME" \
  -v replication_user="$REPLICATION_USER" \
  -v replication_pass="$REPLICATION_PASS" \
  -v is_secondary_node="$IS_SECONDARY_NODE" \
  -f /setup-replication.sql
