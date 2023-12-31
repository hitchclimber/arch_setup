#!/bin/sh



source $HOME/.config/xprofile

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

ssh-agent dwm

# setbg &



exec /usr/local/bin/dwm
