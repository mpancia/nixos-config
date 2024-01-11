local wk = require("which-key")
wk.register({
    ["<leader>p"] = {
        name = "Search"
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
    }
    ,
    ["<leader>w"] = {
        name = "Workspace"
    }
})
