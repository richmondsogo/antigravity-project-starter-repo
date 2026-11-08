# AGENTS.md

This file is the authoritative working agreement for any AI or human agent operating in this repository.

Read it before touching anything.

---

## Order of Precedence

When instructions conflict, resolve them in this strict order:

1. **User instructions** in the active prompt (highest priority).
2. **`AGENTS.md` & `BUILD_PROTOCOL.md`** (Repository operating agreements).
3. **`CONTEXT.md` & `DESIGN.md`** (Domain constraints and visual design rules).
4. **Project-local skills** (`.agents/skills/`).
5. **Environment skills & general defaults** (lowest priority).

---

## Methodology & Git Workflow

The standard 10-stage development loop is defined in [`BUILD_PROTOCOL.md`](./BUILD_PROTOCOL.md):

```
Understand → Plan → Branch → Approve → Implement → Verify → Review diff → Record & Sync Docs → PR & Review → Merge, Prune & Checkpoint
```

### Primary Branch Protection, Step Isolation & Branch Cleanup

1. **Never commit directly to the primary branch**: Explicitly prefer `main`. If `main` exists, target `main`; otherwise, fall back to `master`.
2. **Every step operates on an isolated branch**: Create and switch to a dedicated branch named `step/NN-<slug>` (e.g., `step/01-auth-flow`).
3. **Standard merge commits (`--no-ff`)**: Steps merge to the primary branch exclusively via Pull Request using standard merge commits (`git merge --no-ff`) to preserve full granular commit history.
4. **Mandatory Post-Merge Branch Deletion**: Immediately after merging a PR into the primary branch, delete the merged step branch both locally (`git branch -d step/NN-<slug>`) and on `origin` (`git push origin --delete step/NN-<slug>`), or run [`scripts/git-cleanup.ps1`](./scripts/git-cleanup.ps1) (`.\scripts\git-cleanup.ps1 -DeleteRemote`). Never let stale branches or orphaned worktrees accumulate.
5. **Standing Ban on Force Push**: **NEVER** run `git push --force` or `git push -f` under any circumstance without stopping, asking the user first, and explaining exactly why a history rewrite is required.
6. **Record full provenance**: Every step log in `docs/steps/` must record the PR URL, first commit SHA, last commit SHA, and merge commit SHA.

---

## Continuous Documentation & Living `README.md` Rules (IMPORTANT)

1. **Update Documentation on Every Pass & Every PR Merge**:
   - Documentation ([`README.md`](./README.md), [`CONTEXT.md`](./CONTEXT.md), [`DESIGN.md`](./DESIGN.md), [`AGENTS.md`](./AGENTS.md), and `docs/`) is a first-class deliverable.
   - Update docs on every implementation pass and before every PR merge so documentation is **never stale**.
2. **Always Include Product Screenshots in `README.md`**:
   - Whenever creating or updating `README.md` for a project, **always include product images or screenshots showing the product in action — every single time**.
   - Capture real screenshots from the live running application (stored cleanly in `docs/assets/` or `public/`) and embed them prominently in `README.md`.

---

## Simplicity, Surgical Changes & Environment Discipline

- **No speculative flexibility or infrastructure**: Build only what the active step requires. Do not add configuration knobs, extra abstractions, or dependencies "just in case."
- **Clean up completely after removals**: If a feature is removed, remove its supporting dependencies, state persistence, and helpers in the same commit.
- **Surgical edits only**: Touch only what the current task requires. Do not reformat or refactor adjacent unrelated code. Remove imports/variables made unused by your own edit.
- **Prototype complex logic in `.tmp/`**: For tricky regexes, parsers, or data transformations, prototype and test against real fixtures in `.tmp/` first, move the verified pattern into `src/` with tests, and delete the `.tmp/` scratch file before committing.
- **PowerShell UTF-8 Encoding**: PowerShell pipes default to code page 437 and can mangle UTF-8 output as mojibake. Always set `[Console]::OutputEncoding = [System.Text.Encoding]::UTF8` before piping output in PowerShell scripts.

---

## File Structure & Directory Rules

