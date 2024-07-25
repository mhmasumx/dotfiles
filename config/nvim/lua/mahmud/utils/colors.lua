local M = {}
local pallettes = require('everforest.colours')
local everforest_config = require('everforest').config
M.colors = function()
  return pallettes.generate_palette(everforest_config, vim.o.background)
end
return M
