import 'package:jaspr/dom.dart';

// -----------------------------------------------------------------------
// 🌿 "Garden Ethereal" Design Tokens
//
// Recreated from DESIGN.md. Edit the colors and fonts below to restyle the
// whole invitation site. Every section pulls from these single source tokens.
// -----------------------------------------------------------------------

// -- Color tokens -------------------------------------------------------
// Warm "paper" surface + warm charcoal ink (Neutral).
const Color surface = Color('#fff8f6'); // primary page background
const Color surfaceContainer = Color('#f8ebe7'); // subtle tonal layer
const Color surfaceContainerLow = Color('#fef1ec');
const Color surfaceContainerHigh = Color('#f3e5e1');
const Color onSurface = Color('#201a18'); // warm charcoal text
const Color onSurfaceVariant = Color('#434842');
const Color outlineTone = Color('#737971');
const Color outlineVariant = Color('#c3c8bf');
const Color inverseSurface = Color('#362f2c'); // dark footer band
const Color inverseOnSurface = Color('#fbeee9');

// Primary — Sage Green (the "garden" element).
const Color primaryColor = Color('#4d644e');
const Color onPrimary = Color('#ffffff');
const Color primaryContainer = Color('#8fa88e');
const Color onPrimaryContainer = Color('#273d29');
const Color primaryFixedDim = Color('#b4cdb2'); // light sage for botanical accents

// Secondary — Blush (celebratory highlights).
const Color secondaryColor = Color('#6f5959');
const Color secondaryContainer = Color('#f6d9d9');
const Color onSecondaryContainer = Color('#735d5e');
const Color secondaryFixedDim = Color('#dcc0c0');

// Error (kept for completeness / form validation).
const Color errorColor = Color('#ba1a1a');

// -- Typography tokens --------------------------------------------------
// High-contrast serif for headlines; clean modern sans for body + labels.
const headingFont = FontFamily('Playfair Display');
const bodyFont = FontFamily('Manrope');

/// Low-opacity ambient shadow for floating elements (nav, cards on tinted
/// bands). Extremely diffused, Neutral at ~8% (Design.md elevation guide).
BoxShadow get ambientShadow => BoxShadow(
  offsetX: 0.px,
  offsetY: 12.px,
  blur: 40.px,
  color: Color('rgba(32, 26, 24, 0.08)'),
);

// -----------------------------------------------------------------------
// Global CSS
// -----------------------------------------------------------------------

// Defines the global CSS styles for this project.
@css
List<StyleRule> get styles => [
  // Google Fonts: Playfair Display (headlines) + Manrope (body/labels).
  css.import(
    'https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap',
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
  css('h1, h2, h3, h4').styles(
    margin: .unset,
    fontFamily: headingFont,
    fontWeight: .w400,
  ),
];

