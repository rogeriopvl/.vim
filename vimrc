silent execute '!mkdir -p ~/.vim/tmp'

set nocompatible
set nobackup

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

set enc=utf-8
set fileformat=unix

set ignorecase
set smartcase
set incsearch

set nu! " show line numbers
set ruler
set visualbell

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set bs=start,indent,eol

syntax on
set background=dark
colorscheme desert
set gfn=monaco:h12

" show/hide all whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" set spacing scheme for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" run php file with php cli 
autocmd Filetype php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" check the php syntax
autocmd Filetype php noremap <C-L> :!/usr/bin/php -l %<CR>
" check for online documentation in php and html files
autocmd FileType php set keywordprg=~/.vim/php_doc
autocmd FileType html set keywordprg=~/.vim/php_doc

" enable omnicomplete for php files
filetype indent on
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP

au BufRead,BufNewFile *.php set filetype=php.html

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif

:command -nargs=1 PHPman !~/.vim/php_doc <q-args>
