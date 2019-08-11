#!/bin/bash

cd ~/configuration

git pull


mkdir -p ~/.config/nvim
mkdir ~/scripts

rm -rf ~/.emacs.d
cp -r ./.emacs.d ~/.emacs.d
cp .vimrc ~/.vimrc
cp .Xresources ~/.Xresources
cp .zshrc ~/.zshrc
cp -r scripts/ ~/
cp .bashrc ~/.bashrc
cp init.vim ~/.config/nvim/init.vim

