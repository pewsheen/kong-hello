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

local _M = {}

function addHeader(conf)
	ngx.log(ngx.ERR, "=====> ADDHEADER")
	req_set_header("X-hello-header", "world!")
	ngx.log(ngx.ERR, "<===== ADDHEADER")
end

function _M.execute(conf)
	ngx.log(ngx.ERR, "=====> ACCESS")
	addHeader(conf)
	ngx.log(ngx.ERR, "<===== ACCESS")
end

return _M