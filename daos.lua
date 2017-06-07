local SCHEMA = {
	primary_key = {"id"},
	table = "hello_woorld", -- the actual table in the database
	fields = {
		id = {type = "id", dao_insert_value = true}, -- a value to be inserted by the DAO itself (think of serial ID and the uniqueness of such required here)
		created_at = {type = "timestamp", immutable = true, dao_insert_value = true}, -- also interted by the DAO itself
		public_key = {type = "string", required = true, unique = false} -- a unique API key
	}
}

return {hello_woorld = SCHEMA}