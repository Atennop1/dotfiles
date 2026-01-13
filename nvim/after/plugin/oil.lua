-- for some reason oil.nvim has problems with loading order so i put it here
require("oil").setup({
	columns = { 'size', 'mtime' },
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
})
