" vim: set et sw=2:

let s:dein_path = '~data/appdata/' . $USER . '-nvim_dein'
exec 'set runtimepath+=' . s:dein_path . '/repos/github.com/Shougo/dein.vim'

" FIXME:
" - denite:
"   - screws up cursorline and list
"   - different highlight for Search group
"   - multiple denites open at the same time?
" - Goyo:
"   - work with splits
" - unimpaired
"   - don't need the mappings and the plugin. Implement line moving without
"     bracket mappings

" in case of problems: `:echo dein#rollback("20190509014142")'

call dein#begin(s:dein_path)

" dein
call dein#add('Shougo/dein.vim')

" libs
call dein#add('kana/vim-operator-user')
"call dein#add('roxma/nvim-yarp')
call dein#add('tpope/vim-dispatch')

" Vim miscellaneous
"call dein#add('dhruvasagar/vim-zoom') make current buffer 'full-window'
call dein#add('AndrewRadev/linediff.vim')
call dein#add('simnalamburt/vim-mundo')
call dein#add('haya14busa/incsearch.vim')
" markonm/traces.vim
call dein#add('jremmen/vim-ripgrep')
" vim-airline
" vim-qf or QFEnter to place quickfix window under current split and open quickfix selection in correct window (current behavior: open quickfix under the bottom-right split and open quickfix selection in the window directly above)
" szw/vim-maximizer
" dstein64/vim-startuptime
" justinmk/vim-dirvish

" Text objects
call dein#add('wellle/targets.vim')
call dein#add('bkad/CamelCaseMotion')

" Code movement and editing
call dein#add('cohama/lexima.vim')
call dein#add('sbdchd/neoformat')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-unimpaired')
"call dein#add('vim-abolish') handle multiple versions of the same word
call dein#add('triglav/vim-visual-increment')
call dein#add('Uroc327/vim-numbertoggle')
" godlygeek/tabular
" osyo-manga/vim-anzu / vim-indexed-search
" terryma/vim-multiple-cursors
" machakann/vim-sandwhich (check compatibility with wellle/targets)
" osyo-manga/vim-snowdrop vs libclang-vim/libclang-vim with corresponding plugins
" neco-ghc and ghcmod-vim (given haskell-ide-engine+LanguageClient-neovim does not support include completion, type info ...)
" chromatica.nvim
" sickill/vim-pasta
" justinmk/vim-sneak

" writing
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')
"call dein#add('lervag/vimtex')

" Browsing
call dein#add('Shougo/denite.nvim')

" Git
call dein#add('tpope/vim-fugitive')

" Building and linting
" neomake/neomake (vs. ale?)

" Completion
"call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': 'bash install.sh' })
"call dein#add('ncm2/ncm2')
"call dein#add('ncm2/ncm2-bufword')
"call dein#add('ncm2/ncm2-path')
"call dein#add('ncm2/ncm2-github')
"call dein#add('ncm2/ncm2-vim')
"call dein#add('Shougo/neco-vim')
"call dein#add('eagletmt/neco-ghc')
" Shougo/neoinclude.vim + ncm2-neoinclude
" Shougo/neosnippet.vim
" ncm2/ncm2-pyclang
" Coc.nvim  https://kimpers.com/vim-intelligent-autocompletion/
" Shougo/echodoc.vim (with coc support)
" For Haskell: http://marco-lopes.com/articles/Vim-and-Haskell-in-2019/ https://mendo.zone/fun/neovim-setup-haskell/

" Interactive Language Integration
" Vigemus/iron.nvim

" Shell
" Shougo/Vimshell.vim

" Hex editor
" Shougo/vinarise.vim or fidian/hexmode

" Debugging
" critiqjo/lldb.nvim

" Language Support
call dein#add('daeyun/vim-matlab')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-rails')

" Highlighting and Indentation
call dein#add('gentoo/gentoo-syntax')
call dein#add('kelwin/vim-smali')
call dein#add('leafgarland/typescript-vim')
call dein#add('manquetin/vim-rmtoo')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('tpope/vim-git')
call dein#add('vim-scripts/openscad.vim')
call dein#add('xuhdev/tex-breqn.vim')
call dein#add('yinflying/matlab.vim')

call dein#add('joshdick/onedark.vim')
call dein#add('junegunn/seoul256.vim')

" star search for visual block
" shift star search for regex-or addition
" tagbar/outline (using unite? using language server?)
" jump to definition, declaration, reference
" when showing undo tree, dim all non-related buffers
" toggling relative numbers per buffer

call dein#end()

