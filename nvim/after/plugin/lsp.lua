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

-- extend base neovim LSP capabilities with completion capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- runs when an LSP attaches to a buffer
local function on_attach(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }

    -- navigation & actions
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- one group per buffer
    local group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, { clear = true })

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
            -- organize imports only for gopls
            if client.name == "gopls" then
                local params = {
                    context = { only = { "source.organizeImports" } },
                    textDocument = vim.lsp.util.make_text_document_params(),
                }
                local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
                for _, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                        elseif r.command then
                            vim.lsp.buf.execute_command(r.command)
                        end
                    end
                end
            end

            -- format buffer if supported
            if client.supports_method("textDocument/formatting") then
                vim.lsp.buf.format({
                    bufnr = bufnr,
                    timeout_ms = 2000,
                    filter = function(c)
                        return c.name == client.name
                    end,
                })
            end
        end,
    })
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

-- disable placeholders for clangd
vim.lsp.config.clangd = {
    cmd = {
        "clangd",
        "--function-arg-placeholders=false",
    },
}
