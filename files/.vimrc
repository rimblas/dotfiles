set nocompatible

" Pathogen Setup
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Appearance
syntax on
set ruler
set colorcolumn=81
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

" File Globbing
set wildignore+=*.py[co]
set wildignore+=*.sw[po]
set wildignore+=.DS_Store
set wildignore+=[Tt]humbs.db

" Plugin Configuration
map <leader>f :NERDTreeToggle<CR>
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let g:CommandTCancelMap=['<ESC>','<C-c>']
