#!/bin/sh

# Function to ask for yes/no confirmation
ask_confirmation() {
	while true; do
		read -p "$1 (y/n): " choice
		case $choice in
		[Yy]) return 0 ;;
		[Nn]) return 1 ;;
		*) echo "Please answer yes or no." ;;
		esac
	done
}

install_dependencies(){
  echo "Installing dependencies..."
  
  cd "$(dirname "$0")" || exit
  os=$(uname)
  
  case "$os" in
    "Linux")
      echo "Installing dependencies for Linux..."
      chmod ./ubuntu/ubuntu-dependencies.sh
      bash ./ubuntu-dependencies.sh
      ;;
    "Darwin")
      echo "Installing dependencies for macOS..."
      chmod +x ./mac/mac-dependencies.sh
      bash ./mac/mac-dependencies.sh 
      ;;
    *)
      echo "Not yet supported OS"
      ;;
  esac
}

if ask_confirmation "Do you want to install the dependencies?"; then
  install_dependencies
fi