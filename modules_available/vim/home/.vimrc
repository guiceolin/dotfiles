"showing statusline
set laststatus=2

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Navigation
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'ctrlp.vim'

" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Rykka/colorv.vim'

" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'itspriddle/vim-stripper'

" Automatic Helpers
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'

" Snippets
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'

" Language Additions
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'nanki/treetop.vim'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'

" Other Languages
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'hallison/vim-markdown'
Bundle 'groenewege/vim-less'

" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'
Bundle 'tomtom/tlib_vim'
Bundle 'mathml.vim'



"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l
"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

""""""""""""""" INTERFACE CONFIG """"""""""""""""
if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256
    colorscheme railscasts
    set guitablabel=%M%t
    set lines=40
    set columns=115
    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h14
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme railscasts
    else
        colorscheme default
    endif
endif

""""""""""""""""" SHORTCUTS """""""""""""""""
"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer( MiniBufExplorer )
nnoremap <leader>b :MiniBufExplorer<cr>

"map to Ctrlp style finder
nnoremap <leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]vendor[\/]',
  \ }

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


let ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}
