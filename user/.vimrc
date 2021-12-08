" Behave not Vi compatible
set nocp

" Set colorscheme
colorscheme default

" set number of lines to scroll
set scr=12

" wrap long lines
set wrap

" Display line offset relative to the current line
set relativenumber
" Display line number from BOF on current line
set number

" Turn on the wild menu (command line completition)
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Display cursor position
set ruler

" Display incomplete commands
set showcmd

" Command bar height
set cmdheight=1

" Remove white-space
set backspace=indent,eol,start

" Keep 200 commands in history
set history=200

" remove wait delay (for escape sequence) when typing Esc
set ttimeout
set ttimeoutlen=0

" Display search match patterns halfway through typing it
set incsearch

" Enable syntax
syntax on

" Indent based on file type
filetype plugin indent on

" Use plugins based on file type
filetype plugin on

" Use '%' to jump to matching html tags
packadd! matchit

" Highlight spelling mistakes
set spell

" Set spell languages
set spl=en

" Methods used to suggest corrections
set sps=best

" Number of spaces a tab does
set ts=4

" Number of spaces used for each step of auto indent
set sw=4

" do clever auto indenting
set si
