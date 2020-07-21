" Map leader to which_key
" nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" By default timeoutlen is 1000ms
set timeoutlen=500

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
let g:which_key_map[','] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]

" Group mappings

" p is for print
let g:which_key_map.p = {
      \ 'name' : '+print',
      \ 'f' : 'full path',
      \ 'r' : 'relative path',
      \ }
" For some reason, I can't add the echo commands inside g:which_key_map.
" Using nnoremap as a workaround instead.
nnoremap <silent> <leader>pf  :echo expand('%:p')<CR>
nnoremap <silent> <leader>pr  :echo @%<CR>

" t is for toggle
let g:which_key_map.t = {
      \ 'name' : '+toggle' ,
      \ 'c' : [':ColorToggle'            , 'color code' ],
      \ 'h' : [':set hls!'               , 'highlight' ],
      \ 'l' : [':Limelight!!'            , 'limelight' ],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 'R' : [':RainbowParentheses!!'   , 'rainbow parentheses'],
      \ 'z' : [':Goyo'                   , 'goyo'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'c' : [':%bd|e#|bd#'  , 'current buffer only'] ,
      \ 'd' : [':Bdelete'     , 'delete-buffer']       ,
      \ 'n' : [':bn'          , 'next-buffer']         ,
      \ 'p' : [':bp'          , 'prev-buffer']         ,
      \ '?' : [':Buffers'     , 'fzf-buffer']          ,
      \ }

let g:which_key_map.d = {
      \ 'name' : '+debug' ,
      \ }

" f is for fold
let g:which_key_map.f = {
      \ 'name' : '+fold' ,
      \ 'c' : ['zM', 'close-all-folds'],
      \ 'd' : ['zd', 'delete-fold'],
      \ 'D' : ['zE', 'delete-all-folds'],
      \ 'j' : ['zj', 'next-fold'],
      \ 'k' : ['zk', 'prev-fold'],
      \ 'o' : ['zR', 'open-all-folds'],
      \ 't' : ['za', 'toggle-fold'],
      \ }

" w is for window
let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ 'c' : ['<C-W>o' , 'current window only'] ,
      \ 'd' : ['<C-W>c' , 'delete window'] ,
      \ 'h' : ['<C-W>J' , 'horizontal windows'] ,
      \ 'v' : ['<C-W>H' , 'vertical windows'] ,
      \ 'r' : ['<C-W>R' , 'rotate windows'] ,
      \ 'z' : [':MaximizerToggle', 'zoom current window'] ,
      \ '=' : ['<C-W>=' , 'balance windows']     ,
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ ';' : [':Commands'              , 'commands'],
      \ 'b' : [':BLines'                , 'current buffer'],
      \ 'B' : [':Buffers'               , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Files'                 , 'files'],
      \ 'g' : [':GFiles'                , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'P' : [':Tags'                  , 'project tags'],
      \ 't' : [':Rg'                    , 'text Rg'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'GBrowse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Gvdiffsplit!'                     , 'diff split'],
      \ 'D' : [':GDelete'                          , 'GDelete'],
      \ 'j' : [']c'                                , 'next hunk'],
      \ 'k' : ['[c'                                , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':Gread'                            , 'Gread'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ 'w' : [':Gwrite'                           , 'Gwrite'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'g' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'G' : [':call CocActionAsync("diagnosticToggle")', 'toggle diagnostics'],
      \ 'o' : [':Vista coc'                          , 'outline'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'symbols'],
      \ 'y' : ['<Plug>(coc-type-definition)'         , 'type-definition'],
      \ 't' : [':CocRestart'                         , 'restart'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
