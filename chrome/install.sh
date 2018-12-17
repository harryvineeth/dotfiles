#!/bin/bash

printf '\n%s\n\n' "--------Tmux Installation--------" 1>&2

export CHROME_DIR=$(pwd)

printf '%s\n' "Installing Google Chrome..." 1>&2
if [ "$MACHINE" = "Ubuntu" ]; then
    curl -L https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable -y
elif [ "$MACHINE" = "MacOS" ]; then
    brew cask install google-chrome
fi