Adhere strictly to the directory conventions defined in [`docs/agents/file-structure.md`](./docs/agents/file-structure.md):

- **Root (`/`)**: Reserved for core project documentation (`AGENTS.md`, `BUILD_PROTOCOL.md`, `CONTEXT.md`, `DESIGN.md`, `README.md`) and standard manifests (`package.json`, `components.json`, `pyproject.toml`, etc.). No loose scripts or test dumps.
- **`src/`**: Application source code organized by feature or domain.
- **`tests/`**: Automated unit, integration, and end-to-end tests.
- **`docs/`**: All persistent documentation (`adr/`, `steps/`, `agents/`, `assets/`).
- **`scripts/`**: Automation, environment checks, git cleanup, and verification scripts.
- **`.agents/`**: Portable agent configuration (`skills/`, `mcp_config.json.example`).
- **`.tmp/`**: Gitignored temporary workspace. Use `.tmp/` for throwaway experiments; never pollute source trees.

---

## Before You Implement Anything

1. **Read the relevant documentation**:
   - [`CONTEXT.md`](./CONTEXT.md) — project domain, constraints, non-goals.
   - [`DESIGN.md`](./DESIGN.md) — design philosophy, Phosphor Iconography System, typography, and motion rules.
   - [`docs/steps/`](./docs/steps/) — prior step logs.
   - [`docs/adr/`](./docs/adr/) — architecture decisions.
2. **Inspect the existing repository** before making assumptions about structure, patterns, or dependencies.
3. **Investigate uncertainty before implementing** (use Context7 MCP for library docs, or `grill-me` / `to-spec` for product ambiguity).
4. **Ensure primary branch is clean**, cut a dedicated step branch `step/NN-<slug>`, and write a numbered plan with explicit verification criteria in `docs/steps/NN-<slug>.md` using [`docs/steps/00-plan-template.md`](./docs/steps/00-plan-template.md).
5. **Wait for approval** before modifying application files when operating under the Build Protocol.

---

## After Implementation (Verification & Landing)

Saying something works is not evidence it works. Actual verification is mandatory:

1. Run [`scripts/verify.ps1`](./scripts/verify.ps1) and all relevant test suites.
2. Start the application and verify runtime behavior live.
3. Open a real browser and verify visible changes using `browser-verification` and `better-interface` skills.
4. Capture updated product screenshots for `README.md` if UI or visible output changed, and sync all docs (`README.md`, `CONTEXT.md`, `DESIGN.md`, `docs/steps/NN-<slug>.md`).
5. Run `git status` and `git diff` — confirm only expected files changed and no secrets or stray files exist.
6. Open a Pull Request targeting the primary branch (`main`, fallback `master`), run diff review with `code-review` skill, and land via standard merge commit (`--no-ff`).
7. Delete the merged step branch locally and remotely (`.\scripts\git-cleanup.ps1 -DeleteRemote`) and record the PR URL, first commit SHA, last commit SHA, and merge commit SHA in the step document.

---

## Comprehensive Repository Resources Directory

### 1. Core Operating Documents & Manifests

| Document | Purpose |
|---|---|
| [`AGENTS.md`](./AGENTS.md) | Agent working agreement, standing rules, and full skill/resource index |
| [`BUILD_PROTOCOL.md`](./BUILD_PROTOCOL.md) | 10-stage development methodology, branching/PR pruning, and doc mandates |
| [`CONTEXT.md`](./CONTEXT.md) | Authoritative source of project domain, users, constraints, and non-goals |
| [`DESIGN.md`](./DESIGN.md) | Design philosophy, Phosphor Iconography System, typography, spacing, and motion rules |
| [`README.md`](./README.md) | Project overview, visual product showcase (screenshots), and bootstrap guide |
| [`components.json`](./components.json) | Pre-configured shadcn/ui manifest with `"iconLibrary": "phosphor"` |
| [`.agents/mcp_config.json.example`](./.agents/mcp_config.json.example) | Ready-to-use MCP configuration template (Context7, DevTools, Playwright, Neon, GitHub, shadcn) |

### 2. Automation & Tooling Scripts (`scripts/`)

