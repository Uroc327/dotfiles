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
call denite#custom#source('buffer,line,grep', 'matchers', ['matcher_fuzzy'])
call denite#custom#option('default', 'split', 'no')
call denite#custom#option('default', 'highlight_mode_insert', 'Search')
call denite#custom#option('default', 'highlight_mode_normal', 'Search')
call denite#custom#option('line', 'auto_highlight', v:true)
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['-i', '--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" tpope/vim-git

" tpope/vim-fugitive

" Completion
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

"augroup my_cm_setup
"  autocmd!
"  autocmd User CmSetup call cm#register_source({
"        \ 'name' : 'vimtex',
"        \ 'priority': 8,
"        \ 'scoping': 1,
"        \ 'scopes': ['tex'],
"        \ 'abbreviation': 'tex',
"        \ 'cm_refresh_patterns': g:vimtex#re#ncm,
"        \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
"        \ })
"augroup END

" daeyun/vim-matlab
let g:matlab_auto_mappings = 0

" openscad.vim

" kelwin/vim-smali

