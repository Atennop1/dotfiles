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

-- making UI transparent
local groups = {
    -- core
    "Normal", "NormalNC",

    -- oil
    "NormalFloat",

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
    "oil",
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
