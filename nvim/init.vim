" vim: set et sw=2:

if exists('s:loaded_vimrc')
  finish
endif
let s:loaded_vimrc = 1

source ~data/dotfiles/nvim/plugins.vim
source ~data/dotfiles/nvim/options.vim
source ~data/dotfiles/nvim/plugin_options.vim
source ~data/dotfiles/nvim/statusline.vim
source ~data/dotfiles/nvim/mappings.vim
source ~data/dotfiles/nvim/plugin_mappings.vim
source ~data/dotfiles/nvim/colors.vim

