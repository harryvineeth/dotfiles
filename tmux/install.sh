#!/bin/bash

printf '\n%s\n\n' "--------Tmux Installation--------" 1>&2

export TMUX_DIR=$(pwd)

printf '%s\n' "Installing Tmux..." 1>&2
if [ "$MACHINE" = "Ubuntu" ]; then
    sudo apt-get install tmux -y
elif [ "$MACHINE" = "MacOS" ]; then
    brew install tmux
fi

printf '%s\n' "Creating links..." 1>&2
ln -sfn $TMUX_DIR/.tmux.conf $HOME/.tmux.conf
