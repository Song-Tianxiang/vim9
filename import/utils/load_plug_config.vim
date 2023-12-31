vim9script noclear

if exists("g:loaded_vim_plug_config")
    finish
endif
g:loaded_vim_plug_config = 1

if !exists("g:plugs")
    finish
endif

import autoload "loadconfig.vim" as plugconfig

extend(g:, {
    plug_config_autoload: 1,
    plug_config_edit_command: "tabnew",
    plug_config_dir: expand("~/.vim/import/config"),
}, 'keep')

if !isdirectory(g:plug_config_dir)
    mkdir(g:plug_config_dir, "p")
endif

if !exists(":PlugConfig")
    command -nargs=1 -complete=custom,plugconfig.Plugins
                \ PlugConfig plugconfig.EditConfig(<q-args>)
endif

if !exists(":PlugLoad")
    command -nargs=1 -complete=custom,plugconfig.Plugins
                \ PlugLoad plugconfig.LoadConfig(<q-args>)
endif

if !exists(":PlugLoadAll")
    command PlugLoadAll plugconfig.LoadConfigAll()
endif

if g:plug_config_autoload
    plugconfig.LoadConfigAll()
endif
