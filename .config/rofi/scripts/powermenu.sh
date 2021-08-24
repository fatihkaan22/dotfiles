#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/powermenu.rasi -config /home/near/.config/rofi/config-applet.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="襤"
reboot="ﰇ"
lock=""
suspend="鈴"
logout=""

windows=""
hibernate="⏾"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$windows\n$hibernate\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
				i3exit shutdown
        ;;
    $reboot)
				i3exit reboot
        ;;
    $lock)
        i3exit lock
        ;;
    $suspend)
				i3exit suspend
        ;;
    $logout)
				i3exit switch_user
        ;;
    $windows)
				/home/near/.scripts/sudo-passwordless-helpers/boot-to-win.sh
        ;;
    $hibernate)
				i3exit hibernate
        ;;
esac

