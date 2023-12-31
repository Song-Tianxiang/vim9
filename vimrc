vim9script

unlet! g:skip_defaults_vim
source $VIMRUNTIME/defaults.vim
#-----------------------------

import "options.vim"
import "mappings.vim"
import "highlight.vim"

import autoload "bootstrap.vim"
var vim_plug_path = '~/.vim/pack/plugin-manager/start/vim-plug/autoload'
if empty(glob(vim_plug_path))
	bootstrap.VimPlug(vim_plug_path)
endif

import "plugins.vim"

