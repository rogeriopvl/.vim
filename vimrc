" save backup files in another folder
silent execute '!mkdir -p ~/.vim/tmp'

let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
" ***********************************************
" PLUGINS
" ***********************************************

" Color Themes

Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'wadackel/vim-dogrun'

" Features

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-endwise'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'rhysd/git-messenger.vim'
Plug 'norcalli/nvim-colorizer.lua'

" Language support

Plug 'mattn/emmet-vim'
" we have to remove the indent file after install because it conflicts with
" vim-jsx, breaking indentation for all js files
" Plug 'sheerun/vim-polyglot', { 'tag': 'v4.1.1', 'do': 'rm ~/.vim/plugged/vim-polyglot/after/indent/javascript.vim' }
Plug 'sheerun/vim-polyglot', { 'tag': 'v4.1.1', 'do': 'rm ~/.vim/plugged/vim-polyglot/after/indent/javascript.vim' }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" ********************************************
" END OF PLUGINS
" ********************************************
call plug#end()

" PLUGIN CONFIG ***********************************************

" set fzf runtime
set rtp+=/usr/local/opt/fzf

filetype plugin indent on
set laststatus=2
" airline display time
" let g:airline_section_b = '%{strftime("%R")}'

let g:airline_powerline_fonts = 1
" let g:airline_theme = 'minimalist'

" Airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0

" enable <CR> indent in delimitMate
let delimitMate_expand_cr=1

" Toggle on/off gitgutter
nmap <silent> <leader>g :GitGutterToggle<CR>

" NERDTree configs
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

" vim-jsx add support for js files (not only jsx)
let g:jsx_ext_required = 0

" Disable entities encoding in HTML files
let g:tcomment#replacements_xml = {}

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" END OF PLUGIN CONFIG ******************************

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
set nofoldenable

syntax enable
set background=dark
set colorcolumn=80

try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

if has('gui_macvim')
    set guifont=Fira\ Mono:h12
    set fuoptions=maxvert,maxhorz
    set cursorline
endif

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

set autoread
au FocusGained * :checktime

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

    " for python files, avoid auto removal of identation in comments
    autocmd BufRead *.py inoremap # X<c-h>#<space>

    " [nvim] remove line numbers in terminal mode
    if has('nvim')
        au TermOpen * setlocal nonumber norelativenumber
    endif
augroup END

" show/hide all whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" force syntax coloring of full file
map <leader>c :syntax sync fromstart<CR>

nnoremap § <Esc>
vnoremap § <Esc>gV
onoremap § <Esc>
cnoremap § <C-C><Esc>
inoremap § <Esc>

noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>
noremap <leader>p :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>a :Ag<CR>
noremap <leader>bl :GitMessenger<CR>
noremap <leader>fm :ALEFix<CR>

" [nvim] map ESC to exit insert mode on terminal
:tnoremap <Esc> <C-\><C-n>

au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.hbs set filetype=html

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g`\"" | endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" for better vimdiff
set diffopt+=algorithm:patience

" needed for truecolor support (dracula theme)
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" customize Dracula theme to make it look like vscode dracula
" use the following command to know the tokens name
" :echo synIDattr(synID(line("."), col("."), 1), "name")
hi! link jsObjectColon DraculaPink
hi! link jsGlobalNodeObjects DraculaCyan
hi! link jsFuncArgs DraculaOrange
hi Normal guibg=#191a21

if has('nvim')
    lua require'colorizer'.setup()
endif
