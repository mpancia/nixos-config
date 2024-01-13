return {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"},
    config = function()
        require("aerial").setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {
                    buffer = bufnr
                })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {
                    buffer = bufnr
                })
            end,
            filter_kind = false,
            layout = {
                max_width = {0.3},
                min_width = {0.1}
            }
        })

        vim.keymap.set("n", "<leader>lo", "<cmd>AerialToggle!<CR>", {
            desc = "Toggle Aerial"
        })
        vim.keymap.set("n", "<leader>po", "<cmd>Telescope aerial<CR>", {
            desc = "Search Aerial"
        })

    end
}
