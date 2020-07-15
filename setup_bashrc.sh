#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

linksharedbashrc() {
  sudo ln -s $(git rev-parse --show-toplevel)/bashrc /etc/bashrc
}

# Welcome
echo '[Setting up shared bashrc]'
echo '==================='

linksharedbashrc

echo -e "Add the following to ~/.bashrc source global definitions:"
echo -e ""
echo -e "  if [ -f /etc/bashrc ]; then"
echo -e "      . /etc/bashrc"
echo -e "  fi"

echo '==================='
echo 'Done!'
