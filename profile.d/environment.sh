

function mkname() {
    ext=$1
    shift
    echo "$*" |
        tr -C -d "[A-Z][a-z] " |
        tr "[A-Z][a-z] " "[a-z][a-z]-" |
        sed -e "s/$/.${ext}/"
}

