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

# Virtualenvwrapper
if [ -r ${HOME}/.local/src/virtualenvwrapper/virtualenvwrapper_bashrc ]; then
    export WORKON_HOME=${HOME}/.virtualenvs
    [ -d ${WORKON_HOME} ] || mkdir -p ${WORKON_HOME}
    source ${HOME}/.local/src/virtualenvwrapper/virtualenvwrapper_bashrc
fi