| Script | Purpose |
|---|---|
| [`scripts/bootstrap.ps1`](./scripts/bootstrap.ps1) | Inspects newly cloned environment and reports toolchain setup status |
| [`scripts/check-env.ps1`](./scripts/check-env.ps1) | Fast environment health check (Node, Python, Git state) |
| [`scripts/verify.ps1`](./scripts/verify.ps1) | Central verification runner for repository state, secrets, skills, and tests |
| [`scripts/git-cleanup.ps1`](./scripts/git-cleanup.ps1) | Prunes merged local/remote step branches, stale tracking refs, and orphaned worktrees |

### 3. Portable Project-Local Skills Catalog (`.agents/skills/`)

Every skill below lives inside `.agents/skills/` and travels with the repository so you can clone and build on any machine immediately.

#### A. Design Intelligence, Art Direction & Landing Pages

| Skill | Path | When to Use |
|---|---|---|
| `ui-ux-pro-max` | [`.agents/skills/ui-ux-pro-max/SKILL.md`](./.agents/skills/ui-ux-pro-max/SKILL.md) | Flagship searchable UI/UX engine (79 styles, 192 product palettes, 74 font pairings, 119 UX rules, 17 GSAP presets, 22 stacks). |
| `design-system` | [`.agents/skills/design-system/SKILL.md`](./.agents/skills/design-system/SKILL.md) | Ground UI in project tokens and the **Phosphor Iconography System** (`regular`, `duotone`, `bold`, `fill`). |
| `minimalist-ui` | [`.agents/skills/minimalist-ui/SKILL.md`](./.agents/skills/minimalist-ui/SKILL.md) | Warm monochrome palettes, editorial typography, flat `1px` bento grids (Linear/Notion/Stripe Press aesthetic). |
| `tastemaker` | [`.agents/skills/tastemaker/SKILL.md`](./.agents/skills/tastemaker/SKILL.md) | Art-direction engine by `codeswithroh` for contrast-verified palettes, typography, and hallmark layouts. |
| `taste-skill` | [`.agents/skills/taste-skill/SKILL.md`](./.agents/skills/taste-skill/SKILL.md) | Comprehensive layout, card, copy, and visual craft references (`leonxlnx/taste-skill`). |
| `web-design-engineer` | [`.agents/skills/web-design-engineer/SKILL.md`](./.agents/skills/web-design-engineer/SKILL.md) | ConardLi Garden skill: design system declaration, OKLCH color theory, curated style recipes, anti-cliche blocklist. |
| `landing-page-design` | [`.agents/skills/landing-page-design/SKILL.md`](./.agents/skills/landing-page-design/SKILL.md) | Elaya Design's two-part conversion strategy + visual system for high-converting landing pages. |
| `build-awwwards-quality-sites` | [`.agents/skills/build-awwwards-quality-sites/SKILL.md`](./.agents/skills/build-awwwards-quality-sites/SKILL.md) | Meng To's art direction & choreography workflow for Awwwards-caliber interactive marketing/editorial sites. |
| `design-first-ui-prompting` | [`.agents/skills/design-first-ui-prompting/SKILL.md`](./.agents/skills/design-first-ui-prompting/SKILL.md) | Meng To's structured UI specification workflow before writing frontend code. |
| `clean-minimal-beige-light-mode` | [`.agents/skills/clean-minimal-beige-light-mode/SKILL.md`](./.agents/skills/clean-minimal-beige-light-mode/SKILL.md) | Editorial warm paper/beige light-mode aesthetic system. |
| `apple-design` | [`.agents/skills/apple-design/SKILL.md`](./.agents/skills/apple-design/SKILL.md) | Apple human interface principles, fluid spring physics, optical sizing, and translucent materials. |
| `humane-functionalism` | [`.agents/skills/humane-functionalism/SKILL.md`](./.agents/skills/humane-functionalism/SKILL.md) | Danish functionalist UI/UX pass grounding hierarchy and craft in human utility. |
| `frontend-design` | [`.agents/skills/frontend-design/SKILL.md`](./.agents/skills/frontend-design/SKILL.md) | Anthropic's distinctive visual styling and layout composition guide. |
| `figma-designer` | [`.agents/skills/figma-designer/SKILL.md`](./.agents/skills/figma-designer/SKILL.md) | Elaya Design's Figma-to-code and component system workflow. |
| `shadcn` | [`.agents/skills/shadcn/SKILL.md`](./.agents/skills/shadcn/SKILL.md) | Composing, theming, and extending shadcn/ui primitives cleanly. |
| `ask-sonner` | [`.agents/skills/ask-sonner/SKILL.md`](./.agents/skills/ask-sonner/SKILL.md) | Complete guide to Sonner toast notifications in React. |
| `pick-ui-library` | [`.agents/skills/pick-ui-library/SKILL.md`](./.agents/skills/pick-ui-library/SKILL.md) | Decision framework for selecting the right UI primitive library for a stack. |

