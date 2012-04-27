##
# git setup
##

# __git_ps1 environment variables
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM=auto

# run git add or remove automatically
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

# create graphviz .dot file of commits
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
