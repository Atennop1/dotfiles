-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup oil
require("oil").setup({
    keymaps_help = {
        border = "single",
    },
    confirmation = {
        border = "single",
    },
    progress = {
        border = "single",
    },
    ssh = {
        border = "single",
    },
    default_file_explorer = true,
    delete_to_trash = true,
    skip_hidden = false,
    skip_confirm_for_simple_edits = true,
})
