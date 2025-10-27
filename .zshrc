# Most setting from https://scriptingosx.com/2019/11/new-book-release-day-moving-to-zsh/
# https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Terminal editor
# export EDITOR=/usr/bin/nano

# prevent duplicate entries in path
declare -U path

# PATH
#path+=~/bin

### Homebrew ###
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

### Zinit ###
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Shell integrations
eval "$(fzf --zsh)"

### COLORS ###
# Activate color for ls
export CLICOLOR=1
# Custom colors
export LSCOLORS=gxfxcxhxbxegedabagacad

### NVM ###
# https://blog.yo1.dog/better-nvm-lazy-loading/
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

### HISTORY ###
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=$HISTSIZE
# dont't add to history if first character is a space
setopt HIST_IGNORE_SPACE
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# Verify before run
setopt HIST_VERIFY

### MISC SETTINGS ###
# Globbing case-insensitive
setopt NO_CASE_GLOB
# List globb matches
setopt GLOB_COMPLETE
# Tab selection option
setopt AUTO_MENU
# don't play sound, SILENCIO!!
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP

### Alias ###
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

### Functions ###
if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi

export PATH="/Users/lofgrenfredrik/.lando/bin:$PATH"; #landopath
