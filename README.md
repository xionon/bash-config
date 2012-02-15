Alec's Configs
==============

This project contains both my VIM configs and my general Bash config files.

    rake install:all       # Install symlinks and vim plugins
    rake install:dotfiles  # Symlink dotfiles from the home directory to the dotfiles directory
    rake install:vim       # Install vim plugins via symlink


Command-T must also be compiled:

    cd ~/.vim/ruby/command-t 
    ruby extconf.rb 
    make 

Make sure to import `Tomorrow Night.itermcolors` into iTerm2 on OSX.
Check https://github.com/ChrisKempson/Tomorrow-Theme for other applications.
