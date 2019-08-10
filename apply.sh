#!/bin/bash

git pull

mkdir -p ~/.config/nvim
mkdir ~/scripts

cp init.el ~/.emacs.d/init.el
cp .vimrc ~/.vimrc
cp .Xresources ~/.Xresources
cp .zshrc ~/.zshrc
cp -r scripts/ ~/
cp .bashrc ~/.bashrc
cp init.vim ~/.config/nvim/init.vim

