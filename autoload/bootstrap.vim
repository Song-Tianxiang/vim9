vim9script

import "utils/system.vim" as system

export def VimPlug(path: string = '~/.vim/pack/plugin-manager/start/vim-plug/autoload')
	var vim_plug_repo = 'https://github.com/junegunn/vim-plug.git'
	if empty(glob(path))
        system.Warn("  ⬇ 正在安装插件管理器 ...")
		system.ShellCall($"git clone --depth 1 {vim_plug_repo} {path}")
	endif
enddef
