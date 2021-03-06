let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


"let g:startify_session_autoload = 1
"let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:startify_bookmarks = [
            \ { 'i': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ { 'd': '~/dotfiles'},
            \ { 'v': '~/.vim'},
            \ { 'p': '~/.vim/.vimrc-vundle'}
            \ ]

let g:startify_enable_special = 0
