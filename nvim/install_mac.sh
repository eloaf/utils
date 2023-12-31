# #!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz

# Check if "/usr/local/bin" is in $PATH
if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
    echo "Warning: /usr/local/bin is not in your \$PATH. Consider adding it for better compatibility."
else
    echo "/usr/local/bin is in your \$PATH."
    rm -rf /usr/local/bin/nvim-macos/
    rm /usr/local/bin/nvim
    mv nvim-macos/ /usr/local/bin
    sudo ln -s /usr/local/bin/nvim-macos/bin/nvim /usr/local/bin/nvim

fi

