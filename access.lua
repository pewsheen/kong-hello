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

local singletons = require "kong.singletons"

local _M = {}

local function retrieve_parameters()
	ngx.req.read_body()
	ngx.log(ngx.ERR, ngx.req.get_uri_args())
	ngx.log(ngx.ERR, public_utils.get_body_args())
	ngx.log(ngx.ERR, utils.table_merge(ngx.req.get_uri_args(), public_utils.get_body_args()))
	return utils.table_merge(ngx.req.get_uri_args(), public_utils.get_body_args())
end

function addHeader(conf)
	ngx.log(ngx.ERR, "=====> ADDHEADER")
	req_set_header("X-hello-header", "world!")

	local token, err = singletons.dao.hello_woorld:insert({
		public_key = 'keygen123'
	})

	retrieve_parameters()

	ngx.log(ngx.ERR, "<===== ADDHEADER")

	-- responses.send(200, token)
end

function _M.execute(conf)
	ngx.log(ngx.ERR, "=====> ACCESS")
	addHeader(conf)
	ngx.log(ngx.ERR, "<===== ACCESS")
end

return _M