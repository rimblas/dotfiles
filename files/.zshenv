typeset -U path

# Homedir
if [[ -d "${HOME}/.local/bin" ]]; then
    path=("${HOME}/.local/bin" $path)
fi

# Android SDK
if [[ -d "${HOME}/Developer/Android/android-sdk-mac_86" ]]; then
    path=($path "${HOME}/Developer/Android/android-sdk-mac_86/tools")
fi

# Ruby (RVM)
#[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"

# Ruby (RBEnv)
if [[ -d "${HOME}/.rbenv/bin" ]]; then
    # Edited output of `rbenv init -`
    path=("$HOME/.rbenv/bin" "${HOME}/.rbenv/shims" $path)
    source "${HOME}/.rbenv/completions/rbenv.zsh"
    function rbenv() {
      command="$1"
      if [ "$#" -gt 0 ]; then
        shift
      fi

      case "$command" in
      shell)
        eval `rbenv "sh-$command" "$@"`;;
      *)
        command rbenv "$command" "$@";;
      esac
    }
fi

# Go Lang
if [[ -d "${HOME}/.local/src/go" ]]; then
    export GOROOT="${HOME}/.local/src/go"
    path=($path "${GOROOT}/bin")
fi

# Hack: Keep $PATH synchronized for Cocoa and terminal apps
if [[ `uname` = 'Darwin' ]]; then
    defaults write ~/.MacOSX/environment PATH "$PATH"
fi
