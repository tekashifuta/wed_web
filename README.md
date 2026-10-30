# Rose Mae & Daryl — Wedding Invitation

A single-page, cinematic wedding invitation built with [Jaspr](https://jaspr.site)
(the Dart web framework) and rendered as a static site — modelled on the
[Ceremo *Romantic*](https://www.useceremo.com/demo/romantic) template.

## ✨ Overview

The site is one scrolling invitation served at the root `/`. It opens with a
full-screen "envelope" cover, then reveals 16 sections:

| # | Section | What it shows |
|:-:|:--------|:--------------|
| 0 | **Cover** | Envelope card, monogram, "Tap to open" / "Skip" |
| 1 | **Hero** | Couple's names, date, church & venue + a **live countdown** |
| 2 | **Intro** | Celebratory one-liner |
| 3 | **Our Story** | Portrait + three numbered milestones |
| 4 | **Our prenup film** | Poster with a play button (optional video URL) |
| 5 | **A note on gifts** | GCash / bank tabs with copy-to-clipboard |
| 6 | **Where** | Ceremony & reception cards with Get Directions links |
| 7 | **The Day** | Order-of-events timeline |
| 8 | **The Entourage** | Wedding-party groups |
| 9 | **The Printed Invitation** | Dress code, colour palette, attire guide |
| 10 | **Good to know** | FAQ accordion |
| 11 | **A few reminders** | Day-of notes |
| 12 | **RSVP** | Per-guest accept/decline + completion counter |
| 13 | **On the day** | Find your seat / Share photos |
| 14 | **Photos** | Guest photo wall |
| 15 | **Footer** | "With love, Rose & Daryl" + links |

A slim sticky nav bar with anchor links tracks the section you are reading.

## 🌹 Editing the content

Everything editable lives in a single file:

| What | Where |
| ---- | ----- |
| **All text** (names, date, venues, story, entourage, gifts, dress code, FAQ, reminders, RSVP guests, gallery, footer) | `lib/constants/wedding_data.dart` |
| **Countdown target** | `weddingDateTimeIso` in `lib/constants/wedding_data.dart` |
| **Colors & fonts** | `lib/constants/theme.dart` |
| **Nav bar links** | `NavBar.links` in `lib/components/invitation/nav_bar.dart` |
| **Layout of a single section** | the matching file in `lib/components/invitation/` |
| **Client behaviour** (countdown, cover, FAQ, tabs, copy, RSVP) | `_interactionsJs` in `lib/pages/invitation.dart` |

Edit `wedding_data.dart` to change the couple's names, date, venues, photos and
every other string — no other file needs to change.

## 🚀 Running locally

```bash
jaspr serve
```

The development server is available at `http://localhost:8080`.
Hot reload is enabled, so edits refresh automatically.

## 📦 Building

```bash
jaspr build
```

The static output is written to `build/jaspr/`. There's no need to run
`build_runner` separately — `jaspr build` invokes the Jaspr builders itself.

## 🌍 Deploying to GitHub Pages

A GitHub Actions workflow (`.github/workflows/deploy.yml`) builds the site and
deploys `build/jaspr/` to GitHub Pages.

- Enable Pages at **Settings → Pages → Source → "GitHub Actions"** (or the workflow
  can auto-enable it with the `enablement: true` flag on `configure-pages`).
- Because the site is deployed from a project repo (`wed_web`), the `<base>` href is
  set to `/wed_web/` in `lib/main.server.dart` so all assets and links resolve correctly
  at `https://<username>.github.io/wed_web/`.

## 🎞️ How the client-side bits work

There is no JS build step: two inline `<script>` tags emitted by
`lib/pages/invitation.dart` drive all interactivity.

1. **`scroll-observer`** — an `IntersectionObserver` that adds `.in-view` to every
   `[data-scroll]` element. Reveals are *fail-safe*: the base CSS keeps elements
   visible and only the `.in-view` rule plays a `@keyframes` animation, so content is
   never stuck hidden (no JS, or a hydration pass that drops the class).
2. **`invite-interactions`** — one delegated click handler plus a 1-second timer:
   - opens the cover (adds `html.cover-open`, releases `body.no-scroll`)
   - runs the live countdown (`#cd-days`, `#cd-hours`, `#cd-mins`, `#cd-secs`)
   - gift tabs (`data-gift-tab` / `data-gift-panel`) and copy-to-clipboard (`data-copy`)
   - FAQ accordions (`data-accordion`)
   - RSVP choices (`data-choice`) + the "x of y complete" counter
   - nav scroll-spy (adds `.active` to the matching link)

## 🧠 Developer notes: Jaspr quirks we hit

A running list of non-obvious Jaspr API behaviours worth knowing when editing the styles
or components in this project:

- **Unit literals need a dot** — `7rem` / `1.5rem` are *syntax errors* (`rem` parses as a
  separate identifier). Always write `7.rem`, `1.5.rem`, `0.85.rem`.
- **`Gap` is not const-safe** — `Gap.all(...)`, `Gap.column(...)`, etc. built from
  extension unit getters (`1.rem`, `.zero`) are _not_ const-constructible, so don't
  prefix them with `const`.
- **Enum/getter naming differs from Flutter** — e.g. `.uppercase` is `.upperCase`,
  `AlignItems.flexStart` is `.start`, `WhiteSpace.nowrap` is `.noWrap`.
- **Background image API** — `BackgroundImage.image(...)` doesn't exist; use
  `ImageStyle.url(...)` for CSS `background-image`.
- **Negative units** — unary minus on a `Unit` is unsupported; use `Unit.pixels(-7)` /
  `Unit.rem(-0.3)`.
- **`<a target>` takes the `Target` enum** — `target: Target.blank`, not `'_blank'`.
- **No `borderColor`** — set the whole border: `border: Border.all(color: c, width: 1.px)`.
- **No typed `object-fit` / `resize`** — pass raw CSS through the `raw: {...}` map.
- **`animation-iteration-count: infinite`** can't be expressed — use a large
  `Animation(count: 100)`.
- **All styles are global** — component `@css` rules are not scoped, so prefix every
  class with its section name (`story-`, `gifts-`, `rsvp-`, …).
- **Global `<section>` styling leaks** — the global `app.dart` rule forces flex/center on
  every `<section>` inside `.main`, which is why invitation sub-sections use `<div>`
  instead of `<section>`.
- **Form `placeholder`** is not a constructor parameter — set it via the `attributes`
  map on the element.

