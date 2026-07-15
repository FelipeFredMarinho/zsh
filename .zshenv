export ZDOTDIR=~/.config/zsh
export DOTCONFIG=~/.config
export DOTFILES=~/.config/dotfiles/
export EDITOR=nvim

#. "$HOME/.cargo/env"
#export PATH="$PATH:$(go env GOPATH)/bin"

# if [[ -z "$" ]]; then
export PATH="$PATH:~/.local/bin"
# fi

if [[ -f "$HOME/.Xauthority" ]]; then
  XORG=$HOME/.config/Xorg
  XAUTHORITY=$HOME/.Xauthority
fi

