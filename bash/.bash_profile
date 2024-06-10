# .bash_profile


export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim
export HISTCONTROL=ignoreboth:erasedups

if [ -x /opt/homebrew/bin/brew ]; then
eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙)
emoji='`echo ${emojis[$RANDOM % 16]}`'

PS1="$emoji \[\e[37;44m\] \[\e[m\]\[\e[37;44m\]\W\[\e[m\]\[\e[37;44m\] \[\e[m\]"
PS1+=" \[\e[0m\]"

export PS1
