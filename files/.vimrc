" Appearance
set nocompatible
set ruler
set background=dark
set t_Co=16
colors peakseamod
set hlsearch
set incsearch
if ! has("gui_running")
    set t_Co=8
endif

syntax on
filetype plugin indent on

set backspace=1

set ignorecase
set smartcase

set foldmethod=indent
set nofoldenable

" Tabs as four spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent
