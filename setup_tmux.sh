#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installtmux() {
  sudo apt-get install tmux
}

installpip3() {
  sudo apt install -y python3-pip > /dev/null
}

installpowerline() {
  sudo pip3 install powerline-status
}

installtpm() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

linktmuxconfcommon() {
  ln -s $(pwd)/.tmux.conf.common ~/.tmux.conf.common
}

linktmuxconf() {
  touch ~/.tmux.conf

  # Enable Powerline for Tmux:
  # https://powerline.readthedocs.io/en/latest/usage/other.html?highlight=tmux#tmux-statusline
  string=$(pip3 show powerline-status | grep Location | cut -d " " -f 2)
  string='source '$string'/powerline/bindings/tmux/powerline.conf'
  echo $string > ~/.tmux.conf

  echo "" >> ~/.tmux.conf
  echo "source-file ~/.tmux.conf.common" >> ~/.tmux.conf
}

# Welcome
echo '[Setting up Tmux]'
echo '==================='

# Install nvim with Python3 support
which tmux > /dev/null && echo 'tmux installed, moving on...' || installtmux

# Install pip3
which pip3 > /dev/null && echo 'pip3 installed, moving on...' || installpip3

# Instal powerline
pip3 show powerline-status > /dev/null && echo 'powerline installed, moving on...' || installpowerline

# Install TPM
[[ -d "$HOME/.tmux/plugins/tpm" ]] && echo 'tpm installed, moving on' || installtpm

# Copy over tmux.conf
[[ -f "$HOME/.tmux.conf.common" ]] && echo '.tmux.conf.common exists, moving on...'|| linktmuxconfcommon
[[ -f "$HOME/.tmux.conf" ]] && echo '.tmux.conf exists, moving on...'|| linktmuxconf

echo ""
echo "Don't forget to do the following!"
echo "  1. tmux source ~/.tmux.conf"
echo "  2. Use prefix + I to install tmux plugins"

echo '==================='
echo 'Done!'
