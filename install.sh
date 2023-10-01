#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Kitty
rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# Tmux
rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# Scripts
mkdir -p $HOME/.local/bin

t=$HOME/.local/bin/t
[ -e "$t" ] && rm "$t"
chmod +x $DOTFILES/scripts/t && ln -sf $DOTFILES/scripts/t $t
