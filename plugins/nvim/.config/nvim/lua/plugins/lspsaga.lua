local saga = require 'lspsaga'

local server_map = {}
server_map['jdt.ls'] = {'java'}

saga.init_lsp_saga({
  server_filetype_map = server_map,
  code_action_prompt = {
   enable = true,
   sign = true,
   sign_priority = 20,
   virtual_text = false,
 },
})
