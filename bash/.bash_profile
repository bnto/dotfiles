# .bash_profile

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=
export HISTSIZE=
export ZK_NOTEBOOK_DIR=""

# Add my custom scripts
PATH="~/.local/bin:$PATH"

## Use Homebrew's coreutils
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Load bash aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# WSL options
if have /usr/bin/wslpath; then
  export WINHOME=$(wslpath $(cmd.exe /C "echo %USERPROFILE%" 2>/dev/null | tr -d '\r'))

  # start at ~
  if [[ $(pwd) == $WINHOME ]]
  then
    cd ~
  fi

  # open the windows home folder
  wsl() {
    nvim $(echo $WINHOME)
  }
fi

if have /opt/homebrew/bin/brew; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if have /home/linuxbrew/.linuxbrew/bin/brew; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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
  --prompt '  ' \
  --pointer ' ' \
  --reverse \
  --no-border \
  --no-info \
  --no-scrollbar \
  --ansi \
  --color=bw"

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙 🦝 🐢 🐺)
emoji='`echo ${emojis[$RANDOM % ${#emojis[@]}]}`'

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
