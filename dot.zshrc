# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/k_noda/.zshrc'

autoload -Uz compinit
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# End of lines added by compinstall

setopt share_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_PUSHD
setopt AUTO_CD
setopt NO_FLOW_CONTROL
setopt nonomatch
setopt prompt_subst

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export LANG=ja_JP.UTF-8
path=($HOME/local/bin $path $HOME/prog/exp/ruby)
export EDITOR=vim
export PAGER='lv'
export GREP_OPTIONS='--binary-files=without-match --exclude=.tags --exclude-dir=.git --exclude-dir=.svn --exclude=*~ --color=auto'
export PROMPT=$'%{\e[${PROMPT_COLOR}m%}%T [%n@%m] %~%(!.#.$)%{\e[m%} '
# export PYTHONPATH=$HOME/vt/local/lib64/python2.4/site-packages:$PYTHONPATH

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-%b '
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:*' actionformats '(%s)-%b|%a '
precmd() {
    PROMPT_COLOR="$[32 + ($PROMPT_COLOR - 31) % 5]"

    psvar=()
    vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

alias ls='ls -hF --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias make='LANG=C make'

stty stop undef

function mkcd { mkdir -p "$@" && eval cd "\"\$$#\""; }

function l {
}

umask 002
