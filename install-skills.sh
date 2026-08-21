#!/bin/zsh

# Exit on error
set -e

# ─────────────────────────────────────────────
# 🪄 MCP and Skills
# ─────────────────────────────────────────────

echo "🤖 Updating AI marketplace(s)..."
claude plugin marketplace update

echo "🤖 Installing AI MCP and skills..."

# Debugging Tools (RECOMMENDED)
uv tool install browser-use && browser-use skill install
claude plugin marketplace add ChromeDevTools/chrome-devtools-mcp && claude plugin install chrome-devtools-mcp@chrome-devtools-plugins

# Productivity Tools (RECOMMENDED)
claude plugin marketplace add hyperb1iss/hyperskills && claude plugin install hyperskills@hyperb1iss
claude plugin marketplace add mattpocock/skills && claude plugin install mattpocock-skills@mattpococ
npx skills add thananon/9arm-skills --skill '*' --yes --global

# Knowledge Workers (RECOMMENDED)
claude plugin marketplace add anthropics/knowledge-work-plugins

# Token Optimization (RECOMMENDED) => (Do not use with RTK proxy this can degrade context performance)
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman
claude plugin marketplace add DietrichGebert/ponytail && claude plugin install ponytail@ponytail

# Code Review Tools (RECOMMENDED)
# claude plugin install coderabbit # https://docs.coderabbit.ai/cli/claude-code-integration
claude plugin marketplace add openai/codex-plugin-cc && claude plugin install codex@openai-codex

# UX/UI Design Tools (RECOMMENDED)
claude plugin marketplace add pbakaus/impeccable && claude plugin install 
claude plugin marketplace add Leonxlnx/taste-skill && claude plugin install taste-skill@taste-skill
npx skills add nutlope/hallmark --skill hallmark --yes --global

# Cloudflare (Optional) https://developers.cloudflare.com/agents/model-context-protocol/cloudflare/servers-for-cloudflare/
claude plugin marketplace add cloudflare/skills && claude plugin install cloudflare@cloudflare

# GitHub (Optional) https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/use-the-github-mcp-server
claude plugin install github@claude-plugins-official

# GoLang (Optional)
# claude plugin marketplace add samber/cc && claude plugin install cc-skills-golang@samber

# DotNet (Optional)
# claude plugin marketplace add dotnet/skills

# Vercel (Optional)
# npx skills add vercel-labs/agent-skills --skill '*' --yes --global

# Resend (Optional)
# npx skills add resend/resend-skills --skill '*' --yes --global

# VueJS/NuxtJS (Optional)
# npx skills add nuxt/ui --yes --global
# npx skills add vuejs-ai/skills --yes --global

# Chrome AXI (Optional)
npx skills add kunchenguid/chrome-devtools-axi --skill '*' --yes --global

# Azure (Optional)
# claude plugin install azure@claude-plugins-official

# Redis (Optional)
# claude plugin marketplace add redis/agent-skills && claude install redis-development@redis

# LangChain (Optional)
# claude plugin marketplace add langchain-ai/langchain-skills && claude plugin install langchain-skills@langchain-skills

# Temporal (Optional)
# claude plugin marketplace add temporalio/claude-temporal-plugin && claude plugin install temporal@temporal-marketplace

# P'Dear AI Gateway (Optional)
# claude plugin marketplace add EverydayImcalculating/claude-skills && claude plugin install aigw

echo "✅ Installation complete!"
