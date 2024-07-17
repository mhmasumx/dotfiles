local M = {}

M.setup = function (opts)
  local lspconfig = require("lspconfig")
  lspconfig.pyright.setup({
    handlers = opts.custom_handlers,
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    filetypes = {"python"}
  })
end

return M
