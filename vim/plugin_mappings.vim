" vim: set et sw=2:

" VundleVim/Vundle.vim

" Gundo
map <F8> :GundoToggle<CR>
map <S-F8> :GundoRenderGraph<CR>

" haya14busa/incsearch.vim
map <expr> / incsearch#go({'command': '/', 'is_stay': '1'})
map <expr> ? incsearch#go({'command': '?', 'is_stay': '1'})

" matchit.zip

" AndrewRadev/linediff.vim

" tpope/vim-git

" tpope/vim-fugitive

" tpope/vim-unimpaired
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" Raimondi/delimitMate

" triglav/vim-visual-increment
vmap <C-a> <Plug>VisualIncrement \| gv
vmap <C-x> <Plug>VisualDecrement \| gv

" bkad/CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<Leader>')

" jlanzarotta/bufexplorer
map <silent> <F2> :BufExplorer<CR>
map <S-S> :split<CR>:BufExplorer<CR>
map <M-s> :vsplit<CR><C-w><right>:BufExplorer<CR>

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Uroc327/vim-numbertoggle
let g:NumberToggleTrigger = '<Leader>n'

" openscad.vim

