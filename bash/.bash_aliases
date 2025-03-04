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
alias nivm="nvim"
alias tmk="tmux kill-server"
alias docker="podman"

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

colortest() {
  T='gYw' # The test text

  echo -e "\n                 40m     41m     42m     43m\
       44m     45m     46m     47m"

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
    '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
    '  36m' '1;36m' '  37m' '1;37m'; do
    FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
      echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m"
    done
    echo
  done
  echo
}

# Launch a Twitch Stream
tw() { streamlink twitch.tv/"$1" ${2:-480p} \
  --twitch-proxy-playlist=https://eu2.luminous.dev,https://lb-eu2.cdn-perfprod.com \
  -p mpv &}

# Send a notification
notify() {
  osascript -e 'display notification "'"$1"'" with title "'"$2"'" sound name "Submarine"'
}
