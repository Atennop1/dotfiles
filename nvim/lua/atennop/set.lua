-- leader
vim.g.mapleader = " "

-- spell checking
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.spelloptions = "camel"
vim.opt.spellcapcheck = ""

-- allow hidden buffers so you can switch without saving
vim.opt.hidden = true

-- hide ~ at end of buffer
vim.opt.fillchars = { eob = " " }

-- hide netrw banner
vim.g.netrw_banner = 0

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- disable wrap
vim.opt.wrap = false

-- backup & undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- UI scrolling and signs
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- treat special characters in filenames
vim.opt.isfname:append("@-@")

-- faster updates for LSP
vim.opt.updatetime = 50

-- highlight of yanked components
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        local mode = vim.fn.mode()
        if mode ~= "v" and mode ~= "V" and mode ~= "" then
            vim.highlight.on_yank({
                higroup = "Visual",
                timeout = 150,
                on_macro = true,
            })
        end
    end,
})
