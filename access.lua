local table_insert = table.insert
local req_set_uri_args = ngx.req.set_uri_args
local req_get_uri_args = ngx.req.get_uri_args
local req_set_header = ngx.req.set_header
local req_get_headers = ngx.req.get_headers
local req_read_body = ngx.req.read_body
local req_set_body_data = ngx.req.set_body_data
local req_get_body_data = ngx.req.get_body_data
local req_clear_header = ngx.req.clear_header
local req_set_method = ngx.req.set_method
local encode_args = ngx.encode_args
local ngx_decode_args = ngx.decode_args
local responses = require "kong.tools.responses"
local public_utils = require "kong.tools.public"
local utils = require "kong.tools.utils"
local singletons = require "kong.singletons"
local cache = require "kong.tools.database_cache"

local _M = {}

function load_kerker_for_public_key(kerker)
	local kerkers, err = singletons.dao.hello_woorld:find_by_keys({kerker = kerker}) -- Lookup in the datastore
	if err then
		return nil, err     -- errors must be returned, not dealt with here
	end
	if not kerkers then
		return nil          -- nothing was found
	end
	-- assuming the key was unique, we always only have 1 value...
	return kerkers[1] -- Return the credential (this will be also stored in-memory)
end

function addHeader(conf)
	ngx.log(ngx.ERR, "=====> ADDHEADER")

	ngx.req.read_body()

	local token, err = singletons.dao.hello_woorld:insert({
		public_key = 'keygen123'
	})

	for k, v in pairs(token) do
		ngx.log(ngx.ERR, k)
		ngx.log(ngx.ERR, v)
	end

	req_set_header("X-hello-insert-kerker", token.kerker)
	req_set_header("X-hello-insert-public_key", token.public_key)
	req_set_header("X-hello-insert-id", token.id)

	if token.kerker then
		to2, err = cache.get_or_set(hello_woorld:..token.kerker, nil,
								load_kerker_for_public_key, token.kerker)
	end

	req_set_header("X-hello-cache-kerker", to2.kerker)
	req_set_header("X-hello-cache-public_key", to2.public_key)
	req_set_header("X-hello-cache-id", to2.id)

	ngx.log(ngx.ERR, "<===== ADDHEADER")

	-- responses.send(200, token)
end

function _M.execute(conf)
	ngx.log(ngx.ERR, "=====> ACCESS")
	addHeader(conf)
	ngx.log(ngx.ERR, "<===== ACCESS")
end

return _M