local build_segment = require('statusline.utils').build_segment

return function()

  local segments = {}
  table.insert(segments, { color = 'white', content = '%.30f ' })
  if vim.bo.mod then
    table.insert(segments, { color = 'lightgrey', content = ' +'})
  end

  return build_segment(segments)
end
