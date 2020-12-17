local delimiters = require 'statusline.defaults'.delimiters

local M = {}

M.titlecase = function(str)
  return str:sub(1,1):upper() .. str:sub(2)
end

M.highlightName = function(color, modifier)
  modifier = modifier or ''
  local statusline = 'GStatusLine' .. M.titlecase(color) .. M.titlecase(modifier)
  return statusline
end

M.colorize = function(color, modifier, content)
  modifier = modifier or ''
  return "%#" .. M.highlightName(color, modifier) .. '#' .. content
end

M.build_segment = function(segments)
  local first_color = segments[1].color
  local last_color = segments[#segments].color
  local statusline = ''

  statusline = statusline .. M.colorize(first_color, 'reverse', delimiters.left)
  for _,segment in ipairs(segments) do
    statusline = statusline .. M.colorize(segment.color, '', segment.content)
  end
  statusline = statusline .. M.colorize(last_color, 'reverse', delimiters.right)
  print(statusline)


  return statusline
end


return M


