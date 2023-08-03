-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- define which plugins to install
local plugins = {
    -- ========== appearance ==========
    -- [all] theme
    "navarasu/onedark.nvim",
    -- [all] highlight
    "nvim-treesitter/nvim-treesitter",
    -- [bottom] status
    "nvim-lualine/lualine.nvim",
    -- [top] buffer
    "akinsho/bufferline.nvim",
    -- [left] file tree
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    ---- [all] dashboard
    --{
    --    "goolord/alpha-nvim",
    --    lazy = true
    --},

    -- ========== language ==========
    -- [all] lsp
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- bridge mason.nvim and nvim-lspconfig
        "neovim/nvim-lspconfig"
    },
    -- [all] auto completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    -- [action] show current code context
    {
        "SmiteshP/nvim-navic", -- use lsp to show current code context
        dependencies = { "neovim/nvim-lspconfig" }
    },
    -- [action] comment
    "numToStr/Comment.nvim",
    -- [auto] pair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },

    -- ========== misc ==========
    -- [notation] git
    "lewis6991/gitsigns.nvim",
    -- [action] fuzzy finder
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.1',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    "nvim-telescope/telescope-project.nvim",
    -- [action] toggle terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
}

local opts = {}
require("lazy").setup(plugins, opts)
