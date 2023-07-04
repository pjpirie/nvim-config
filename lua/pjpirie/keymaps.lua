local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opts)
keymap("n", "<leader>k",
  "<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_dropdown({ previewer = true }))<cr>"
  ,
  opts)
keymap("n", "<leader>tw",
  "<cmd>lua require('neotest').run.run({ jestCommand = 'yarn test --watch'})<cr>", opts)
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({enter = false, short = true})<cr>", opts)
keymap("n", "<leader>tr", "<cmd>lua require('neotest').run.run({ jestCommand = 'yarn test'})<cr>", opts)
keymap("n", "<leader>t<leader>", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap('n', '<S-q>', ':Bdelete!<CR>', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader>p",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<leader>P",
  "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "gd",
  "<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
  ,
  opts)
keymap("n", "gr",
  "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown({ previewer = true }))<cr>"
  ,
  opts)
keymap("n", "<leader>0",
  "<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap('n', '<c-f>', ':lua require("telescope").extensions.lines.lines()<CR>', opts)

keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

keymap('n', '<leader>`', ':ToggleTerm<CR>', opts)
keymap('n', '<leader>f', ':Format<CR>', opts)
keymap('n', '<leader>b', ':lua package.loaded.gitsigns.blame_line()<CR>', opts)
keymap('n', '<leader>do', ':lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '<leader>d[', ':lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<leader>d]', ':lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>dd', ':Telescope diagnostics<CR>', opts)

keymap('n', '<leader><S>tf', ':lua require"jester".run_file()<CR>', opts)
keymap("v", "<leader>gh", ":DiffCommitLine<CR>", opts)


keymap("n", "<leader>ns", ":lua require('package-info').show()<cr>", opts)
keymap("n", "<leader>sv", ":source ~/.config/nvim/init.lua <cr>", opts)
keymap("n", "<leader>s", ":CodeActionMenu<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)

-- keymap("n", "<leader><leader>r", ]]
--   [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], opts)

-- place this in one of your configuration file(s)
--[[ keymap('n', 'f', ]]
--[[   ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirectifn.AFTER_CURSOR, current_line_only = false })<cr>" ]]
--[[   , {}) ]]
--[[ keymap('n', 'F', ]]
--[[   ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>" ]]
--[[   , {}) ]]
--[[ keymap('n', 't', ]]
--[[   ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>" ]]
--[[   , {}) ]]
--[[ keymap('n', 'T', ]]
--[[   ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false , hint_offset = 1 })<cr>" ]]
--[[   , {}) ]]
