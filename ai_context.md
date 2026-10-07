<!-- Animated Header Banner -->
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=200&section=header&text=wed_web&fontSize=70&fontAlignY=35&animation=fadeIn&fontColor=fff&desc=AI%20Context%20Document&descAlignY=65&descSize=18&descFont=Arial" width="100%" />
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Playfair+Display&weight=600&size=22&duration=3000&pause=1000&color=A78BFA&center=true&vCenter=true&width=700&lines=A+beautiful+garden+wedding+invitation;Built+with+Jaspr+%E2%80%94+the+Dart+web+framework;Static+site+deployed+on+GitHub+Pages;Designed+with+%F0%9F%8C%BF+love+and+Sage+Green+palettes" alt="Typing SVG" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Jaspr-0.23.3-6366f1?style=for-the-badge&logo=dart" />
  <img src="https://img.shields.io/badge/Dart-3.10+-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Static_Site-fff8f6?style=for-the-badge&logo=vercel&logoColor=black" />
  <img src="https://img.shields.io/badge/GitHub_Pages-4d644e?style=for-the-badge&logo=github&logoColor=white" />
</p>

---

<br />

## <img src="https://cdn-icons-png.flaticon.com/128/3062/3062634.png" width="28" align="center" /> &nbsp; Overview

> [!TIP]
> **This document is an AI context file.** It gives AI coding assistants (and human developers)
> a complete mental model of the project — architecture, file responsibilities, design tokens,
> conventions, and known quirks — so they can contribute effectively without exploring the codebase first.

