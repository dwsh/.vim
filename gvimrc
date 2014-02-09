
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=l



" == CUSTOMIZATION BEGIN ===========================================

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=e

set guifont=Ubuntu\ Mono\ 9

set linespace=0

colorscheme default
"colorscheme defaultplus
"colorscheme solarized
"set background=dark

hi User1 ctermbg=red ctermfg=white cterm=bold term=bold guibg=#aa0000 guifg=#ffffff gui=none

set cursorline

"set wrap
set nowrap

function GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  let wincount = tabpagewinnr(v:lnum, '$')
  let c = 1
  for bufnr in bufnrlist
  	let tipe = getbufvar(bufnr, "&filetype")
  	if tipe != 'nerdtree'
			let bname = bufname(bufnr)	
			let bname = fnamemodify(bname, ":t")		
			if bname == ''
				let bname = '░░░░'
			endif			
		  if getbufvar(bufnr, "&modified")
		    let bname = '✱'.bname
		  endif
		  if c < wincount
		  	let bname .= ' ┃ '
		  endif
			let label .= bname
  	endif
	  let c = c + 1
  endfor
  return label
endfunction

set guitablabel=%{GuiTabLabel()}

set showtabline=1
noremap <RightRelease> "+y<RightRelease>

set lines=44 columns=175


let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'skwp'
set encoding=utf-8
"set fillchars+=stl:\,stlnc:\
