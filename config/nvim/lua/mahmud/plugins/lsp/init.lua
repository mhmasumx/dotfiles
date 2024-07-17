return {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPost",
  dependencies = {
    -- "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    -- "nvim-lua/lsp-status.nvim",
  },
  config = function()
    require("mahmud.plugins.lsp.handlers").setup()
    require("mahmud.plugins.lsp.servers")
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end,
}
