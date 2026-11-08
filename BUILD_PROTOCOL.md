# Build Protocol

This document defines the standard development methodology, git hygiene rules, and documentation mandates for this repository.

It is a practical discipline for shipping high-craft software with a clean, auditable history and zero stale documentation.

---

## Roles

### Planner

The Planner owns understanding, scope, and architectural alignment.

Responsibilities:
- Understand requirements and existing codebase context before proposing implementation.
- Surface and resolve ambiguity before writing product code (use `grill-me` or `to-spec` when requirements are open-ended).
- Define explicit success criteria and verification checks for each step.
- Decide the scope of each step and keep it surgical.
- Review implementation against the plan and specifications.

### Builder

The Builder owns implementation, verification, and documentation currency.

Responsibilities:
- Implement the approved scope on an isolated branch — nothing more.
- Do not silently expand requirements or refactor unrelated files.
- Run all relevant verification checks (`scripts/verify.ps1`, unit/integration tests, and live browser verification).
- Update documentation and `README.md` screenshots on every pass and PR merge.
- Report actual measured results, never assumed results.

These roles can be held by the same agent within a single conversation, or split across subagents (`self`, `research`) for larger steps.

---

## The 10-Stage Development Loop

```
Understand
    ↓
Plan
    ↓
Branch
    ↓
Approve
    ↓
Implement
    ↓
Verify
    ↓
Review diff
    ↓
Record & Sync Docs
    ↓
PR & Review
    ↓
Merge, Prune & Checkpoint
```

1. **Understand** — Read existing code, `CONTEXT.md`, `DESIGN.md`, and prior step logs before forming an opinion.
2. **Plan** — Write a numbered plan with explicit verification criteria in `docs/steps/NN-<slug>.md` (using `docs/steps/00-plan-template.md`).
3. **Branch** — Create an isolated step branch (`step/NN-<slug>`) from the latest primary branch (`main`, fallback `master`). Never implement directly on the primary branch.
4. **Approve** — Confirm the plan with the human partner before modifying application files.
5. **Implement** — Execute the approved plan on the isolated step branch. One scoped task at a time.
6. **Verify** — Run `scripts/verify.ps1`, test suites, and live browser checks (`browser-verification` + `better-interface` skills). Reading your own source code back is not verification.
7. **Review diff** — Run `git status` and `git diff`. Inspect every changed line. Confirm no stray files, secrets, or unintended edits exist.
8. **Record & Sync Docs** — Update the step log in `docs/steps/NN-<slug>.md` AND synchronize `README.md` (including fresh product screenshots when UI/output changes), `CONTEXT.md`, `DESIGN.md`, and `AGENTS.md`. Docs must never be stale.
9. **PR & Review** — Push the branch and open a Pull Request targeting the primary branch. Run two-axis diff review (`code-review` skill: Standards + Spec).
10. **Merge, Prune & Checkpoint** — Land the PR into the primary branch via a standard merge commit (`git merge --no-ff`) to preserve granular commit history. **Immediately delete the merged step branch locally and on remote** (`./scripts/git-cleanup.ps1 -DeleteRemote`), and record the PR URL, first commit SHA, last commit SHA, and merge commit SHA in the step document.

---

## Non-Negotiable Operating Rules

### 1. Git Hygiene, Branch Pruning & Force-Push Ban

- **Protect the primary branch**: Explicitly prefer `main`. If `main` exists, target `main`; otherwise, fall back to `master`. Direct commits to the primary branch are strictly prohibited.
- **Step isolation**: Every step operates on a dedicated branch named `step/NN-<slug>` (e.g., `step/01-auth-flow`).
- **Standard merge commits (`--no-ff`)**: Steps merge to the primary branch using `git merge --no-ff` rather than squashing or rebasing, preserving the granular commit narrative.
- **Delete merged branches immediately**: Every time a PR is merged, delete the feature/step branch both locally and on `origin`:
  ```powershell
  git checkout main # or master
  git pull --ff-only
  git branch -d step/NN-<slug>
  git push origin --delete step/NN-<slug>
  # Or run: .\scripts\git-cleanup.ps1 -DeleteRemote
  ```
- **Standing Ban on Force Push**: **NEVER** run `git push --force` or `git push -f` under any circumstance without stopping, asking the user first, and explaining why a history rewrite is required. Prefer a new fixup commit or `git commit --amend` (only when unpushed).
- **Provenance tracking**: Every completed step log in `docs/steps/` must record the PR URL, first commit SHA, last commit SHA, and merge commit SHA.

### 2. Continuous Documentation & Product Screenshots in `README.md`

- **Update docs on every pass and every PR merge**: Documentation (`README.md`, `CONTEXT.md`, `DESIGN.md`, `AGENTS.md`, `docs/`) is part of the deliverable. Never merge a change that leaves documentation out of date.
- **Mandatory Product Visuals in `README.md`**: Whenever creating or updating `README.md`, **always include product images or screenshots showing the product in action — every single time**. Capture real screenshots from the running app (stored in `docs/assets/` or `public/`) and embed them clearly in `README.md` so anyone visiting the repository immediately sees what the product looks like and does.

### 3. Simplicity & Surgical Changes

- **No speculative infrastructure**: Do not add flexibility, configuration knobs, or dependencies "just in case." Build only what the current step requires.
- **Clean up after removals**: If a feature or toggle is removed, remove its supporting packages, persistence, and dead helpers in the same commit.
- **Surgical diffs**: Do not reformat, refactor, or "improve" adjacent code unrelated to the active task. Remove imports/variables made unused by your own edit; leave pre-existing unrelated code alone unless asked.
- **Propose simpler paths**: If a simpler, more reliable approach exists than what was initially imagined, say so clearly before implementing the complex version.

### 4. Evidence Before Assertions (Verification)

- **Define success criteria upfront**: Before writing code, state what will be true when the step is done and how each item will be verified.
- **Run it live**: For anything with a runtime or visual effect (routes, UI components, CLI commands, scrapers, parsers), verify by running the actual server/command and inspecting the live result in the browser or terminal.
- **Never weaken tests**: If a test fails, diagnose and fix the root cause (`diagnosing-bugs` skill). Never delete, skip, or weaken assertions just to make a check green.
- **Prototype gnarly logic in `.tmp/`**: For complex regexes, parsers, or state machines, prototype and verify against real fixtures in `.tmp/` first, move the verified code into `src/` with unit tests, and clean `.tmp/` before committing.

### 5. Frontend, UI & Design Discipline

- **Follow `DESIGN.md`**: Use the project's established typography scale, token variables, and Phosphor Iconography System (`@phosphor-icons/react` weights: `regular`, `duotone`, `bold`, `fill`).
- **Use specialist UI/UX skills**: Consult `ui-ux-pro-max`, `minimalist-ui`, `emil-design-eng`, `tastemaker`, and `better-interface` when designing, animating, or auditing interfaces.
- **Real browser verification**: Use `browser-verification` and `better-interface` to check layout, responsive breakpoints, accessibility, contrast, and console errors in a real browser.

---

## Using Fresh Conversations

For substantial multi-step builds, start a fresh builder conversation for each major step and provide:
1. A link to the relevant step plan (`docs/steps/NN-step-name.md`).
2. A link to `CONTEXT.md` and `DESIGN.md`.
3. A link to `AGENTS.md`.

This keeps context sharp, fast, and free of drift.
