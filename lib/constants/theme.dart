import 'package:jaspr/dom.dart';

// -----------------------------------------------------------------------
// 🌹 "Romantic" Design Tokens
//
// A warm, editorial palette (paper · champagne · antique gold · sage ·
// charcoal) inspired by the Ceremo *Romantic* invitation template.
// Edit the colors and fonts below to restyle the whole invitation site.
// Every section pulls from these single source tokens.
// -----------------------------------------------------------------------

// -- Color tokens -------------------------------------------------------
// Warm "paper" surface + charcoal ink.
const Color surface = Color('#fbf8f3'); // primary page background
const Color surfaceContainer = Color('#f4ede3'); // subtle tonal layer
const Color surfaceContainerLow = Color('#f7f2ea');
const Color surfaceContainerHigh = Color('#ede4d8');
const Color onSurface = Color('#332e2a'); // charcoal text
const Color onSurfaceVariant = Color('#6e665c');
const Color outlineTone = Color('#8d857a');
const Color outlineVariant = Color('#ded5c7');
const Color inverseSurface = Color('#2c2724'); // dark bands
const Color inverseOnSurface = Color('#f6efe6');

// Primary — Antique gold (the romantic metallic accent).
const Color primaryColor = Color('#8a6b40');
const Color onPrimary = Color('#ffffff');
const Color primaryContainer = Color('#e8d9be'); // champagne
const Color onPrimaryContainer = Color('#4a3a20');
const Color primaryFixedDim = Color('#c9ae7e');

// Secondary — Sage (the "garden" element).
const Color secondaryColor = Color('#7c8a72');
const Color secondaryContainer = Color('#e4e8dc');
const Color onSecondaryContainer = Color('#3e4638');
const Color secondaryFixedDim = Color('#b9c3af');

// Tertiary — Soft rose (romantic highlights).
const Color accentColor = Color('#c08a86');
const Color accentContainer = Color('#f6e3e1');
const Color onAccentContainer = Color('#5c3a38');

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
  color: Color('rgba(51, 46, 42, 0.08)'),
);

/// Tighter shadow used for small chips and buttons.
BoxShadow get softShadow => BoxShadow(
  offsetX: 0.px,
  offsetY: 6.px,
  blur: 20.px,
  color: Color('rgba(51, 46, 42, 0.06)'),
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
