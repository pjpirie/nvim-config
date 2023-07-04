local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print(_)
	return
end

require("pjpirie.lsp.lsp-installer")
require("pjpirie.lsp.handlers").setup()
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
})

local navic = require("nvim-navic")
_.clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
