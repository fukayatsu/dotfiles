#!/bin/bash

set -eu

git clone https://github.com/fukayatsu/dotfiles.git ~/dotfiles
cd dotfiles
./install.sh
