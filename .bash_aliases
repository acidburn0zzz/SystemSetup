#!/bin/bash

# Aliases for various Bash commands

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
    alias ls='ls -lh --color=auto'
    
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# I don't always use ls, but when I do, I prefer to know the file sizes and
# modification dates
alias ls='ls -lh'

# Other ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'