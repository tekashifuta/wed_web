# Reverse-Engineering Report — Ceremo "Romantic" Demo

**Target:** `https://www.useceremo.com/demo/romantic`
**Requested method:** `reverse-engineer-anything` (REA) skill
**Date:** 2026-10-31
**Local comparison baseline:** this repository (`wed_web`) — Jaspr static reimplementation

---

## 0. Method status — read this first

| Item | Status |
| --- | --- |
| REA MCP server (`open_binary`, `list_browser_targets`, `inspect_web_network_capture`, …) | **Not registered in this session.** No REA tool was in the active tool list, so **no REA Evidence ID exists for this report.** |
| `rea` CLI on `PATH` | Not installed (`rea: NOT FOUND`) |
| `rea-agents` npm package reachable | Yes — `6.8.0`, bin `rea` → `scripts/rea.mjs` |
| Target route under REA rules | Browser page → `list_browser_targets` (user-owned open browser). Unavailable here: target is third-party and no browser-control tool is connected. |

Per the skill's own rule — *"Do not substitute another target. Label observations from ordinary shell tools as such"* — everything below is **ordinary-tool static analysis** (`Invoke-WebRequest`, regex extraction over the retrieved bytes, and a `read_files` pass over the local repo). It is real byte-level evidence from the shipped artifact, but it is **not** REA Evidence and it is **not** runtime observation.

**To close with REA later**, from this repo root:

```powershell
npx.cmd -y rea-agents@6.4.0 doctor --client cline --json   # inspect registration
# then register the MCP server for Cline, restart the client, and confirm the
# tools actually appear before retrying list_browser_targets / inspect_web_network_capture
```

---

## 1. Evidence ledger

| ID | Observation (ordinary tools) | Type |
| --- | --- | --- |
| **E1** | `GET /demo/romantic` → `200`, `text/html; charset=utf-8`, **240,483 bytes**. Contains fully server-rendered content (real headings and body copy, not an empty SPA shell). | observed |
| **E2** | Head carries `<meta name="app-version" content="6.94.0">` and `<meta name="build-sha" content="dev">`. | observed |
| **E3** | 29 `<script src="/_next/static/chunks/…js">` + 1 stylesheet `/_next/static/chunks/2vbrs0klhsxe2.css` (**549,916 bytes**). Chunk names are Turbopack-style (`turbopack-04iyrzdt9b2ok.js`, `2h_2radcn2xeb.js`). | observed |
| **E4** | 4 large inline flight-payload scripts (38,319 / 26,229 B) + tiny bootstrap scripts. RSC streaming boundary cleanup (`$RC("B:0","S:0")`) present. | observed |
| **E5** | Flight payload registers three client components: `DocumentTemplateRenderer`, `HashScrollHandler`, `DemoSampleDock` (props `{templateId:"romantic", coupleNames:"Jarn & Zhaira", aboutHref:"/templates/romantic"}`). | observed |
| **E6** | Rendering is **not** stylistic per page: it is a **generic document renderer**. Contract markers on DOM nodes: `data-template="romantic"`, `data-template-contract`, `data-contract-role`, `data-contract-element`, `data-studio-region`, `data-studio-region-root`, `data-studio-section`, `data-invitation-chrome`, `data-top-nav`, `data-opening-cover="sealed"`, `data-scroll-anchor`, `data-rsvp-state="responding"`, `data-section-card`, `data-section-border-mark`, `data-photo-frame`, `data-fan-panel`, `data-card-line`, `data-active`, `data-state`. | observed |
| **E7** | Anchor/section ids present: `invitation-shell`, `video`, `giftGuide`, `locations`, `timeline`, `entourage`, `printedInvitation`, `guestEssentials`, `rsvp`, `extras`. `data-scroll-anchor` values in order: `timeline`, `entourage`, `guestEssentials`, `rsvp`, `extras`. | observed |
| **E8** | Full heading IA recovered in document order (see §3). | observed |
| **E9** | Theme is **inline CSS custom properties of bare HSL triplets** on rendered nodes, e.g. `style="--background:40 33% 98%;--foreground:30 10% 33%;…"` — generated per template, not from the stylesheet. 27 distinct tokens. | observed |
| **E10** | Styling at section level is **inline React style objects + Tailwind utility classes** (no per-section CSS classes). Utilities use Tailwind v4 **container variants** `@md:`/`@lg:` (not `md:`/`lg:`), plus `animate-in`/`slide-in-from-*`/`fade-in` (tailwindcss-animate) and a `--device-vh` custom property. Icons are `lucide-react`. | observed |
| **E11** | Fonts are **self-hosted** `@font-face` (7 × `.woff2`, `../media/…`), no Google Fonts request from the page. Cormorant Garamond 300–700 normal + italic is the font actually referenced by the romantic token set. | observed |
| **E12** | `--font-heading` **and** `--font-body` (and `--invitation-heading` / `--invitation-body`) resolve to the **same** stack: `'Cormorant Garamond', 'EB Garamond', Georgia, serif`. | observed |
| **E13** | Wax-seal tokens: `--seal-wax:#C9A227`, `--seal-ink-pair:#000000`. Opening-cover keyframes exist alongside a ribbon/seal family (`ceremoRibbonLeftLoop`, `ceremoRibbonKnotRelease`, `ceremoOpening*`). | observed |
| **E14** | Media: hero preload `https://images.unsplash.com/photo-1670529776180-60e4132ab90c?auto=format&fit=crop&w=1600&q=80`; prenup film poster `https://i.ytimg.com/vi/aqz-KE-bpKQ/hqdefault.jpg`; OG image `/slides-ui/tpl-romantic.webp`. | observed |
| **E15** | Third-party: GA4 `G-BJ30M2C77Y`, Facebook `fb:app_id 1907644333259622`, `facebook-domain-verification`, JSON-LD `BreadcrumbList`. | observed |
| **E16** | Full content **schema** recovered from the flight payload (~350 distinct keys) — see §2. Payload values themselves are the demo's sample data (`Jarn & Zhaira`). | observed |
| **E17** | Local `wed_web` uses **Jost** for body text, **Great Vibes** for sign-offs, and a gold/sage/rose token set with primary `#8a6b40`. | observed (local repo) |

