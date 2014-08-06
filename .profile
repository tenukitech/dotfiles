#!/bin/bash

[ -r ~/.bash_rc ] && . ~/.bashrc

export PS1="\[$(tput setaf 4)\][\\u@\h \\W]\\$ \[$(tput sgr0)\]"
export PS2="> "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
