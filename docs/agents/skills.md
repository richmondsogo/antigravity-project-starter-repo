# Skills Reference

This document describes the portable agent skills bundled inside `.agents/skills/` in this repository.

Because all core workflow, UI/UX, motion, and testing skills live inside `.agents/skills/`, you can clone this starter on any computer and start building immediately with full agent intelligence.

---

## 1. Design Intelligence, Art Direction & Landing Pages

| Skill | Location | Purpose |
|---|---|---|
| `ui-ux-pro-max` | `.agents/skills/ui-ux-pro-max/SKILL.md` | Local searchable UI/UX database (`scripts/search.py`): 79 styles, 192 product palettes, 74 font pairings, 119 UX guidelines, 105 icons, 17 GSAP presets, 25 chart types, and 22 stacks. |
| `design-system` | `.agents/skills/design-system/SKILL.md` | Ground UI in project tokens and the **Phosphor Iconography System** (`@phosphor-icons/react` weights: `regular`, `duotone`, `bold`, `fill`). |
| `minimalist-ui` | `.agents/skills/minimalist-ui/SKILL.md` | Editorial warm monochrome palettes, typographic contrast, flat `1px` border bento architectures, and anti-cliche blocklists. |
| `tastemaker` | `.agents/skills/tastemaker/SKILL.md` | Art-direction layer by `codeswithroh` generating contrast-verified palettes, typography, and hallmark architectures. |
| `taste-skill` | `.agents/skills/taste-skill/SKILL.md` | Comprehensive visual craft, layout, card, and microcopy reference library (`leonxlnx/taste-skill`). |
| `web-design-engineer` | `.agents/skills/web-design-engineer/SKILL.md` | ConardLi Garden skill: design system declaration, OKLCH color theory, curated style recipes (Linear, Stripe Press, Bloomberg). |
| `landing-page-design` | `.agents/skills/landing-page-design/SKILL.md` | Elaya Design's two-part workflow (Part A: Offer/Audience/Action Strategy; Part B: Visual System) for high-converting landing pages. |
| `build-awwwards-quality-sites` | `.agents/skills/build-awwwards-quality-sites/SKILL.md` | Meng To's art direction, scroll storytelling, and motion choreography workflow. |
| `design-first-ui-prompting` | `.agents/skills/design-first-ui-prompting/SKILL.md` | Meng To's structured UI specification workflow before writing frontend code. |
| `clean-minimal-beige-light-mode` | `.agents/skills/clean-minimal-beige-light-mode/SKILL.md` | Warm editorial beige/paper light-mode aesthetic system. |
| `apple-design` | `.agents/skills/apple-design/SKILL.md` | Apple HIG principles, fluid springs, optical sizing, and translucent depth. |
| `humane-functionalism` | `.agents/skills/humane-functionalism/SKILL.md` | Danish functionalist UI/UX pass grounding hierarchy and craft in human utility. |
| `frontend-design` | `.agents/skills/frontend-design/SKILL.md` | Anthropic's distinctive visual design skill. |
| `figma-designer` | `.agents/skills/figma-designer/SKILL.md` | Elaya Design's Figma-to-code and component system workflow. |
| `shadcn` | `.agents/skills/shadcn/SKILL.md` | Composing, theming, and extending shadcn/ui primitives cleanly. |
| `ask-sonner` | `.agents/skills/ask-sonner/SKILL.md` | Complete guide to Sonner toast notifications in React. |
| `pick-ui-library` | `.agents/skills/pick-ui-library/SKILL.md` | Framework for choosing the right UI component primitive library. |

---

## 2. Site Quality Scoring, UI Testing & Anti-Slop Auditing

| Skill | Location | Purpose |
|---|---|---|
| `better-interface` | `.agents/skills/better-interface/SKILL.md` | **Jakub Krehel's meta-review skill**: coordinates a cross-discipline audit across UI, typography, color, layout, accessibility, and copy, returning a ranked report and quality score. |
| `better-ui` | `.agents/skills/better-ui/SKILL.md` | Audits surface polish: concentric border radii, optical alignment, shadows, and hit areas. |
| `better-typography` | `.agents/skills/better-typography/SKILL.md` | Audits type scales, wrapping, truncation, tabular numerals, and punctuation. |
| `better-colors` | `.agents/skills/better-colors/SKILL.md` | Audits OKLCH/HSL color tokens, contrast ratios, and dark/light balance. |
| `better-layout` | `.agents/skills/better-layout/SKILL.md` | Audits structural responsiveness, reading order, and container resilience. |
| `better-accessibility` | `.agents/skills/better-accessibility/SKILL.md` | Audits keyboard navigation, focus management, ARIA labels, and WCAG 2.2 compliance. |
| `better-writing` | `.agents/skills/better-writing/SKILL.md` | Audits interface microcopy, empty states, button labels, and error messages. |
| `interface-review` | `.agents/skills/interface-review/SKILL.md` | Inspects uncommitted changes or branches to catch UI regressions before merging. |
| `break` | `.agents/skills/break/SKILL.md` | Stress-tests components across extreme edge cases, mock data states, and layout bounds. |
| `browser-verification` | `.agents/skills/browser-verification/SKILL.md` | Repeatable real-browser verification workflow for visual and interactive changes. |
| `no-ai-design-slop` | `.agents/skills/no-ai-design-slop/SKILL.md` | Pre-implementation guardrails blocking generic AI visual tropes. |
| `audit-ai-design-slop` | `.agents/skills/audit-ai-design-slop/SKILL.md` | Diagnoses and strips generic AI-generated UI patterns from existing code. |
| `anti-slop` / `deslop` | `.agents/skills/anti-slop/SKILL.md` | Editorial pass removing formulaic AI prose. |
| `userinterface-wiki` | `.agents/skills/userinterface-wiki/SKILL.md` | 11-category UI/UX audit outputting `file:line` findings. |

