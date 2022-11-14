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

-- my config for window
local run_cmd = "./install.sh"
if vim.fn.has "win32" == 1 then
  run_cmd = "powershell ./install.ps1"
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
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  use "kyazdani42/nvim-web-devicons"
  use {
    "kyazdani42/nvim-tree.lua",
    -- commit = "f183c7f31197ae499c3420341fb8b275636a49b8",
  }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  -- use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim" -- status
  -- terminal toggle
  use {
    "akinsho/toggleterm.nvim",
    cmd = {
      "ToggleTerm",
      "ToggleTermToggleAll",
      "TermExec",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLine",
      "ToggleTermSendVisualSelection",
    },
  }
  -- Terminal manager for (neo)vim
  use {
    "voldikss/vim-floaterm",
    cmd = {
      "FloatermNew",
      "FloatermNext",
      "FloatermPrev",
      "FloatermFirst",
      "FloatermLast",
      "FloatermUpdate",
      "FloatermToggle",
      "FloatermHide",
      "FloatermKill",
      "FloatermSend",
    },
  }
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "unblevable/quick-scope"
  use "phaazon/hop.nvim"  -- any jump
  use "andymass/vim-matchup"
  use "nacro90/numb.nvim"
  use "monaqa/dial.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "windwp/nvim-spectre"
  use "folke/zen-mode.nvim"
  use "karb94/neoscroll.nvim"
  use "folke/todo-comments.nvim"
  use "kevinhwang91/nvim-bqf"
  use "ThePrimeagen/harpoon"
  use "MattesGroeger/vim-bookmarks"
  -- use "lunarvim/vim-solidity"
  use "tpope/vim-surround"
  -- use "ur4ltz/surround.nvim"
  use "tpope/vim-repeat"
  -- use "Shatur/neovim-session-manager"
  use "rcarriga/nvim-notify"
  use "tversteeg/registers.nvim"
  -- use "metakirby5/codi.vim"
  use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
  -- 状态栏组件，用于显示光所处的位置
  use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  -- 运行片段代码
  use { "michaelb/sniprun", run = "bash ./install.sh" }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    cmd = "MarkdownPreview",
  }
  use {
    "christianchiarulli/JABS.nvim",
    requires = { "kyazdani42/nvim-web-devicons" }, -- optional
  }
  use {
    "ghillb/cybu.nvim",
    branch = "v1.x", -- won't receive breaking  changes
    -- branch = "main", -- timely updates
    requires = { "kyazdani42/nvim-web-devicons" }, -- optional
  }
  use {
    "dhruvasagar/vim-table-mode",
    opt = true,
    cmd = "TableModeToggle",
    ft = { "markdown", "text" },
  }
  use {
    "dkarter/bullets.vim",
    opt = true,
    ft = { "markdown", "text", "gitcommit", "scratch" },
  } -- 对部分文件进行自动编号或重复插入 - or *

  use "machakann/vim-highlightedyank"

  -- Colorschemes
  -- use "folke/tokyonight.nvim"
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  -- use "rose-pine/neovim"
  -- use "rebelot/kanagawa.nvim"
  use "ajmwagar/vim-deus" -- my favorite colorsche
  -- use "theniceboy/nvim-deus"
  -- use "morhetz/gruvbox"

  -- cmp plugins
  use { -- The completion plugin
    "hrsh7th/nvim-cmp",
    -- commit = "d93104244c3834fbd8f3dd01da9729920e0b5fe7",
  }
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "rcarriga/cmp-dap"
  use {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignore_file_types = { -- default is not ignore
          -- uncomment to ignore in lua:
          -- lua = ture
        }
      }
    end,
    -- run = "./install.sh",
    run = run_cmd, -- different in window or linux
    -- after = "nvim-cmp", -- for window, linux don't need
    requires = "hrsh7th/nvim-cmp",
  }
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use "github/copilot.vim"
  use "RRethy/vim-illuminate"

  -- Java
  -- use "mfussenegger/nvim-jdtls"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "romgrk/nvim-treesitter-context"
  use "mizlan/iswap.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim" -- Git integration: signs, hunk actions, blame, etc.
  use "f-person/git-blame.nvim" -- Show git blame info
  use "ruifm/gitlinker.nvim" -- Generate shareable file permalinks for several git hosts.
  use "mattn/vim-gist"
  use "mattn/webapi-vim"
  use "rhysd/conflict-marker.vim"
  use {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "GEdit",
      "Gsplit",
      "Gdiffsplit",
      "Gread",
      "GWrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
    },
  } -- Git commands in nvim
  use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github

  -- DAP
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- Translating plugin for Vim/Neovim
  use { "lyb200/vim-translator" }
  -- use 'voldikss/vim-translator'

  -- A simple plugin for opening urls in browser
  use { "lyb200/vim-open-url" }

  -- ranger
  use { "kevinhwang91/rnvimr", cmd = { "RnvimrToggle", "RnvimrResize" } }
  -- use "lyokha/vim-xkbswitch"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
