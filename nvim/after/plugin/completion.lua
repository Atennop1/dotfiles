local cmp = require 'cmp'

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- completion
        ['<C-Space>'] = cmp.mapping.complete(),

        -- selection
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- next item
        ['<Tab>'] = cmp.mapping.select_next_item(),

        -- previous item
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),

    sources = cmp.config.sources({
        -- LSP suggestions
        { name = 'nvim_lsp' },
    }),
})
