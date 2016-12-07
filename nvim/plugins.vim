" vim: set et sw=2:

set runtimepath+=~data/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~data/dotfiles/nvim/dein')

" dein
call dein#add('Shougo/dein.vim')

" libs
call dein#add('kana/vim-operator-user')

" Vim miscellaneous
call dein#add('AndrewRadev/linediff.vim')
call dein#add('simnalamburt/vim-mundo')
call dein#add('haya14busa/incsearch.vim')

" Code movement and editing
call dein#add('bkad/CamelCaseMotion')
call dein#add('cohama/lexima.vim')
" godlygeek/tabular
" osyo-manga/vim-anzu / vim-indexed-search
" ! rhysd/vim-clang-format
" terryma/vim-multiple-cursors
call dein#add('tpope/vim-unimpaired')
call dein#add('triglav/vim-visual-increment')
call dein#add('Uroc327/vim-numbertoggle')
" osyo-manga/vim-snowdrop
" libclang-vim/libclang-vim

" Browsing
call dein#add('Shougo/unite.vim')
"call dein#add('Shougo/denite.nvim')

" Git
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-fugitive')

" Completion and building
" neomake/neomake
" Shougo/neoinclude.vim
" Shougo/neosnippet.vim

" Completion
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neco-syntax')
call dein#add('Shougo/neco-vim')
call dein#add('zchee/deoplete-clang')
call dein#add('zchee/deoplete-zsh')

" Shell
" Shougo/Vimshell.vim

" Hex editor
" Shougo/vinarise.vim

" Debugging
" critiqjo/lldb.nvim

" daeyun/vim-matlab

" Highlighting
call dein#add('openscad.vim')
call dein#add('kelwin/vim-smali')

" star search for visual block
" shift star search for regex-or addition
" tagbar (using unite?)
" jump to definition, declaration, reference
" when showing undo tree, dim all non-related buffers
" toggling relative numbers per buffer

call dein#end()

