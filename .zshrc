# Plugins
plugins=(git z zsh-nvm)

# Path to your oh-my-zsh installation.
export ZSH=/Users/fredlofg/.oh-my-zsh

# history
SAVEHIST=100000

# Theme.
ZSH_THEME="thor"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# User configuration
source $ZSH/oh-my-zsh.sh

# Terminal editor
export EDITOR=/usr/local/bin/nano

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# AWS Viaplay
export AWS_REGION=eu-west-1
export AWS_DEFAULT_REGION=eu-west-1

# Shortcuts
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
iterm2_print_user_vars() {
	iterm2_set_user_var nodeVersion $(node -v)
}