#### B. Site Quality Scoring, UI Testing & Anti-Slop Auditing (Jakub Krehel, Meng To & Local)

| Skill | Path | When to Use |
|---|---|---|
| `better-interface` | [`.agents/skills/better-interface/SKILL.md`](./.agents/skills/better-interface/SKILL.md) | **Jakub Krehel's flagship meta-audit**: evaluates and scores overall site quality across UI, typography, color, layout, a11y, and copy. |
| `better-ui` | [`.agents/skills/better-ui/SKILL.md`](./.agents/skills/better-ui/SKILL.md) | Audits surface polish: concentric border radii, optical alignment, shadows, and hit targets. |
| `better-typography` | [`.agents/skills/better-typography/SKILL.md`](./.agents/skills/better-typography/SKILL.md) | Audits type scales, wrapping, truncation, tabular numerals, and punctuation. |
| `better-colors` | [`.agents/skills/better-colors/SKILL.md`](./.agents/skills/better-colors/SKILL.md) | Audits OKLCH/HSL color tokens, contrast ratios, and dark/light balance. |
| `better-layout` | [`.agents/skills/better-layout/SKILL.md`](./.agents/skills/better-layout/SKILL.md) | Audits structural responsiveness, reading order, and container resilience. |
| `better-accessibility` | [`.agents/skills/better-accessibility/SKILL.md`](./.agents/skills/better-accessibility/SKILL.md) | Audits keyboard navigation, focus rings, ARIA labels, and WCAG 2.2 compliance. |
| `better-writing` | [`.agents/skills/better-writing/SKILL.md`](./.agents/skills/better-writing/SKILL.md) | Audits interface microcopy, empty states, button labels, and error messages. |
| `interface-review` | [`.agents/skills/interface-review/SKILL.md`](./.agents/skills/interface-review/SKILL.md) | Pre-merge UI diff inspection to catch visual regressions before landing PRs. |
| `break` | [`.agents/skills/break/SKILL.md`](./.agents/skills/break/SKILL.md) | Stress-tests UI components against extreme edge cases, long strings, and empty/error states. |
| `browser-verification` | [`.agents/skills/browser-verification/SKILL.md`](./.agents/skills/browser-verification/SKILL.md) | Repeatable real-browser verification workflow for visual and interactive changes. |
| `no-ai-design-slop` | [`.agents/skills/no-ai-design-slop/SKILL.md`](./.agents/skills/no-ai-design-slop/SKILL.md) | Prevent generic AI visual tropes before writing frontend code. |
| `audit-ai-design-slop` | [`.agents/skills/audit-ai-design-slop/SKILL.md`](./.agents/skills/audit-ai-design-slop/SKILL.md) | Diagnose and strip out generic AI-generated UI patterns from an existing page. |
| `anti-slop` / `deslop` | [`.agents/skills/anti-slop/SKILL.md`](./.agents/skills/anti-slop/SKILL.md) | Strip formulaic AI prose and restore crisp, human editorial writing. |
| `userinterface-wiki` | [`.agents/skills/userinterface-wiki/SKILL.md`](./.agents/skills/userinterface-wiki/SKILL.md) | 11-category UI/UX best-practices audit outputting `file:line` findings. |

#### C. Motion, GSAP Choreography & Animation Engineering (Emil Kowalski & GreenSock)

