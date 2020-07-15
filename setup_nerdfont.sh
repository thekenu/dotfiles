ttf="Ubuntu Mono Nerd Font Complete.ttf"

installcurl() {
  sudo apt -y install curl
}

installfont() {
  cd ~/.local/share/fonts && curl -fLo "$ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf
}

# Install curl
which curl > /dev/null && echo 'curl installed, moving on...' || installcurl

# Create font download folder
[[ -d "$HOME/.local/share/fonts" ]] || mkdir -p ~/.local/share/fonts

# Install font 
[[ -f "$HOME/.local/share/fonts/$ttf" ]] && echo "font installed, moving on..." || installfont
