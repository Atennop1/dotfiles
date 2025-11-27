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
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- git integration
    use('tpope/vim-fugitive')

    -- undo tree visualizer
    use('mbbill/undotree')

    -- sessions management use('tpope/vim-obsession')
    use('tpope/vim-obsession')


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
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
        }
    }

    -- editing markdown files
    use {
        "yousefhadder/markdown-plus.nvim",
        ft = "markdown",
        config = function()
            require("markdown-plus").setup()
        end,
    }

    -- obsidian integration
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        config = function()
            require("obsidian").setup({
                ui = { enable = false },
                disable_frontmatter = false,
                workspaces = {
                    {
                        name = "vault",
                        path = "~/documents/vault",
                    },
                },
                completion = {
                    nvim_cmp = true,
                },
                templates = {
                    folder = "04_Templates",
                    substitutions = {
                        created_at = function()
                            return os.date("%H:%M %d-%m-%Y")
                        end,
                    },
                },
                note_frontmatter_func = function(note)
                    local fm = {}
                    if note.metadata and not vim.tbl_isempty(note.metadata) then
                        for k, v in pairs(note.metadata) do
                            fm[k] = v
                        end
                    end
                    if note.tags and #note.tags > 0 then
                        fm["tags"] = note.tags
                    end
                    return fm
                end,
                note_id_func = function(title)
                    return title:gsub(" ", "_"):gsub("[^%w_%-%.%s]", "")
                end,
            })
        end,
    })
end)
