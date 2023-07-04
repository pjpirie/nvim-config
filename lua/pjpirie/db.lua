local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  print("Dashboard Error.")
  return
end

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
    [[                                   ]],
    [[                                   ]],
  }
}


db.setup({
  theme = 'hyper',
  config = {

    header = custom_header_store.PIKA,
    shortcut = {
      { desc = '󰊳 Update ', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files ',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = ' ',
        desc = 'Web Repo ',
        action = 'e ~/448/studio-forumm-client/source/',
        key = 'c'
      },
      {
        icon = ' ',
        desc = 'API Repo ',
        action = 'e ~/448/studio-forumm-api/',
        key = 'a'
      },
    },
  },
})


db.custom_center = {
  {
    icon = '  ',
    desc = 'Web Repo                                ',
    action = 'e ~/448/studio-forumm-client/source/',
    key = 'c'
  },
  {
    icon = '  ',
    desc = 'API Repo                                ',
    action = 'e ~/448/studio-forumm-api/',
    key = 'a'
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
