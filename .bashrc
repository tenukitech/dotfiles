#!/bin/bash

## Aliases

### Functions
rerun () { . ~/.bashrc; echo "Success!"; }


os_select () {
    PS3='Please enter your choice: '

    options=()
    for i in ~/.openrc/*
    do
        options+=(`basename $i`)
    done

    select file in "${options[@]}"
    do
        source ~/.openrc/$file
        break
    done
}

### Paths
export PATH=$HOME/bin:/usr/local/bin/:/usr/local/heroku/bin:$PATH:$HOME/.rvm/bin

### Comcast specific
if [ $USER == 'jnarki001c' ]; then
  cssh() {
	ssh -i ~/.ssh/clduser clduser@$1
  }

  PERL_MB_OPT="--install_base \"/Users/jnarki001c/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/jnarki001c/perl5"; export PERL_MM_OPT;
fi


