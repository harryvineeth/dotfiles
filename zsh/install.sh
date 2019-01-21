#!/bin/bash

printf '\n%s\n\n' "--------ZSH Installation--------" 1>&2

export ANTIGEN_DIR=$REPOS_DIR/antigen
export ZSH_DIR=$(pwd)

printf '%s\n' "Installing Dependancy: Antigen..." 1>&2
mkdir -p $ANTIGEN_DIR
curl -L git.io/antigen > $ANTIGEN_DIR/antigen.zsh

printf '%s\n' "Installing Dependancy: thefuck..." 1>&2
if [ "$MACHINE" = "Ubuntu" ]; then
    sudo apt-get install python3-dev python3-pip
    sudo pip3 install thefuck
elif [ "$MACHINE" = "MacOS" ]; then
    brew install thefuck
fi

printf '%s\n' "Installing ZSH..." 1>&2
if [ "$MACHINE" = "Ubuntu" ]; then
    sudo apt-get install zsh -y
elif [ "$MACHINE" = "MacOS" ]; then
    brew install zsh
fi

printf '%s\n' "Creating links..." 1>&2
ln -sfn $ZSH_DIR/.zshrc $HOME/.zshrc
if [ "$MACHINE" = "MacOS" ]; then
    echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
fi
chsh -s $(which zsh)
