# Step 03: Bundle All Locally Installed Skills and Plugins

**Step Branch**: `step/03-bundle-all-installed-local-skills`  
**Primary Branch**: `master`  
**Pull Request**: `Local Step 03`  

---

## Objective

Bundle 100% of the skills installed locally on the user's PC (across user config directories, installed plugins, and project workspaces) into `.agents/skills/` so that any fresh clone of `starter-repo` on another machine contains every tool, workflow, framework, and design skill the user relies on without missing a single locally installed capability.

---

## Scope

### Included
1. **Locally Installed Standalone & Tool Skills**:
   - `context7-mcp` (`~/.gemini/skills/context7-mcp`)
   - `transitions-agent` (`~/.claude/skills/transitions-agent`)
   - `logo-design` (`~/Downloads/logo-design/logo-design`)
   - `migrate-radix-to-base` (`Desktop/Codebase/bottom-pot-v1/.agents/skills/migrate-radix-to-base`)
   - `setup-matt-pocock-skills` (`Desktop/Codebase/medium-reader/.agents/skills/setup-matt-pocock-skills`)
   - `research` (`Desktop/Codebase/medium-reader/.agents/skills/research`)
   - `parser-change` (`Desktop/Codebase/bottom-pot-v1/.agents/skills/parser-change`)
   - `fastapi` (official FastAPI package skill with references)
   - `using-ao` (Agent Orchestrator CLI skill)
   - `openai-docs`, `imagegen`, `review-agent`, `skill-creator`, `skill-installer` (`~/.codex/skills/.system`)
2. **Locally Installed Plugin Skills** (`~/.gemini/config/plugins/`):
   - `flutter` (25 skills)
   - `firebase` (13 skills)
   - `android-cli` (with `compose-preview`, `device-hub`, and `references/`)
   - `google-maps-platform` (1 skill)
   - `data-agent-kit-plugin` (37 skills)
   - `science` (41 skills)
3. Strict YAML frontmatter verification of all 266 skills via `scripts/verify.ps1`.
4. Updating documentation (`AGENTS.md`, `README.md`) to index every skill category.

### Excluded
- Antigravity IDE built-in platform skills (`~/.gemini/antigravity/builtin/skills/` such as `swarm_narrator`, `swarm_monitor`, `native_swarm`, `permissioned-github`) per user instruction (*"i really dont use a lot of the builtin stuff"*).
- Internal `node_modules` vendor files.

---

## Verification Evidence

1. **Total Skills in Repository**:
   - `(Get-ChildItem -Directory ".agents/skills" | Measure-Object).Count` -> **266 skills**
2. **System-Wide Missing Check**:
   - Scanned all local skill directories (`~/.gemini/config/skills`, `~/.gemini/skills`, `~/.agents/skills`, `~/.claude/skills`, `~/.codex/skills`, `~/.ao/data/skills`, and `~/.gemini/config/plugins/`).
   - Missing skills across entire PC (excluding builtin Antigravity): **0**.
3. **Integrity Check**:
   - Executed `scripts/verify.ps1`:
     - Git available: **OK**
     - No obviously tracked secrets: **OK**
     - components.json valid & configured for Phosphor Icons: **OK**
     - Local agent skills frontmatter integrity: **OK** (4 passed, 0 failed).

---

## Provenance

- **First Commit SHA**: `1851cfc`
- **Last Commit SHA**: `1851cfc`
- **Merge Commit SHA**: `f2d8004`
- **Total Local Skills Bundled**: 266 skills

