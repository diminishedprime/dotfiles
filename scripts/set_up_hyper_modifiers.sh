#!/bin/bash

# TRUE="true"
# xmodmap -pke | egrep -q "keycode.*23 = Hyper_L" && ALREADY_RAN=$TRUE
# if [ "$ALREADY_RAN" != "$TRUE" ]
# then
#     echo "Setting up tab and backslash keys"
#     spare_modifier_l="Hyper_L"
#     spare_modifier_r="Hyper_R"
#     # 23 is the keycode of tab, so we set it to Hyper_L, which is an unused
#     # modifier. and 51 is the keycode of backslash so we set it to Hyper_R
#     xmodmap -e "keycode 23 = $spare_modifier_l"
#     xmodmap -e "keycode 51 = $spare_modifier_r"

#     # keycode 255 was unused when I typed the command `xmodmap -pke` this is needed,
#     # because otherwise there is nothing that's called "Tab" as far as xcape is
#     # concerned.
#     xmodmap -e "keycode 254 = backslash bar backslash bar"
#     xmodmap -e "keycode 255 = Tab ISO_Left_Tab Tab ISO_Left_Tab"

#     # Using xcape to get the default
#     xcape -e "$spare_modifier_l=Tab"
#     xcape -e "$spare_modifier_r=backslash"
# else
#     echo "This script has already run"
# fi

# kill -9 $(ps aux | egrep "xcape -e Hyper_R backslash" | sed -n '2p' | sed -r 's/matt[ ]*([0-9]*).*/\1/')
# kill -9 $(ps aux | egrep "xcape -e Hyper_L Tab" | sed -n '2p' | sed -r 's/matt[ ]*([0-9]*).*/\1/')
