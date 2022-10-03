local status_ok, configs = pcall(require, 'nvim-treesitter.config')
if not status_ok then
  return
end

configs.setup {
  ensure_installed = 'all',
  auto_install = true,
  sync_install = false,
  ignore_install = { '' },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { '' },
    additional_vim_regex_highlightin = true,
  },
  indent = { enable = true, disable = { 'yaml' } },
  rainbow = {
    enable = true,
    disable = { '' },
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
