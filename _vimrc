source $VIMRUNTIME/vimrc_example.vim
set number
set relativenumber
set expandtab
set shiftwidth=2
set tabstop=2
set rtp+=%HOME%/bundle/vundle.vim
call vundle#begin()

set encoding=utf-8

Plugin 'VundleVim/Vundle.vim'
Plugin 'prettier/vim-prettier'
Plugin 'vim-syntastic/syntastic'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'pangloss/vim-javascript'
  

call vundle#end()
filetype plugin on 
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


" Folding

set foldmethod=indent
set foldlevel=99
nnoremap <space> za


" Javascript

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