---

## 3. Motion, GSAP Choreography & Animation Engineering

| Skill | Location | Purpose |
|---|---|---|
| `emil-design-eng` | `.agents/skills/emil-design-eng/SKILL.md` | **Emil Kowalski's flagship skill**: UI polish, component composition, and animation decisions (<300ms, custom cubic-bezier curves). |
| `animate` | `.agents/skills/animate/SKILL.md` | Build purposeful web animations from scratch (timing, easing, interruption, reduced-motion). |
| `review-animations` | `.agents/skills/review-animations/SKILL.md` | Critique motion code with structured Before/After tables. |
| `improve-animations` | `.agents/skills/improve-animations/SKILL.md` | Codebase-wide motion audit and prioritized implementation roadmap. |
| `find-animation-opportunities` | `.agents/skills/find-animation-opportunities/SKILL.md` | Identify high-value places where subtle motion improves spatial continuity. |
| `animation-performance` | `.agents/skills/animation-performance/SKILL.md` | 60/120fps compositor optimization (`transform`/`opacity`, GPU layers). |
| `animation-vocabulary` | `.agents/skills/animation-vocabulary/SKILL.md` | Glossary mapping motion descriptions to exact engineering terms. |
| `gsap-core` | `.agents/skills/gsap-core/SKILL.md` | Official GreenSock core API (`gsap.to`, `fromTo`, easing, stagger, `matchMedia`). |
| `gsap-scrolltrigger` | `.agents/skills/gsap-scrolltrigger/SKILL.md` | Scroll-linked animations, pinning, scrubbing, and batch triggers. |
| `gsap-timeline` | `.agents/skills/gsap-timeline/SKILL.md` | Sequencing, position parameters, labels, and nested timelines. |
| `gsap-react` | `.agents/skills/gsap-react/SKILL.md` | React `useGSAP()` hook, cleanup, `contextSafe`, and Next.js SSR safety. |
| `gsap-plugins` | `.agents/skills/gsap-plugins/SKILL.md` | Flip, SplitText, Draggable, Observer, ScrollSmoother, and CustomEase. |
| `gsap-performance` | `.agents/skills/gsap-performance/SKILL.md` | `quickTo`, `quickSetter`, ticker management, and memory cleanup. |
| `gsap-frameworks` | `.agents/skills/gsap-frameworks/SKILL.md` | Lifecycle integration for Vue, Nuxt, Svelte, and Astro. |
| `gsap-utils` | `.agents/skills/gsap-utils/SKILL.md` | GSAP utility methods (`clamp`, `mapRange`, `interpolate`, `snap`, `wrap`). |
| `cinematic-gsap-lenis-motion-system` | `.agents/skills/cinematic-gsap-lenis-motion-system/SKILL.md` | Combined Lenis smooth-scroll + GSAP ScrollTrigger architecture. |
| `gsap-scrolltrigger-storytelling` | `.agents/skills/gsap-scrolltrigger-storytelling/SKILL.md` | Multi-chapter scroll-scrubbed narrative choreography. |
| `motion-showreel` | `.agents/skills/motion-showreel/SKILL.md` | Interactive product showreels and motion presentations. |
| `motion` | `.agents/skills/motion/SKILL.md` | Motion for React (`motion/react`) layout animations and springs. |

---

## 4. Owl-Listener Designer Toolkit

