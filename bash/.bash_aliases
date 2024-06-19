# .bash_aliases

# The usual suspects
alias ll="ls -ahl"
alias ..="cd .."

# Add some color
alias ls="ls --color --group-directories-first"
alias grep="grep --color=auto"

# Confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"

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

# Launch a Twitch Stream
tw() { streamlink twitch.tv/"$1" ${2:-480p} -p mpv ;}

# Send a notification
notify() {
  osascript -e 'display notification "'"$1"'" with title "'"$2"'" sound name "Submarine"'
}