---

## 2. The template contract (content schema) — E5, E6, E16

The demo is **one JSON document rendered by one generic React renderer**. The field names below came straight out of the server payload, so they are the closest thing to a published API of the template.

### 2.1 Document envelope

```jsonc
{
  "document": { "templateId": "romantic", "templateSettings": {…}, "templateOptions": {…},
                "templateStyles": "…", "templateScripts": "…",
                "layout": {…}, "sections": [...], "navigation": {…}, "footer": {…} },
  "invitation": { "slug", "initialRsvpData", "rsvpResponse", "hasResponded", "editMode" },
  "version": "..."
}
```

`templateStyles` / `templateScripts` / `calendar` / `tokens` / `design` / `layout` / `placements` / `density` / `variant` / `displayMode` / `showcaseMode` / `displayStyle` explain how **20+ templates share one renderer**: per-template escape hatches sit next to the shared structural props.

### 2.2 Section components and their props

| Section id | Props observed in payload |
| --- | --- |
| `hero` | `heroLayout`, `heroArch`, `kenBurns`, `romanticOverlay`, `glassOverlay`, `filmGrain`, `monogram`, `waxSeal`, `sealStyle`, `openingAnimation`, `titleCard`, `slideshow`, `countdown`, `hideSeconds`, `partner1Name`, `partner2Name`, `showNames`, `showDate`, `welcome` |
| `story` | `story[] { heading, description, image, alt, order }`, `breakBefore`, `sectionTitle` |
| `video` | `videoUrl`, `embedUrl`, `autoplayOnOpen`, `autoPlay`, `loop`, `volume`, `playerMode`, `videoSize`, `showTrackName`, `ourSong`, `curatedTrackId` |
| `giftGuide` | `methods[] { type, label, accountName, accountNumber, note }`, `description`, `enabled` |
| `locations` | `ceremonyVenue`, `ceremonyVenueAddress`, `ceremonyVenueLat/Lng`, `receptionVenue`, `receptionVenueAddress`, `receptionVenueLat/Lng`, `showCeremony`, `showReception`, `location` |
| `timeline` | `items[] { time, title, location, description }`, `sectionTitle` |
| `entourage` | `roles[] { roleName, members[] { name, photo, alt } }`, `nameColumns`, `pairSeparator`, `paired`, `isUnnamed` |
| `printedInvitation` | `dressCode`, `colorPalette[] { name, hex }`, `attireGuide { ladies, gentlemen }`, `description` |
| `guestEssentials` | `faqs[] { question, answer }`, `reminders[] { heading, description }` |
| `rsvp` | `guests[] { name, guestGroup, maxGuests, plusOneLimit, isPrimary }`, `rsvpDeadline`, `rsvpLocked`, `allowPlusOneDefault`, `allowSkip`, `excludeChildrenFromSeatCount`, `customQuestions[]`, `questionAssignments`, `autoScrollToRsvp`, `initialRsvpData`, `token` |
| `extras` | `seatFinderUrl`, `seatFinderLabel`, `showSeatFinderLink`, `photoShareUrl`, `photoShareLabel`, `showPhotoShareLink`, `showUploader`, `galleryVisibleCount`, `hasGallery`, `enableCouplesTable`, `lockTables`, `seating`, `photos[]` |
| shell / chrome | `navigation`, `footer`, `footerSignOff`, `coupleSignOff`, `monogram`, `showCeremoBrand`, `showCeremoAttribution`, `design`, `background` |

