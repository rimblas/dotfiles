set nocompatible " (Neovim Default)

" Vim-Plug Setup
call plug#begin('~/.vim/plugged')
    " Colorschemes
    Plug 'jonathanfilip/vim-lucius'
        let g:lucius_style = 'dark'
        let g:lucius_contrast = 'low'
        let g:lucius_contrast_bg = 'high'

    " Editing Behavior
    Plug 'editorconfig/editorconfig-vim'
    Plug 'Raimondi/delimitMate'
        let delimitMate_expand_cr    = 1
        let delimitMate_expand_space = 1
        au FileType python       let b:delimitMate_nesting_quotes = ['"']
        au FileType markdown,mkd let b:delimitMate_nesting_quotes = ['`']
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

    " Features
    Plug 'mattn/emmet-vim'
        let g:user_emmet_install_global = 0
        au FileType html,css EmmetInstall
    Plug 'scrooloose/nerdtree'
        map <leader>f :NERDTreeToggle<CR>
        let g:NERDTreeRespectWildIgnore = 1
    Plug 'scrooloose/syntastic'
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_error_symbol = '✘'
        let g:syntastic_warning_symbol = '❢'
        let g:syntastic_javascript_checkers = ['eslint']

    " File Types
    " See sheerun/vim-polyglot for more suggestions
    Plug 'cespare/vim-toml'
    Plug 'fatih/vim-go'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'jelera/vim-javascript-syntax'
        au FileType javascript call JavaScriptFold()
    Plug 'mitsuhiko/vim-python-combined'
    Plug 'othree/html5.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-git'
    Plug 'vimoutliner/vimoutliner'

    " == Still Evaluating ==

    " -- Miscellaneous --

    Plug 'junegunn/rainbow_parentheses.vim'
        au FileType lisp,clojure,scheme RainbowParentheses
    Plug 'simnalamburt/vim-mundo'
        nnoremap <leader>u :GundoToggle<CR>
    Plug 'junegunn/goyo.vim'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

    " -- Completion --

    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer --gocode-completer --racer-completer' }
        let g:ycm_rust_src_path = '/usr/local/src/rust/1.5.0/src'
        let g:ycm_python_binary_path = '/usr/bin/python3'
        let g:ycm_autoclose_preview_window_after_insertion = 1
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ervandew/supertab'
        " make YCM compatible with UltiSnips (using supertab)
        let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
        let g:SuperTabDefaultCompletionType = '<C-n>'

        " better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " -- File / Filename Searching --

    Plug 'mileszs/ack.vim'
        if executable('ag')
            let g:ackprg = 'ag --vimgrep'
        endif

    "Plug 'Shougo/unite.vim'
    "    let g:unite_source_rec_async_command = ['ag', '--follow', '--vimgrep', '--hidden', '--ignore-case', '-g', '']
    "    let g:unite_source_grep_command = 'ag'
    "    let g:unite_source_grep_default_opts = '--vimgrep --hidden --smart-case'
    "    let g:unite_source_grep_recursive_opt = 'j
    "Plug 'Shougo/vimproc.vim', { 'do': 'make' }

    " -- Git integration --

    "Plug 'tpope/vim-fugitive'
    "Plug 'gregsexton/gitv'
    "Plug 'airblade/vim-gitgutter'
call plug#end()

" Appearance
colorscheme lucius
syntax on " (Neovim Default)
set ruler
set colorcolumn=81
set nofoldenable
set showcmd
set ttyfast " (Neovim Default)
set background=dark
set listchars=trail:·,precedes:«,extends:»,nbsp:_,tab:▸· " More: ⌇ ► ▸ ❯ ⇥
set list

" Searching
set hlsearch " (Neovim Default)
set incsearch " (Neovim Default)
set ignorecase
set smartcase

" Behavior
if filereadable($VIMRUNTIME . "/macros/matchit.vim")
    source $VIMRUNTIME/macros/matchit.vim
endif
set backspace=indent,eol,start " (Neovim Default)
set mouse=a "Enables the mouse in terminals (Neovim Default)
set completeopt+=longest

" Editing Defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab " (Neovim Default)
set expandtab
set copyindent
set smartindent
inoremap # X<C-H>#

" File Globbing
set wildignore+=*.py[co]
set wildignore+=*.sw[po]
set wildignore+=.DS_Store
set wildignore+=[Tt]humbs.db
set wildignore+=*.6

" Misc
set spell
au FileType votl,go,make setlocal nolist
au FileType gitcommit setlocal colorcolumn+=51
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
