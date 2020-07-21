" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    " gruvbox
    Plug 'gruvbox-community/gruvbox'
    
    " Better syntax support for multiple languages
    Plug 'sheerun/vim-polyglot'
    
    " Status line
    Plug 'vim-airline/vim-airline'
    
    " Focus a specific chunk of code
    Plug 'junegunn/limelight.vim'
    
    " is.vim (Automatically clear search highlight after the cursor is moved)
    Plug 'haya14busa/is.vim'
    
    " vim.fugitive
    Plug 'tpope/vim-fugitive'
    
    " Git commit browser
    Plug 'junegunn/gv.vim'
    
    " vim-signify (show Git +/- lines)
    Plug 'mhinz/vim-signify'

    " Auto pairing for brackets
    Plug 'jiangmiao/auto-pairs'
    
    " Start screen
    Plug 'mhinz/vim-startify'

    " Cool Icons
    Plug 'ryanoasis/vim-devicons'

    " 
    Plug 'tpope/vim-commentary'

    " Real-time language compilation/script interpreting
    Plug 'metakirby5/codi.vim'

    " 
    Plug 'liuchengxu/vim-which-key'

    " 360 no-scope
    Plug 'unblevable/quick-scope'

    " Distraction free writing
    Plug 'junegunn/goyo.vim'

    " Have the file system follow you around
    Plug 'airblade/vim-rooter'

    "
    Plug 'junegunn/rainbow_parentheses.vim'

    " Debugger
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

    "
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'szw/vim-maximizer'

    " Better outline for LSP
    Plug 'liuchengxu/vista.vim'

    " Automatic resizing for windows (with animation!)
    Plug 'camspiers/animate.vim'
    Plug 'camspiers/lens.vim'

    Plug 'itchyny/vim-qfedit'

    " Close buffer without closing window
    Plug 'moll/vim-bbye'

    Plug 'chrisbra/Colorizer'
call plug#end()
