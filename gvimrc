set cursorline
set visualbell

if has("gui_running")
"set guioptions=egmrt
set guioptions=aAce
endif

set guifont=Fira\ Mono:h12
set linespace=2

" Disable print shortcut
macmenu File.Print key=<nop>

" Open ctrlp with cmd+p
let g:ctrlp_map = '<D-p>'

" Airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'
