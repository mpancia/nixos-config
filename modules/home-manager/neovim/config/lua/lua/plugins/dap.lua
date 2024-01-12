local dap = require('dap')

vim.keymap.set('n', '<leader>db', function()
    dap.toggle_breakpoint()
end, { desc = 'Toggle breakpoint' })
