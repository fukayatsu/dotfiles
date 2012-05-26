#!/bin/sh
ln -fs $PWD/gitignore $HOME/.gitignore
ln -fs $PWD/vimrc $HOME/.vimrc
ln -fs $PWD/gvimrc $HOME/.gvimrc
ln -fs $PWD/viablerc $HOME/.viablerc
ln -fs $PWD/xmodmaprc $HOME/.xmodmaprc

ln -fs $PWD/zshrc $HOME/.zshrc
ln -fs $PWD/bashrc $HOME/.bashrc
ln -fs $PWD/bash_profile $HOME/.bash_profile
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/colors
ln -fs $PWD/neobundle.vim $HOME/.vim/bundle/neobundle.vim
ln -fs $PWD/wombat.vim/colors/wombat.vim $HOME/.vim/colors/wombat.vim
