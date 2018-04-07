set number
set numberwidth=3
set nowrap
set listchars=extends:>,precedes:<

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

set statusline=
if (strlen(GitBranch()) > 0)
	set statusline+=\ %{GitBranch()}\ /
endif
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

colorscheme custom

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
