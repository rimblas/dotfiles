# setopt shwordsplit
# setopt interactivecomments

fpath=("${HOME}/.zsh/functions" $fpath)

# History Settings ---------------------------------
SAVEHIST=1000
HISTSIZE=1000
HISTFILE=${HOME}/.zsh_history
setopt histverify
setopt incappendhistory
setopt extendedhistory
setopt histignoredups
setopt histignorealldups
setopt histallowclobber
setopt histreduceblanks
setopt histignorespace
setopt histnostore
setopt histnofunctions
setopt nohistbeep

# Aliases and Options ------------------------------
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

alias startmongo='mongod run --config /usr/local/Cellar/mongodb/1.6.5-x86_64/mongod.conf'

# Virtualenv + Virtualenvwrapper -------------------
export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME="${HOME}/.virtualenvs"
    source /usr/local/bin/virtualenvwrapper.sh
    [[ -d "${WORKON_HOME}" ]] || mkdir -p "${WORKON_HOME}"
fi

# Everything Else ----------------------------------

setopt autocd
setopt extendedglob

setopt multios

setopt correct

setopt noclobber

DIRSTACKSIZE=10
setopt autopushd

export EDITOR=vim
bindkey -v

setopt long_list_jobs

# Completion ---------------------------------------
autoload -U compinit
compinit -i
zmodload -i zsh/complist

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  `hostname`
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/

typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

autoload colors
colors

autoload title

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

#Appears when you have the prompt
function precmd {
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

#Appears at the beginning of (and during) of command execution
function preexec {
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>$2%<<"
}

setopt promptsubst
autoload -Uz promptinit
promptinit
prompt callahad
