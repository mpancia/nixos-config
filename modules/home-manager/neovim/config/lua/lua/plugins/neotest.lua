local neotest = require("neotest")
neotest.setup({
    adapters = { require("neotest-python")({
    }) }
})
vim.keymap.set("n", "<leader>Ts", neotest.summary.toggle, {
    desc = "Toggle test summary"
})
