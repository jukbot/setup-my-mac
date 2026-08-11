#!/bin/zsh

# Exit on error
set -e

# High-performance CLI proxy compression
brew install rtk

# ─────────────────────────────────────────────
# 🪄 MCP and Skills
# ─────────────────────────────────────────────

echo "🤖 Updating AI marketplace(s)..."
claude plugin marketplace update

echo "🤖 Installing AI MCP and skills..."

# Browser Use
uv tool install browser-use && browser-use skill install

# ChromeDevTool MCP + Skills
claude plugin marketplace add ChromeDevTools/chrome-devtools-mcp && claude plugin install chrome-devtools-mcp@chrome-devtools-plugins

# GitHub (https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/use-the-github-mcp-server)
claude plugin install github@claude-plugins-official

# Caveman (Token Optimizing)
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman

# Ponytail
claude plugin marketplace add DietrichGebert/ponytail && claude plugin install ponytail@ponytail

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

# UX/UI Design
claude plugin marketplace add pbakaus/impeccable
npx skills add nutlope/hallmark --skill hallmark --agent claude-code --yes --global

# Productivity/Code-review
npx skills add thananon/9arm-skills --agent claude-code --skill '*' --yes --global

# Vercel
# npx skills add vercel-labs/agent-skills --agent claude-code --skill '*' --yes --global

# Resend
# npx skills add resend/resend-skills --agent claude-code --skill '*' --yes --global

# Frontend Programming
npx skills add nuxt/ui --agent claude-code --yes --global
npx skills add vuejs-ai/skills --agent claude-code --yes --global

# Backend Programming
npx skills add samber/cc-skills-golang --agent claude-code --yes --global
npx skills add openai/skills --skill aspnet-core --agent claude-code --yes --global

# AXI
npx skills add kunchenguid/chrome-devtools-axi --agent claude-code --skill '*' --yes --global


echo "✅ Installation complete!"
