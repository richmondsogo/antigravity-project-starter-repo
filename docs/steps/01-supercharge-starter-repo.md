# Step 01: Supercharge Starter-Repo (Portable Skills Suite, Phosphor Icons System, & Git Hygiene)

**Step Branch**: `step/01-supercharge-starter-repo`  
**Primary Branch**: `master`  
**Pull Request**: `Local merge (--no-ff) to origin/master`  

---

## Objective

Upgrade `starter-repo` into a self-contained, portable powerhouse repository equipped with a curated suite of 70+ design, motion, testing, and workflow skills, a baseline `components.json` configured for Phosphor Icons (`@phosphor-icons/react`), comprehensive MCP templates, automated git branch/worktree pruning, and battle-tested engineering rules.

## Scope

**Included**:
- Bundling local `.agents/skills/` covering UI/UX Pro Max (full local search engine & CSV datasets), Emil Kowalski motion skills, Jakub Krehel testing/scoring skills, Meng To DesignCode skills, Elaya Design landing page skills, Codeswithroh Tastemaker, GreenSock GSAP suite, ConardLi Garden skills, Minimalist UI, Owl-Listener designer skills, and local engineering alignment skills (`grill-me`, `to-tickets`, `wayfinder`, etc.).
- Installing `ui-ux-pro-max` into global `.gemini/config/skills/` and sibling repositories (`Nabu-V1`, `medium-reader`).
- Adding `components.json` configured with `"iconLibrary": "phosphor"`.
- Expanding `.agents/mcp_config.json.example` with production-ready templates for Context7, Chrome DevTools, Playwright, Neon, GitHub, and shadcn.
- Creating `scripts/git-cleanup.ps1` and upgrading `scripts/verify.ps1`.
- Updating `DESIGN.md`, `AGENTS.md`, `BUILD_PROTOCOL.md`, `CONTEXT.md`, `README.md`, and `docs/agents/*` with:
  - Phosphor Iconography System (semantic weights: `regular`, `duotone`, `bold`, `fill`, optical sizing, `shrink-0`, `aria-hidden`).
  - Mandatory post-merge branch deletion (local & remote).
  - Continuous documentation mandate (update docs on every pass and every PR merge; never leave docs stale).
  - Mandatory product screenshots / visual proof in `README.md` for every project built from this starter.
  - Surgical changes philosophy and strict force-push ban.

**Excluded**:
- Application-specific runtime source code (`src/` remains clean for downstream projects).

## Plan

1. Cut `step/01-supercharge-starter-repo` branch and record initial plan in `docs/steps/01-supercharge-starter-repo.md`.
2. Copy and organize all requested skills into `.agents/skills/` and propagate `ui-ux-pro-max` to global and sibling project directories.
3. Add `components.json` (`"iconLibrary": "phosphor"`) and upgrade `.agents/mcp_config.json.example`.
4. Author `scripts/git-cleanup.ps1` and enhance `scripts/verify.ps1`.
5. Update `DESIGN.md`, `.agents/skills/design-system/SKILL.md`, `BUILD_PROTOCOL.md`, `AGENTS.md`, `CONTEXT.md`, `README.md`, and `docs/agents/` reference guides.
6. Remove temporary staging files in `.tmp/`, run verification scripts and `ui-ux-pro-max` search tests, and record results.

## Implementation

