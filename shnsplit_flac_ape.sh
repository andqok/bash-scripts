#!/bin/bash

#needs indstalling lltag and flacon
#changes globas system variable IFS, which is in principle a bad thing
#I know no other way to handla spaces in filemanes properly

IFS=$'\n'

flac=( `find *.flac` )
ape=( `find *.ape` )
cue=( `find *.cue` )

for ((i=0;i<${#ape[@]};++i)); do
    echo ${ape[i]}
    echo ${cue[i]}
    cuebreakpoints ${cue[i]} | shnsplit -o flac ${ape[i]} &&
    cuetag "${cue[i]}" split-track*.flac &&
    lltag --yes --no-tagging --rename '%n - %t' `ls split-track*.flac` &&
    rm ${cue[i]} ${ape[i]}
done

for ((i=0;i<${#flac[@]};++i)); do
    shnsplit -f "${cue[i]}" -t "%n - %t" -o flac "${flac[i]}" && rm "${cue[i]}" "${flac[i]}" "${log[i]}"
done
