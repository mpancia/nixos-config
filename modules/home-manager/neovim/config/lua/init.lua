require("defaults")
require("remaps")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')
-- require("lazy").setup(
--     {
--         {
--             "folke/trouble.nvim",
--             dependencies = { "nvim-tree/nvim-web-devicons" },
--             config = function() require("plugins.trouble") end,
--         },
--         {
--             "folke/neoconf.nvim",
--             cmd = "Neoconf",
--             config = function()
--                 require("plugins.neoconf")
--             end
--         },
--         "folke/neodev.nvim",

--         {
--             "hrsh7th/nvim-cmp",
--             dependencies = {
--                 "neovim/nvim-lspconfig",
--                 "hrsh7th/cmp-nvim-lsp",
--                 "hrsh7th/cmp-nvim-lua",
--                 "onsails/lspkind-nvim",
--                 "hrsh7th/cmp-buffer",
--                 "hrsh7th/cmp-path",
--                 "saadparwaiz1/cmp_luasnip",
--                 "hrsh7th/cmp-cmdline",
--                 "L3MON4D3/LuaSnip",
--                 "saadparwaiz1/cmp_luasnip",
--             },
--             config = function() require("plugins.cmp") end,
--         },
--         {
--             "stevearc/oil.nvim",
--             opts = {},
--             dependencies = { "nvim-tree/nvim-web-devicons" },
--             config = function() require("plugins.oil") end,
--         },
--         {
--             "altermo/ultimate-autopair.nvim",
--             event = { "InsertEnter", "CmdlineEnter" },
--             branch = "v0.6",
--             opts = {
--             },
--         },
--         {
--             "nvim-tree/nvim-tree.lua",
--             version = "*",
--             lazy = false,
--             dependencies = {
--                 "nvim-tree/nvim-web-devicons",
--             },
--             config = function()
--                 require("nvim-tree").setup {}
--             end,
--         },
--         {
--             "Vigemus/iron.nvim",
--             config = function() require("plugins.iron") end,
--         },
--         "rafamadriz/friendly-snippets",
--         {
--             "chentoast/marks.nvim",
--             config = function() require("plugins.marks") end,
--         },
--         {
--             "rose-pine/neovim",
--             name = "rose-pine",
--             lazy = false,
--             priority = 1000,
--             config = function()
--                 vim.cmd([[colorscheme rose-pine]])
--             end,
--         },
--         {
--             "folke/noice.nvim",
--             event = "VeryLazy",
--             opts = {
--             },
--             dependencies = {
--                 "MunifTanjim/nui.nvim",
--                 "rcarriga/nvim-notify",
--             },
--             config = function() require("plugins.noice") end,
--         },
--         {
--             "neovim/nvim-lspconfig",
--             config = function() require("plugins.lspconfig") end
--         },
--         {
--             "nvim-lualine/lualine.nvim",
--             dependencies = { "nvim-tree/nvim-web-devicons" },
--             config = function() require("plugins.lualine") end,
--         },
--         {
--             "stevearc/aerial.nvim",
--             opts = {},
--             dependencies = {
--                 "nvim-treesitter/nvim-treesitter",
--                 "nvim-tree/nvim-web-devicons"
--             },
--             config = function() require("plugins.aerial") end,
--         },
--         {
--             "sindrets/diffview.nvim",
--             config = function() require("plugins.diffview") end,
--         },
--         "antoinemadec/FixCursorHold.nvim",
--         "zbirenbaum/copilot.lua",
--         {
--             "NeogitOrg/neogit",
--             dependencies = {
--                 "nvim-lua/plenary.nvim",
--                 "sindrets/diffview.nvim",
--                 "nvim-telescope/telescope.nvim",
--             },
--             config = true
--         },
--         { "echasnovski/mini.nvim",                       version = false },
--         {
--             "ThePrimeagen/harpoon",
--             branch = "harpoon2",
--             dependencies = { "nvim-lua/plenary.nvim" },
--             config = function() require("plugins.harpoon") end,
--         },
--         { "nvim-treesitter/nvim-treesitter-context",     dependencies = { "nvim-treesitter/nvim-treesitter" } },
--         { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
--         { "RRethy/nvim-treesitter-textsubjects",         dependencies = { "nvim-treesitter/nvim-treesitter" } },
--         {
--             "folke/flash.nvim",
--             event = "VeryLazy",
--             cofnig = function() require("plugins.flash") end,
--         },
--         {
--             "mbbill/undotree",
--             config = function() require("plugins.undotree") end
--         },
--         {
--             "stevearc/overseer.nvim",
--             config = function() require("plugins.overseer") end,
--         },
--         {
--             "zbirenbaum/copilot-cmp",
--             config = function()
--                 require("copilot_cmp").setup()
--             end
--         },
--         {
--             "lukas-reineke/indent-blankline.nvim",
--             main = "ibl",
--             opts = {},
--             config = function() require("plugins.indent") end
--         },
--         {
--             "folke/todo-comments.nvim",
--             dependencies = { "nvim-lua/plenary.nvim" },
--             config = function() require("plugins.todocomments") end
--         },
--         "lewis6991/gitsigns.nvim",
--         {
--             "Bekaboo/dropbar.nvim",
--             dependencies = {
--                 "nvim-telescope/telescope-fzf-native.nvim"
--             },
--             config = function() require("plugins.dropbar") end,
--         },
--         {
--             "aznhe21/actions-preview.nvim",
--             config = function() require("plugins.actions-preview") end,
--         },
--         {
--             "mfussenegger/nvim-dap",
--             dependencies = { "mfussenegger/nvim-dap-python" },
--             config = function() require("plugins.dap") end,
--         },
--         {
--             "ray-x/lsp_signature.nvim",
--             event = "VeryLazy",
--             opts = {},
--             config = function() require("plugins.lsp_signature") end
--         },
--         {
--             "ruifm/gitlinker.nvim",
--             dependencies = { "nvim-lua/plenary.nvim" },
--             config = function() require("plugins.gitlinker") end
--
--         },
--         {
--             "ahmedkhalf/project.nvim",
--             config = function() require("plugins.project") end
--         },
--     }
-- )
