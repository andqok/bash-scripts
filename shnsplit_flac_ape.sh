#!/bin/bash

cue=$(find *.cue)
flac=$(find *.flac)
log=$(find *.log)
ape=$(find *.ape)

echo $flac
echo $cue
echo $ape

if [ -e "$flac" ]
then
shnsplit -f "$cue" -t "%n - %t" -o flac "$flac" &&
rm "$cue" "$flac" "$log"
fi

if [ -e "$ape" ]
then
cuebreakpoints "$cue" | shnsplit -o flac "$ape" &&
rm "$cue" "$ape" "$log"
fi

