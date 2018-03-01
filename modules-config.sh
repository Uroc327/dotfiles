
repo_name=crunge

user_module[crunge.bash.from]=shells/bash/
user_module[crunge.bash.link]=(bash_logout bash_profile bashrc)
user_module[crunge.bash.depend]=(shell)

#user_module[crunge.git.link]=(gitconfig)
user_module[crunge.git.template]=(gitconfig)

user_module[crunge.i3.from]=x/
user_module[crunge.i3.link]=(i3)
user_module[crunge.i3.depend]=(x)

user_module[crunge.nvim.to]=.config
user_module[crunge.nvim.link]=(nvim)
user_module[crunge.nvim.options]=(noprefix)

user_module[crunge.oni.link]=(oni)
user_module[crunge.oni.depend]=(nvim)

user_module[crunge.shell.from]=shells/
user_module[crunge.shell.link]=(shellrc)

user_module[crunge.vim.link]=(vim vimrc gvimrc)

user_module[crunge.x.from]=x/
user_module[crunge.x.link]=(xinitrc Xresources xprofile)

user_module[crunge.xscreensaver.from]=x/
user_module[crunge.xscreensaver.link]=(xscreensaver)
user_module[crunge.xscreensaver.depend]=(x)

user_module[crunge.xdg.to]=.config
user_module[crunge.xdg.link]=(user-dirs.dirs)
user_module[crunge.xdg.options]=(noprefix)

user_module[crunge.zsh.from]=shells/
user_module[crunge.zsh.link]=(zshrc)
user_module[crunge.zsh.depend]=(shell)

