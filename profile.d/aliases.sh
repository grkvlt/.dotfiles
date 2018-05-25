##
# Aliases
#
# Useful shell aliases.
#
# Copyright 2011-2015 by Andrew Donald Kennedy; All Rights Reserved.
##

##
# Set ls options
alias ls='ls -FGh'
##

##
# Reset location after disk re-mount
alias ccd='cd $(pwd -P)'
##

##
# Resume an scp file copy that was interrupted
alias rcp='rsync --partial --progress --rsh=ssh'
##

##
# Numeric date
alias yyyymmdd="date +'%Y%m%d'"
##

##
# Execute vi as root
alias svi='sudo vi'
##

##
# Apple airport CLI utility
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
##

##
# MacPorts versions to use in preference
#for port in emacs vim vi; do
#    alias ${port}=/opt/local/bin/${port}
#done
##

##
# Character ruler for measuring text widths
alias ruler="yes 0-2-4-6-8- | paste - - - - - - - - - - | tr -d '\t ' | head -1"
##

##
# Start proxy connection to AWS VPN machine
alias proxystart="ssh -L 8888:localhost:8888 -N ubuntu@sng.abstractvisitorpattern.co.uk"
##

# vim:ts=4:sw=4
