echo "If you haven't already, on Ubuntu 20.04 this script won't work correctly 
unless you delete the built-in profile and create a new dummy profile.
"

read -rsp $'Press any key to continue...\n' -n1 key

# Install gruvbox
echo 61 | bash -c  "$(wget -qO- https://git.io/vQgMr)" 
