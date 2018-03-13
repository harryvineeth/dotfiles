#!/bin/bash

printf '\n%s\n\n' "--------Tmux Installation--------" 1>&2

export TMUX_DIR=$(pwd)

printf '%s\n' "Installing Tmux..." 1>&2
sudo apt-get install tmux -y

printf '%s\n' "Creating links..." 1>&2
ln -s $TMUX_DIR/.tmux.conf $HOME/.tmux.conf
