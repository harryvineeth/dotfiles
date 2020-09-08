# dotfiles
My dotfiles for a clean OS rampup.

## Supported OSes (detected automatically)

- Ubuntu (Tested on >= 16.04)
- macOS (Tested on >= 10.11)

## Usage

`sudo ./install.sh`

### Headless mode

`sudo ./install.sh --headless`

This installs only headless tools/applications and omits things such as Google Chrome and VSCode.

### TODO

- Update for Ubuntu >= 19.10 `$HOME` is `/root` for all `sudo` calls without explicitly using `--preserve-env=HOME`
