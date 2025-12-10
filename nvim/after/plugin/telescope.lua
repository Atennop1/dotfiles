-- require packages
local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- setup looking
telescope.setup {
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        sorting_strategy = "ascending",
        layout_strategy = "flex",
    },
}

-- keymaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope grep string" })
