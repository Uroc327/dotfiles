" vim: set et sw=2:

let s:dein_path = '~data/appdata/' . $USER . '-nvim_dein'
exec 'set runtimepath+=' . s:dein_path . '/repos/github.com/Shougo/dein.vim'

" FIXME:
" - denite:
"   - screws up cursorline and list
"   - different highlight for Search group
"   - multiple denites open at the same time?
" - targets:
"   - argument text object screws up buffer
" - Goyo:
"   - work with splits

call dein#begin(s:dein_path)

" dein
call dein#add('Shougo/dein.vim')

" libs
call dein#add('kana/vim-operator-user')

" Vim miscellaneous
call dein#add('AndrewRadev/linediff.vim')
call dein#add('simnalamburt/vim-mundo')
call dein#add('haya14busa/incsearch.vim')
call dein#add('jremmen/vim-ripgrep')
" vim-airline
" vim-qf or QFEnter to place quickfix window under current split and open quickfix selection in correct window (current behavior: open quickfix under the bottom-right split and open quickfix selection in the window directly above)

" Text objects
call dein#add('wellle/targets.vim')
call dein#add('bkad/CamelCaseMotion')
call dein#add('vim-scripts/argtextobj.vim')

" Code movement and editing
call dein#add('cohama/lexima.vim')
call dein#add('sbdchd/neoformat')
call dein#add('tpope/vim-unimpaired')
"call dein#add('vim-abolish') handle multiple versions of the same word
call dein#add('triglav/vim-visual-increment')
call dein#add('Uroc327/vim-numbertoggle')
" godlygeek/tabular
" osyo-manga/vim-anzu / vim-indexed-search
" terryma/vim-multiple-cursors
" tpope/vim-surround
" osyo-manga/vim-snowdrop vs libclang-vim/libclang-vim with corresponding plugins
" chromatica.nvim / clighter / color_coded
" tpope/sleuth.vim or myint/indent-finder for automatically setting expandtab and shiftwidth
" sickill/vim-pasta

" writing
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')
"call dein#add('lervag/vimtex')

" Browsing
call dein#add('Shougo/denite.nvim')

" Git
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-fugitive')

" Building and linting
" neomake/neomake

" Completion
call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': 'bash install.sh' })
call dein#add('roxma/nvim-completion-manager')
call dein#add('Shougo/neco-vim')
" Shougo/neoinclude.vim
" Shougo/neosnippet.vim

" Shell
" Shougo/Vimshell.vim

" Hex editor
" Shougo/vinarise.vim

" Debugging
" critiqjo/lldb.nvim

" daeyun/vim-matlab

" Highlighting
call dein#add('gentoo/gentoo-syntax')
call dein#add('vim-scripts/openscad.vim')
call dein#add('junegunn/seoul256.vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('kelwin/vim-smali')

" star search for visual block
" shift star search for regex-or addition
" tagbar/outline (using unite? using language server?)
" jump to definition, declaration, reference
" when showing undo tree, dim all non-related buffers
" toggling relative numbers per buffer

call dein#end()

