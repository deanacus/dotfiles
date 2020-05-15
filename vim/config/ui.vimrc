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
set laststatus=0
" Switch between buffers without having to save first.
set hidden

" center cursor position vertically
set scrolloff=999
" Add some side scrolling padding
set sidescrolloff=5

" Make folding work on syntax
set foldmethod=syntax

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
