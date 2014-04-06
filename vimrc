set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/bundles.vim

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set virtualedit=all             "Cursor moves up or down within a column

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
syntax on

" Enable neocomplcache
let g:neocomplcache_enable_at_startup=1

" ================ Appearance =======================
set linespace=6
set background=dark

let g:hybrid_use_Xresources = 1
colorscheme hybrid

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set gfn=Source\ Code\ Pro\ for\ Powerline:h20
set colorcolumn=80 " Faint line will appear to mark 80 columns
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols='Fancy'

let g:syntastic_quiet_warnings=1 " Indicate syntax errors, not warnings

" ================ Search Settings  =================

set magic
set hlsearch incsearch ignorecase smartcase
set ruler
set number
set cursorline
set list

set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" associate custom filetypes
au BufRead,BufNewFile Rakefile setfiletype ruby
au BufRead,BufNewFile Gemfile setfiletype ruby

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,eol:¬,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels 
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

source ~/.vim/keymap.vim
source ~/.vim/hybrid.vim