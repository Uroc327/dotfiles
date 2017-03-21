" vim: set et sw=2:

" Shougo/dein.vim

" AndrewRadev/linediff.vim

" simnalamburt/vim-mundo
map <F8> :MundoToggle<CR>
map <S-F8> :MundoRenderGraph<CR>

" haya14busa/incsearch.vim
map <expr> / incsearch#go({'command': '/', 'is_stay': '1'})
map <expr> ? incsearch#go({'command': '?', 'is_stay': '1'})

" bkad/CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<Leader>')

" cohama/lexima.vim

" tpope/vim-unimpaired
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" triglav/vim-visual-increment
vmap <C-a> <Plug>VisualIncrement \| gv
vmap <C-x> <Plug>VisualDecrement \| gv

" Uroc327/vim-number-toggle
let g:NumberToggleTrigger = '<Leader>n'

" Shougo/unite.nvim
map <F2> :<C-u>Unite buffer window<CR>
map <S-S> :split<CR><F2>
map <M-s> :rightbelow vsplit<CR><F2>
map <M-F2> :<C-u>Unite tab<CR>
map <Leader><F2> :exec 'Unite -no-start-insert -input=' . expand('%:t:r') . ' buffer window'<CR>
map <Leader>g/ :<C-u>Unite grep:.<CR>
map <Leader># :<C-u>Unite line<CR>
map <Leader><Leader>m :<C-u>Unite mapping<CR>
function! s:unite_mappings()
  nmap <buffer> <Esc>   <Plug>(unite_exit)
  imap <buffer> <C-Bs>  <Plug>(unite_exit)
  imap <buffer> <Tab>   <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
endfunction
au FileType unite call s:unite_mappings()

" sources:
" - grep
" - outline
" - build/lint errors
" - sessions
" - markers
" - git
" - mappings

" tpope/vim-git

" tpope/vim-fugitive

" Completion
"inoremap <silent><expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
"inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<Tab>'
"inoremap <silent><expr> <C-Space> deoplete#manual_complete()
"inoremap <silent><expr> <Cr> pumvisible() ? deoplete#close_popup() : '<C-g>u<Cr>'
"inoremap <silent><expr> <Esc> pumvisible() ? '<C-e>u' : '<Esc>'

" openscad.vim

" kelwin/vim-smali

