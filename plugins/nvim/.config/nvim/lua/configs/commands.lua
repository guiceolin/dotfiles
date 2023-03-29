vim.cmd [[
"" Clear all buffs except current one
command! BufOnly silent! execute "%bd|e#|bd#"
]]
