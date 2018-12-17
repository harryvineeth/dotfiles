source $HOME/Repos/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle git
antigen bundle debian
antigen bundle autojump
antigen bundle sudo
antigen bundle safe-paste
antigen bundle tmux

# antigen theme robbyrussell
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

# setopt auto_cd
# setopt correct
# setopt hist_expire_dups_first
# setopt no_beep
setopt auto_menu

# disable git stash pager
git config --global pager.stash false
git config --global pager.branch false

unalias _
alias gw='git worktree'
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwac='git worktree add --checkout'
alias gwp='git worktree prune'

alias gwd='git rev-parse --show-toplevel'
alias gst='git worktree prune ; git worktree list | grep --color -E "$(gwd).*|$" ; git branch ; git status --short ; git stash list'
alias gsui='git submodule update --init'
alias gbD='git branch -D'

# Makes me sign in with SSH key if necessary; tries to preserve sessions if possible.
# NOTE THAT this agent feature must be disabled to have security. Any application can ask the ssh-agent for stuff.
	# Actually, this may not be true. :/
# For a guide on how to use SSH with GitHub, try https://help.github.com/articles/generating-ssh-keys/
# If something messes up, ssh-reset to remove the starter file and restart the shell.
# "ssh-agent" returns a bash script that sets global variables, so I store it into a tmp file auto-erased at each reboot.
sshtmp=/tmp/sshagentthing.sh
if [ -f ~/.ssh/id_rsa ] || [ -f ~/.ssh/id_ecdsa ]; then # Only if we actually have some SSH stuff to do
	ssh_start () { ssh-agent > $sshtmp; . $sshtmp > /dev/null; ssh-add &> /dev/null; echo PID $SSH_AGENT_PID; } # -t 1200 may be added to ssh-agent.
  alias ssh-start=ssh_start
	ssh_end () { rm $sshtmp; kill $SSH_AGENT_PID; }
  alias ssh-end=ssh_end
	ssh_reset () { echo -n "Resetting SSH agent... "; ssh_end; ssh_start; }
  alias ssh-reset=ssh_reset
	if [ ! -f $sshtmp ]; then # Only do it if daemon doesn't already exist
		echo
		echo "New SSH agent"
		ssh_start
	else # Otherwise, everything is preserved until the ssh-agent process is stopped.
		# echo "Reauthenticating SSH agent..."
		. $sshtmp > /dev/null
		if ! ps -e | grep $SSH_AGENT_PID > /dev/null; then
			echo -n "No agent with PID $SSH_AGENT_PID is running. "
			ssh_reset
		fi
	fi
else
	echo "SSH is not currently set up. You might want to do that."
fi
