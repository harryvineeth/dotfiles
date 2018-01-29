#!/bin/bash

ALACRITTY_REPO_DIR=$SOFTWARE_DIR/alacritty

printf '\n%s\n\n' "--------Alacritty Installation--------" 1>&2

printf '%s\n' "Installing Dependancy: Rust..." 1>&2
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup override set stable
rustup update stable

printf '%s\n' "Instaling Dependancy: Debian Tools..." 1>&2
sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip -y

printf '%s\n' "Installing Alacritty..." 1>&2
git clone https://github.com/jwilm/alacritty.git $ALACRITTY_REPO_DIR
(cd $ALACRITTY_REPO_DIR ; cargo build --release)

printf '%s\n' "Creating links..." 1>&2
sudo cp $ALACRITTY_REPO_DIR/target/release/alacritty /usr/local/bin
cp $ALACRITTY_REPO_DIR/Alacritty.desktop ~/.local/share/applications