**Inference (high confidence):** the renderer walks `sections[]`, resolves each entry to a component in a registry keyed by section id, and passes that section's props through. That explains why anchor ids are camelCase prop names (`giftGuide`, `printedInvitation`) instead of hand-written slugs, and why the `data-studio-section` / `data-contract-role` markers exist — they are the visual editor's selection handles.

---

## 3. Information architecture — E8

Rendered order, with the exact heading levels the origin uses:

1. **Opening cover** — sealed envelope, monogram `JZ`, "Tap to open", skip affordance
2. **Hero** — `H1 "Jarn & Zhaira Wedding Invitation"` ×2 (duplicate for the sticky/mobile variant), date, both venues, countdown (`106 Days / 7 Hours / 50 Mins` — **no seconds**)
3. **Intro** — celebratory one-liner
4. **Our Story** — `H2` + `H3` per milestone ("How we met", "The years between", "The proposal")
5. **Our prenup film** — `H2`, YouTube poster + play
6. **A note on gifts** — `H2`, `H3 GCash`, `H3 Bank transfer`, copy-to-clipboard
7. **Event Details** — `H2`, `H3` per venue, "Get Directions"
8. **Order of Events** — `H2`, `H3` ×5 (Guest Arrival, Ceremony, Cocktail Hour, Reception Program, First Dance)
9. **The Entourage** — `H2`, `H3` per role; "Principal Sponsors" is `paired` ("Ana Maria Delgado & Ramon Delgado")
10. **The Printed Invitation** — `H2`, then `H3` The Printed Invitation / Dress Code / Color Palette / Attire Guide, `H4` Ladies & Gentlemen; **Good to know** (`H3` + `H4` per FAQ) and **A few reminders** (`H3` + `H4` ×3) are nested in the same block
11. **Will you join us?** — `H2`, `H3` per guest ("Will X and Y be joining us?"), accept/decline per guest, message box, live "0 of 2 complete" progress
12. **On the day** — Find my seat / Share photos
13. **Footer** — "With love," sign-off + Ceremo attribution (Privacy / Terms / Samples / About)

Top-nav labels: **Where · The Day · Entourage · Details · RSVP · Your Seat · Photos**.

> Two IA differences worth internalising: the origin **merges** Printed-Invitation + FAQ + Reminders into one continuous block, and it has **no dedicated gallery section** in the flow — photos live in `extras` as a share link plus an uploader.

---

## 4. Design tokens — E9

The origin ships theme values as **bare HSL triplets** consumed as `hsl(var(--token))`, which is what makes light/dark and per-template re-theming cheap. The Romantic set (the hex column is a **derived calculation, not a shipped value**):

| Token | HSL triplet | ≈ hex (derived) |
| --- | --- | --- |
| `--background` / `--surface-1` | `40 33% 98%` | `#FCFAF8` |
| `--surface-2` | `40 25% 96%` | `#F7F6F2` |
| `--muted` / `--secondary` | `40 18% 94%` | `#F2F1ED` |
| `--border` / `--border-subtle` | `30 10% 85%` | `#DDD9D5` |
| `--accent` / `--accent-2` | `30 15% 85%` | `#DFD9D3` |
| `--muted-foreground` | `30 8% 43%` | `#6F6E6C` |
| `--foreground` / `--primary` / `--text-heading` / `--text-body` / `--accent-1` / `--link` / `--ring` / `--surface-inverse` | `30 10% 33%` | `#5D544C` |
| `--text-inverse` / `--accent-1-text` | `40 33% 98%` | `#FCFAF8` |
| `--overlay-bg` | `0 0% 100%` | `#FFFFFF` |
| `--seal-wax` | hex literal | `#C9A227` |
| `--seal-ink-pair` | hex literal | `#000000` |

