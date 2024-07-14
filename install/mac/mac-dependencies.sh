#!/bin/sh



# Ask for the administrator password upfront
# sudo -v

# # Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# cd $(dirname $BASH_SOURCE)
# BASE=$(pwd)

cd "$(dirname "$0")" || exit

echo "💻  Preparing Development Environment..."

# Check if on macOS with uname Darwin
if [ "$(uname -s)" = 'Darwin' ]; then
  # Check for Homebrew
  if test ! "$(which brew)"; then
    echo "📦  Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi

echo "📥  Installing Homebrew Packages..."
brew bundle --verbose

