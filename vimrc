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
set hlsearch
"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" split windows
set splitright
set splitbelow

set showmatch matchtime=3
set cursorline

set number " show line numbers
set ruler

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set bs=start,indent,eol
set wildmenu

syntax enable
set background=dark
set colorcolumn=80

try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

set guifont=monaco:h12

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

augroup vimrc_autocmd
    autocmd!

    " add spell checking and wrap at 72 columns to git commit messages
    autocmd Filetype gitcommit setlocal spell textwidth=72

    " set spacing scheme for ruby and js files
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

    " highlight extra whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd Syntax * syn match ExtraWhitespace /\s\+$/

    " disable cursorline for ruby files (slows down vim... wtf)
    autocmd Filetype ruby set nocursorline

    " for python files, avoid auto removal of identation in comments
    autocmd BufRead *.py inoremap # X<c-h>#<space>

    " neomake standard
    let g:neomake_javascript_enabled_makers = ['standard']
    let g:neomake_jsx_enabled_makers = ['standard']
    autocmd! BufWritePost,BufEnter * Neomake
augroup END

" create Ag command and open results in cwindow
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

imap § <C-y>,

" show/hide all whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" force syntax coloring of full file
map <leader>c :syntax sync fromstart<CR>



au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.hbs set filetype=html

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif



" This maps esc esc to exit terminal mode.
if has('nvim')
    tnoremap <Leader>e <C-\><C-n>
    ":tnoremap <Esc><Esc> <C-\><C-n>
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
