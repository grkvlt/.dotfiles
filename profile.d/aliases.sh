##
# Aliases
#
# Useful shell aliases.
#
# Copyright 2011-2013 by Cloudsoft Corp.; All Rights Reserved.
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

# vim:ts=4:sw=4
