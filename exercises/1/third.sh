#!/bin/bash
for item in $(ls -a "$HOME"); do
  Path="$HOME/$item"

  if [ -e "$Path" ]; then
    echo "Stat for $Path:"
    stat "$Path"
    echo ""
  fi
done
