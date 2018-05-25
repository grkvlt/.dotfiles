##
# Git Setup
#
# Copyright 2011-2015 by Andrew Donald Kennedy; All Rights Reserved.
##

# Configure __git_ps1 environment variables
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM=auto verbose
export GIT_PS1_SHOWCOLORHINTS=true

# Run git add or remove automatically
function gitmo() {
    param=$1
    case "${param}" in
        [Mm]*)  status="M"
                cmd="add"
                ;;
        [Dd]*)  status="D"
                cmd="rm -f --ignore-unmatch"
                ;;
        [Nn]*)  status="\?\?"
                cmd="add"
                ;;
        *)      echo "Must be either modified, deleted or new"
                ;;
    esac
    [ "${cmd}" ] && {
        git status --porcelain |
            grep "${status} " |
            cut -c4- |
            xargs git ${cmd}
    }
}

# Create graphviz .dot file of commits
function git-graphviz() {
    cat <<EOH
digraph git {
    node [
        style="rounded,solid,filled,setlinewidth(2)",
        fillcolor=lightgray, shape=record,
        fontname="Lucida Grande", fontsize=8
    ]
    edge [ style="solid,setlinewidth(2)", arrowhead=vee ]
EOH
    {
        if [ "${DETAIL}" ]; then
            git log --pretty="format: %h [ label=\"{%f|%ae|%ai|%H}\" ]" "$@"
        fi
        git log --pretty="format: %h -> { %p }" "$@"
    } | sed "s/-\([^>]\)/ \1/g" |
        sed "s/ \([0-9a-f]\{7\}\)/ \"\1\"/g" |
        sed "s/^/    /"
    echo "}"
}

# Delete old, merged branches
alias git-delete-merged='git branch --merged | grep -v "\*" | xargs git branch -D'

function git-followup() {
    if [ $# -eq 0 ]; then
        email="andrew.kennedy@cloudsoftcorp.com"
    else
        email=$1
    fi

    git log --since '1 day ago' --oneline --author '${email}'
}

# Create g-prefixed shell aliases for defined git commands
for alias in $(git var -l | sed -nE 's/^alias\.([^=]*)=.*/\1/p'); do
    if ! command -v "g${alias}" >/dev/null 2>&1; then
        alias g${alias}="git ${alias}"
    fi
done

# vim:ts=4:sw=4
