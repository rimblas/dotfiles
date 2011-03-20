export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME="${HOME}/.virtualenvs"
    source /usr/local/bin/virtualenvwrapper.sh
    [[ -d "${WORKON_HOME}" ]] || mkdir -p "${WORKON_HOME}"
fi
