# source ~/.zplug/init.zsh

# # Oh-my-zsh plugins
# zplug "plugins/common-aliases", from:oh-my-zsh
# zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/debian", from:oh-my-zsh
# zplug "plugins/autojump", from:oh-my-zsh
# zplug "plugins/sudo", from:oh-my-zsh
# zplug "plugins/web-search", from:oh-my-zsh

# # From github
# zplug "subnixr/minimal", use:"minimal.zsh"

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# zplug load

source $HOME/Software/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle git
antigen bundle debian
antigen bundle autojump
antigen bundle sudo
antigen bundle safe-paste
antigen bundle tmux

antigen theme robbyrussell
#antigen theme subnixr/minimal

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle Valiev/almostontop
antigen bundle psprint/history-search-multi-word
antigen bundle b4b4r07/enhancd
antigen bundle RobSis/zsh-completion-generator
antigen bundle marzocchi/zsh-notify
antigen bundle lukechilds/zsh-nvm
antigen bundle willghatch/zsh-saneopt
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# setopt auto_cd
# setopt correct
# setopt hist_expire_dups_first
# setopt no_beep
setopt auto_menu

unalias _
alias gw='git worktree'
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwac='git worktree add --checkout'
alias gwp='git worktree prune'

alias gwd='git rev-parse --show-toplevel'
alias gst='git worktree prune ; git worktree list | grep --color -E "$(gwd).*|$" ; echo $(git branch) ; git status --short ; echo $(git stash list -q)'
alias gsui='git submodule update --init'
alias gbD='git branch -D'
