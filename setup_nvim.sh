#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installnvim() {
  sudo apt install -y neovim python3-neovim
}

installpip3() {
  sudo apt install -y python3-pip > /dev/null
}

installnode() {
  echo "Installing node..."
  sudo apt install -y nodejs npm
  sudo npm i -g neovim
}

installfzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
}

installripgrep() {
  sudo apt-get install -y ripgrep
}

installccls() {
  # This function assumes Ubuntu 20.04, whose apt-get includes LLVM version 10.
  # This is important because the CMake command hardcodes the LLVM path using
  # the version number.
  if ! lsb_release -a | grep -q "20.04"; then
    echo "installccls only supports Ubuntu 20.04 at the moment"
    exit 1
  fi

  # Install dependencies
  sudo apt install -y zlib1g-dev libncurses-dev libncurses5 rapidjson-dev

  # Install toolchain for building ccls from source
  sudo apt install -y cmake clang libclang-dev

  git clone --depth=1 --recursive https://github.com/MaskRay/ccls ~/ccls

  cd ~/ccls

  cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10 \
      -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
      -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/
  sudo cmake --build Release --target install

  rm -rf ~/ccls
}

installctags() {
  sudo apt install -y universal-ctags
}

linknvim() {
  ln -s $(git rev-parse --show-toplevel)/nvim ~/.config/nvim
}

# Welcome
echo '[Setting up Neovim]'
echo '==================='

# Install nvim with Python3 support
which nvim > /dev/null && echo 'nvim installed, moving on...' || installnvim

# Install pip3
which pip3 > /dev/null && echo 'pip3 installed, moving on...' || installpip3

# Install node and neovim support
which node > /dev/null && echo 'node installed, moving on...' || installnode

# Install extra dependecies
which fzf > /dev/null && echo 'fzf installed, moving on...' || installfzf
which rg > /dev/null && echo 'rg installed, moving on...' || installripgrep
which ccls > /dev/null && echo 'ccls installed, moving on...' || installccls
which ctags > /dev/null && echo 'ctags installed, moving on...' || installctags

# Install nvim plugins
nvim --headless +PlugInstall +CocUpdate +qall > /dev/null 2>&1

# Create symbolic link to nvim folder
[[ -d "$HOME/.config/nvim" ]] && echo 'nvim folder exists, moving on...'|| linknvim

# Reload .bashrc
source ~/.bashrc

echo '==================='
echo 'Done!'
