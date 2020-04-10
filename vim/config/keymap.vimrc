" =============================================== "
" Keymappings                                     "
" =============================================== "

" Leader key
let mapleader=','

" Clear search by typing `,,`
nnoremap <leader>, :let @/=''<CR>:noh<CR>|

" convert tabs to spaces and reindent with `,r`
nnoremap <silent> <leader>r :retab<CR> gg=G

" Make Ctrl + s save files, even though it shouldn't
nnoremap <silent> <C-s> :w<CR>

" toggle wrapping with `,w`
nnoremap <silent> <leader>w :set wrap! wrap?<CR>|

" toggle NerdTree with Ctrl+b
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>

"nnoremap <Up>    :resize +2<CR>
"nnoremap <Down>  :resize -2<CR>
"nnoremap <Left>  :vertical resize +2<CR>
"nnoremap <Right> :vertical resize -2<CR>

" Things I'm not sure I want yet

" delete commented/blank lines
" nnoremap <leader># :g/\v^(#\|$)/d_<CR>|

" show/select buffer
" nnoremap <leader>b :ls<CR>:buffer<space>|

" show diff
" nnoremap <leader>d :w !diff % -<CR>|

" toggle list (special chars)
nnoremap <leader>l :set list! list?<CR>|

" toggle line numbers
" nnoremap <leader>n :set invnumber number?<CR>|

" toggle paste mode
" nnoremap <leader>p :set invpaste paste?<CR>|

" reload .vimrc
" nnoremap <leader>s :source $MYVIMRC<CR>|

" trim whitespace
" nnoremap <silent> <leader>t :%s/\s\+$//e<CR>|
