"" Using fzf to find files
""nnoremap <leader>t :GFiles<cr>

"" Using fzf to open bufffers
"nnoremap <leader>b :Buffers<CR>

"" Using fzf to find tags (mnemonics for methods)
"nnoremap <leader>m :Tags<CR>
"nnoremap <leader>/ :BLines<CR>

"nnoremap <silent> <leader>t :call Fzf_dev()<CR>

"" SHAMELESS inspired from https://gist.github.com/danmikita/d855174385b3059cd6bc399ad799555e

"" ripgrep
"if executable('rg')
"  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"  set grepprg=rg\ --vimgrep
"  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif

"" Files + devicons
"function! Fzf_dev()
"  let l:fzf_files_options = '--ansi --preview "bat --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

"  function! s:files()
"    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"    return s:prepend_icon(l:files)
"  endfunction

"  function! s:prepend_icon(candidates)
"    let l:result = []
"    for l:candidate in a:candidates
"      let l:filename = fnamemodify(l:candidate, ':p:t')
"      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"      call add(l:result, printf('%s %s', l:icon, l:candidate))
"    endfor

"    return l:result
"  endfunction

"  function! s:edit_file(item)
"    let l:pos = stridx(a:item, ' ')
"    let l:file_path = a:item[pos+1:-1]
"    execute 'silent e' l:file_path
"  endfunction

"  call fzf#run({
"      \ 'source': <sid>files(),
"      \ 'sink':   function('s:edit_file'),
"      \ 'options': '-m --preview-window "right:60%" ' . l:fzf_files_options,
"      \ 'up':    '90%',
"      \ 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } })
"endfunction
