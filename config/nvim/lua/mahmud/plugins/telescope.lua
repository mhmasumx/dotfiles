local M = { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'prochri/telescope-all-recent.nvim',
      dependencies = { 'kkharji/sqlite.lua', 'stevearc/dressing.nvim' },
      opts = {},
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    'folke/trouble.nvim',
  },
}

M.config = function()
  local status_ok, telescope = pcall(require, 'telescope')
  if not status_ok then
    return
  end

  local trouble_ok, trouble = pcall(require, 'trouble.providers.telescope')
  if not trouble_ok then
    return
  end

  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local layout_actions = require('telescope.actions.layout')
  local lga_actions = require('telescope-live-grep-args.actions')

  telescope.setup({
    defaults = {
      set_env = {
        LESS = '',
        DELTA_PAGER = 'less',
        COLORTERM = 'truecolor',
      },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--fixed-strings',
        '--trim',
      },
      file_ignore_patterns = {
        '^.git/',
        '^node_modules/',
        '^venv/',
      },
      prompt_prefix = '   ',
      selection_caret = ' ',
      entry_prefix = '  ',
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
      live_grep_args = {
        disable_coordinates = true,
        auto_quoting = true, -- enable/disable auto-quoting
        mappings = {
          -- extend mappings
          i = {
            ['<C-k>'] = lga_actions.quote_prompt(),
            ['<C-r>'] = function(prompt_bufnr)
              local picker = action_state.get_current_picker(prompt_bufnr)
              local prompt = picker:_get_prompt()
              picker:set_prompt('--no-fixed-strings ' .. prompt)
            end,
          },
        },
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
        },
      },
    },
  })

  -- Enable Telescope extensions if they are installed
  telescope.load_extension('fzf')
  telescope.load_extension('ui-select')
  telescope.load_extension('live_grep_args')

  -- See `:help telescope.builtin`
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ts', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', 'ff', builtin.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })

  -- Slightly advanced example of overriding default behavior and theme
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end, { desc = '[/] Fuzzily search in current buffer' })

  vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep({
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    })
  end, { desc = '[S]earch [/] in Open Files' })

  -- Shortcut for searching your Neovim configuration files
  vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
  end, { desc = '[S]earch [N]eovim files' })
end

function M.lsp_definitions()
  require('telescope.builtin').lsp_definitions({})
end

function M.lsp_references()
  require('telescope.builtin').lsp_references({
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    ignore_filename = false,
    fname_width = 40,
  })
end

return M
