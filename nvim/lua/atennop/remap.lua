-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- center screen after scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search results centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selection without overwriting register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete without copying
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- escape insert mode with Ctrl+C
vim.keymap.set("i", "<C-c>", "<Esc>")

-- disable Q (ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- format buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace current word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- jump stack navigation
vim.keymap.set('n', '<leader>o', '<C-o>', { desc = "Jump back" })
vim.keymap.set('n', '<leader>i', '<C-i>', { desc = "Jump forward" })

-- buffer navigation
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = "Close buffer" })
vim.keymap.set('n', '<leader>bd!', ':bd!<CR>', { desc = "Force close buffer" })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = "Previous buffer" })
