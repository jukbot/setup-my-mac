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
claude plugin marketplace add nutlope/hallmark && claude plugin install nutlope/hallmark
claude plugin marketplace add vercel-labs/agent-skills && claude plugin install vercel-labs/agent-skills
claude plugin marketplace add ChromeDevTools/chrome-devtools-mcp && claude plugin install ChromeDevTools/chrome-devtools-mcp
claude plugin marketplace add hyperb1iss/hyperskills && claude plugin install hyperb1iss/hyperskills
claude plugin marketplace add cloudflare/skills && claude plugin install cloudflare/skills
claude plugin marketplace add vercel-labs/agent-skills && claude plugin install vercel-labs/agent-skills

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
