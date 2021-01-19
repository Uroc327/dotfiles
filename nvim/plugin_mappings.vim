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
nnoremap <Leader><Leader>F :<C-u>Neoformat<CR>
"autocmd FileType c                  vnoremap <buffer> <Leader>F :Neoformat! c<CR>
"autocmd FileType cpp                vnoremap <buffer> <Leader>F :Neoformat! cpp<CR>
"autocmd Filetype kotlin             vnoremap <buffer> <Leader>F :Neoformat! kotlin<CR>
"autocmd Filetype proto              vnoremap <buffer> <Leader>F :Neoformat! proto<CR>

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
map <Leader><F2> :exec 'Denite -start-filter=false -input=' . expand('%:t:r') . ' buffer'<CR>
map <Leader>g/ :<C-u>Denite grep<CR>
map <Leader><Leader>/ :<C-u>Denite line<CR>
" map <Leader><Leader>m :<C-u>Denite mapping<CR> (with fuzzy matcher)

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <F2> denite#do_map('quit')
  inoremap <silent><buffer><expr> <F2> denite#do_map('quit')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')

  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <S-Esc> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')

  nnoremap <silent><buffer><expr> <F2> denite#do_map('quit')
  inoremap <silent><buffer><expr> <F2> denite#do_map('quit')
endfunction

" [old]
"call denite#custom#map('insert', '<Esc>',   '<denite:enter_mode:normal>')
"call denite#custom#map('insert', '<S-Esc>', '<denite:quit>')
"call denite#custom#map('insert', '<C-Bs>',  '<denite:quit>')
"call denite#custom#map('insert', '<Tab>',   '<denite:move_to_next_line>')
"call denite#custom#map('insert', '<S-Tab>', '<denite:move_to_previous_line>')
" <Leader>s -> toggle sorting between fullpath (default?) sorting and ftime,reverse sorting

" sources:
" - build/lint errors
" - sessions
" - markers
" - git

" tpope/vim-git

" tpope/vim-fugitive

" Building, linting and testing
map <F5> :Neomake!<CR>

" Completion

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ?  "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <C-Space> to trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Refactoring
nmap <silent> <Leader>rn <Plug>(coc-rename)

" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help', 'fstab'], &filetype) >= 0)
    normal! K
  else
    call CocAction('doHover')
  endif
endfunction

" daeyun/vim-matlab
"autocmd FileType matlab map <silent> <buffer> <F5>   :w<CR>:MatlabCliRunFile<CR>
autocmd FileType matlab map <silent> <buffer> <S-F5> :MatlabCliRunLine<CR>
autocmd FileType matlab map <silent> <buffer> <F6>   :MatlabCliHelp<CR>


" openscad.vim

" kelwin/vim-smali

