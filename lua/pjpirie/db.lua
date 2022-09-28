local db = require("dashboard")
db.dashboard_default_executive = 'telescope'
db.custom_header = {
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
-- db.custom_center = {
--   { desc = 'some description here' }
-- }
db.custom_center = {
  -- { icon = '  ',
  --   desc = 'Recently latest session                  ',
  --   shortcut = 'SPC s l',
  --   action = 'SessionLoad' },
    { icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f' },

  { icon = '  ',
    desc = 'Web Repo                                ',
    action = 'e ~/Projects/Code/sbafs/Web',
    shortcut = 'SPC f w' },
{ icon = '  ',
    desc = 'B2C Repo                                ',
    action = 'e ~/Projects/Code/sbafs/afs-fpp-b2c-api',
    shortcut = 'SPC f c' },
{ icon = '  ',
    desc = 'B2B Repo                                ',
    action = 'e ~/Projects/Code/sbafs/afs-fpp-b2b-api',
    shortcut = 'SPC f b' },
{ icon = '  ',
    desc = 'Applications Controller Repo            ',
    action = 'e ~/Projects/Code/sbafs/afs-fpp-applications-controller-lib',
    shortcut = 'SPC f a' },


  { icon = '  ',
    desc = 'File Browser                            ',
    action = 'Telescope file_browser',
    shortcut = 'SPC f r' },
  { icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f l' },
  { icon = '  ',
    desc = 'Open Personal dotfiles                  ',
    action = 'Telescope file_browser path=~/.config',
    shortcut = 'SPC f d' },
}
