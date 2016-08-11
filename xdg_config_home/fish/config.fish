set -x EDITOR "vim"

set -x LC_COLLATE "C"

set -x LESS "-F -g -i -M -R -S -w -X -z-4"
if command -v lesspipe.sh > /dev/null
    set -x LESSOPEN "|lesspipe.sh %s"
end

# Paths
for DIR in "$HOME/.cargo/bin" "$HOME/.gocode/bin"
    if test -d $DIR; and not contains $fish_user_paths $DIR
        set fish_user_paths $fish_user_paths $DIR
    end
end

# Golang
for DIR in "$HOME/.gocode" "$HOME/Projects/LetsAuth/gocode"
    if test -d $DIR
        set -x GOPATH "$GOPATH:$DIR"
    end
end

set fish_key_bindings fish_vi_key_bindings

set theme_date_format "+%H:%M:%S"
set theme_display_vi "yes"
set theme_display_vi_hide_mode "insert"
set theme_show_exit_status "yes"

set -e fish_greeting