| Skill | Path | When to Use |
|---|---|---|
| `emil-design-eng` | [`.agents/skills/emil-design-eng/SKILL.md`](./.agents/skills/emil-design-eng/SKILL.md) | **Emil Kowalski's flagship skill**: UI polish, component craft, and animation decision framework (<300ms, custom cubic-bezier curves). |
| `animate` | [`.agents/skills/animate/SKILL.md`](./.agents/skills/animate/SKILL.md) | Build purposeful web animations from scratch (timing, easing, interruption, reduced-motion). |
| `review-animations` | [`.agents/skills/review-animations/SKILL.md`](./.agents/skills/review-animations/SKILL.md) | Critique and refine existing motion code with structured Before/After tables. |
| `improve-animations` | [`.agents/skills/improve-animations/SKILL.md`](./.agents/skills/improve-animations/SKILL.md) | Codebase-wide motion audit and prioritized implementation plan. |
| `find-animation-opportunities` | [`.agents/skills/find-animation-opportunities/SKILL.md`](./.agents/skills/find-animation-opportunities/SKILL.md) | Identify high-value places where subtle motion improves spatial continuity. |
| `animation-performance` | [`.agents/skills/animation-performance/SKILL.md`](./.agents/skills/animation-performance/SKILL.md) | 60/120fps compositor optimization (`transform`/`opacity`, GPU layers, layout thrashing). |
| `animation-vocabulary` | [`.agents/skills/animation-vocabulary/SKILL.md`](./.agents/skills/animation-vocabulary/SKILL.md) | Reverse-lookup glossary mapping motion descriptions to exact engineering terms. |
| `gsap-core` | [`.agents/skills/gsap-core/SKILL.md`](./.agents/skills/gsap-core/SKILL.md) | Official GreenSock core API (`gsap.to`, `fromTo`, easing, stagger, `matchMedia`). |
| `gsap-scrolltrigger` | [`.agents/skills/gsap-scrolltrigger/SKILL.md`](./.agents/skills/gsap-scrolltrigger/SKILL.md) | Scroll-linked animations, pinning, scrubbing, and batch triggers. |
| `gsap-timeline` | [`.agents/skills/gsap-timeline/SKILL.md`](./.agents/skills/gsap-timeline/SKILL.md) | Complex sequencing, position parameters, labels, and nested timelines. |
| `gsap-react` | [`.agents/skills/gsap-react/SKILL.md`](./.agents/skills/gsap-react/SKILL.md) | React `useGSAP()` hook, cleanup, `contextSafe`, and Next.js SSR safety. |
| `gsap-plugins` | [`.agents/skills/gsap-plugins/SKILL.md`](./.agents/skills/gsap-plugins/SKILL.md) | Flip, SplitText, Draggable, Observer, ScrollSmoother, and CustomEase. |
| `gsap-performance` | [`.agents/skills/gsap-performance/SKILL.md`](./.agents/skills/gsap-performance/SKILL.md) | `quickTo`, `quickSetter`, ticker management, and memory cleanup. |
| `cinematic-gsap-lenis-motion-system` | [`.agents/skills/cinematic-gsap-lenis-motion-system/SKILL.md`](./.agents/skills/cinematic-gsap-lenis-motion-system/SKILL.md) | Meng To's combined Lenis smooth-scroll + GSAP ScrollTrigger architecture. |
| `motion-showreel` | [`.agents/skills/motion-showreel/SKILL.md`](./.agents/skills/motion-showreel/SKILL.md) | ConardLi Garden skill for interactive product showreels and motion presentations. |
| `motion` | [`.agents/skills/motion/SKILL.md`](./.agents/skills/motion/SKILL.md) | Motion for React (`motion/react` / Framer Motion) layout animations and springs. |

#### D. Owl-Listener Designer Toolkit

