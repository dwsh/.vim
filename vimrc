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




" ========================================
" Airline Configuration
" ========================================

let g:airline_left_sep = '»'
let g:airline_left_sep = '▸'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◂'
let g:airline_theme='kalisi'
set laststatus=2









" ========================================
" Tabline Configuration
" ========================================

function MyTabLine()
  let s = ''
  "let s .= '%#TabLineFill#%T'
  for i in range(tabpagenr('$'))
	" select the highlighting
	if i + 1 == tabpagenr()
	  let s .= '%#TabLineSel#'
	else
	  let s .= '%#TabLine#'
	endif

	" set the tab page number (for mouse clicks)
	let s .= '%' . (i + 1) . 'T'

	" the label is made by MyTabLabel()
	let s .= ' %{MyTabLabel(' . (i + 1) . ')} %#TabLineFill# '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 0
	let s .= '%=%#TabLine#%999X close '
  endif

  return s
endfunction


function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let wincount = 0
  for i in buflist
	  let wincount = wincount + 1
  endfor
  let label = ''
  let c = 1
  for item in buflist
	  let bname = bufname(item)
	  let bname = fnamemodify(bname, ":t")
	  let tipe = getbufvar(item, "&filetype")
	  if bname == ''
		  let bname = '░░░░'
	  endif
	  if tipe != 'nerdtree'
		if getbufvar(item, "&modified")
		  let bname = bname.'+'
		endif
		if c < wincount
		  let bname .= ' • '
		endif
		let label .= bname
	  endif
	  let c = c + 1
  endfor
  return label
endfunction

set tabline=%!MyTabLine()

