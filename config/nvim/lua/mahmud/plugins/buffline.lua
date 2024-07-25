return {
  'akinsho/bufferline.nvim',
  version = '*',
  enabled = true,
  config = function()
    require('bufferline').setup({
      options = {
        always_show_bufferline = false,
        tab_size = 0,
        show_buffer_icons = false,
        show_buffer_close_icons = true,
        buffer_close_icon = '',
        show_close_icon = false,
        show_tab_indicators = false,
        indicator = { style = 'none' },
        modified_icon = '',
        max_name_length = 25,
        offsets = {
          {
            filetype = 'NvimTree',
            text = '  Files/Folders',
            highlight = 'NONE',
            text_align = 'center',
          },
        },
        separator_style = { '', '' },
        custom_areas = {
          left = function()
            return {
              { text = '    ', fg = '#8fff6d', bg = '#2E383C' },
            }
          end,
        },
      },
    })
    local keymap = vim.keymap.set -- for conciseness
    local opts = { noremap = true, silent = true }
    opts.desc = 'Next Tab'
    keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)

    opts.desc = 'Previous Tab'
    keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
  end,
}
