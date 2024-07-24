return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        -- background_colour = '#2E3440',
        stages = 'static',
        timeout = 1500,
      },
    },
  },
  event = 'VeryLazy',
  opts = {
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },
    },
    presets = { inc_rename = true },
    views = {
      cmdline_popup = {
        position = {
          row = 7,
          col = '55%',
        },
      },
      cmdline_popupmenu = {
        position = {
          row = 7,
          col = '55%',
        },
      },
    },
  },
}
