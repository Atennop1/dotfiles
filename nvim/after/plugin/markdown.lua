-- obsidian and rendering
vim.api.nvim_set_keymap('n', '<leader>nn', ':ObsidianNewFromTemplate ', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>mr", ":RenderMarkdownToggle<CR>", { silent = true, noremap = true })
