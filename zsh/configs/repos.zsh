# Directory where you store your repositories
REPO_ROOT=${REPO_ROOT:-~/Development/Repos}

# Use an alias instead of the function directly so that PATH is updated in callers context
alias g="go_to"

#
# Move into a repository and add its local node_modules/.bin to path
#
function go_to () {
    if [ $# -eq 2 ]
    then
        cd ${REPO_ROOT}/$1/$2
    else
        cd ${REPO_ROOT}/$1
    fi
    if [ -e "env/bin/activate" ]
    then
        # use four-space tabbing in JSON files in a python project
        export JSON_TABS=4
        source env/bin/activate
    fi
    if [ -e ".venv/bin/activate" ]
    then
        # use four-space tabbing in JSON files in a python project
        export JSON_TABS=4
        source .venv/bin/activate
    fi
    if [ -e ".nvmrc" ]
    then
        nvm use
    fi
}

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.dotfiles/bashrc/repos.bash
