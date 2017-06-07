return {
{
	name = "2017-06-06-172401_init_hello",
	up =  [[
		CREATE TABLE IF NOT EXISTS hello_woorld(
		id uuid,
		public_key text,
		kerker text,
		created_at timestamp,
		PRIMARY KEY (id)
		);

		CREATE INDEX IF NOT EXISTS ON hello_woorld(public_key);
		CREATE INDEX IF NOT EXISTS ON hello_woorld(kerker);
	]],
	down = [[
		DROP TABLE hello_woorld;
	]]
}
}