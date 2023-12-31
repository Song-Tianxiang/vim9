vim9script

export def Warn(msg: string)
    redraw
    echohl WarningMsg
    echomsg msg
    echohl None
enddef

export def ShellCall(args: string)
	var output = system(args)
	if v:shell_error != 0
        Warn($"   命令失败 {output}")
	endif
enddef
