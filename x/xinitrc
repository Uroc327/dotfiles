#!/bin/bash

sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# merge in defaults and keymaps

[ -f "$sysresources"  ] && xrdb -merge "$sysresources"
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$sysmodmap"     ] && xmodmap "$sysmodmap"
[ -f "$usermodmap"    ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

function later()
{
	sleep 2

	xset -b # no system beep
	xset r rate 180 60

	parcellite -n &

	urxvtd -o -f
}

later &
exec i3 

