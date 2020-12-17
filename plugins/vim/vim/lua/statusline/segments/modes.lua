local build_segment = require('statusline.utils').build_segment
local modes = require('statusline.defaults').modes

return function(inactive)
  local mode = vim.fn.mode()

  if inactive then return '' end

  if mode == 'n' then
    mode = 'normal'
  elseif mode == 'i' then
    mode = 'insert'
  elseif mode == 'v' or mode == 'V' then
    mode = 'visual'
  elseif mode == '^V' or mode == '' then
    mode ='visualblock'
  elseif mode == 'c' then
    mode = 'command'
  elseif mode == 't' then
    mode = 'terminal'
  elseif mode == 'R' then
    mode = 'replace'
  else
    mode = 'default'
  end

  local color = modes.colors[mode]
  local content = modes.icons[mode]
  return build_segment({{ content = content, color = color }})
end

