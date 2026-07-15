function y() {
	local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function steam() {
  if mountpoint -q /media; then
    if [[ -d /media/SteamLibrary ]]; then
      flatpak run --filesystem=/media com.valvesoftware.Steam
      return
    fi
  fi
  flatpak run com.valvesoftware.Steam
}

function pacinstall() {
  if [[ "$1" == "pacman" && "$2" == "-S" ]]; then
    local timestamp
    timestamp=$(date +"%Y-%m-%dT%H:%M:%S")

    mkdir -p ~/.pacman/hist
    pacman -Q > ~/.pacman/hist/"$timestamp.txt"
  fi
  command pacman "$@"
}

