#!/usr/bin/env bash

for item in $(ls -a);
do
	stat ${item}
done

