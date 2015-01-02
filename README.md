Bheeshmar's Dotfiles
--------------------

Some really good bash tips here:
http://www.ukuug.org/events/linux2003/papers/bash_tips/

To use my vim settings, create this ~/.vimrc:

```vim
" Prepend the path to my custom settings and search for "vimrc" there.
set runtimepath^=$HOME/dotfiles/vim_settings
runtime vimrc
```

Or just symlink: `ln -s $HOME/dotfiles/vimrc ~/.vimrc`

To use my shell settings (bash and inputrc customizations), add the following
line to the bottom of ~/.bashrc:


```bash
export MY_SHELL_SETTINGS=$HOME/dotfiles/shell_settings
test -s $MY_SHELL_SETTINGS/settings.bash && source $MY_SHELL_SETTINGS/settings.bash
```

Symlink the tmux configuration: `ln -s $HOME/dotfiles/tmux.conf ~/.tmux.conf`
