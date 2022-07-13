#!/bin/bash

# cp -a src/common/.[^.]* $HOME/

if [ $(uname -s) = "Linux" ]; then
  echo 'setup for Linux'
  cp -a src/common/.[^.]* $HOME/
elif [ $(uname -s) = "Darwin" ]; then
  echo 'setup for macOS'
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle --file src/macos/.Brewfile

  # TODO: set defaults
fi
