local M = {}

local lspconfig = require('lspconfig')

M.setup = function(opts)
  lspconfig.pyright.setup({
    -- handlers = opts.custom_handlers,
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    -- filetypes = { 'python' },
  })
end

return M
