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

pwd
ls

# Fix autocomp permission
chmod go-w '/usr/local/share'

# Tmux
# [ -e $HOME/.tmux.conf ] && rm $HOME/.tmux.conf
# ln -s ./tmux/tmux.conf $HOME/.tmux.conf
# # If no folder ~/.tmux, create it
# [ ! -d $HOME/.tmux ] && mkdir $HOME/.tmux

# # If tmux plugin manager is not installed, install it
# if [ ! -d $HOME/.tmux/plugins/tpm ]; then
#   # Install tmux plugin manager
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#   # Reload tmux config
#   tmux source ~/.tmux.conf
#   # Install plugins
#   ~/.tmux/plugins/tpm/bin/install_plugins
#   # Reload tmux config
#   tmux source ~/.tmux.conf
# fi

# [ -e $HOME/.tmux/gitmux.conf ] && rm $HOME/.tmux/gitmux.conf
# ln -s $DOTFILES/tmux/gitmux.conf $HOME/.tmux/gitmux.conf
# [ -e $HOME/.tmux/tmux-pane-status.sh ] && rm $HOME/.tmux/tmux-pane-status.sh
# ln -s $DOTFILES/tmux/tmux-pane-status.sh $HOME/.tmux/tmux-pane-status.sh

# Scripts
# mkdir -p $HOME/.local/bin
#
# t=$HOME/.local/bin/t
# [ -e "$t" ] && rm "$t"
# chmod +x $DOTFILES/scripts/t.sh && ln -sf $DOTFILES/scripts/t.sh "$t"
#
# choose_session=$HOME/.local/bin/choose_session
# [ -e "$choose_session" ] && rm "$choose_session"
# chmod +x $DOTFILES/scripts/choose_session.sh && ln -sf $DOTFILES/scripts/choose_session.sh "$choose_session"

# tmux_fzf=$HOME/.local/bin/tmux_fzf
# [ -e "$tmux_fzf" ] && rm "$tmux_fzf"
# chmod +x $DOTFILES/scripts/tmux-fzf.sh && ln -sf $DOTFILES/scripts/tmux-fzf.sh "$tmux_fzf"
