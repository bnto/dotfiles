if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

alias screenoff="sudo bash -c 'echo 0 > /sys/class/backlight/nv_backlight/brightness;'"
alias screenon="sudo bash -c 'echo 33 > /sys/class/backlight/nv_backlight/brightness;'"
alias xquit="pkill -15 -t tty'$XDG_VTNR' Xorg"

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙)
emoji='`echo ${emojis[$RANDOM % 16]}`'

# rose-pine-dawn colorscheme
base_bg='\[\e[48;2;242;233;225m\]'
base_fg='\[\e[38;2;242;233;225m\]'
text_bg='\[\e[48;2;87;82;121m\]'
text_fg='\[\e[38;2;87;82;121m\]'
gold_bg='\[\e[48;2;234;157;52m\]'
gold_fg='\[\e[38;2;234;157;52m\]'
rose_bg='\[\e[48;2;215;130;126m\]'
rose_fg='\[\e[38;2;215;130;126m\]'
reset='\[\e[0m\]' # reset color

PS1="$emoji ${base_fg}${gold_bg} \W ${reset}${gold_bg}${reset} ${reset}"
export PS1

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  PS1="$emoji ${base_fg}${rose_bg} \W ${reset}${rose_bg}${reset} ${reset}"
  export PS1
fi
