#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# echo "Your dependencies is being installed"
# chmod +x $DOTFILES/install/install-dependencies.sh
# sh $DOTFILES/install/install-dependencies.sh
# echo "your dependencies is installed"

# Kitty
[ -d $HOME/.config/kitty ] && rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# Starship
[ -e $HOME/.config/starship.toml ] && rm $HOME/.config/starship.toml
ln -s $DOTFILES/starship/starship.toml $HOME/.config/starship.toml

# Tmux
[ -e $HOME/.tmux.conf ] && rm $HOME/.tmux.conf
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
# If no folder ~/.tmux, create it
[ ! -d $HOME/.tmux ] && mkdir $HOME/.tmux

# If tmux plugin manager is not installed, install it
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  # Install tmux plugin manager
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # Reload tmux config
  tmux source ~/.tmux.conf
  # Install plugins
  ~/.tmux/plugins/tpm/bin/install_plugins
  # Reload tmux config
  tmux source ~/.tmux.conf
fi

[ -e $HOME/.tmux/gitmux.conf ] && rm $HOME/.tmux/gitmux.conf
ln -s $DOTFILES/tmux/gitmux.conf $HOME/.tmux/gitmux.conf
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

tmux_fzf=$HOME/.local/bin/tmux_fzf
[ -e "$tmux_fzf" ] && rm "$tmux_fzf"
chmod +x $DOTFILES/scripts/tmux-fzf.sh && ln -sf $DOTFILES/scripts/tmux-fzf.sh "$tmux_fzf"
