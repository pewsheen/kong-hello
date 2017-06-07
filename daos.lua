local utils = require "kong.tools.utils"

local SCHEMA = {
	primary_key = {"id"},
	table = "hello_woorld", -- the actual table in the database
	fields = {
		id = {type = "id", dao_insert_value = true}, -- a value to be inserted by the DAO itself (think of serial ID and the uniqueness of such required here)
		created_at = {type = "timestamp", immutable = true, dao_insert_value = true}, -- also interted by the DAO itself
		public_key = {type = "string", required = true, unique = false}, -- a unique API key
		kerker = {type = "string", required = true, unique = false, default = utils.random_string}
	},
	marshall_event = function(self, t)
		return { id = t.id, public_key = t.public_key, kerker = t.kerker }
	end
}

return {hello_woorld = SCHEMA}