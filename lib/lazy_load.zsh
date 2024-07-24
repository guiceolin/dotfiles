# https://gist.github.com/smac89/4b85bd3f9fb902439c0e67e36272832e
function lazy_load() {
    local -xr thunk="$(cat)"
    # (u) removes duplicates
    local -xr triggers=(${(u)@})
    
    # Only if length of triggers is greater than zero
    # otherwise the function will immediately execute.
    # (X) reports errors if any
    if [ ${(X)#triggers} -gt 0 ]; then
        eval " ${(@)triggers}() {
            trigger=\"\$0\"
            unfunction ${(@)triggers}
            ${thunk}
            if type \$trigger > /dev/null; then
                \$trigger \${@}
            fi
        }"
    fi
}
