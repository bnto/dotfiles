if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

alias screenoff="sudo bash -c 'echo 0 > /sys/class/backlight/nv_backlight/brightness;'"
alias screenon="sudo bash -c 'echo 33 > /sys/class/backlight/nv_backlight/brightness;'"

# Start line with a random emoji
emojis=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐙)
emoji='`echo ${emojis[$RANDOM % 16]}`'

PS1="$emoji \[\e[37;44m\] \[\e[m\]\[\e[37;44m\]\W\[\e[m\]\[\e[37;44m\] \[\e[m\]"
PS1+=" \[\e[0m\]"

export PS1

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  PS1="\W "
  export PS1
fi