**Key finding — the *theme* is warm monochrome.** `primary`, `foreground`, `text-heading`, `accent-1`, `link` and `ring` are all the **same charcoal-taupe**; `accent`/`accent-2` are hairline warm greys; `surface-inverse` is the same taupe (not near-black). The only saturated colour in the *token set* is the gold wax seal `#C9A227`.

**Scope correction (verified later from the RSC payload):** the *content* is richer than the theme. The demo's `guestEssentials.colorPalette` ships a five-swatch dress-code range that **does** include champagne, gold and sage:

```json
[{"hex":"#F7F1EA","name":"Paper"},{"hex":"#E7D9C6","name":"Champagne"},
 {"hex":"#C9A227","name":"Antique gold"},{"hex":"#7C8A6B","name":"Sage"},
 {"hex":"#4A3F35","name":"Charcoal"}]
```

So: **monochrome tokens + a colourful dress-code swatch list authored as content.** Both statements are true at different layers, and the page's only saturated *chrome* is still the wax seal.

Structural conventions that come with the token system: `hsl(var(--accent-2)/0.3)` for hairlines, `hsl(var(--divider,var(--border-subtle))/var(--divider-opacity,0.4))` for dividers, `bg-surface-2/30 backdrop-blur-sm` for glass cards, and `color-mix(in oklab, hsl(var(--surface-1)), white 6%)` for the cover veil gradient.

---

## 5. Typography — E11, E12

| Aspect | Origin | Local `wed_web` (E17) |
| --- | --- | --- |
| Heading | `'Cormorant Garamond','EB Garamond',Georgia,serif` | `Cormorant Garamond` ✔ |
| Body | **the same** Cormorant Garamond stack | `Jost` ✘ |
| Script sign-off | none | `Great Vibes` ✘ |
| Delivery | self-hosted `@font-face`, 7 × `woff2`, variable `font-weight: 300 700`, normal **and** italic | Google Fonts `<link>` import |
| Other families in the same CSS bundle | Playfair Display, Outfit, Plus Jakarta Sans (used by *other* templates), Caveat/Homemade Apple (scrapbook), Special Elite (brutalist), Poiret One (deco) | — |

So Romantic is a **single-family** template: one serif, used for display *and* body at different sizes/italics. The local two-family (Cormorant + Jost) split is a deliberate divergence, not a fidelity bug — but if the goal is a faithful clone, body copy must switch to Cormorant Garamond.

---

## 6. Motion system — E13, plus the stylesheet keyframe inventory (E3)

The 550 KB stylesheet contains **83 named keyframes** grouped by template. Romantic-relevant families:

**Opening-cover family (prefix `ceremoOpening*`)**

| Keyframe | Definition (verbatim) |
| --- | --- |
| `ceremoOpeningScaleIn` | `0%{opacity:0;transform:scale(.94)} to{opacity:1;transform:none}` |
| `ceremoOpeningSettle` | `0%{opacity:0;transform:translateY(14px)} to{opacity:1;transform:none}` |
| `ceremoOpeningBreathe` | `0%,to{translateY(0)} 50%{translateY(-6px)}` |
| `ceremoOpeningSway` | `0%,to{rotate(-1.4deg)} 50%{rotate(1.6deg)}` |
| `ceremoOpeningShimmer` | `0%{translate(-180%)} 60%,to{translate(320%)}` |
| `ceremoOpeningGlow` | `0%,to{opacity:.3} 50%{opacity:.95}` |
| `ceremoOpeningVeilWave` | `0%,to{translate(0,0) rotate(0)} 25%{translate(-.7%,.15%) rotate(-.28deg)} 50%{translate(.65%,.3%) rotate(.3deg)} 75%{translate(-.3%) rotate(-.16deg)}` |

**Ribbon / wax-seal release family:** `ceremoRibbonBowFade`, `ceremoRibbonBowSlip`, `ceremoRibbonKnotRelease`, `ceremoRibbonLeftLoop`, `ceremoRibbonRightLoop`, `ceremoRibbonLeftTail`, `ceremoRibbonRightTail`, `ceremoRibbonHorizontalSlip`, `ceremoRibbonVerticalSlip` — e.g. `ceremoRibbonLeftLoop: 0%,18%{opacity:1;transform:none} to{opacity:.5;transform:translate(9px,6px) scale(.3)}`. That is a **simulated untying of the ribbon**, loops and tails on separate delays.

