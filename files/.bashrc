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

# Virtualenv + virtualenvwrapper
export VIRTUALENV_USE_DISTRIBUTE=1
if [ -r ${HOME}/.local/src/virtualenvwrapper/virtualenvwrapper.sh ]; then
    source ${HOME}/.local/src/virtualenvwrapper/virtualenvwrapper.sh
    [ -d ${WORKON_HOME} ] || mkdir -p ${WORKON_HOME}
fi

# Set up proxies
function prox {
    export http_proxy=http://`scutil --proxy | grep 'HTTP[Port|Proxy]' | sort -r | sed 's/^.*: *//' | sed 'N;s/\n/:/'`
    export https_proxy=http://`scutil --proxy | grep 'HTTPS[Port|Proxy]' | sort -r | sed 's/^.*: *//' | sed 'N;s/\n/:/'`
}
