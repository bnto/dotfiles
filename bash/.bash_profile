# .bash_profile


export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=
export HISTSIZE=

# Load secret keys
if [ -f ~/.keys ]; then
  source ~/.keys
fi

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
export FZF_DEFAULT_OPTS="--color=16"

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

PS1="$emoji ${base_fg}${gold_bg} \W ${reset} ${reset}"

export PS1
