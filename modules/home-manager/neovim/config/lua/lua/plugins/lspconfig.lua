return {
    "neovim/nvim-lspconfig",
    dependencies = {"folke/neoconf.nvim"},
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.jsonls.setup {}
        lspconfig.ruff_lsp.setup {}
        lspconfig.pylsp.setup({
            on_attach = function(client, _)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.document_range_formatting = false
            end,
            settings = {
                pylsp = {
                    plugins = {
                        rope_autoimport = {
                            enabled = true
                        },
                        ruff = {
                            extendSelect = { -- pycodestyle
                            "E", -- Pyflakes
                            "F", -- pyupgrade
                            "UP", -- flake8-bugbear
                            "B", -- flake8-simplify
                            "SIM", -- flake8-commas
                            "COM", -- isort
                            "I"},
                            format = {"ALL"},
                            enabled = false
                        },
                        black = {
                            enabled = false
                        },
                        autopep8 = {
                            enabled = false
                        },
                        yapf = {
                            enabled = false
                        }
                    }
                }
            }
        })
        lspconfig.lua_ls.setup {}
        lspconfig.tsserver.setup {}
        lspconfig.nil_ls.setup {}
        lspconfig.r_language_server.setup {}
        lspconfig.rust_analyzer.setup {
            settings = {
                ['rust-analyzer'] = {}
            }
        }
        lspconfig.marksman.setup {}

        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
            desc = "Go to previous diagnostic"
        })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
            desc = "Go to next diagnostic"
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local opts = {
                    buffer = ev.buf
                }
                vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, vim.tbl_extend("error", opts, {
                    desc = "Go to declaration"
                }))
                vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, vim.tbl_extend("error", opts, {
                    desc = "Go to definition"
                }))
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend("error", opts, {
                    desc = "Hover"
                }))
                vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, vim.tbl_extend("error", opts, {
                    desc = "Go to implementation"
                }))
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend("error", opts, {
                    desc = "Signature help"
                }))
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend("error", opts, {
                    desc = "Add workspace folder"
                }))
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("error", opts, {
                    desc = "Remove workspace folder"
                }))
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, vim.tbl_extend("error", opts, {
                    desc = "List workspace folders"
                }))
                vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, vim.tbl_extend("error", opts, {
                    desc = "Go to type definition"
                }))
                vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, vim.tbl_extend("error", opts, {
                    desc = "Rename"
                }))
                vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, vim.tbl_extend("error", opts, {
                    desc = "Go to references"
                }))
                vim.keymap.set('n', '<leader>lf', function()
                    vim.lsp.buf.format {
                        async = true
                    }
                end, vim.tbl_extend("error", opts, {
                    desc = "Format"
                }))
            end
        })
    end
}
