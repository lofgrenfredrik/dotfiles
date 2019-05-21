autoload -Uz vcs_info

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

function branch_icon() {
    echo "\xE2\x8E\x87"
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# PROMPT COLORS
C_USER="%{$FG[037]%}"
C_MACHINE="%{$FG[115]%}"
C_PATH="%{$FG[120]%}"
C_TIME="%{$FG[228]%}"
C_PROMPT="%{$FG[015]%}"
C_BRACKET="%{$FG[123]%}"

# GIT COLORS
GIT_STAGED="%{$FG[010]%}●"
GIT_UNSTAGED="%{$FG[011]%}●"
GIT_UNTRAKED="%{$FG[009]%}●"
GIT_BRANCH="%{$FG[051]%}"

zstyle ':vcs_info:*' stagedstr ${GIT_STAGED}
zstyle ':vcs_info:*' unstagedstr ${GIT_UNSTAGED}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ${C_BRACKET}'['${C_PROMPT}$(branch_icon)' '${C_BRACKET}'%b%c%u%B%'${C_BRACKET}']'
    } else {
        zstyle ':vcs_info:*' formats ${C_BRACKET}'['${C_PROMPT}$(branch_icon)' '${C_BRACKET}'%b%c%u%B%'${GIT_UNTRAKED}${C_BRACKET}']'
    }

    vcs_info
}

setopt prompt_subst
PROMPT='${C_USER}$USER ${C_PROMPT}@ ${C_MACHINE}%m: ${C_PATH}$(get_pwd)/ ${vcs_info_msg_0_}
${C_TIME}%* ${C_PROMPT}$ '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
