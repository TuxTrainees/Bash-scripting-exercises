#!/usr/bin/env bash

readonly TEXT="Hello world"
COLORS=("\033[0;31m" "\033[1;31m" "\033[0;32m" "\033[1;32m" "\033[0;33m" "\033[1;33m" "\033[0;34m" "\033[1;34m" "\033[0;35m" "\033[1;35m")

for color in ${colors[@]};
do
	result=${color}${text}
	echo -e ${result}
done
