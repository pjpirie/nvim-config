local carbon = require('carbon-now')
carbon.setup({
  open_cmd = "xdg-open",
  options = {
    theme = "gruvbox",
    window_theme = "none",
    font_family = "Hack",
    font_size = "20px",
    bg = "gray",
    line_numbers = true,
    line_height = "133%",
    drop_shadow = false,
    drop_shadow_offset_y = "20px",
    drop_shadow_blur = "68px",
    width = "680",
    watermark = false,
  },
})
--[[ require('silicon').setup { ]]
--[[   theme = 'gruvbox', ]]
--[[   font = 'Hack=20', ]]
--[[   background = '#87f', ]]
--[[   line_number = true, ]]
--[[   pad_vert = 80, ]]
--[[   pad_horiz = 50, ]]
--[[   output = { ]]
--[[     path = "~/code/Screenshots/" ]]
--[[   }, ]]
--[[   watermark = { ]]
--[[     text = ' @pjpirie', ]]
--[[   }, ]]
--[[ } ]]
