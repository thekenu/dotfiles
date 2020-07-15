" TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
