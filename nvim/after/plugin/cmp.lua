local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),            -- trigger completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- confirm selection
        ['<Tab>'] = cmp.mapping.select_next_item(),        -- next item
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),      -- previous item
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP suggestions
        { name = 'luasnip' },  -- snippets
    })
})
