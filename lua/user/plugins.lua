-- Automatically install Lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  ui = {
    border = "rounded",
  },
}

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
  { "folke/lazy.nvim", tag = "stable" },
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Modern Swiss Army Knife (Dashboard, Notifier, Input, Picker, Scroll, Words, Lazygit)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require "user.snacks"
    end,
  },

  -- Colorschemes (Kanagawa loaded first; others lazy-loaded)
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "user.colorscheme"
    end,
  },
  { "folke/tokyonight.nvim", lazy = true },
  { "lunarvim/darkplus.nvim", lazy = true },
  {
    "svrana/NeoSolarized.nvim",
    lazy = true,
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  { "navarasu/onedark.nvim", lazy = true },
  { "neanias/everforest-nvim", lazy = true },

  -- UI & Layout
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
    config = function()
      require "user.nvim-webdev-icons"
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.bufferline"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require "user.lualine"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require "user.toggleterm"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require "user.project"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.indentline"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "user.whichkey"
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require "user.zen-mode"
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = function()
      require "user.numb"
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },

  -- File Explorers
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    config = function()
      local nvim_tree_config = require "user.nvim-tree"
      require("nvim-tree").setup(nvim_tree_config)
    end,
  },
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory in floating Oil" },
    },
    config = function()
      require "user.oil"
    end,
  },

  -- Color & Utility
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.colorizer"
    end,
  },
  {
    "roobert/search-replace.nvim",
    event = "VeryLazy",
    config = function()
      require "user.search-replace"
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require "user.auto-session"
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require "user.surround"
    end,
  },
  {
    "rest-nvim/rest.nvim",
    tag = "v1.2.1",
    cmd = { "RestNvim", "RestNvimPreview", "RestNvimLast" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "user.rest"
    end,
  },

  -- Modern Completion (saghen/blink.cmp)
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require "user.blink"
    end,
  },

  -- LSP & Formatting
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "user.lsp"
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo", "Format" },
    config = function()
      require "user.conform"
    end,
  },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    event = "LspAttach",
    opts = {},
    lazy = true,
  },
  { "lvimuser/lsp-inlayhints.nvim", lazy = true },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    config = function()
      require "user.navic"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {},
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require "user.telescope"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = vim.fn.has("win32") == 1
        and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -G Ninja && cmake --build build --config Release"
      or "make",
    lazy = true,
    enabled = vim.fn.executable("cmake") == 1 or vim.fn.executable("make") == 1,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.treesitter"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.nvim-ts-autotag"
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "user.autopairs"
    end,
  },

  -- Git & Comments
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.comment"
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.gitsigns"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.todo-comments"
    end,
  },

  -- Editing Support & Motions
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", mode = { "n", "v" } },
      { "<C-x>", mode = { "n", "v" } },
    },
    config = function()
      require "user.dial"
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require "user.flash"
    end,
  },

  -- Code Runner & Languages
  {
    "is0n/jaq-nvim",
    cmd = { "Jaq" },
    config = function()
      require "user.jaq"
    end,
  },
  {
    "cdelledonne/vim-cmake",
    cmd = {
      "CMakeGenerate",
      "CMakeClean",
      "CMakeBuild",
      "CMakeInstall",
      "CMakeRun",
      "CMakeSelectBuildType",
      "CMakeSelectTarget",
      "CMakeOpen",
    },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust", "rs" },
    config = function()
      require "user.rust-tools"
    end,
  },
  {
    "xeluxee/competitest.nvim",
    cmd = { "CompetiTest" },
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require "user.competitest"
    end,
  },

  -- OpenCode (AI Coding Agent / Vibe Coding)
  {
    "nickjvandyke/opencode.nvim",
    event = "VeryLazy",
    config = function()
      require "user.opencode"
    end,
  },
}, opts)
