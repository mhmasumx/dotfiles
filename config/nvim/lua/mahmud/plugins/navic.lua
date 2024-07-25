return {
  'SmiteshP/nvim-navic',
  enabled = true,
  event = 'BufReadPre',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    vim.g.navic_silence = true

    local colors = require('mahmud.utils.colors').colors()
    vim.api.nvim_set_hl(0, 'WinBarFilename', { fg = colors.green, bg = colors.bg2 })

    local navic = require('nvim-navic')
    navic.setup({
      separator = ' › ',
      highlight = true,
      depth_limit = 3,
    })
  end,
}
