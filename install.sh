#!/bin/bash

# install file for coder

# coder clones into ~/dotfiles; symlink the files we care about for coder:
ln -sv .zshrc ~/.zshrc
ln -sv .ideavimrc ~/.ideavimrc
ln -sv .fzf.zsh ~/.fzf.zsh
ln -sv .vim ~/.vim