- Installed 76 skill directories under `.agents/skills/` with valid YAML frontmatter, organized across 5 core domains in `AGENTS.md` and `docs/agents/skills.md`:
  - **Design Intelligence & Art Direction**: `ui-ux-pro-max` (with offline Python engine and 22 stack CSVs), `design-system`, `minimalist-ui`, `tastemaker`, `taste-skill`, `web-design-engineer`, `landing-page-design`, `build-awwwards-quality-sites`, `design-first-ui-prompting`, `clean-minimal-beige-light-mode`, `apple-design`, `humane-functionalism`, `frontend-design`, `figma-designer`, `shadcn`, `ask-sonner`, `pick-ui-library`.
  - **Site Quality Scoring & UI Testing**: `better-interface`, `better-ui`, `better-typography`, `better-colors`, `better-layout`, `better-accessibility`, `better-writing`, `interface-review`, `break`, `browser-verification`, `no-ai-design-slop`, `audit-ai-design-slop`, `anti-slop`, `userinterface-wiki`.
  - **Motion & GSAP Engineering**: `emil-design-eng`, `animate`, `animate-expo`, `review-animations`, `improve-animations`, `find-animation-opportunities`, `animation-performance`, `animation-vocabulary`, `gsap-core`, `gsap-scrolltrigger`, `gsap-timeline`, `gsap-react`, `gsap-plugins`, `gsap-performance`, `gsap-frameworks`, `gsap-utils`, `cinematic-gsap-lenis-motion-system`, `gsap-scrolltrigger-storytelling`, `motion-showreel`, `motion`.
  - **Owl-Listener Designer Toolkit**: `owl-color-system`, `owl-typography-scale`, `owl-spacing-system`, `owl-layout-grid`, `owl-dark-mode-design`, `owl-visual-hierarchy`, `owl-micro-interactions`, `owl-interfaces-that-feel`, `owl-design-qa-checklist`, `owl-design-critique`, `owl-design-principles`.
  - **Engineering Workflow & Alignment**: `ask-matt`, `grill-me`, `grill-with-docs`, `grilling`, `to-spec`, `to-tickets`, `to-questionnaire`, `triage`, `implement`, `tdd`, `code-review`, `diagnosing-bugs`, `prototype`, `improve-codebase-architecture`, `domain-modeling`, `codebase-design`, `state-machine`, `resolving-merge-conflicts`, `wayfinder`, `wait-what`, `wizard`, `handoff`, `writing-for-agents`, `teach`, `performance`, `security-audit`, `project-bootstrap`.
- Propagated `ui-ux-pro-max` to `C:\Users\Richmond\.gemini\config\skills\ui-ux-pro-max`, `Nabu-V1\.agents\skills\ui-ux-pro-max`, and `medium-reader\.agents\skills\ui-ux-pro-max`.
- Created `components.json` at repository root with `"iconLibrary": "phosphor"`.
- Integrated the full Phosphor Iconography System specification (semantic weights `regular`, `duotone`, `bold`, `fill`, `fill-accent/20`, optical sizing, `shrink-0`, and `aria-hidden`) into `DESIGN.md` and `.agents/skills/design-system/SKILL.md`.
- Added `scripts/git-cleanup.ps1` to automate post-merge branch deletion (local and remote), remote tracking ref pruning, and worktree pruning.
- Enhanced `scripts/verify.ps1` to validate `components.json` and YAML frontmatter across all `SKILL.md` files in `.agents/skills/`.

## Discoveries

- In `leonxlnx/taste-skill`, the core skill resides under `skills/taste-skill/SKILL.md` with modular references in `references/*.md`; we bundled `taste-skill` (excluding heavy binary demo photos to keep git clone fast) and authored a dedicated `minimalist-ui/SKILL.md` encoding the warm monochrome, editorial typography, and flat `1px` bento rules alongside Phosphor icon weights.
- In `MengTo/Skills`, the curated skills live under `agent-skills/web-design/` and `agent-skills/ui/` on the `main` branch (`build-awwwards-quality-sites`, `design-first-ui-prompting`, `no-ai-design-slop`, `audit-ai-design-slop`, `cinematic-gsap-lenis-motion-system`, `gsap-scrolltrigger-storytelling`, `clean-minimal-beige-light-mode`).

## Verification

- `scripts/verify.ps1`: **PASS** (4 passed, 0 failed: Git available, no tracked secrets, `components.json` valid & configured for Phosphor Icons, all local `SKILL.md` frontmatter valid).
- `ui-ux-pro-max` Python search engine: **PASS** (`python .agents/skills/ui-ux-pro-max/scripts/search.py "minimalist" --domain style` executes cleanly offline).
- `scripts/git-cleanup.ps1 -DryRun`: **PASS** (correctly identifies `master` primary branch, prunes remote tracking refs and worktrees).
- Docs & README updated: **YES** (`AGENTS.md`, `BUILD_PROTOCOL.md`, `DESIGN.md`, `CONTEXT.md`, `README.md`, `docs/agents/*`).

## Diff / Checkpoint

- First commit SHA: `76b7f83`
- Last commit SHA: `8b5f6c3`
- Merge strategy: Standard merge commit (`--no-ff`)
- Step branch pruned (local & remote): Yes

## Unresolved Issues

None.

## Decisions

- Standardized on `@phosphor-icons/react` (`"iconLibrary": "phosphor"`) in `components.json` with a semantic weight hierarchy (`regular`, `duotone`, `bold`, `fill`) documented in `DESIGN.md` and `design-system` skill as the default visual language.
- Enforced continuous documentation updates on every pass/PR merge and mandatory product screenshots in `README.md`.
- Enforced immediate local and remote branch deletion after PR merge (`scripts/git-cleanup.ps1` + Stage 10 of `BUILD_PROTOCOL.md`).
