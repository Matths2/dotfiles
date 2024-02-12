#!/bin/sh

echo "Setting up depenencies..."

# Checks if Homebrew is installed
# Credit: https://gist.github.com/codeinthehole/26b37efa67041e1307db
if test ! $(which brew); then
  echo "Installing Homebrew...";
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew is already installed...";
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $XDG_CONFIG_HOME/brew/Brewfile

# Install casks
brew install --cask alacritty
brew install --cask flux
brew install --cask font-hack-nerd-font
brew install --cask hammerspoon
brew install --cask karabiner-elements
brew install --cask firefox
brew install --cask kitty
brew install --cask raycast
brew install --cask temurin
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask discord

echo "Reload shell"

