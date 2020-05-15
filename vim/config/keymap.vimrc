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
inoremap <silent> <C-s> :w<CR>

" toggle wrapping with `,w`
nnoremap <silent> <leader>w :set wrap! wrap?<CR>|

" toggle NerdTree with Ctrl+b
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Indent line with ,] in normal mode
nnoremap <leader>] >>

" Unindent with ,[ in normal mode
nnoremap <leader>[ <<

" Use <Home> to go to first non-blank char
nnoremap <Home> ^
inoremap <Home> <esc>I

" Use H to go to <Home>
nnoremap H ^

" Use L to go to end
nnoremap L $

" List Buffers
nnoremap <silent> <leader>b :Buffers<CR>|

" List Files
nnoremap <silent> <leader>p :Files<CR>|

" paste from normal mode (not quite working yet)
" the <A-v> isn't firing what I expect
nnoremap <leader>v :set paste<CR>i<A-^><esc>:set nopaste<CR>

nnoremap <leader>/ :call NERDComment("n", "Toggle")<CR>
" inoremap <C-/> <Plug>NERDCommenterToggle
"n  <C-/>       * <Plug>NERDCommenterToggle
"x  <C-/>       * <Plug>NERDCommenterToggle
"i  <C-/>       * <Plug>NERDCommenterToggle

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

" Reload .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