**`wed_web`** is a **single-page garden-wedding invitation** for *Rose Mae & Daryl*, built with
[Jaspr](https://jaspr.site) — the Dart web framework — and served as a static site.

The invitation is a vertical scrolling experience with **8 distinct sections**:

<p align="center">

```mermaid
flowchart TD
    A["🏔️ Hero — Names, date, background photo"] --> B["💌 Our Story — Love story + couple photo"]
    B --> C["📍 Details — Ceremony & Reception cards"]
    C --> D["🕐 Schedule — Day-of timeline"]
    D --> E["📸 Gallery — Responsive photo grid"]
    E --> F["✉️ RSVP — Guest response form"]
    F --> G["🦶 Footer — Names, hashtag, contact"]

    style A fill:#4d644e,stroke:#8fa88e,color:#fff
    style B fill:#8fa88e,stroke:#b4cdb2,color:#201a18
    style C fill:#f6d9d9,stroke:#dcc0c0,color:#201a18
    style D fill:#fff8f6,stroke:#c3c8bf,color:#201a18
    style E fill:#ffffff,stroke:#c3c8bf,color:#201a18
    style F fill:#4d644e,stroke:#273d29,color:#fff
    style G fill:#fef1ec,stroke:#c3c8bf,color:#201a18
```

</p>

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/1055/1055645.png" width="28" align="center" /> &nbsp; Architecture

<p align="center">

```mermaid
graph LR
    subgraph SERVER["🖥️ Server (Pre-rendering)"]
        A["main.server.dart"] --> B["app.dart"]
        B --> C["Router → /"]
    end

    subgraph CLIENT["📱 Client (Hydration)"]
        D["main.client.dart"] --> E["ClientApp"]
        E --> F["@client Components"]
    end

    subgraph STATIC["📦 Static Output"]
        C --> G["build/jaspr/"]
        F --> G
        G --> H["GitHub Pages"]
    end

    style SERVER fill:#1e293b,stroke:#6366f1,color:#e2e8f0
    style CLIENT fill:#1e293b,stroke:#a78bfa,color:#e2e8f0
    style STATIC fill:#1e293b,stroke:#f472b6,color:#e2e8f0
```

</p>

### How Jaspr works here

| Phase | What happens | File |
|:------|:-------------|:-----|
| **Pre-render** | Server renders the HTML for SEO & fast first paint | `lib/main.server.dart` |
| **Hydration** | Client JS takes over `@client` components for interactivity | `lib/main.client.dart` |
| **Build** | `jaspr build` produces a fully static `build/jaspr/` directory | — |

> [!IMPORTANT]
> The `<base>` href is set to `/wed_web/` in `main.server.dart` because the site deploys to
> `https://<username>.github.io/wed_web/`. Change to `/` if deploying from the root repo.

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/6847/6847003.png" width="28" align="center" /> &nbsp; Tech Stack

<p align="center">

| Technology | Version | Role |
|:-----------|:--------|:-----|
| **Dart** | `^3.10.0` | Language |
| **Jaspr** | `^0.23.3` | Web framework (Flutter-like API for the web) |
| **jaspr_router** | `^0.9.0` | Client-side routing |
| **jaspr_builder** | `^0.23.3` | Code generation for `@css` and `@client` |
| **build_runner** | `^2.10.0` | Build system orchestrator |
| **build_web_compilers** | `^4.8.0` | Dart-to-JS compilation |
| **jaspr_lints** | `^0.7.2` | Jaspr-specific lint rules |
| **GitHub Actions** | — | CI/CD → GitHub Pages |

</p>

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/2693/2693265.png" width="28" align="center" /> &nbsp; File Map

> [!NOTE]
> **Everything editable lives in just 2 files.** Change `wedding_data.dart` for content and `theme.dart` for styling.

```
wed_web/
├── lib/
│   ├── app.dart                          ← App root + Router config
│   ├── main.server.dart                  ← Server entrypoint (pre-rendering)
│   ├── main.client.dart                  ← Client entrypoint (hydration)
│   │
│   ├── constants/
│   │   ├── 📝 wedding_data.dart          ← ALL editable text/content ⭐
│   │   └── 🎨 theme.dart                 ← ALL colors, fonts, shadows ⭐
│   │
│   ├── pages/
│   │   └── invitation.dart               ← Page layout (assembles all sections)
│   │
│   └── components/
│       ├── header.dart                   ← (Legacy nav, not used in invitation)
│       └── invitation/
│           ├── nav_bar.dart              ← Fixed glassmorphic top bar
│           ├── hero_section.dart         ← Full-bleed hero with couple names
│           ├── story_section.dart        ← "Our Story" with photo + text
│           ├── details_section.dart      ← Ceremony & Reception cards
│           ├── schedule_section.dart     ← Day-of timeline
│           ├── gallery_section.dart      ← Responsive photo grid
│           ├── rsvp_section.dart         ← Guest response form
│           └── footer_section.dart       ← Footer with monogram + links
│
├── web/images/                           ← Static image assets
├── .github/workflows/deploy.yml          ← GitHub Pages CI/CD
├── pubspec.yaml                          ← Dart dependencies
├── analysis_options.yaml                 ← Linter & formatter config
├── README.md                             ← Project README
└── ai_context.md                         ← 🤖 This file!
```

### Quick Reference: "I want to change…"

| What you want to change | Edit this file |
|:------------------------|:---------------|
| Couple's names, date, venue | `lib/constants/wedding_data.dart` |
| Story paragraphs | `lib/constants/wedding_data.dart` |
| Schedule items | `lib/constants/wedding_data.dart` |
| Gallery photos (URLs) | `lib/constants/wedding_data.dart` |
| RSVP deadline | `lib/constants/wedding_data.dart` |
| Colors & fonts | `lib/constants/theme.dart` |
| Hero section layout | `lib/components/invitation/hero_section.dart` |
| Any other section layout | `lib/components/invitation/<section>_section.dart` |
| Routing | `lib/app.dart` |
| Deployment base path | `lib/main.server.dart` |

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/7050/7050927.png" width="28" align="center" /> &nbsp; Design System — "Garden Ethereal"

<p align="center">
  <img src="https://img.shields.io/badge/Heading_Font-Playfair%20Display-4d644e?style=flat-square" />
  <img src="https://img.shields.io/badge/Body_Font-Manrope-6f5959?style=flat-square" />
</p>

### 🎨 Color Palette

```
┌──────────────────────────────────────────────────────────────────────┐
│  PRIMARY — Sage Green                    SECONDARY — Blush           │
│                                                                      │
│  #4d644e  ████████  primaryColor          #6f5959  ████████          │
│  #8fa88e  ████████  primaryContainer      #f6d9d9  ████████          │
│  #b4cdb2  ████████  primaryFixedDim       #dcc0c0  ████████          │
│  #273d29  ████████  onPrimaryContainer    #735d5e  ████████          │
│                                                                      │
│  SURFACES — Warm Paper                   NEUTRALS                    │
│                                                                      │
│  #fff8f6  ████████  surface               #201a18  ████████  ink     │
│  #f8ebe7  ████████  surfaceContainer      #434842  ████████          │
│  #fef1ec  ████████  surfaceContainerLow   #737971  ████████          │
│  #f3e5e1  ████████  surfaceContainerHigh  #c3c8bf  ████████          │
│  #362f2c  ████████  inverseSurface        #fbeee9  ████████          │
└──────────────────────────────────────────────────────────────────────┘
```

### 🔤 Typography

| Role | Font Family | Weight | Usage |
|:-----|:------------|:-------|:------|
| **Headlines** | Playfair Display | 400–900 | Hero title, section titles, dates |
| **Body / Labels** | Manrope | 300–800 | Paragraphs, nav, buttons, kickers |

### 🌫️ Elevation

| Name | Shadow | Usage |
|:-----|:-------|:------|
| `ambientShadow` | `0px 12px 40px rgba(32,26,24,0.08)` | Nav bar, detail cards |

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/4617/4617502.png" width="28" align="center" /> &nbsp; Getting Started

### 🚀 Run locally

```bash
jaspr serve
```
> Development server at `http://localhost:8080` with hot reload.

### 📦 Build for production

```bash
jaspr build
```
> Static output → `build/jaspr/`

### 🌍 Deploy

Pushing to `main` triggers `.github/workflows/deploy.yml` which builds and deploys to **GitHub Pages**.

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/2092/2092087.png" width="28" align="center" /> &nbsp; Developer Notes — Jaspr Quirks

> [!WARNING]
> These are **non-obvious Jaspr API behaviors** that have bitten us before. Read these before editing styles or components!

| # | Quirk | What to do |
|:--|:------|:-----------|
| 1 | **`Gap` is not const-safe** — `Gap.all(...)`, `Gap.column(...)` built from extension getters (`1.rem`, `.zero`) are *not* const-constructible | ❌ Don't prefix with `const` |
| 2 | **Enum/getter naming differs from Flutter** — e.g. `.uppercase` → `.upperCase`, `AlignItems.flexStart` → `.start` | ✅ Use Jaspr-specific names |
| 3 | **No `BackgroundImage.image(...)`** — use `ImageStyle.url(...)` for CSS `background-image` | ✅ Use `ImageStyle.url(url)` |
| 4 | **Negative units** — unary minus on a `Unit` is unsupported | ✅ Use `Unit.pixels(-7)` / `Unit.rem(-0.3)` |
| 5 | **No typed `object-fit` / `resize`** — not in Jaspr's typed styles API | ✅ Pass via `raw: {'object-fit': 'cover'}` |
| 6 | **Global `<section>` styling leaks** — `app.dart` forces flex/center on every `<section>` inside `.main` | ✅ Use `<div>` for invitation sub-sections |
| 7 | **Form `placeholder`** — not a constructor parameter on `<input>` | ✅ Set via `attributes` map: `{'placeholder': '...'}` |

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/1828/1828843.png" width="28" align="center" /> &nbsp; Component Architecture

```
┌──────────────────────────────────────────────────────────┐
│                      app.dart                             │
│              Router → path: '/' → Invitation              │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  ┌─ Invitation (@client) ─────────────────────────────┐  │
│  │                                                     │  │
│  │  ┌─────────────┐  ┌──────────────┐  ┌───────────┐  │  │
│  │  │   NavBar     │  │ HeroSection  │  │  Story    │  │  │
│  │  │  (fixed)     │  │  (full-bleed)│  │  Section  │  │  │
│  │  └─────────────┘  └──────────────┘  └───────────┘  │  │
│  │                                                     │  │
│  │  ┌─────────────┐  ┌──────────────┐  ┌───────────┐  │  │
│  │  │  Details    │  │  Schedule    │  │  Gallery  │  │  │
│  │  │  Section    │  │  Section     │  │  Section  │  │  │
│  │  └─────────────┘  └──────────────┘  └───────────┘  │  │
│  │                                                     │  │
│  │  ┌─────────────┐  ┌──────────────┐                 │  │
│  │  │   RSVP      │  │   Footer     │                 │  │
│  │  │  Section    │  │   Section    │                 │  │
│  │  └─────────────┘  └──────────────┘                 │  │
│  │                                                     │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                          │
│  Data sources:                                           │
│    ├── wedding_data.dart  → all text, names, dates, URLs │
│    └── theme.dart         → colors, fonts, shadows       │
└──────────────────────────────────────────────────────────┘
```

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/726/726623.png" width="28" align="center" /> &nbsp; Conventions

### CSS-in-Dart with `@css`

Every component declares its styles using the `@css` annotation. Jaspr's code-gen compiles these to real CSS at build time.

```dart
@css
static List<StyleRule> get styles => [
  css('.my-class', [
    css('&').styles(
      display: .flex,
      fontFamily: headingFont,    // from theme.dart
      color: primaryColor,        // from theme.dart
    ),
    css('&:hover').styles(opacity: 0.85),
  ]),
  // Responsive
  css.media(MediaQuery.screen(maxWidth: 700.px), [
    css('.my-class').styles(fontSize: 2.rem),
  ]),
];
```

### Responsive Breakpoints

| Breakpoint | What changes |
|:-----------|:-------------|
| `≤ 700px` | Major layout shifts (column instead of row, hero reorder) |
| `≤ 600px` | Padding reduction, grid column count changes |

### Shared CSS Classes

| Class | Defined in | Purpose |
|:------|:-----------|:--------|
| `.section-kicker` | `invitation.dart` | Small uppercase label above section titles |
| `.section-title` | `invitation.dart` | Large serif section heading |
| `.section-kicker.light` | `invitation.dart` | Light variant (on dark backgrounds) |
| `.section-title.light` | `invitation.dart` | Light variant (on dark backgrounds) |

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/5542/5542423.png" width="28" align="center" /> &nbsp; Deployment Pipeline

<p align="center">

```mermaid
sequenceDiagram
    participant Dev as 👩‍💻 Developer
    participant GH as 🐙 GitHub
    participant CI as ⚙️ GitHub Actions
    participant Pages as 🌍 GitHub Pages

    Dev->>GH: Push to main
    GH->>CI: Trigger deploy.yml
    CI->>CI: Checkout + dart pub get
    CI->>CI: jaspr build
    CI->>CI: Upload build/jaspr/
    CI->>Pages: Deploy artifact
    Pages-->>Dev: 🎉 Live at username.github.io/wed_web/
```

</p>

<br />

---

## <img src="https://cdn-icons-png.flaticon.com/128/3033/3033146.png" width="28" align="center" /> &nbsp; AI Assistant Guidelines

> [!IMPORTANT]
> If you are an AI coding assistant working on this project, please follow these rules:

### ✅ DO

- **Always check `wedding_data.dart` and `theme.dart` first** — 90% of content/style changes happen here
- **Use existing color tokens** from `theme.dart` — don't introduce new hardcoded colors
- **Follow Jaspr's typed CSS API** — use `css('.class').styles(...)` not raw CSS strings
- **Use `<div>` for invitation sections** — global `<section>` styles in `app.dart` will break layouts
- **Test at mobile widths** (`≤ 700px`) — every section has responsive overrides
- **Preserve the `@client` annotation** on `Invitation` — removing it breaks client hydration

### ❌ DON'T

- **Don't run `build_runner` separately** — `jaspr build` invokes it automatically
- **Don't prefix `Gap` constructors with `const`** — they aren't const-safe
- **Don't use `BackgroundImage.image()`** — use `ImageStyle.url()` instead
- **Don't use unary minus on `Unit`** — use `Unit.pixels(-N)` instead of `-N.px`
- **Don't set `placeholder` as a constructor param** on form inputs — use `attributes` map

<br />

---

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=100&section=footer&animation=fadeIn" width="100%" />
</p>

<p align="center">
  <i>Made with 🌿 for Rose & Daryl's Garden Wedding</i>
</p>

<p align="center">
  <a href="https://github.com/tekashifuta/wed_web">
    <img src="https://img.shields.io/badge/View_on_GitHub-wed__web-4d644e?style=for-the-badge&logo=github&logoColor=white" />
  </a>
</p>

