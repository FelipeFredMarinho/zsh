export DOTCONFIG=~/.config

if [[ -z "$EDITOR" ]]; then
  export EDITOR=nvim
fi

#. "$HOME/.cargo/env"
#export PATH="$PATH:$(go env GOPATH)/bin:.local/bin"

if [[ -f "$HOME/.Xauthority" ]]; then
  XORG=$HOME/.config/Xorg
  XAUTHORITY=$HOME/.Xauthority
fi

