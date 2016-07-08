" File Name: FullwidthPunctConvertor.vim
" Author: cissoid
" Created At: 2016-07-08T10:43:27+0800
" Last Modified: 2016-07-08T11:30:02+0800
scriptencoding utf-8

function! s:Convert(start_line, end_line, from, to)
    let l:exec_line = a:start_line . ',' . a:end_line
    let l:execcmd = l:exec_line . 'substitute/\v\C' . a:from . '/' . a:to . '/g'
    silent! execute l:execcmd
endfunction

function! FullwidthPunctConvertor#GenPunctMap(src, dest, ...)
    let l:before = ''
    let l:after = ' '
    if a:0 >= 1
        let l:before = a:1
    endif
    if a:0 >= 2
        let l:after = a:2
    endif

    return {'src': a:src, 'dest': a:dest, 'before': l:before, 'after': l:after}
endfunction

function! FullwidthPunctConvertor#Convert() range
    if g:fullwidth_punct_convertor_trim_space
        for punct_map in g:fullwidth_punct_convertor_maps
            call s:Convert(a:firstline, a:lastline, '(^\s*)@<=' . punct_map['src'], punct_map['dest'] . punct_map['after'])
            call s:Convert(a:firstline, a:lastline, punct_map['src'] . '(\s*$)@=', punct_map['before'] . punct_map['dest'])
        endfor
    endif

    for punct_map in g:fullwidth_punct_convertor_maps
        call s:Convert(a:firstline, a:lastline, punct_map['src'], punct_map['before'] . punct_map['dest'] . punct_map['after'])
    endfor
endfunction
