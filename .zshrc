autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz vcs_info

zstyle ':completion:*:*:kill:*:*' verbose yes
zstyle ':completion:*:*:lsof:-p:*' verbose yes

zstyle ':vcs_info:*' actionformats '[%F{2}%b%F{3}|%F{1}%a%F{5}%f] '
zstyle ':vcs_info:*' formats '[%F{2}%b%F{5}%f] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git svn

precmd()
{
    vcs_info
    export PROMPT="
${vcs_info_msg_0_}%{$fg[blue]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%} [%*] [%!] [%(?.%{$fg[green]%}.%{$fg[red]%})%?%{$reset_color%}] [%y] [%~]
%% "
}

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt extendedhistory
setopt histignoredups
setopt sharehistory

set -o emacs

export VISUAL=vim

export PATH=$HOME/bin:$PATH

eval `dircolors $HOME/.dircolors`

alias ls='ls --color=auto'

case "$(hostname)" in
    "orca")
        export PATH=/mnt/ssd0/austind/install/bin:$PATH
        ;;
    "t-rex")
        export PATH=/mnt/scratch0/austind/install/bin:$PATH
        ;;
esac

source ~/etc/zshrc
