#!/bin/bash

cp ~/.zshrc ./
cp ~/.vimrc ./
cp ~/.emacs.d/init.el ./init.el
cp ~/.config/nvim/init.vim ./
cp ~/.Xresources ./
rm -r scripts
cp ~/scripts/ ./scripts -r
cp ~/.bashrc ./.bashrc

read -p "Enter a commit message: " message

git add .
git commit -m "$message"
git push
