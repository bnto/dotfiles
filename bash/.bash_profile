# .bash_profile


export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim
export HISTCONTROL=ignoreboth:erasedups

# Secret keys here
export COURRIER_COOKIE="$(security find-generic-password -a ${USER} -s COURRIER_COOKIE -w)"
export PM_API_KEY=$(security find-generic-password -a ${USER} -s PM_API_KEY -w)
export PINBOARD_TOKEN=$(security find-generic-password -a ${USER} -s PINBOARD_TOKEN -w)
export FEEDHQ_LOGIN=$(security find-generic-password -a ${USER} -s FEEDHQ_LOGIN -w)
export FEEDHQ_PASSWORD=$(security find-generic-password -a ${USER} -s FEEDHQ_PASSWORD -w)
# Add my custom scripts
PATH="~/.local/bin:$PATH"

## Use Homebrew's coreutils
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

if [ -x /opt/homebrew/bin/brew ]; then
eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Launch NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && nvm() {
  . "$NVM_DIR/nvm.sh" # This loads nvm
  nvm list
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# fzf
if [ -f /opt/homebrew/bin/fzf ]; then
eval "$(fzf --bash)"
fi

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

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙)
emoji='`echo ${emojis[$RANDOM % 16]}`'

PS1="$emoji \[\e[37;44m\] \[\e[m\]\[\e[37;44m\]\W\[\e[m\]\[\e[37;44m\] \[\e[m\]"
PS1+=" \[\e[0m\]"

export PS1
