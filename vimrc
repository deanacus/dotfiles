set rtp+=~/.local/share/nvim/site/autoload/plug.vim
call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'wycats/nerdtree'
Plug 'tpope/vim-markdown'
autocmd vimenter * NERDTree
call plug#end()

syntax on

au BufRead,BufNewFile *.md set filetype=markdown

set formatoptions+=t
set formatoptions-=l
set number
set ruler
set encoding=utf-8
set backspace=indent,eol,start
set textwidth=72
set wrap
set number
set linebreak
set nolist
set autoindent
set smartindent
set scrolloff=8         "Start scrolling when we're 8 lines away from
set termguicolors
set colorcolumn=80
set cursorline
let ayucolor="mirage"
colorscheme ayu
