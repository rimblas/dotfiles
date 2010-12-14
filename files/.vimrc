set nocompatible

" Pathogen Setup
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Appearance
syntax on
set ruler
set showcmd
set ttyfast
set background=dark
colorscheme peaksea

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Editing Behavior
set backspace=indent,eol

" Editing Defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent

" Plugin Configuration
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
