local setOpt = vim.api.nvim_set_option          -- Global options
local setBufOpt = vim.api.nvim_buf_set_option   -- Buffer options
local setWinOpt = vim.api.nvim_win_set_option   -- Window options

-- Show as much as possible of the last line.
setOpt('display','lastline')
-- Show current mode in command-line.
setOpt('showmode', true)
-- Never show statusline.
-- set laststatus=0
-- Switch between buffers without having to save first.
setOpt('hidden', true)

setOpt('cmdheight', 1)
setOpt('laststatus', 2)

-- center cursor position vertically
setOpt('scrolloff',999)
-- Add some side scrolling padding
setOpt('sidescrolloff',5)

-- Make folding work on syntax
setOpt('foldmethod', 'indent')

-- show matching brackets
setOpt('showmatch', true)

-- Define the whitespacve characters, for when I wanna see em
-- setOpt('listchars', 'eol:¬,space:·,tab:⇥')
-- Wrapping character
setOpt('showbreak', '¬')
-- disable wrapping
setOpt('wrap', false)

-- Use ayu dark
-- colorscheme ayu
-- let ayucolor="dark"
-- -- enable true colors support
setOpt('termguicolors', true)

-- Unset the background color, cause I like what I've chose elsewhere
-- highlight Normal guibg=NONE ctermbg=NONE

-- setOpt('statusline','%3* %f % %1* %l of %L %2*')

-- hi statuslinenc ctermbg=0 ctermfg=0 guibg=#1D2433 guifg=#1D2433
-- hi signcolumn guibg=NONE ctermbg=NONE
-- hi user1 guibg=#FF7733 guifg=#1D2433
-- hi user2 ctermbg=NONE ctermfg=1 guibg=NONE guifg=#1D2433
-- hi user3 ctermbg=NONE ctermfg=1 guibg=#F07178 guifg=#1D2433