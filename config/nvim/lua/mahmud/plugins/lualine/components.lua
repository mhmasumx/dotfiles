local M = {}

local conditions = require('mahmud.plugins.lualine.conditions')
local colors = require('mahmud.utils.colors').colors()
local icons = require('mahmud.utils.icons')
local tree_view = require('nvim-tree.view')
local utils = require('mahmud.utils')
local highlight_color = utils.highlight_color

M.mode = {
  function()
    local mode_code = require('mahmud.plugins.lualine.mode').get_mode()
    return mode_code
  end,
  color = function()
    --   -- auto change color according to neovims mode
    local mode_color = {
      n = colors.green,
      i = colors.blue,
      v = colors.purple,
      c = colors.purple,
      r = colors.aqua,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] or colors.green }
  end,
  padding = { right = 0 },
}

M.branch = {
  'branch',
  icon = '',
  color = { fg = colors.aqua, gui = 'bold' },
}

M.filename = {
  function()
    local winnr = vim.fn.winnr()
    local bufnum = vim.fn.winbufnr(winnr)

    local segments = {}

    -- File name
    local file_name = vim.fn.fnamemodify(vim.fn.bufname(bufnum), ':t')
    local extension = vim.fn.expand('#' .. bufnum .. ':e')
    local icon, devicon_color = require('nvim-web-devicons').get_icon_color(file_name, extension)

    if not icon and #file_name == 0 then
      icon = ''
      devicon_color = colors.grey0
    end

    -- Icon
    vim.api.nvim_set_hl(0, 'LuaLineFileIcon', { fg = devicon_color or colors.bg3, bg = 'NONE' })
    local icon_statusline = highlight_color('LuaLineFileIcon', icon or '')
    table.insert(segments, icon_statusline)

    -- color highlight
    vim.api.nvim_set_hl(0, 'StatusBarFileName', { fg = colors.grey2, bg = 'NONE', italic = true })
    vim.api.nvim_set_hl(0, 'StatusBarFileModified', { fg = colors.green, bg = 'NONE' })

    -- File path
    local file_path = '%{expand("%:t")}'
    table.insert(segments, highlight_color('StatusBarFileName', file_path))

    -- File modified
    local bufname = vim.fn.bufname(bufnum)
    if bufname ~= '' and vim.fn.getbufvar(bufnum, '&modified') == 1 then
      table.insert(segments, highlight_color('StatusBarFileModified', ''))
    end

    return table.concat(segments, ' ')
  end,
  color = { gui = 'italic' },
}

M.diff = {
  'diff',
  symbols = {
    added = icons.git.add .. ' ',
    untracked = icons.git.add .. ' ',
    modified = icons.git.Modified .. ' ',
    removed = icons.git.deleted .. ' ',
  },
  colored = true,
  always_visible = false,
}

M.diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn', 'info', 'hint' },
  symbols = {
    error = icons.diagnostics.Error,
    hint = icons.diagnostics.Hint,
    info = icons.diagnostics.Info,
    warn = icons.diagnostics.Warn,
  },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

M.treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ''
    end
    return ''
  end,
  color = { fg = colors.grey0, bg = colors.none },
  cond = conditions.hide_in_width,
}

M.spaces = {
  function()
    return (vim.bo.expandtab and '␠' or '⇥ ') .. ' ' .. vim.bo.shiftwidth
  end,
  cond = conditions.hide_in_width,
  color = { fg = colors.grey1, bg = colors.none },
}

M.scrollbar = {
  function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local chars = { '_', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  color = { fg = colors.green, bg = colors.none },
  cond = nil,
}

M.lsp = {
  function(msg)
    msg = msg or 'LS Inactive'
    local buf_clients = vim.lsp.get_active_clients()
    if next(buf_clients) == nil then
      if type(msg) == 'boolean' or #msg == 0 then
        return 'LS Inactive'
      end
      return msg
    end
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= 'null-ls' then
        table.insert(buf_client_names, client.name)
      end
    end

    local unique_client_names = vim.fn.sort(buf_client_names)
    unique_client_names = vim.fn.uniq(unique_client_names)
    return ' ' .. table.concat(unique_client_names, ' ')
  end,
  color = { fg = colors.grey0, bg = colors.none },
}

M.nvim_tree_shift = {
  function()
    local name = '󰙅 Nvim Tree'
    local winnr = tree_view.get_winnr()
    local empty_space = string.rep(' ', ((vim.api.nvim_win_get_width(winnr or 0) - #name) / 2))
    return empty_space .. name .. empty_space
  end,
  cond = tree_view.is_visible,
  color = { fg = colors.grey1, bg = colors.none, gui = 'italic' },
}

return M
