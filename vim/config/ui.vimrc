" Enable syntax highlighting.
syntax on

" show line numbers
set number
" Make the number column wider
set numberwidth=5
" Always show the column for lint/format errors
set signcolumn=yes


" Show as much as possible of the last line.
set display =lastline
" Show current mode in command-line.
set showmode
" Never show statusline.
" set laststatus=0
" Switch between buffers without having to save first.
set hidden

set cmdheight=1
set laststatus=2

" center cursor position vertically
set scrolloff=999
" Add some side scrolling padding
set sidescrolloff=5

" Make folding work on syntax
set foldmethod=indent

" show matching brackets
set showmatch

" Define the whitespacve characters, for when I wanna see em
set listchars=eol:¬,space:·,tab:⇥\
" Wrapping character
set showbreak=¬\
" disable wrapping
set nowrap

" Use ayu dark
colorscheme ayu
let ayucolor="dark"
" enable true colors support
set termguicolors

" Unset the background color, cause I like what I've chose elsewhere
highlight Normal guibg=NONE ctermbg=NONE

set statusline=%1*\ %l\ of\ %L\ %2*
set statusline+=%=
set statusline+=%3*\ %f

hi statuslinenc ctermbg=0 ctermfg=0 guibg=#1D2433 guifg=#1D2433
hi signcolumn guibg=NONE ctermbg=NONE
hi user1 guibg=#FF7733 guifg=#1D2433
hi user2 ctermbg=NONE ctermfg=1 guibg=NONE guifg=#1D2433
hi user3 ctermbg=NONE ctermfg=1 guibg=#F07178 guifg=#1D2433