#!/usr/bin/env fish

# Prüfen, ob wofi bereits läuft
if pgrep -x wofi > /dev/null
    # Falls ja, beende es
    pkill -x wofi
else
    # Ansonsten starte wofi
    uwsm app -- (wofi --show drun --define=prompt=Programme --define=drun-print_desktop_file=true --normal-window --allow-images --width=15% --height=45% --sort-order=alphabetical)
end

