#!/bin/bash

set -eu

read -p "App Storeにログイン済み? (y/N): " yn
case "$yn" in
  [yY]*) echo 'ok';;
  *) echo "終了"; exit 1;;
esac

CURRENT=$(cd $(dirname $0);pwd)
brew bundle --file $CURRENT/brewfiles/mas.Brewfile
