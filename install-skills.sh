#!/bin/zsh

# Exit on error
set -e

# ─────────────────────────────────────────────
# 🪄 MCP and Skills
# ─────────────────────────────────────────────

echo "🤖 Updating Claude AI marketplace(s)..."
claude plugin marketplace update

echo "🤖 Installing Skills management app..."
brew tap crossoverJie/skilldeck && brew install --cask skilldeck

echo "🤖 Updating all skills..."
npx skills update

echo "🤖 Installing Multi-agents Harness app... (ONLY IF YOU HAVE MULTIPLE AGENTS)"
curl -fsSL https://t3.codes/install.sh | sh

echo "🤖 Installing MCP and skills..."


# Debugging Tools (✅ VERY RECOMMENDED ช่วยให้การ debug หน้าบ้านง่ายขึ้น และ ทำ automate test ง่าย)
# =========================================================================================================
# ทำงานผ่านเว็บไซต์หลายขั้นตอน เช่น กรอกฟอร์ม ท่องเว็บ ทำงานกับระบบที่ต้อง Login และเก็บข้อมูลจากหน้าเว็บ มีทั้ง CLI และ Python library
uv tool install browser-use && browser-use skill install
# ตรวจ Console errors, Network requests, JavaScript runtime, Performance traces และทดสอบเว็บผ่าน Chrome ลูกรัก
claude plugin marketplace add ChromeDevTools/chrome-devtools-mcp && claude plugin install chrome-devtools-mcp@chrome-devtools-plugins


# Productivity Tools (✅ VERY RECOMMENDED เพราะช่วยให้ผลลัพธ์ออกมาดีขึ้น ทำงานได้เร็วขึ้น)
# =========================================================================================================
# เน้น Engineering workflow - เก็บ Requirements, TDD, Code Review, Debugging และ Domain Modeling เช่น grill-me, wayfinder, to-ticket, to-spec
claude plugin install mattpocock-skills@claude-plugins-official
# ทักษะจาก workflow ของผู้พัฒนา - มี Engineering, Debugging, Post-mortem และ Productivity skills เช่น scrutinize, debug-mantra
npx skills add thananon/9arm-skills --skill '*' --yes --global
# วิธีคิดและวิธีทำงานร่วมกับ AI หลายตัว - tdd, typescript-best-practices, unslop, swarm, interrogate และทักษะอื่น ๆ Read more https://github.com/backnotprop/pstack
npx skills add backnotprop/pstack --skill '*' --yes --global
# สั่ง AI ให้สร้าง Architecture Diagram แบบ Interactive จากคำอธิบายหรือ Source Code ได้เลย ไม่ต้องนั่งลากกล่องใน draw.io ให้ปวดหัว
npx skills add tt-a1i/archify --skill '*' --yes --global


# LLM Agent Central Memory (✅ VERY RECOMMENDED เนื่องจาก LLMs มีหน่วยความจำชั่วคราวต่อเซสซั่น แต่ถ้าอยากได้ระยะยาวต้องหาที่เก็บกลาง)
# =========================================================================================================
# ความจำระยะยาวของ AI เก็บและค้นข้อมูลจากโปรเจกต์ เอกสาร และบทสนทนาเก่า เช่น ต้องการให้ Claude จำเหตุผลการเลือก Architecture
# อ่านวิธีีใช้ https://mempalaceofficial.com/guide/getting-started.html
uv tool install mempalace
claude plugin marketplace add MemPalace/mempalace && claude plugin install --scope user mempalace
# คลังความรู้ที่จัดเป็นหัวข้อ มีแหล่งอ้างอิง ใช้ค้นคว้า สะสมความรู้ และกลับมาอ่านต่อได้ เช่น ให้ agent ศึกษา Go, Kubernetes, Temporal หรือ DevSecOps เนื้อหาใหม่ๆ อย่างต่อเนื่อง
# อ่านวิธีใช้ https://llm-wiki.net/?utm_source=chatgpt.com#quickstart
claude plugin install wiki@llm-wiki


# Token Usage Optimization (✅ VERY RECOMMENDED เนื่องจาก ช่วยลดปริมาณการใช้ Token) => (Do not use with RTK proxy this can degrade context performance)
# =========================================================================================================
# ตอบสั้น กระชับ ตรงประเด็น
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman
# เขียนโค้ดให้น้อยที่สุดเท่าที่จำเป็น
claude plugin marketplace add DietrichGebert/ponytail && claude plugin install ponytail@ponytail


# Security Review Tools (✅ RECOMMENDED ช่วยลดโอกาสความเสี่ยงความปลอดภัยในระบบ เช่น เผลอ commit credentials, hard code รหัสผ่าน หรือ สร้างช่องโหว่โดยไม่ตั้งใจ สามารถสร้าง hook เพื่อ review ก่อน commit ได้)
# =========================================================================================================
# เตือนโค้ดเสี่ยงอัตโนมัติ + ตรวจ diff ด้วย AI
claude plugin install security-guidance@claude-plugins-official
claude  plugin install code-modernization@claude-plugins-official
# สแกนหาช่องโหว่ใน codebase อย่างเป็นระบบ
claude plugin install claude-security@claude-plugins-official
# ให้ Claude ใช้แนวทาง OWASP ในการเขียนและรีวิวโค้ด
claude plugin marketplace add agamm/claude-code-owasp && claude plugin install owasp-security@agamm