| Skill | Path | When to Use |
|---|---|---|
| `owl-color-system` | [`.agents/skills/owl-color-system/SKILL.md`](./.agents/skills/owl-color-system/SKILL.md) | Semantic color architecture, tonal scales, and accessible contrast pairing. |
| `owl-typography-scale` | [`.agents/skills/owl-typography-scale/SKILL.md`](./.agents/skills/owl-typography-scale/SKILL.md) | Modular fluid type scales, line measure, and hierarchy systems. |
| `owl-spacing-system` | [`.agents/skills/owl-spacing-system/SKILL.md`](./.agents/skills/owl-spacing-system/SKILL.md) | Spatial grids, rhythm, and component density tokens. |
| `owl-layout-grid` | [`.agents/skills/owl-layout-grid/SKILL.md`](./.agents/skills/owl-layout-grid/SKILL.md) | Responsive grid systems, breakpoints, and structural alignment. |
| `owl-dark-mode-design` | [`.agents/skills/owl-dark-mode-design/SKILL.md`](./.agents/skills/owl-dark-mode-design/SKILL.md) | True elevation-aware dark mode surfaces, desaturation, and contrast tuning. |
| `owl-visual-hierarchy` | [`.agents/skills/owl-visual-hierarchy/SKILL.md`](./.agents/skills/owl-visual-hierarchy/SKILL.md) | Scanning patterns, focal points, and visual weight distribution. |
| `owl-micro-interactions` | [`.agents/skills/owl-micro-interactions/SKILL.md`](./.agents/skills/owl-micro-interactions/SKILL.md) | Specifying trigger-rules-feedback-loops for tactile UI controls. |
| `owl-interfaces-that-feel` | [`.agents/skills/owl-interfaces-that-feel/SKILL.md`](./.agents/skills/owl-interfaces-that-feel/SKILL.md) | Crafting responsive, tactile digital materiality. |
| `owl-design-qa-checklist` | [`.agents/skills/owl-design-qa-checklist/SKILL.md`](./.agents/skills/owl-design-qa-checklist/SKILL.md) | Pre-launch design QA checklist across states, viewports, and tokens. |
| `owl-design-critique` | [`.agents/skills/owl-design-critique/SKILL.md`](./.agents/skills/owl-design-critique/SKILL.md) | Structured design critique against product goals and usability principles. |
| `owl-design-principles` | [`.agents/skills/owl-design-principles/SKILL.md`](./.agents/skills/owl-design-principles/SKILL.md) | Defining project-specific design principles and decision tenets. |

#### E. Superpowers Process Suite & Engineering Loop

| Skill | Path | When to Use |
|---|---|---|
| `using-superpowers` | [`.agents/skills/using-superpowers/SKILL.md`](./.agents/skills/using-superpowers/SKILL.md) | Universal skill router: invoke relevant skills before any response or action. |
| `brainstorming` | [`.agents/skills/brainstorming/SKILL.md`](./.agents/skills/brainstorming/SKILL.md) | Interactive design thinking, requirement discovery, and visual companion mockups. |
| `writing-plans` | [`.agents/skills/writing-plans/SKILL.md`](./.agents/skills/writing-plans/SKILL.md) | Produce detailed, bite-sized implementation specs with exact verification commands. |
| `executing-plans` | [`.agents/skills/executing-plans/SKILL.md`](./.agents/skills/executing-plans/SKILL.md) | Execute implementation plans task-by-task with verification gates. |
| `subagent-driven-development` | [`.agents/skills/subagent-driven-development/SKILL.md`](./.agents/skills/subagent-driven-development/SKILL.md) | Dispatch subagents for independent tasks in isolated branches/worktrees. |
| `dispatching-parallel-agents` | [`.agents/skills/dispatching-parallel-agents/SKILL.md`](./.agents/skills/dispatching-parallel-agents/SKILL.md) | Parallelize 2+ independent work streams safely. |
| `systematic-debugging` | [`.agents/skills/systematic-debugging/SKILL.md`](./.agents/skills/systematic-debugging/SKILL.md) | 4-phase root cause diagnosis loop before proposing fixes. |
| `diagnosing-superpowers` | [`.agents/skills/diagnosing-superpowers/SKILL.md`](./.agents/skills/diagnosing-superpowers/SKILL.md) | Post-mortem session diagnosis and audit. |
| `test-driven-development` | [`.agents/skills/test-driven-development/SKILL.md`](./.agents/skills/test-driven-development/SKILL.md) | Enforce red-green-refactor cycle before writing implementation code. |
| `verification-before-completion` | [`.agents/skills/verification-before-completion/SKILL.md`](./.agents/skills/verification-before-completion/SKILL.md) | Strict verification evidence before claiming tasks are done. |
| `requesting-code-review` | [`.agents/skills/requesting-code-review/SKILL.md`](./.agents/skills/requesting-code-review/SKILL.md) | Two-axis code review against standards and spec. |
| `receiving-code-review` | [`.agents/skills/receiving-code-review/SKILL.md`](./.agents/skills/receiving-code-review/SKILL.md) | Handle code review suggestions with technical rigor. |
| `finishing-a-development-branch` | [`.agents/skills/finishing-a-development-branch/SKILL.md`](./.agents/skills/finishing-a-development-branch/SKILL.md) | Clean up, branch merge strategy, and post-implementation decisions. |
| `using-git-worktrees` | [`.agents/skills/using-git-worktrees/SKILL.md`](./.agents/skills/using-git-worktrees/SKILL.md) | Isolate development workflows using native worktrees. |
| `writing-skills` | [`.agents/skills/writing-skills/SKILL.md`](./.agents/skills/writing-skills/SKILL.md) | Author, test, and benchmark new reusable agent skills. |

