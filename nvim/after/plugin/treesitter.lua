require 'nvim-treesitter.configs'.setup {
    sync_install = false, -- don't block on install
    auto_install = true,  -- install missing parsers automatically

    highlight = {
        enable = true, -- enable Treesitter highlighting
        additional_vim_regex_highlighting = false,
    },
}

-- force documentation comments to look like regular one
vim.api.nvim_set_hl(0, '@comment.documentation', { link = 'Comment' })
