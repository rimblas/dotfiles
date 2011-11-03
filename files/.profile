# Homedir
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Android SDK
if [ -d "${HOME}/Developer/Android/android-sdk-mac_86" ]; then
    export PATH="${PATH}:${HOME}/Developer/Android/android-sdk-mac_86/tools"
fi

# Ruby
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Go Lang
if [ -d "${HOME}/.local/src/go" ]; then
    export GOROOT="${HOME}/.local/src/go"
    export PATH="${PATH}:${GOROOT}/bin"
fi

# Node JS
if [ -d "/usr/local/lib/node" ]; then
    export NODE_PATH="${NODE_PATH}:/usr/local/lib/node"
fi

# Miscellaneous
[ -r ${HOME}/.bashrc ] && . ${HOME}/.bashrc
