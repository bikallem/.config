set fish_greeting ""

# Set vi bindings
set fish_key_bindings fish_user_key_bindings

# Load aliases
source ~/.config/fish/aliases.fish

# More secure homebrew settings
set -gx HOMEBREW_NO_INSECURE_REDIRECT 1
set -gx HOMEBREW_CASK_OPTS --require-sh

# Use GNU coreutils instead of macOS versions
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# JavaScript specific settings
# Set up nodenv
status --is-interactive; and source (nodenv init -|psub)

# Ruby specific settings
# Rbenv
status --is-interactive; and source (rbenv init -|psub)

# Go specific settings
# GOPATH
set -gx GOPATH $HOME/Developer/go

# Add locally compiled go programs to bin
set -gx PATH $PATH $GOPATH/bin

# OCaml specific settings
# Opam configuration
source /Users/nathan/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
