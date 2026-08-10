# Rose Mae & Daryl — Garden Wedding Invitation

A beautiful, single-page garden-wedding invitation built with [Jaspr](https://jaspr.site)
(the Dart web framework), rendered as a static site.

## ✨ Overview

The site is a single scrolling invitation page served at the root `/`. It includes:

- **Hero** — the couple's names, wedding date, tagline, and background photo
- **Intro** — a short love-story quote
- **Our Story** — a year-by-year timeline of the couple's journey
- **Event Details** — ceremony & reception cards (time, venue, address)
- **Schedule** — the day-of order of events
- **Gallery** — a responsive photo grid
- **RSVP** — a guest response form (name, email, attending, guests, message)
- **Footer** — names, hashtag, and contact email

## 🌿 Editing the content

Everything editable lives in a single file:

| What                                                                       | Where                                             |
| -------------------------------------------------------------------------- | ------------------------------------------------- |
| **All text** (names, date, venue, story, schedule, gallery, RSVP, contact) | `lib/constants/wedding_data.dart`                 |
| **Colors & fonts** (garden theme)                                          | `lib/constants/theme.dart`                        |
| **Layout of a single section**                                             | the matching file in `lib/components/invitation/` |

Edit `wedding_data.dart` to change the couple's names, date, venue, photos, and all
RSVP text — no other file needs to change.

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

## 🧠 Developer notes: Jaspr quirks we hit

A running list of non-obvious Jaspr API behaviors worth knowing when editing the styles
or components in this project:

- **`Gap` is not const-safe** — `Gap.all(...)`, `Gap.column(...)`, etc. built from
  extension unit getters (`1.rem`, `.zero`) are _not_ const-constructible, so don't
  prefix them with `const`.
- **Enum/getter naming differs from Flutter** — e.g. `.uppercase` is `.upperCase`,
  `AlignItems.flexStart` is `.start`.
- **Background image API** — `BackgroundImage.image(...)` doesn't exist; use
  `ImageStyle.url(...)` for CSS `background-image`.
- **Negative units** — unary minus on a `Unit` is unsupported; use `Unit.pixels(-7)` /
  `Unit.rem(-0.3)`.
- **No typed `object-fit` / `resize`** — these aren't real properties in Jaspr's typed
  styles API; pass raw CSS through the `raw: {...}` map.
- **Global `<section>` styling leaks** — the global `app.dart` rule forces flex/center on
  every `<section>` inside `.main`, which is why invitation sub-sections use `<div>`
  instead of `<section>`.
- **Form `placeholder`** is not a constructor parameter — set it via the `attributes`
  map on the element.
