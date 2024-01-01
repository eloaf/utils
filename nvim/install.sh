#!/bin/bash

# Check if the system is macOS
if [[ $(uname) == "Darwin" ]]; then
    echo "System is macOS."
    ./install_mac.sh
# Check if the system is Linux
elif [[ $(uname) == "Linux" ]]; then
    echo "System is Linux."
    sudo apt update && sudo apt upgrade
    sudo apt install curl
    sudo apt-get install fuse libfuse2
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
    mkdir -p ~/.config/nvim
    cp -r nvim/* ~/.config/nvim/
else
    echo "Unsupported operating system."
fi

