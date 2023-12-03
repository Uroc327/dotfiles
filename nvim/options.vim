" vim: set et sw=2:

scriptencoding utf-8

set belloff=all
set clipboard+=unnamedplus
set completeopt=menuone,noinsert,noselect
set conceallevel=0
set display=
set noexpandtab
set nofoldenable
set formatoptions=roqlj
set grepprg=grep\ -in\ $*\ /dev/null
set hidden
set ignorecase smartcase
set infercase
set list
set listchars=tab:· ,trail:·,extends:»,precedes:«,nbsp:~
set mouse=v
set ruler
set scrolloff=2
set shiftwidth=4
set showcmd
set sidescroll=1
set sidescrolloff=2
set nosmarttab
set softtabstop=0
set nostartofline
set tabstop=4
set undofile
set updatetime=2000
set virtualedit=all
set nowrap

autocmd FileType c,cpp,sh,bash,zsh,fstab runtime ftplugin/man.vim
autocmd FileType c,cpp set cindent
autocmd BufReadPost,VimEnter *.h normal! zR

" quickfix on bottom
autocmd FileType qf wincmd J

" check if file has changed, when a split/window gains focus
autocmd FocusGained * :checktime

autocmd FileType haskell compiler stack
autocmd FileType haskell setlocal makeprg=stack\ build\ --test\ --no-run-tests\ --fast\ --no-terminal

autocmd StdinReadPost * set buftype=nofile

let mapleader = ","

let g:loaded_node_provider = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0

