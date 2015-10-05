#!/bin/sh
here=`dirname $0`

# ======= AUTHOR ========
echo "* Git author"
username=`git log 891a20e -n 1 --pretty=short | grep -oP '(?<=Author: ).+?(?= <.+>)'`
email=`git log 891a20e -n 1 --pretty=short | grep -oP '(?<=<).+?(?=>)'`
git config --global user.name "$username"
git config --global user.email "$email"

# ======= SUBMODULES =======
echo "* Submodules"
git submodule init
git submodule update

# ======= VIM =======
echo "* Vim"
ln -sf "`pwd`/vim/vimrc" "$HOME/.vimrc"
ln -sf "`pwd`/vim/vim" "$HOME/.vim"
