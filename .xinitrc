#!/bin/sh

setxkbmap -layout us -variant intl
export XCOMPOSEFILE="$HOME/.XCompose"
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XCOMPOSEFILE
systemctl --user import-environment DISPLAY XAUTHORITY XCOMPOSEFILE

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

exec i3
