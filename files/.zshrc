# setopt shwordsplit
# setopt interactivecomments

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

function title {
  if [[ "$TERM" == "screen" ]]; then 
    print -Pn "\ek$1\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ ($TERM =~ "^xterm") ]] || [[ ($TERM == "rxvt") ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2\a" #set window name
    print -Pn "\e]1;$1\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

autoload -Uz vcs_info

#Appears when you have the prompt
function precmd {
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
  vcs_info 'prompt'
}

#Appears at the beginning of (and during) of command execution
function preexec {
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>$2%<<"
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(hostname -s)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$vcs_info_msg_0_
$(rvm_prompt_info)$(virtualenv_info)$vcs_info_msg_1_ '

setopt promptsubst

zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' hgrevformat "%r"
zstyle ':vcs_info:hg*:*' branchformat "%b"
zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:*' unstagedstr '?'
zstyle ':vcs_info:*' stagedstr '!'
zstyle ':vcs_info:hg*:*' actionformats " on %{$fg[red]%}%a %{$fg[magenta]%}%b%{$fg[green]%}%u%c%{$reset_color%}" "☿"
zstyle ':vcs_info:hg*:*' formats " on %{$fg[magenta]%}%b%{$fg[green]%}%u%c%{$reset_color%}" "☿"
zstyle ':vcs_info:git*:*' actionformats " on %{$fg[red]%}%a %{$fg[magenta]%}%b%{$fg[green]%}%u%c%{$reset_color%}" "±"
zstyle ':vcs_info:git*:*' formats " on %{$fg[magenta]%}%b%{$fg[green]%}%u%c%{$reset_color%}" "±"
zstyle ':vcs_info:*' actionformats " on %{$fg[red]%}%a %{$fg[magenta]%}%b%{$fg[green]%}%u%c%{$reset_color%}" "●"
zstyle ':vcs_info:*' formats " on %{$fg[magenta]%}%b%{$fg[green]%}%u%c%{$reset_color%}" "●"
zstyle ':vcs_info:*' nvcsformats "" "○"

function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt 2> /dev/null) || return
  [[ -n $ruby_version ]] && echo "($ruby_version) "
}
