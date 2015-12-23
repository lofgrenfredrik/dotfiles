autoload -Uz vcs_info

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{cyan}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{cyan}]'
    }

    vcs_info
}

setopt prompt_subst
PROMPT='%{$fg[cyan]%}%m%{$fg[cyan]%}: %{$fg[green]%}$(get_pwd)%{$fg[green]%}/%B%{%F{cyan}%}${vcs_info_msg_0_}%B%{%F{magenta}%}
$fg[yellow]%}%* %{$reset_color%}% $ '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
