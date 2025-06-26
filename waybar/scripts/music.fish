#!/usr/bin/env fish

# Programme zur Auswahl
set options "Shortwave\nLollypop\nDeadbeef"

# Wofi im dmenu-Modus als normales Fenster via uwsm starten
set choice (echo -e $options | uwsm app -- wofi --show dmenu --define=hide_search=true --normal-window --prompt "Musikplayer wählen:" --width 20% --lines=5)

# Falls der Benutzer nichts auswählt oder abbricht
if test -z "$choice"
    exit 0
end

# Auswahl auswerten und Programm starten
switch $choice
    case Shortwave
        nohup shortwave > /dev/null 2>&1 &
    case Lollypop
        nohup lollypop > /dev/null 2>&1 &
    case Deadbeef
        nohup deadbeef > /dev/null 2>&1 &
end

