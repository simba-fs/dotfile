syntax on

set showcmd
" blue      default  desert   evening   koehler  murphy  peachpuff  ron    slate  zellner
" darkblue  delek    elflord  industry  morning  pablo   README.txt     shine  torte javascript
colorscheme koehler
set nu
set tabstop=4
set shiftwidth=4
set autoindent
set nowrap

so ~/.vim/plugin.vim
"au VimEnter *  NERDTree

" set fileencodings=utf8,big5,gbk,latin1
" set fileencoding=big5
" set <C-u>=^U
" set <C-b>=^B
" map <C-u> :set fileencoding=utf8
" map <C-b> :set fileencoding=big5

"YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/the path/to/your/.ycm_extra_conf.py'

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_complete_in_strings = 1

"make lightline work in single screen
set laststatus=2

"set up for othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery, angularjs, angularui, angularuirouter'

"set for css autocomplete
" let g:ycm_semantic_triggers = {
"   \   'scss,sass,css': [ 're!^\s{4}', 're!:\s+' ],
"   \   'html': ['<', '"', '</', ' '],
"   \ }

" add by simba
map <tab> :s/^/\t
map <S-tab> :s/^\t/
nmap <F8> :TagbarToggle<CR>
nmap <F2> i#!/bin/bash
nmap <F3> :r! cat
nmap <F5> :NERDTreeToggle
nmap <C-s> :w
nmap <S-@> :%s/  /\t/g
nmap <C-b> :!bash

au BufReadPost *.ejs set syntax=html
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5
set <C-u>=^U
set <C-b>=^B
map <C-u> :set fileencoding=utf8
map <C-b> :set fileencoding=big5
