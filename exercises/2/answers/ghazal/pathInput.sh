#!/usr/bin/bash
echo -n "Enter a path: "
read path
cd "$path"

if [ $? -eq 0 ]; then
 echo "The path is valid"
else 
 echo "The path is not valid"
 exit 2
fi

parent_dir=$(dirname "$path")
last_directory=$(basename "$path")
timestamp=$(date +%d-%m-%Y_%H-%M-%S)
nameDirCompress="${last_directory}${timestamp}"

cd "$parent_dir"
tar -czf "${nameDirCompress}.tar.gz" "$last_directory"
echo "${nameDirCompress}.tar.gz created in $PWD"



