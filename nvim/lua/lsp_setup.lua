-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require'lspconfig'

lspconfig.gopls.setup {
  capabilities = capabilities
}
lspconfig.rust_analyzer.setup{}
lspconfig.pyright.setup{}
lspconfig.eslint.setup{}
lspconfig.ruff_lsp.setup{}
