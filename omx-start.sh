#!/bin/bash
## script to start omxplayer

# check if player is already running
screen -S OMX -X quit

# if subtitle folder isset
params=""
if [ -n "$6" ] && [ "$6" != "-" ]; then
    basename=$(basename $2)
    subtitle_path="$6/${basename%.*}.srt"
    if [ -e "$subtitle_path" ]; then
      params="$params --subtitles $subtitle_path "
    fi
fi
# check if display parameter isset
if [ -n "$7" ] && [ "$7" != "-" ]; then
  params="$params --display $7"
fi
screen -d -m -S OMX omxplayer "$2" -o $4 --vol $5 $params
screen -S OMX -X stuff $'.'

# fix for double play speed at start
if [ "$3" = "1" ]; then
	screen -S OMX -X stuff $'1'
fi
