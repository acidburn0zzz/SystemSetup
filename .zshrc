autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz vcs_info

zstyle ':completion:*:*:kill:*:*' verbose yes
zstyle ':completion:*:*:lsof:-p:*' verbose yes

zstyle ':vcs_info:*' actionformats '[%F{2}%b%F{3}|%F{1}%a%F{5}%f] '
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git svn

precmd()
{
    vcs_info
    export PROMPT="%{$fg[cyan]%}%* %n@%m:%~ (branch: ${vcs_info_msg_0_})
>%{$reset_color%} "
}

#
#PS1='\[\033[96m\]\h:\w > \[\033[00m\]'

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

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

echo -e "\033[96mWelcome back to ${HOSTNAME}, sir.\033[00m"

source ~/etc/zshrc
