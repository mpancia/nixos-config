return {
    "Vigemus/iron.nvim",
    config = function()
        local iron = require("iron.core")
        local marks = require("iron.marks")
        iron.setup {
            config = {
                -- Whether a repl should be discarded or not
                scratch_repl = true,
                -- Your repl definitions come here
                repl_definition = {
                    sh = {
                        -- Can be a table or a function that
                        -- returns a table (see below)
                        command = {"zsh"}
                    }
                },
                -- How the repl window will be displayed
                -- See below for more information
                repl_open_cmd = require('iron.view').bottom(40)
            },
            -- Iron doesn't set keymaps by default anymore.
            -- You can set them here or manually add keymaps to the functions in iron.core
            keymaps = {},
            -- If the highlight is on, you can change how it looks
            -- For the available options, check nvim_set_hl
            highlight = {
                italic = true
            },
            ignore_blank_lines = true -- ignore blank lines when sending visual select lines
        }

        -- iron also has a list of commands, see :h iron-commands for all available commands
        vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>', {
            desc = 'Start REPL'
        })
        vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>', {
            desc = 'Restart REPL'
        })
        vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>', {
            desc = 'Focus REPL'
        })
        vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>', {
            desc = 'Hide REPL'
        })
        vim.keymap.set('n', '<leader>sc', function()
            iron.run_motion('send_motion')
        end, {
            desc = 'Send command'
        })
        vim.keymap.set('v', '<leader>sc', iron.visual_send, {
            desc = 'Visual send'
        })
        vim.keymap.set('n', '<leader>sl', iron.send_line, {
            desc = 'Send line'
        })
        vim.keymap.set('n', '<leader>sf', iron.send_file, {
            desc = 'Send file'
        })
        vim.keymap.set('n', '<leader>su', iron.send_until_cursor, {
            desc = 'Send until cursor'
        })
        vim.keymap.set('n', '<leader>sm', iron.send_mark, {
            desc = 'Send mark'
        })
        vim.keymap.set('n', '<leader>sm', iron.send_mark, {
            desc = 'Send mark'
        })
        vim.keymap.set('n', '<leader>sq', iron.close_repl, {
            desc = 'Close'
        })
        vim.keymap.set('n', '<leader>md', marks.drop_last, {
            desc = 'Drop marks'
        })
        vim.keymap.set('v', '<leader>mc', iron.mark_visual, {
            desc = 'Visual mark'
        })
        vim.keymap.set('n', '<leader>s<cr>', function()
            iron.send(nil, string.char(13))
        end, {
            desc = 'CR'
        })
        vim.keymap.set('n', '<leader>rc', function()
            iron.send(nil, string.char(12))
        end, {
            desc = 'Clear REPL'
        })
        vim.keymap.set('n', '<leader>ri', function()
            iron.send(nil, string.char(03))
        end, {
            desc = "Interrupt REPL"
        })
    end
}
