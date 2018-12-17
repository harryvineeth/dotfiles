#!/bin/bash

ALACRITTY_REPO_DIR=$REPOS_DIR/alacritty

printf '\n%s\n\n' "--------Alacritty Installation--------" 1>&2

printf '%s\n' "Installing Dependancy: Rust..." 1>&2
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup override set stable
rustup update stable

if [ "$MACHINE" = "Ubuntu" ]; then
    printf '%s\n' "Instaling Dependancy: Debian Tools..." 1>&2
    sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip cargo -y
fi

printf '%s\n' "Installing Alacritty..." 1>&2
git clone https://github.com/jwilm/alacritty.git $ALACRITTY_REPO_DIR
if [ "$MACHINE" = "Ubuntu" ]; then
    (cd $ALACRITTY_REPO_DIR ; cargo build --release)
elif [ "$MACHINE" = "MacOS" ]; then
    (cd $ALACRITTY_REPO_DIR ; make app)
fi

if [ "$MACHINE" = "Ubuntu" ]; then
    printf '%s\n' "Creating links..." 1>&2
    sudo cp $ALACRITTY_REPO_DIR/target/release/alacritty /usr/local/bin
    sudo desktop-file-install $ALACRITTY_REPO_DIR/alacritty.desktop
    sudo update-desktop-database
fi