#### F. Chrome DevTools, Web Guidance & Platform SDKs

| Skill | Path | When to Use |
|---|---|---|
| `chrome-devtools` | [`.agents/skills/chrome-devtools/SKILL.md`](./.agents/skills/chrome-devtools/SKILL.md) | Browser inspection, DOM/CSS styles, and network analysis via MCP. |
| `a11y-debugging` | [`.agents/skills/a11y-debugging/SKILL.md`](./.agents/skills/a11y-debugging/SKILL.md) | Accessibility debugging and WCAG 2.2 auditing. |
| `cookie-debugging` | [`.agents/skills/cookie-debugging/SKILL.md`](./.agents/skills/cookie-debugging/SKILL.md) | Inspect cookies, session tokens, and auth redirects. |
| `memory-leak-debugging` | [`.agents/skills/memory-leak-debugging/SKILL.md`](./.agents/skills/memory-leak-debugging/SKILL.md) | Diagnose memory leaks and inspect heap snapshots. |
| `debug-optimize-lcp` | [`.agents/skills/debug-optimize-lcp/SKILL.md`](./.agents/skills/debug-optimize-lcp/SKILL.md) | Core Web Vitals Largest Contentful Paint optimization. |
| `troubleshooting` | [`.agents/skills/troubleshooting/SKILL.md`](./.agents/skills/troubleshooting/SKILL.md) | Diagnose DevTools MCP connectivity issues. |
| `modern-web-guidance` | [`.agents/skills/modern-web-guidance/SKILL.md`](./.agents/skills/modern-web-guidance/SKILL.md) | Modern web standards, modern HTML APIs, and performance. |
| `chrome-extensions` | [`.agents/skills/chrome-extensions/SKILL.md`](./.agents/skills/chrome-extensions/SKILL.md) | Manifest V3 Chrome Extension development. |
| `google-antigravity-sdk` | [`.agents/skills/google-antigravity-sdk/SKILL.md`](./.agents/skills/google-antigravity-sdk/SKILL.md) | Multi-agent orchestration and Antigravity SDK workflows. |
| `gemini-api-dev` | [`.agents/skills/gemini-api-dev/SKILL.md`](./.agents/skills/gemini-api-dev/SKILL.md) | Gemini API multimodal generation, structured output, and tools. |
| `gemini-live-api-dev` | [`.agents/skills/gemini-live-api-dev/SKILL.md`](./.agents/skills/gemini-live-api-dev/SKILL.md) | Real-time bidirectional streaming over WebSockets. |
| `gemini-omni-flash-api` | [`.agents/skills/gemini-omni-flash-api/SKILL.md`](./.agents/skills/gemini-omni-flash-api/SKILL.md) | Low-latency audio-to-audio streaming with Gemini Omni. |
| `write-swift` | [`.agents/skills/write-swift/SKILL.md`](./.agents/skills/write-swift/SKILL.md) | Swift language conventions and idiomatic code patterns. |

