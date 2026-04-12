#!/bin/zsh

# Exit on error
set -e

# ─────────────────────────────────────────────
# 🔄 Update Homebrew
# ─────────────────────────────────────────────
echo "🔄 Updating Homebrew..."
brew update
brew upgrade

# ─────────────────────────────────────────────
# 🖥️ GUI Apps — Development Tools
# ─────────────────────────────────────────────
echo "🖥️ Installing development GUI applications..."
brew install --cask ghostty           # Terminal emulator
brew install --cask visual-studio-code # Code editor
brew install --cask dotnet-sdk        # .NET SDK
brew install --cask google-cloud-sdk  # Google Cloud CLI & tools
brew install --cask lens              # Kubernetes IDE
brew install --cask orbstack          # Docker / container runtime
brew install --cask warp              # AI-powered terminal
# brew install --cask graalvm-jdk     # GraalVM JDK (optional)

# ─────────────────────────────────────────────
# 💬 GUI Apps — Communication
# ─────────────────────────────────────────────
echo "💬 Installing communication applications..."
brew install --cask telegram
brew install --cask discord

# ─────────────────────────────────────────────
# 🗄️ GUI Apps — Database Clients
# ─────────────────────────────────────────────
echo "🗄️ Installing database client applications..."
brew install --cask tableplus         # Multi-database GUI client
brew install --cask redis-insight     # Redis GUI client

# ─────────────────────────────────────────────
# 🛠️ GUI Apps — Utilities & Productivity
# ─────────────────────────────────────────────
echo "🛠️ Installing utility and productivity applications..."
brew install --cask aldente           # Battery charge limiter
brew install --cask chatgpt           # ChatGPT desktop app
brew install --cask firefox           # Web browser
brew install --cask font-jetbrains-mono # Developer font
brew install --cask zoom              # Video conferencing
brew install --cask devtoys           # Developer utilities Swiss knife
brew install --cask 1password         # Password manager
brew install --cask affine            # Note-taking / knowledge base

# ─────────────────────────────────────────────
# 🔌 Third-party Tap Installs
# ─────────────────────────────────────────────
echo "🔌 Installing third-party tapped applications..."

# Wailbrew — Wails framework helper
brew tap wickenico/wailbrew
brew install --cask wailbrew

# Loggo — log viewer CLI
brew tap aurc/loggo
brew install aurc/loggo/loggo

# ─────────────────────────────────────────────
# 🐚 Shell Enhancements
# ─────────────────────────────────────────────
echo "🐚 Installing shell enhancements..."
brew install zsh-syntax-highlighting  # Fish-like syntax highlighting for zsh
brew install zsh-autosuggestions      # Fish-like command autosuggestions for zsh

# ─────────────────────────────────────────────
# 🖊️ Editors & System Monitoring
# ─────────────────────────────────────────────
echo "🖊️ Installing editors and monitoring tools..."
brew install htop    # Interactive process viewer
brew install neovim  # Hyperextensible Vim-based text editor

# ─────────────────────────────────────────────
# 🐍 Python Ecosystem
# ─────────────────────────────────────────────
echo "🐍 Installing Python ecosystem..."
brew install python  # Python interpreter
brew install uv      # Fast Python package installer and resolver
brew install ty      # Python type checker
brew install pyenv   # Python version manager

# ─────────────────────────────────────────────
# 🟩 Node.js Ecosystem
# ─────────────────────────────────────────────
echo "🟩 Installing Node.js ecosystem..."
brew install node              # Node.js runtime
brew install pnpm              # Fast, disk-efficient package manager
brew install oven-sh/bun/bun   # All-in-one JavaScript runtime & toolkit

# ─────────────────────────────────────────────
# 🐹 Go Ecosystem
# ─────────────────────────────────────────────
echo "🐹 Installing Go ecosystem..."
brew install go             # Go programming language
brew install go-task        # Task runner / build tool (Taskfile)
brew install go-blueprint   # Go project scaffolding tool

