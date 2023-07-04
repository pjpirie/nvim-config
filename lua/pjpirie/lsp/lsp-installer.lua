local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.setup(
  {
    automatic_installation = true,     -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  }
)
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  --[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) ]]
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

lspconfig.lua_ls.setup { on_attach = on_attach }
lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.jsonls.setup { on_attach = on_attach }
lspconfig.pyright.setup { on_attach = on_attach }

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
--[[ lsp_installer.on_server_ready(function(server) ]]
--[[ 	local opts = { ]]
--[[ 		on_attach = require("pjpirie.lsp.handlers").on_attach, ]]
--[[ 		capabilities = require("pjpirie.lsp.handlers").capabilities, ]]
--[[ 	} ]]
--[[]]
--[[ 	 if server.name == "jsonls" then ]]
--[[ 	 	local jsonls_opts = require("pjpirie.lsp.settings.jsonls") ]]
--[[ 	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts) ]]
--[[ 	 end ]]
--[[]]
--[[ 	 if server.name == "lua_ls" then ]]
--[[ 	 	local sumneko_opts = require("pjpirie.lsp.settings.sumneko_lua") ]]
--[[ 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts) ]]
--[[ 	 end ]]
--[[]]
--[[ 	 if server.name == "pyright" then ]]
--[[ 	 	local pyright_opts = require("pjpirie.lsp.settings.pyright") ]]
--[[ 	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts) ]]
--[[ 	 end ]]
--[[]]
--[[ 	-- This setup() function is exactly the same as lspconfig's setup function. ]]
--[[ 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md ]]
--[[ 	server:setup(opts) ]]
--[[ end) ]]
