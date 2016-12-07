" vim set et sw=2:

if exists('s:loaded_vimrc')
  finish
endif
let s:loaded_vimrc = 1

source ~/.config/nvim_bug/plugins.vim
source ~/.config/nvim_bug/options.vim
source ~/.config/nvim_bug/plugin_options.vim
source ~/.config/nvim_bug/statusline.vim
source ~/.config/nvim_bug/mappings.vim
source ~/.config/nvim_bug/plugin_mappings.vim
source ~/.config/nvim_bug/colors.vim

