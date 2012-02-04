#!/bin/sh
ln -fs $PWD/.vimrc $HOME/.vimrc
ln -fs $PWD/.bashrc $HOME/.bashrc
mkdir -p $HOME/.vim/bundle
ln -fs $PWD/neobundle.vim $HOME/.vim/bundle/neobundle.vim
