" save backup files in another folder
silent execute '!mkdir -p ~/.vim/tmp'

source $HOME/.vim/vundle.config

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

set showmatch matchtime=3
set cursorline

set nu! " show line numbers
set ruler

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set bs=start,indent,eol

syntax enable
set background=dark
set colorcolumn=85

try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

set gfn=monaco:h12

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

" open quickfix automatically for :grep :make etc
" autocmd QuickFixCmdPost * :cwindow 5

" create Ag command and open results in cwindow
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" show/hide all whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" force syntax coloring of full file
map <leader>c :syntax sync fromstart<CR>

" set spacing scheme for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" force syntax highlight of the whole file (problem in big files)
autocmd BufEnter * :syntax sync fromstart

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
