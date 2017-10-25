" vim: set et sw=2:

set runtimepath+=~data/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~data/dotfiles/nvim/dein')

" dein
call dein#add('Shougo/dein.vim')

" libs
call dein#add('kana/vim-operator-user')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" Vim miscellaneous
call dein#add('AndrewRadev/linediff.vim')
call dein#add('simnalamburt/vim-mundo')
call dein#add('haya14busa/incsearch.vim')
" vim-airline

" Code movement and editing
call dein#add('bkad/CamelCaseMotion')
call dein#add('cohama/lexima.vim')
" godlygeek/tabular
" osyo-manga/vim-anzu / vim-indexed-search
" ! rhysd/vim-clang-format
" terryma/vim-multiple-cursors
call dein#add('tpope/vim-unimpaired')
" tpope/vim-surround
call dein#add('triglav/vim-visual-increment')
call dein#add('Uroc327/vim-numbertoggle')
" osyo-manga/vim-snowdrop
" libclang-vim/libclang-vim
" sbdchd/neoformat
" welle/targets.vim

" writing
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')

" Browsing
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
"call dein#add('Shougo/denite.nvim')

" Git
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-fugitive')

" Building and linting
" neomake/neomake
" Shougo/neoinclude.vim
" Shougo/neosnippet.vim

" Completion
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neco-syntax')
" Shougo/neco-ghc
call dein#add('Shougo/neco-vim')
call dein#add('zchee/deoplete-clang')
call dein#add('zchee/deoplete-zsh')
" artur-shaik/vim-javacomplete2
" autozimu/LanguageClient-neovim

" Shell
" Shougo/Vimshell.vim

" Hex editor
" Shougo/vinarise.vim

" Debugging
" critiqjo/lldb.nvim

" daeyun/vim-matlab

" Highlighting
call dein#add('junegunn/seoul256.vim')
call dein#add('kelwin/vim-smali')
call dein#add('leafgarlang/typescript-vim')
call dein#add('vim-scripts/openscad.vim')

" star search for visual block
" shift star search for regex-or addition
" tagbar/outline (using unite?)
" jump to definition, declaration, reference
" when showing undo tree, dim all non-related buffers
" toggling relative numbers per buffer

call dein#end()

