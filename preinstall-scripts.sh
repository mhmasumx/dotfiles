#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v || exit 1

# Path of the folder from where the script is running
DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Check if Zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing Zsh..."
    sudo apt-get update
    sudo apt-get install -y zsh
fi

# Check if Zsh is now installed
if command -v zsh &> /dev/null; then
    
    if [ "$SHELL" = "/usr/bin/zsh" ]; then
        echo "zsh is fully setup"
    else
         # Change the default shell to Zsh
         chsh -s $(which zsh)
         echo "Zsh is now the default shell."
    fi
else
    echo "Zsh installation failed."
fi

if command -v brew &> /dev/null; then
  echo "Homebrew is installed."
else
  echo "Homebrew is not installed."
  sudo apt update
  sudo apt-get install build-essential -y
  command -v curl &> /dev/null && echo "curl is installed." || sudo apt install curl -y
  command -v git &> /dev/null && echo "git is installed." || sudo apt install git -y
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.zprofile
fi

if command -v kitty &> /dev/null; then
  echo "Kitty is installed"
else
  	echo "Installing kitty"
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
	sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/

	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
	cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/

	sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
	sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

fi

if command -v ulauncher &> /dev/null; then
  echo "ulanuncher is installed"
else
  echo "installing UI launcher"
  sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher -y
  systemctl --user enable --now ulauncher
fi

echo "Installing essential fonts"
sudo apt install fonts-firacode
makdir -p $HOME/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFontPropo-Regular.ttf
mv FiraCodeNerdFontPropo-Regular.ttf ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/FiraCodeNerdFontPropo-Bold.ttf
mv FiraCodeNerdFontPropo-Bold.ttf ~/.local/share/fonts
wget https://github.com/epk/SF-Mono-Nerd-Font/raw/master/SFMono%20Regular%20Italic%20Nerd%20Font%20Complete.otf
mv SFMono\ Regular\ Italic\ Nerd\ Font\ Complete.otf ~/.local/share/fonts
wget https://github.com/epk/SF-Mono-Nerd-Font/raw/master/SFMono%20Bold%20Italic%20Nerd%20Font%20Complete.otf
mv SFMono\ Bold\ Italic\ Nerd\ Font\ Complete.otf ~/.local/share/fonts


