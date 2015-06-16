" vim: set et sw=2:

set encoding=utf-8
scriptencoding utf-8

set nocompatible

filetype plugin on
filetype indent on

syntax on

set autoindent
set backspace=indent,eol,start
set clipboard=unnamed,exclude:cons\|linux
set nofoldenable
set formatoptions-=tc
set formatoptions+=rol
set grepprg=grep\ -in\ $*\ /dev/null
set hidden
set history=10000
set hlsearch
set ignorecase smartcase
set incsearch
set infercase
set laststatus=2
set list
set listchars=tab:\ \ ,trail:·,extends:»,precedes:«,nbsp:~
set ruler
set scrolloff=2
set shiftwidth=4
set showcmd
set sidescroll=1
set sidescrolloff=2
set nostartofline
set tabstop=4
set ttyfast
set updatetime=2000
set virtualedit=all
set visualbell t_vb=
set wildmenu
set nowrap

autocmd FileType c,cpp,sh,bash,zsh runtime ftplugin/man.vim
autocmd BufReadPost,VimEnter *.h normal! zR

autocmd StdinReadPost * set buftype=nofile

let mapleader = ","

