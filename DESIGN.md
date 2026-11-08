# Design Philosophy

This document defines the design principles, iconography standards, typographic rules, and motion constraints for projects initialized from this starter.

It establishes high-craft defaults and visual distinction while allowing individual projects to evolve their own palette and geometric identity.

---

## Principles

**Modern.** Use current, capable patterns. Avoid dated conventions or generic AI-slop tropes.

**Minimal.** Every element earns its place. Default to less.

**Calm.** Interfaces should not demand attention. They should serve their user quietly and reliably.

**Precise.** Spacing, optical alignment, concentric radii, and proportion are intentional. Approximate is not good enough.

**Content-first.** The interface frames the content, not the other way around.

**Consistent over novel.** Predictable patterns build confidence. Novelty for its own sake erodes it.

---

## Visual Language

This starter defaults to the visual discipline associated with high-craft editorial and engineering interfaces (Linear, Stripe Press, Vercel, Notion):

- Clean, warm or neutral foundations (prefer off-blacks `#141413` and bone/paper `#FAF8F5` over harsh `#000000` on `#FFFFFF`).
- Restrained, semantic use of color (OKLCH or purposeful HSL tokens).
- Deliberate typographic hierarchy with clear separation between display, UI copy, and tabular monospace data.
- Functional hairline borders (`1px`) and systematic spacing.
- Components that feel engineered without appearing over-decorated.

---

## Typography

- **Choose intentional typefaces** — never fall back to raw browser defaults or unstyled system stacks.
- **Establish a strict typographic scale** and centralize text roles (e.g., via a shared `Typography` primitive or CSS utility tokens).
- **Display & Headings**: Use tight tracking (`-0.02em` to `-0.035em`) and `text-wrap: balance`.
- **Body Copy**: `14px`–`16px` (`0.875rem`–`1rem`), comfortable line-height (`1.5`), and readable line measure (`60ch`–`70ch`).
- **Numeric & Technical Data**: Always apply `font-variant-numeric: tabular-nums` (or a monospace font) to counts, prices, timestamps, metrics, and table columns so numbers align vertically.
- **Casing**: Default to sentence case for UI labels, buttons, and navigation. Reserve uppercase (`text-xs tracking-wider uppercase`) strictly for compact eyebrows or metadata headers.

---

## Iconography System (`@phosphor-icons/react`)

By default, projects built from this starter use **Phosphor Icons** (`@phosphor-icons/react`), configured in `components.json` via `"iconLibrary": "phosphor"`, to achieve immediate visual distinction over generic Lucide defaults. Unless a project explicitly specifies another icon set, follow this semantic weight hierarchy and optical sizing system:

### 1. Semantic Weight Hierarchy
Never leave Phosphor icons on default props by accident. Assign `weight` intentionally based on the icon's role and optical size:

| Role | `weight` | Styling Pattern | Examples |
| :--- | :--- | :--- | :--- |
| **Inactive Navigation / Chrome** | `"regular"` | `size-4 shrink-0 text-muted-foreground` | Inactive sidebar items (`Faders`, `Coins`, `Swatches`), header settings trigger |
| **Active Navigation** | `"duotone"` | `size-4 shrink-0 text-accent fill-accent/20` | Active sidebar tab (`weight={isActive ? "duotone" : "regular"}`) |
| **Ambient Metadata / Context** | `"duotone"` | `size-3.5` or `size-4 shrink-0 text-muted-foreground fill-accent/20` | Domain rows (`GlobeHemisphereWest`), timestamps (`ClockCounterClockwise`) |
| **Micro-UI & Button Actions (`<= 14px`)** | `"bold"` | `h-3.5 w-3.5` (or `h-3 w-3`) `shrink-0` | Carets (`CaretUpDown`), checkmarks (`Check`), arrows (`ArrowRight`, `ArrowsLeftRight`, `ArrowUUpLeft`), search (`MagnifyingGlass`), action buttons (`DownloadSimple`, `UploadSimple`, `ArrowCounterClockwise`, `ArrowSquareOut`) |
| **Callouts, Warnings & Empty/Error States** | `"fill"` | `h-3.5 w-3.5` to `h-10 w-10 shrink-0 text-warning` or `text-destructive` | Alert banners, validation warnings, fatal load states (`WarningCircle`) |

### 2. Core Implementation Patterns

#### A. Active / Inactive Navigation (`regular` → `duotone`)
Switch weight dynamically from `"regular"` to `"duotone"` on active state and tint the secondary duotone layer with `fill-accent/20`:
```jsx
<Icon
  aria-hidden="true"
  weight={isActive ? "duotone" : "regular"}
  className={
    isActive
      ? "size-4 shrink-0 text-accent fill-accent/20"
      : "size-4 shrink-0 text-muted-foreground"
  }
/>
```

