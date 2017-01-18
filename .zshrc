# Path to your oh-my-zsh installation.
export ZSH=/Users/lofgrenfredrik/.oh-my-zsh

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

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Docker
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/lofgrenfredrik/.docker/machine/machines/dinghy
export DOCKER_TLS_VERIFY=1
export DOCKER_MACHINE_NAME=dinghyexport DOCKER_HOST=tcp://192.168.99.100:2376

# Android
export ANDROID_HOME=/Users/ob0do/Library/Android
export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH

# Shortcuts
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi
