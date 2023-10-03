#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

os=$(uname)
case "$os" in
  "Linux")
    bash ubuntu/ubuntu-dependencies.sh
    ;;
  "Darwin")
    chmod +x $DOTFILES/mac/mac-dependencies.sh
    bash $DOTFILES/mac/mac-dependencies.sh 
    ;;
  *)
    echo "Not yet supported OS"
    ;;
esac
