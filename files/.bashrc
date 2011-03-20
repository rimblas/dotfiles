# Exit if not running interactively
if [ -z "$PS1" ]; then
    return
fi

[ -f ~/.bash_prompt ] && . ~/.bash_prompt

# Don't allow duplicate history entries, nor those starting with a space
# Also: Append entries to the history file rather than overwriting on exit
export HISTCONTROL=ignoreboth
shopt -s histappend

# Reset LINES and COLUMNS after each commend
shopt -s checkwinsize

# Programmatic Completion
if [ -r /usr/local/Library/Contributions/brew_bash_completion.sh ]; then
    . /usr/local/Library/Contributions/brew_bash_completion.sh
fi

alias ls="ls -AFG"
export LSCOLORS=ExGxFxdxCxDxDxxbaDacae

stty -ixon

# Use MacVim in the console if available
if [ -x /usr/local/bin/mvim ]; then
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

# Virtualenv + virtualenvwrapper
export VIRTUALENV_USE_DISTRIBUTE=1
if [ -r /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
    [ -d ${WORKON_HOME} ] || mkdir -p ${WORKON_HOME}
fi
