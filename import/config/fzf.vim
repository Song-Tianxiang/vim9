vim9script

g:fzf_layout = {
    up: '60%',
}

augroup fzf
    au!
    au FileType fzf set laststatus=0 noshowmode noruler
        | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

g:fzf_history_dir = '~/.local/state/vim/fzf-history'

import autoload "loadconfig.vim"

# help functions
def PlugEdit()
    var list = loadconfig.PlugList()
    g:fzf#run(g:fzf#wrap({'source': list, 'sink': 'PlugConfig'}))
enddef

if !hasmapto('<Plug>FzfPlugedit;')
    map <unique> <Leader>fp <Plug>FzfPlugedit;
endif
nnoremap <unique> <script> <Plug>FzfPlugedit; <SID>PlugEdit

nnoremap <SID>PlugEdit :call <SID>PlugEdit()<CR>



# buffer list
def Buffers()
    var list = map(getbufinfo()->filter("v:val.listed && v:val.name != ''"), "v:val.name")
    g:fzf#run(g:fzf#wrap({'source': list, 'sink': 'e'}))
enddef

if !hasmapto('<Plug>FzfBuffers;')
    map <unique> <Leader>fb <Plug>FzfBuffers;
endif
nnoremap <unique> <script> <Plug>FzfBuffers; <SID>Buffers

nnoremap <SID>Buffers :call <SID>Buffers()<CR>


# mappings
nnoremap <Leader>fc :FZF ~/.vim<CR>
nnoremap <Leader>ff :FZF <CR>


