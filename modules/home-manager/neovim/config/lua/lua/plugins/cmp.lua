return {
    "hrsh7th/nvim-cmp",
    dependencies = {"neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "onsails/lspkind-nvim",
                    "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-cmdline",
                    "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "zbirenbaum/copilot.lua", "zbirenbaum/copilot-cmp"},
    config = function()
        local cmp = require 'cmp'
        require('luasnip.loaders.from_vscode').load()
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false
                            })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({
                        select = true
                    }),
                    c = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    })
                })
            }),
            sources = cmp.config.sources({{
                name = 'copilot'
            }, {
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            }}, {{
                name = 'buffer'
            }})
        })

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({{
                name = 'git'
            }}, {{
                name = 'buffer'
            }})
        })

        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{
                name = 'buffer'
            }}
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{
                name = 'path'
            }}, {{
                name = 'cmdline'
            }})
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end
}
