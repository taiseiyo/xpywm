#!/bin/sh

xset +fp /usr/local/share/fonts
setxkbmap -option ctrl:nocaps
xset r rate 200 40

if [ -e ~/.ssh ]; then
    eval "$(ssh-agent -s)"
    export SSH_ASKPASS=/usr/bin/ssh-askpass
    keychain ~/.ssh/id_rsa
    unset SSH_ASKPASS
fi

redshift -l 35:135 &
xpywm 2>/tmp/xpywm.log &
xpymon 2>/tmp/xwpymon.log &
xpylog 2>/tmp/xpylog.log &
emacs &
xcompmgr -c -l0 -t0 -r0 -o.00 &
urxvt -e tmux

