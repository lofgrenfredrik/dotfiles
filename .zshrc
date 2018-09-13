# Path to your oh-my-zsh installation.
export ZSH=/Users/lofgrenfredrik/.oh-my-zsh

# history
SAVEHIST=100000

# Theme.
ZSH_THEME="thor"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git z)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# User configuration
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"

# Terminal editor
export EDITOR=/usr/local/bin/nano
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Docker
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/lofgrenfredrik/.docker/machine/machines/dinghy"
export DOCKER_MACHINE_NAME="dinghy"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Shortcuts
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