**Shared / other-template families in the same bundle:** `ceremo-scroll-reveal`, `ceremo-word-reveal`, `ceremo-hero-*` (rise, bob, glow-drift, panel-drop/slide), `ceremo-regal-*` (ken-burns, shimmer), `ceremo-brutalist-*` (glitch, clip-reveal, marquee, neon-pulse), `ceremo-egg-*` (an easter-egg state machine: bounce/breathe/zzz/heart/petal/note/phase-in/hold/out), plus `kenburns-a..d`, `confetti-fall`, `stamp`, `scrap-develop`.

---

## 7. The opening-cover sequence (the most template-specific behaviour) — E6, E9, E13

Observed markup on the sealed overlay:

```html
<div data-opening-cover="sealed" role="button" tabindex="0"
     aria-label="Open the invitation"
     style="position:fixed;inset:0;z-index:9998;overflow:hidden;
            cursor:pointer;opacity:1;transition:opacity 700ms ease;
            --background:40 33% 98%; … --seal-wax:#C9A227; …">
  <div style="position:absolute;inset:0;container-type:size;
              animation: ceremoOpeningScaleIn .875s cubic-bezier(.25,1,.5,1) both">
    <div style="background:linear-gradient(180deg,
                 color-mix(in oklab, hsl(var(--surface-1)), white 6%),
                 hsl(var(--surface-1)) 55%,
                 color-mix(in oklab, hsl(var(--surface-1)), black 3%));
                transition: opacity 1.125s ease 1.75s">
      <!-- petal veil: mask-image:url("data:image/svg+xml,…viewBox='0 0 160 160'…") -->
```

Reconstructed sequence (**inference** from the inline timings — high confidence):

1. `0 ms` — page arrives with `data-opening-cover="sealed"`, scroll locked, cover at `z-index:9998`.
2. `0 → 875 ms` — card/veil scales `0.94 → 1` on `cubic-bezier(.25,1,.5,1)` (ease-out-quint), opacity `0 → 1`.
3. Ambient loops underneath: petal `ceremoOpeningDrift`, wax seal `Glow` + `Breathe`, ribbon `Sway`.
4. On activate (click / `Enter` / `Space` — it is a `role="button"`): ribbon + seal **release** (`ceremoRibbon*`), veil fades over `1125 ms` after a `1750 ms` delay, then the overlay fades over `700 ms`.
5. The hero beneath is already rendered and animating (`ceremo-hero-stage-rise`), so opening reveals a live page instead of triggering a second load.

Two details worth copying into the Jaspr port:

- **`container-type: size` + `@container ceremo-envelope-card (max-height:175px)`** — the envelope mark hides itself at 175 px and the eyebrow at 140 px, purely in CSS. That is how the card degrades on short viewports with zero JS. Prefer container queries here over media queries.
- **`mask-image` with an inline SVG data-URI** for the petal/vine silhouette, instead of a PNG — no extra request and the mask inherits `--seal-ink-pair`.

---

## 8. Interaction surface — E6, E7, E16

| Surface | Mechanism observed |
| --- | --- |
| Anchor / hash scrolling | dedicated `<HashScrollHandler>` client component + `data-scroll-anchor` on `timeline`, `entourage`, `guestEssentials`, `rsvp`, `extras` |
| Scroll reveal | `ceremo-scroll-reveal` / `ceremo-word-reveal`; the animating class is applied to already-visible content (base state stays visible) |
| RSVP | per-guest radio pair *Joyfully accepts* / *Regretfully declines*, progress readout `0 of 2 complete`, `data-rsvp-state="responding"`, `autoScrollToRsvp`, `initialRsvpData` + `token` (prefilled/edit replies), `rsvpLocked` + `rsvpDeadline` |
| Plus-one | `allowPlusOneDefault`, `plusOneLimit`, `maxGuests`, `allowSkip`, `excludeChildrenFromSeatCount`; copy reads *"You are welcome to bring 1 guest"* |
| Gifts | per-method cards with a copy-to-clipboard affordance (`lucide-copy`) |
| FAQ | accordion via `transition-[max-height,padding-bottom,opacity]` + rotating `lucide-chevron-down` |
| Film | YouTube embed behind a poster; `autoplayOnOpen`, `loop`, `volume`, `playerMode`, `showTrackName`, `ourSong` |
| Seating | `seatFinderUrl` + `seatFinderLabel` deep link, `lockTables`, `enableCouplesTable` |
| Photos | `photoShareUrl` + QR hint ("Scan the QR at your table"), `showUploader`, `galleryVisibleCount`, `hasGallery` |
| Demo-only chrome | `<DemoSampleDock templateId="romantic" coupleNames="Jarn & Zhaira" aboutHref="/templates/romantic">` + "Use this template" CTA — **demo scaffolding, not part of the product template** |

---

## 9. Analytics / third party — E15

GA4 `G-BJ30M2C77Y` (loaded as a low-priority preload), Facebook `fb:app_id 1907644333259622` + `facebook-domain-verification 3f4l97h1e8jymunguthvavt67zrtaa`, JSON-LD `BreadcrumbList`, `og:*`/`twitter:*` cards pointing at `/slides-ui/tpl-romantic.webp`. Payload also carries `pixelId`, `curatedTrackId`, `gaId` fields — **inference:** analytics IDs are per-invitation config, not hard-coded.

---

## 10. Gap analysis — origin vs `wed_web`

| Dimension | Origin | Local repo | Verdict |
| --- | --- | --- | --- |
| Architecture | Next.js App Router + RSC, generic `DocumentTemplateRenderer` over a JSON document, Turbopack, app `6.94.0` | Jaspr static, one hand-composed `Invitation` widget with 17 hard-coded section components | Expected divergence — local is a single-wedding site, not a multi-tenant renderer |
| Palette model | 27 HSL-triplet tokens, warm monochrome, colour only from the `#C9A227` seal | Named gold/sage/rose role tokens, primary `#8a6b40` | **Divergence.** Faithful clone ⇒ collapse primary/foreground to one taupe `#5D544C`-ish, keep surfaces, add seal gold |
| Type | Cormorant Garamond for heading **and** body, self-hosted woff2 | Cormorant Garamond + Jost + Great Vibes via Google Fonts | **Divergence.** Switch body to Cormorant; self-host if LCP matters |
| Section order | 13 blocks; FAQs + Reminders nested inside the Printed-Invitation block; no gallery section | 17 sections; separate `FaqSection`, `RemindersSection`, `GallerySection` | **Divergence** (local is arguably better IA, but not a clone) |
| Nav | Where · The Day · Entourage · Details · RSVP · Your Seat · Photos | Story · Film · Gifts · Where · The Day · Entourage · Attire · RSVP · Photos | Different labels/targets |
| Cover | wax seal + ribbon-release choreography, container queries, `z-index:9998`, 875 ms scale-in, 1750 ms delayed veil | envelope cover with monogram + "Tap to open", CSS reveal | Feature parity, fidelity gap in the ribbon/seal choreography |
| Countdown | days / hours / **mins** (`hideSeconds`) | live countdown incl. seconds | Minor divergence |
| RSVP | per-guest radios + progress counter + token-prefilled reply + deadline lock | per-guest radios + counter | Parity on the visible behaviour |
| Reveal | `ceremo-scroll-reveal` class-based | `data-scroll` + `.in-view` IntersectionObserver, fail-safe visible | Equivalent approach ✔ |
| Icons | `lucide-react` | none / inline | — |

---

## 11. Unknowns and limitations (explicit)

1. **No runtime observation.** Nothing here is a live-browser measurement: exact computed styles, real animation frame timings, viewport-specific breakpoint behaviour, and JS-driven state transitions were **not** executed or observed. All timing claims are read from declared CSS/inline values.
2. **No JS bundle analysis.** The 29 Turbopack chunks were enumerated but not decompiled. Therefore unresolved: the RSVP submit endpoint + payload shape, how `token` in `initialRsvpData` is validated, the seat-finder URL template, image-upload pipeline for guest photos, and the exact `ceremo-egg` easter-egg trigger.
3. **No network capture.** Server Actions/RSC POST endpoints, `/api/*` routes, and third-party calls (GTM, FB pixel) were not captured.
4. **Section ordering authority unclear.** Whether order comes from `document.sections[]` or from a fixed component registry plus visibility flags is not proven — only that `showSection` / `show*` flags exist.
5. **`build-sha: dev`** suggests the deployed artifact is a dev-ish build; chunk hashes and app version may differ from the production release.
6. **Derived hex values** in §4 are arithmetic on HSL triplets; they were not sampled from pixels.

