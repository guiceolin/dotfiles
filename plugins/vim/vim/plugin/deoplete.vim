let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('buffer', 'rank', 9999)
call deoplete#custom#source('ultisnips', 'rank', 9998)

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

autocmd CompleteDone * pclose!
