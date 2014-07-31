#!/bin/bash

[ -r ~/.bash_rc ] && . ~/.bashrc

export PS1="\[$(tput bold)\]\e[0;34m[\\u@\h \\W]\\$ \[$(tput sgr0)\]"
export PS2="> "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
