#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps
[ -f $sysresources ] && /usr/bin/xrdb -merge $sysresources
[ -f $sysmodmap ] && /usr/bin/xmodmap $sysmodmap
[ -f $userresources ] && /usr/bin/xrdb -merge $userresources
[ -f $usermodmap ] && /usr/bin/xmodmap $usermodmap


xcompmgr -C &
xset -dpms &
xset s off &
feh --bg-scale /home/zezao-gentoo/Imagens/gentoo.jpg &
volumeicon &
parcellite &


while true
do
    VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
    horas=$(date +"%A, %d-%m-%Y  %H:%M:%S")
    #IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
    TEMP=$(($(cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input) / 1000))°C
    Mem=$(free -m | grep '^Mem' | awk '{print "Mem: " $3"MB"}')
    CPU=$(top -bn 4 | grep -F 'Cpu(s)' | tail -n 1 | awk '{print "cpu_user: " $2"%" " cpu_sys: " $6"%"}' | sed 's/%us,//g')
       xsetroot -name " | Vol: $VOL | $CPU  | $TEMP | $Mem | $horas"
    sleep 2s
done &


# Start dwm
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
  exec ck-launch-session dbus-launch --exit-with-session /usr/bin/dwm
else
  exec dwm
fi
