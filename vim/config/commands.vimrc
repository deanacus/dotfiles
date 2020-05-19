cnoreabbrev w!! w !sudo tee > /dev/null %|    " write file with sudo

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Turning off the stuff in NERDTree that annoys me
function! NERDtreeUISettings()
  if bufname() =~ 'NERD_tree'
    set signcolumn=no
    set noshowmode
    set noruler
    set nonumber
  endif
endfunction

autocmd BufWinEnter * call NERDtreeUISettings()