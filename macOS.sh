#!/bin/sh

# Scoll Direction off
defaults write -g com.apple.swipescrolldirection -bool false
defaults write -g com.apple.scrollwheel.scaling -bool false

# Change Screenshots location
defaults write com.apple.screencapture location ~/Pictures/Screenshots


# Stop .DS_Store on network stores
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

killall SystemUIServer

## Dock
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 45

killall Dock

# Hide desktop icon
#defaults write com.apple.finder CreateDesktop false

## Finder

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

killall Finder
