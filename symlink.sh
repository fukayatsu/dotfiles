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

ln -fs "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/usr/local/bin/
ln -fs $PWD/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/



ln -fs ~/src/github.com/fukayatsu/dotfiles/gitignore ~/.gitignore
ln -fs ~/src/github.com/fukayatsu/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/src/github.com/fukayatsu/dotfiles/zshrc ~/.zshrc
ln -fs ~/src/github.com/fukayatsu/dotfiles/zshenv ~/.zshenv
ln -fs ~/src/github.com/fukayatsu/dotfiles/rspec ~/.rspec
ln -fs ~/src/github.com/fukayatsu/dotfiles/gitignore ~/.gitignore
ln -fs ~/src/github.com/fukayatsu/dotfiles/gitignore ~/.gitignore





