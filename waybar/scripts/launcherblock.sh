#!/usr/bin/env fish

function get_icon
    set ICON_NAME $argv[1]
    set THEME Gruvbox-Plus-Dark
    set SIZE 24

    # Suche nach PNG oder SVG mit der gewünschten Größe
    set paths (find /usr/share/icons/$THEME -iname "$ICON_NAME.png" -o -iname "$ICON_NAME.svg" | grep "/$SIZE/" | head -n 1)

    if test -z "$paths"
        # Fallback auf irgendeine Größe, wenn keine 24er gefunden wurde
        set paths (find /usr/share/icons/$THEME -iname "$ICON_NAME.png" -o -iname "$ICON_NAME.svg" | head -n 1)
    end

    echo $paths
end

set ICON_LOLLYPOP (get_icon lollypop)
set ICON_BRAVE (get_icon brave-browser)
set ICON_THUNAR (get_icon org.xfce.thunar)

echo '{
  "iconblock": "<span class=\"launcher-icon\" onclick=\"uwsm app -- lollypop\"><img src=\"'$ICON_LOLLYPOP'\" width=\"20\" height=\"20\"/></span>
                <span class=\"launcher-icon\" onclick=\"uwsm app -- brave\"><img src=\"'$ICON_BRAVE'\" width=\"20\" height=\"20\"/></span>
                <span class=\"launcher-icon\" onclick=\"uwsm app -- thunar\"><img src=\"'$ICON_THUNAR'\" width=\"20\" height=\"20\"/></span>"
}'

