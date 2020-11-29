" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Any j,k movements across more than 1 line (e.g. 2j, 2k) will be added to the
" VIM jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" For some reason, vim registers ctrl + / as <C-_>
nnoremap <C-_> :Commentary<cr>
vnoremap <C-_> :Commentary<cr>

" Center the screen when jumping around
nmap n <Plug>(is-n)zz
nmap N <Plug>(is-N)zz
nnoremap * *zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" vim-fugitive merge conflict resolution
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>

" Ctrl+P: Use Fzf file search
nnoremap <C-p> :Files<Cr>

" Exit terminal insert mode
tnoremap <Esc> <C-\><C-n>

" Reuse ctrl+ hjkl in terminal mode too
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Search and replace the word under cursor or the visual selection
nnoremap <leader>r :%s/<C-R>=expand("<cword>")<CR>/<C-R>=expand("<cword>")<CR>/gIc<left><left><left><left>
vnoremap <leader>r "hy:%s/<C-r>h//gIc<left><left><left>
