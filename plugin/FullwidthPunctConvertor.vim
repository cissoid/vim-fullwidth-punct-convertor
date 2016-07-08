" File Name: FullwidthPunctConvertor.vim
" Author: cissoid
" Created At: 2016-07-08T10:43:48+0800
" Last Modified: 2016-07-08T11:12:02+0800
scriptencoding utf-8

if exists("g:loaded_fullwidth_punct_convertor")
    finish
endif
let g:loaded_fullwidth_punct_convertor = 1

if !exists('g:fullwidth_punct_convertor_maps')
    let g:fullwidth_punct_convertor_maps = [
        \ FullwidthPunctConvertor#GenPunctMap('，', ','),
        \ FullwidthPunctConvertor#GenPunctMap('。', '.'),
        \ FullwidthPunctConvertor#GenPunctMap('？', '?'),
        \ FullwidthPunctConvertor#GenPunctMap('、', ','),
        \ FullwidthPunctConvertor#GenPunctMap('！', '!'),
        \ FullwidthPunctConvertor#GenPunctMap('；', ';'),
        \ FullwidthPunctConvertor#GenPunctMap('：', ':'),
        \ FullwidthPunctConvertor#GenPunctMap('（', '(', ' ', ''),
        \ FullwidthPunctConvertor#GenPunctMap('）', ')'),
        \ FullwidthPunctConvertor#GenPunctMap('【', '[', ' ', ''),
        \ FullwidthPunctConvertor#GenPunctMap('】', ']'),
        \ FullwidthPunctConvertor#GenPunctMap('“', '"', ' ', ''),
        \ FullwidthPunctConvertor#GenPunctMap('”', '"'),
        \ FullwidthPunctConvertor#GenPunctMap('‘', "'", ' ', ''),
        \ FullwidthPunctConvertor#GenPunctMap('’', "'"),
        \ ]
endif

if !exists('g:fullwidth_punct_convertor_trim_space')
    let g:fullwidth_punct_convertor_trim_space = 1
endif

command! -range FullwidthPunctConvert <line1>,<line2>call FullwidthPunctConvertor#Convert()
