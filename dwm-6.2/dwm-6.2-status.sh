#!/bin/sh

# status bar for dwm

print_horas() {
    printf " | %s\n" "$(date +"%A ➫ %d-%m-%Y ➫ %H:%M:%S")"
}

print_TEMP() {
    printf " ➫ %s\n" "$(($(cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input) / 1000))°C"
}

print_Mem() {
    memoria=$(free -m | grep '^Mem' | awk '{print $3"MB"}')
    printf " | Mem ➫ %7s\n" "$memoria"
}

print_CPU(){
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    printf "| CPU ➫ %4s\n" "$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal)))%"
}

print_fan(){
    printf " ➫ %s\n" "$(sensors | grep fan1 | tail -n 1 | awk '{print $2 " rpm"}' | sed 's/%us,//g')"
}

while true
    do
xsetroot -name \
"$(print_CPU)\
$(print_TEMP)\
$(print_fan)\
$(print_Mem)\
$(print_horas)"

        sleep 2
 done