### To close items 1–3 with real REA evidence

```powershell
# 1. register the server for this client (writes client config — review the diff first)
npx.cmd -y rea-agents@6.4.0 doctor --client cline --json
# 2. restart Cline, confirm the REA tools appear
# 3. capture, then analyse offline
#    - browser route: list_browser_targets  → open the URL yourself, drive, capture
#    - capture route: inspect_web_network_capture over a mitmproxy HAR of the page
# 4. keep the JS chunks from %TEMP%\rea-romantic and run
npx.cmd -y rea-agents@6.4.0 analyze-javascript-application "<path to extracted chunks>" --json > rea-js-evidence.json
```

---

## 12. Recommended next steps for `wed_web`

Ordered by fidelity gain per unit of work:

1. **Type**: switch `bodyFont` in `lib/constants/theme.dart` from `Jost` to `Cormorant Garamond`, then re-tune body sizes/line-heights/letter-spacing (a serif body needs `~1.65` line-height and slightly larger size than Jost).
2. **Palette**: in the same file, collapse `primaryColor`/`onSurface`/`inverseSurface` toward one warm taupe (`hsl(30 10% 33%)` ≈ `#5D544C`) and reserve saturation for a single gold accent (`#C9A227`) used only for the wax seal / hairline flourish.
3. **Hairlines**: replace solid borders with `hsl(30 15% 85% / 0.3–0.5)` accent-2 rules plus the `--divider-opacity` pattern, which is what gives the origin its engraved feel.
4. **Cover choreography**: add the ribbon/seal release (staggered `ceremoRibbon*` equivalents) and the `1125 ms @ 1750 ms` veil fade on top of the existing envelope; use a CSS container query for the short-viewport degrade.
5. **Countdown**: drop seconds to match the origin's days/hours/mins grouping.
6. **Nav**: align labels/targets with the origin (`Where · The Day · Entourage · Details · RSVP · Your Seat · Photos`) if a clone is the goal; keep the current fuller nav if the local IA is preferred.
7. Optional: mirror the origin's `sections[]` idea by making `Invitation`'s build list data-driven from `wedding_data.dart` (a `List<SectionSpec>` with `id`/`visible`), so show/hide and reordering stop requiring code edits.

---

## Appendix — raw artifacts kept in this session

Working directory: `%TEMP%\rea-romantic\`

| File | Bytes | Contents |
| --- | --- | --- |
| `page.html` | 240,483 | full SSR response |
| `app.css` | 549,916 | the single global stylesheet (all 83 keyframes, all `@font-face`) |
| `script_0..3, 6..8` | small | bootstrap / flight-continuation / JSON-LD / `$RC` streaming cleanup |
| `script_4.txt`, `script_5.txt` | 38,319 / 26,229 | inline RSC flight payload |
| `flight_4.txt`, `flight_5.txt` | 34,765 / 23,597 | same payload with `\"` unescaped, greppable |

These are public, unauthenticated responses of a publicly linked sample page; no credentials, tokens or private data were extracted.

---

## 13. REA session record + changes applied to `wed_web`

### 13.1 How REA was finally run (replaces §0's blocker for this pass)

The REA MCP server is still not registered with this client, so the **CLI** was used instead, which produces the same canonical Evidence envelopes:

```powershell
npm.cmd install rea-agents@6.4.0 --prefix "$env:TEMP\rea-pkg" --no-audit --no-fund
# a CDP-enabled browser must be running first:
chrome.exe --headless=new --remote-debugging-port=9222 --user-data-dir=<tmp> https://www.useceremo.com/demo/romantic

node rea.mjs list-browser-targets http://127.0.0.1:9222 --format json
node rea.mjs analyze-web-bundle   http://127.0.0.1:9222 <targetId> --observation-ms 1500 --format json
```

| Evidence ID | Predicate | Confidence | What it established |
| --- | --- | --- | --- |
| `ev_3323fe1f29133fc95a7f1f0a4e5f887478d4634d181a842d7388470cea79a9be` | `rea.browser-target-list` | observed | Chrome/140.0.7339.128 over CDP 1.3; one page target `898500A84B798A28D8E7C7D6C887CB7A` at the exact URL/origin |
| `ev_7af86380a78ec5e20fa8005086722b35cc44a774b8168c58765398b64bb60e58` | `rea.web-bundle-analysis` | observed | 39 scripts parsed, 0 parse failures, 572,591 AST nodes, 12 routes, 13 endpoints, completeness `complete` |

The 550 KB stylesheet + RSC flight payload already retained in §Appendix were then used as the byte-exact source for the motion and colour values, since bundle analysis covers JS, not CSS.

### 13.2 Changes landed

| File | Change |
| --- | --- |
| `lib/constants/theme.dart` | Palette replaced with the shipped HSL-triplet set converted to hex: paper `#fcfaf8`, surface-2 `#f7f6f2`, muted `#f2f1ed`, border `#ddd9d5`, muted-fg `#6f6e6c`, ink/taupe `#5d544c`, inverse `#5d544c`. `primaryColor` is now the ink (was gold `#8a6b40`), sage/rose collapsed to neutrals, and new `sealWax #c9a227` + `sealInk #000000` tokens added. Shadows retinted to the new ink. |
| `lib/components/invitation/cover_screen.dart` | Added `coverScaleIn` (875 ms `cubic-bezier(.25,1,.5,1)`, from `ceremoOpeningScaleIn`), `coverBreathe`, `coverGlowDrift` (22 s alternate, from `.hero-glow-drift`), `coverSway`, `coverSettle`, `coverShimmer`, `coverSealRelease`, `coverBowFade`, `coverFadeOut`. Seal is now wax-gold with black ink. Veil fade 850 ms → **1125 ms ease** (origin veil). Short-viewport degrade via `max-height` breakpoints (Jaspr 0.23 has no container-query API). |
| `lib/components/invitation/hero_section.dart` | Hero entrance now mirrors the origin's staged choreography instead of scroll-reveal: `heroRise` (.7 s; names +120 ms), `heroStageRise` (.9 s at 480/600/720 ms for meta, countdown, scroll cue), `heroBob` (9 s `ease-in-out` 1.6 s alternate), `heroGlowPulse` (18 s), `heroKenBurns` (`kenburns-a`, 9 s `ease-out both`). `data-scroll` attributes removed from hero children so the two systems cannot fight over `animation`. |
| `lib/constants/wedding_data.dart` | Dress-code swatch values corrected to the origin's authored `colorPalette` content: `#f7f1ea`, `#e7d9c6`, `#c9a227`, `#7c8a6b`, `#4a3f35`. |
| 8 files (`attire`, `footer`, `hero`, `nav_bar`, `prenup`, `reminders`, `theme`, `cover`) | 20 hardcoded old-palette `rgba()` literals retinted to the new ink/paper/border values. |
| `lib/pages/invitation.dart` | Scroll-reveal travel 32 px → **30 px** (origin `--reveal-travel` default). |

### 13.3 Validation actually performed

| Check | Result |
| --- | --- |
| `dart analyze lib` | `No issues found!` |
| `jaspr build` (static mode) | `Completed building project to /build/jaspr` |
| New keyframes present in emitted CSS | `coverScaleIn`, `coverBreathe`, `coverGlowDrift`, `coverShimmer`, `coverSealRelease`, `coverBowFade`, `coverFadeOut`, `coverSettle`, `heroRise`, `heroStageRise`, `heroBob`, `heroGlowPulse`, `heroKenBurns` — all emitted |
| Old palette purged from emitted CSS | `#8a6b40`, `#c08a86`, `#2c2724`, `#fbf8f3`, `#332e2a`, `#7c8a72`, `#e8d9be`, `#c9ae7e`, `rgba(246,239,230)`, `rgba(24,20,17)`, `rgba(51,46,42)` → **0 occurrences** |
| New values emitted | `#c9a227` ×3, `#5d544c` ×59, `#fcfaf8` ×25, `#ddd9d5` ×11, swatch hexes ×1 each |
| Seal rule as built | `background-color:#c9a227; color:#000000; animation: 3400ms ease-in-out 100 alternate coverBreathe` |

### 13.4 Deliberately not changed

**Typography.** The origin uses Cormorant Garamond for *both* heading and body (E12), while `wed_web` uses Cormorant + Jost + Great Vibes. The requested scope was colours and animation, so fonts were left alone; switching `bodyFont` to Cormorant Garamond is a one-line change in `theme.dart` but it re-flows every section's metrics and deserves its own pass (see §12 step 1).

**Remaining fidelity gaps** (unchanged, from §10): no ribbon DOM in the cover (the release is animated on the seal/card instead of a drawn bow), countdown still shows seconds, and the local nav/section IA is richer than the origin's.



