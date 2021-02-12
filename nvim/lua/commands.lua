-- -- cnoreabbrev w!! w !sudo tee > /dev/null %|    write file with sudo

-- -- Automaticaly close nvim if NERDTree is only thing left open
-- autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

-- command! -bang -nargs=* Rg
--   \ call fzf#vim#grep(
--   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
--   \   fzf#vim#with_preview(), <bang>0)


-- function! ShowFloater()
--   let buf = nvim_create_buf(v:false, v:true)
--   call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
--   let opts = {'relative': 'cursor', 'width': 10, 'height': 2, 'col': 0, 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
--   let win = nvim_open_win(buf, 0, opts)
--   -- optional: change highlight, otherwise Pmenu is used
--   call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
-- endfunction

-- -- Turning off the stuff in NERDTree that annoys me
-- function! NERDtreeUISettings()
--   if bufname() =~ 'NERD_tree'
--     set signcolumn=no
--     set noshowmode
--     set noruler
--     set nonumber
--   endif
-- endfunction

-- autocmd BufWinEnter * call NERDtreeUISettings()

-- -- My simple little Prettier formatting setup.
-- function! PrettifyOnSave()
--   if filereadable(glob("./node_modules/.bin/prettier"))
--     execute 'silent !./node_modules/.bin/prettier --write %'
--   endif
-- endfunction

-- function! RunPrettify()
--   if filereadable(glob("./node_modules/.bin/prettier"))
--     execute 'silent !./node_modules/.bin/prettier --write %'
--   else
--     -- echoe "No prettier found in . getcwd()
--   endif
-- endfunction

-- -- autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx call PrettifyOnSave()

-- autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx call PrettifyOnSave()

-- command! Prettify call RunPrettify()
