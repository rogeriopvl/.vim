#!/bin/bash -e

# This script install vundle and symlinks in your home direcory pointing to
# this vim settings folder.

mkdir -p ~/.vim/bundle

# if vimrc does not exist, create symlink
if [ ! -f ~/.vimrc ]
then
    echo "Creating .vimrc symlink..."
    ln -s ~/.vim/vimrc ~/.vimrc
    echo "OK"
else
    echo "Found .vimrc file, skipping symlink creation."
fi

if [ ! -f ~/.gvimrc ]
then
    echo "Creating .gvimrc symlink..."
    ln -s ~/.vim/gvimrc ~/.gvimrc
    echo "OK"
else
    echo "Found .gvimrc file, skipping symlink creation."
fi

# migrate vim config to neovim
if [ ! -f ~/.config/nvim/init.vim ]
then
    echo "Creating ~/.config/nvim/init.vim symlink..."
    mkdir -p ~/.config/nvim
    ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
    echo "OK"
else
    echo "Found .vimrc file, skipping symlink creation."
fi



#echo "Starting vim with BundleInstall to install all plugins..."
#vim +BundleInstall +qall