#### G. Engineering Workflow, Architecture & Alignment (Matt Pocock & Alignment)

| Skill | Path | When to Use |
|---|---|---|
| `ask-matt` | [`.agents/skills/ask-matt/SKILL.md`](./.agents/skills/ask-matt/SKILL.md) | Skill router: start here when unsure which workflow skill fits the task. |
| `grill-me` | [`.agents/skills/grill-me/SKILL.md`](./.agents/skills/grill-me/SKILL.md) | Interactive Socratic interview to resolve product/design ambiguity before planning. |
| `to-spec` | [`.agents/skills/to-spec/SKILL.md`](./.agents/skills/to-spec/SKILL.md) | Crystallize a conversation or feature idea into an actionable specification. |
| `to-tickets` | [`.agents/skills/to-tickets/SKILL.md`](./.agents/skills/to-tickets/SKILL.md) | Break an approved spec down into vertical, testable implementation steps/tickets. |
| `triage` | [`.agents/skills/triage/SKILL.md`](./.agents/skills/triage/SKILL.md) | Diagnose issues and write agent-ready implementation briefs. |
| `implement` | [`.agents/skills/implement/SKILL.md`](./.agents/skills/implement/SKILL.md) | Execute work from a spec or step plan; drives TDD and closes with code review. |
| `tdd` | [`.agents/skills/tdd/SKILL.md`](./.agents/skills/tdd/SKILL.md) | Red → Green → Refactor test-driven development loop. |
| `code-review` | [`.agents/skills/code-review/SKILL.md`](./.agents/skills/code-review/SKILL.md) | Two-axis diff review (Standards + Spec) between HEAD and target branch. |
| `diagnosing-bugs` | [`.agents/skills/diagnosing-bugs/SKILL.md`](./.agents/skills/diagnosing-bugs/SKILL.md) | Structured root-cause diagnosis loop for bugs and regressions. |
| `prototype` | [`.agents/skills/prototype/SKILL.md`](./.agents/skills/prototype/SKILL.md) | Build throwaway prototype code to answer a design or state-modeling question. |
| `improve-codebase-architecture` | [`.agents/skills/improve-codebase-architecture/SKILL.md`](./.agents/skills/improve-codebase-architecture/SKILL.md) | Identify and execute high-leverage module boundary and architecture improvements. |
| `domain-modeling` | [`.agents/skills/domain-modeling/SKILL.md`](./.agents/skills/domain-modeling/SKILL.md) | Model core domain entities, invariants, and state transitions cleanly. |
| `state-machine` | [`.agents/skills/state-machine/SKILL.md`](./.agents/skills/state-machine/SKILL.md) | Design explicit state machines for complex UI and workflow states. |
| `resolving-merge-conflicts` | [`.agents/skills/resolving-merge-conflicts/SKILL.md`](./.agents/skills/resolving-merge-conflicts/SKILL.md) | Safely analyze and resolve git merge conflicts without losing intent. |
| `wayfinder` / `wait-what` | [`.agents/skills/wayfinder/SKILL.md`](./.agents/skills/wayfinder/SKILL.md) | Re-orient when blocked, confused, or when assumptions break mid-step. |
| `handoff` | [`.agents/skills/handoff/SKILL.md`](./.agents/skills/handoff/SKILL.md) | Package clean session state and context for a fresh builder conversation. |
| `performance` | [`.agents/skills/performance/SKILL.md`](./.agents/skills/performance/SKILL.md) | Web performance optimization (Core Web Vitals, bundle size, rendering speed). |
| `security-audit` | [`.agents/skills/security-audit/SKILL.md`](./.agents/skills/security-audit/SKILL.md) | Security review across auth, input validation, secrets, and dependencies. |
| `project-bootstrap` | [`.agents/skills/project-bootstrap/SKILL.md`](./.agents/skills/project-bootstrap/SKILL.md) | Structured process for initializing a new project cloned from this starter. |
