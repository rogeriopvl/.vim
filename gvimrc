set cursorline

if has("gui_running")
	"set guioptions=egmrt
	set guioptions=aAce
endif

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif

" for commant-t plugin
let g:CommandTMaxFiles=5000
" let g:CommandTAcceptSelectionMap = '<C-t>'
" let g:CommandTAcceptSelectionTabMap = '<CR>'
