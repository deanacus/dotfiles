" =============================================== "
" Keymappings                                     "
" =============================================== "

" Leader key
let mapleader=','

" Clear search by typing `,,`
nnoremap <leader>, :let @/=''<CR>:noh<CR>|

" convert tabs to spaces with `,r`
nnoremap <leader>r :retab<CR>|

" toggle wrapping with `.w`
nnoremap <leader>w :set wrap! wrap?<CR>|


" Things I'm not sure I want yet

" delete commented/blank lines
" nnoremap <leader># :g/\v^(#\|$)/d_<CR>|

" show/select buffer
" nnoremap <leader>b :ls<CR>:buffer<space>|

" show diff
" nnoremap <leader>d :w !diff % -<CR>|

" nnoremap <silent> <leader>i gg=G``<CR>|" fix indentation
" toggle list (special chars)
" nnoremap <leader>l :set list! list?<CR>|

" toggle line numbers
" nnoremap <leader>n :set invnumber number?<CR>|

" toggle paste mode
" nnoremap <leader>p :set invpaste paste?<CR>|

" reload .vimrc
" nnoremap <leader>s :source $MYVIMRC<CR>|

" trim whitespace
" nnoremap <silent> <leader>t :%s/\s\+$//e<CR>|