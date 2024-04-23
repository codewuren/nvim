require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  "bashls",
  "clangd",
  "pyright",
  "jsonls",
  "lua_ls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
  function (server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end
})
