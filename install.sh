#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

echo "Your dependencies is being installed"
chmod +x $DOTFILES/install/install-dependencies.sh
sh $DOTFILES/install/install-dependencies.sh
echo "youe dependencies is installed"

# Kitty
[ -d $HOME/.config/kitty ] && rm -rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

# Tmux
[ -e $HOME/.tmux.conf ] && rm $HOME/.tmux.conf
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# Scripts
mkdir -p $HOME/.local/bin

t=$HOME/.local/bin/t
[ -e "$t" ] && rm "$t"
chmod +x $DOTFILES/scripts/t.sh && ln -sf $DOTFILES/scripts/t.sh $t
