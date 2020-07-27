installarctheme() {
  sudo apt install gnome-themes-standard libgtk-3-dev gtk2-engines-murrine lxappearance

  git clone https://github.com/horst3180/arc-theme --depth 1 ~/arc-theme
  cd ~/arc-theme

  # --with-gnome flag is needed because arc doesn't support >3.22 and Ubuntu
  # 20.04 ships with 3.24
  ./autogen.sh --prefix=/usr --with-gnome=3.22
  sudo make install
}

installarcicontheme() {
  git clone https://github.com/horst3180/arc-icon-theme --depth 1 ~/arc-icon-theme
  cd ~/arc-icon-theme
  ./autogen.sh --prefix=/usr
  sudo make install
}

# Welcome
echo '[Setting up Tmux]'
echo '==================='

installarctheme
installarcicontheme

echo ""
echo "Don't forget to select Arc under 'Widget' and 'Icon Theme' in lxappearance!"

echo '==================='
echo 'Done!'
