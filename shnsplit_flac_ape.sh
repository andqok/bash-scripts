#!/bin/bash

#needs indstalling lltag and flacon

cue=$(find *.cue)
flac=$(find *.flac)
log=$(find *.log)
ape=$(find *.ape)

echo $flac
echo $cue
echo $ape

if [ -e "$flac" ]
then
shnsplit -f "$cue" -t "%n - %t" -o flac "$flac" && rm "$cue" "$flac" "$log"
fi

if [ -e "$ape" ]
then
cuebreakpoints "$cue" | shnsplit -o flac "$ape" &&
cuetag "$cue" split-track*.flac &&
lltag --yes --no-tagging --rename '%n - %t' `ls split-track*.flac` &&
rm "$cue" "$ape" "$log"
fi
