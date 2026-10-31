import 'package:jaspr/dom.dart';

// -----------------------------------------------------------------------
// 🌹 "Romantic" Design Tokens
//
// A warm, editorial *monochrome* palette (paper · warm greys · charcoal-taupe
// ink) with a single saturated accent — the gold wax seal — matching the
// Ceremo *Romantic* invitation template it is modelled on.
// Edit the colors and fonts below to restyle the whole invitation site.
// Every section pulls from these single source tokens.
// -----------------------------------------------------------------------

// -- Color tokens -------------------------------------------------------
// Warm monochrome "paper + ink" palette taken from the shipped Ceremo
// *Romantic* template (HSL triplets read off the live page, converted to hex).
// See `docs/ceremo-romantic-reverse-engineering.md` §4 for the evidence table.
//
//   background/surface-1  40 33% 98%  ·  surface-2  40 25% 96%
//   muted/secondary       40 18% 94%  ·  border     30 10% 85%
//   accent/accent-2       30 15% 85%  ·  muted-fg   30  8% 43%
//   foreground/primary    30 10% 33%  ·  seal-wax   #C9A227
const Color surface = Color('#fcfaf8'); // --background / --surface-1
const Color surfaceContainer = Color('#f7f6f2'); // --surface-2
const Color surfaceContainerLow = Color('#f2f1ed'); // --muted / --secondary
const Color surfaceContainerHigh = Color('#eae7e3'); // derived, one step deeper
const Color onSurface = Color('#5d544c'); // --foreground / --text-heading
const Color onSurfaceVariant = Color('#6f6e6c'); // --muted-foreground
const Color outlineTone = Color('#8a8277'); // mid hairline tone (derived)
const Color outlineVariant = Color('#ddd9d5'); // --border / --border-subtle
const Color inverseSurface = Color('#5d544c'); // --surface-inverse (dark bands)
const Color inverseOnSurface = Color('#fcfaf8'); // --text-inverse

// Primary — in Romantic the accent *is* the ink: `--primary` == `--foreground`.
// The template is monochrome, so buttons and kickers are charcoal-taupe, not gold.
const Color primaryColor = Color('#5d544c');
const Color onPrimary = Color('#fcfaf8'); // --accent-1-text
const Color primaryContainer = Color('#dfd9d3'); // --accent / --accent-2
const Color onPrimaryContainer = Color('#4a443e'); // derived, deeper ink
const Color primaryFixedDim = Color('#dfd9d3'); // --accent-2 on dark bands

// Secondary — warm neutral (`--accent-1`); Romantic ships no sage.
const Color secondaryColor = Color('#6f6e6c');
const Color secondaryContainer = Color('#f2f1ed');
const Color onSecondaryContainer = Color('#5d544c');
const Color secondaryFixedDim = Color('#ddd9d5');

// Tertiary — the single saturated accent in the whole template: the wax seal.
const Color accentColor = Color('#c9a227');
const Color accentContainer = Color('#f2f1ed');
const Color onAccentContainer = Color('#5d544c');

// Wax-seal tokens (`--seal-wax`, `--seal-ink-pair`).
const Color sealWax = Color('#c9a227');
const Color sealInk = Color('#000000');


// Error (kept for completeness / form validation).
const Color errorColor = Color('#a93b3b');

// -- Typography tokens --------------------------------------------------
// High-contrast elegant serif for headlines; clean geometric sans for body.
const headingFont = FontFamily('Cormorant Garamond');
const bodyFont = FontFamily('Jost');

/// Handwritten accent used for sign-offs ("With love,").
const scriptFont = FontFamily('Great Vibes');

/// Low-opacity ambient shadow for floating cards.
BoxShadow get ambientShadow => BoxShadow(
  offsetX: 0.px,
  offsetY: 18.px,
  blur: 50.px,
  color: Color('rgba(93, 84, 76, 0.08)'),
);

/// Tighter shadow used for small chips and buttons.
BoxShadow get softShadow => BoxShadow(
  offsetX: 0.px,
  offsetY: 6.px,
  blur: 20.px,
  color: Color('rgba(93, 84, 76, 0.06)'),
);

// -----------------------------------------------------------------------
// Global CSS
// -----------------------------------------------------------------------

// Defines the global CSS styles for this project.
@css
List<StyleRule> get styles => [
  // Google Fonts: Cormorant Garamond (headlines) + Jost (body) + Great Vibes.
  css.import(
    'https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300..700;1,300..700&family=Great+Vibes&family=Jost:wght@300;400;500;600&display=swap',
  ),
  css('html').styles(
    raw: const {
      'scroll-behavior': 'smooth',
      'scroll-padding-top': '4.5rem',
    },
  ),
  css('html, body').styles(
    width: 100.percent,
    minHeight: 100.vh,
    padding: .zero,
    margin: .zero,
    fontFamily: const .list([bodyFont, FontFamilies.sansSerif]),
    backgroundColor: surface,
    color: onSurface,
  ),
  // Locks the page while the cover screen is open (removed by JS).
  css('html.no-scroll, body.no-scroll').styles(
    raw: const {'overflow': 'hidden'},
  ),
  css('h1, h2, h3, h4').styles(
    margin: .unset,
    fontFamily: headingFont,
    fontWeight: .w400,
  ),
  // Predictable sizing for padded/full-width elements.
  css('*, *::before, *::after').styles(
    raw: const {'box-sizing': 'border-box'},
  ),
];
