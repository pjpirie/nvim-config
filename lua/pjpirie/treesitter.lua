local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  print "Treesitter Issue"
  return
end

configs.setup {
  ensure_installed = {"typescript", "javascript", "php", "c", "rust", "tsx"},
  auto_install = true,
  sync_install = false,
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlightin = true,
  },
  indent = { enable = true, disable = { 'yaml' } },
  rainbow = {
    enable = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
