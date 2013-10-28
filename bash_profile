#!/usr/bin/env bash


source ~/.bash-git-prompt/gitprompt.sh
source `which virtualenvwrapper.sh`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


###############################################################################
# Aliases                                                                     #
###############################################################################

# Easier navigation
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias runserver="./manage.py runserver"


###############################################################################
# Exports                                                                     #
###############################################################################

export WORKON_HOME=~/Envs
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/git/bin:/usr/local/sbin:$PATH
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"


###############################################################################
# Functions                                                                   #
###############################################################################

# cd into whatever is the forefront Finder window.
# short for cdfinder
function cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport() {
    mkdir -p "$1"
    git archive master | tar -x -C "$1"
}
