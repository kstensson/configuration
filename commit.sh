#!/bin/bash

cp ~/.zshrc ./
cp ~/.vimrc ./
cp ~/.emacs ./
cp ~/.Xresources ./
cp -r ~/.wallpaper ./.wallpaper
cp -r ~/scripts ./scripts
cp ~/.bashrc ./.bashrc

read -p "Enter a commit message: " message

git add .
git commit -m "$message"
git push
