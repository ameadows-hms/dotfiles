# auto-complete function for allowing tab-completion for projects
_go_to_complete () {
    local cur=${COMP_WORDS[COMP_CWORD]}
    if [ ${COMP_CWORD} == 2 ]
    then
        local prev=${COMP_WORDS[1]}
        COMPREPLY=( $(compgen -W "`/bin/ls ${REPO_ROOT}/$prev`" -- $cur) )
    else
        COMPREPLY=( $(compgen -W "`/bin/ls ${REPO_ROOT}`" -- $cur) )
    fi
}

complete -F _go_to_complete go_to
complete -F _go_to_complete g

