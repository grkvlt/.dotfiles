##
# Prompt
#
# Set the shell PS1 prompt to something informative
#
# Copyright 2011-2013 by Cloudsoft Corp.; All Rights Reserved.
##

##
# Set the prompt to display information about the current directory and the
# git branch and work in progress status (if inside a checked out repository)
# on the title bar of the window.
case "${TERM}" in
    xterm*|ansi|screen)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}$(test $(id -u) -eq 0 || __git_ps1)\007"'
        ;;
esac
PS1="[\u@\h \W\$(test \$(id -u) -eq 0 || __git_ps1)]\\$ "
shopt -s checkwinsize # Turn on checkwinsize
export PS1 PROMPT_COMMAND
##

# vim:ts=4:sw=4
