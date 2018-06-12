# Postgres
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
# Redis
PATH="/Applications/Redis.app/Contents/Resources/Vendor/redis/bin:$PATH"

# Rust && Cargo
PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/Downloads/rustc-1.7.0/src"

# Node && NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use default --silent

# Python && Virtual Envs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME="$HOME/Envs"
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Bash Git Prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="command ls -lG"

alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias reload="exec $SHELL -l"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

alias wx="curl -g wttr.in/$1"

# Take this repo and copy it to somewhere else minus the .git stuff.
function gitexport() {
    mkdir -p "$2"
    git archive "$1" | tar -x -C "$2"
}

function setitermprofile() {
    echo -e "\033]50;SetProfile=$1\a"
}
