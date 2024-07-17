#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd "$(dirname "$0")" || exit

# Install dependencies
echo "Install dependencies..."
chmod +x ./install/install-dependencies.sh
sh ./install/install-dependencies.sh

mkdir -p ~/Pictures/Screenshots
. ./macOS.sh

stow -v -t ~/.config config
stow -v -t ~/ zsh misc tmux

# Fix autocomp permission
chmod go-w '/usr/local/share'

# Scripts
mkdir -p "$HOME/.local/bin"

# Some helpful tmux scripts
DOTFILES=$(pwd)
t=$HOME/.local/bin/t
[ -e "$t" ] && rm "$t"
chmod +x ./scripts/t.sh && ln -sf "$DOTFILES/scripts/t.sh" "$t"

choose_session=$HOME/.local/bin/choose_session
[ -e "$choose_session" ] && rm "$choose_session"
chmod +x ./scripts/choose_session.sh && ln -sf "$DOTFILES/scripts/choose_session.sh" "$choose_session"

tmux_fzf=$HOME/.local/bin/tmux_fzf
[ -e "$tmux_fzf" ] && rm "$tmux_fzf"
chmod +x ./scripts/tmux-fzf.sh && ln -sf "$DOTFILES/scripts/tmux-fzf.sh" "$tmux_fzf"
