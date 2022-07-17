#!/bin/bash

set -eu

# メニューバーにBluetooth, サウンドを表示
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter Bluetooth -int 18
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter Sound -int 18

# スクリーンショットのファイル名を変更
defaults write com.apple.screencapture name "ss"

# トラックパッド
defaults write -g com.apple.trackpad.scaling 2.5
defaults write -g com.apple.mouse.tapBehavior -int 1

# キーリピートを有効化・高速化
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 3
defaults write -g InitialKeyRepeat -int 10
