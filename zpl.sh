#!/bin/bash

IFS=$'\n' 

ls > file_wget_med
file_wget_med=$(ls *.txt)
while read i; do 7z a $i'.7z' $i; done < file_wget_med 
rm file_wget_med 
rm file_wget_med.7z
