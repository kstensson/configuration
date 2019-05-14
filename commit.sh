#!/bin/bash

cp ~/.emacs.d/* ./.emacs.d
cp ~/.zshrc ./
cp ~/.vimrc ./
cp ~/.emacs ./
cp ~/.Xresources ./
cp ~/scripts/* ./scripts
cp ~/.bashrc ./.bashrc

read -p "Enter a commit message: " message

git add .
git commit -m "$message"
git push
