local home = os.getenv 'HOME'
local system_name
if vim.fn.has 'mac' == 1 then
    system_name = 'macOS'
elseif vim.fn.has 'unix' == 1 then
    system_name = 'Linux'
end
local sumneko_root_path = home .. '/code/lua/lua-language-server'
local sumneko_binary = sumneko_root_path
    .. '/bin/'
    .. system_name
    .. '/lua-language-server'
local lua_cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' }
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

return {
  cmd = lua_cmd,
	settings = {
		Lua = {
      runtime = {
        version = 'LuaJit',
        path = runtime_path,
      },
			diagnostics = {
				globals = { "vim" },
			},
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
				-- library = {
				-- 	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				-- 	[vim.fn.stdpath("config") .. "/lua"] = true,
				-- },
			},
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      completion = {
        keywordSnippet = "Disable"
      },
		},
	},
}
