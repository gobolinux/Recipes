#!/bin/sh
# /etc/acpi/powerbtn.sh
# Initiates a shutdown when the power putton has been
# pressed.

if ps -Af | grep -q '[k]desktop' && test -f /Programs/KDE-Libs/Current/bin/dcop
then
    dcop --all-sessions --all-users ksmserver ksmserver logout 0 2 0 && exit 0
else
    /Programs/Sysvinit/Current/sbin/shutdown -h now "Power button pressed"
fi
