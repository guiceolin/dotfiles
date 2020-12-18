let g:bubbly_palette = #{
\   background: "#34343c",
\   foreground: "#c5cdd9",
\   black: "#3e4249",
\   red: "#ec7279",
\   green: "#a0c980",
\   yellow: "#deb974",
\   blue: "#6cb6eb",
\   purple: "#d38aea",
\   cyan: "#5dbbc1",
\   white: "#c5cdd9",
\   lightgrey: "#57595e",
\   darkgrey: "#404247",
\ }
 "lua _G.statusline = require('statusline.init')
 "augroup StatusLineBuilder
 "  autocmd!
 "  autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.statusline.active()
 "  autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.statusline.inactive()
 "augroup end
