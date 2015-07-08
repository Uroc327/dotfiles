" vim: set et sw=2:

" gmarik/Vundle.vim

" Gundo
map <F8> :GundoToggle<CR>
map <S-F8> :GundoRenderGraph<CR>

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

" bkad/CamelCaseMotion

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

