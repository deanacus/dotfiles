cnoreabbrev w!! w !sudo tee > /dev/null %|    " write file with sudo

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" function! UseTabs()
"   set tabstop=4     " Size of a hard tabstop (ts).
"   set shiftwidth=4  " Size of an indentation (sw).
"   set noexpandtab   " Always uses tabs instead of space characters (noet).
"   set autoindent    " Copy indent from current line when starting a new line (ai).
" endfunction

" function! UseSpaces()
"   set tabstop=2
"   set shiftwidth=2
"   set expandtab
"   set softtabstop=2
"   set autoindent
"   set smarttab
" endfunction
