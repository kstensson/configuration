#!/bin/bash

git pull

cp .emacs ~/.emacs
cp .vimrc ~/.vimrc
cp .Xresources ~/.Xresources
cp .zshrc ~/.zshrc
cp -r .emacs.d/* ~/.emacs.d
cp -r scripts/* ~/scripts
cp .bashrc ~/.bashrc

