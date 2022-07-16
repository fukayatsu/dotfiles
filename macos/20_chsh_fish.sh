#!/bin/bash

set -eu

eval $(/opt/homebrew/bin/brew shellenv)
if [ "$(which fish)" = "$(echo $SHELL)" ]; then
  echo "Shell is $SHELL"
else
  sudo sh -c "which fish >> /etc/shells"
  chsh -s $(which fish)
fi
