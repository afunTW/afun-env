function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}
