local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(
    {
        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
            },
        },
        "folke/which-key.nvim",
        { "folke/neoconf.nvim", cmd = "Neoconf" },
        "folke/neodev.nvim",
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "nvim-neotest/neotest-python"
            }
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "neovim/nvim-lspconfig",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "onsails/lspkind-nvim",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-cmdline",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            }
        },
        {
            'stevearc/oil.nvim',
            opts = {},
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
            'altermo/ultimate-autopair.nvim',
            event = { 'InsertEnter', 'CmdlineEnter' },
            branch = 'v0.6',
            opts = {
            },
        },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
            end,
        },
        "Vigemus/iron.nvim",
        "rafamadriz/friendly-snippets",
        "chentoast/marks.nvim",
        { 'rose-pine/neovim',   name = 'rose-pine' },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
            },
            dependencies = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            }
        },
        "neovim/nvim-lspconfig",
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        {
            'stevearc/aerial.nvim',
            opts = {},
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons"
            },
        },
        "sindrets/diffview.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "zbirenbaum/copilot.lua",
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "sindrets/diffview.nvim",
                "nvim-telescope/telescope.nvim",
            },
            config = true
        },
        { 'echasnovski/mini.nvim',                       version = false },
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        { "nvim-treesitter/nvim-treesitter-context",     dependencies = { "nvim-treesitter/nvim-treesitter" } },
        { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
        { "RRethy/nvim-treesitter-textsubjects",         dependencies = { "nvim-treesitter/nvim-treesitter" } },
        {
            "folke/flash.nvim",
            event = "VeryLazy",
            opts = {},
        },
        "mbbill/undotree",
        {
            'stevearc/overseer.nvim',
            opts = {},
        },
        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end
        },
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {
            }
        },
        "lewis6991/gitsigns.nvim",
        {
            'Bekaboo/dropbar.nvim',
            dependencies = {
                'nvim-telescope/telescope-fzf-native.nvim'
            }
        },
        "aznhe21/actions-preview.nvim",
        "mfussenegger/nvim-dap",
        {
            "ray-x/lsp_signature.nvim",
            event = "VeryLazy",
            opts = {},
            config = function(_, opts) require 'lsp_signature'.setup(opts) end
        },
        {
            "ruifm/gitlinker.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },

        },
        "ahmedkhalf/project.nvim",
    }
)

require('defaults')
