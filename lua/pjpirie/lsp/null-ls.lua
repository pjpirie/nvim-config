local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  print('Null-ls loading error.')
  return
end


--[[ local ts_ca_status_ok, ts_ca = pcall(require, "typescript.extensions.null-ls.code-actions") ]]
--[[ if not ts_ca_status_ok then ]]
--[[   print('Typescript Code Actions loading error.') ]]
--[[ 	return ]]
--[[ end ]]
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    require("typescript.extensions.null-ls.code-actions"),
    formatting.prettierd,
    formatting.eslint_d,
    diagnostics.eslint_d,
    code_actions.eslint_d,
    diagnostics.php,
  },
})
