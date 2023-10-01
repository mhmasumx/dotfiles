#!/usr/bin/env bash

os=$(uname)

case "$os" in
  "Linux")
    sudo apt install fzf
    ;;
  "Darwin")
    brew install make
    brew install cmake
    brew install fzf
    brew install ripgrep
    brew install zf
    brew install fd
    ;;
  *)
    echo "Not yet supported OS"
    ;;
esac

