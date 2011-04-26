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
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"

# Go Lang
if [[ -d "${HOME}/.local/src/go" ]]; then
    export GOROOT="${HOME}/.local/src/go"
    export GOOS='darwin'
    export GOARCH='amd64'
    export GOBIN="${HOME}/.local/bin"
fi

# Hack: Keep $PATH synchronized for Cocoa and terminal apps
if [[ `uname` = 'Darwin' ]]; then
    defaults write ~/.MacOSX/environment PATH "$PATH"
fi
