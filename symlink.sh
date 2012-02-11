#!/bin/sh
ln -fs $PWD/.vimrc $HOME/.vimrc
ln -fs $PWD/.gvimrc $HOME/.gvimrc
ln -fs $PWD/.bashrc $HOME/.bashrc
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/colors
ln -fs $PWD/neobundle.vim $HOME/.vim/bundle/neobundle.vim
ln -fs $PWD/wombat.vim/colors/wombat.vim $HOME/.vim/colors/wombat.vim
