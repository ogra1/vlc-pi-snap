#! /bin/sh

[ -e "$SNAP_USER_DATA/.check-complete" ] && exec "$@"

if ! id -Gn | grep -q video; then
  yad --text "<b>Error, can not open video playback device \!</b>\n\nThe user $LOGNAME is not in the "video" group.\nPlease execute:\n\n    <b>sudo usermod -a -G video $LOGNAME</b>\n\nIn a Terminal, afterwards log out and back in again." \
    --borders=5 --center --on-top --undecorated \
    --skip-taskbar && exit 0
fi

if ! snapctl is-connected hardware-observe; then
  yad --text "<b>Error, can not get status of video playback device \!</b>\n\nPlease connect the hardware-observe snap interface\nwith the command:\n\n    <b>sudo snap connect vlc-pi:hardware-observe</b>\n\nOr through the Permissions UI in the snap-store application" \
    --borders=5 --center --on-top --undecorated \
    --skip-taskbar && exit 0
fi

if [ ! -d "$SNAP_USER_COMMON/.local/lib/locale/$LANG" ]; then
  yad --text "\nGenerating VLC translations for:\n\n\t$LANG" \
    --borders=10 --no-buttons --center --on-top \
    --undecorated --skip-taskbar --timeout=10 \
    --timeout-indicator=bottom &
fi

touch $SNAP_USER_DATA/.check-complete
exec "$@"
