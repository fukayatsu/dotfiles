#!/bin/bash

set -eu

eval $(/opt/homebrew/bin/brew shellenv)
CURRENT=$(cd $(dirname $0);pwd)
brew bundle --file $CURRENT/brewfiles/brew_and_cask.Brewfile
