typeset -U path

export LC_COLLATE="C"

# Homedir
if [[ -d "${HOME}/.local/bin" ]]; then
    path=("${HOME}/.local/bin" $path)
fi

# Android SDK
if [[ -d "${HOME}/Developer/Android/android-sdk-mac_86" ]]; then
    path=($path "${HOME}/Developer/Android/android-sdk-mac_86/tools")
fi

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
      rehash|shell)
        eval `rbenv "sh-$command" "$@"`;;
      *)
        command rbenv "$command" "$@";;
      esac
    }
fi

# Go Lang
# Tweak GOROOT if user-specific install found
if [[ -d "${HOME}/.local/src/go" ]]; then
    export GOROOT="${HOME}/.local/src/go"
    path=($path "${GOROOT}/bin")
fi

if [[ -d "${HOME}/.local/golang" ]]; then
    export GOPATH="${HOME}/.local/golang"
fi

if [[ -d "${HOME}/Projects/Golang" ]]; then
    export GOPATH="${HOME}/Projects/Golang"
fi

# Hack: Keep $PATH synchronized for Cocoa and terminal apps
if [[ `uname` = 'Darwin' ]]; then
    defaults write ~/.MacOSX/environment PATH "$PATH"
fi
