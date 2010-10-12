syntax on
set ic
set nu!
set tabstop=4
set autoindent
set ruler
set background=dark
colorscheme desert
set gfn=monaco:h12
set backspace=start,indent,eol

" set spacing scheme for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" run php file with php cli 
autocmd Filetype php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" check the php syntax
autocmd Filetype php noremap <C-L> :!/usr/bin/php -l %<CR>

" enable omnicomplete for php files
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP
