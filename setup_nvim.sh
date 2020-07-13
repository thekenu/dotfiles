#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installnvim() {
  sudo apt install neovim python3-neovim
}

installpip() {
  echo "Installing pip3..."
  sudo apt install python3-pip > /dev/null
}

installnode() {
  echo "Installing node..."
  sudo apt install nodejs npm
  sudo npm i -g neovim
}

installfzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

installripgrep() {
  sudo apt-get install ripgrep
}

linknvim() {
  ln -s $(pwd)/nvim ~/.config/nvim
}

# Welcome
echo '[Setting up Neovim]'
echo '==================='

# Install nvim with Python3 support
which nvim > /dev/null && echo 'nvim installed, moving on...' || installnvim

# Install pip
which pip3 > /dev/null && echo 'pip installed, moving on...' || installpip

# Install node and neovim support
which node > /dev/null && echo 'node installed, moving on...' || installnode

# Install extra dependecies
which fzf > /dev/null && echo 'fzf installed, moving on...' || installfzf
which rg > /dev/null && echo 'rg installed, moving on...' || installripgrep

# Install nvim plugins
nvim --headless +PlugInstall +CocUpdate +qall > /dev/null 2>&1

# Create symbolic link to nvim folder
[[ -d "$HOME/.config/nvim" ]] && echo 'nvim folder exists, moving on...'|| linknvim

echo "Don't forget to install and activate a font from here: https://github.com/ryanoasis/nerd-fonts"

echo '==================='
echo 'Done!'
