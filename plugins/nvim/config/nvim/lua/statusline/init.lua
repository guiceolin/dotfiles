local mode_segment = require('statusline.segments.modes')
local path_segment = require('statusline.segments.path')
local palette = require('statusline.defaults').palette
local highlightName = require('statusline.utils').highlightName

local highlight = function(name, background, foreground, modifier)
      local command = 'highlight '
      command = command .. highlightName(name, modifier) .. ' '
      command = command .. 'guifg=' .. foreground .. ' '
      command = command .. 'guibg=' .. background .. ' '
      if modifier then
         command = command .. 'gui=' .. modifier .. ' '
      end
      return command
   end

local builder = function(inactive)
  local statusline = ''
  statusline = statusline .. mode_segment(inactive)
  statusline = statusline .. path_segment()

  return statusline
end

for name, color in pairs(palette.colors) do
  vim.cmd('autocmd ColorScheme,VimEnter * ' .. highlight(name, color, palette.background))
  vim.cmd('autocmd ColorScheme,VimEnter * ' .. highlight(name, color, palette.background, 'bold'))
  vim.cmd('autocmd ColorScheme,VimEnter * ' .. highlight(name, color, palette.background, 'italic'))
  vim.cmd('autocmd ColorScheme,VimEnter * ' .. highlight(name, color, palette.background, 'reverse'))
end

local M = {}

M.active = function()
  return builder(false)
end

M.inactive = function()
  return builder(true)
end

return M
