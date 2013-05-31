#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Git Settings
if [ -e "${HOME}/.setup_git" ]; then
    source "${HOME}/.setup_git"
fi

# AWS Settings
if [ -e "${HOME}/.setup_aws" ]; then
        source "${HOME}/.setup_aws"
fi

# Ports
PATH="${PATH}:/opt/local/bin:/opt/local/sbin"

# Default editor
export EDITOR=vim
export VISUAL=vim

# Python initial imports
export PYTHONSTARTUP=${HOME}/.pythonrc

