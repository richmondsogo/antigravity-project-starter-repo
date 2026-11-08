# MCP Reference

This document describes the Model Context Protocol (MCP) servers available in this starter and how to configure them across machines.

---

## 1. Environment & Portable MCP Servers

 `.agents/mcp_config.json.example` includes ready-to-use templates for the core MCP servers used in our engineering and design workflows:

| MCP Server | Purpose | When to Use |
|---|---|---|
| **Context7 (`context7`)** | Live library & framework documentation lookup (`resolve-library-id` → `query-docs`). | **Mandatory** whenever working with any library, SDK, framework, or CLI tool (React, Next.js, Tailwind, Drizzle, Prisma, GSAP, etc.). |
| **shadcn (`shadcn`)** | Browse, inspect, and install shadcn/ui primitives configured via [`components.json`](../../components.json). | Whenever building or composing UI components. |
| **Chrome DevTools (`chrome-devtools-mcp`)** | Live DOM/CSS inspection, console logs, network requests, performance traces, and Lighthouse audits. | During `browser-verification`, `better-interface` scoring, and debugging. |
| **Playwright (`playwright`)** | Automated browser navigation, interaction testing, and screenshot capture. | E2E verification and capturing product screenshots for `README.md`. |
| **Awwwards (`awwwards`)** | Search award-winning reference sites, motion DNA, scroll maps, and GSAP/Three.js stubs. | When art-directing landing pages (`build-awwwards-quality-sites`, `tastemaker`). |
| **Neon (`neon`)** | Serverless Postgres branch management, schema inspection, migrations, and SQL tuning. | When building full-stack Postgres applications. |
| **GitHub (`github`)** | Repository issues, Pull Requests, reviews, and branch management. | During `to-spec`, `triage`, and Stage 9–10 of `BUILD_PROTOCOL.md`. |

---

## 2. Setting Up on a New Machine

1. If you are running inside **Antigravity**, built-in servers (`context7`, `shadcn`, `chrome-devtools-mcp`, `playwright`, `Neon`, `awwwards`) are already registered.
2. If you are cloning this starter onto a fresh machine or using another harness (Claude Code, Cursor, Windsurf):
   ```powershell
   Copy-Item .agents\mcp_config.json.example .agents\mcp_config.json
   ```
3. Fill in any required environment variables (such as `GITHUB_PERSONAL_ACCESS_TOKEN` or `NEON_API_KEY`) using environment variables rather than hardcoding secrets.

---

## 3. UI Component Workflow (`components.json` + Phosphor Icons)

The root [`components.json`](../../components.json) is pre-configured with `"iconLibrary": "phosphor"`:

```
Need a UI component
        ↓
Inspect existing project components first
        ↓
Use shadcn MCP to inspect/install the primitive
        ↓
Pair with @phosphor-icons/react using DESIGN.md semantic weights (regular, duotone, bold, fill)
        ↓
Verify in live browser & capture README screenshots
```

---

## 4. Security Rules

- **Never commit `.agents/mcp_config.json`** — it is gitignored and verified by `scripts/verify.ps1`.
- Never hardcode API keys, tokens, or connection strings in any committed file.
- Only enable the MCP servers that your active project actually needs.
