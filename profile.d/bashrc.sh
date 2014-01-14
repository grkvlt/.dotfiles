##
# Startup for interactive bash(1) shells.
#
# Copyright 2013 by Andrew Kennedy; All Rights Reserved
##

##
# Are we an interactive shell?
if [ -z "$PS1" ]; then
    return
else
    # Execute local bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
        . ${HOME}/.bashrc
    fi
fi
##

# vim:ts=4:sw=4
