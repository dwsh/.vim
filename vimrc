runtime tools/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('tools/{}','langs/{}','colors/{}')
"syntax on
"filetype plugin indent on




color solarized
map <Leader><Leader> :ZoomWin<CR>
map <c-t> :CtrlP pwd<CR>
nmap <Leader>n :tabnew<CR>
nmap <Leader>q :quit<CR>


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



map <F9> :NERDTreeTabsToggle<CR>
let NERDTreeChDirMode=2


" tab management
map <C-Tab> gt
map <C-S-Tab> gT



au BufRead,BufNewFile *.tpl set ft=phtml
au BufNewFile,BufRead *.ejs set filetype=html


"" Whitespace
set number
set nowrap                          " don't wrap lines
set tabstop=4
set shiftwidth=4          " a tab is two spaces (or set this to 4)
"set softtabstop=4
set noexpandtab                 " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode


"nmap <F8> :TagbarToggle<CR>         " mapping f8 to TagbarToggle

set textwidth=80

"" Put autocmd here


"control p config
"let g:ctrlp_working_path_mode = '1'
let g:ctrlp_cmd = 'CtrlP pwd'
