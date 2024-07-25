local plugin = {
  'zbirenbaum/copilot.lua',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = 'Copilot',
  event = 'InsertEnter',
}

function plugin.config()
  require('copilot').setup({
    panel = {
      auto_refresh = false,
      keymap = {
        accept = '<CR>',
        jump_prev = '[[',
        jump_next = ']]',
        refresh = 'gr',
        open = '<M-CR>',
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '<C-j>',
        accept_word = '<S-Down>',
        accept_line = '<S-Right>',
        next = '<C-space>',
        dismiss = '<C-c>',
      },
    },
  })
end

return plugin
