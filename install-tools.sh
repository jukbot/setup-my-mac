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
brew install --cask visual-studio-code
brew install --cask zoom
brew install --cask devtoys
brew install --cask zed
brew install --cask 1password
brew install --cask affine
brew install --cask neohtop
brew install --cask graalvm-jdk
brew tap wickenico/wailbrew
brew install --cask wailbrew

# CLI Tools and SDKs
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install htop
brew install cloudflared
brew install neovim
brew install python
brew install uv
brew install pyenv
brew install node
brew install pnpm
brew install go
brew install openjdk@25
brew install php
brew install composer
brew install rustup
brew install oven-sh/bun/bun
brew install go-task
brew install minikube
brew install openssl 
brew install readline 
brew install sqlite3 
brew install xz 
brew install tcl-tk 
brew install libb2 
brew install zstd 
brew install zlib 
brew install pkgconfig
brew install mvn
brew install go-blueprint
brew install firefoxpwa
brew tap azure/azd && brew install azd
brew install buildpacks/tap/pack

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

# Setup rustup and cargo
curl https://sh.rustup.rs -sSf | sh

# Setup buildpack
. $(pack completion --shell zsh)

# Setup pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc

# Setup openjdk
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
# Set JAVA_HOME
export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-jdk-25/Contents/Home
# Install native-image
$JAVA_HOME/bin/gu install native-image
# Verify
native-image --version

# Apply Shell
source ~/.zsrhc

# Restart Shell

echo "Restarting shell"
exec "$SHELL"

# Install python via pyenv
pyenv install 3.13.7

# Show config summary
echo "Show config summart"
brew config

# Run doctor check
echo "🧑‍⚕️ Health check..."
brew doctor

echo "✅ Installation complete!"

