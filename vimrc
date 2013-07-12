" save backup files in another folder
silent execute '!mkdir -p ~/.vim/tmp'

set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" vim plugins
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'hallison/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
" Bundle 'pangloss/vim-javascript'
Bundle 'airblade/vim-gitgutter'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tomtom/tcomment_vim'
Bundle "pangloss/vim-javascript"

filetype plugin indent on

set nobackup

set mouse=a

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

set enc=utf-8
set fileformat=unix

set ignorecase
set smartcase
set incsearch

" split windows
set splitright
set splitbelow

set showmatch
set cursorline

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

try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

set gfn=monaco:h12

set laststatus=2
let g:Powerline_symbols = 'fancy'

" disable gitgutter by default
let g:gitgutter_enabled = 0

" Tell Ctrl-P to ignore some folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|components'

" Toggle on/off gitgutter
nmap <silent> <leader>g :GitGutterToggle<CR>

" show/hide all whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" Key to toggle nerdtree display
map <leader>l :NERDTreeToggle<CR>

" force syntax coloring of full file
map <leader>c :syntax sync fromstart<CR>

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

" force syntax highlight of the whole file (problem in big files)
"autocmd BufEnter * :syntax sync fromstart

au BufRead,BufNewFile *.php set filetype=php.html
au BufRead,BufNewFile *.ejs set filetype=html

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif

" for python files, avoid auto removal of identation in comments
autocmd BufRead *.py inoremap # X<c-h>#<space>

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
