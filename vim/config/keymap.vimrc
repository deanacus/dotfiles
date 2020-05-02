" =============================================== "
" Keymappings                                     "
" =============================================== "

" Leader key
let mapleader=','

" Clear search by typing `,,`
nnoremap <leader>, :let @/=''<CR>:noh<CR>|

" convert tabs to spaces and reindent with `,r`
nnoremap <silent> <leader><Tab> :retab<CR> gg=G

" Make Ctrl + s save files, even though it shouldn't
nnoremap <silent> <C-s> :w<CR>

" toggle wrapping with `,w`
nnoremap <silent> <leader>w :set wrap! wrap?<CR>|

" toggle NerdTree with Ctrl+b
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Indent line with ,] in normal mode
nnoremap <leader>] >>

" Unindent with ,[ in normal mode
nnoremap <leader>[ <<

" Unindent with Shift Tab in insert mode, too
inoremap <S-Tab> <esc><< gi

" Use <Home> to go to first non-blank char
nnoremap <Home> ^
inoremap <Home> <esc>^i

" List Buffers
nnoremap <silent> <leader>b :Buffers<CR>|

" List Files
nnoremap <silent> <leader>p :Files<CR>|

map <C-f> <esc>/|

" paste from normal mode (not quite working yet)
" the <A-v> isn't firing what I expect
nnoremap <leader>v :set paste<CR>i<A-^><esc>:set nopaste<CR>

nnoremap <C-/> <Plug>NERDCommenterToggle
"n  <C-/>       * <Plug>NERDCommenterToggle
"x  <C-/>       * <Plug>NERDCommenterToggle
"i  <C-/>       * <Plug>NERDCommenterToggle

" show/select buffer
nnoremap <leader>b :ls<CR>:buffer<space>|

" trim whitespace
nnoremap <silent> <leader>trim :%s/\s\+$//e<CR>|

" show diff
nnoremap <leader>d :w !diff % -<CR>|

" Move line up with alt/option up
nnoremap <M-Up> :m-2<CR>
inoremap <M-Up> <esc>:m-2<CR>i

" Move line down with alt/otion down
nnoremap <M-Down> :m+1<CR>
inoremap <M-Down> <esc>:m+1<cr>i

" Tab completion
" will insert tab at beginning of line, will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" function! InsertShiftTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>

" Things I'm not sure I want yet

" reload .vimrc
" nnoremap <leader>s :source $MYVIMRC<CR>|