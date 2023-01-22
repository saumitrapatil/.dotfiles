#!/bin/bash

SAVEDIR="$HOME/Pictures/Screenshots"
mkdir -p -- "$SAVEDIR"
FILENAME="$(date +'%Y-%m-%d-%H-%M-%S_screenshot.png')"
EXPENDED_FILENAME="$SAVEDIR/$FILENAME"

grim "$EXPENDED_FILENAME"

function list_geometry () {
	[ "$2" = with_description ] && local append="\t\(.title)" || local append=
    if [ "$1" = focused ]; then
        hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])'$append'"'
    else
        hyprctl -j clients | jq -r '.[] | select(.workspace.id | contains('$(hyprctl -j monitors | jq -r 'map(.activeWorkspace.id) | join(",")')')) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])'$append'"'
    fi
}

CHOICE=""
EDIT=""

while getopts ":m:e:" opt; do
    case $opt in
	m) CHOICE=$OPTARG
       	;;
	e) EDIT=$OPTARG
	;;
    	\?) echo "Invalid option: -$OPTARG" >&2
       	exit 1
       	;;
    	:) echo "Option -$OPTARG requires an argument." >&2
            yes | rm "$EXPENDED_FILENAME"
       	exit 1
       	;;
    esac
done

WOFICFG="$HOME/.config/wofi/launcher/config"
WOFISTYLE="$HOME/.config/wofi/style.css"
WINDOWS=`list_geometry visible with_description`
FOCUSED=`list_geometry focused`

if [[ "$CHOICE" != "region" && "$CHOICE" != "focused" && "$CHOICE" != "fullscreen" && "$CHOICE" != "window" ]]; then
    CHOICE=$(printf "%s\n" region focused fullscreen left right "$WINDOWS" | wofi -d -p 'Screenshot' -c $WOFICFG -s $WOFISTYLE)
elif test "$CHOICE" = "window"; then
    CHOICE=$(printf "%s\n" "$WINDOWS" | wofi -d -p 'window' -c $WOFICFG -s $WOFISTYLE)
fi

SPACING=8 # pixels between windows

case $CHOICE in
    fullscreen)
	;;
    region)
    	wait
    	hyprctl dispatch exec '[move 0 0;float;rounding 0;noanim] feh "$EXPENDED_FILENAME"'
		input=$(slurp -b 1e1e2e7f -c cba6f7 -w 4)

        pkill feh;
        # Split input string into x,y and wxh
        x=$(echo $input | awk -F',' '{print $1}')
        y=$(echo $input | awk -F',' '{print $2}' | awk -F' ' '{print $1}')
        wxh=$(echo $input | awk -F',' '{print $2}' | awk -F' ' '{print $2}')

        # Split wxh into w and h
        w=$(echo $wxh | awk -F'x' '{print $1}')
        h=$(echo $wxh | awk -F'x' '{print $2}')

        res="$((w-4))x$((h-4))+$((x+2))+$((y+2))"

        if [[ "$res" != "-4x-4+2+2" ]]; then
            convert "$EXPENDED_FILENAME" -crop $res "$EXPENDED_FILENAME"
        else
        notify-send "Screenshot" "Cancelled"
            yes | rm "$EXPENDED_FILENAME"
            exit 0;
        fi
	;;
    focused)
	input=$FOCUSED
	
        # Split input string into x,y and wxh
        x=$(echo $input | awk -F',' '{print $1}')
        y=$(echo $input | awk -F',' '{print $2}' | awk -F' ' '{print $1}')
        wxh=$(echo $input | awk -F',' '{print $2}' | awk -F' ' '{print $2}')

        # Split wxh into w and h
        w=$(echo $wxh | awk -F'x' '{print $1}')
        h=$(echo $wxh | awk -F'x' '{print $2}')
        
	# Add Spacing
	res="$((w+SPACING*2))x$((h+SPACING*2))+$((x-SPACING))+$((y-SPACING))"

    convert "$EXPENDED_FILENAME" -crop $res "$EXPENDED_FILENAME"
	;;
    left)
	mv "/tmp/left.png" "$EXPENDED_FILENAME"
        ;;
    right)
	mv "/tmp/right.png" "$EXPENDED_FILENAME"
        ;;
    '')
        notify-send "Screenshot" "Cancelled"
               yes | rm "$EXPENDED_FILENAME"
     exit 0
        ;;
    *)
    	GEOMETRY="`echo \"$CHOICE\" | cut -d$'\t' -f1`"
        
        # Split input string into x,y and wxh
	    input=$GEOMETRY

        x=$(echo $input | awk -F',' '{print $1}')
        y=$(echo $input | awk -F',' '{print $2}' | awk -F' ' '{print $1}')
        wxh=$(echo $input | awk -F',' '{print $2}' | awk -F' ' '{print $2}')

        # Split wxh into w and h
        w=$(echo $wxh | awk -F'x' '{print $1}')
        h=$(echo $wxh | awk -F'x' '{print $2}')
            
        # Add Spacing
        res="$((w+SPACING*2))x$((h+SPACING*2))+$((x-SPACING))+$((y-SPACING))"

        convert "$EXPENDED_FILENAME" -crop $res "$EXPENDED_FILENAME"
esac

# If swappy is installed, prompt the user to edit the captured screenshot
if command -v swappy $>/dev/null
then
    if [[ "$EDIT" != "yes" && "$EDIT" != "no" ]]; then
    EDIT_CHOICE=`wofi -d -p 'Edit' -lines 2 << EOF
no
yes
EOF`
    else 
        EDIT_CHOICE=$EDIT
    fi

    case $EDIT_CHOICE in
        yes)
            swappy -f "$EXPENDED_FILENAME" -o "$EXPENDED_FILENAME"
            ;;
        no)
            ;;
        '')
            ;;
    esac
fi

wl-copy < "$EXPENDED_FILENAME"
notify-send "Screenshot" "File saved as <i>'$FILENAME'</i> and copied to the clipboard." -i "$EXPENDED_FILENAME"
