#!/bin/zsh

# Exit on error
set -e

echo "🔐 Requesting sudo access..."
sudo -v

ZSHRC="$HOME/.zshrc"

# Ensure ~/.zshrc is writable
if [ ! -f "$ZSHRC" ]; then
    touch "$ZSHRC"
fi
sudo chown "$USER" "$ZSHRC"
chmod u+w "$ZSHRC"

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "🍺 Homebrew is already installed."
fi

# Ensure zsh is installed and oh-my-zsh
if ! command -v zsh >/dev/null 2>&1; then
    echo "🌀 Installing Zsh..."
    brew install zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🧪 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "🧪 Oh My Zsh is already installed."
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="Eastwood"
plugins=(git)

source $ZSH/oh-my-zsh.sh

echo "Install zsh-syntax-highlighting!"
brew install zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "✅ Setup homebrew and shell complete!"
