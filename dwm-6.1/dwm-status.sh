#!/bin/sh

# status bar for dwm

# color codes from dwm/config.h
color_teste="\x01" #teste

print_horas() {
    horas=$(date +"%A ➫ %d-%m-%Y ➫ %H:%M:%S")
    echo -ne "${color_teste}| ${horas}"
}

print_TEMP() {
    TEMP=$(echo '➫ ')$(($(cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input) / 1000))°C
    echo -ne "${color_teste}${TEMP}"
}

print_Mem() {
    Mem=$(free -m | grep '^Mem' | awk '{print "Mem ➫ " $3"MB"}')
    echo -ne "${color_teste}| ${Mem}"
}


print_CPU(){
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    print_CPU="$(echo 'CPU ➫  ')$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal)))%"
    echo -ne "${color_teste}| ${print_CPU}"
}

while true
    do
xsetroot -name \
"$(print_CPU)\
$(print_TEMP)\
$(print_Mem)\
$(print_horas)"

        sleep 2
 done
