local M = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = function()
    local language_servers = require('mahmud.utils.servers').lsp_server
    return {
      ensure_installed = language_servers
    }
  end,
}

return M
