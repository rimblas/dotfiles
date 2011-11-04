augroup filetypedetect
    autocmd BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py
    au! BufRead,BufNewFile *.j2 setfiletype htmljinja
augroup END
