
set nocompatible
filetype off

set rtp=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" General vim extensions
Plugin 'Gundo'
Plugin 'matchit.zip'
Plugin 'AndrewRadev/linediff.vim'
"Plugin 'tpope/vim-dispatch'

" Git
Plugin 'taq/vim-git-branch-info'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

" Formatting and writing
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
"Plugin 'godlygeek/tabular'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'triglav/vim-visual-increment'
Plugin 'bkad/CamelCaseMotion'

" Browsing
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'scrooloose/nerdtree'

" Vimscript debugging
"Plugin 'tomtom/tlib_vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'MarcWeber/vim-addon-completion'
"Plugin 'MarcWeber/vim-addon-goto-thing-at-cursor'
"Plugin 'c9s/vim-dev-plugin'
"Plugin 'Decho'

" Autocompletion
"Plugin 'SearchComplete'
Plugin 'SirVer/ultisnips'

" My awesome stuff
Plugin 'Uroc327/vim-numbertoggle'

" Java
"Plugin 'javacomplete'

call vundle#end()

