#!/bin/bash

rsync -ahvz --copy-links \
  ~/.config/fish/ \
  ~/dotfiles/src/common/.config/fish
