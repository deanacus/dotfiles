syntax on                                     " Enable syntax highlighting.
set number                                    " show line numbers
set numberwidth=5                             " Make the number column wider

set display =lastline                         " Show as much as possible of the last line.
set showmode                                  " Show current mode in command-line.
set showcmd                                   " Show already typed keys when more are expected.
set laststatus=0                              " Never show statusline.

set hidden                                    " Switch between buffers without having to save first.

set scrolloff=999                             " center cursor position vertically
set showmatch                                 " show matching brackets
set showbreak=¬\                              " Wrapping character
set list                                      " show whitespace
set listchars=eol:¬,space:·,tab:⇥\            " whitespace characters
set nowrap                                    " disable wrapping

colorscheme ayu
let ayucolor="dark"                          " for dark version of theme
set termguicolors                             " enable true colors support
