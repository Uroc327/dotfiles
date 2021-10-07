" vim: set et sw=2:

if exists('s:loaded_vimrc')
  finish
endif
let s:loaded_vimrc = 1

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/options.vim
source ~/.config/nvim/plugin_options.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugin_mappings.vim
source ~/.config/nvim/colors.vim

