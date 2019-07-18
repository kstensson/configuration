#!/bin/bash

git pull

cp .emacs ~/.emacs;
cp .vimrc ~/.vimrc;
cp .Xresources ~/.Xresources;
cp .zshrc ~/.zshrc;
cp -r scripts/* ~/;
cp .bashrc ~/.bashrc;
cp init.vim ~/.config/nvim/init.vim

