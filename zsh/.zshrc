source $HOME/Repos/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle git
antigen bundle debian
antigen bundle autojump
antigen bundle sudo
antigen bundle safe-paste
antigen bundle tmux

antigen theme subnixr/minimal

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

# Auto-insert first completion on ambiguity
setopt menu_complete

# Remove '_' alias to 'sudo'
unalias _

# Disable git stash pager
git config --global pager.stash false
git config --global pager.branch false

# Git worktree aliases
alias gw='git worktree'
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwac='git worktree add --checkout'
alias gwp='git worktree prune'

# Custom git status alias
alias gst='git worktree prune ; git worktree list | grep --color -E "$(gwd).*|$" ; git branch ; git status --short ; git stash list'
