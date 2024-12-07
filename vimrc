set autoindent expandtab tabstop=4 shiftwidth=4
:set number
execute pathogen#infect()
syntax on
filetype plugin indent on
let g:indent_guides_enable_on_vim_startup = 1

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

set diffopt+=iwhite,vertical
nmap <Leader>D <ESC>:w<CR>:diffthis<CR>
nmap <Leader>d <ESC>:w<CR>:diffoff<CR>

"set folding method
"set foldmethod=syntax

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
