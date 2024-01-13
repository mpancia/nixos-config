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
--         "antoinemadec/FixCursorHold.nvim",
--             config = true
--         },
--         { "echasnovski/mini.nvim",                       version = false },

--         { "nvim-treesitter/nvim-treesitter-context",     dependencies = { "nvim-treesitter/nvim-treesitter" } },
--         { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
--         { "RRethy/nvim-treesitter-textsubjects",         dependencies = { "nvim-treesitter/nvim-treesitter" } },
--         {
--             "folke/flash.nvim",
--             event = "VeryLazy",
--             cofnig = function() require("plugins.flash") end,
--         },
--         {
--             "stevearc/overseer.nvim",
--             config = function() require("plugins.overseer") end,
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
--             config = function() require("plugins.dropbar") end,
--         },
--         {
--             "aznhe21/actions-preview.nvim",
--             config = function() require("plugins.actions-preview") end,
--         },
--         {
--             "ray-x/lsp_signature.nvim",
--             event = "VeryLazy",
--             opts = {},
--             config = function() require("plugins.lsp_signature") end
--         },
--         {
--             "ahmedkhalf/project.nvim",
--             config = function() require("plugins.project") end
--         },
--     }
-- )

