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

# Prerequisites
brew install make
brew install gcc
brew install ripgrep
brew install lua-language-server

# https://github.com/neoclide/coc.nvim
# curl -sL install-node.vercel.app/lts | bash  # fails...
curl -sL install-node.vercel.app/lts | sudo -E bash -  # works, https://github.com/nodesource/distributions/issues/1157
# is this even necessary...
# I think its necessary for github copilot

brew install pyright
brew install fzf  # ???

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# All the fonts
brew install --cask font-3270-nerd-font
brew install --cask font-fira-mono-nerd-font
brew install --cask font-inconsolata-go-nerd-font
brew install --cask font-inconsolata-lgc-nerd-font
brew install --cask font-inconsolata-nerd-font
brew install --cask font-monofur-nerd-font
brew install --cask font-overpass-nerd-font
brew install --cask font-ubuntu-mono-nerd-font
brew install --cask font-agave-nerd-font
brew install --cask font-arimo-nerd-font
brew install --cask font-anonymice-nerd-font
brew install --cask font-aurulent-sans-mono-nerd-font
brew install --cask font-bigblue-terminal-nerd-font
brew install --cask font-bitstream-vera-sans-mono-nerd-font
brew install --cask font-blex-mono-nerd-font
brew install --cask font-caskaydia-cove-nerd-font
brew install --cask font-code-new-roman-nerd-font
brew install --cask font-cousine-nerd-font
brew install --cask font-daddy-time-mono-nerd-font
brew install --cask font-dejavu-sans-mono-nerd-font
brew install --cask font-droid-sans-mono-nerd-font
brew install --cask font-fantasque-sans-mono-nerd-font
brew install --cask font-fira-code-nerd-font
brew install --cask font-go-mono-nerd-font
brew install --cask font-gohufont-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-hasklug-nerd-font
brew install --cask font-heavy-data-nerd-font
brew install --cask font-hurmit-nerd-font
brew install --cask font-im-writing-nerd-font
brew install --cask font-iosevka-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-lekton-nerd-font
brew install --cask font-liberation-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-monoid-nerd-font
brew install --cask font-mononoki-nerd-font
brew install --cask font-mplus-nerd-font
brew install --cask font-noto-nerd-font
brew install --cask font-open-dyslexic-nerd-font
brew install --cask font-profont-nerd-font
brew install --cask font-proggy-clean-tt-nerd-font
brew install --cask font-roboto-mono-nerd-font
brew install --cask font-sauce-code-pro-nerd-font
brew install --cask font-shure-tech-mono-nerd-font
brew install --cask font-space-mono-nerd-font
brew install --cask font-terminess-ttf-nerd-font
brew install --cask font-tinos-nerd-font
brew install --cask font-ubuntu-nerd-font
brew install --cask font-victor-mono-nerd-font
