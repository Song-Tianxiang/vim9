vim9script

# plugin declare start
g:plug#begin('~/.local/share/vim/plug')

# chinese doc
Plug 'yianwillis/vimcdoc'

# file explorer
Plug 'lambdalisue/fern.vim'

# fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

# auto pair
Plug 'LunarWatcher/auto-pairs'
#Plug 'cohama/lexima.vim'

# comment
Plug 'tpope/vim-commentary'

# lsp
Plug 'yegappan/lsp'

# snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

# deno runtime
# Plug 'vim-denops/denops.vim'

# completion
# Plug 'Shougo/ddc.vim'
# Plug 'Shougo/pum.vim'
# Plug 'Shougo/ddc-ui-pum'
# Plug 'Shougo/ddc-filter-sorter_rank'
# Plug 'Shougo/ddc-filter-matcher_head'
# 
# Plug 'uga-rosa/ddc-source-vsnip'
# Plug 'Shougo/ddc-source-around'

# align
# Plug 'junegunn/vim-easy-align'
# plugin declare end here
g:plug#end()

# vim-plug config
g:plug_window = 'tabnew'

# auto install missing plugin
augroup vim_plug
    au!
    au VimEnter * {
        if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) > 0
            PlugInstall --sync | source $MYVIMRC
        endif
    }
augroup END

# Load plugins configure
import "utils/load_plug_config.vim"

