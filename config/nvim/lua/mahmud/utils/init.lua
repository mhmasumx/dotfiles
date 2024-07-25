local M = {}
M.highlight_color = function(hightlight_group, content)
  return string.format('%%#%s#%s%%*', hightlight_group, content)
end
return M
