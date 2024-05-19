#!/bin/bash

pane_command=$(tmux display-message -p '#{pane_current_command}')

if [ "$pane_command" != "nvim" ]; then
    tmux set -p pane-border-status off
    tmux set -p pane-border-format ""
else
    tmux set -p pane-border-status bottom
    tmux set -p pane-border-format "#[fg=#22272E,bg=#E4EFFD,align=centre]  %l:%M:%S • %d %b %Y %p "
fi
