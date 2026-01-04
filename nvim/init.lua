-- packages
vim.pack.add({
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	{ src = "https://github.com/wakatime/vim-wakatime" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/tpope/vim-obsession" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim",   version = "0.1.8" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("gruber-darker").setup({ italic = { strings = false } })
vim.cmd([[colorscheme gruber-darker]])

require("oil").setup({
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

require('nvim-treesitter.configs').setup {
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
}

require("mason").setup({ ui = { border = "single" } })
vim.lsp.enable({ "gopls", "golangci-lint-langserver", "clangd", "lua_ls", "pylsp" })

local telescope_builtin = require("telescope.builtin")
local telescope_actions = require("telescope.actions")
require("telescope").setup {
	defaults = {
		borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		mappings = {
			n = { ["q"] = telescope_actions.close },
			i = { ["<C-c>"] = function() vim.cmd.stopinsert() end },
		},
	},
}

-- options
vim.g.mapleader = " "
vim.opt.number = true

vim.opt.relativenumber = true
vim.opt.winborder = "single"
vim.opt.fillchars = { eob = " " }

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.termguicolors = true
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank({ higroup = "Visual" }) end,
})

-- remaps
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v", "x" }, "<leader>d", "\"+d")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', function() telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "Telescope grep string" })
