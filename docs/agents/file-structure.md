# Repository File Structure

This document defines the functional directory conventions and file placement rules for this repository.

Agents and human contributors must follow these conventions to keep the codebase navigable, predictable, and clean.

---

## Philosophy

1. **Predictable locations**: Every file belongs in a clearly defined directory based on its function.
2. **Clean root**: The repository root contains only essential configuration and top-level entry documents.
3. **No stray files**: Do not drop temporary scripts, scratchpads, test output, or experimental files into arbitrary directories.
4. **Functional flexibility**: The structure is functional, not rigid. Project-specific build and tooling files (such as package manifests, `components.json`, compiler configs, and linter configs) reside where their ecosystems expect them without unnecessary hurdles.

---

## Directory Conventions

```
starter-repo/
├── .agents/                 # Portable agent intelligence, skills, and MCP templates
│   ├── skills/              # 70+ reusable design, motion, testing, and workflow skills
│   └── mcp_config.json      # Local MCP configuration (gitignored, see .example)
├── docs/                    # Persistent documentation (updated on every pass & PR merge)
│   ├── adr/                 # Architecture Decision Records
│   ├── agents/              # Agent operating guides and reference docs
│   ├── assets/              # Product screenshots & architecture visuals for README.md
│   └── steps/               # Sequential step execution logs
├── scripts/                 # Automation, verification, and git hygiene scripts
│   ├── bootstrap.ps1        # Toolchain setup inspection
│   ├── check-env.ps1        # Environment health check
│   ├── git-cleanup.ps1      # Post-merge branch & worktree pruning
│   └── verify.ps1           # Central verification runner
├── src/                     # Application source code (created as project evolves)
├── tests/                   # Automated test suites (unit, integration, e2e)
├── .tmp/                    # Local temporary workspace & scratchpads (gitignored)
├── AGENTS.md                # Agent working agreement & full resource catalog
├── BUILD_PROTOCOL.md        # 10-stage development methodology & git hygiene
├── CONTEXT.md               # Authoritative project domain and context
├── DESIGN.md                # Design philosophy, Phosphor Icons system & visual rules
├── README.md                # Human entry point (must include product screenshots)
└── components.json          # Pre-configured shadcn/ui manifest ("iconLibrary": "phosphor")
```

---

## Detailed Directory Guide

### Root Directory (`/`)

The root directory is reserved for core project documentation, version control configuration, and standard ecosystem manifests.

**Permitted at root:**
- Core operating documents: `AGENTS.md`, `BUILD_PROTOCOL.md`, `CONTEXT.md`, `DESIGN.md`, `README.md`.
- Git configuration: `.gitignore`, `.gitattributes`.
- Ecosystem configuration and manifests as needed by your stack (e.g., `components.json`, `package.json`, `pnpm-lock.yaml`, `tsconfig.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`).

**Prohibited at root:**
- Ad-hoc scripts (e.g., `test.py`, `run.js`).
- One-off scratch notes, logs, or raw data dumps.
- Application logic or loose source components.

---

### `.agents/` — Portable Agent Intelligence

Contains repository-local agent configuration that travels with the project across machines:
- `.agents/skills/<skill-name>/SKILL.md` — Reusable local agent skills.
- `.agents/mcp_config.json.example` — Committed template for local MCP servers.
- `.agents/mcp_config.json` — Gitignored local MCP server credentials and settings.

---

### `docs/` — Living Repository Documentation

All persistent project documentation lives here and must be kept synchronized on every pass and PR merge:
- `docs/adr/` — Architecture Decision Records following `docs/adr/0000-template.md`.
- `docs/steps/` — Step execution logs following `docs/steps/00-plan-template.md`.
- `docs/assets/` — Product screenshots and visual captures embedded in `README.md`.
- `docs/agents/` — Reference documents for agents:
  - `skills.md` — Complete skills catalog and combination patterns.
  - `mcps.md` — MCP server catalog and security guidelines.
  - `domain.md` — Domain knowledge maintenance guide.
  - `issue-tracker.md` — Issue tracking strategy.
  - `file-structure.md` — This file placement and layout reference.

---

### `scripts/` — Automation & Git Hygiene

PowerShell scripts for bootstrapping, environment validation, git cleanup, and verification:
- `scripts/bootstrap.ps1` — Environment inspection and setup.
- `scripts/check-env.ps1` — Fast environment health check.
- `scripts/verify.ps1` — Verification runner entry point.
- `scripts/git-cleanup.ps1` — Post-merge branch deletion and worktree pruning.

---

### `src/` & `tests/`

- **`src/`**: Subdivide logically by domain, feature, or architectural layer.
- **`tests/`**: Automated unit, integration, and end-to-end tests (`tests/fixtures/` for real data fixtures).

---

### `.tmp/` & Scratchpads — Temporary Work

- Any temporary files, regex/parser prototypes, or experimental scripts must go to `.tmp/` (which is gitignored) or the agent brain scratch directory.
- Never commit `.tmp/` files to the repository.

---

## File Placement Decision Table

| What are you adding? | Where does it go? | Example Path |
|---|---|---|
| Architecture decision record | `docs/adr/` | `docs/adr/0001-use-postgres.md` |
| Step execution plan & log | `docs/steps/` | `docs/steps/01-auth-flow.md` |
| Product screenshot for README | `docs/assets/` | `docs/assets/dashboard-preview.png` |
| Agent reference document | `docs/agents/` | `docs/agents/api-contracts.md` |
| New reusable agent skill | `.agents/skills/<name>/` | `.agents/skills/data-migration/SKILL.md` |
| Verification or tooling script | `scripts/` | `scripts/verify.ps1` |
| Application source code | `src/` (or stack equivalent) | `src/auth/service.ts` |
| Automated test file | `tests/` (or adjacent per stack) | `tests/auth/service.test.ts` |
| Temporary experiment or scratchpad | `.tmp/` or agent brain scratch | `.tmp/scratch-query.sql` |
| Tooling/ecosystem manifest | Root `/` | `components.json`, `package.json` |
