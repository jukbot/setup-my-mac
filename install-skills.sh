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
# 🤖 AI & Agents
# ─────────────────────────────────────────────
echo "🤖 Installing AI tools and Agentics tools..."
brew install rtk                # CLI proxy that reduces LLM token
brew install copilot-cli        # Co-Pilot
brew install --cask claude-code # Claude Code
brew install anthropics/tap/ant # Claude Platform CLI
brew install --cask codex       # Codex-CLI


# ─────────────────────────────────────────────
# 🪄 Skills
# ─────────────────────────────────────────────
npm install -g @juliusbrussee/caveman-code
npx impeccable install
npx skills add nutlope/hallmark
npx skills add https://github.com/cloudflare/skills --skill cloudflare
npx skills add mattpocock/skills
npx skills add vercel-labs/agent-skills


# Run Homebrew doctor to detect potential issues
echo "🧑‍⚕️ Health check..."
brew doctor

# Remove old versions and cached downloads
echo "🧹 Cleaning up trash..."
brew cleanup --prune=all

echo "✅ Installation complete!"
