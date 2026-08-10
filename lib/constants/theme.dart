import 'package:jaspr/dom.dart';

// As your CSS styles are defined using just Dart, you can simply
// use global variables or methods for common things like colors.
const primaryColor = Color('#01589B');

// -----------------------------------------------------------------------
// 🌿 Garden Wedding Theme
//
// Edit the colors and fonts below to restyle the whole invitation site.
// -----------------------------------------------------------------------
const gardenGreen = Color('#5B7A5B');
const gardenGreenDark = Color('#3F5B3F');
const gardenGold = Color('#C9A24B');
const gardenCream = Color('#FBF6EC');
const gardenBlush = Color('#EFD9CE');
const gardenInk = Color('#33362F');

const headingFont = FontFamily('Playfair Display');
const scriptFont = FontFamily('Cormorant Garamond');
const bodyFont = FontFamily('Lato');

// Defines the global CSS styles for this project.
//
// By using the @css annotation, these will be rendered automatically to CSS and included in your page.
@css
List<StyleRule> get styles => [
  // Special import rule to include to another css file.
  css.import('https://fonts.googleapis.com/css?family=Roboto'),
  css.import(
    'https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Cormorant+Garamond:ital,wght@0,400;0,600;1,500&family=Lato:wght@300;400;700&display=swap',
  ),
  // Each style rule takes a valid css selector and a set of styles.
  // Styles are defined using type-safe css bindings and can be freely chained and nested.
  css('html, body').styles(
    width: 100.percent,
    minHeight: 100.vh,
    padding: .zero,
    margin: .zero,
    fontFamily: const .list([FontFamily('Roboto'), FontFamilies.sansSerif]),
  ),
  css('h1').styles(
    margin: .unset,
    fontSize: 4.rem,
  ),
];

