return {
  'neovim/nvim-lspconfig',
  name = 'lsp',
  event = 'BufReadPost',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'b0o/schemastore.nvim',
    -- "jose-elias-alvarez/null-ls.nvim",
    'williamboman/mason.nvim',
  },
  config = function()
    require('mahmud.plugins.lsp.handlers').setup()
    require('mahmud.plugins.lsp.servers')
    require('lspconfig.ui.windows').default_options.border = 'rounded'
  end,
}
