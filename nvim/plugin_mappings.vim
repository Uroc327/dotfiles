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

" sbdchd/noeformat
autocmd FileType c,cpp nnoremap <buffer> <Leader><Leader>F :<C-u>Neoformat<CR>
autocmd FileType c     vnoremap <buffer> <Leader>F :NeoFormat! c
autocmd FileType cpp   vnoremap <buffer> <Leader>F :NeoFormat! cpp

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

" lervag/vimtex
autocmd FileType tex,latex,bib map <silent> <buffer> <S-F7> :<C-u>VimtexCompile<CR>

" Shougo/denite.vim
map <F2> :<C-u>Denite buffer<CR>
map <S-S> :split<CR><F2>
map <M-s> :rightbelow vsplit<CR><F2>
map <Leader><F2> :exec 'Denite -mode=normal -input=' . expand('%:t:r') . ' buffer'<CR>
map <Leader>g/ :<C-u>Denite grep<CR>
map <Leader><Leader>/ :<C-u>Denite line<CR>
" map <Leader><Leader>m :<C-u>Denite mapping<CR> (with fuzzy matcher)

call denite#custom#map('normal', '<F2>',    '<denite:quit>')
call denite#custom#map('insert', '<F2>',    '<denite:quit>')
call denite#custom#map('insert', '<Esc>',   '<denite:enter_mode:normal>')
call denite#custom#map('insert', '<S-Esc>', '<denite:quit>')
call denite#custom#map('insert', '<C-Bs>',  '<denite:quit>')
call denite#custom#map('insert', '<Tab>',   '<denite:move_to_next_line>')
call denite#custom#map('insert', '<S-Tab>', '<denite:move_to_previous_line>')
" <Leader>s -> toggle sorting between fullpath (default?) sorting and ftime,reverse sorting

" sources:
" - build/lint errors
" - sessions
" - markers
" - git

" tpope/vim-git

" tpope/vim-fugitive

" Completion
inoremap <silent><expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
inoremap <silent><expr> <CR> pumvisible() ? '<C-y><CR>' : '<CR>'
inoremap <silent> <C-Space> <C-n>
inoremap <silent> <C-S-Space> <C-p>

" daeyun/vim-matlab
"autocmd FileType matlab map <silent> <buffer> <F5>   :w<CR>:MatlabCliRunFile<CR>
autocmd FileType matlab map <silent> <buffer> <S-F5> :MatlabCliRunLine<CR>
autocmd FileType matlab map <silent> <buffer> <F6>   :MatlabCliHelp<CR>


" openscad.vim

" kelwin/vim-smali

