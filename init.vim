set nocompatible
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set number
set expandtab
set smartindent

set tabstop=4
set shiftwidth=4

set cindent
set autoindent

set undofile
set undodir=~/.vimundo

set encoding=utf-8

call plug#begin('~/.local/share/nvim/plugged')

call plug#end()
let g:deoplete#enable_at_startup = 1

set foldmethod=syntax
set foldlevel=99

set timeoutlen=1000 ttimeoutlen=0

nnoremap <space> za
