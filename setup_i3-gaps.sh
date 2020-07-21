#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installpackages() {
  if ! find /etc/apt/ -name *.list | xargs cat | grep "^[[:space:]]*deb" | \
       grep -q "kgilmer/speed-ricer"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer
    sudo apt update
  fi

  for package in i3 pavucontrol pasystray rofi compton i3blocks screentfetch
  do
    which $package > /dev/null && echo $package 'installed, moving on...' \
      || sudo apt install $package
  done
}

linki3() {
  ln -s $(git rev-parse --show-toplevel)/i3 ~/.config/i3
}

linkrofi() {
  ln -s $(git rev-parse --show-toplevel)/rofi ~/.config/rofi
}

linkcompton() {
  ln -s $(git rev-parse --show-toplevel)/compton ~/.config/compton
}

# Welcome
echo '[Setting up i3-gaps]'
echo '==================='

installpackages

[[ -d "$HOME/.config/i3" ]] && echo 'i3 folder exists, moving on...'|| linki3
[[ -d "$HOME/.config/rofi" ]] && echo 'rofi folder exists, moving on...'|| linkrofi
[[ -d "$HOME/.config/compton" ]] && echo 'compton folder exists, moving on...'|| linkcompton

echo '==================='
echo 'Done!'
