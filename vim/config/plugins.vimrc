" Install VimPlug if it doesn't exist

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * source $MYVIMRC
endif

if has('nvim')
  if (empty(glob('~/.config/nvim/autoload/plug.vim')))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * source $MYVIMRC
  endif
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs.vim'
call plug#end()

" Automatically install missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | q
endif
