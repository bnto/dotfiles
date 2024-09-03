# .bash_aliases

# The usual suspects
alias ll="ls -FAh"
alias ..="cd .."

# Add some color
alias ls="ls --color --group-directories-first"
alias grep="grep --color=auto"

# Confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Lazy shortcuts
alias gs="git status"
alias vim="nvim"
alias v="nvim"
alias nv="nvim"
alias tmk="tmux kill-server"

# Attach tmux with grace
tm() {
    (tmux list-sessions|grep "^${1}" &>/dev/null) || \
        tmux new-session -d -s $1
    tmux attach $1 || tmux
}

# Verify that a package is installed.
have() { type "$1" > /dev/null 2>&1; }

# Add colors in man page.
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Launch a Twitch Stream
tw() { streamlink twitch.tv/"$1" ${2:-480p} -p mpv ;}

# Send a notification
notify() {
  osascript -e 'display notification "'"$1"'" with title "'"$2"'" sound name "Submarine"'
}
