#!/bin/bash

# Set keyboard to dvorak
setxkbmap -layout dvorak

# Remap caps lock to left control.
setxkbmap -option 'ctrl:nocaps'

# Sets the keyboard repeat rate
xset r rate 200 40

~/programming/dotfiles/scripts/set_up_hyper_modifiers.sh
