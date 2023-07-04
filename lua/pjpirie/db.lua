local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  print("Dashboard Error.")
  return
end

db.setup {
  config = {
    shortcut = {
      -- action can be a function type
      { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
    },
    packages = { enable = true }, -- show how many plugins neovim loaded
    -- limit how many projects list, action when you press key or enter it will run this action.
    -- action can be a functino type, e.g.
    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
    project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
    mru = { limit = 10, icon = 'your icon', label = '', },
    footer = {}, -- footer
  }
}

db.dashboard_default_executive = 'telescope'

local custom_header_store = {
  PIKA = {
    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],
  }
}

db.custom_header = custom_header_store.PIKA

--[[ db.custom_center = { ]]
--[[   { desc = 'some description here' } ]]
--[[ } ]]

db.custom_center = {
  {
    icon = '  ',
    desc = 'Deploy Script                           ',
    action = 'e ~/448/studio-pipeline-images/',
    shortcut = 'None   '
  },
  {
    icon = '  ',
    desc = 'Web Repo                                ',
    action = 'e ~/448/studio-forumm-client/source/',
    shortcut = 'None   '
  },
  {
    icon = '  ',
    desc = 'API Repo                                ',
    action = 'e ~/448/studio-forumm-api/source/',
    shortcut = 'None   '
  },
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'None   '
  },
  {
    icon = '  ',
    desc = 'File Browser                            ',
    action = 'Telescope file_browser',
    shortcut = 'None   '
  },
  {
    icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'None   '
  },
  {
    icon = '  ',
    desc = 'Open Personal dotfiles                  ',
    action = 'Telescope file_browser path=~/.config',
    shortcut = 'None   '
  },
}
