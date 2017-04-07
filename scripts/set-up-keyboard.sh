#!/bin/bash

# Remap caps lock to left control.
setxkbmap -option 'ctrl:nocaps'

# Sets the keyboard repeat rate
xset r rate 200 40

~/programming/dotfiles/scripts/set_up_hyper_modifiers.sh

autokey &
