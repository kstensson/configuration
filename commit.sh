#!/bin/bash

cd ~/configuration

cp ~/.zshrc ./
cp ~/.vimrc ./
rm -r ./emacs.d
cp -r ~/.emacs.d ./
cp ~/.config/nvim/init.vim ./
cp ~/.Xresources ./
rm -r scripts
cp ~/scripts/ ./scripts -r
cp ~/.bashrc ./.bashrc

read -p "Enter a commit message: " message

git add .
git commit -m "$message"
git push
