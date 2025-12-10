require 'nvim-treesitter.configs'.setup {
    -- don't block on install
    sync_install = false,

    -- install missing parsers automatically
    auto_install = true,

    -- enable Treesitter highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- force documentation comments to look like regular one
vim.api.nvim_set_hl(0, '@comment.documentation', { link = 'Comment' })
