### Added by Homebrew
export PATH="/usr/local/sbin:$PATH"

export EDITOR=/usr/local/bin/nano

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

export NVM_DIR="/Users/ob0do/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
