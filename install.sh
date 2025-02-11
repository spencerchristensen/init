#!/bin/bash
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >>/Users/$USER/.zprofile
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
  mise \
  neovim \
  tldr \
  ripgrep \
  zoxide

# casks
brew install --cask \
  alfred \
  docker \
  firefox \
  google-chrome \
  livebook \
  rapidapi \
  rectangle \
  slack \
  sublime-text \
  sublime-merge \
  tableplus \
  wezterm

# App Store
mas install 497799835  # Xcode
mas install 640199958  # Developer
mas install 1451685025 # WireGuard
mas install 775737590  # iA Writer
mas install 1333542190 # 1Password

# macOs settings
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

cp config.fish ~/.config/fish/config.fish
cp wezterm.lua ~/.wezterm.lua
