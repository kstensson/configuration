#!/bin/bash

cp ~/.zshrc ./
cp ~/.vimrc ./
cp ~/.emacs ./
cp ~/.config/i3/config i3/config
cp ~/.Xresources ./
cp -r ~/.wallpaper ./.wallpaper
cp -r ~/scripts ./scrip
cp ~/.bashrc ./.bash

read -p "Enter a commit message: " message

git add .
git commit -m "$message"
git push
