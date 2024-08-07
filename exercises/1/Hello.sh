#!/bin/bash
readonly MESSAGE="hello world"
colors=( "\e[31m"
"\e[32m"
"\e[33m"
"\e[34m"
"\e[35m"
"\e[36m"
"\e[37m"
"\e[90m"
"\e[91m"
"\e[92m"
)
for ((i=0;i<${#colors[@]};i++));
do echo -e "${colors[i]}${MESSAGE}\e[0m"
done
