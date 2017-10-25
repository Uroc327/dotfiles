" vim: set et sw=2:

scriptencoding utf-8

set belloff=all
set clipboard=unnamed
set display=
set nofoldenable
set formatoptions=roqlj
set grepprg=grep\ -in\ $*\ /dev/null
set hidden
set ignorecase smartcase
set infercase
set list
set listchars=tab:· ,trail:·,extends:»,precedes:«,nbsp:~
set ruler
"set scrolloff=2
set shiftwidth=4
set showcmd
set sidescroll=1
set sidescrolloff=2
" smarttab
set nostartofline
set tabstop=4
set undofile
set updatetime=2000
set virtualedit=all
set nowrap

"autocmd FileType c,cpp,sh,bash,zsh,fstab runtime ftplugin/man.vim
autocmd BufReadPost,VimEnter *.h normal! zR

autocmd StdinReadPost * set buftype=nofile

let mapleader = ","

