" vim set et sw=2:

if exists('s:loaded_vimrc')
  finish
endif
let s:loaded_vimrc = 1

source ~/.vim/plugins.vim
source ~/.vim/options.vim
source ~/.vim/plugin_options.vim
source ~/.vim/statusline.vim
source ~/.vim/mappings.vim
source ~/.vim/plugin_mappings.vim
source ~/.vim/colors.vim

set t_vb=

