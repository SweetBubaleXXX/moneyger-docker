BEGIN;
SET LOCAL log_statement = 'none';
SET LOCAL log_min_duration_statement = -1;
SELECT pglogical.create_subscription(
         subscription_name := :'remote_node_name',
         provider_dsn := format(
            'host=%s port=%s dbname=%s user=%s password=%s',
            :'remote_db_host', :'remote_db_port', :'db_name', :'replication_user', :'replication_pass'
         ),
         replication_sets := ARRAY['default'],
         forward_origins := '{}',
         synchronize_data := :'is_secondary_node'::boolean
         );
COMMIT;

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);
