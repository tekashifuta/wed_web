import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import '../../constants/wedding_data.dart';

/// A short "welcome" quote section shown right after the hero.
class IntroSection extends StatelessComponent {
  const IntroSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'intro', [
      div(classes: 'intro-ornament', [.text('❀')]),
      p(classes: 'intro-quote', [.text(introQuote)]),
      p(classes: 'intro-signature', [.text('— $coupleNames')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.intro', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        padding: .symmetric(vertical: 5.rem, horizontal: 1.5.rem),
        backgroundColor: gardenCream,
        textAlign: .center,
      ),
      css('.intro-ornament').styles(
        margin: .only(bottom: 1.rem),
        color: gardenGold,
        fontSize: 2.rem,
      ),
      css('.intro-quote').styles(
        margin: .zero,
        maxWidth: 640.px,
        fontFamily: scriptFont,
        fontStyle: .italic,
        fontSize: 1.9.rem,
        lineHeight: 1.5.em,
        color: gardenInk,
      ),
      css('.intro-signature').styles(
        margin: .only(top: 1.5.rem),
        fontFamily: bodyFont,
        letterSpacing: 2.px,
        textTransform: .upperCase,
        fontSize: 0.85.rem,
        color: gardenGreenDark,
      ),
    ]),
  ];
}
