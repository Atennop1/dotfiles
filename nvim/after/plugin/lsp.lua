-- configure Mason UI
require("mason").setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "V",
            package_pending = "->",
            package_uninstalled = "X",
        },
    },
})

-- automatically install LSP servers declared via lspconfig
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- start with base neovim LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- extend them with completion capabilities from nvim-cmp
capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- runs when an LSP attaches to a buffer
local function on_attach(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    local map = vim.keymap.set

    -- hover documentation
    map("n", "K", vim.lsp.buf.hover, opts)

    -- go to definition / references
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)

    -- refactoring actions
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- format on save (only if the server supports it)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    bufnr = bufnr,
                    async = false,
                })
            end,
        })
    end

    -- organize imports on save (go-specific)
    if client.name == "gopls" then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.code_action({
                    context = { only = { "source.organizeImports" } },
                    apply = true,
                })
            end,
        })
    end
end

-- attach on_attach to every LSP client
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            on_attach(client, args.buf)
        end
    end,
})

-- update diagnostics even while typing
vim.diagnostic.config({
    update_in_insert = true,
})

-- navigate diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- show diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
