#!/bin/bash

set -eu

cp -a src/common/.[^.]* $HOME/

if [ $(uname -s) = "Linux" ]; then
  echo 'setup for Linux'
elif [ $(uname -s) = "Darwin" ]; then
  echo 'setup for macOS'

  cp -a src/macos/.config/* $HOME/.config/
fi
