#!/bin/zsh

echo "🚀 Starting Mac setup..."

# Install Xcode Command Line Tools (needed for git, brew, etc.)
xcode-select --install || echo "✅ Xcode Command Line Tools already installed"

# Install Homebrew
if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install apps and CLI tools from Brewfile
echo "📦 Installing apps from Brewfile..."
brew bundle --file=./Brewfile

# Setup Git config
echo "🛠️ Setting up Git..."
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Install NVM and Node
echo "🧼 Installing NVM + Node..."
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
nvm install --lts
nvm use --lts

npm install -g yarn

# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh

# Expo & EAS CLI
echo "📱 Installing Expo & EAS CLI..."
npm install -g eas-cli

# MacOS tweaks
echo "🪟 Installing Rectangle prefs..."
defaults write com.knollsoft.Rectangle SUEnableAutomaticChecks -bool true

# Commented out until i settle on a spaceship config
# if [ -f ~/.zshrc ]; then
#   echo "📁 Backing up existing .zshrc to ~/.zshrc.backup"
#   mv ~/.zshrc ~/.zshrc.backup
# fi

# ln -s "$(pwd)/.zshrc" ~/.zshrc


echo "🧹 Done! Restart your terminal and sign in to apps like 1Password, GlobalProtect, Notion etc."
