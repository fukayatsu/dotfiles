#!/bin/sh

HOME_FILES=(
  "gitignore"
  "gitconfig"
  "zshrc"
  "zshenv"
)

for file in ${HOME_FILES[@]}; do
  ln -fs $PWD/$file $HOME/.$file
done

