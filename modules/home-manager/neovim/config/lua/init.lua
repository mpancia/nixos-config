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
--         "rafamadriz/friendly-snippets",
--         {
--             "chentoast/marks.nvim",
--             config = function() require("plugins.marks") end,
--         },
--         "antoinemadec/FixCursorHold.nvim",
--             config = true
--         },

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
