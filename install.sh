#!/bin/bash

for i in .*
do 
    if [ "$i" != '.git' -a "$i" != '.gitignore' -a "$i" != '..' -a "$i" != '.' ]; then
	echo Installing $i
	ln -s `pwd`/$i $HOME/$i
    fi
done

echo Done!