# ─────────────────────────────────────────────
# 🦀 Rust
# ─────────────────────────────────────────────
echo "🦀 Installing Rust toolchain manager..."
brew install rustup  # Rust toolchain installer (run 'rustup-init' after)
rustup-init -y

# ─────────────────────────────────────────────
# ⚡ Task Runners & Kubernetes
# ─────────────────────────────────────────────
echo "⚡ Installing task runners and Kubernetes tools..."
brew install just      # Command runner (justfile)
brew install minikube  # Local Kubernetes cluster

# ─────────────────────────────────────────────
# 📚 Build Dependencies & Libraries
# ─────────────────────────────────────────────
echo "📚 Installing build dependencies and libraries..."
brew install openssl    # TLS/SSL toolkit
brew install xz         # XZ compression library
brew install tcl-tk     # Tcl/Tk GUI toolkit (required by pyenv Python builds)
brew install libb2      # BLAKE2 hashing library
brew install zstd       # Zstandard compression library
brew install zlib       # Compression library
brew install pkgconfig  # Helper tool for compiling applications

# Optional / commented-out tools
# brew install buildpacks/tap/pack  # Cloud Native Buildpacks CLI
# brew install azure-cli            # Azure command-line interface
# brew install openjdk@25           # OpenJDK 25
# brew install mvn                  # Apache Maven build tool
# brew install php                  # PHP runtime
# brew install composer             # PHP dependency manager

echo "📦 All packages installed."

# ─────────────────────────────────────────────
# 🔁 Apply Environment Variables
# ─────────────────────────────────────────────
echo "🔁 Sourcing environment files..."
source ~/.zshrc
source $HOME/.cargo/env

# ─────────────────────────────────────────────
# 🟩 Setup pnpm via Corepack
# ─────────────────────────────────────────────
echo "🟩 Enabling pnpm via corepack..."
corepack enable pnpm

# ─────────────────────────────────────────────
# ☁️ Setup Google Cloud CLI & kubectl
# ─────────────────────────────────────────────
echo "☁️ Configuring gcloud components..."
gcloud components install kubectl
kubectl version --client
gcloud components install gke-gcloud-auth-plugin
gke-gcloud-auth-plugin --version

# ─────────────────────────────────────────────
# 🔧 Setup Git Global Config
# ─────────────────────────────────────────────
echo "🔧 Configuring git global settings..."
git config --global core.excludesfile ~/.gitignore
git config --global init.defaultBranch main

# TODO: change your name and email below
git config --global user.name "Juk V."
git config --global user.email "chukkrit.juk@gmail.com"
git config --list
git config credential.helper store

# ─────────────────────────────────────────────
# 📦 Setup Buildpack CLI (optional)
# ─────────────────────────────────────────────
# Setup shell completion for pack CLI
. $(pack completion --shell zsh)

# ─────────────────────────────────────────────
# 🐍 Setup pyenv
# ─────────────────────────────────────────────
echo "🐍 Configuring pyenv..."
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc

# ─────────────────────────────────────────────
# ☕ Setup OpenJDK (optional — uncomment to use)
# ─────────────────────────────────────────────
# sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
# Set JAVA_HOME
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-jdk-25/Contents/Home
# Install native-image
# $JAVA_HOME/bin/gu install native-image
# native-image --version

# ─────────────────────────────────────────────
# 🔁 Reload Shell
# ─────────────────────────────────────────────
echo "🔁 Reloading shell..."
source ~/.zshrc

echo "Restarting shell"
exec "$SHELL"

# ─────────────────────────────────────────────
# 🐍 Install Python via pyenv
# ─────────────────────────────────────────────
echo "🐍 Installing Python 3.13.7 via pyenv..."
pyenv install 3.13.7

# ─────────────────────────────────────────────
# 🩺 Health Check & Cleanup
# ─────────────────────────────────────────────

# Show Homebrew configuration summary
echo "📋 Show config summary..."
brew config

# Run Homebrew doctor to detect potential issues
echo "🧑‍⚕️ Health check..."
brew doctor

# Remove old versions and cached downloads
echo "🧹 Cleaning up trash..."
brew cleanup --prune=all

echo "✅ Installation complete!"

