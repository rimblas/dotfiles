set -x EDITOR "vim"

set -x LC_COLLATE "C"

set -x LESS "-F -g -i -M -R -S -w -X -z-4"
if command -v lesspipe.sh > /dev/null
    set -x LESSOPEN "|lesspipe.sh %s"
end

function add_user_path --description='Helper for modifying $PATH'
    for path in $argv
        if test -d $path; and not contains $path $fish_user_paths
            set -g fish_user_paths $fish_user_paths $path
        end
    end
end


# Use OpenSSL headers from Homebrew on macOS. Necessary for compiling Servo:
# https://github.com/sfackler/rust-openssl/issues/255
# https://github.com/servo/servo/issues/7930
# if test (uname -s) = 'Darwin'; and type -q brew
#     set -l base (brew --prefix openssl)
#     if test -d $base
#         set -x DEP_OPENSSL_INCLUDE "$base/include"
#         set -x OPENSSL_INCLUDE_DIR "$base/include"
#     end
# end

set fish_key_bindings fish_vi_key_bindings

set theme_date_format "+%H:%M:%S"
# set theme_display_date "no"
set theme_display_vi "yes"
set theme_display_vi_hide_mode "insert"
set theme_show_exit_status "yes"

# remove the fish greeting
set -e fish_greeting

# Global node global packages (for the user)
add_user_path ~/Dropbox/node/npm_packages/bin
add_user_path ~/node/npm_packages/bin

# aliases for sql=sqlplus and sqlcl
alias sql='rlwrap sqlplus'
alias sqlcl='~/Dropbox/oracle/sqlcl/bin/sql'

# export variables for Oracle
# set -x DYLD_LIBRARY_PATH ~/Dropbox/oracle/instantclient_11_2
set -x DYLD_LIBRARY_PATH ~/Dropbox/oracle/product/instantclient/12.2.0.1.0
set -x TNS_ADMIN ~/Dropbox/oracle/network/admin
set -x SQLPATH ~/Dropbox/oracle/


test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

alias wmgt="cd /Users/rimblas/Dropbox/work/repos/wmgt"
