local setOpt = vim.api.nvim_set_option          -- Global options
local setBufOpt = vim.api.nvim_buf_set_option   -- Buffer options
local setWinOpt = vim.api.nvim_win_set_option   -- Window options

-- -- =============================================== --
-- -- Performance(?) Stuff                            --
-- -- =============================================== --

setOpt('lazyredraw', true)

-- =============================================== --
-- File Management                                 --
-- =============================================== --

-- -- disable backup/swap files
setOpt('swapfile', false)
setOpt('writebackup', false)

-- -- Where to keep the undo stuff
setOpt('undofile', true)

-- -- How many levels of undo to keep
setOpt('undolevels', 9999)

-- =============================================== --
-- Indentation                                     --
-- =============================================== --
setBufOpt(0, 'expandtab', true)
setBufOpt(0, 'autoindent', true)
setBufOpt(0, 'tabstop', 2)
setBufOpt(0, 'softtabstop', 2)
setBufOpt(0, 'shiftwidth', 2)
setOpt('shiftround', true)

-- =============================================== --
-- Number Column and Gutter                        --
-- =============================================== --
setWinOpt(0, 'number', true);
setWinOpt(0, 'numberwidth', 5)
setWinOpt(0, 'signcolumn', 'yes')
