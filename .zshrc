# My pimped-out zsh prompt.
# Based on Seth House's prompt:
# https://github.com/whiteinge/dotfiles/blob/master/.zsh_shouse_prompt

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz vcs_info

local reset white gray green red yellow
reset="%{${reset_color}%}"
white="%{$fg[white]%}"
gray="%{$fg_bold[black]%}"
green="%{$fg_bold[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"

# Set up VCS_INFO
zstyle ':vcs_info:*' enable git hg bzr svn
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true

zstyle ':vcs_info:hg*' formats "(%s)[%i%u %b %m]" # rev+changes branch misc
zstyle ':vcs_info:hg*' actionformats "(%s|${white}%a${gray})[%i%u %b %m]"

zstyle ':vcs_info:hg*:netbeans' use-simple true
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true

zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c %p"

zstyle ':vcs_info:hg*:*' unstagedstr "${green}+${gray}"
zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local rev.
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch

zstyle ':vcs_info:git*' formats "(%b)" # hash changes branch misc
zstyle ':vcs_info:git*' actionformats "(%s|${white}%a${gray}) %12.12i %c%u %b%m"

zstyle ':vcs_info:git*:*' stagedstr "${green}S${gray}"
zstyle ':vcs_info:git*:*' unstagedstr "${red}U${gray}"

zstyle ':completion:*:*:kill:*:*' verbose yes
zstyle ':completion:*:*:lsof:-p:*' verbose yes

zstyle ':vcs_info:hg*+set-hgrev-format:*' hooks hg-hashfallback
zstyle ':vcs_info:hg*+set-message:*' hooks mq-vcs
zstyle ':vcs_info:git*+set-message:*' hooks git-st

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name --abbrev-ref 2>/dev/null)}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${green}+${ahead}${gray}" )

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${red}-${behind}${gray}" )

        hook_com[branch]="${remote} ${(j:/:)gitstatus}"
    fi
}

function setprompt() {
    local -a lines infoline
    local x

    ### First, assemble the top line
    # Current dir; show in yellow if not writable
    [[ -w $PWD ]] && pwdcolor=(${green}) || pwdcolor=(${yellow})
    
    infoline="%* %n@%m:${pwdcolor}%~${reset}"
    
    ### Now, assemble all prompt lines
    [[ -n ${vcs_info_msg_0_} ]] && infoline+=( "${gray}${vcs_info_msg_0_}${reset}" )
    infoline+=( "%(1j.${gray}%j${reset} .)%(0?.${white}.${red})${reset} " )

    ### Finally, set the prompt
    PROMPT="${white}${infoline}
${white}>${reset} "
}

venv_rprompt () {
    if [[ -n $VIRTUAL_ENV ]]; then
        RPROMPT="${white} venv:$(basename $VIRTUAL_ENV)${reset}"
    else
        RPROMPT=""
    fi
}

# Executed before each prompt
function precmd {
    vcs_info
    setprompt
    venv_rprompt
}

#precmd()
#{
#    vcs_info
#    
#    prompt="%* %n@%m:%~ "
#    
#    if [[ ${vcs_info_msg_0_} != "" ]]; then
#        prompt="${prompt} (${vcs_info_msg_0_} branch: %?)"
#    fi
#        
#    export PROMPT="%{$fg[white]%}${prompt}
#>%{$reset_color%} "
#}

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


