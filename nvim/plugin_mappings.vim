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

" Shougo/denite.vim
map <F2> :<C-u>Denite buffer<CR>
map <S-S> :split<CR><F2>
map <M-s> :rightbelow vsplit<CR><F2>
map <Leader><F2> :exec 'Denite -mode=normal -input=' . expand('%:t:r') . ' buffer'<CR>
map <Leader>g/ :<C-u>Denite grep<CR>
map <Leader><Leader>/ :<C-u>Denite line<CR>
" map <Leader><Leader>m :<C-u>Denite mapping<CR> (with fuzzy matcher)

call denite#custom#map('insert', '<Esc>',   '<denite:enter_mode:normal>')
call denite#custom#map('insert', '<C-Bs>',  '<denite:quit>')
call denite#custom#map('insert', '<Tab>',   '<denite:move_to_next_line>')
call denite#custom#map('insert', '<S-Tab>', '<denite:move_to_previous_line>')

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

