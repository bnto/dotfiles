#!/usr/bin/env bash

# check if radio is on
mpv=$(ps -ef | grep mpv | grep -v grep | awk '{print $2}' | xargs)
if [[ -n $mpv ]]; then
  kill $mpv &
fi

selected=`echo lofi vg tendo | tr " " "\n" | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

case $selected in
    "lofi")
      streamlink https://youtu.be/jfKfPfyJRdk worst -p mpv -a '--no-video --volume=50' -v &
      radio="https://youtu.be/jfKfPfyJRdk"
      ;;
    "vg")
      streamlink https://youtu.be/re_K5hDjd1M worst -p mpv -a '--no-video --volume=50' -v &
      radio="https://youtu.be/re_K5hDjd1M"
      ;;
    "tendo")
      streamlink https://youtu.be/mSDmr86MdHw worst -p mpv -a '--no-video --volume=50' -v &
      radio="https://youtu.be/mSDmr86MdHw"
      ;;
esac
