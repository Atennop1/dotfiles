-- set theme
require("gruber-darker").setup({
    bold = true,
    italic = {
        comments = true,
        strings = false,
        operators = false,
    },
    underline = true,
})
vim.cmd([[colorscheme gruber-darker]])

-- forcing mason to use custom buffer group
vim.api.nvim_create_autocmd("FileType", {
    pattern = "mason",
    callback = function()
        vim.api.nvim_win_set_option(0, "winhighlight", "Normal:Mason,NormalFloat:Mason")
    end,
})

-- make UI transparent
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
