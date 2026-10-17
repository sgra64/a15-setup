#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# build project from 'https://github.com/sgra64/a15-setup.git'
# - add git-module 'https://github.com/sgra64/dev-container-java'
# - add git-module 'https://github.com/sgra64/dev-container-python'
# 
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
    [ "$pdir" != "$proj" ] &&
        git clone "$repo" &&
        cd "$proj"

    [ ! -d .git ] && echo "not a git directory" && return 1

    # find the oldest commit-id matching 'add .gitignore' to branch 'git-modules'
    # add modules: '.devcontainer-java', '.devcontainer-python' to this branch
    local gid=$(git log --reverse -n 1 --pretty=format:"%H" --grep="add .gitignore")
    # 
    if [ "$gid" ]; then
        # 
        git switch -c git-modules $gid
        # 
        git submodule add -f -- "$devconj_repo" "$devconj_dir" &&
            git rm --cached .gitmodules &&
            git commit -m "git submodule: $devconj_dir"
        # 
        git submodule add -f -- "$devconp_repo" "$devconp_dir" &&
            git rm --cached .gitmodules &&
            git commit -m "git submodule: $devconp_dir"
        # 
        git switch main 2>/dev/null

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
        git commit -am "update .gitignore, add git-modules"
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

build a15-setup \
    git@github.com:sgra64/a15-setup.git \
    git@github.com:sgra64/dev-container-java.git .devcontainer-java \
    git@github.com:sgra64/dev-container-python.git .devcontainer-python

unset -f build

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