| Skill | Location | Purpose |
|---|---|---|
| `owl-color-system` | `.agents/skills/owl-color-system/SKILL.md` | Semantic color architecture, tonal scales, and accessible contrast pairing. |
| `owl-typography-scale` | `.agents/skills/owl-typography-scale/SKILL.md` | Modular fluid type scales, line measure, and hierarchy systems. |
| `owl-spacing-system` | `.agents/skills/owl-spacing-system/SKILL.md` | Spatial grids, rhythm, and component density tokens. |
| `owl-layout-grid` | `.agents/skills/owl-layout-grid/SKILL.md` | Responsive grid systems, breakpoints, and structural alignment. |
| `owl-dark-mode-design` | `.agents/skills/owl-dark-mode-design/SKILL.md` | Elevation-aware dark mode surfaces, desaturation, and contrast tuning. |
| `owl-visual-hierarchy` | `.agents/skills/owl-visual-hierarchy/SKILL.md` | Scanning patterns, focal points, and visual weight distribution. |
| `owl-micro-interactions` | `.agents/skills/owl-micro-interactions/SKILL.md` | Specifying trigger-rules-feedback-loops for tactile UI controls. |
| `owl-interfaces-that-feel` | `.agents/skills/owl-interfaces-that-feel/SKILL.md` | Crafting responsive, tactile digital materiality. |
| `owl-design-qa-checklist` | `.agents/skills/owl-design-qa-checklist/SKILL.md` | Pre-launch design QA checklist across states, viewports, and tokens. |
| `owl-design-critique` | `.agents/skills/owl-design-critique/SKILL.md` | Structured design critique against product goals and usability principles. |
| `owl-design-principles` | `.agents/skills/owl-design-principles/SKILL.md` | Defining project-specific design principles and decision tenets. |

---

## 5. Engineering Workflow, Architecture & Alignment

| Skill | Location | Purpose |
|---|---|---|
| `ask-matt` | `.agents/skills/ask-matt/SKILL.md` | Skill router: start here when unsure which workflow skill fits the task. |
| `grill-me` | `.agents/skills/grill-me/SKILL.md` | Interactive Socratic interview to resolve product/design ambiguity before planning. |
| `to-spec` | `.agents/skills/to-spec/SKILL.md` | Crystallize a conversation or feature idea into an actionable specification. |
| `to-tickets` | `.agents/skills/to-tickets/SKILL.md` | Break an approved spec down into vertical, testable implementation steps/tickets. |
| `triage` | `.agents/skills/triage/SKILL.md` | Diagnose issues and write agent-ready implementation briefs. |
| `implement` | `.agents/skills/implement/SKILL.md` | Execute work from a spec or step plan; drives TDD and closes with code review. |
| `tdd` | `.agents/skills/tdd/SKILL.md` | Red → Green → Refactor test-driven development loop. |
| `code-review` | `.agents/skills/code-review/SKILL.md` | Two-axis diff review (Standards + Spec) between HEAD and target branch. |
| `diagnosing-bugs` | `.agents/skills/diagnosing-bugs/SKILL.md` | Structured root-cause diagnosis loop for bugs and regressions. |
| `prototype` | `.agents/skills/prototype/SKILL.md` | Build throwaway prototype code to answer a design or state-modeling question. |
| `improve-codebase-architecture` | `.agents/skills/improve-codebase-architecture/SKILL.md` | Identify and execute high-leverage module boundary improvements. |
| `domain-modeling` | `.agents/skills/domain-modeling/SKILL.md` | Model core domain entities, invariants, and state transitions cleanly. |
| `state-machine` | `.agents/skills/state-machine/SKILL.md` | Design explicit state machines for complex UI and workflow states. |
| `resolving-merge-conflicts` | `.agents/skills/resolving-merge-conflicts/SKILL.md` | Safely analyze and resolve git merge conflicts without losing intent. |
| `wayfinder` / `wait-what` | `.agents/skills/wayfinder/SKILL.md` | Re-orient when blocked, confused, or when assumptions break mid-step. |
| `handoff` | `.agents/skills/handoff/SKILL.md` | Package clean session state and context for a fresh builder conversation. |
| `performance` | `.agents/skills/performance/SKILL.md` | Web performance optimization (Core Web Vitals, bundle size, rendering speed). |
| `security-audit` | `.agents/skills/security-audit/SKILL.md` | Security review across auth, input validation, secrets, and dependencies. |
| `project-bootstrap` | `.agents/skills/project-bootstrap/SKILL.md` | Structured process for initializing a new project cloned from this starter. |

---

## How Skills Work Together

- **Starting a UI Feature or Landing Page**:
  1. Clarify intent with `grill-me` or `landing-page-design` (Part A).
  2. Query `ui-ux-pro-max` (`python .agents/skills/ui-ux-pro-max/scripts/search.py "<query>" --domain style`) and apply `design-system` (Phosphor icon weights + tokens) alongside `minimalist-ui` or `tastemaker`.
  3. Add motion using `emil-design-eng` (for micro-interactions) or `gsap-core` / `gsap-scrolltrigger` (for scroll storytelling).
  4. Verify live in the browser with `browser-verification` and score the result with `better-interface`.
  5. Capture product screenshots and update `README.md`.
