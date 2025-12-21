vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- gruber-darker colorscheme
    use "blazkowolf/gruber-darker.nvim"

    -- wakatime
    use 'wakatime/vim-wakatime'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', branch = 'master', run = ':TSUpdate' }

    -- undo tree visualizer
    use 'mbbill/undotree'

    -- sessions management
    use 'tpope/vim-obsession'

    -- nice column line
    use 'xiyaowong/virtcolumn.nvim'

    -- control neovim using Russian keyboard layout
    use 'aveplen/ruscmd.nvim'

    -- editing markdown files
    use { "yousefhadder/markdown-plus.nvim", }

    -- obsidian integration
    use { "epwalsh/obsidian.nvim", }

    -- LSP support
    use {
        'neovim/nvim-lspconfig',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        }
    }

    -- autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
        }
    }
end)
