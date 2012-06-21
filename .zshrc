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
    
    prompt="%* %n@%m:%~ "
    
    if [[ ${vcs_info_msg_0_} != "" ]]; then
        prompt="${prompt} (${vcs_info_msg_0_} branch: %?)"
    fi
        
    export PROMPT="%{$fg[white]%}${prompt}
>%{$reset_color%} "
}

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt extendedhistory
setopt histignoredups
setopt sharehistory

if [ -f ~/.profile ]; then
    source ~/.profile
fi

if [ -f ~/etc/zshrc ]; then
    source ~/etc/zshrc
fi

# Jarvis welcome message
echo -e "\033[96mWelcome back to $(hostname), sir.\033[00m"


