syntax on                                     " Enable syntax highlighting.
set number                                    " show line numbers
set numberwidth=5                             " Make the number column wider

set display =lastline                         " Show as much as possible of the last line.
set showmode                                  " Show current mode in command-line.
set showcmd                                   " Show already typed keys when more are expected.
set laststatus=0                              " Never show statusline.
set term=xterm-256color                       " terminal type
set mouse=a                                   " enable mouse support

set hidden                                    " Switch between buffers without having to save first.

set termguicolors                             " enable true colors support
set scrolloff=999                             " center cursor position vertically
set showmatch                                 " show matching brackets
set showbreak=¬\                              " Wrapping character
set list                                      " show whitespace
set listchars=eol:¬\,space:·,tab:•\           " whitespace characters
set nowrap                                    " disable wrapping

colorscheme horizon                           " Horizon ColorScheme
hi! SpecialKey ctermbg=NONE guibg=NONE        " Don't make unicode have a pink bg
