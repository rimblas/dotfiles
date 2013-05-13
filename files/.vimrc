set nocompatible

" Vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
    " Vundle
    Bundle 'gmarik/vundle'

    " Colorschemes
    Bundle 'jlesquembre/peaksea'

    " Language Support
    Bundle 'jnwhiteh/vim-golang'
    Bundle 'ledger/vim-ledger'
    Bundle 'groenewege/vim-less'
    Bundle 'plasticboy/vim-markdown'
    Bundle 'kljohann/vim-python-pep8-indent'

    " Small Tweaks
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'
    Bundle 'mattn/zencoding-vim'
    Bundle 'jpalardy/vim-slime'
    Bundle 'SirVer/ultisnips'

    " Vim Extensions
    Bundle 'scrooloose/nerdtree'
    nnoremap <Leader>f :NERDTreeToggle<CR>
    let NERDTreeCaseSensitiveSort=1
    let NERDTreeDirArrows=0
    Bundle 'scrooloose/syntastic'
    Bundle 'majutsushi/tagbar'
    Bundle 'vimoutliner/vimoutliner'
    Bundle 'kien/ctrlp.vim'

    set runtimepath+=~/.vim/misc
filetype plugin indent on

" Appearance
syntax on
set ruler
set colorcolumn=81
set showcmd
set ttyfast
set background=dark
colorscheme peaksea
set listchars=trail:·,precedes:«,extends:»,nbsp:_,tab:›‾
set list

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Editing Behavior
set backspace=indent,eol

" Editing Defaults
set tabstop=4
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
set wildignore+=*.6
