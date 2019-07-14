set nocompatible
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set number
set relativenumber
set expandtab
set smartindent
set tabstop=4
set shiftwidth=4
set cindent
set autoindent

set encoding=utf-8

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'
Plug 'w0rp/ale'

call plug#end()
let g:deoplete#enable_at_startup = 1

set foldmethod=indent
set foldlevel=99

nnoremap <space> za
