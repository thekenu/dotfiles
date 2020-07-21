#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installi3() {
  sudo add-apt-repository ppa:kgilmer/speed-ricer
  sudo apt update
  sudo apt install i3-gaps
  sudo apt install pavucontrol pasystray rofi compton
}

linki3() {
  ln -s $(git rev-parse --show-toplevel)/i3 ~/.config/i3
}

linkrofi() {
  ln -s $(git rev-parse --show-toplevel)/rofi ~/.config/rofi
}

# Welcome
echo '[Setting up i3-gaps]'
echo '==================='

which i3 > /dev/null && echo 'i3 installed, moving on...' || installi3

[[ -d "$HOME/.config/i3" ]] && echo 'i3 folder exists, moving on...'|| linki3
[[ -d "$HOME/.config/rofi" ]] && echo 'rofi folder exists, moving on...'|| linkrofi

echo '==================='
echo 'Done!'
