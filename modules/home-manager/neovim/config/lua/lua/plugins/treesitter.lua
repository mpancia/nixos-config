return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        vim.api.nvim_create_autocmd('VimEnter', {
            group = vim.api.nvim_create_augroup('UserTreesitterConfig', {}),
            callback = function(ev)
                require('nvim-treesitter.configs').setup {
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false
                    },
                    textobjects = {
                        enable = true,
                        prev_selection = ',',
                        lsp_interop = {
                            enable = true,
                            border = 'none',
                            floating_preview_opts = {},
                            peek_definition_code = {
                                ["<leader>df"] = "@function.outer",
                                ["<leader>dF"] = "@class.outer"
                            }
                        },
                        move = {
                            enable = true,
                            set_jumps = true,
                            goto_next_start = {
                                ["]f"] = "@function.outer",
                                ["]]"] = {
                                    query = "@class.outer",
                                    desc = "Next class start"
                                },
                                ["]l"] = "@loop.*",
                                ["]s"] = {
                                    query = "@scope",
                                    query_group = "locals",
                                    desc = "Next scope"
                                },
                                ["]z"] = {
                                    query = "@fold",
                                    query_group = "folds",
                                    desc = "Next fold"
                                }
                            },
                            goto_next_end = {
                                ["]F"] = "@function.outer",
                                ["]["] = "@class.outer"
                            },
                            goto_previous_start = {
                                ["[f"] = "@function.outer",
                                ["[["] = "@class.outer"
                            },
                            goto_previous_end = {
                                ["[F"] = "@function.outer",
                                ["[]"] = "@class.outer"
                            },
                            goto_next = {
                                ["]c"] = "@conditional.outer"
                            },
                            goto_previous = {
                                ["[d"] = "@conditional.outer"
                            }
                        },
                        keymaps = {
                            ['.'] = 'textsubjects-smart',
                            [';'] = 'textsubjects-container-outer',
                            ['i;'] = {
                                'textsubjects-container-inner',
                                desc = "Select inside containers (classes, functions, etc.)"
                            }
                        }
                    },
                    indent = {
                        enable = true
                    },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "gnn",
                            node_incremental = "grn",
                            scope_incremental = "grc",
                            node_decremental = "grm"
                        }
                    }
                }
            end
        })

    end
}, {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
}, {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
}, {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
}}
