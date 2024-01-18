#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Custom
if xrandr | grep "HDMI-1-0 connected" &> /dev/null;
then
    xrandr --output HDMI-1-0 --primary --mode 2560x1080 --rate 100.00 --rotate normal --output eDP --mode 1920x1080 --rate 60.00 --left-of HDMI-1-0
elif xrandr | grep "HDMI-0 connected" &> /dev/null;
then
    xrandr --output HDMI-0 --primary --mode 2560x1080 --rate 100.00 --rotate normal --output eDP-1-0 --mode 1920x1080 --rate 60.00 --left-of HDMI-0
else
	xrandr --auto
fi

picom -b &
feh --bg-fill --randomize /home/saumitra/Pictures/Wallpapers &

xinput --set-prop 'ELAN1200:00 04F3:30BA Touchpad' 'libinput Tapping Enabled' 1 &
xinput --set-prop 12 'libinput Accel Profile Enabled' 0, 1 &
#xinput --set-prop 'Logitech Gaming Mouse G402' 'libinput Accel Profile Enabled' 0, 1 &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
~/dwm/scripts/bar.sh &

warpd &
dunst &
clipmenud &
xmousepasteblock &

exec dwm
