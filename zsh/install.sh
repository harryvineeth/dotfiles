#!/bin/bash

printf '\n%s\n\n' "--------ZSH Installation--------" 1>&2

export ANTIGEN_DIR=$SOFTWARE_DIR/antigen
export ZSH_DIR=$(pwd)

printf '%s\n' "Installing Dependancy: Antigen..." 1>&2
mkdir -p $ANTIGEN_DIR
curl -L git.io/antigen > $ANTIGEN_DIR/antigen.zsh

printf '%s\n' "Installing Dependancy: fzy..." 1>&2
curl -s https://packagecloud.io/install/repositories/jhawthorn/fzy/script.deb.sh | sudo bash
sudo apt-get install fzy -y

printf '%s\n' "Installing ZSH..." 1>&2
sudo apt-get install zsh -y

printf '%s\n' "Creating links..." 1>&2
ln -s $ZSH_DIR/.zshrc $HOME/.zshrc
chsh -s $(which zsh)
