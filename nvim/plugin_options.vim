" vim: set et sw=2:

" Shougo/dein.vim

" AndrewRadev/linediff.vim
let g:linediff_buffer_type = 'scratch'
let g:linediff_first_buffer_command = 'leftabove new'
let g:linediff_second_buffer_command = 'rightbelow vnew'

" simnalamburt/vim-mundo
let g:mundo_preview_bottom=1

" haya14busa/incsearch.vim

" bkad/CamelCaseMotion

" cohama/lexima.vim

" tpope/vim-unimpaired

" triglav/vim-visual-increment

" Shougo/unite.nvim
call unite#custom#source('buffer,line,window,mapping,grep', 'matchers', 'matcher_fuzzy')
call unite#custom#profile('default', 'context', { 'start_insert': 1, 'split': 0 })
let g:unite_source_line_enable_highlight = 1
"let g:unite_source_grep_command = 'rg'
"let g:unite_source_grep_default_opts = '--follow --nogroup --nocolor --column'
"let g:unite_source_grep_default_opts = '--hidden --no-heading --vimgrep -S'
"let g:unite_source_grep_recursive_opt = ''

" tpope/vim-git

" tpope/vim-fugitive

" Completion
let g:deoplete#enable_at_startup = 0
let g:deoplete#disable_auto_complete = 1
call deoplete#custom#set('_', 'matchers', ['matcher_head'])
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std = { 'cpp': 'c++14' }
" autodetect clang complete database
" do not open scratch buffer

" openscad.vim

" kelwin/vim-smali

