# .bash_profile

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=
export HISTSIZE=

# Retrieve password from security
export COURRIER_COOKIE="$(security find-generic-password -a ${USER} -s COURRIER_COOKIE -w)"
export PM_API_KEY=$(security find-generic-password -a ${USER} -s PM_API_KEY -w)
export PINBOARD_TOKEN=$(security find-generic-password -a ${USER} -s PINBOARD_TOKEN -w)
export FEEDHQ_LOGIN=$(security find-generic-password -a ${USER} -s FEEDHQ_LOGIN -w)
export FEEDHQ_PASSWORD=$(security find-generic-password -a ${USER} -s FEEDHQ_PASSWORD -w)

# Add my custom scripts
PATH="~/.local/bin:$PATH"

## Use Homebrew's coreutils
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Load bash aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if have /opt/homebrew/bin/brew; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Launch NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && nvm() {
  . "$NVM_DIR/nvm.sh" # This loads nvm
  nvm list
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# FZF colorscheme
export FZF_DEFAULT_OPTS="\
  --reverse \
  --no-border \
  --no-info \
  --no-scrollbar \
  --ansi \
  --color=bw"

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙)
emoji='`echo ${emojis[$RANDOM % 16]}`'

# rose-pine-dawn colorscheme
base_bg='\[\e[48;2;242;233;225m\]'
base_fg='\[\e[38;2;242;233;225m\]'
overlay_bg='\[\e[48;2;152;147;165m\]'
overlay_fg='\[\e[38;2;152;147;165m\]'
muted_bg='\[\e[48;2;121;117;147m\]'
muted_fg='\[\e[38;2;121;117;147m\]'
subtle_bg='\[\e[48;2;87;82;121m\]'
subtle_fg='\[\e[38;2;87;82;121m\]'
text_bg='\[\e[48;2;87;82;121m\]'
text_fg='\[\e[38;2;87;82;121m\]'
love_bg='\[\e[48;2;180;99;122m\]'
love_fg='\[\e[38;2;180;99;122m\]'
gold_bg='\[\e[48;2;234;157;52m\]'
gold_fg='\[\e[38;2;234;157;52m\]'
rose_bg='\[\e[48;2;215;130;126m\]'
rose_fg='\[\e[38;2;215;130;126m\]'
pine_bg='\[\e[48;2;40;105;131m\]'
pine_fg='\[\e[38;2;40;105;131m\]'
foam_bg='\[\e[48;2;86;148;159m\]'
foam_fg='\[\e[38;2;86;148;159m\]'
iris_bg='\[\e[48;2;144;122;169m\]'
iris_fg='\[\e[38;2;144;122;169m\]'
reset='\[\e[0m\]' # reset color

export PS1="$emoji ${base_fg}${gold_bg} \W ${reset} ${reset}"
