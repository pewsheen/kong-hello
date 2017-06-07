return {
{
	name = "2017-06-06-172401_init_hello",
	up =  [[
		CREATE TABLE IF NOT EXISTS hello_woorld(
		id uuid,
		public_key text,
		created_at timestamp,
		PRIMARY KEY (id)
		);

		CREATE INDEX IF NOT EXISTS ON hello_woorld(public_key);
	]],
	down = [[
		DROP TABLE hello_woorld;
	]]
}
}