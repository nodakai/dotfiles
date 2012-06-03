# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nodakai/.zshrc'

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
setopt extended_glob

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

PROMPT=$'%{\e[${PROMPT_COLOR}m%}%T [%n@%m] %~%(!.#.$)%{\e[m%} '

path=($HOME/local/bin $path $HOME/prog/exp/ruby)

for dir in $HOME/*/i/bin; do
    if [ -d "$dir" ]; then
        path=("$dir" $path)
    fi
done

if [ -d $HOME/ocaml/bin ]; then
    path=($HOME/ocaml/{,s}bin $path)
fi

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
alias man='LANG=C man'

stty stop undef

function mkcd { mkdir -p "$@" && eval cd "\"\$$#\""; }

function mymake {
    local i=${1:-01} n=${2:-4}
    make -j $n &> make$i.log &
    sleep 0.1
    tailf make$i.log
}

function fnd {
    local pat=$1 dir=${2:-.}
    find "$dir" -type d \( -name .svn -o -name .git -o -name CVS -o -name .hg \) -prune -o -iname "*$pat*" -print
}

umask 002
