# Homedir
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Android SDK
if [ -d "${HOME}/.local/src/android-sdk-mac_86" ]; then
    export PATH="${PATH}:${HOME}/.local/src/android-sdk-mac_86/tools"
fi

# Ruby Gems
if [ -d "${HOME}/.gem/ruby/1.8/bin" ]; then
    export PATH="${PATH}:${HOME}/.gem/ruby/1.8/bin"
fi

# Go Lang
if [ -d "${HOME}/.local/src/go" ]; then
    export GOROOT="${HOME}/.local/src/go"
    export GOOS="darwin"
    export GOARCH="amd64"
    export GOBIN="${HOME}/.local/bin"
fi

# Miscellaneous
[ -r ${HOME}/.bashrc ] && . ${HOME}/.bashrc
