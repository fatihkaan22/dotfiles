MENU="$(rofi -sep "|" -dmenu -i -p 'create_ap' -location 3 -xoffset -10 -yoffset 32 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 2 -theme /home/near/.config/rofi/dracula.rasi <<< "1) Enable |2) Disable ")"
            case "$MENU" in
                *1*)  
									/home/near/.scripts/sudo-passwordless-helpers/hotspot.sh &
									;;
                *2*)  
									/home/near/.scripts/sudo-passwordless-helpers/kill-hotspot.sh &
            esac
