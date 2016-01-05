set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=l
set guioptions-=L
set guioptions-=R
set guioptions-=m
set guioptions-=e
set guifont=Ubuntu\ Mono\ 9
set linespace=0
set cursorline
set nowrap
set encoding=utf-8
set showtabline=2
colorscheme default



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

"function MyTabLine()
  "let s = ''
  ""let s .= '%#TabLineFill#%T'
  "for i in range(tabpagenr('$'))
	"" select the highlighting
	"if i + 1 == tabpagenr()
	  "let s .= '%#TabLineSel#'
	"else
	  "let s .= '%#TabLine#'
	"endif

	"" set the tab page number (for mouse clicks)
	"let s .= '%' . (i + 1) . 'T'

	"" the label is made by MyTabLabel()
	"let s .= ' %{MyTabLabel(' . (i + 1) . ')} %#TabLineFill# '
  "endfor

  "" after the last tab fill with TabLineFill and reset tab page nr
  "let s .= '%#TabLineFill#%T'

  "" right-align the label to close the current tab page
  "if tabpagenr('$') > 0
	"let s .= '%=%#TabLine#%999X close '
  "endif

  "return s
"endfunction


"function MyTabLabel(n)
  "let buflist = tabpagebuflist(a:n)
  "let winnr = tabpagewinnr(a:n)
  "let wincount = 0
  "for i in buflist
	  "let wincount = wincount + 1
  "endfor
  "let label = ''
  "let c = 1
  "for item in buflist
	  "let bname = bufname(item)
	  "let bname = fnamemodify(bname, ":t")
	  "let tipe = getbufvar(item, "&filetype")
	  "if bname == ''
		  "let bname = '░░░░'
	  "endif
	  "if tipe != 'nerdtree'
		"if getbufvar(item, "&modified")
		  "let bname = bname.'+'
		"endif
		"if c < wincount
		  "let bname .= ' • '
		"endif
		"let label .= bname
	  "endif
	  "let c = c + 1
  "endfor
  "return label
"endfunction

"set tabline=%!MyTabLine()

