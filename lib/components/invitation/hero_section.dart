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
      div(classes: 'hero-overlay', []),
      div(classes: 'hero-content', [
        p(classes: 'hero-kicker', [.text('We are getting married')]),
        h1(classes: 'hero-title', [.text(coupleNames)]),
        div(classes: 'hero-divider', []),
        p(classes: 'hero-date', [.text('$weddingWeekday · $weddingDateLabel')]),
        p(classes: 'hero-tagline', [.text(heroTagline)]),
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
        minHeight: 100.vh,
        alignItems: .center,
        justifyContent: .center,
        backgroundImage: ImageStyle.url(heroImageUrl),
        backgroundSize: .cover,
        backgroundPosition: BackgroundPosition.center,
        overflow: .clip,
      ),
    ]),
    css('.hero-overlay').styles(
      position: .absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      backgroundColor: const Color('rgba(30, 40, 25, 0.45)'),
    ),
    css('.hero-content', [
      css('&').styles(
        position: .relative(),
        zIndex: const ZIndex(1),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        maxWidth: 720.px,
        padding: .symmetric(horizontal: 2.rem),
        textAlign: .center,
        color: Colors.white,
      ),
      css('.hero-kicker').styles(
        margin: .only(bottom: 1.rem),
        letterSpacing: 3.px,
        textTransform: .upperCase,
        fontFamily: bodyFont,
        fontSize: 0.9.rem,
        fontWeight: .w600,
      ),
      css('.hero-title').styles(
        margin: .zero,
        fontFamily: scriptFont,
        fontSize: 6.rem,
        fontWeight: .w600,
        lineHeight: 1.1.em,
      ),
      css('.hero-divider').styles(
        margin: .symmetric(vertical: 1.5.rem),
        width: 80.px,
        height: 2.px,
        backgroundColor: gardenGold,
      ),
      css('.hero-date').styles(
        margin: .only(bottom: 1.rem),
        fontFamily: headingFont,
        fontSize: 1.4.rem,
        letterSpacing: 1.px,
      ),
      css('.hero-tagline').styles(
        margin: .zero,
        maxWidth: 520.px,
        fontFamily: bodyFont,
        fontSize: 1.1.rem,
        lineHeight: 1.6.em,
        opacity: 0.9,
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: 700.px), [
      css('.hero-title').styles(fontSize: 3.5.rem),
      css('.hero-date').styles(fontSize: 1.1.rem),
      css('.hero-tagline').styles(fontSize: 1.rem),
    ]),
  ];
}
