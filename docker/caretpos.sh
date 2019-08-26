#!/bin/bash
APP=$1
kill -9 $(ps xh -o pid= -o cmd= | grep  -oP "[0-9]+(?=\s+.*caretpos\.$APP.*)")
((exec -a caretpos.$APP /bin/bash) << EOF
{
while true; do env WINEPREFIX=$HOME/.deepinwine/Deepin-$APP deepin-wine /usr/bin/caretpos.exe Z:\\\\tmp\\\\caretpos.$APP.sh;sleep 0.5;done
}
EOF
) 2>&1 > $HOME/caretpos.$APP.log &

((exec -a caretpos.$APP.fcitxwindowmove /bin/bash) << EOF
{
/usr/bin/fcitxwindowmove.sh $APP
}
EOF
) 2>&1 > $HOME/caretpos.$APP.fcitxwindowmove.log &
