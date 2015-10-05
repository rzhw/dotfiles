#!/bin/sh

# ======= SUBMODULES =======
echo "* Submodules"
git submodule init
git submodule update

# ======= VIM =======
echo "* Vim"
ln -sf "`pwd`/vim/vimrc" "$HOME/.vimrc"
ln -sf "`pwd`/vim/vim" "$HOME/.vim"
