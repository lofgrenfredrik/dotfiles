# Most setting from https://scriptingosx.com/2019/11/new-book-release-day-moving-to-zsh/

# Terminal editor
export EDITOR=/usr/bin/nano

# prevent duplicate entries in path
declare -U path

# PATH
path+=~/bin

### HISTORY ###
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
SAVEHIST=5000
HISTSIZE=2000

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

### COLORS ###
# Activate color for ls
export CLICOLOR=1
# Custom colors
export LSCOLORS=gxfxcxhxbxegedabagacad

### COMPLETION ###
# Match colors in LSCOLORS
zstyle ':completion:*:default' list-colors 'di=36:ln=35:so=32:pi=37:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# list with colors
zstyle ':completion:*' list-colors ''

# load completion
autoload -Uz compinit && compinit

# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

# Alias
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# Functions
if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi

### NVM ###
# https://blog.yo1.dog/better-nvm-lazy-loading/
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# This lazy loads nvm
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  nvm $@
}

# # This resolves the default node version
DEFAULT_NODE_VER="$( (< "$NVM_DIR/alias/default" || < ~/.nvmrc) 2> /dev/null)"
while [ -s "$NVM_DIR/alias/$DEFAULT_NODE_VER" ] && [ ! -z "$DEFAULT_NODE_VER" ]; do
  DEFAULT_NODE_VER="$(<"$NVM_DIR/alias/$DEFAULT_NODE_VER")"
done

# This adds the default node version to PATH
if [ ! -z "$DEFAULT_NODE_VER" ]; then
  export PATH="$NVM_DIR/versions/node/v${DEFAULT_NODE_VER#v}/bin:$PATH:/usr/local/sbin"
fi

### PURE PROMPT ###
# https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Pure prompt styling
zstyle :prompt:pure:path color green
zstyle :prompt:pure:host color yellow
zstyle :prompt:pure:user color magenta
zstyle :prompt:pure:git:branch color cyan
zstyle :prompt:pure:git:arrow color white
zstyle :prompt:pure:git:action color yellow

### PLUG-INS ###
# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_STRATEGY=( history completion )
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3,underline"
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="git *"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
