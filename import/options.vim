vim9script

g:mapleader = ' '
g:maplocalleader = '\'

filetype indent plugin on

set termguicolors
set background=dark
colorscheme retrobox

set number
set cursorline
set cursorlineopt=number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set smartcase

set mouse+=a
set belloff=all
set wildoptions=fuzzy,pum,tagfile
set shortmess+=I
set fillchars+=eob:\ 
set fillchars+=vert:│
set hidden
set cmdheight=2

# set switchbuf=usetab,newtab
# set showtabline=2
# augroup open-tabs
#     au!
#     au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
# augroup end

# time out on key codes but not :mappings 
#set notimeout
#set ttimeout

# change cursor shape according to insert, replace, normal mode
# &t_SI = "\e[6 q"
# &t_SR = "\e[4 q"
# &t_EI = "\e[2 q"

# vim state dir
set undofile
set undodir=~/.local/state/vim/undo
set swapfile
set directory=~/.local/state/vim/swap
set viminfofile=~/.local/state/vim/viminfo

for item in [&undodir, &directory]
	if !isdirectory(expand(item))
		mkdir(expand(item), 'p')
	endif
endfor


