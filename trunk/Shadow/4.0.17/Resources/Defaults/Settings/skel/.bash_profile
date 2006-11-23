#!/bin/bash

# When bash is a login shell, this file (.bash_profile) gets sourced.
# When it is not a login shell, .bashrc gets sourced instead.
# To ensure a consistent behavior in all interactive shell instances,
# all this file does is to call .bashrc (which is the file that is executed
# for non-login bash instances).

. ~/.bashrc

# Do not add commands here unless you want them loaded only in login shells
# (ie, those invoked by gettys, not X terminals).
