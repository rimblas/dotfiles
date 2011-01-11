# Homedir
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Android SDK
if [ -d "${HOME}/Developer/Android/android-sdk-mac_86" ]; then
    export PATH="${PATH}:${HOME}/Developer/Android/android-sdk-mac_86/tools"
fi

# Ruby
if [ -d "${HOME}/.gem/ruby/1.8/bin" ]; then
    export PATH="${PATH}:${HOME}/.gem/ruby/1.8/bin"
fi
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Go Lang
if [ -d "${HOME}/.local/src/go" ]; then
    export GOROOT="${HOME}/.local/src/go"
    export GOOS="darwin"
    export GOARCH="amd64"
    export GOBIN="${HOME}/.local/bin"
fi

# Hack: Keep $PATH synchronized for Cocoa and terminal apps
if [ `uname` = "Darwin" ]; then
    defaults write ~/.MacOSX/environment PATH "$PATH"
fi

# Miscellaneous
[ -r ${HOME}/.bashrc ] && . ${HOME}/.bashrc
