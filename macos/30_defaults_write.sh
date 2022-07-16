#!/bin/bash

set -eu

# メニューバーにBluetooth, サウンドを表示
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter Bluetooth -int 18
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter Sound -int 18

# TODO
