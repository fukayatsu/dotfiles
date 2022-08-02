#!/bin/bash

set -eu

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
asdf install ruby latest
asdf global ruby latest

asdf plugin add fzf https://github.com/kompiro/asdf-fzf.git
asdf install fzf latest
asdf global fzf latest
