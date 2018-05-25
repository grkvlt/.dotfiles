##
# Transfer files
#
# Copyright 2011-2015 by Andrew Donald Kennedy; All Rights Reserved.
##

transfer() {
    if [ $# -eq 0 ]; then
        cat <<EOH
No arguments specified.
Usage:
    transfer /tmp/test.md
    cat /tmp/test.md | transfer test.md
EOH
        return 1
    fi 
    tmpfile=$(mktemp -t transferXXX)
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
    fi
    cat $tmpfile
    rm -f $tmpfile
}

alias transfer=transfer 

# vim:ts=4:sw=4
