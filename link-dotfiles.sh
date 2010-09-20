#!/bin/sh

OLDPWD=$PWD

cd "`dirname $0`"

# Ask user to remove any physical directories before linking
FLAG=0
for f in ./files/.[A-z]*; do
    if [ -d "$HOME/`basename $f`" -a ! -L "$HOME/`basename $f`" ]; then
        if [ $FLAG -eq 0 ]; then
            echo "Please remove:"
        fi
        echo "$HOME/`basename $f`"
        FLAG=1
    fi
done

# Bail if any physical directories were present
if [ $FLAG -ne 0 ]; then
    echo "Then re-run this script to install symlinks."
    cd "$OLDPWD"
    exit 1
fi

# Link the dotfiles
for f in ./files/.[A-z]*; do
    # Overwrite symlinks without asking for confirmation
    if [ -L "$HOME/`basename $f`" ]; then
        LNOPTS="-vsfh"
    else
        LNOPTS="-vsih"
    fi
    ln $LNOPTS "$PWD/files/`basename $f`" "$HOME/`basename $f`"
done

cd "$OLDPWD"
