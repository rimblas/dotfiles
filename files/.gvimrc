set background=dark

if has("macunix")
    "set guifont=DejaVu\ Sans\ Mono:h11
    set guifont=Inconsolata:h11
elseif has("unix")
    set guifont=Consolas\ 12
else
    set guifont=Consolas:h9:cANSI
endif

set guioptions=ce

set columns=80
set lines=60
