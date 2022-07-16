#!/bin/bash

set -eu

CURRENT=$(cd $(dirname $0);pwd)
brew bundle --file $CURRENT/brewfiles/brew_and_cask.Brewfile
