#!/bin/bash

## Aliases

### Functions
rerun () { . ~/.bashrc; echo "Success!"; }

mkpasswd () {
    stty -echo; read pw; stty echo
    echo $pw | perl -e '$passwd=<STDIN>; print crypt($passwd,"\$6\$saltsalt\$") . "\n"'
}

os_select () {
    PS3='Please enter your choice: '
    
    cd ~/.openrc

    select file in *
    do
        source "$file"
        break
    done
    cd $OLDPWD
}

### Paths
export PATH=$HOME/bin:/usr/local/bin/:/usr/local/heroku/bin:$PATH:$HOME/.rvm/bin

for i in /opt/*/bin
do
	PATH=$PATH:$i
done

# Aliases
test -f '/opt/sublime_text/sublime_text' && alias subl=/opt/sublime_text/sublime_text

### Comcast specific
if [ $USER == 'jnarki001c' ]; then
  cssh() {
	ssh -i ~/.ssh/clduser clduser@$1
  }

  PERL_MB_OPT="--install_base \"/Users/jnarki001c/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/jnarki001c/perl5"; export PERL_MM_OPT;
fi


