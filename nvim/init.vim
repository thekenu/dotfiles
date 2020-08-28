source $HOME/.config/nvim/vim-plug/plugins.vim " List of plugins to download
source $HOME/.config/nvim/general/settings.vim " Basic nvim settings
source $HOME/.config/nvim/keys/mappings.vim    " Key mappings
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/themes/gruvbox.vim    
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/dbc.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/vim-commentary.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/limelight.vim
source $HOME/.config/nvim/plug-config/rainbow_parentheses.vim
source $HOME/.config/nvim/plug-config/vim-tmux-navigator.vim
source $HOME/.config/nvim/plug-config/vista.vim
source $HOME/.config/nvim/plug-config/lens.vim
source $HOME/.config/nvim/plug-config/fzf.vim
" Hack-y solution to avoid .ideavimrc from loading in CoC settings
exe "source $HOME/.config/nvim/plug-config/coc.vim" 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

source $HOME/.config/nvim/my-google-config.vim
