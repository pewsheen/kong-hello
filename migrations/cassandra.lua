return {
{
	name = "2017-06-06-1234_init_hello",
	up =  [[
		CREATE TABLE IF NOT EXISTS hello_woorld(
		id uuid,
		asdf text,
		created_at timestamp,
		PRIMARY KEY (id)
		);

		CREATE INDEX IF NOT EXISTS ON hello_woorld(key);
		CREATE INDEX IF NOT EXISTS keyauth_consumer_id ON hello_woorld(consumer_id);
	]],
	down = [[
		DROP TABLE hello_woorld;
	]]
}
}