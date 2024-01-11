local cmp = require 'cmp'
require('luasnip.loaders.from_vscode').load()

require("copilot").setup({
    suggestion = {
        enabled = false
    },
    panel = {
        enabled = false
    }
})

require("copilot_cmp").setup()

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
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        })
    }),
    sources = cmp.config.sources({ {
        name = 'copilot'
    }, {
        name = 'nvim_lsp'
    }, {
        name = 'luasnip'
    } }, { {
        name = 'buffer'
    } })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({ {
        name = 'git'
    } }, { {
        name = 'buffer'
    } })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { {
        name = 'buffer'
    } }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ {
        name = 'path'
    } }, { {
        name = 'cmdline'
    } })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
