#!/usr/bin/bash

for file in $(ls -a $HOME); do
        echo "Stat for: $file"
        stat /home/ghazal/"$file"
        echo
done


