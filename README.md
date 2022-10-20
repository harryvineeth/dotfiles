# dotfiles
My dotfiles for a clean OS rampup.

## Supported OSes (detected automatically)

- Ubuntu (Tested on >= 16.04)
- macOS (Tested on >= 10.11)

## Usage

`sudo ./install.sh`

### Ubuntu

To preserve the user's HOME environment variable use
`sudo -E ./install.sh`

### Headless mode

`sudo ./install.sh --headless`

This installs only headless tools/applications and omits things such as Google Chrome and VSCode.

## TODO

- Fix ownership of files created by the script on Ubuntu 20.*
