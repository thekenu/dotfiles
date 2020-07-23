#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IS_RECORDING_PID=`pgrep -a -f is-recording | cut -f1 -d' '`
IS_RECORDING_SH=$HOME/dotfiles/i3/is-recording.sh

if [[ "$IS_RECORDING_PID" == "" ]]; then
  read -r X Y W H < <(slop -n -l -c 0.157,0.333,0.466,0.4 -f "%x %y %w %h")
  FILE_NAME=~/Videos/Screencast-$(date -Iseconds | cut -d'+' -f1).gif
  byzanz-record -w $W -h $H -x $X -y $Y -c --exec="$IS_RECORDING_SH" $FILE_NAME >& /dev/null
else
  kill $IS_RECORDING_PID
fi
