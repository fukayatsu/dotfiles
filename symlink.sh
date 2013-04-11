#!/bin/sh

HOME_FILES=(
  "gitignore"
  "gitconfig"
  "zshrc"
  "zshenv"
  "autotest"
  "powconfig"
  "rspec"
)

for file in ${HOME_FILES[@]}; do
  ln -fs $PWD/$file $HOME/.$file
done

#ln -fs $PWD/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
