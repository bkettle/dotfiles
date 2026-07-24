-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require'lspconfig'

lspconfig.gopls.setup {
  capabilities = capabilities
}
lspconfig.pyright.setup{}
lspconfig.eslint.setup{}
lspconfig.ruff_lsp.setup{}
lspconfig.ocamllsp.setup{}

-- rust-specific setup
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
    end,
  },
})
rt.inlay_hints.enable()
