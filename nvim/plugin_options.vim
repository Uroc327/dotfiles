" vim: set et sw=2:

" Shougo/dein.vim

" AndrewRadev/linediff.vim
let g:linediff_buffer_type = 'scratch'
let g:linediff_first_buffer_command = 'leftabove new'
let g:linediff_second_buffer_command = 'rightbelow vnew'

" simnalamburt/vim-mundo
let g:mundo_preview_bottom = 1

" haya14busa/incsearch.vim

" bkad/CamelCaseMotion

" cohama/lexima.vim

" tpope/vim-unimpaired

" triglav/vim-visual-increment

" jungeunn/goyo.vim
let g:goyo_width = 180

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

" Shougo/denite.vim
call denite#custom#source('buffer,line,grep', 'matchers', ['matcher_fuzzy'])
call denite#custom#option('default', 'split', 'no')
call denite#custom#option('default', 'highlight_mode_insert', 'Search')
call denite#custom#option('default', 'highlight_mode_normal', 'Search')
call denite#custom#option('line', 'auto_highlight', v:true)
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-g!submodules/girolink-spa'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" tpope/vim-git

" tpope/vim-fugitive

" Completion
let g:deoplete#enable_at_startup = 0
let g:deoplete#disable_auto_complete = 1
call deoplete#custom#set('_', 'matchers', ['matcher_head'])
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std = { 'cpp': 'c++14' }
" detect clang complete database
" do not open scratch buffer

" openscad.vim

" kelwin/vim-smali

