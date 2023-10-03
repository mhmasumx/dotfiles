#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# echo "Your dependencies is being installed"
# chmod +x $DOTFILES/install/install-dependencies.sh
# sh $DOTFILES/install/install-dependencies.sh
# echo "your dependencies is installed"
#
# # Kitty
# [ -d $HOME/.config/kitty ] && rm -rf $HOME/.config/kitty
# ln -s $DOTFILES/kitty $HOME/.config/kitty
#
# Starship
[ -e $HOME/.config/starship.toml ] && rm $HOME/.config/starship.toml
ln -s $DOTFILES/starship/starship.toml $HOME/.config/starship.toml

# Tmux
# [ -e $HOME/.tmux.conf ] && rm $HOME/.tmux.conf
# ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
# [ -e $HOME/.tmux/gitmux.conf ] && rm $HOME/.tmux/gitmux.conf
# ln -s $DOTFILES/tmux/gitmux.conf $HOME/.tmux/gitmux.conf

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
