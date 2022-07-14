#!/bin/bash

cp -a src/common/.[^.]* $HOME/

if [ $(uname -s) = "Linux" ]; then
  echo 'setup for Linux'
elif [ $(uname -s) = "Darwin" ]; then
  echo 'setup for macOS'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval $(/opt/homebrew/bin/brew shellenv)
  brew bundle --file src/macos/.Brewfile

  # TODO: set defaults

  if [ "$(which fish)" = "$(echo $SHELL)" ]; then
    echo "Shell is $SHELL"
  else
    sudo sh -c "which fish >> /etc/shells"
    chsh -s $(which fish)
  fi
fi
