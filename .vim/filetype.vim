augroup filetypedetect
    " Clojure
    autocmd BufRead,BufNewFile *.clj setfiletype clojure
    " Markdown
    autocmd BufRead,BufNewFile *.mkd setfiletype mkd
    autocmd BufRead,BufNewFile *.mdwn setfiletype mkd
    " Go
    autocmd BufRead,BufNewFile *.go setfiletype go
augroup END
