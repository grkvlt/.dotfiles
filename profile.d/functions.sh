##
# Functions
#
# Useful commands and functions for the shell environment.
#
# Copyright 2011-2015 by Andrew Donald Kennedy; All Rights Reserved.
##

##
# List file pointed to by which
function what() {
    ls -l $(which "$@");
}
##

##
# Prints directories to the specified level deep.
#
#     % deep 2
#     .
#     ./a
#     ./a/b
#     ./a/c
#     ./d
#     ./d/e
#
function deep() {
    lvl=$(($1 + 1))
    find . -type d |
        cut -d/ -f-${lvl} |
        uniq
}
##

##
# Creates a Unix filename using the first argument as the extension and the rest
# as the filename, lowercased and with invalid characters filtered out and spaces
# converted to hyphens.
#
#     % mkname txt PoTaTo-CHIPS are nice
#     potato-chips-are-nice.txt
#
function mkname() {
    ext=$1; shift
    name=$(echo $* |
            tr -d '\n\r' |
            tr -cs '[:upper:][:lower:]' '-' |
            tr '[:upper:]' '[:lower:]')
    echo ${name}.${ext}
}
##

##
# Renames set of files matching a pattern so that they are sequentially numbered.
#
# The first argument is a filenameshell glob pattern, which should always be quoted
# to prevent premature expansion. The second and third arguments are filename prefixes
# and suffixes, which are placed before and after the generated file number. The
# number itself is padded with sufficient leading zeros to allow alphanumeric sorting.
# If the string '{}' is included in the prefix or suffix, it will be replaced with
# the original filename, as in the first example below.
#
# NOTE filenames with the substring '{}' can potentially cause problems.
#
# The following examples give some ideas of how 'mkseq' can be used. The first shows
# use of the '{}' string in a prefix. The second is using a generic prefix, followed
# by both prefix and suffix arguments. The last example illustrates that the prefix
# argument can be an empty string.
#
#     % ls
#     parsley.txt       rosemary.txt        sage.txt
#     thyme.txt         concrete.txt
#     % mkseq "*.txt" "{}-"
#     % ls
#     parsley-1.txt     rosemary-2.txt      sage-3.txt
#     thyme-4.txt       concrete-5.txt
#     % mkseq "*.txt" "text-"
#     % ls
#     text-1.txt        text-2.txt          text-3.txt
#     text-4.txt        text-5.txt
#     % mkseq "*.txt" "aa-" "-bb"
#     % ls
#     aa-1-bb.txt       aa-2-bb.txt         aa-3-bb.txt
#     aa-4-bb.txt       aa-5-bb.txt
#     % mkseq "*.txt" "" "-post"
#     % ls
#     1-post.txt        2-post.txt          3-post.txt
#     4-post.txt        5-post.txt
#
# This example shows the numbering of a quantity of CSV data files that are named
# using the 'yyyymmdd' pattern, keeping that data and adding a sequence number for
# reference. Note that if there were 124 files, then all numbers would be padded
# on the left with leading zeros - see the first two lines of output.
#
#     % ls -l [0-9][0-9][0-9][0-9][0-9][0-9].csv | wc -l
#         124
#     % mkseq "[0-9][0-9][0-9][0-9][0-9][0-9].csv " "{}-" "A"
#     % ls *.txt
#     20120411-001A.csv  20120413-002A.csv  20120425-003A.csv
#     20120426-004A.csv  20120504-005A.csv  20120519-006A.csv
#     ...
#     20130105-121A.csv  20130204-122A.csv  20130103-123A.csv
#     20130105-124A.csv
#
function mkseq() {
    glob="$1"    # variables
    prefix="$2"  # new filenamen prefix
    suffix="$3"  # new filename suffix
    count=0      # sequence counter

    # calculate number of digits based on number of files that match the glob.
    # to be used for leading zeros in printf
    digits=$(ls -1 ${glob} |
            wc -l |
            tr -cd '[:digit:]' |
            wc -c |
            tr -cd '[:digit:]')

    for file in $1; do
        if [ ! -f ${file} ]; then
            echo "ERROR: ${file} is not a file"
            exit 1
        fi
        count=$((count + 1))

        # obtain the original filename and extension
        ext=$(echo ${file} |
                tr "." "\n" |
                tail -1)
        name=$(basename ${file} .${ext})

        # build the mv comand and then substitute the original filename for any {} that occurs
        cmd=$(printf "mv %s %s%0${digits}d%s.%s\n" "${file}" "${prefix}" "${count}" "${suffix}" "${ext}" |
                sed -e "s/{}/${name}/g")

        # rename the current file
        ${cmd}
    done
}
##

##
# Kill process that owns a port
function kp() {
    port=$1
    signal=${2:-"-9"}
    lsof -i TCP:${port} -t | xargs kill ${signal}
}
##

##
# List all processes with specific name that have TCP ports open
function pp() {
    name=${1:-".*"}
    lsof -i TCP:1-65535 |
        grep "${name}"
}
##

##
# Kill all processes with specific name that have TCP ports open
function kk() {
    name=${1:-".*"}
    signal=${2:-"-9"}
    lsof -i TCP:1-65535 |
        grep "${name}" |
        awk  '{ print $2; }' |
        uniq |
        xargs kill ${signal}
}
##

##
# Mount a disk image file (for .dmg files)
function mntimg() {
    file=${1}
    if [ -f "${file}" ]; then
        name=$(basename "${file}" .dmg)
        mount=${2:-/Volumes/${name}}
        if [ ! -d "${mount}" ]; then
            mkdir "${mount}"
        fi
        hdiutil attach "${file}" -mountpoint "${mount}"
    else
        echo "File ${file} does not exist"
        exit 1
    fi
}
##

##
# Open a manpage in Preview
function pman () {
    man -t "$1" | open -f -a Preview
}
##

##
# Quit an app
function quit () {
    for app in $*; do
        osascript -e 'quit app "'$app'"'
    done
}
##

##
# Reboot onto an alternate partition; Reverts to normal after the restart
# Checks various directory prefixes for mount point
# Usage:
#   alternative debian
function alternative () {
    [ $# -eq 1 ] || exit 1
    for prefix in "" "/Volumes" "/mnt" "/boot"; do
        [ -d "${prefix}/${1}" ] && (
                sudo bless -mount /Volumes/${folder}/ -legacy -setBoot -nextonly
                shutdown -r now
                exit 0
            )
    done
}
##

##
# Quick and dirty SMTP server; Port 25 by default, requires sudo
# Usage:
#   quicksmtpd portNumber
function quicksmtpd () {
    port=${1:-25}
    sudo python -m smtpd -n -c DebuggingServer localhost:${port}
}
##

##
# Quick and dirty HTTP server; Port 8080 by default
# Usage:
#   quickhttpd portNumber
function quickhttpd () {
    port=${1:-8080}
    python -m SimpleHTTPServer ${port}
}
##

##
# Pretty print JSON
function json () {
    curl -s "$@" | python -m json.tool
}
##

# vim:ts=4:sw=4
