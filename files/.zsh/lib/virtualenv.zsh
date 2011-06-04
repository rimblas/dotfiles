export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Automatically call workon when entering a folder with a .venv file
# Via http://hmarr.com/2010/jan/19/making-virtualenv-play-nice-with-git/

# Scenarios to consider:
# cd venv # venv active
# cd venv; cd foo; workon x; cd .. # venv or x? Probably x
# cd venv; cd foo; cd ..; cd .. # nothing active
# workon x; cd venv; cd .. # x active
# cd venv1; cd ../venv2 # venv2 active
function _workon_cwd() {
    if [[ -z $ENV_BASE && -r .venv ]]; then
        ENV_BASE=$PWD
        [[ -z $VIRTUAL_ENV ]] && workon `cat ".venv"`
    fi

    if [[ -n $ENV_BASE && ${PWD#$ENV_BASE} = ${PWD} ]]; then
        unset ENV_BASE
        [[ -n $VIRTUAL_ENV ]] && deactivate
    fi
}

function _venv_cd() {
    cd "$@" && _workon_cwd
}

alias cd="_venv_cd"
