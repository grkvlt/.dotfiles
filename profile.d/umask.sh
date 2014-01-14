##
# Set the umask(2)
#
# Copyright 2013 by Andrew Kennedy; All Rights Reserved
##

##
# By default, we want this to get set, even for non-interactive, non-login shells.
if [ "${UID}" -gt 99 ] && [ "$(id -gn)" = "$(id -un)" ]; then
    umask 002
else
    umask 022
fi
##

# vim:ts=4:sw=4
