sudo apt get install gnome-themes-standard libgtk-3-dev gtk2-engines-murrine
git clone https://github.com/horst3180/arc-theme --depth 1 ~/arc-theme && cd ~/arc-theme

./autogen.sh --prefix=/usr
sudo make install
