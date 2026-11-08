---
name: minimalist-ui
description: "Minimalist, editorial UI system inspired by Linear, Notion, and Stripe Press. Enforces warm monochrome palettes, editorial typographic contrast, flat 1px-border bento architectures, Phosphor iconography weights, and strict anti-cliche constraints."
---

# Minimalist UI Skill

Use this skill when building or refining web interfaces that demand calm, high-craft, editorial minimalism rather than generic SaaS templates.

---

## 1. Surface & Warm Monochrome Palette

Avoid harsh pure `#000000` on `#FFFFFF`. Ground interfaces in warm off-blacks, bone/paper canvases, and subtle 1px hairline borders:

| Token Role | Light Mode (Paper / Bone) | Dark Mode (Obsidian / Carbon) |
|---|---|---|
| **Canvas (`--background`)** | `#FAF8F5` or `#FBFBF9` | `#0A0A0B` or `#0E0E10` |
| **Elevated Surface (`--card`)** | `#FFFFFF` | `#141417` |
| **Subtle Surface (`--muted`)** | `#F3F1ED` | `#1C1C20` |
| **Primary Ink (`--foreground`)** | `#141413` | `#F4F4F0` |
| **Secondary Ink (`--muted-foreground`)** | `#66645E` | `#94948E` |
| **Hairline Border (`--border`)** | `#E6E4DD` | `#232328` |
| **Primary Accent (`--accent`)** | Deep forest `#1A382B`, ink navy `#1D2B3A`, or warm vermilion `#C84B31` | High-legibility tonal counterpart |

---

## 2. Typographic Hierarchy & Contrast

Typography carries 80% of the visual structure:
1. **Display / Editorial Headings**: Pair a high-contrast editorial serif (*Instrument Serif*, *Newsreader*, *Playfair Display*) or a tight geometric sans (*Geist*, *Plus Jakarta Sans*) with negative tracking (`-0.025em` to `-0.035em`) and `text-wrap: balance`.
2. **UI & Body Copy**: Clean neo-grotesque or humanist sans at `14px`–`16px` (`0.875rem`–`1rem`), line-height `1.5`, comfortable reading measure (`60ch`–`70ch`).
3. **Technical Metadata & Counts**: Monospace (*Geist Mono*, *JetBrains Mono*) with `font-variant-numeric: tabular-nums` for timestamps, prices, IDs, keybindings, and table columns.
4. **Casing**: Use sentence case for all buttons, navigation items, and section headers. Reserve uppercase (`text-xs tracking-wider uppercase`) strictly for small micro-labels or table eyebrows.

---

## 3. Flat Bento & Hairline Architecture

- **Borders over Shadows**: Define structure using crisp `1px solid var(--border)` lines or exposed hairline grids (`gap-px bg-border`) instead of floating drop-shadow cards.
- **Radius Discipline**: Choose either strict architectural square (`--radius: 0px`) or tight hardware rounding (`4px`–`8px`). Never mix pill-shaped containers (`rounded-full`) with sharp cards unless distinguishing semantic tags from layout panels.
- **Concentric Padding**: When nesting a rounded element inside a container, `outer_radius = inner_radius + padding`.
- **Whitespace as Structure**: Use generous padding (`p-6` to `p-10`) and section breathing room rather than adding decorative dividers or background blobs.

---

## 4. Iconography (`@phosphor-icons/react`)

Default to **Phosphor Icons** with intentional weight hierarchy:
- `weight="regular"` for inactive navigation and quiet chrome.
- `weight="duotone"` with `fill-accent/20` for active navigation states and ambient metadata indicators.
- `weight="bold"` for micro-affordances at `<= 14px` (carets, checkmarks, compact action triggers) to preserve optical clarity.
- `weight="fill"` for semantic warnings, errors, and status badges.
- Always include `shrink-0` and `aria-hidden="true"` on decorative or label-paired icons.

---

## 5. Strict Negative Constraints (Banned Defaults)

Never introduce the following without an explicit user override:
- Glowing neon/purple/indigo background gradients or floating mesh blobs.
- Decorative glassmorphism (`backdrop-blur`) on static cards that do not overlap scrolling content.
- Heavy multi-layered drop shadows (`shadow-xl`, `shadow-2xl`) on standard layout containers.
- Generic 3-column icon-in-colored-circle feature grids.
- Bouncy spring animations or entrance staggers exceeding `200ms`. Keep transitions to `120ms`–`180ms cubic-bezier(0.22, 1, 0.36, 1)` on `opacity` and `transform`.
