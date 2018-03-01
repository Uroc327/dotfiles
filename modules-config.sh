
repo_name=crunge
repo_crunge_type=user

crunge_module_bash_from=shells/bash/
crunge_module_bash_link=(bash_logout bash_profile bashrc)
crunge_module_bash_depend=(shell)

crunge_module_git_link=(gitconfig)
#crunge_module_git_template=(gitconfig)

crunge_module_i3_from=x/
crunge_module_i3_link=(i3)
crunge_module_i3_depend=(x)

crunge_module_nvim_to=.config
crunge_module_nvim_link=(nvim)
crunge_module_nvim_options=(noprefix)

crunge_module_oni_link=(oni)
crunge_module_oni_depend=(nvim)

crunge_module_shell_from=shells/
crunge_module_shell_link=(shellrc)

crunge_module_vim_link=(vim vimrc gvimrc)

crunge_module_x_from=x/
crunge_module_x_link=(xinitrc Xresources xprofile)

crunge_module_xscreensaver_from=x/
crunge_module_xscreensaver_link=(xscreensaver)
crunge_module_xscreensaver_depend=(x)

crunge_module_xdg_to=.config
crunge_module_xdg_link=(user-dirs.dirs)
crunge_module_xdg_options=(noprefix)

crunge_module_zsh_from=shells/
crunge_module_zsh_link=(zshrc)
crunge_module_zsh_depend=(shell)

