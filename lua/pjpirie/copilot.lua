--[[ vim.g.copilot_filetypes = { xml = false } ]]
--[[ vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

local copilot_status_ok, copilot = pcall(require, "copilot")
  print("Loading Copilot")
if not copilot_status_ok then
  print("Copilot failed to load")
  return
end

copilot.setup({
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})

--[[ local copilot_cmp_status_ok, copilot_cmp = pcall(require, "copilot_cmp") ]]
--[[   print("Loading CopilotCMP") ]]
--[[ if not copilot_cmp_status_ok then ]]
--[[   print("CopilotCMP failed to load") ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ copilot_cmp.setup({ ]]
--[[   method = "getCompletionsCycling", ]]
--[[   formatters = { ]]
--[[     label = require("copilot_cmp.format").format_label_text, ]]
--[[     insert_text = require("copilot_cmp.format").format_insert_text, ]]
--[[     preview = require("copilot_cmp.format").deindent, ]]
--[[   }, ]]
--[[ }) ]]
