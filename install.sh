#!/bin/bash
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
fi

# tools
brew install bat \
    coreutils \
    curl \
    git \
    eza \
    fd \
    fish \
    fzf \
    lazygit \
    mas \
    neovim \
    tldr \
    ripgrep \
    zoxide

# casks
brew install --cask \
    docker \
    firefox \
    google-chrome \
    livebook \
    rapidapi \
    rectangle \
    slack \
    tableplus \
    tunnelblick \
    wezterm

# App Store
mas install 497799835 # Xcode
mas install 640199958 # Developer
mas install 1451685025 # WireGuard
mas install 1091189122 # Bear
mas install 775737590 # iA Writer
mas install 1333542190 # 1Password

# macOs settings
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# languages
brew install asdf

# fish
cp config.fish ~/.config/fish/config.fish

# wezterm
cp wezterm.lua ~/.wezterm.lua