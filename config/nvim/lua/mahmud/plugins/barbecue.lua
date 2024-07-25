return {
  'utilyre/barbecue.nvim',
  event = 'BufReadPre',
  dependencies = {
    'SmiteshP/nvim-navic',
    'neovim/nvim-lspconfig',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local colors = require('mahmud.utils.colors').colors()
    local utils = require('mahmud.utils')
    local highlight_color = utils.highlight_color
    vim.api.nvim_set_hl(0, 'WinbarCustomIcon', { fg = colors.green, bg = colors.bg2 })
    local winbar_custom_icon = highlight_color('WinbarCustomIcon', '  󰇟  ')

    require('barbecue').setup({
      attach_navic = true,
      show_navic = true,
      show_modified = false,
      exclude_filetypes = { 'netrw', 'NvimTree' },
      show_dirname = false,
      show_basename = false,
      lead_custom_section = function()
        return winbar_custom_icon .. ' '
      end,
      theme = 'everforest',
      symbols = {
        prefix = ' ',
        separator = '',
        default_context = '…',
      },
    })
  end,
}
