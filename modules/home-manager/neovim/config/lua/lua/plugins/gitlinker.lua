return {
    "ruifm/gitlinker.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        vim.keymap.set({"n", 'v'}, "<leader>gl", "<cmd>GitLink<cr>", {
            silent = true,
            noremap = true,
            desc = "Copy git permlink to clipboard"
        })
        vim.keymap.set({"n", 'v'}, "<leader>gL", "<cmd>GitLink!<cr>", {
            silent = true,
            noremap = true,
            desc = "Open git permlink in browser"
        })
        -- blame
        vim.keymap.set({"n", 'v'}, "<leader>gb", "<cmd>GitLink blame<cr>", {
            silent = true,
            noremap = true,
            desc = "Copy git blame link to clipboard"
        })
        vim.keymap.set({"n", 'v'}, "<leader>gB", "<cmd>GitLink! blame<cr>", {
            silent = true,
            noremap = true,
            desc = "Open git blame link in browser"
        })
    end
}
