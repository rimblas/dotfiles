#!/bin/sh

OLDPWD=$PWD
CONFIGHOME="${XDG_CONFIG_HOME:=$HOME/.config}"

cd "$(dirname "$0")" || exit 2

# Ask user to remove any physical directories before linking
FLAG=0
for f in ./files/.[A-z]*; do
    if [ -d "$HOME/$(basename "$f")" ] && [ ! -L "$HOME/$(basename "$f")" ]; then
        if [ $FLAG -eq 0 ]; then
            echo "Please remove:"
        fi
        echo "$HOME/$(basename "$f")"
        FLAG=1
    fi
done

for f in ./xdg_config_home/*; do
    if [ -d "$CONFIGHOME/$(basename "$f")" ] && [ ! -L "$CONFIGHOME/$(basename "$f")" ]; then
        if [ $FLAG -eq 0 ]; then
            echo "Please remove:"
        fi
        echo "$CONFIGHOME/$(basename "$f")"
        FLAG=1
    fi
done

# Bail if any physical directories were present
if [ $FLAG -ne 0 ]; then
    echo "Then re-run this script to install symlinks."
    cd "$OLDPWD" || exit 2
    exit 1
fi

# Link the dotfiles
for f in ./files/.[A-z]*; do
    # Overwrite symlinks without asking for confirmation
    if [ -L "$HOME/$(basename "$f")" ]; then
        LNOPTS="-vsfn"
    else
        LNOPTS="-vsin"
    fi
    ln $LNOPTS "$PWD/files/$(basename "$f")" "$HOME/$(basename "$f")"
done

for f in ./xdg_config_home/*; do
    # Overwrite symlinks without asking for confirmation
    if [ -L "$CONFIGHOME/$(basename "$f")" ]; then
        LNOPTS="-vsfn"
    else
        LNOPTS="-vsin"
    fi
    ln $LNOPTS "$PWD/xdg_config_home/$(basename "$f")" "$CONFIGHOME/$(basename "$f")"
done

# TODO: Neovim wants xsel and a python module installed. Check for and warn?

cd "$OLDPWD" || exit 2
