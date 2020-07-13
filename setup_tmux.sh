#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installtmux() {
  sudo apt-get install tmux
}

linktmuxconf() {
  ln -s $(pwd)/.tmux.conf ~/
}

# Welcome
echo '[Setting up Tmux]'
echo '==================='

# Install nvim with Python3 support
which tmux > /dev/null && echo 'tmux installed, moving on...' || installtmux

# Copy over tmux.conf
[[ -f "$HOME/.tmux.conf" ]] && echo '.tmux.conf exists, moving on...'|| linktmuxconf

echo '==================='
echo 'Done!'
