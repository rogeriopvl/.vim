silent execute '!mkdir -p ~/.vim/tmp'

call pathogen#infect()

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

syntax enable
set background=dark

if has('gui_running')
    colorscheme solarized
else
    colorscheme desert
endif

set gfn=monaco:h12

" show/hide all whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" Key to toggle nerdtree display
map <leader>l :NERDTreeToggle<CR>

" Key to toggle tagbar display
map <leader>k :TagbarToggle<CR>

" set spacing scheme for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" run php file with php cli 
autocmd Filetype php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" check the php syntax
autocmd Filetype php noremap <C-L> :!/usr/bin/php -l %<CR>

" enable omnicomplete for php files
filetype indent on
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP

au BufRead,BufNewFile *.php set filetype=php.html
au BufRead,BufNewFile *.ejs set filetype=html

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif
