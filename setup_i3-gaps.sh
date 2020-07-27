#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installi3lock-color() {
  git clone https://github.com/Raymo111/i3lock-color.git ~/i3lock-color
  cd ~/i3lock-color
  git tag -f "git-$(git rev-parse --short HEAD)"
  chmod +x ./build.sh && ./build.sh
  chmod +x ./install-i3lock-color.sh && ./install-i3lock-color.sh
  cd -
  rm -rf ~/i3lock-color
}

installpackages() {
  if ! find /etc/apt/ -name *.list | xargs cat | grep "^[[:space:]]*deb" | \
       grep -q "kgilmer/speed-ricer"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer
    sudo apt update
  fi

  for package in i3-gaps pavucontrol pasystray rofi compton i3blocks \
    screenfetch feh blueman dunst maim byzanz yad xdotool
  do
    which $package > /dev/null && echo $package 'installed, moving on...' \
      || sudo apt install -y $package
  done

  which i3lock > /dev/null && echo 'i3lock installed, moving on...' || installi3lock-color
}

linkconfigs() {
  for name in i3 rofi compton dunst
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
