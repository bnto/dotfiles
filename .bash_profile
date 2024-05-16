# .bash_profile

## replace default shell with bash: chsh -s /bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

# aliases
alias ll="ls -ahl"
alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias ..="cd .."

alias vim="nvim"
alias v="nvim"

alias gs="git status"

alias lofi="streamlink https://youtu.be/jfKfPfyJRdk worst -p mpv -a '--no-video --volume=50' -v"
alias lofi-vg="streamlink https://youtu.be/re_K5hDjd1M worst -p mpv -a '--no-video --volume=50' -v"
alias lofi-tendo="streamlink https://youtu.be/mSDmr86MdHw worst -p mpv -a '--no-video --volume=50' -v"

# Launch Twitch Stream
tw() { streamlink twitch.tv/"$1" ${2:-480p} -p mpv ;}

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙)
emoji='`echo ${emojis[$RANDOM % 16]}`'

PS1="$emoji \[\e[37;44m\] \[\e[m\]\[\e[37;44m\]\w\[\e[m\]\[\e[37;44m\] \[\e[m\]"
PS1+=" \[\e[0m\]"

export PS1

# Launch NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && nvm() {
  . "$NVM_DIR/nvm.sh" # This loads nvm
  nvm list
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# fzf
eval "$(fzf --bash)"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
