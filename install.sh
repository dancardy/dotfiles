#!/bin/bash

# install file for coder

# coder clones into ~/dotfiles; symlink the files we care about for coder:
#ln -sv .zshrc ~/.zshrc
#ln -sv .ideavimrc ~/.ideavimrc
#ln -sv .fzf.zsh ~/.fzf.zsh
#ln -sv .vim/vimrc ~/.vim/vimrc
#ln -sv .vim/colors/danscolors.vim ~/.vim/colors/danscolors.vim
#ln -sv .vim/alignonstring.vim ~/.vim/alignonstring.vim

for f in $(find . -not \( -path ./.git -prune \) -not \( -path ./.config -prune \) -not \( -path ./.gitignore -prune \) -not \( -path ./install.sh -prune \) -type f);
do
    homedirlocation=~/${f:2}
    ln -sv $f $homedirlocation
done

