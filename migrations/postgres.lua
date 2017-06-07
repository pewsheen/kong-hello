return {
{
	name = "2015-07-31-172401_init_hello",
	up = [[
		CREATE TABLE IF NOT EXISTS hello_woorld(
		id uuid,
		public_key text,
		created_at timestamp without time zone default (CURRENT_TIMESTAMP(0) at time zone 'utc'),
		PRIMARY KEY (id)
		);

		DO $$
		BEGIN
		IF (SELECT to_regclass('public.keyauth_key_idx')) IS NULL THEN
			CREATE INDEX keyauth_key_idx ON hello_woorld(public_key);
		END IF;
		END$$;
	]],
	down = [[
		DROP TABLE hello_woorld;
	]]
	}
}