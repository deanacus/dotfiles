call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() --all } }
Plug 'junegunn/fzf.vim'
call plug#end()
