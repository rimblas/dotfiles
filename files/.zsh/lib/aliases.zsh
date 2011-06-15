alias ls='ls -AFG'
export LSCOLORS=ExGxFxdxCxDxDxxbaDacae

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Use MacVim in the console if available
if [[ -x /usr/local/bin/mvim ]]; then
    alias vi="mvim -v"

    alias ex="mvim -ve"
    alias vim="mvim -v"
    alias view="mvim -vR"
    alias vimdiff="mvim -vd"
    alias rvim="mvim -vZ"
    alias rview="mvim -vRZ"

    alias gex="mvim -ge"
    alias gvim="mvim -g"
    alias gview="mvim -gR"
    alias gvimdiff="mvim -gd"
    alias rgvim="mvim -gZ"
    alias rgview="mvim -gRZ"
fi

export EDITOR="mvim -v"
