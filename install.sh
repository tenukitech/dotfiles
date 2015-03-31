#!/bin/bash

for i in .*
do 
    if [ "$i" != '.git' -a "$i" != '.gitignore' -a "$i" != '..' -a "$i" != '.' ]; then
	echo Installing $i
	test -h $HOME/$i && rm $HOME/$i
        test -e $HOME/$i && rm -rf $HOME/$i # Remove local versions
        ln -s `pwd`/$i $HOME/$i
    fi
done

echo Done!
