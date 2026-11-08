---
name: design-system
description: >
  Keep UI implementation aligned with the project design system, Phosphor iconography weights, typographic tokens, and motion rules.
  Use when creating or modifying any visual component, layout, or styling.
---

# Design System Skill

This skill ensures UI implementation stays coherent with the established project design system in `DESIGN.md`.

It works alongside our specialist design and motion skills (`ui-ux-pro-max`, `minimalist-ui`, `tastemaker`, `emil-design-eng`, `better-interface`, and `frontend-design`): this skill provides project-specific token, component, and iconography grounding.

---

## Before Touching UI

1. **Read `DESIGN.md`** — understand the project's visual language, typography, spacing, border radius philosophy, and anti-slop blocklist.
2. **Inspect existing components & `components.json`** — look in the project's component directory before creating anything new.
   - Can an existing primitive or component be composed to cover the case?
   - Only create a new component when existing ones genuinely cannot serve the need.
3. **Check existing design tokens** — colors, spacing, radius, typography.
   - Never introduce hardcoded hex values or arbitrary pixel sizes inline when a token exists.

---

## Iconography System (`@phosphor-icons/react`)

Unless the project explicitly overrides its icon library, use **Phosphor Icons** (`@phosphor-icons/react`, configured via `"iconLibrary": "phosphor"` in `components.json`). Never mix icon libraries (e.g., do not mix `lucide-react` with Phosphor) and never leave icons on accidental default props.

### 1. Semantic Weight Hierarchy

| Role | `weight` | Styling Pattern | Examples |
| :--- | :--- | :--- | :--- |
| **Inactive Navigation / Chrome** | `"regular"` | `size-4 shrink-0 text-muted-foreground` | Inactive sidebar items (`Faders`, `Coins`, `Swatches`), header settings trigger |
| **Active Navigation** | `"duotone"` | `size-4 shrink-0 text-accent fill-accent/20` | Active sidebar tab (`weight={isActive ? "duotone" : "regular"}`) |
| **Ambient Metadata / Context** | `"duotone"` | `size-3.5` or `size-4 shrink-0 text-muted-foreground fill-accent/20` | Domain rows (`GlobeHemisphereWest`), timestamps (`ClockCounterClockwise`) |
| **Micro-UI & Button Actions (`<= 14px`)** | `"bold"` | `h-3.5 w-3.5` (or `h-3 w-3`) `shrink-0` | Carets (`CaretUpDown`), checkmarks (`Check`), arrows (`ArrowRight`, `ArrowsLeftRight`, `ArrowUUpLeft`), search (`MagnifyingGlass`), action buttons (`DownloadSimple`, `UploadSimple`, `ArrowCounterClockwise`, `ArrowSquareOut`) |
| **Callouts, Warnings & Empty/Error States** | `"fill"` | `h-3.5 w-3.5` to `h-10 w-10 shrink-0 text-warning` or `text-destructive` | Alert banners, validation warnings, fatal load states (`WarningCircle`) |

### 2. Core Implementation Patterns

- **Active / Inactive Navigation (`regular` → `duotone`)**:
  ```jsx
  <Icon
    aria-hidden="true"
    weight={isActive ? "duotone" : "regular"}
    className={isActive ? "size-4 shrink-0 text-accent fill-accent/20" : "size-4 shrink-0 text-muted-foreground"}
  />
  ```
- **Ambient Metadata (`duotone` with `fill-accent/20`)**:
  ```jsx
  <GlobeHemisphereWest
    weight="duotone"
    className="size-3.5 text-muted-foreground fill-accent/20 shrink-0"
    aria-hidden="true"
  />
  ```
- **Micro-Affordances (`<= 14px` → `bold`)**:
  At `12px`–`14px` (`h-3 w-3` / `h-3.5 w-3.5`), `"regular"` strokes look thin and washed out. Always use `weight="bold"` for small interactive controls (`CaretUpDown`, `Check`, `ArrowRight`, `ArrowSquareOut`).
- **Layout & Accessibility**:
  - Always include `shrink-0` on every icon inside flex/grid containers.
  - Pass `aria-hidden="true"` on decorative or text-paired icons; for icon-only buttons, keep `aria-hidden="true"` on the icon and place `aria-label` + `title` on the parent `<Button>`.

---

## When Implementing UI

4. **Prefer shadcn / Base UI primitives** — use the `shadcn` MCP and `.agents/skills/shadcn/SKILL.md` to find, install, and compose primitives.
5. **Enforce Typography & Tabular Numerals** — route text through centralized typography primitives/tokens; apply `tabular-nums` to all numbers, counts, prices, and timestamps.
6. **Restrained Motion** — follow `emil-design-eng`: transitions between `120ms`–`220ms`, custom cubic-bezier easing, animating only `opacity` and `transform`, and honoring `prefers-reduced-motion`.

---

## After Implementing UI

7. **Verify in a real browser** — run `.agents/skills/browser-verification/SKILL.md` and audit quality with `.agents/skills/better-interface/SKILL.md`:
   - Confirm layout, spacing, and Phosphor icon weights render cleanly.
   - Check responsive viewports and keyboard focus states.
   - Capture updated product screenshots for `README.md` whenever user-facing UI changes.
8. **Review the diff** — inspect every line of changed CSS/JSX to ensure no ad-hoc colors, raw hex strings, or unaligned spacing values crept in.
