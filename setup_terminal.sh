# Welcome
echo '[Setting up Nerdfont]'
echo '==================='

# Reminder for the user
read -rsp $" If you haven't already, on Ubuntu 20.04 this script won't work 
correctly unless you delete the built-in profile and create a new dummy profile.

Press any key to continue..." -n1 key

# Install gruvbox
echo 61 | bash -c  "$(wget -qO- https://git.io/vQgMr)" 

echo ""
echo "Don't forget to do the following!"
echo "  1. Select Gruvbox Dark in the terminal settings"

echo '==================='
echo 'Done!'