#### B. Ambient Metadata Icons (`duotone` with Accent Fill)
For quiet metadata icons next to monospace labels (domains, freshness timestamps), pair `text-muted-foreground` strokes with a subtle `fill-accent/20` inner wash so they feel cohesive with the brand palette without competing for attention:
```jsx
<GlobeHemisphereWest
  weight="duotone"
  className="size-3.5 text-muted-foreground fill-accent/20 shrink-0"
  aria-hidden="true"
/>
```

#### C. Micro-Affordances & Controls (`bold` for Optical Clarity)
At `12px`–`14px` (`h-3 w-3` / `h-3.5 w-3.5`), `"regular"` strokes look thin and washed out. Always use `weight="bold"` for small interactive affordances:
```jsx
{/* Combobox trigger caret with open rotation */}
<CaretUpDown
  weight="bold"
  className={cn(
    "ml-2 h-3.5 w-3.5 shrink-0 opacity-60 text-muted-foreground transition-transform duration-150 ease-out",
    open && "rotate-180"
  )}
  aria-hidden="true"
/>

{/* Selected row checkmark */}
<Check
  weight="bold"
  className={cn(
    "mr-1.5 h-3.5 w-3.5 shrink-0 text-accent",
    isSelected ? "opacity-100" : "opacity-0"
  )}
  aria-hidden="true"
/>
```

#### D. Semantic Warnings & Errors (`fill`)
Use `weight="fill"` on alert icons so status callouts read immediately at a glance against tinted or neutral surfaces:
```jsx
<WarningCircle
  weight="fill"
  className="h-4 w-4 text-warning shrink-0 mt-0.5"
  aria-hidden="true"
/>
```

### 3. Icon Layout & Accessibility Rules
1. **Always include `shrink-0`**: Every icon inside a `flex` or `grid` container must have `shrink-0` so long text or narrow viewports never compress the SVG.
2. **Explicit optical sizing**:
   - `h-3 w-3` (`12px`): Inline connectors (`ArrowRight` inside compact chips) and external-link indicators (`ArrowSquareOut`).
   - `h-3.5 w-3.5` / `size-3.5` (`14px`): Button icons, combobox carets, checkmarks, inline warnings, and footer metadata.
   - `h-4 w-4` / `size-4` (`16px`): Sidebar navigation, command search input (`MagnifyingGlass`), and toolbar icon buttons.
3. **Accessibility (`aria-hidden`)**:
   - Pass `aria-hidden="true"` on all decorative icons and icons paired with visible text.
   - For icon-only buttons, keep `aria-hidden="true"` on the icon and place `aria-label` and `title` on the parent `<Button>`.

---

## Spacing, Borders & Surfaces

- **Spacing Scale**: Use a systematic 4px base unit (`gap-1` through `gap-12`). Never mix arbitrary pixel values with scale tokens.
- **Whitespace is Structural**: Prefer generous spacing and crisp `1px` borders over nested card-in-card boxes.
- **Concentric Border Radius**: Either commit to strict square geometry (`--radius: 0px`) or maintain concentric rounding (`outer_radius = inner_radius + padding`). Avoid pill-shaped containers in application layouts.
- **Restrained Shadows**: Rely on subtle surface contrast and `1px` borders rather than heavy drop shadows.

---

## Motion & Micro-Interactions

Follow the `emil-design-eng` and `animate` skills for all motion decisions:
- **Purposeful & Fast**: UI feedback and transitions must stay between `120ms` and `220ms`. Standard UI transitions should never exceed `300ms`.
- **Custom Easing**: Prefer crisp custom cubic-bezier curves (e.g., `cubic-bezier(0.22, 1, 0.36, 1)`) over flat `linear` or sluggish default `ease-in-out`.
- **Composite Properties Only**: Animate `transform` and `opacity` exclusively for layout stability. Never animate `width`, `height`, `top`, or `left` directly.
- **Accessibility**: Always respect `prefers-reduced-motion: reduce`.

---

## What to Avoid (Anti-Slop Blocklist)

Avoid these patterns unless there is an explicit, well-reasoned justification:
- Decorative neon/purple/indigo background gradients or floating mesh blobs.
- Glass / frosted effects (`backdrop-blur`) used for decoration rather than functional layering over scrolling content.
- Giant marketing hero sections inside utility/application interfaces.
- Heavy drop shadows (`shadow-xl`, `shadow-2xl`) on standard cards.
- Mixing icon libraries or using emojis as UI icons.
- Bouncy spring animations or slow entrance staggers on everyday productivity controls.

---

## Components & Design Tokens

- **Reuse before inventing**: Inspect existing project components first, then check `shadcn` / Base UI primitives via [`components.json`](./components.json).
- **Centralize tokens**: Colors, spacing, radius, and typography belong in CSS variables / Tailwind theme tokens — never hardcoded inline hex strings.

---

## Verification

Every visual or interactive change must be verified in a live browser (using `.agents/skills/browser-verification/SKILL.md` and `.agents/skills/better-interface/SKILL.md`) before a step is considered complete.
