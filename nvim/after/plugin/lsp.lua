-- setup mason looking
require("mason").setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "V",
            package_pending = "->",
            package_uninstalled = "X"
        },
    }
})

-- setup mason auto-installation of plugins
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- capabilities for nvim-cmp autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- function to set up LSP keymaps & autoformat on attach
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local map = vim.keymap.set

    -- LSP keymaps
    map('n', 'K', vim.lsp.buf.hover, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- organize imports for Go on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ async = false })
            vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true
            })
        end,
    })
end

-- attach remaps for every LSP server
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            on_attach(client, args.buf)
        end
        vim.diagnostic.show(nil, bufnr)
    end,
})

-- update diagnostic even in insert mode
vim.diagnostic.config({
    update_in_insert = true,
})

-- keymaps to jump between errors
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- keymaps for checking diagnostic
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
