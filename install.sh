#!/bin/bash

set -u
set -e

DOTFILE_REPO_ROOT='https://github.com/NellyWhadsDev/dotfiles'

export SOFTWARE_DIR=$HOME/Software
printf '%s\n' "Setting up 'Software' dir @ '$SOFTWARE_DIR'..." 1>&2
mkdir -p $SOFTWARE_DIR

printf '%s\n' "Setting script permissions..." 1>&2
chmod +x ./*/install.sh

# Alacritty setup
(cd alacritty ; ./install.sh)

# ZSH setup
(cd zsh ; ./install.sh)

# Tmux setup
(cd tmux ; ./install.sh)

# VSCode setup
(cd vscode ; ./install.sh)

printf '\n%s\n\n' "Done setting up OS tools" 1>&2
exit 0

