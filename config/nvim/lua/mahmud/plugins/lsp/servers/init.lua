local handlers = require('mahmud.plugins.lsp.handlers')
local custom_handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  custom_handlers = custom_handlers,
}
require('mahmud.plugins.lsp.servers.lua_ls').setup(opts)
require('mahmud.plugins.lsp.servers.bash_ls').setup(opts)
require('mahmud.plugins.lsp.servers.pyright').setup(opts)
