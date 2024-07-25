local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
}

M.config = function()
  local lualine = require('lualine')
  local components = require('mahmud.plugins.lualine.components')

  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      globalstatus = true,
      disabled_filetypes = { statusline = { 'lazy', 'NvimTree' } },
      theme = 'auto',
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        components.mode,
        components.filename,
        components.diff,
        components.diagnostics,
      },
      lualine_x = {
        components.treesitter,
        components.lsp,
      },
      lualine_y = {},
      lualine_z = {
        components.spaces,
        components.scrollbar,
        components.nvim_tree_shift,
      },
    },
  }

  lualine.setup(config)
end

return M
