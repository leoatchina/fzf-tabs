" ============================================================================
" FileName: fzf-tabs.vim
" Author: leoatchina
" GitHub: https://github.com/leoatchina
" ============================================================================

command! FZFTabs call fzf#run(extend({
        \ 'source': fzf_tabs#tabs(),
        \ 'sink': function('fzf_tabs#select'),
        \ 'options': '--ansi -x --prompt "Tabs>"'
        \ }, g:fzf_layout), 0)
