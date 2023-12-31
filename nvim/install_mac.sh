# #!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
rm nvim-macos.tar.gz

# Check if "/usr/local/bin" is in $PATH
if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
    echo "Warning: /usr/local/bin is not in your \$PATH. Consider adding it for better compatibility."
else
    echo "/usr/local/bin is in your \$PATH."
    sudo rm -rf /usr/local/bin/nvim-macos/
    sudo rm /usr/local/bin/nvim
    sudo mv nvim-macos/ /usr/local/bin
    sudo ln -s /usr/local/bin/nvim-macos/bin/nvim /usr/local/bin/n
    sudo ln -s /usr/local/bin/nvim-macos/bin/nvim /usr/local/bin/nvim
    mkdir ~/.config/nvim
    touch ~/.config/nvim/init.lua
    mkdir ~/.config/nvim/lua
fi

