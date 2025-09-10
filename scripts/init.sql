CREATE USER :replication_user WITH PASSWORD :'replication_pass' SUPERUSER; 

CREATE EXTENSION IF NOT EXISTS pglogical;

GRANT USAGE ON SCHEMA pglogical TO :replication_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA pglogical TO :replication_user;

BEGIN;
SET LOCAL log_statement = 'none';
SET LOCAL log_min_duration_statement = -1;
SELECT pglogical.create_node(
    node_name := :'node_name',
    dsn := format(
        'host=%s port=%s dbname=%s user=%s password=%s',
        :'db_host', :'db_port', :'db_name', :'replication_user', :'replication_pass'
    )
);
COMMIT;
