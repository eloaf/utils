#!/bin/bash

# Check if the system is macOS
if [[ $(uname) == "Darwin" ]]; then
    echo "System is macOS."
    ./install -y_mac.sh
# Check if the system is Linux
elif [[ $(uname) == "Linux" ]]; then
    echo "System is Linux."
    sudo apt update && sudo apt upgrade
    sudo apt install -y curl
    sudo apt-get install -y fuse libfuse2
    sudo apt install -y nodejs npm
    sudo apt install -y libncurses-dev
    # https://www.tecmint.com/install -y-vim-in-linux/
    sudo apt-get install -y software-properties-common
    sudo apt-get update
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install -y vim

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim

    rm -rf ~/.config/nvim/
    mkdir -p ~/.config/nvim/
    cp -r nvim/* ~/.config/nvim/
else
    echo "Unsupported operating system."
fi

