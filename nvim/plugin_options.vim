" vim: set et sw=2:

" Shougo/dein.vim

" AndrewRadev/linediff.vim
let g:linediff_buffer_type = 'scratch'
let g:linediff_first_buffer_command = 'leftabove new'
let g:linediff_second_buffer_command = 'rightbelow vnew'

" simnalamburt/vim-mundo
let g:mundo_preview_bottom = 1

" haya14busa/incsearch.vim

" jremmen/vim-ripgrep
let g:rg_command = 'rg --vimgrep -i'

" bkad/CamelCaseMotion

" cohama/lexima.vim

" sbdchd/neoformat
let g:neoformat_enabled_haskell = ['hfmt']

" tpope/vim-unimpaired

" triglav/vim-visual-increment

" jungeunn/goyo.vim
let g:goyo_width = 150

" junegunn/limelight.vim
function! s:goyo_enter()
  colorscheme seoul256
  set noshowmode
  set noshowcmd
  Limelight
endfunction

function! s:goyo_leave()
  Limelight!
  set showcmd
  set showmode
  colorscheme smyck_custom
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" lervag/vimtex
let g:vimtex_enabled = 1
let g:vimtex_mappings_enabled = 0
let g:vimtex_imaps_enabled = 0
let g:vimtex_format_enabled = 1
let g:vimtex_quickfix_method = 'pplatex'
let g:vimtex_compiler_latexmk = {
  \ 'backend': 'nvim',
  \ 'background': 1,
  \ 'build_dir': 'out/vim',
  \ 'callback': 1,
  \ 'continuous': 0,
  \ 'executable': 'latexmk',
  \ 'options': [
  \   '-xelatex',
  \   '-synctex=1',
  \   '-interacton=nonstopmode',
  \ ],
  \}

" Shougo/denite.vim
call denite#custom#option("_", {
  \ 'split': 'no',
  \ 'start_filter': 'true',
  \ })
call denite#custom#source('_', 'matchers', ['matcher/fuzzy'])
call denite#custom#var('grep', {
  \ 'command': ['rg'],
  \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': ['--regexp'],
  \ 'separator': ['--'],
  \ 'final_opts': [],
  \ })

" [old] hi Search for selected line:
" call denite#custom#option('default', 'highlight_mode_insert', 'Search')
" call denite#custom#option('default', 'highlight_mode_normal', 'Search')

" tpope/vim-git

" tpope/vim-fugitive

" Completion
"CocInstall coc-clangd
"CocInstall coc-git
"CocInstall coc-json
"CocInstall coc-python
"CocInstall coc-texlab
"CocInstall coc-vimlsp

" daeyun/vim-matlab
let g:matlab_auto_mappings = 0

" openscad.vim

" kelwin/vim-smali

" neovimhaskell/haskell-vim
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
