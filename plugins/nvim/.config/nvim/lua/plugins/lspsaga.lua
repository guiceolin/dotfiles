local saga = require 'lspsaga'

local server_map = {}
server_map['jdt.ls'] = {'java'}

saga.init_lsp_saga({
  server_filetype_map = server_map 
})
