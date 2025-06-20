#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/wireplumber

if [[ -z "$DISPLAY" ]] && [[ "$XDG_VTNR" = 1 ]]; then
	exec Hyprland
fi

if [[ -z "$DISPLAY" ]] && [[ -d "$XORG" ]] && [[ ! -z "$XAUTHORITY" ]] && [[ "$XDG_VTNR" = 1 ]]; then
  exec startx
fi

export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/hyperion/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

