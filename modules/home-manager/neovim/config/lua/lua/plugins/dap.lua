return {
    "mfussenegger/nvim-dap",
    dependencies = {"mfussenegger/nvim-dap-python"},
    config = function()
        local dap = require('dap')
        require('dap-python').setup()

        vim.keymap.set('n', '<leader>db', function()
            dap.toggle_breakpoint()
        end, {
            desc = 'Toggle breakpoint'
        })
        vim.keymap.set('n', '<leader>dB', function()
            dap.set_breakpoint()
        end, {
            desc = 'Set breakpoint'
        })
        vim.keymap.set('n', '<leader>dc', function()
            dap.continue()
        end, {
            desc = 'Continue'
        })
        vim.keymap.set('n', '<leader>di', function()
            dap.step_into()
        end, {
            desc = 'Step into'
        })
        vim.keymap.set('n', '<leader>do', function()
            dap.step_over()
        end, {
            desc = 'Step over'
        })
        vim.keymap.set('n', '<leader>dr', function()
            dap.repl.open()
        end, {
            desc = 'Open REPL'
        })
        vim.keymap.set('n', '<leader>dl', function()
            dap.run_last()
        end, {
            desc = 'Run last'
        })
        vim.keymap.set('n', '<leader>dp', function()
            dap.ui.widgets.preview()
        end, {
            desc = 'Preview'
        })
        vim.keymap.set('n', '<Leader>df', function()
            local widgets = dap.ui.widgets
            widgets.centered_float(widgets.frames)
        end, {
            desc = 'Frames'
        })
    end
}
