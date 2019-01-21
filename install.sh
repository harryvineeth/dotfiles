#!/bin/bash

set -u
set -e

DOTFILE_REPO_ROOT='https://github.com/NellyWhadsDev/dotfiles'

# Get system type
unameOut="$(uname -s)"
case "$unameOut" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=MacOS;;
    *)          machine="UNKNOWN:$unameOut"
esac

# If this is a Linux system, check for Ubuntu vs unknown
if [ "$machine" = "Linux" ]; then
    unameOut="$(uname -v)"
    case "$unameOut" in
        *Ubuntu*)    machine=Ubuntu;;
        *)           machine="UNKNOWN:$unameOut"
    esac
fi
export MACHINE=$machine

if [ "$MACHINE" = "Ubuntu" ] || [ "$MACHINE" = "MacOS" ]; then
    printf '\e[34m%s\e[0m\n' "Installing on $MACHINE" 1>&2
else
    printf '\e[31;1m%s\e[0m\n' "Unsupported environment: '$MACHINE'" 1>&2
    exit 1
fi

export REPOS_DIR=$HOME/Repos
printf '\e[34m%s\e[0m\n' "Setting up 'Repos' dir @ '$REPOS_DIR'..." 1>&2
mkdir -p $REPOS_DIR

printf '\e[34m%s\e[0m\n' "Setting script permissions..." 1>&2
chmod +x ./*/install.sh

printf '\e[34m%s\e[0m\n' "Installing universal dependancies..." 1>&2
if [ "$MACHINE" = "Ubuntu" ]; then
    sudo apt-get update
    sudo apt-get install curl python -y
elif [ "$MACHINE" = "MacOS" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
    brew install curl python
fi

# Alacritty setup
(cd alacritty ; ./install.sh)

# ZSH setup
(cd zsh ; ./install.sh)

# Tmux setup
(cd tmux ; ./install.sh)

# VSCode setup
(cd vscode ; ./install.sh)

# Google Chrome setup
(cd chrome ; ./install.sh)

printf '\n\e[34;1m%s\e[0m\n\n' "Done setting up OS tools" 1>&2
exit 0

