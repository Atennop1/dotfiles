-- set theme
require("gruber-darker").setup({
    bold = true,
    underline = true,
    italic = {
        comments = true,
        strings = false,
        operators = false,
    },
})
vim.cmd([[colorscheme gruber-darker]])

-- forcing mason to use custom buffer group
vim.api.nvim_create_autocmd("FileType", {
    pattern = "mason",
    callback = function()
        vim.api.nvim_win_set_option(0, "winhighlight", "Normal:Mason,NormalFloat:Mason")
    end,
})

-- making UI transparent
local groups = {
    -- core
    "Normal", "NormalNC",

    -- mason
    "Mason",

    -- telescope
    "TelescopeNormal", "TelescopeBorder",
    "TelescopePromptNormal", "TelescopePromptBorder",
    "TelescopeResultsBorder", "TelescopePreviewBorder",

    -- treesitter
    "TreeSitterContext", "TreeSitterContextLineNumber",

    -- undotree
    "UndotreeNormal", "UndotreeBorder",

    -- git fugitive
    "DiffAdd", "DiffChange", "DiffDelete", "DiffText",
}

for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
end


-- removing colorcolumn for some file types
local file_types = {
    "netrw",
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "gitcommit",
    "TelescopePrompt",
    "TelescopeResults",
}

for _, type in ipairs(file_types) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = type,
        callback = function()
            vim.opt_local.colorcolumn = "0"
        end,
    })
end
