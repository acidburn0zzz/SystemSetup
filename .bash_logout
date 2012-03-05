#!/bin/bash
# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

# Jarvis goodbye message
echo -e '\033[96mHave a good day, sir.\033[00m'

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
