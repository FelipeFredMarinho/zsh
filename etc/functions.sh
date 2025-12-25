function y() {
	local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function dspace() {
  if [[ -z "$1" ]]; then
    du -sh -- * .*
    # command du -sh -- * .[^.]* ..?*
    return
  fi

  du -sh "$1"/* "$1"/.*
}


function steam() {
  if mountpoint -q /mnt; then
    if [[ -d /mnt/SteamLibrary ]]; then
      flatpak run --filesystem=/mnt com.valvesoftware.Steam
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

