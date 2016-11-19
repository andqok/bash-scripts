#!/bin/bash

# Unpack all mp3 files from subdirectories to one folder (where subdirectories are in).


IFS=$'\n'

for dir in */
  do 

  cd $dir;
  echo "entered $dir"
  mp3=( `find *.mp3` )

  for ((i=0; i<${#mp3[@]};++i));
    do
      mv ${mp3[i]} ../
#     cp ${mp3[i]} ../  - just copy?
      echo " -- transfered:   ${mp3[i]}"
    done

  cd ..
done
