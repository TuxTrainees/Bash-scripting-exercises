
#!/bin/bash

RCol='\e[0m' 
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Magenta='\e[0;35m'
Cyan='\e[0;36m'
White='\e[0;37m'

readonly MESSAGE="Hello World!"

echo -e "${Red}$MESSAGE${RCol}"
echo -e "${Green}$MESSAGE${RCol}"
echo -e "${Yellow}$MESSAGE${RCol}"
echo -e "${Blue}$MESSAGE${RCol}"
echo -e "${Magenta}$MESSAGE${RCol}"
echo -e "${Cyan}$MESSAGE${RCol}"
echo -e "${White}$MESSAGE${RCol}" 

