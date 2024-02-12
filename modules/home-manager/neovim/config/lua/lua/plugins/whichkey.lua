return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>p"] = {
                name = "Search"
            },
            ["<leader>g"] = {
                name = "Git"
            },
            ["<leader>s"] = {
                name = "Send to REPL"
            },
            ["<leader>m"] = {
                name = "Marks"
            },
            ["<leader>l"] = {
                name = "LSP"
            },
            ["<leader>r"] = {
                name = "Run"
            },
            ["<leader>d"] = {
                name = "Diagnostics"
            },
            ["<leader>t"] = {
                name = "Toggle"
            },
            ["<leader>h"] = {
                name = "Hunks"
            },
            ["<leader>w"] = {
                name = "Workspace"
            }
        })
    end
}
