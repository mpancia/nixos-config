local neotest = require("neotest")
neotest.setup({
    adapters = { require("neotest-python")({
        runner = "unittest",
        args = function()
            local unittestArgs = os.getenv("UNITTEST_ARGS") or ""
            return { "-v", unittestArgs }
        end,
        dap = {
            justMyCode = false
        }
    }) }
})
vim.keymap.set("n", "<leader>Ts", neotest.summary.toggle, {
    desc = "Toggle test summary"
})
