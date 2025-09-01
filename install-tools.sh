#!/bin/zsh

# Exit on error
set -e

echo "🔄 Updating Homebrew..."
brew update
brew upgrade

echo "📦 Installing CLI tools and runtimes..."

# GUI Applications via --cask
brew install --cask ghostty
brew install --cask dotnet-sdk
brew install --cask lens
brew install --cask telegram
brew install --cask tableplus
brew install --cask redis-insight
brew install --cask mongodb-compass
brew install --cask google-cloud-sdk
brew install --cask aldente
brew install --cask discord
brew install --cask messenger
brew install --cask chatgpt
brew install --cask kiro
brew install --cask orbstack
brew install --cask firefox
brew install --cask font-jetbrains-mono
brew install --cask arc
brew install --cask visual-studio-code
brew install --cask zoom
brew install --cask devtoys
brew install --cask warp
brew install --cask insomnia
brew install --cask 1password
brew install --cask affine

# CLI Tools and SDKs
brew install zsh-syntax-highlighting
brew install python
brew install uv
brew install node
brew install pnpm
brew install go
brew install php
brew install composer
brew install rustup
brew install oven-sh/bun/bun
brew install go-task
brew install minikube

echo "🖥️ Installing Applications..."

# Apply environment variables
echo "🔁 Sourcing environment files..."
source ~/.zshrc

# Clean up cache
echo "🧹 Cleaning up trash..."
brew cleanup --prune=all

# Setup gcloud cli
gcloud components install kubectl
kubectl version --client
gcloud components install gke-gcloud-auth-plugin
gke-gcloud-auth-plugin --version

# Setup git config
git config --global core.excludesfile ~/.gitignore
git config --global init.defaultBranch main
git config --global user.name "Juk V."
git config --global user.email "chukkrit.juk@gmail.com"
git config --list
git config credential.helper store

echo "✅ Installation complete!"
