#!/bin/zsh

# Exit on error
set -e

# ─────────────────────────────────────────────
# 🪄 Skills
# ─────────────────────────────────────────────

echo "🤖 Installing AI skills..."
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman
claude plugin marketplace add mattpocock/skills && claude plugin install mattpocock-skills@mattpococ
claude plugin marketplace add pbakaus/impeccable && claude plugin install pbakaus/impeccable
claude plugin marketplace add ChromeDevTools/chrome-devtools-mcp && claude plugin install chrome-devtools-mcp@chrome-devtools-plugins
claude plugin marketplace add hyperb1iss/hyperskills && claude plugin install hyperskills@hyperb1iss
claude plugin marketplace add cloudflare/skills && claude plugin install cloudflare@cloudflare
claude plugin marketplace add openai/codex-plugin-cc && claude plugin install codex@openai-codex

npx add-skill vercel-labs/agent-skills
npx skills add nutlope/hallmark --skill hallmark --agent claude-code
npx impeccable install --providers=claude --scope=global
npx skills add impeccable --agent claude-code
npx skills add nuxt/ui --agent claude-code
npx skills add vuejs-ai/skills -agent claude-code

# ─────────────────────────────────────────────
# 🪄 MCP
# ─────────────────────────────────────────────

echo "🤖 Installing AI MCP..."
claude mcp add chrome-devtools --scope user npx chrome-devtools-mcp@latest


# Run Homebrew doctor to detect potential issues
echo "🧑‍⚕️ Health check..."
brew doctor

# Remove old versions and cached downloads
echo "🧹 Cleaning up trash..."
brew cleanup --prune=all

echo "✅ Installation complete!"
