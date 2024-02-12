return {
    "ahmedkhalf/project.nvim",
    config = function()
        require('overseer').setup()
        vim.keymap.set('n', '<Leader>rt', '<cmd>:OverseerRun<CR>', {
            desc = 'Run Tasks'
        })
        vim.keymap.set('n', '<Leader>rT', '<cmd>:OverseerToggle<CR>', {
            desc = 'Toggle Tasks'
        })
    end
}
