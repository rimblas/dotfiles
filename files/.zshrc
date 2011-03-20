# setopt shwordsplit
# setopt interactivecomments

ZSH="${HOME}/.zsh"

fpath=("${ZSH}/functions" $fpath)

for config_file (${ZSH}/lib/*.zsh) source $config_file