# UX/UI Design Tools (✅ RECOMMENDED ช่วยให้งานออกแบบหน้าบ้าน ใช้งานง่ายขึ้น จาก คุณสมบัติของผู้ใช้งาน การทดสอบ UI ต่างๆ และออกแบบไม่ให้ดู Slop และ Follow UX best practics)
# =========================================================================================================
# คำสั่ง audit, critique, polish และตรวจจับปัญหาด้านดีไซน์
claude plugin marketplace add pbakaus/impeccable && claude plugin install
# Design tokens, components, accessibility และ workflow ตรวจงาน
claude plugin marketplace add plugin87/ux-ui-agent-skills && claude plugin install ux-ui-agent-skills@ux-ui-agent-skills
# บังคับให้หน้าเว็บมีเอกลักษณ์ ลดแพตเทิร์น AI สำเร็จรูป
npx skills add nutlope/hallmark --skill hallmark --yes --global
# ความละเอียดของ UI, Animation และ Interaction
npx skills add emilkowalski/skills --skill '*' --yes --global
# Art direction และแนวทางสร้างเว็บไซต์ที่มีรสนิยม
npx skills add Leonxlnx/taste-skill --skill '*' --yes --global
# Typography, สี, Layout, Accessibility และ Interface review
npx skills add jakubkrehel/skills --skill '*' --yes --global
# กรอง Slop UI, Copy, Responsive, Accessibility
npx skills add miqdadbadjuber/anti-slop --skill '*' --yes --global


# Code Review Tools (⚠️ OPTIONAL เมื่อเราใช้ CODERABBIT หรือ สมัคร OPENAI CODEX เอาไว้ทำ code-review กัน bias)
# =========================================================================================================
# npx skills add coderabbitai/skills -g
# claude plugin install coderabbit # https://docs.coderabbit.ai/cli/claude-code-integration
# claude plugin marketplace add openai/codex-plugin-cc && claude plugin install codex@openai-codex


# Programming Languages (⚠️ OPTIONAL แหล่งเอกสารของภาษาต่างๆ ทำให้ไม่ต้องเปิดเว็บเพื่อค้นหา และ ทำตาม best practices ของแต่ละภาษาที่ออกแบบไว้ ติดตั้งเฉพาะเมื่อใช้งานเท่านั้น)
# =========================================================================================================

# GoLang (Optional)
# claude plugin marketplace add samber/cc && claude plugin install cc-skills-golang@samber
# claude plugin marketplace add JetBrains/go-modern-guidelines && claude plugin install modern-go-guidelines@goland-claude-marketplace

# DotNet (Optional)
# claude plugin marketplace add dotnet/skills
# claude plugin marketplace add codewithmukesh/dotnet-claude-kit && claude plugin install dotnet-claude-kit

# SpringBoot 4 (Optional)
# claude plugin marketplace add rrezartprebreza/spring-boot-skills && claude plugin install spring-boot-4-skills@spring-boot-skills


# Deployment & Cloud Providers (⚠️ OPTIONAL เป็นทักษะสำหรับใช้ deploy ของขึ้น hosting ต่างๆ เช่น vercel หรือ azure ติดตั้งเฉพาะเมื่อใช้งานเท่านั้น)
# =========================================================================================================

# Vercel (Optional)
npx skills add vercel-labs/agent-skills --skill '*' --yes --global
npx skills add vercel/turborepo --skill '*' --yes --global

# Cloudflare (Optional) https://developers.cloudflare.com/agents/model-context-protocol/cloudflare/servers-for-cloudflare/
claude plugin marketplace add cloudflare/skills && claude plugin install cloudflare@cloudflare

# Azure (Optional)
# claude plugin install azure@claude-plugins-official


# Libraries & SDK (⚠️ OPTIONAL เป็นทักษะเมื่อต้องการใช้ library นั้นๆ โดยไม่ต้องเปิด web อ่าน docs ติดตั้งเฉพาะเมื่อใช้งานเท่านั้น)
# =========================================================================================================

# Shadcn (Optional)
# npx skills add shadcn/ui --skill 'shadcn' --yes --global

# Resend (Optional)
# npx skills add resend/resend-skills --skill '*' --yes --global

# VueJS/NuxtJS (Optional)
# npx skills add nuxt/ui --skill '*' --yes --global
# npx skills add vuejs-ai/skills --skill '*' --yes --global


# Databases (⚠️ OPTIONAL เป็นทักษะ สำหรับการใช้งานฐานข้อมูล ติดตั้งเฉพาะเมื่อใช้งานเท่านั้น)
# =========================================================================================================

# PostgresQL (Recommended)
npx skills add microsoft/postgres-skills --full-depth --yes --global

# Redis (Optional)
# claude plugin marketplace add redis/agent-skills && claude install redis-development@redis


# 3rd Party Tools (⚠️ OPTIONAL เป็นทักษะ สำหรับการใช้เครื่องมืออื่นๆ ติดตั้งเฉพาะเมื่อใช้งานเท่านั้น)
# =========================================================================================================

# GitHub (Optional) https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/use-the-github-mcp-server
claude plugin install github@claude-plugins-official

# Temporal + MCP (Optional)
claude plugin marketplace add temporalio/claude-temporal-plugin && claude plugin install temporal@temporal-marketplace
claude mcp add --scope user --transport http temporal-docs https://temporal.mcp.kapa.ai

# LangChain (Optional)
# claude plugin marketplace add langchain-ai/langchain-skills && claude plugin install langchain-skills@langchain-skills

echo "✅ Installation complete!"
