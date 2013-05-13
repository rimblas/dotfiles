if [[ "$COLORTERM" == "gnome-terminal" ]]; then
    export TERM=gnome-256color
fi

function title {
  if [[ "$TERM" == "screen*" ]]; then 
    print -Pn "\ek$1\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ ($TERM =~ "^(xterm|rxvt|gnome)") ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2\a" #set window name
    print -Pn "\e]1;$1\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

#Appears when you have the prompt
function title_precmd {
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

#Appears at the beginning of (and during) of command execution
function title_preexec {
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>$2%<<"
}

autoload -U add-zsh-hook
add-zsh-hook precmd title_precmd
add-zsh-hook preexec title_preexec
