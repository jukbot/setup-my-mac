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
    if [ -x "/opt/homebrew/bin/brew" ]; then
        BREW_BIN="/opt/homebrew/bin/brew"
    elif [ -x "/usr/local/bin/brew" ]; then
        BREW_BIN="/usr/local/bin/brew"
    else
        BREW_BIN="$(command -v brew || true)"
    fi

    if [ -z "$BREW_BIN" ]; then
        echo "❌ Homebrew was installed, but the brew binary could not be found."
        exit 1
    fi

    echo "eval \"\$("$BREW_BIN" shellenv)\"" >> "$ZSHRC"
    eval "$("$BREW_BIN" shellenv)"
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
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "🧪 Oh My Zsh is already installed."
fi

# Write oh-my-zsh config to .zshrc (idempotent)
OH_MY_ZSH_BEGIN_MARKER='# >>> initial-my-mac oh-my-zsh >>>'
OH_MY_ZSH_END_MARKER='# <<< initial-my-mac oh-my-zsh <<<'
if grep -Fq "$OH_MY_ZSH_BEGIN_MARKER" "$ZSHRC"; then
    TMP_ZSHRC="$(mktemp)"
    awk -v begin="$OH_MY_ZSH_BEGIN_MARKER" -v end="$OH_MY_ZSH_END_MARKER" '
        $0 == begin {
            print begin
            print "# Oh My Zsh configuration"
            print "export ZSH=\"$HOME/.oh-my-zsh\""
            print "ZSH_THEME=\"eastwood\""
            print "plugins=(git)"
            print "source $ZSH/oh-my-zsh.sh"
            in_block = 1
            next
        }
        $0 == end {
            in_block = 0
            print end
            next
        }
        !in_block { print }
    ' "$ZSHRC" > "$TMP_ZSHRC"
    mv "$TMP_ZSHRC" "$ZSHRC"
else
    {
        echo ''
        echo "$OH_MY_ZSH_BEGIN_MARKER"
        echo '# Oh My Zsh configuration'
        echo 'export ZSH="$HOME/.oh-my-zsh"'
        echo 'ZSH_THEME="eastwood"'
        echo 'plugins=(git)'
        echo 'source $ZSH/oh-my-zsh.sh'
        echo "$OH_MY_ZSH_END_MARKER"
    } >> "$ZSHRC"
fi

echo "🐟 Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_LINE="source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if ! grep -Fqx "$ZSH_SYNTAX_HIGHLIGHTING_LINE" "$ZSHRC"; then
    echo "$ZSH_SYNTAX_HIGHLIGHTING_LINE" >> "$ZSHRC"
fi

echo "✅ Setup homebrew and shell complete!"
