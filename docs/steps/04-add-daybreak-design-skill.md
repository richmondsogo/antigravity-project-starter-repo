# Step 04: Add Daybreak Design Skill

**Step Branch**: `step/04-add-daybreak-design-skill`  
**Primary Branch**: `master`  
**Pull Request**: `Local Step 04`  

---

## Objective

Locate and copy the `daybreak-design-skill` (Daybreak's quiet, dense, type-driven editorial reader design system inspired by `brianlovin.com/hn` and Danish functionalism) from local projects into `.agents/skills/daybreak-design-skill/`, verify frontmatter integrity, update repository indexes (`AGENTS.md`, `README.md`), and merge into `master` via a standard `--no-ff` merge commit.

---

## Scope

### Included
1. Copy `daybreak-design-skill` from `C:\Users\Richmond\Desktop\Codebase\medium-reader\.agents\skills\daybreak-design-skill` into `.agents/skills/daybreak-design-skill`.
2. Validate YAML frontmatter integrity via `scripts/verify.ps1`.
3. Update `AGENTS.md` and `README.md` to document the new total of 267 portable skills.
4. Merge into `master` via `--no-ff` merge commit, push to `origin/master`, and delete the step branch.

### Excluded
- Modifying unrelated skills or files.

---

## Verification Evidence

1. Verification check `scripts/verify.ps1` runs clean with 0 failures.
2. Skill exists at `.agents/skills/daybreak-design-skill/SKILL.md`.
3. Total skills in repo: 267.

---

## Provenance

- **First Commit SHA**: `c631f3e`
- **Last Commit SHA**: `c631f3e`
- **Merge Commit SHA**: `59ca00b`

