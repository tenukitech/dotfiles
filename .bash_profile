#!/bin/bash

test -f $HOME/.profile && . $HOME/.profile

##
# Your previous /Users/jnarki001c/.bash_profile file was backed up as /Users/jnarki001c/.bash_profile.macports-saved_2015-03-18_at_14:32:10
##

# MacPorts Installer addition on 2015-03-18_at_14:32:10: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

