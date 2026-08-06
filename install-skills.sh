#!/bin/zsh

# Exit on error
set -e

# ─────────────────────────────────────────────
# 🔦 MCP
# ─────────────────────────────────────────────

echo "🤖 Installing AI MCP..."

claude mcp add browser-use -- uvx -y browser-use
claude mcp add --transport http github https://api.githubcopilot.com/mcp/ # https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/use-the-github-mcp-server
claude mcp add --transport http cloudflare https://docs.mcp.cloudflare.com/mcp 

# ─────────────────────────────────────────────
# 🪄 Skills
# ─────────────────────────────────────────────

echo "🤖 Installing AI skills..."

# ChromeDevTool MCP + Skills
claude plugin marketplace add ChromeDevTools/chrome-devtools-mcp && claude plugin install chrome-devtools-mcp@chrome-devtools-plugins

# Caveman (Token Optimizing)
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman

# Temporal
claude plugin marketplace add temporalio/claude-temporal-plugin && claude plugin install temporal@temporal-marketplace

# Cloudflare (https://developers.cloudflare.com/agents/model-context-protocol/cloudflare/servers-for-cloudflare/)
claude plugin marketplace add cloudflare/skills && claude plugin install cloudflare@cloudflare

# Redis
claude plugin marketplace add redis/agent-skills && claude install redis-development@redis

# CodeRabbit
claude plugin install coderabbit # https://docs.coderabbit.ai/cli/claude-code-integration

# Productivity
claude plugin marketplace add hyperb1iss/hyperskills && claude plugin install hyperskills@hyperb1iss
claude plugin marketplace add mattpocock/skills && claude plugin install mattpocock-skills@mattpococ
claude plugin marketplace add openai/codex-plugin-cc && claude plugin install codex@openai-codex

# Langchain
claude plugin marketplace add langchain-ai/langchain-skills && claude plugin install langchain-skills@langchain-skills

# Azure
claude plugin install azure@claude-plugins-official

# Claude Cowork
claude plugin marketplace add anthropics/knowledge-work-plugins

# Impeccable Design
claude plugin marketplace add pbakaus/impeccable && 

# Dotnet
claude plugin marketplace add dotnet/skills

# Productivity/Code-review
npx skills add thananon/9arm-skills --agent claude-code --skill '*' --yes --global

# Vercel
npx skills add vercel-labs/agent-skills --agent claude-code --skill '*' --yes --global

# Resend
npx skills add resend/resend-skills --agent claude-code --skill '*' --yes --global

# UX/UI Design
claude plugin marketplace add pbakaus/impeccable
npx skills add nutlope/hallmark --skill hallmark --agent claude-code --yes --global

# Frontend Programming
npx skills add nuxt/ui --agent claude-code --yes --global
npx skills add vuejs-ai/skills --agent claude-code --yes --global

# Backend Programming
npx skills add samber/cc-skills-golang --agent claude-code --yes --global
npx skills add openai/skills --skill aspnet-core --agent claude-code --yes --global

# Agent tooling
npx -y skills add kunchenguid/chrome-devtools-axi --agent claude-code --yes --global




# Run Homebrew doctor to detect potential issues
echo "🧑‍⚕️ Health check..."
brew doctor

# Remove old versions and cached downloads
echo "🧹 Cleaning up trash..."
brew cleanup --prune=all

echo "✅ Installation complete!"
