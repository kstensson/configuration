#!/bin/bash

cp ~/.zshrc ./
cp ~/.vimrc ./
cp ~/.emacs ./
cp ~/.Xresources ./
cp ~/scripts/ ./scripts -r
cp ~/.bashrc ./.bashrc
rm -r ./.emacs.d
cp -r ~/.emacs.d ./.emacs.d

read -p "Enter a commit message: " message

git add .
git commit -m "$message"
git push
