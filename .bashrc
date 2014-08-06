#!/bin/bash

export PATH=$HOME/bin:/usr/local/bin/:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Aliases to force use of right Rails version of tools for different projects
#alias rake='bundle exec rake'
#alias cap='bundle exec cap'
#alias rails='bundle exec rails'
#alias gem='bundle exec gem'
#alias rdoc='bundle exec rdoc'
#alias irb='bundle exec irb'


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PERL_MB_OPT="--install_base \"/Users/jnarki001c/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jnarki001c/perl5"; export PERL_MM_OPT;

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
