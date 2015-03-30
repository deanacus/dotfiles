" Turn on syntax highlighting
syntax on

au BufRead,BufNewFile *.md set filetype=markdown

set encoding=utf-8
set hidden
set backspace=indent,eol,start
set textwidth=72
set wrap
set linebreak
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set scrolloff=8         "Start scrolling when we're 8 lines away from
set sidescrolloff=15
set sidescroll=1
set ruler
set laststatus=2

""" FocusMode
function! ToggleFocusMode()
	if (&foldcolumn != 12)
		set laststatus=0
		set numberwidth=10
		set foldcolumn=12
		set noruler
		hi FoldColumn ctermbg=none
		hi LineNr ctermfg=0 ctermbg=none
		hi NonText ctermfg=0
	else
		set laststatus=2
		set numberwidth=4
		set foldcolumn=0
		set ruler
	endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>
