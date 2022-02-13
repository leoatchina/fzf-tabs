" ============================================================================
" FileName: fzf_tabs.vim
" Author: leoatchina
" GitHub: https://github.com/leoatchina
" ============================================================================
function! fzf_tabs#tabs()
    if has('nvim')
        let tab_lst = split(execute('tabs'), '\n')
    else
        redir => reg
        silent tabs
        redir END
        let tab_lst = split(reg, '\n')
    endif
	let index = 0
    let lines = []
	while index < len(tab_lst)
	   let num   = matchstr(tab_lst[index], '\s\zs\d\{1,\}\ze')
       let line  = num . "\t" . tab_lst[index + 1][1:]
       let index = index + 2
       call add(lines, line)
	endwhile
    return lines
endfunction

function! fzf_tabs#select(select) abort
    let num = split(a:select, "\t")[0]
    call feedkeys(num . 'gt')
endfunction
