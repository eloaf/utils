#!/bin/bash

# Check if the system is macOS
if [[ $(uname) == "Darwin" ]]; then
    echo "System is macOS."
    ./install_mac.sh
# Check if the system is Linux
elif [[ $(uname) == "Linux" ]]; then
    echo "System is Linux."
# If neither macOS nor Linux
else
    echo "Unsupported operating system."
fi

