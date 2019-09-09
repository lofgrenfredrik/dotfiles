# Plugins
plugins=(git z zsh-nvm)

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# History
SAVEHIST=100000

# Theme.
ZSH_THEME="thor"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration
source $ZSH/oh-my-zsh.sh

# Terminal editor
export EDITOR=/usr/local/bin/nano

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Path to dotfiles repo
export DOTFILES_REPO_PATH="${HOME}/Repos/lofgrenfredrik/dotfiles"

# Shortcuts
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi

# NVM
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://www.iterm2.com/documentation-shell-integration.html
# Run: curl -L https://iterm2.com/shell_integration/zsh \
# -o ~/.iterm2_shell_integration.zsh

# Source the .iterm2_shell_integration.zsh if it exists
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
iterm2_print_user_vars() {
	iterm2_set_user_var nodeVersion $(node -v)
	iterm2_set_user_var npmVersion $(npm -v)
	iterm2_set_user_var nowVersion $(now -v)
}
