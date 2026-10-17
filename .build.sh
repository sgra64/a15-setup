#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build project from repository 'https://github.com/sgra64/a15-setup.git'.
# usage:
# - source ~/workspaces/a15-setup/.build.sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Checkout project
# - add git-module 'https://github.com/sgra64/dev-container-java'
# - add git-module 'https://github.com/sgra64/dev-container-python'
# 
function checkout() {
    local proj="$1"     # project name
    local repo="$2"     # project repository
    # git-modules for Java and Python
    local devconj_repo="$3"; local devconj_dir="$4"
    local devconp_repo="$5"; local devconp_dir="$6"
    # 
    local prdir=$(pwd) && prdir=${prdir##*/}
    [ "$prdir" != "$proj" ] &&
        exec -v git clone "$repo" &&
        exec -v cd "$proj"

    [ ! -d .git ] && echo "not a git directory" && return 1

    # find the oldest commit-id matching 'add .gitignore' to branch 'git-modules'
    # add modules: '.devcontainer-java', '.devcontainer-python' to this branch
    local gid=$(git log --reverse -n 1 --pretty=format:"%H" --grep="add .gitignore")
    # 
    if [ "$gid" ]; then
        # 
        exec -v git switch -c git-modules $gid
        # 
        exec -v git submodule add -f -- "$devconj_repo" "$devconj_dir" &&
            exec -v git rm --cached .gitmodules &&
            exec -v git commit -m \"git submodule: $devconj_dir\"
        # 
        exec -v git submodule add -f -- "$devconp_repo" "$devconp_dir" &&
            exec -v git rm --cached .gitmodules &&
            exec -v git commit -m \"git submodule: $devconp_dir\"
        # 
        exec -v git switch main 2>/dev/null
    # 
    else
        echo "no commit matching 'add .gitignore' to branch 'git-modules'"
    fi

    # insert modules after line matching '^\.gitmodules' into '.gitignore'
    sed '/^\.gitmodules/q' .gitignore > .gitignore.tmp
    git ls-files --others --exclude-standard >> .gitignore.tmp
    sed -n '/\.gitmodules/{n; :a; p; n; ba}' .gitignore >> .gitignore.tmp
    mv .gitignore.tmp .gitignore
    # 
    # probe if changes were made to '.gitignore'
    [ -n "$(git status --porcelain)" ] &&
        # commit changes
        exec -v git commit -am "update .gitignore, add git-modules"
    # 
    return 0
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Log and execute command passed with arguments. Commands are logged to the
# terminal by default, unless '-q' (quiet) is used. Command stdout and stderr
# are suppressed by default, unless '-v' (verbose) is used.
# - usage: exec [-v,-q] command args
function exec() {
    case "$1" in
    "-q") shift && local quiet=true ;;      # -q quiet mode, suppress output
    "-v") shift && local verbose=true ;;    # -v verbose show output of the command
    "-qv"|"-vq") shift && local quiet=true && local verbose=true ;;
    "--help"|"-h") echo "usage: exec [-v,-q] command args"; return 0 ;;
    esac
    [ -z "$quiet" ] && local cmd=$@ && echo " -" ${cmd:0:76}    # limit to 76
    [ "$verbose" ] && eval $@ || eval $@ >/dev/null 2>&1
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function build() {
    local proj="$1"     # project name
    local repo="$2"     # project repository
    # git-modules for Java and Python
    local devconj_repo="$3"; local devconj_dir="$4"
    local devconp_repo="$5"; local devconp_dir="$6"
    # 
    [ -z "$proj" ] && echo "arg 1: no project name specified" && return 1
    [ -z "$repo" ] && echo "arg 2: no project repository specified" && return 1
    [ -z "$devconj_repo" -o -z "$devconj_dir" ] &&
        echo "args 3 and 4: no git-module for Java specified" && return 1
    [ -z "$devconp_repo" -o -z "$devconp_dir" ] &&
        echo "args 5 and 6: no git-module for Python specified" && return 1
    # 
    local pdir=$(pwd) && pdir=${pdir##*/}
    # 
    [ "$pdir" != "$proj" ] &&
        checkout "$proj" "$repo" \
             "$devconj_repo" "$devconj_dir" "$devconp_repo" "$devconp_dir"
    # 
    return 0
}

# sync git-module files to local dev-container files
function sync() {
    local proj="$1"     # project name
    local devconj_dir="$2"; local jdir="$3"
    local devconp_dir="$4"; local pdir="$5"
    # 
    [ -z "$proj" ] && echo "arg 1: no project name specified" && return 1
    [ -z "$devconj_dir" -o -z "$jdir" ] &&
        echo "args 2 and 3: no git-module directory for Java specified" && return 1
    [ -z "$devconp_dir" -o -z "$pdir" ] &&
        echo "args 4 and 5: no git-module directory for Python specified" && return 1
    # 
    local prdir=$(pwd) && prdir=${prdir##*/}
    if [ "$prdir" = "$proj" ]; then
        [ ! -d "$jdir" ] && exec -v mkdir "$jdir"
        [ ! -d "$pdir" ] && exec -v mkdir "$pdir"
        # 
        echo "sync \"$devconj_dir\" to \"$jdir\""
        tar --exclude './.git' -C "$devconj_dir" -cf - . | tar -C "$jdir" -xf -
        # 
        echo "sync \"$devconp_dir\" to \"$pdir\""
        tar --exclude './.git' -C "$devconp_dir" -cf - . | tar -C "$pdir" -xf -
    fi
}

build a15-setup \
    git@github.com:sgra64/a15-setup.git \
    git@github.com:sgra64/dev-container-java.git .devcontainer-java \
    git@github.com:sgra64/dev-container-python.git .devcontainer-python

sync a15-setup \
    .devcontainer-java dev-container-java/.devcontainer \
    .devcontainer-python dev-container-python/.devcontainer

unset -f build sync

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
