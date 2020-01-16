source $HOME/Repos/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle cp
antigen bundle git
antigen bundle debian
antigen bundle thefuck
antigen bundle safe-paste
antigen bundle tmux

antigen theme eendroroy/alien-minimal alien-minimal

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle Valiev/almostontop
antigen bundle jimhester/per-directory-history
antigen bundle psprint/history-search-multi-word
antigen bundle lukechilds/zsh-nvm
antigen bundle willghatch/zsh-saneopt
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle djui/alias-tips
antigen bundle zdharma/fast-syntax-highlighting

antigen apply

# Show hostname for in theme
export AM_SSH_SYM=$(hostname)

# Remove '_' alias to 'sudo'
unalias _

# Remove 'g' alias to 'git'
unalias g

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
alias gwd='git rev-parse --show-toplevel'
alias gst='git worktree prune ; git worktree list | grep --color -E "$(gwd).*|$" ; git branch ; git status --short ; git stash list'

# VSCode Insiders Alias
alias icode='code-insiders'
