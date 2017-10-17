runtime tools/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('tools/{}','langs/{}','colors/{}')

syntax on
filetype plugin indent on

set nocompatible
set shell=/bin/zsh
set number
set nowrap
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
set showtabline=2

color default

let NERDTreeChDirMode=2

au BufRead,BufNewFile *.tpl set ft=phtml
au BufNewFile,BufRead *.ejs set filetype=html





" ========================================
" List chars
" ========================================
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen



" ========================================
" Searching
" ========================================
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter



" ========================================
" Key Mapping
" ========================================

map <Leader><Leader> :ZoomWin<CR>
map <c-t> :CtrlP pwd<CR>
nmap <Leader>q :quit<CR>
map <F9> :NERDTreeTabsToggle<CR>

" tab management
nmap <Leader>n :tabnew<CR>
map <C-Tab> gt
map <C-S-Tab> gT
map <F8> :TagbarToggle<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q





" Remove Trailing Spaces
command RTS :%s/\s\+$//

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:jsx_ext_required = 0
