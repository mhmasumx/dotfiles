local Mode = {}

function Mode.get_mode()
  local mode_icons = require('mahmud.utils.icons').mode
  local lualine_mode = require('lualine.utils.mode').map
  local custom_mode_text = {
    ['c'] = mode_icons.c,
    ['i'] = mode_icons.i,
    ['n'] = mode_icons.n,
    ['r'] = mode_icons.r,
    ['s'] = mode_icons.s,
    ['t'] = mode_icons.t,
    ['v'] = mode_icons.v,
  }
  for key, value in pairs(custom_mode_text) do
    lualine_mode[key] = value
  end
  return lualine_mode[vim.api.nvim_get_mode().mode]
end

return Mode
