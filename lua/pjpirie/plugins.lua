print 'Plugins Loaded'
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return require('packer').startup({
  function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs"  -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim"  -- Autopairs, integrates with both cmp and treesitter
    use "preservim/tagbar"
    use 'glepnir/dashboard-nvim'
    use 'rcarriga/nvim-notify';
    use 'onsails/lspkind.nvim';
    use {
      'weilbith/nvim-code-action-menu',
    }

    -- Colorschemes
    use 'folke/lsp-colors.nvim'
    use "gruvbox-community/gruvbox"
    --[[ use { 'krivahtoo/silicon.nvim', run = './install.sh build' } ]]
    use 'ellisonleao/carbon-now.nvim'
    -- cmp plugins
    use "hrsh7th/nvim-cmp"         -- The completion plugin
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use { "zbirenbaum/copilot.lua" }
    --[[ use { ]]
    --[[   "zbirenbaum/copilot-cmp", ]]
    --[[   requires = { "copilot.lua" }, ]]
    --[[   config = function() ]]
    --[[     require("copilot_cmp").setup { ]]
    --[[       method = "getCompletionsCycling", ]]
    --[[     } ]]
    --[[   end ]]
    --[[ } ]]
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use "moll/vim-bbye"
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "akinsho/toggleterm.nvim"
    use "jose-elias-alvarez/typescript.nvim"
    --[[ use { ]]
    --[[   'kkoomen/vim-doge', ]]
    --[[   run = ':call doge#install()' ]]
    --[[ } ]]
    -- use 'SirVer/ultisnips'
    use 'mlaursen/vim-react-snippets'

    -- snippets
    use({
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      tag = "v<CurrentMajor>.*",
      -- install jsregexp (optional!:).
      run = "make install_jsregexp"
    })
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"           -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          mode = "workspace_diagnostics"
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'
    use "LinArcX/telescope-env.nvim"
    use "tpope/vim-fugitive"
    use 'BurntSushi/ripgrep'
    use "smartpde/telescope-recent-files"
    use({
      "neanias/telescope-lines.nvim",
      requires = "nvim-telescope/telescope.nvim",
    })
    use({
      "aaronhallaert/advanced-git-search.nvim",
      config = function()
        require("telescope").load_extension("advanced_git_search")
      end,
      requires = {
        "nvim-telescope/telescope.nvim",
        -- to show diff splits and open commits in browser
        "tpope/vim-fugitive",
      },
    })

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }
    use 'p00f/nvim-ts-rainbow'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    }

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Testing
    --[[ use 'David-Kunz/jester' ]]
    -- PackageJSON
    use({
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
    })
    --[[ use { 'stevearc/dressing.nvim' } ]]
    use({
      'CosmicNvim/cosmic-ui',
      requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
      config = function()
        require('cosmic-ui').setup()
      end,
    })

    --[[ use({ ]]
    --[[   "gbprod/phpactor.nvim", ]]
    --[[   run = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin ]]
    --[[   requires = { ]]
    --[[     "nvim-lua/plenary.nvim", -- required to update phpactor ]]
    --[[     "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur ]]
    --[[   }, ]]
    --[[   config = function() ]]
    --[[     require("phpactor").setup({ ]]
    --[[       -- your configuration comes here ]]
    --[[       -- or leave it empty to use the default settings ]]
    --[[       -- refer to the configuration section below ]]
    --[[     }) ]]
    --[[   end ]]
    --[[ }) ]]
    -- Montion
    use 'ggandor/lightspeed.nvim'
    --[[ use { ]]
    --[[   'phaazon/hop.nvim', ]]
    --[[   branch = 'v2', -- optional but strongly recommended ]]
    --[[   config = function() ]]
    --[[     -- you can configure Hop the way you like here; see :h hop-config ]]
    --[[     require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' } ]]
    --[[   end ]]
    --[[ } ]]
    --[[ use { ]]
    --[[   'vimwiki/vimwiki', ]]
    --[[   config = function() ]]
    --[[     vim.g.vimwiki_list = { ]]
    --[[       { ]]
    --[[         path   = '~/notes/', ]]
    --[[         syntax = 'markdown', ]]
    --[[         ext    = '.md', ]]
    --[[       } ]]
    --[[     } ]]
    --[[     vim.g.vimwiki_ext2syntax = { ]]
    --[[       ['.md'] = 'markdown', ]]
    --[[       ['.markdown'] = 'markdown', ]]
    --[[       ['.mdown'] = 'markdown', ]]
    --[[     } ]]
    --[[   end ]]
    --[[ } ]]
    -- Hover
    use {
      "lewis6991/hover.nvim",
      config = function()
        require("hover").setup {
          init = function()
            -- Require providers
            require("hover.providers.lsp")
            require('hover.providers.gh')
            -- require('hover.providers.jira')
            -- require('hover.providers.man')
            -- require('hover.providers.dictionary')
          end,
          preview_opts = {
            border = nil
          },
          -- Whether the contents of a currently open hoindow should be moved
          -- to a :h preview-window when pressing the hover keymap.
          preview_window = false,
          title = true
        }

        -- Setup keymaps
        vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
        vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
      end
    }
    use 'antoinemadec/FixCursorHold.nvim'
    use {
      'kosayoda/nvim-lightbulb',
      requires = 'antoinemadec/FixCursorHold.nvim',
    }
    --[[ use({ ]]
    --[[   'ray-x/navigator.lua', ]]
    --[[   requires = { ]]
    --[[     { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }, ]]
    --[[     { 'neovim/nvim-lspconfig' }, ]]
    --[[   }, ]]
    --[[ }) ]]
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        'haydenmeade/neotest-jest',
        "antoinemadec/FixCursorHold.nvim",
        'mfussenegger/nvim-dap'
      }
    }
    --[[ use { ]]
    --[[   'glepnir/dashboard-nvim', ]]
    --[[   event = 'VimEnter', requires = { 'nvim-tree/nvim-web-devicons' } ]]
    --[[ } ]]
    --[[ use { "jackMort/ChatGPT.nvim", ]]
    --[[   requires = { ]]
    --[[     "MunifTanjim/nui.nvim", ]]
    --[[     "nvim-lua/plenary.nvim", ]]
    --[[     "nvim-telescope/telescope.nvim" ]]
    --[[   }, ]]
    --[[ } ]]
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua'
  }
})
