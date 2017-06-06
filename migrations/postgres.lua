return {
{
	name = "2015-07-31-172400_init_keyauth",
	up = [[
		CREATE TABLE IF NOT EXISTS hello_woorld(
		id uuid,
		consumer_id uuid REFERENCES consumers (id) ON DELETE CASCADE,
		key text UNIQUE,
		created_at timestamp without time zone default (CURRENT_TIMESTAMP(0) at time zone 'utc'),
		PRIMARY KEY (id)
		);

		DO $$
		BEGIN
		IF (SELECT to_regclass('public.keyauth_key_idx')) IS NULL THEN
			CREATE INDEX keyauth_key_idx ON hello_woorld(key);
		END IF;
		IF (SELECT to_regclass('public.keyauth_consumer_idx')) IS NULL THEN
			CREATE INDEX keyauth_consumer_idx ON hello_woorld(consumer_id);
		END IF;
		END$$;
	]],
	down = [[
		DROP TABLE hello_woorld;
	]]
	}
}