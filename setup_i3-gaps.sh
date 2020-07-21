#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installpackages() {
  if ! find /etc/apt/ -name *.list | xargs cat | grep "^[[:space:]]*deb" | \
       grep -q "kgilmer/speed-ricer"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer
    sudo apt update
  fi

  for package in i3 pavucontrol pasystray rofi compton i3blocks screenfetch
  do
    which $package > /dev/null && echo $package 'installed, moving on...' \
      || sudo apt install -y $package
  done
}

linkconfigs() {
  for name in i3 rofi compton
  do
    [[ -d "$HOME/.config/"$name ]] && echo $name' folder exists, moving on...' \
      || ln -s $(git rev-parse --show-toplevel)/$name ~/.config/$name
  done
}

# Welcome
echo '[Setting up i3-gaps]'
echo '==================='

installpackages
linkconfigs

echo '==================='
echo 'Done!'
