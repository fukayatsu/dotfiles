#!/bin/bash

set -eu

# NOTE: System Preferencesで楽に設定可能なものは基本的にそちらで設定する

# スクリーンショットの設定
defaults write com.apple.screencapture name "ss"
defaults write com.apple.screencapture disable-shadow -boolean true

# キーリピートを有効化
defaults write -g ApplePressAndHoldEnabled -bool false

# Finderの設定
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
