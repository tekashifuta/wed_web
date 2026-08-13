import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// The full-bleed hero section at the top of the invitation page.
///
/// Edit the couple's names, date and tagline in `lib/constants/wedding_data.dart`.
/// Edit colors/fonts in `lib/constants/theme.dart`.
class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'hero', [
      div(classes: 'hero-bg', []),
      div(classes: 'hero-overlay', []),
      div(classes: 'hero-content', [
        p(classes: 'hero-kicker', [.text(heroKicker)]),
        h1(classes: 'hero-title', [
          span([.text(brideName)]),
          br(),
          span(classes: 'hero-amp', [.text('&')]),
          br(),
          span([.text(groomName)]),
        ]),
        div(classes: 'hero-dash', []),
        p(classes: 'hero-date', [.text(weddingDateFull)]),
        p(classes: 'hero-venue', [
          .text(venueName),
          br(),
          .text(venueAddress1),
          br(),
          .text(venueAddress2),
        ]),
        div(classes: 'hero-florist', [.text('❀')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero', [
      css('&').styles(
        position: .relative(),
        display: .flex,
        width: 100.percent,
        minHeight: 92.vh,
        alignItems: .center,
        justifyContent: .center,
        overflow: .clip,
        padding: .only(top: 5.rem), // clear the fixed nav
      ),
    ]),
    // Background photograph (wedding gazebo), softly washed out.
    css('.hero-bg').styles(
      position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      backgroundImage: ImageStyle.url(heroImageUrl),
      backgroundSize: .cover,
      backgroundPosition: BackgroundPosition.center,
      opacity: 0.55,
    ),
    // Cream gradient overlay so the text stays legible on a light hero.
    css('.hero-overlay').styles(
      position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      raw: const {
        'background':
            'linear-gradient(to bottom, rgba(255,248,246,0.45) 0%, rgba(255,248,246,0.65) 55%, #fff8f6 100%)',
      },
    ),
    css('.hero-content', [
      css('&').styles(
        position: .relative(),
        zIndex: const ZIndex(1),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        maxWidth: 780.px,
        padding: .only(bottom: 4.rem),
        textAlign: .center,
        color: onSurface,
      ),
      css('.hero-kicker').styles(
        margin: .only(bottom: 1.5.rem),
        letterSpacing: 5.px,
        textTransform: .upperCase,
        fontFamily: bodyFont,
        fontSize: 0.85.rem,
        fontWeight: .w600,
        color: primaryColor,
        opacity: 0.8,
      ),
      css('.hero-title').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontSize: 5.5.rem,
        fontWeight: .w400,
        lineHeight: 1.12.em,
        color: onSurface,
      ),
      css('.hero-amp').styles(
        fontStyle: .italic,
        fontSize: 0.85.em,
        color: primaryColor,
        opacity: 0.7,
        padding: .symmetric(horizontal: 0.4.em),
      ),
      css('.hero-dash').styles(
        margin: .symmetric(vertical: 2.25.rem),
        width: 1.px,
        height: 4.rem,
        backgroundColor: Color('rgba(77, 100, 78, 0.3)'),
      ),
      css('.hero-date').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontSize: 1.75.rem,
        letterSpacing: 1.px,
        color: onSurface,
      ),
      css('.hero-venue').styles(
        margin: .only(top: 1.15.rem),
        maxWidth: 560.px,
        fontFamily: bodyFont,
        fontSize: 1.05.rem,
        lineHeight: 1.75.em,
        color: onSurfaceVariant,
      ),
      css('.hero-florist').styles(
        margin: .only(top: 3.25.rem),
        fontSize: 2.2.rem,
        color: primaryColor,
        opacity: 0.4,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.hero').styles(minHeight: 88.vh),
      css('.hero-title').styles(fontSize: 3.4.rem),
      css('.hero-date').styles(fontSize: 1.35.rem),
      css('.hero-venue').styles(fontSize: 0.98.rem),
      css('.hero-dash').styles(margin: .symmetric(vertical: 1.75.rem)),
    ]),
  ];
}
